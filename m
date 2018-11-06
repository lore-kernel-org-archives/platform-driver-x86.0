From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V8 05/11]  misc/pvpanic: add support to get pvpanic device info FDT
Date: Tue, 6 Nov 2018 22:57:16 +0800
Message-ID: <1541516242-98568-5-git-send-email-peng.hao2@zte.com.cn>
References: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

By default, when ACPI tables and FDT coexist for ARM64,
current kernel takes precedence over FDT to get device information.
Virt machine in qemu provides both FDT and ACPI table. Increases the
way to get information through FDT.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index e923dac..c7f62bd 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -2,6 +2,7 @@
  *  pvpanic.c - pvpanic Device Support
  *
  *  Copyright (C) 2013 Fujitsu.
+ *  Copyright (C) 2018 ZTE.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -22,6 +23,9 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/acpi.h>
@@ -123,4 +127,62 @@ static int pvpanic_remove(struct acpi_device *device)
 	return 0;
 }
 
-module_acpi_driver(pvpanic_driver);
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
+
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
