From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH 05/11] platform/x86: asus-wmi: Support queued WMI event codes
Date: Wed, 10 Apr 2019 22:29:30 +0200
Message-ID: <777027ac-921e-ee37-493e-974b49242d18@gmail.com>
References: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Event codes are expected to be polled from a queue on at least some
models.

The WMI event codes are pushed into queue based on circular buffer. After
INIT method is called ACPI code is allowed to push events into this buffer
the INIT method can not be reverted. If the module is unloaded and an
event (such as hotkey press) gets emitted before inserting it back the
events get processed delayed by one or, if the queue overflows,
additionally delayed by about 3 seconds.

Patch was tested on a newer TUF Gaming FX505GM and older K54C model.

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

The fix flushes the old key codes out of the queue on load and after
receiving event the queue is read until either ..FFFF or 1 is encountered.

It might be considered a minor issue and no normal user would likely to
observe this (there is little reason unloading the driver), but it does
significantly frustrate a developer who is unlucky enough to encounter
this.

Introduce functionality for flushing and processing queued codes, which is
enabled via quirk flag for ASUS7000. It might be considered if it is
reasonable to enable it everywhere (might introduce regressions) or always
try to flush the queue on module load and try to detect if this quirk is
present in the future.

This patch limits the effect to the specific hardware defined by ASUS7000
device that is used for driver detection by vendor driver of Fx505. The
fallback is also implemented in case initial flush fails.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c |   1 +
 drivers/platform/x86/asus-wmi.c    | 122 ++++++++++++++++++++++-------
 drivers/platform/x86/asus-wmi.h    |   2 +
 3 files changed, 97 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index cc5f0765a8d9..357d273ed336 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -438,6 +438,7 @@ static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
 
 	if (acpi_dev_found("ASUS7000")) {
 		driver->quirks->force_dsts = true;
+		driver->quirks->wmi_event_queue = true;
 	}
 }
 
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 58890d87d50c..e0a710c64dea 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -80,6 +80,12 @@ MODULE_LICENSE("GPL");
 #define USB_INTEL_XUSB2PR		0xD0
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
 
+#define WMI_EVENT_QUEUE_SIZE		0x10
+#define WMI_EVENT_QUEUE_END		0x1
+#define WMI_EVENT_MASK			0xFFFF
+/* The event value is always the same. */
+#define WMI_EVENT_VALUE			0xFF
+
 static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
 
 static bool ashs_present(void)
@@ -143,6 +149,7 @@ struct asus_wmi {
 	int dsts_id;
 	int spec;
 	int sfun;
+	bool wmi_event_queue;
 
 	struct input_dev *inputdev;
 	struct backlight_device *backlight_device;
@@ -1637,77 +1644,126 @@ static int is_display_toggle(int code)
 	return 0;
 }
 
-static void asus_wmi_notify(u32 value, void *context)
+static int asus_poll_wmi_event(u32 value)
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
+		pr_warn(PR "Failed to get WMI event code: %s\n",
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
+static void asus_wmi_handle_notify(int code, struct asus_wmi *asus)
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
+		code = asus_poll_wmi_event(value);
+
+		if (code < 0) {
+			pr_warn(PR "Failed to get event code: 0x%x\n", code);
+			return;
+		}
+
+		if (code == WMI_EVENT_QUEUE_END || code == WMI_EVENT_MASK)
+			return;
+
+		asus_wmi_handle_notify(code, asus);
+
+		if (!asus->wmi_event_queue)
+			return;
+	}
+
+	pr_warn(PR "Failed to process event queue, last code: 0x%x\n", code);
+}
+
+static int asus_wmi_notify_queue_flush(struct asus_wmi *asus)
+{
+	int code;
+	int i;
+
+	for (i = 0; i < WMI_EVENT_QUEUE_SIZE + 1; i++) {
+		code = asus_poll_wmi_event(WMI_EVENT_VALUE);
+
+		if (code < 0) {
+			pr_warn(PR "Failed to poll event during flush: %d\n",
+					code);
+			return code;
+		}
+
+		if (code == WMI_EVENT_QUEUE_END || code == WMI_EVENT_MASK)
+			return 0;
+	}
+
+	pr_warn(PR "Failed to flush event queue\n");
+	return -EIO;
 }
 
 /*
@@ -2159,8 +2215,18 @@ static int asus_wmi_add(struct platform_device *pdev)
 		err = asus_wmi_backlight_init(asus);
 		if (err && err != -ENODEV)
 			goto fail_backlight;
-	} else
+	} else {
 		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL);
+	}
+
+	/** Try to initialize queue and fallback if it fails. */
+	if (asus->driver->quirks->wmi_event_queue) {
+		err = asus_wmi_notify_queue_flush(asus);
+		if (err)
+			asus->driver->quirks->wmi_event_queue = false;
+		else
+			pr_info(PR "WMI event queue enabled\n");
+	}
 
 	status = wmi_install_notify_handler(asus->driver->event_guid,
 					    asus_wmi_notify, asus);
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 94056da02fde..1248658d6442 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -54,6 +54,8 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+	/* Multiple event codes can be queued in buffer. */
+	bool wmi_event_queue;
 	/**
 	 * Force DSTS instead of DSCS and skip detection. Useful if WMNB
 	 * returns nothing on unknown method call.
-- 
2.17.1
