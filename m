From: Guillaume =?utf-8?Q?Dou=C3=A9zan-Grard?= <gdouezangrard@gmail.com>
Subject: [PATCH v2 3/4] platform/x86: topstar-laptop: add platform device
Date: Sun, 29 Oct 2017 00:52:36 +0200
Message-ID: <53fbaedf9958cfb56e1e4ce11ccea4de3de134c9.1509229280.git.gdouezangrard@gmail.com>
References: <cover.1509229280.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:54608 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751515AbdJ1Wwj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 28 Oct 2017 18:52:39 -0400
Content-Disposition: inline
In-Reply-To: <cover.1509229280.git.gdouezangrard@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

* add platform device to support further addition of a led subsystem,

* add existing input device to the new platform device.

Signed-off-by: Guillaume Douézan-Grard <gdouezangrard@gmail.com>
---
 drivers/platform/x86/topstar-laptop.c | 59 +++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index 714d9d56c79f..d4f9ee35c520 100644
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
 	input->name = "Topstar Laptop extra buttons";
 	input->phys = TOPSTAR_LAPTOP_CLASS "/input0";
 	input->id.bustype = BUS_HOST;
+	input->dev.parent = &topstar->platform->dev;
 
 	err = sparse_keymap_setup(input, topstar_keymap, NULL);
 	if (err) {
@@ -107,6 +110,42 @@ static void topstar_input_exit(struct topstar_laptop *topstar)
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
+
+	platform_set_drvdata(topstar->platform, topstar);
+
+	err = platform_device_add(topstar->platform);
+	if (err)
+		goto err_device_put;
+
+	return 0;
+
+err_device_put:
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
@@ -172,12 +211,18 @@ static int topstar_acpi_add(struct acpi_device *device)
 	if (err)
 		goto err_free;
 
-	err = topstar_input_init(topstar);
+	err = topstar_platform_init(topstar);
 	if (err)
 		goto err_acpi_exit;
 
+	err = topstar_input_init(topstar);
+	if (err)
+		goto err_platform_exit;
+
 	return 0;
 
+err_platform_exit:
+	topstar_platform_exit(topstar);
 err_acpi_exit:
 	topstar_acpi_exit(topstar);
 err_free:
@@ -190,6 +235,7 @@ static int topstar_acpi_remove(struct acpi_device *device)
 	struct topstar_laptop *topstar = acpi_driver_data(device);
 
 	topstar_input_exit(topstar);
+	topstar_platform_exit(topstar);
 	topstar_acpi_exit(topstar);
 
 	kfree(topstar);
@@ -218,16 +264,25 @@ static int __init topstar_laptop_init(void)
 {
 	int res;
 
-	res = acpi_bus_register_driver(&topstar_acpi_driver);
+	res = platform_driver_register(&topstar_platform_driver);
 	if (res < 0)
 		return res;
 
+	res = acpi_bus_register_driver(&topstar_acpi_driver);
+	if (res < 0)
+		goto err_driver_unreg;
+
 	return 0;
+
+err_driver_unreg:
+	platform_driver_unregister(&topstar_platform_driver);
+	return res;
 }
 
 static void __exit topstar_laptop_exit(void)
 {
 	acpi_bus_unregister_driver(&topstar_acpi_driver);
+	platform_driver_unregister(&topstar_platform_driver);
 }
 
 module_init(topstar_laptop_init);
-- 
2.14.3
