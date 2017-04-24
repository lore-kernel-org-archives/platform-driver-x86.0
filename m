From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 08/10] platform/x86: fujitsu-laptop: allocate struct fujitsu_laptop in acpi_fujitsu_laptop_add()
Date: Mon, 24 Apr 2017 15:33:32 +0200
Message-ID: <20170424133334.7064-9-kernel@kempniu.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34855 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1171467AbdDXNdr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 09:33:47 -0400
Received: by mail-lf0-f65.google.com with SMTP id i3so16575980lfh.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Apr 2017 06:33:46 -0700 (PDT)
In-Reply-To: <20170424133334.7064-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Only allocate memory for struct fujitsu_laptop when the FUJ02E3 ACPI
device is present.  Use devm_kzalloc() for allocating memory to simplify
cleanup.

Until all remaining module code is modified to only use device-specific
data, the pointer to the allocated memory still has to be stored in a
module-wide variable.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index fb46652250c7..f26abc41266e 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -808,6 +808,7 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 
 static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 {
+	struct fujitsu_laptop *priv;
 	int state = 0;
 	int error;
 	int i;
@@ -815,11 +816,16 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (!device)
 		return -EINVAL;
 
+	priv = devm_kzalloc(&device->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	fujitsu_laptop = priv;
 	fujitsu_laptop->handle = device->handle;
 	sprintf(acpi_device_name(device), "%s",
 		ACPI_FUJITSU_LAPTOP_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
-	device->driver_data = fujitsu_laptop;
+	device->driver_data = priv;
 
 	/* kfifo */
 	spin_lock_init(&fujitsu_laptop->fifo_lock);
@@ -1039,22 +1045,14 @@ static int __init fujitsu_init(void)
 
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
@@ -1067,8 +1065,6 @@ static void __exit fujitsu_cleanup(void)
 {
 	acpi_bus_unregister_driver(&acpi_fujitsu_laptop_driver);
 
-	kfree(fujitsu_laptop);
-
 	platform_driver_unregister(&fujitsu_pf_driver);
 
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
-- 
2.12.2
