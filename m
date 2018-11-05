From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V7 6/9]  misc/pvpanic : break dependency on ACPI
Date: Mon, 5 Nov 2018 18:40:28 +0800
Message-ID: <1541414431-84128-6-git-send-email-peng.hao2@zte.com.cn>
References: <1541414431-84128-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541414431-84128-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

The pvpanic driver is available for architectures that do not
support ACPI.So break the dependency.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/Kconfig   |  2 +-
 drivers/misc/pvpanic.c | 32 ++++++++++++++++++++++++++------
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 642626a..52642a9 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -515,7 +515,7 @@ config MISC_RTSX
 
 config PVPANIC
 	tristate "pvpanic device support"
-	depends on ACPI
+	depends on ACPI || OF
 	help
 	  This driver provides support for the pvpanic device.  pvpanic is
 	  a paravirtualized device provided by QEMU; it lets a virtual machine
diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index 0c987d7..fbb4d1f 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -34,6 +34,10 @@
 MODULE_DESCRIPTION("pvpanic device driver");
 MODULE_LICENSE("GPL");
 
+#define PVPANIC_PANICKED        (1 << 0)
+
+static void __iomem *base;
+#ifdef CONFIG_ACPI
 static int pvpanic_add(struct acpi_device *device);
 static int pvpanic_remove(struct acpi_device *device);
 
@@ -43,10 +47,6 @@
 };
 MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
 
-#define PVPANIC_PANICKED	(1 << 0)
-
-static void __iomem *base;
-
 static struct acpi_driver pvpanic_driver = {
 	.name =		"pvpanic",
 	.class =	"QEMU",
@@ -58,6 +58,24 @@
 	.owner =	THIS_MODULE,
 };
 
+static int pvpanic_register_acpi_driver(void)
+{
+	return acpi_bus_register_driver(&pvpanic_driver);
+}
+
+static void pvpanic_unregister_acpi_driver(void)
+{
+	acpi_bus_unregister_driver(&pvpanic_driver);
+}
+#else
+static int pvpanic_register_acpi_driver(void)
+{
+	return -ENODEV;
+}
+
+static void pvpanic_unregister_acpi_driver(void) {}
+#endif
+
 static void
 pvpanic_send_event(unsigned int event)
 {
@@ -104,6 +122,7 @@ static int pvpanic_mmio_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_ACPI
 static acpi_status
 pvpanic_walk_resources(struct acpi_resource *res, void *context)
 {
@@ -153,6 +172,7 @@ static int pvpanic_remove(struct acpi_device *device)
 
 	return 0;
 }
+#endif
 
 static const struct of_device_id pvpanic_mmio_match[] = {
 	{ .compatible = "qemu,pvpanic-mmio", },
@@ -173,7 +193,7 @@ static int __init pvpanic_mmio_init(void)
 	if (acpi_disabled)
 		return platform_driver_register(&pvpanic_mmio_driver);
         else
-		return acpi_bus_register_driver(&pvpanic_driver);
+		return pvpanic_register_acpi_driver();
 }
 
 static void __exit pvpanic_mmio_exit(void)
@@ -181,7 +201,7 @@ static void __exit pvpanic_mmio_exit(void)
 	if (acpi_disabled)
 		platform_driver_unregister(&pvpanic_mmio_driver);
 	else
-		acpi_bus_unregister_driver(&pvpanic_driver);
+		pvpanic_unregister_acpi_driver();
 }
 
 module_init(pvpanic_mmio_init);
-- 
1.8.3.1
