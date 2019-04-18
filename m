From: Chris Chiu <chiu@endlessm.com>
Subject: [PATCH] platform/x86: asus-wmi: Add fn-lock mode switch support
Date: Thu, 18 Apr 2019 14:46:48 +0800
Message-ID: <20190418064648.25706-1-chiu@endlessm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com, corentin.chary@gmail.com, dvhart@infradead.org
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com, Chris Chiu <chiu@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

Some of latest ASUS laptops support new fn-lock mode switching.
This commit detect whether if the fn-lock option is enabled in
BIOS setting, and toggle the fn-lock mode via a new WMI DEVID
0x00100023 when the corresponding notify code captured.

The ASUS fn-lock mode switch is activated by pressing Fn+Esc.
When on, keys F1 to F12 behave as applicable, with meanings
defined by the application being used at the time. When off,
F1 to F12 directly triggers hardware features, well known audio
volume up/down, brightness up/down...etc, which were triggered
by holding down Fn key and F-keys.

Because there's no way to retrieve the fn-lock mode via existing
WMI methods per ASUS spec, driver need to initialize and keep the
fn-lock mode by itself.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c            | 36 ++++++++++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 37b5de541270..5f52b66e40cb 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -69,6 +69,7 @@ MODULE_LICENSE("GPL");
 #define NOTIFY_KBD_BRTUP		0xc4
 #define NOTIFY_KBD_BRTDWN		0xc5
 #define NOTIFY_KBD_BRTTOGGLE		0xc7
+#define NOTIFY_FNLOCK_TOGGLE		0x4e
 
 #define ASUS_FAN_DESC			"cpu_fan"
 #define ASUS_FAN_MFUN			0x13
@@ -177,6 +178,8 @@ struct asus_wmi {
 	struct workqueue_struct *hotplug_workqueue;
 	struct work_struct hotplug_work;
 
+	bool fnlock_locked;
+
 	struct asus_wmi_debug debug;
 
 	struct asus_wmi_driver *driver;
@@ -1619,6 +1622,24 @@ static int is_display_toggle(int code)
 	return 0;
 }
 
+static bool asus_wmi_has_fnlock_key(struct asus_wmi *asus)
+{
+#define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
+	u32 result;
+
+	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FNLOCK, &result);
+
+	return (result & ASUS_WMI_DSTS_PRESENCE_BIT) &&
+		!(result & ASUS_WMI_FNLOCK_BIOS_DISABLED);
+}
+
+static void asus_wmi_fnlock_update(struct asus_wmi *asus)
+{
+	int mode = asus->fnlock_locked;
+
+	asus_wmi_set_devstate(ASUS_WMI_DEVID_FNLOCK, mode, NULL);
+}
+
 static void asus_wmi_notify(u32 value, void *context)
 {
 	struct asus_wmi *asus = context;
@@ -1680,6 +1701,12 @@ static void asus_wmi_notify(u32 value, void *context)
 		goto exit;
 	}
 
+	if (code == NOTIFY_FNLOCK_TOGGLE) {
+		asus->fnlock_locked = !asus->fnlock_locked;
+		asus_wmi_fnlock_update(asus);
+		goto exit;
+	}
+
 	if (is_display_toggle(code) &&
 	    asus->driver->quirks->no_display_toggle)
 		goto exit;
@@ -2134,6 +2161,11 @@ static int asus_wmi_add(struct platform_device *pdev)
 	} else
 		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL);
 
+	if (asus_wmi_has_fnlock_key(asus)) {
+		asus->fnlock_locked = true;
+		asus_wmi_fnlock_update(asus);
+	}
+
 	status = wmi_install_notify_handler(asus->driver->event_guid,
 					    asus_wmi_notify, asus);
 	if (ACPI_FAILURE(status)) {
@@ -2213,6 +2245,8 @@ static int asus_hotk_resume(struct device *device)
 	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
 		kbd_led_update(asus);
 
+	if (asus_wmi_has_fnlock_key(asus))
+		asus_wmi_fnlock_update(asus);
 	return 0;
 }
 
@@ -2249,6 +2283,8 @@ static int asus_hotk_restore(struct device *device)
 	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
 		kbd_led_update(asus);
 
+	if (asus_wmi_has_fnlock_key(asus))
+		asus_wmi_fnlock_update(asus);
 	return 0;
 }
 
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 53dfc2541960..bfba245636a7 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -67,6 +67,7 @@
 /* Input */
 #define ASUS_WMI_DEVID_TOUCHPAD		0x00100011
 #define ASUS_WMI_DEVID_TOUCHPAD_LED	0x00100012
+#define ASUS_WMI_DEVID_FNLOCK		0x00100023
 
 /* Fan, Thermal */
 #define ASUS_WMI_DEVID_THERMAL_CTRL	0x00110011
-- 
2.11.0
