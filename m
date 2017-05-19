From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 2/8] platform/x86: fujitsu-laptop: allocate struct fujitsu_bl in acpi_fujitsu_bl_add()
Date: Fri, 19 May 2017 09:44:42 +0200
Message-ID: <20170519074448.12716-3-kernel@kempniu.pl>
References: <20170519074448.12716-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36511 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751073AbdESHo5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 May 2017 03:44:57 -0400
Received: by mail-wm0-f67.google.com with SMTP id k15so15132463wmh.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 May 2017 00:44:57 -0700 (PDT)
In-Reply-To: <20170519074448.12716-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Only allocate memory for struct fujitsu_bl when the FUJ02B1 ACPI device
is present.  Use devm_kzalloc() for allocating memory to simplify
cleanup.

Due to the fact that the power property of the backlight device created
by the backlight driver is accessed from acpi_fujitsu_laptop_add(),
pointer to the allocated memory will remain stored in a module-wide
variable until the backlight driver is extracted into a separate module.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 024ef339179a..63a9b98967fa 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -392,6 +392,7 @@ static int fujitsu_backlight_register(struct acpi_device *device)
 
 static int acpi_fujitsu_bl_add(struct acpi_device *device)
 {
+	struct fujitsu_bl *priv;
 	int state = 0;
 	int error;
 
@@ -401,10 +402,15 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	if (!device)
 		return -EINVAL;
 
+	priv = devm_kzalloc(&device->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	fujitsu_bl = priv;
 	fujitsu_bl->acpi_handle = device->handle;
 	sprintf(acpi_device_name(device), "%s", ACPI_FUJITSU_BL_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
-	device->driver_data = fujitsu_bl;
+	device->driver_data = priv;
 
 	error = acpi_fujitsu_bl_input_setup(device);
 	if (error)
@@ -837,7 +843,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	pr_info("BTNI: [0x%x]\n", call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0));
 
 	/* Sync backlight power status */
-	if (fujitsu_bl->bl_device &&
+	if (fujitsu_bl && fujitsu_bl->bl_device &&
 	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
 		if (call_fext_func(FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
 			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
@@ -995,13 +1001,9 @@ static int __init fujitsu_init(void)
 	if (acpi_disabled)
 		return -ENODEV;
 
-	fujitsu_bl = kzalloc(sizeof(struct fujitsu_bl), GFP_KERNEL);
-	if (!fujitsu_bl)
-		return -ENOMEM;
-
 	ret = acpi_bus_register_driver(&acpi_fujitsu_bl_driver);
 	if (ret)
-		goto err_free_fujitsu_bl;
+		return ret;
 
 	/* Register platform stuff */
 
@@ -1031,8 +1033,6 @@ static int __init fujitsu_init(void)
 	platform_driver_unregister(&fujitsu_pf_driver);
 err_unregister_acpi:
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
-err_free_fujitsu_bl:
-	kfree(fujitsu_bl);
 
 	return ret;
 }
@@ -1047,8 +1047,6 @@ static void __exit fujitsu_cleanup(void)
 
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
 
-	kfree(fujitsu_bl);
-
 	pr_info("driver unloaded\n");
 }
 
-- 
2.13.0
