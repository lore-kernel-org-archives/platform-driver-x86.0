From: Edward Lin <yidi.lin@canonical.com>
Subject: [PATCH] ideapad-laptop: Use intel_backlight only on Lenovo B470e
Date: Mon, 18 Aug 2014 14:09:13 +0800
Message-ID: <1408342153-16764-1-git-send-email-yidi.lin@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:53356 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750911AbaHRGJ1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Aug 2014 02:09:27 -0400
Received: by mail-pa0-f46.google.com with SMTP id lj1so7079467pab.33
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Aug 2014 23:09:22 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com, matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org
Cc: yk@canonical.com

ACPI video is not functional on Lenovo B470e.
The brightness control is also broken with vendor mode.
The brightness control only works with intel_backlight.

So, blacklist this machine for unregistering ACPI video driver and
not using vendor backlight driver.

Signed-off-by: Edward Lin <yidi.lin@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c |   28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index fc468a3..6ee7c20 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -38,6 +38,7 @@
 #include <linux/i8042.h>
 #include <linux/dmi.h>
 #include <linux/device.h>
+#include <acpi/video.h>
 
 #define IDEAPAD_RFKILL_DEV_NUM	(3)
 
@@ -89,6 +90,7 @@ struct ideapad_private {
 	unsigned long cfg;
 	bool has_hw_rfkill_switch;
 	bool has_touchpad_control;
+	bool has_broken_backlight;
 };
 
 static bool no_bt_rfkill;
@@ -866,6 +868,17 @@ static struct dmi_system_id no_touchpad_ctrl_list[] = {
 	{}
 };
 
+static struct dmi_system_id broken_backlight_list[] = {
+	{
+	 .ident = "Lenovo B470e",
+	 .matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+		DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo B470e"),
+		},
+	},
+	{},
+};
+
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
 	int ret, i;
@@ -890,6 +903,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	priv->platform_device = pdev;
 	priv->has_hw_rfkill_switch = !dmi_check_system(no_hw_rfkill_list);
 	priv->has_touchpad_control = !dmi_check_system(no_touchpad_ctrl_list);
+	priv->has_broken_backlight = dmi_check_system(broken_backlight_list);
 
 	ret = ideapad_sysfs_init(priv);
 	if (ret)
@@ -917,10 +931,18 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	ideapad_sync_rfk_state(priv);
 	ideapad_sync_touchpad_state(priv);
 
+	if (priv->has_broken_backlight)
+		acpi_video_dmi_promote_vendor();
+
 	if (!acpi_video_backlight_support()) {
-		ret = ideapad_backlight_init(priv);
-		if (ret && ret != -ENODEV)
-			goto backlight_failed;
+		pr_info("Disabling ACPI video driver\n");
+		acpi_video_unregister();
+
+		if (!priv->has_broken_backlight) {
+			ret = ideapad_backlight_init(priv);
+			if (ret && ret != -ENODEV)
+				goto backlight_failed;
+		}
 	}
 	ret = acpi_install_notify_handler(adev->handle,
 		ACPI_DEVICE_NOTIFY, ideapad_acpi_notify, priv);
-- 
1.7.9.5
