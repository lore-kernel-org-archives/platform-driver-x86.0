From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V4 4/5]  misc/pvpanic: add support to get pvpanic device info by FDT
Date: Wed, 31 Oct 2018 21:37:20 +0800
Message-ID: <1540993041-25611-4-git-send-email-peng.hao2@zte.com.cn>
References: <1540993041-25611-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540993041-25611-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

By default, when ACPI tables and FDT coexist for ARM64,
current kernel takes precedence over FDT to get device information.
Virt machine in qemu provides both FDT and ACPI table. This patch
increases the way to get information through FDT.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index d0e28b2..861a0eb 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -3,15 +3,18 @@
  *  Pvpanic Device Support
  *
  *  Copyright (C) 2013 Fujitsu.
+ *  Copyright (C) 2018 ZTE.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/acpi.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/types.h>
-#include <linux/acpi.h>
 
 MODULE_AUTHOR("Hu Tao <hutao@cn.fujitsu.com>");
 MODULE_DESCRIPTION("pvpanic device driver");
@@ -22,7 +25,7 @@
 
 static const struct acpi_device_id pvpanic_device_ids[] = {
 	{ "QEMU0001", 0 },
-	{ "", 0 },
+	{ "", 0 }
 };
 MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
 
@@ -60,6 +63,32 @@
 	.priority = 1, /* let this called before broken drm_fb_helper */
 };
 
+static int pvpanic_mmio_probe(struct platform_device *pdev)
+{
+	struct resource *mem;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem)
+		return -EINVAL;
+
+	base = devm_ioremap_resource(&pdev->dev, mem);
+	if (base == NULL)
+		return -EFAULT;
+
+	atomic_notifier_chain_register(&panic_notifier_list,
+				       &pvpanic_panic_nb);
+
+	return 0;
+}
+
+static int pvpanic_mmio_remove(struct platform_device *pdev)
+{
+
+	atomic_notifier_chain_unregister(&panic_notifier_list,
+					 &pvpanic_panic_nb);
+
+	return 0;
+}
 
 static acpi_status
 pvpanic_walk_resources(struct acpi_resource *res, void *context)
@@ -120,4 +149,35 @@ static int pvpanic_remove(struct acpi_device *device)
 	return 0;
 }
 
-module_acpi_driver(pvpanic_driver);
+static const struct of_device_id pvpanic_mmio_match[] = {
+	{ .compatible = "qemu,pvpanic-mmio", },
+	{}
+};
+
+static struct platform_driver pvpanic_mmio_driver = {
+	.driver = {
+		.name = "pvpanic-mmio",
+		.of_match_table = pvpanic_mmio_match,
+	},
+	.probe = pvpanic_mmio_probe,
+	.remove = pvpanic_mmio_remove,
+};
+
+static int __init pvpanic_mmio_init(void)
+{
+	if (acpi_disabled)
+		return platform_driver_register(&pvpanic_mmio_driver);
+	else
+		return acpi_bus_register_driver(&pvpanic_driver);
+}
+
+static void __exit pvpanic_mmio_exit(void)
+{
+	if (acpi_disabled)
+		platform_driver_unregister(&pvpanic_mmio_driver);
+	else
+		acpi_bus_unregister_driver(&pvpanic_driver);
+}
+
+module_init(pvpanic_mmio_init);
+module_exit(pvpanic_mmio_exit);
-- 
1.8.3.1
