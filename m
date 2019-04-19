From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v3 05/11] platform/x86: asus-wmi: Support WMI event queue
Date: Fri, 19 Apr 2019 12:10:32 +0200
Message-ID: <22dc9bfe-af2f-7ea9-e5bc-95647d5411a8@gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Event codes are expected to be retrieved from a queue on at least some
models. Specifically, very likely the ACPI WMI devices with _UID ATK are
queued whereas those with ASUSWMI are not [1].

The WMI event codes are pushed into a circular buffer queue. After the INIT
method is called, ACPI code is allowed to push events into this buffer.
The INIT method cannot be reverted. If the module is unloaded and an event
(such as hotkey press) gets emitted before inserting it back the events get
processed delayed by one or if the queue overflows, additionally delayed by
about 3 seconds.

It might be considered a minor issue and no normal user would likely
observe this (there is little reason unloading the driver), but it does
significantly frustrate a developer who is unlucky enough to encounter
this. Therefore, the fallback to unqueued behavior occurs whenever
something unexpected happens.

The fix flushes the old key codes out of the queue on load. After receiving
event the queue is read until either ..FFFF or 1 is encountered. Also as
noted in [1] it is checked whether notify code is equal to 0xFF before
enabling queue processing in WMI notify handler.

DSDT examples:

FX505GM
Device (ATKD)
{ ..
    Name (ATKQ, Package (0x10)
    {
        0xFFFFFFFF, ..
    }

    Method (IANQ, 1, Serialized)
    {
        If ((AQNO >= 0x10))
        {
            Local0 = 0x64
            While ((Local0 && (AQNO >= 0x10)))
            {
                Local0--
                Sleep (0x0A)
            }
            ...
        ..
        AQTI++
        AQTI &= 0x0F
        ATKQ [AQTI] = Arg0
        ...
    }

    Method (GANQ, 0, Serialized)
    {
        ..
        If (AQNO)
        {
            ...
            Local0 = DerefOf (ATKQ [AQHI])
            AQHI++
            AQHI &= 0x0F
            Return (Local0)
        }

        Return (One)
    }

This code is almost identical to K54C, which does return Ones on empty
queue.

K54C:
Method (GANQ, 0, Serialized)
{
    If (AQNO)
    {
        ...
        Return (Local0)
    }

    Return (Ones)
}

[1] https://lkml.org/lkml/2019/4/12/104

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Suggested-by: Daniel Drake <drake@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c | 136 +++++++++++++++++++++++++-------
 1 file changed, 108 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 266d0eda5476..f782dac4cbe7 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -81,6 +81,13 @@ MODULE_LICENSE("GPL");
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
 
 #define ASUS_ACPI_UID_ASUSWMI		"ASUSWMI"
+#define ASUS_ACPI_UID_ATK		"ATK"
+
+#define WMI_EVENT_QUEUE_SIZE		0x10
+#define WMI_EVENT_QUEUE_END		0x1
+#define WMI_EVENT_MASK			0xFFFF
+/* The WMI hotkey event value is always the same. */
+#define WMI_EVENT_VALUE_ATK		0xFF
 
 static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
 
@@ -145,6 +152,7 @@ struct asus_wmi {
 	int dsts_id;
 	int spec;
 	int sfun;
+	bool wmi_event_queue;
 
 	struct input_dev *inputdev;
 	struct backlight_device *backlight_device;
@@ -1629,77 +1637,129 @@ static int is_display_toggle(int code)
 	return 0;
 }
 
-static void asus_wmi_notify(u32 value, void *context)
+static int asus_wmi_get_next_event(u32 value)
 {
-	struct asus_wmi *asus = context;
-	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
 	acpi_status status;
-	int code;
-	int orig_code;
-	unsigned int key_value = 1;
-	bool autorelease = 1;
+	int code = -EIO;
 
-	status = wmi_get_event_data(value, &response);
-	if (status != AE_OK) {
-		pr_err("bad event status 0x%x\n", status);
-		return;
+	status = wmi_get_event_data(value, &output);
+	if (ACPI_FAILURE(status)) {
+		pr_warn("Failed to get WMI event code: %s\n",
+				acpi_format_exception(status));
+		return code;
 	}
 
-	obj = (union acpi_object *)response.pointer;
+	obj = (union acpi_object *)output.pointer;
 
-	if (!obj || obj->type != ACPI_TYPE_INTEGER)
-		goto exit;
+	if (obj && obj->type == ACPI_TYPE_INTEGER)
+		code = (int)(obj->integer.value & WMI_EVENT_MASK);
+
+	kfree(obj);
+	return code;
+}
+
+static void asus_wmi_handle_notify_code(int code, struct asus_wmi *asus)
+{
+	int orig_code;
+	unsigned int key_value = 1;
+	bool autorelease = 1;
 
-	code = obj->integer.value;
 	orig_code = code;
 
 	if (asus->driver->key_filter) {
 		asus->driver->key_filter(asus->driver, &code, &key_value,
 					 &autorelease);
 		if (code == ASUS_WMI_KEY_IGNORE)
-			goto exit;
+			return;
 	}
 
 	if (code >= NOTIFY_BRNUP_MIN && code <= NOTIFY_BRNUP_MAX)
 		code = ASUS_WMI_BRN_UP;
-	else if (code >= NOTIFY_BRNDOWN_MIN &&
-		 code <= NOTIFY_BRNDOWN_MAX)
+	else if (code >= NOTIFY_BRNDOWN_MIN && code <= NOTIFY_BRNDOWN_MAX)
 		code = ASUS_WMI_BRN_DOWN;
 
 	if (code == ASUS_WMI_BRN_DOWN || code == ASUS_WMI_BRN_UP) {
 		if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
 			asus_wmi_backlight_notify(asus, orig_code);
-			goto exit;
+			return;
 		}
 	}
 
 	if (code == NOTIFY_KBD_BRTUP) {
 		kbd_led_set_by_kbd(asus, asus->kbd_led_wk + 1);
-		goto exit;
+		return;
 	}
 	if (code == NOTIFY_KBD_BRTDWN) {
 		kbd_led_set_by_kbd(asus, asus->kbd_led_wk - 1);
-		goto exit;
+		return;
 	}
 	if (code == NOTIFY_KBD_BRTTOGGLE) {
 		if (asus->kbd_led_wk == asus->kbd_led.max_brightness)
 			kbd_led_set_by_kbd(asus, 0);
 		else
 			kbd_led_set_by_kbd(asus, asus->kbd_led_wk + 1);
-		goto exit;
+		return;
 	}
 
-	if (is_display_toggle(code) &&
-	    asus->driver->quirks->no_display_toggle)
-		goto exit;
+	if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
+		return;
 
 	if (!sparse_keymap_report_event(asus->inputdev, code,
 					key_value, autorelease))
 		pr_info("Unknown key %x pressed\n", code);
+}
 
-exit:
-	kfree(obj);
+static void asus_wmi_notify(u32 value, void *context)
+{
+	struct asus_wmi *asus = context;
+	int code;
+	int i;
+
+	for (i = 0; i < WMI_EVENT_QUEUE_SIZE + 1; i++) {
+		code = asus_wmi_get_next_event(value);
+
+		if (code < 0) {
+			pr_warn("Failed to get event code: 0x%x\n", code);
+			return;
+		}
+
+		if (code == WMI_EVENT_QUEUE_END || code == WMI_EVENT_MASK)
+			return;
+
+		asus_wmi_handle_notify_code(code, asus);
+
+		/*
+		 * Double check that queue is present:
+		 * ATK (with queue) uses 0xff, ASUSWMI (without) 0xd2.
+		 */
+		if (!asus->wmi_event_queue || value != WMI_EVENT_VALUE_ATK)
+			return;
+	}
+
+	pr_warn("Failed to process event queue, last code: 0x%x\n", code);
+}
+
+static int asus_wmi_notify_queue_flush(struct asus_wmi *asus)
+{
+	int code;
+	int i;
+
+	for (i = 0; i < WMI_EVENT_QUEUE_SIZE + 1; i++) {
+		code = asus_wmi_get_next_event(WMI_EVENT_VALUE_ATK);
+
+		if (code < 0) {
+			pr_warn("Failed to get event during flush: %d\n", code);
+			return code;
+		}
+
+		if (code == WMI_EVENT_QUEUE_END || code == WMI_EVENT_MASK)
+			return 0;
+	}
+
+	pr_warn("Failed to flush event queue\n");
+	return -EIO;
 }
 
 /*
@@ -1850,6 +1910,7 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 {
 	int rv;
 	char *wmi_uid;
+	int err;
 
 	/* INIT enable hotkeys on some models */
 	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_INIT, 0, 0, &rv))
@@ -1897,6 +1958,24 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 		asus->dsts_id = ASUS_WMI_METHODID_DSTS2;
 	}
 
