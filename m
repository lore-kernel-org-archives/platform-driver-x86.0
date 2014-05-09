From: scott.thrasher@gmail.com
Subject: [PATCH] platform/x86: samsung-laptop: Fix keyboard backlight on Samsung's NP7[34]0U3E models.
Date: Fri,  9 May 2014 12:54:05 -0700
Message-ID: <1399665245-27364-1-git-send-email-scott.thrasher@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:44287 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757390AbaEITyq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 May 2014 15:54:46 -0400
Received: by mail-ob0-f174.google.com with SMTP id uz6so5418586obc.33
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 May 2014 12:54:46 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, Scott Thrasher <scott.thrasher@gmail.com>

From: Scott Thrasher <scott.thrasher@gmail.com>

These models have only 4 levels of keyboard backlight brightness and forget
how to work the backlight after resuming from S3 sleep. I've added a quirk
to set the appropriate number of backlight levels, and one to re-enable the
keyboard backlight on resume.

	Signed-of-by: Scott Thrasher <scott.thrasher@gmail.com>

---
 drivers/platform/x86/samsung-laptop.c | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index d1f03005..37f0106 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -27,6 +27,7 @@
 #include <linux/debugfs.h>
 #include <linux/ctype.h>
 #include <linux/efi.h>
+#include <linux/suspend.h>
 #include <acpi/video.h>
 
 /*
@@ -340,6 +341,8 @@ struct samsung_laptop {
 	struct samsung_laptop_debug debug;
 	struct samsung_quirks *quirks;
 
+	struct notifier_block pm_nb;
+  
 	bool handle_backlight;
 	bool has_stepping_quirk;
 
@@ -348,6 +351,8 @@ struct samsung_laptop {
 
 struct samsung_quirks {
 	bool broken_acpi_video;
+	bool four_kbd_backlight_levels;
+	bool enable_kbd_backlight;
 };
 
 static struct samsung_quirks samsung_unknown = {};
@@ -356,6 +361,11 @@ static struct samsung_quirks samsung_broken_acpi_video = {
 	.broken_acpi_video = true,
 };
 
+static struct samsung_quirks samsung_np740u3e = {
+	.four_kbd_backlight_levels = true,
+	.enable_kbd_backlight = true,
+};
+
 static bool force;
 module_param(force, bool, 0);
 MODULE_PARM_DESC(force,
@@ -1051,6 +1061,8 @@ static int __init samsung_leds_init(struct samsung_laptop *samsung)
 		samsung->kbd_led.brightness_set = kbd_led_set;
 		samsung->kbd_led.brightness_get = kbd_led_get;
 		samsung->kbd_led.max_brightness = 8;
+		if(samsung->quirks->four_kbd_backlight_levels)
+			samsung->kbd_led.max_brightness = 4;
 
 		ret = led_classdev_register(&samsung->platform_device->dev,
 					   &samsung->kbd_led);
@@ -1414,6 +1426,18 @@ static void samsung_platform_exit(struct samsung_laptop *samsung)
 	}
 }
 
+static int samsung_pm_notification(struct notifier_block *nb, unsigned long val,
+		void *ptr) 
+{
+	struct samsung_laptop *samsung;
+	samsung = container_of(nb, struct samsung_laptop, pm_nb);
+	
+	if (val == PM_POST_HIBERNATION && samsung->quirks->enable_kbd_backlight) 
+		kbd_backlight_enable(samsung);
+
+	return 0;
+}
+
 static int __init samsung_platform_init(struct samsung_laptop *samsung)
 {
 	struct platform_device *pdev;
@@ -1534,6 +1558,15 @@ static struct dmi_system_id __initdata samsung_dmi_table[] = {
 		},
 	 .driver_data = &samsung_broken_acpi_video,
 	},
+	{
+	 .callback = samsung_dmi_matched,
+	 .ident = "730U3E/740U3E",
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "730U3E/740U3E"),
+		},
+	 .driver_data = &samsung_np740u3e, 
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);
@@ -1608,6 +1641,9 @@ static int __init samsung_init(void)
 	if (ret)
 		goto error_debugfs;
 
+	samsung->pm_nb.notifier_call = samsung_pm_notification;
+	register_pm_notifier(&samsung->pm_nb);
+
 	samsung_platform_device = samsung->platform_device;
 	return ret;
 
@@ -1633,6 +1669,7 @@ static void __exit samsung_exit(void)
 	struct samsung_laptop *samsung;
 
 	samsung = platform_get_drvdata(samsung_platform_device);
+	unregister_pm_notifier(&samsung->pm_nb);
 
 	samsung_debugfs_exit(samsung);
 	samsung_leds_exit(samsung);
-- 
1.9.1
