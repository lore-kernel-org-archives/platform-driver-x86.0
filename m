From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 2/4] platform/x86: fujitsu-laptop: register backlight device in a separate function
Date: Fri, 13 Jan 2017 12:02:38 +0100
Message-ID: <20170113110240.622-3-kernel@kempniu.pl>
References: <20170113110240.622-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36383 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751488AbdAMLCr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2017 06:02:47 -0500
Received: by mail-lf0-f68.google.com with SMTP id h65so5155394lfi.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jan 2017 03:02:46 -0800 (PST)
In-Reply-To: <20170113110240.622-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Move code responsible for backlight device registration to a separate
function in order to simplify error handling and decrease indentation.
Simplify initialization of struct backlight_properties.  Use
KBUILD_MODNAME as device name to avoid repeating the same string literal
throughout the module.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 38 ++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 9f62d9e1b0de..df1cd0a0231d 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -1174,9 +1174,28 @@ static const struct acpi_device_id fujitsu_ids[] __used = {
 };
 MODULE_DEVICE_TABLE(acpi, fujitsu_ids);
 
+static int __init fujitsu_backlight_init(void)
+{
+	struct backlight_properties props = {
+		.brightness = fujitsu->brightness_level,
+		.max_brightness = fujitsu->max_brightness - 1,
+		.type = BACKLIGHT_PLATFORM
+	};
+	struct backlight_device *bd;
+
+	bd = backlight_device_register(KBUILD_MODNAME, NULL, NULL,
+				       &fujitsubl_ops, &props);
+	if (IS_ERR(bd))
+		return PTR_ERR(bd);
+
+	fujitsu->bl_device = bd;
+
+	return 0;
+}
+
 static int __init fujitsu_init(void)
 {
-	int ret, max_brightness;
+	int ret;
 
 	if (acpi_disabled)
 		return -ENODEV;
@@ -1216,22 +1235,9 @@ static int __init fujitsu_init(void)
 	/* Register backlight stuff */
 
 	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		struct backlight_properties props;
-
-		memset(&props, 0, sizeof(struct backlight_properties));
-		max_brightness = fujitsu->max_brightness;
-		props.type = BACKLIGHT_PLATFORM;
-		props.max_brightness = max_brightness - 1;
-		fujitsu->bl_device = backlight_device_register("fujitsu-laptop",
-							       NULL, NULL,
-							       &fujitsubl_ops,
-							       &props);
-		if (IS_ERR(fujitsu->bl_device)) {
-			ret = PTR_ERR(fujitsu->bl_device);
-			fujitsu->bl_device = NULL;
+		ret = fujitsu_backlight_init();
+		if (ret)
 			goto fail_sysfs_group;
-		}
-		fujitsu->bl_device->props.brightness = fujitsu->brightness_level;
 	}
 
 	ret = platform_driver_register(&fujitsupf_driver);
-- 
2.11.0