+	/*
+	 * Some devices can have multiple event codes stored in a queue before
+	 * the module load if it was unloaded intermittently after calling
+	 * the INIT method (enables event handling). The WMI notify handler is
+	 * expected to retrieve all event codes until a retrieved code equals
+	 * queue end marker (One or Ones). Old codes are flushed from the queue
+	 * upon module load. Not enabling this when it should be has minimal
+	 * visible impact so fall back if anything goes wrong.
+	 */
+	wmi_uid = wmi_get_acpi_device_uid(asus->driver->event_guid);
+	if (wmi_uid && !strcmp(wmi_uid, ASUS_ACPI_UID_ATK)) {
+		pr_info("Detected ATK, enable event queue\n");
+
+		err = asus_wmi_notify_queue_flush(asus);
+		if (!err)
+			asus->wmi_event_queue = true;
+	}
+
 	/* CWAP allow to define the behavior of the Fn+F2 key,
 	 * this method doesn't seems to be present on Eee PCs */
 	if (asus->driver->quirks->wapf >= 0)
@@ -2155,8 +2234,9 @@ static int asus_wmi_add(struct platform_device *pdev)
 		err = asus_wmi_backlight_init(asus);
 		if (err && err != -ENODEV)
 			goto fail_backlight;
-	} else
+	} else {
 		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL);
+	}
 
 	status = wmi_install_notify_handler(asus->driver->event_guid,
 					    asus_wmi_notify, asus);
-- 
2.17.1
