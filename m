From: Guillaume =?utf-8?Q?Dou=C3=A9zan-Grard?= <gdouezangrard@gmail.com>
Subject: [PATCH 3/4] platform/x86: topstar-laptop: add platform device
Date: Tue, 17 Oct 2017 18:18:17 +0200
Message-ID: <f5a1369f75735950c276b6605933faf7ead69079.1508255487.git.gdouezangrard@gmail.com>
References: <cover.1508255487.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:49106 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932869AbdJQQSW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2017 12:18:22 -0400
Content-Disposition: inline
In-Reply-To: <cover.1508255487.git.gdouezangrard@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Signed-off-by: Guillaume Douézan-Grard <gdouezangrard@gmail.com>
---
 drivers/platform/x86/topstar-laptop.c | 57 ++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index ce33754c1f29..e2ee1e5cc734 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
+#include <linux/platform_device.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 
@@ -26,6 +27,7 @@
 
 struct topstar_laptop {
 	struct acpi_device *device;
+	struct platform_device *platform;
 	struct input_dev *input;
 };
 
@@ -81,6 +83,7 @@ static int topstar_input_init(struct topstar_laptop *topstar)
 	input->name = "Topstar Laptop Extra Buttons";
 	input->phys = TOPSTAR_LAPTOP_CLASS "/input0";
 	input->id.bustype = BUS_HOST;
+	input->dev.parent = &topstar->platform->dev;
 
 	err = sparse_keymap_setup(input, topstar_keymap, NULL);
 	if (err) {
@@ -107,6 +110,41 @@ static void topstar_input_exit(struct topstar_laptop *topstar)
 	input_unregister_device(topstar->input);
 }
 
+/*
+ * Platform
+ */
+
+static struct platform_driver topstar_platform_driver = {
+	.driver = {
+		.name = TOPSTAR_LAPTOP_CLASS,
+	},
+};
+
+static int topstar_platform_init(struct topstar_laptop *topstar)
+{
+	int err;
+
+	topstar->platform = platform_device_alloc(TOPSTAR_LAPTOP_CLASS, -1);
+	if (!topstar->platform)
+		return -ENOMEM;
+	platform_set_drvdata(topstar->platform, topstar);
+
+	err = platform_device_add(topstar->platform);
+	if (err)
+		goto err_platform;
+
+	return 0;
+
+err_platform:
+	platform_device_put(topstar->platform);
+	return err;
+}
+
+static void topstar_platform_exit(struct topstar_laptop *topstar)
+{
+	platform_device_unregister(topstar->platform);
+}
+
 /*
  * ACPI
  */
@@ -172,6 +210,10 @@ static int topstar_acpi_add(struct acpi_device *device)
 	if (err)
 		goto err_acpi;
 
+	err = topstar_platform_init(topstar);
+	if (err)
+		goto err_acpi_platform;
+
 	err = topstar_input_init(topstar);
 	if (err)
 		goto err_acpi_input;
@@ -179,6 +221,8 @@ static int topstar_acpi_add(struct acpi_device *device)
 	return 0;
 
 err_acpi_input:
+	topstar_platform_exit(topstar);
+err_acpi_platform:
 	topstar_acpi_exit(topstar);
 err_acpi:
 	kfree(topstar);
@@ -190,6 +234,7 @@ static int topstar_acpi_remove(struct acpi_device *device)
 	struct topstar_laptop *topstar = acpi_driver_data(device);
 
 	topstar_input_exit(topstar);
+	topstar_platform_exit(topstar);
 	topstar_acpi_exit(topstar);
 
 	kfree(topstar);
@@ -218,16 +263,26 @@ static int __init topstar_laptop_init(void)
 {
 	int res;
 
+	res = platform_driver_register(&topstar_platform_driver);
+	if (res < 0)
+		goto err_laptop_platform;
+
 	res = acpi_bus_register_driver(&topstar_acpi_driver);
 	if (res < 0)
-		return res;
+		goto err_laptop_acpi;
 
 	return 0;
+
+err_laptop_acpi:
+	platform_driver_unregister(&topstar_platform_driver);
+err_laptop_platform:
+	return res;
 }
 
 static void __exit topstar_laptop_exit(void)
 {
 	acpi_bus_unregister_driver(&topstar_acpi_driver);
+	platform_driver_unregister(&topstar_platform_driver);
 }
 
 module_init(topstar_laptop_init);
-- 
2.14.1
