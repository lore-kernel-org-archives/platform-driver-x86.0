From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 03/10] platform/x86: fujitsu-laptop: make platform-related variables match naming convention
Date: Wed,  8 Feb 2017 14:46:26 +0100
Message-ID: <20170208134633.5152-4-kernel@kempniu.pl>
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

Replace "fujitsupf" with "fujitsu_pf" in all platform-related variable
names to match the module-wide naming convention.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
[kempniu: rebase patch, rewrite commit message]
Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 70124004b346..6cdd1b334e8a 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -607,7 +607,7 @@ static DEVICE_ATTR(lid, 0444, show_lid_state, ignore_store);
 static DEVICE_ATTR(dock, 0444, show_dock_state, ignore_store);
 static DEVICE_ATTR(radios, 0444, show_radios_state, ignore_store);
 
-static struct attribute *fujitsupf_attributes[] = {
+static struct attribute *fujitsu_pf_attributes[] = {
 	&dev_attr_brightness_changed.attr,
 	&dev_attr_max_brightness.attr,
 	&dev_attr_lcd_level.attr,
@@ -617,11 +617,11 @@ static struct attribute *fujitsupf_attributes[] = {
 	NULL
 };
 
-static struct attribute_group fujitsupf_attribute_group = {
-	.attrs = fujitsupf_attributes
+static struct attribute_group fujitsu_pf_attribute_group = {
+	.attrs = fujitsu_pf_attributes
 };
 
-static struct platform_driver fujitsupf_driver = {
+static struct platform_driver fujitsu_pf_driver = {
 	.driver = {
 		   .name = "fujitsu-laptop",
 		   }
@@ -1226,7 +1226,7 @@ static int __init fujitsu_init(void)
 
 	ret =
 	    sysfs_create_group(&fujitsu_bl->pf_device->dev.kobj,
-			       &fujitsupf_attribute_group);
+			       &fujitsu_pf_attribute_group);
 	if (ret)
 		goto fail_platform_device2;
 
@@ -1251,7 +1251,7 @@ static int __init fujitsu_init(void)
 		fujitsu_bl->bl_device->props.brightness = fujitsu_bl->brightness_level;
 	}
 
-	ret = platform_driver_register(&fujitsupf_driver);
+	ret = platform_driver_register(&fujitsu_pf_driver);
 	if (ret)
 		goto fail_backlight;
 
@@ -1284,12 +1284,12 @@ static int __init fujitsu_init(void)
 fail_laptop1:
 	kfree(fujitsu_laptop);
 fail_laptop:
-	platform_driver_unregister(&fujitsupf_driver);
+	platform_driver_unregister(&fujitsu_pf_driver);
 fail_backlight:
 	backlight_device_unregister(fujitsu_bl->bl_device);
 fail_sysfs_group:
 	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
-			   &fujitsupf_attribute_group);
+			   &fujitsu_pf_attribute_group);
 fail_platform_device2:
 	platform_device_del(fujitsu_bl->pf_device);
 fail_platform_device1:
@@ -1308,12 +1308,12 @@ static void __exit fujitsu_cleanup(void)
 
 	kfree(fujitsu_laptop);
 
-	platform_driver_unregister(&fujitsupf_driver);
+	platform_driver_unregister(&fujitsu_pf_driver);
 
 	backlight_device_unregister(fujitsu_bl->bl_device);
 
 	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
-			   &fujitsupf_attribute_group);
+			   &fujitsu_pf_attribute_group);
 
 	platform_device_unregister(fujitsu_bl->pf_device);
 
-- 
2.11.1
