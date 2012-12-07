From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v3 06/12] msi-laptop: Disable brightness control for new EC
Date: Fri,  7 Dec 2012 15:49:16 +0200
Message-ID: <1354888162-12109-7-git-send-email-maxtram95@gmail.com>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62343 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030475Ab2LGNuC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Dec 2012 08:50:02 -0500
Received: by mail-ee0-f46.google.com with SMTP id e53so289080eek.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Dec 2012 05:50:02 -0800 (PST)
In-Reply-To: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

It seems that existing brightness control works only for old EC models.
On newer ones auto_brightness access always timeouts and lcd_level
always shows 0. So disable brightness control for new EC models. It
works fine with ACPI video driver anyway.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/msi-laptop.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 28bcbb2..6b22938 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -546,8 +546,6 @@ static DEVICE_ATTR(turbo_cooldown, 0444, show_turbo_cooldown, NULL);
 static DEVICE_ATTR(auto_fan, 0644, show_auto_fan, store_auto_fan);
 
 static struct attribute *msipf_attributes[] = {
-	&dev_attr_lcd_level.attr,
-	&dev_attr_auto_brightness.attr,
 	&dev_attr_bluetooth.attr,
 	&dev_attr_wlan.attr,
 	&dev_attr_touchpad.attr,
@@ -558,10 +556,20 @@ static struct attribute *msipf_attributes[] = {
 	NULL
 };
 
+static struct attribute *msipf_old_attributes[] = {
+	&dev_attr_lcd_level.attr,
+	&dev_attr_auto_brightness.attr,
+	NULL
+};
+
 static struct attribute_group msipf_attribute_group = {
 	.attrs = msipf_attributes
 };
 
+static struct attribute_group msipf_old_attribute_group = {
+	.attrs = msipf_old_attributes
+};
+
 static struct platform_driver msipf_driver = {
 	.driver = {
 		.name = "msi-laptop-pf",
@@ -1062,7 +1070,7 @@ static int __init msi_init(void)
 
 	/* Register backlight stuff */
 
-	if (acpi_video_backlight_support()) {
+	if (!quirks->old_ec_model || acpi_video_backlight_support()) {
 		pr_info("Brightness ignored, must be controlled by ACPI video driver\n");
 	} else {
 		struct backlight_properties props;
@@ -1108,14 +1116,19 @@ static int __init msi_init(void)
 						&dev_attr_threeg);
 		if (ret)
 			goto fail_platform_device2;
-	}
+	} else {
+		ret = sysfs_create_group(&msipf_device->dev.kobj,
+					 &msipf_old_attribute_group);
+		if (ret)
+			goto fail_platform_device2;
 
-	/* Disable automatic brightness control by default because
-	 * this module was probably loaded to do brightness control in
-	 * software. */
+		/* Disable automatic brightness control by default because
+		 * this module was probably loaded to do brightness control in
+		 * software. */
 
-	if (auto_brightness != 2)
-		set_auto_brightness(auto_brightness);
+		if (auto_brightness != 2)
+			set_auto_brightness(auto_brightness);
+	}
 
 	pr_info("driver " MSI_DRIVER_VERSION " successfully loaded\n");
 
@@ -1163,9 +1176,11 @@ static void __exit msi_cleanup(void)
 	platform_driver_unregister(&msipf_driver);
 	backlight_device_unregister(msibl_device);
 
-	/* Enable automatic brightness control again */
-	if (auto_brightness != 2)
-		set_auto_brightness(1);
+	if (quirks->old_ec_model) {
+		/* Enable automatic brightness control again */
+		if (auto_brightness != 2)
+			set_auto_brightness(1);
+	}
 
 	pr_info("driver unloaded\n");
 }
-- 
1.8.0.1
