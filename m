From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 3/4] platform/x86: fujitsu-laptop: only register backlight device if FUJ02B1 is present
Date: Wed,  1 Mar 2017 09:10:43 +0100
Message-ID: <20170301081044.12141-4-kernel@kempniu.pl>
References: <20170301081044.12141-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34900 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751062AbdCAIMN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2017 03:12:13 -0500
Received: by mail-lf0-f66.google.com with SMTP id z127so2714119lfa.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2017 00:10:52 -0800 (PST)
In-Reply-To: <20170301081044.12141-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

As the backlight device registered by fujitsu-laptop relies on the
FUJ02B1 ACPI device being present, only register the backlight device
once that ACPI device is detected.

Suggested-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index afcc451e21f6..4fc14fbcfa8a 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -787,6 +787,12 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 		fujitsu_bl->max_brightness = FUJITSU_LCD_N_LEVELS;
 	get_lcd_level();
 
+	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+		error = fujitsu_backlight_register();
+		if (error)
+			goto err_unregister_input_dev;
+	}
+
 	return 0;
 
 err_unregister_input_dev:
@@ -803,6 +809,7 @@ static int acpi_fujitsu_bl_remove(struct acpi_device *device)
 	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
 	struct input_dev *input = fujitsu_bl->input;
 
+	backlight_device_unregister(fujitsu_bl->bl_device);
 	input_unregister_device(input);
 
 	fujitsu_bl->acpi_handle = NULL;
@@ -1254,17 +1261,9 @@ static int __init fujitsu_init(void)
 	if (ret)
 		goto fail_platform_device2;
 
-	/* Register backlight stuff */
-
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		ret = fujitsu_backlight_register();
-		if (ret)
-			goto fail_sysfs_group;
-	}
-
 	ret = platform_driver_register(&fujitsu_pf_driver);
 	if (ret)
-		goto fail_backlight;
+		goto fail_sysfs_group;
 
 	/* Register laptop driver */
 
@@ -1286,8 +1285,6 @@ static int __init fujitsu_init(void)
 	kfree(fujitsu_laptop);
 fail_laptop:
 	platform_driver_unregister(&fujitsu_pf_driver);
-fail_backlight:
-	backlight_device_unregister(fujitsu_bl->bl_device);
 fail_sysfs_group:
 	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
 			   &fujitsu_pf_attribute_group);
@@ -1311,8 +1308,6 @@ static void __exit fujitsu_cleanup(void)
 
 	platform_driver_unregister(&fujitsu_pf_driver);
 
-	backlight_device_unregister(fujitsu_bl->bl_device);
-
 	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
 			   &fujitsu_pf_attribute_group);
 
-- 
2.12.0
