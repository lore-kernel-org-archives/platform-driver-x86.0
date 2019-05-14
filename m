From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v4 06/13] platform/x86: asus-wmi: Refactor WMI event handling
Date: Tue, 14 May 2019 21:01:24 +0200
Message-ID: <6a62a746-6c0d-e786-1edc-febbfc083a64@gmail.com>
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Refactor WMI event handling into separate functions for getting the event
code and handling the retrieved event code as a preparation for
introduction of WMI event queue support.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 66 +++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 5bdb4ffdbee3..ed7c7857012e 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -85,6 +85,8 @@ MODULE_LICENSE("GPL");
 
 #define ASUS_ACPI_UID_ASUSWMI		"ASUSWMI"
 
+#define WMI_EVENT_MASK			0xFFFF
+
 static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
 
 static bool ashs_present(void)
@@ -1651,83 +1653,99 @@ static void asus_wmi_fnlock_update(struct asus_wmi *asus)
 	asus_wmi_set_devstate(ASUS_WMI_DEVID_FNLOCK, mode, NULL);
 }
 
-static void asus_wmi_notify(u32 value, void *context)
+static int asus_wmi_get_event_code(u32 value)
 {
-	struct asus_wmi *asus = context;
 	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
 	acpi_status status;
 	int code;
-	int orig_code;
-	unsigned int key_value = 1;
-	bool autorelease = 1;
 
 	status = wmi_get_event_data(value, &response);
-	if (status != AE_OK) {
-		pr_err("bad event status 0x%x\n", status);
-		return;
+	if (ACPI_FAILURE(status)) {
+		pr_warn("Failed to get WMI notify code: %s\n",
+				acpi_format_exception(status));
+		return -EIO;
 	}
 
 	obj = (union acpi_object *)response.pointer;
 
-	if (!obj || obj->type != ACPI_TYPE_INTEGER)
-		goto exit;
+	if (obj && obj->type == ACPI_TYPE_INTEGER)
+		code = (int)(obj->integer.value & WMI_EVENT_MASK);
+	else
+		code = -EIO;
+
+	kfree(obj);
+	return code;
+}
+
+static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
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
 
 	if (code == NOTIFY_FNLOCK_TOGGLE) {
 		asus->fnlock_locked = !asus->fnlock_locked;
 		asus_wmi_fnlock_update(asus);
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
+	int code = asus_wmi_get_event_code(value);
+
+	if (code < 0) {
+		pr_warn("Failed to get notify code: %d\n", code);
+		return;
+	}
+
+	asus_wmi_handle_event_code(code, asus);
 }
 
 /*
-- 
2.17.1
