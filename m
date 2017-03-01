From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 1/4] platform/x86: fujitsu-laptop: register backlight device in a separate function
Date: Wed,  1 Mar 2017 09:10:41 +0100
Message-ID: <20170301081044.12141-2-kernel@kempniu.pl>
References: <20170301081044.12141-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170301081044.12141-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

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
index e12cc3504d48..185c929898d9 100644
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
+	bd = backlight_device_register(KBUILD_MODNAME, NULL, NULL,
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
