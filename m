From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 4/5] platform/x86: fujitsu-laptop: only register platform device if FUJ02E3 is present
Date: Tue, 14 Mar 2017 11:26:30 +0100
Message-ID: <20170314102631.8203-5-kernel@kempniu.pl>
References: <20170314102631.8203-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33626 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751184AbdCNK0o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Mar 2017 06:26:44 -0400
Received: by mail-lf0-f68.google.com with SMTP id r36so13781976lfi.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2017 03:26:42 -0700 (PDT)
In-Reply-To: <20170314102631.8203-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

The platform device registered by fujitsu-laptop is registered
unconditionally while sysfs attributes attached to it depend on the
FUJ02E3 ACPI device being present.  Fix this by moving platform device
creation and removal to acpi_fujitsu_laptop_add() and
acpi_fujitsu_laptop_remove(), respectively.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 421402a19bb9..a2641cb79df9 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -903,6 +903,10 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
 	}
 
+	error = fujitsu_laptop_platform_add();
+	if (error)
+		goto err_unregister_input_dev;
+
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
 		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
@@ -994,6 +998,8 @@ static int acpi_fujitsu_laptop_remove(struct acpi_device *device)
 		led_classdev_unregister(&eco_led);
 #endif
 
+	fujitsu_laptop_platform_remove();
+
 	input_unregister_device(input);
 
 	kfifo_free(&fujitsu_laptop->fifo);
@@ -1180,13 +1186,9 @@ static int __init fujitsu_init(void)
 
 	/* Register platform stuff */
 
-	ret = fujitsu_laptop_platform_add();
-	if (ret)
-		goto err_unregister_acpi;
-
 	ret = platform_driver_register(&fujitsu_pf_driver);
 	if (ret)
-		goto err_remove_platform_device;
+		goto err_unregister_acpi;
 
 	/* Register laptop driver */
 
@@ -1208,8 +1210,6 @@ static int __init fujitsu_init(void)
 	kfree(fujitsu_laptop);
 err_unregister_platform_driver:
 	platform_driver_unregister(&fujitsu_pf_driver);
-err_remove_platform_device:
-	fujitsu_laptop_platform_remove();
 err_unregister_acpi:
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
 err_free_fujitsu_bl:
@@ -1226,8 +1226,6 @@ static void __exit fujitsu_cleanup(void)
 
 	platform_driver_unregister(&fujitsu_pf_driver);
 
-	fujitsu_laptop_platform_remove();
-
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
 
 	kfree(fujitsu_bl);
-- 
2.12.0
