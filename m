From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 08/10] platform/x86: fujitsu-laptop: only register backlight device if FUJ02B1 is present
Date: Wed,  8 Feb 2017 14:46:31 +0100
Message-ID: <20170208134633.5152-9-kernel@kempniu.pl>
References: <20170208134633.5152-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208134633.5152-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>

As the backlight device registered by fujitsu-laptop relies on the
FUJ02B1 ACPI device being present, only register the backlight device
once that ACPI device is detected.  Drop redundant max_brightness local
variable.  Assign current brightness before registering the backlight
device.  Adjust indentation to make checkpatch happy.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
[kempniu: rebase patch, rewrite commit message]
Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 49 ++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index a5478a011b90..8247abd4658f 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -762,6 +762,23 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 		fujitsu_bl->max_brightness = FUJITSU_LCD_N_LEVELS;
 	get_lcd_level();
 
+	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+		struct backlight_properties props;
+
+		memset(&props, 0, sizeof(struct backlight_properties));
+		props.type = BACKLIGHT_PLATFORM;
+		props.max_brightness = fujitsu_bl->max_brightness - 1;
+		props.brightness = fujitsu_bl->brightness_level;
+		fujitsu_bl->bl_device =
+			backlight_device_register("fujitsu-laptop", NULL, NULL,
+						  &fujitsu_bl_ops, &props);
+		if (IS_ERR(fujitsu_bl->bl_device)) {
+			error = PTR_ERR(fujitsu_bl->bl_device);
+			fujitsu_bl->bl_device = NULL;
+			goto err_unregister_input_dev;
+		}
+	}
+
 	return 0;
 
 err_unregister_input_dev:
@@ -778,6 +795,9 @@ static int acpi_fujitsu_bl_remove(struct acpi_device *device)
 	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
 	struct input_dev *input = fujitsu_bl->input;
 
+	if (fujitsu_bl->bl_device)
+		backlight_device_unregister(fujitsu_bl->bl_device);
+
 	input_unregister_device(input);
 
 	fujitsu_bl->acpi_handle = NULL;
@@ -1192,7 +1212,7 @@ MODULE_DEVICE_TABLE(acpi, fujitsu_ids);
 
 static int __init fujitsu_init(void)
 {
-	int ret, max_brightness;
+	int ret;
 
 	if (acpi_disabled)
 		return -ENODEV;
@@ -1229,30 +1249,9 @@ static int __init fujitsu_init(void)
 	if (ret)
 		goto fail_platform_device2;
 
-	/* Register backlight stuff */
-
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
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
-			goto fail_sysfs_group;
-		}
-		fujitsu_bl->bl_device->props.brightness = fujitsu_bl->brightness_level;
-	}
-
 	ret = platform_driver_register(&fujitsu_pf_driver);
 	if (ret)
-		goto fail_backlight;
+		goto fail_sysfs_group;
 
 	/* Register laptop driver */
 
@@ -1282,8 +1281,6 @@ static int __init fujitsu_init(void)
 	kfree(fujitsu_laptop);
 fail_laptop:
 	platform_driver_unregister(&fujitsu_pf_driver);
-fail_backlight:
-	backlight_device_unregister(fujitsu_bl->bl_device);
 fail_sysfs_group:
 	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
 			   &fujitsu_pf_attribute_group);
@@ -1307,8 +1304,6 @@ static void __exit fujitsu_cleanup(void)
 
 	platform_driver_unregister(&fujitsu_pf_driver);
 
-	backlight_device_unregister(fujitsu_bl->bl_device);
-
 	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
 			   &fujitsu_pf_attribute_group);
 
-- 
2.11.1
