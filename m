From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] msi-laptop: use pr_<level> for messages
Date: Thu, 10 Mar 2011 19:02:34 +0800
Message-ID: <1299754954-27787-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:34551 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750904Ab1CJLEg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Mar 2011 06:04:36 -0500
Received: by gwaa18 with SMTP id a18so366271gwa.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2011 03:04:36 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>

msi-laptop: use pr_<level> for messages

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/msi-laptop.c |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 028d2c6..77a6c3b 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -445,8 +445,7 @@ static struct platform_device *msipf_device;
 
 static int dmi_check_cb(const struct dmi_system_id *id)
 {
-	printk(KERN_INFO "msi-laptop: Identified laptop model '%s'.\n",
-	       id->ident);
+	pr_info("msi-laptop: Identified laptop model '%s'.\n", id->ident);
 	return 1;
 }
 
@@ -834,8 +833,7 @@ static int load_scm_model_init(struct platform_device *sdev)
 
 	result = i8042_install_filter(msi_laptop_i8042_filter);
 	if (result) {
-		printk(KERN_ERR
-			"msi-laptop: Unable to install key filter\n");
+		pr_err("msi-laptop: Unable to install key filter\n");
 		goto fail_filter;
 	}
 
@@ -875,7 +873,7 @@ static int __init msi_init(void)
 	/* Register backlight stuff */
 
 	if (acpi_video_backlight_support()) {
-		printk(KERN_INFO "MSI: Brightness ignored, must be controlled "
+		pr_info("MSI: Brightness ignored, must be controlled "
 		       "by ACPI video driver\n");
 	} else {
 		struct backlight_properties props;
@@ -929,7 +927,8 @@ static int __init msi_init(void)
 	if (auto_brightness != 2)
 		set_auto_brightness(auto_brightness);
 
-	printk(KERN_INFO "msi-laptop: driver "MSI_DRIVER_VERSION" successfully loaded.\n");
+	pr_info("msi-laptop: driver "MSI_DRIVER_VERSION
+		" successfully loaded.\n");
 
 	return 0;
 
@@ -977,7 +976,7 @@ static void __exit msi_cleanup(void)
 	if (auto_brightness != 2)
 		set_auto_brightness(1);
 
-	printk(KERN_INFO "msi-laptop: driver unloaded.\n");
+	pr_info("msi-laptop: driver unloaded.\n");
 }
 
 module_init(msi_init);
-- 
1.6.0.2
