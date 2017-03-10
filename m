From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v4 1/4] platform/x86: fujitsu-laptop: register backlight device in a separate function
Date: Fri, 10 Mar 2017 11:50:33 +0100
Message-ID: <20170310105036.26899-2-kernel@kempniu.pl>
References: <20170310105036.26899-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:32883 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935047AbdCJKup (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2017 05:50:45 -0500
Received: by mail-lf0-f67.google.com with SMTP id r36so6580194lfi.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2017 02:50:43 -0800 (PST)
In-Reply-To: <20170310105036.26899-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Move code responsible for backlight device registration to a separate
function in order to simplify error handling and decrease indentation.
Simplify initialization of struct backlight_properties.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 38 ++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index e12cc3504d48..5ec596c5053d 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -685,6 +685,25 @@ static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
 
 /* ACPI device for LCD brightness control */
 
+static int fujitsu_backlight_register(void)
+{
+	struct backlight_properties props = {
+		.brightness = fujitsu_bl->brightness_level,
+		.max_brightness = fujitsu_bl->max_brightness - 1,
+		.type = BACKLIGHT_PLATFORM
+	};
+	struct backlight_device *bd;
+
+	bd = backlight_device_register("fujitsu-laptop", NULL, NULL,
+				       &fujitsu_bl_ops, &props);
+	if (IS_ERR(bd))
+		return PTR_ERR(bd);
+
+	fujitsu_bl->bl_device = bd;
+
+	return 0;
+}
+
 static int acpi_fujitsu_bl_add(struct acpi_device *device)
 {
 	int state = 0;
@@ -1192,7 +1211,7 @@ MODULE_DEVICE_TABLE(acpi, fujitsu_ids);
 
 static int __init fujitsu_init(void)
 {
-	int ret, max_brightness;
+	int ret;
 
 	if (acpi_disabled)
 		return -ENODEV;
@@ -1232,22 +1251,9 @@ static int __init fujitsu_init(void)
 	/* Register backlight stuff */
 
 	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		struct backlight_properties props;
-
-		memset(&props, 0, sizeof(struct backlight_properties));
-		max_brightness = fujitsu_bl->max_brightness;
-		props.type = BACKLIGHT_PLATFORM;
-		props.max_brightness = max_brightness - 1;
-		fujitsu_bl->bl_device = backlight_device_register("fujitsu-laptop",
-								  NULL, NULL,
-								  &fujitsu_bl_ops,
-								  &props);
-		if (IS_ERR(fujitsu_bl->bl_device)) {
-			ret = PTR_ERR(fujitsu_bl->bl_device);
-			fujitsu_bl->bl_device = NULL;
+		ret = fujitsu_backlight_register();
+		if (ret)
 			goto fail_sysfs_group;
-		}
-		fujitsu_bl->bl_device->props.brightness = fujitsu_bl->brightness_level;
 	}
 
 	ret = platform_driver_register(&fujitsu_pf_driver);
-- 
2.12.0
