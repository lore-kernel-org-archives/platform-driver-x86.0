From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 02/11] platform/x86: fujitsu-laptop: switch to a managed backlight device
Date: Thu, 30 Mar 2017 12:35:00 +0200
Message-ID: <20170330103509.32509-3-kernel@kempniu.pl>
References: <20170330103509.32509-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:35481 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933652AbdC3KfW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Mar 2017 06:35:22 -0400
Received: by mail-lf0-f67.google.com with SMTP id v2so4166945lfi.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Mar 2017 03:35:21 -0700 (PDT)
In-Reply-To: <20170330103509.32509-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Use a managed backlight device to get rid of acpi_fujitsu_bl_remove().
Change the parent of the backlight device from NULL to the FUJ02B1 ACPI
device as the latter is required for the backlight device to work.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index a428da3b591d..a9520e732c8b 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -565,17 +565,18 @@ static int acpi_fujitsu_bl_input_setup(struct acpi_device *device)
 	return input_register_device(fujitsu_bl->input);
 }
 
-static int fujitsu_backlight_register(void)
+static int fujitsu_backlight_register(struct acpi_device *device)
 {
-	struct backlight_properties props = {
+	const struct backlight_properties props = {
 		.brightness = fujitsu_bl->brightness_level,
 		.max_brightness = fujitsu_bl->max_brightness - 1,
 		.type = BACKLIGHT_PLATFORM
 	};
 	struct backlight_device *bd;
 
-	bd = backlight_device_register("fujitsu-laptop", NULL, NULL,
-				       &fujitsu_bl_ops, &props);
+	bd = devm_backlight_device_register(&device->dev, "fujitsu-laptop",
+					    &device->dev, NULL,
+					    &fujitsu_bl_ops, &props);
 	if (IS_ERR(bd))
 		return PTR_ERR(bd);
 
@@ -644,24 +645,13 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 		fujitsu_bl->max_brightness = FUJITSU_LCD_N_LEVELS;
 	get_lcd_level();
 
-	error = fujitsu_backlight_register();
+	error = fujitsu_backlight_register(device);
 	if (error)
 		return error;
 
 	return 0;
 }
 
-static int acpi_fujitsu_bl_remove(struct acpi_device *device)
-{
-	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
-
-	backlight_device_unregister(fujitsu_bl->bl_device);
-
-	fujitsu_bl->acpi_handle = NULL;
-
-	return 0;
-}
-
 /* Brightness notify */
 
 static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
@@ -1092,7 +1082,6 @@ static struct acpi_driver acpi_fujitsu_bl_driver = {
 	.ids = fujitsu_bl_device_ids,
 	.ops = {
 		.add = acpi_fujitsu_bl_add,
-		.remove = acpi_fujitsu_bl_remove,
 		.notify = acpi_fujitsu_bl_notify,
 		},
 };
-- 
2.12.1
