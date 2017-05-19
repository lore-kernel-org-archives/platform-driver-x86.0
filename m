From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 4/8] platform/x86: fujitsu-laptop: allocate struct fujitsu_laptop in acpi_fujitsu_laptop_add()
Date: Fri, 19 May 2017 09:44:44 +0200
Message-ID: <20170519074448.12716-5-kernel@kempniu.pl>
References: <20170519074448.12716-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35698 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751738AbdESHo7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 May 2017 03:44:59 -0400
Received: by mail-wm0-f67.google.com with SMTP id v4so16458475wmb.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 May 2017 00:44:59 -0700 (PDT)
In-Reply-To: <20170519074448.12716-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Only allocate memory for struct fujitsu_laptop when the FUJ02E3 ACPI
device is present.  Use devm_kzalloc() for allocating memory to simplify
cleanup.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 1124070aad2d..3916f0ae59f3 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -776,6 +776,7 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 
 static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 {
+	struct fujitsu_laptop *priv;
 	int state = 0;
 	int error;
 	int i;
@@ -783,11 +784,16 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (!device)
 		return -EINVAL;
 
+	priv = devm_kzalloc(&device->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	fujitsu_laptop = priv;
 	fujitsu_laptop->acpi_handle = device->handle;
 	sprintf(acpi_device_name(device), "%s",
 		ACPI_FUJITSU_LAPTOP_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
-	device->driver_data = fujitsu_laptop;
+	device->driver_data = priv;
 
 	/* kfifo */
 	spin_lock_init(&fujitsu_laptop->fifo_lock);
@@ -1014,22 +1020,14 @@ static int __init fujitsu_init(void)
 
 	/* Register laptop driver */
 
-	fujitsu_laptop = kzalloc(sizeof(struct fujitsu_laptop), GFP_KERNEL);
-	if (!fujitsu_laptop) {
-		ret = -ENOMEM;
-		goto err_unregister_platform_driver;
-	}
-
 	ret = acpi_bus_register_driver(&acpi_fujitsu_laptop_driver);
 	if (ret)
-		goto err_free_fujitsu_laptop;
+		goto err_unregister_platform_driver;
 
 	pr_info("driver " FUJITSU_DRIVER_VERSION " successfully loaded\n");
 
 	return 0;
 
-err_free_fujitsu_laptop:
-	kfree(fujitsu_laptop);
 err_unregister_platform_driver:
 	platform_driver_unregister(&fujitsu_pf_driver);
 err_unregister_acpi:
@@ -1042,8 +1040,6 @@ static void __exit fujitsu_cleanup(void)
 {
 	acpi_bus_unregister_driver(&acpi_fujitsu_laptop_driver);
 
-	kfree(fujitsu_laptop);
-
 	platform_driver_unregister(&fujitsu_pf_driver);
 
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
-- 
2.13.0
