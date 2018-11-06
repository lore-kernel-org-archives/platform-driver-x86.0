From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V8 07/11]  misc/pvpanic : break dependency on ACPI
Date: Tue, 6 Nov 2018 22:57:18 +0800
Message-ID: <1541516242-98568-7-git-send-email-peng.hao2@zte.com.cn>
References: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

The pvpanic driver is available for architectures that do not
support ACPI.So break the dependency.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/Kconfig   |  2 +-
 drivers/misc/pvpanic.c | 23 +++++++++++++++++++++--
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 64c898a..642626a 100644
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
index a9676b7..83f3187 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -57,6 +57,7 @@
 	.priority = 1, /* let this called before broken drm_fb_helper */
 };
 
+#ifdef CONFIG_ACPI
 static int pvpanic_add(struct acpi_device *device);
 static int pvpanic_remove(struct acpi_device *device);
 
@@ -126,6 +127,24 @@ static int pvpanic_remove(struct acpi_device *device)
 	return 0;
 }
 
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
 static int pvpanic_mmio_probe(struct platform_device *pdev)
 {
 	struct resource *mem;
@@ -172,7 +191,7 @@ static int __init pvpanic_mmio_init(void)
 	if (acpi_disabled)
 		return platform_driver_register(&pvpanic_mmio_driver);
 	else
-		return acpi_bus_register_driver(&pvpanic_driver);
+		return pvpanic_register_acpi_driver();
 }
 
 static void __exit pvpanic_mmio_exit(void)
@@ -180,7 +199,7 @@ static void __exit pvpanic_mmio_exit(void)
 	if (acpi_disabled)
 		platform_driver_unregister(&pvpanic_mmio_driver);
 	else
-		acpi_bus_unregister_driver(&pvpanic_driver);
+		pvpanic_unregister_acpi_driver();
 }
 
 module_init(pvpanic_mmio_init);
-- 
1.8.3.1
