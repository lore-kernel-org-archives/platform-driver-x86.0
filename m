From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v9 4/4] platform/x86/dell-*: Call led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Thu, 16 Mar 2017 11:55:35 +0100
Message-ID: <20170316105535.8885-4-hdegoede@redhat.com>
References: <20170316105535.8885-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40446 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751901AbdCPKzs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2017 06:55:48 -0400
In-Reply-To: <20170316105535.8885-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org

Make dell-wmi notify on hotkey kbd brightness changes, listen for this
in dell-laptop and call led_classdev_notify_brightness_hw_changed.

This will allow userspace to monitor (poll) for brightness changes on
these LEDs caused by the hotkey.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Changes in v2:
-Use the new dell_smbios*notify functionality
Changes in v3:
-Simplify the if condition for calling led_notify_brightness_change
Changes in v4:
-Adjust for dell_smbios_*_notifier to dell_laptop_*_notifier rename
Changes in v5:
-Switch to new led-trigger based API for notifying userspace about
 keyboard backlight brightness changes.
Changes in v6:
-Switch to new brightness_hw_changed LED class API
Changes in v8:
-Cache last set brightness value and only call
 led_classdev_notify_brightness_hw_changed if the brightness has changed,
 this is necessary because the WMI events get triggered when we set the
 brightness ourselves too
Changes in v9:
-Only listen to type 0x0010 kbd-led events in dell-wmi.c, these only trigger
 on hotkey presses
-Drop the new / previous brightness comparison from dell-laptop.c now that
 we only get events on hotkey presses it is no longer necessary
---
 drivers/platform/x86/dell-laptop.c | 32 +++++++++++++++++++++++++++++++-
 drivers/platform/x86/dell-wmi.c    |  4 ++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index da185fb..1cd258b 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1984,6 +1984,7 @@ static int kbd_led_level_set(struct led_classdev *led_cdev,
 
 static struct led_classdev kbd_led = {
 	.name           = "dell::kbd_backlight",
+	.flags		= LED_BRIGHT_HW_CHANGED,
 	.brightness_set_blocking = kbd_led_level_set,
 	.brightness_get = kbd_led_level_get,
 	.groups         = kbd_led_groups,
@@ -1991,6 +1992,8 @@ static struct led_classdev kbd_led = {
 
 static int __init kbd_led_init(struct device *dev)
 {
+	int ret;
+
 	kbd_init();
 	if (!kbd_led_present)
 		return -ENODEV;
@@ -2002,7 +2005,11 @@ static int __init kbd_led_init(struct device *dev)
 		if (kbd_led.max_brightness)
 			kbd_led.max_brightness--;
 	}
-	return led_classdev_register(dev, &kbd_led);
+	ret = led_classdev_register(dev, &kbd_led);
+	if (ret)
+		kbd_led_present = false;
+
+	return ret;
 }
 
 static void brightness_set_exit(struct led_classdev *led_cdev,
@@ -2019,6 +2026,26 @@ static void kbd_led_exit(void)
 	led_classdev_unregister(&kbd_led);
 }
 
+static int dell_laptop_notifier_call(struct notifier_block *nb,
+				     unsigned long action, void *data)
+{
+	switch (action) {
+	case DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED:
+		if (!kbd_led_present)
+			break;
+
+		led_classdev_notify_brightness_hw_changed(&kbd_led,
+						kbd_led_level_get(&kbd_led));
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block dell_laptop_notifier = {
+	.notifier_call = dell_laptop_notifier_call,
+};
+
 static int __init dell_init(void)
 {
 	struct calling_interface_buffer *buffer;
@@ -2062,6 +2089,8 @@ static int __init dell_init(void)
 		debugfs_create_file("rfkill", 0444, dell_laptop_dir, NULL,
 				    &dell_debugfs_fops);
 
+	dell_laptop_register_notifier(&dell_laptop_notifier);
+
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		return 0;
 
@@ -2113,6 +2142,7 @@ static int __init dell_init(void)
 
 static void __exit dell_exit(void)
 {
+	dell_laptop_unregister_notifier(&dell_laptop_notifier);
 	debugfs_remove_recursive(dell_laptop_dir);
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_exit();
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 75e6370..751f8c4 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -329,6 +329,10 @@ static void dell_wmi_process_key(int type, int code)
 	if (type == 0x0000 && code == 0xe025 && !wmi_requires_smbios_request)
 		return;
 
+	if (key->keycode == KEY_KBDILLUMTOGGLE)
+		dell_laptop_call_notifier(
+			DELL_LAPTOP_KBD_BACKLIGHT_BRIGHTNESS_CHANGED, NULL);
+
 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
 }
 
-- 
2.9.3
