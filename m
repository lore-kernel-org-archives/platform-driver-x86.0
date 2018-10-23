From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH 1/4]  pvpanic: move pvpanic to misc as common driver
Date: Wed, 24 Oct 2018 01:25:34 +0800
Message-ID: <1540315537-70007-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

move pvpanic.c from drivers/platform/x86 to drivers/misc.
following patches will use pvpanic device in arm64.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/Kconfig           |   7 +++
 drivers/misc/Makefile          |   1 +
 drivers/misc/pvpanic.c         | 124 +++++++++++++++++++++++++++++++++++++++++
 drivers/platform/Kconfig       |   3 +
 drivers/platform/Makefile      |   1 +
 drivers/platform/x86/Kconfig   |   8 ---
 drivers/platform/x86/Makefile  |   1 -
 drivers/platform/x86/pvpanic.c | 124 -----------------------------------------
 8 files changed, 136 insertions(+), 133 deletions(-)
 create mode 100644 drivers/misc/pvpanic.c
 delete mode 100644 drivers/platform/x86/pvpanic.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 5d71300..ca55c94 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -499,6 +499,13 @@ config MISC_RTSX
 	tristate
 	default MISC_RTSX_PCI || MISC_RTSX_USB
 
+config PVPANIC
+	tristate "pvpanic device support"
+	help
+          This driver provides support for the pvpanic device.  pvpanic is
+          a paravirtualized device provided by QEMU; it lets a virtual machine
+          (guest) communicate panic events to the host.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 20be70c..39dc005 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -57,3 +57,4 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
 obj-$(CONFIG_PCI_ENDPOINT_TEST)	+= pci_endpoint_test.o
 obj-$(CONFIG_OCXL)		+= ocxl/
 obj-$(CONFIG_MISC_RTSX)		+= cardreader/
+obj-$(CONFIG_PVPANIC)  		+= pvpanic.o
diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
new file mode 100644
index 0000000..fd86dab
--- /dev/null
+++ b/drivers/misc/pvpanic.c
@@ -0,0 +1,124 @@
+/*
+ *  pvpanic.c - pvpanic Device Support
+ *
+ *  Copyright (C) 2013 Fujitsu.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/acpi.h>
+
+MODULE_AUTHOR("Hu Tao <hutao@cn.fujitsu.com>");
+MODULE_DESCRIPTION("pvpanic device driver");
+MODULE_LICENSE("GPL");
+
+static int pvpanic_add(struct acpi_device *device);
+static int pvpanic_remove(struct acpi_device *device);
+
+static const struct acpi_device_id pvpanic_device_ids[] = {
+	{ "QEMU0001", 0 },
+	{ "", 0 },
+};
+MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
+
+#define PVPANIC_PANICKED	(1 << 0)
+
+static u16 port;
+
+static struct acpi_driver pvpanic_driver = {
+	.name =		"pvpanic",
+	.class =	"QEMU",
+	.ids =		pvpanic_device_ids,
+	.ops =		{
+				.add =		pvpanic_add,
+				.remove =	pvpanic_remove,
+			},
+	.owner =	THIS_MODULE,
+};
+
+static void
+pvpanic_send_event(unsigned int event)
+{
+	outb(event, port);
+}
+
+static int
+pvpanic_panic_notify(struct notifier_block *nb, unsigned long code,
+		     void *unused)
+{
+	pvpanic_send_event(PVPANIC_PANICKED);
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block pvpanic_panic_nb = {
+	.notifier_call = pvpanic_panic_notify,
+	.priority = 1, /* let this called before broken drm_fb_helper */
+};
+
+
+static acpi_status
+pvpanic_walk_resources(struct acpi_resource *res, void *context)
+{
+	switch (res->type) {
+	case ACPI_RESOURCE_TYPE_END_TAG:
+		return AE_OK;
+
+	case ACPI_RESOURCE_TYPE_IO:
+		port = res->data.io.minimum;
+		return AE_OK;
+
+	default:
+		return AE_ERROR;
+	}
+}
+
+static int pvpanic_add(struct acpi_device *device)
+{
+	int ret;
+
+	ret = acpi_bus_get_status(device);
+	if (ret < 0)
+		return ret;
+
+	if (!device->status.enabled || !device->status.functional)
+		return -ENODEV;
+
+	acpi_walk_resources(device->handle, METHOD_NAME__CRS,
+			    pvpanic_walk_resources, NULL);
+
+	if (!port)
+		return -ENODEV;
+
+	atomic_notifier_chain_register(&panic_notifier_list,
+				       &pvpanic_panic_nb);
+
+	return 0;
+}
+
+static int pvpanic_remove(struct acpi_device *device)
+{
+
+	atomic_notifier_chain_unregister(&panic_notifier_list,
+					 &pvpanic_panic_nb);
+	return 0;
+}
+
+module_acpi_driver(pvpanic_driver);
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index d4c2e42..8b64b78 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -1,3 +1,6 @@
+if ARM64
+source "drivers/platform/arm/Kconfig"
+endif
 if X86
 source "drivers/platform/x86/Kconfig"
 endif
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index 4b2ce58..232231c 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -3,6 +3,7 @@
 # Makefile for linux/drivers/platform
 #
 
+obj-$(CONFIG_ARM64)               += arm/
 obj-$(CONFIG_X86)		+= x86/
 obj-$(CONFIG_MELLANOX_PLATFORM)	+= mellanox/
 obj-$(CONFIG_MIPS)		+= mips/
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ef016e4..a6b412e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1119,14 +1119,6 @@ config INTEL_SMARTCONNECT
 	  This driver checks to determine whether the device has Intel Smart
 	  Connect enabled, and if so disables it.
 
-config PVPANIC
-	tristate "pvpanic device support"
-	depends on ACPI
-	---help---
-	  This driver provides support for the pvpanic device.  pvpanic is
-	  a paravirtualized device provided by QEMU; it lets a virtual machine
-	  (guest) communicate panic events to the host.
-
 config INTEL_PMC_IPC
 	tristate "Intel PMC IPC Driver"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 2ba6cb7..a4ec299 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -75,7 +75,6 @@ obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
 obj-$(CONFIG_INTEL_RST)		+= intel-rst.o
 obj-$(CONFIG_INTEL_SMARTCONNECT)	+= intel-smartconnect.o
 
-obj-$(CONFIG_PVPANIC)           += pvpanic.o
 obj-$(CONFIG_ALIENWARE_WMI)	+= alienware-wmi.o
 obj-$(CONFIG_INTEL_PMC_IPC)	+= intel_pmc_ipc.o
 obj-$(CONFIG_SILEAD_DMI)	+= silead_dmi.o
diff --git a/drivers/platform/x86/pvpanic.c b/drivers/platform/x86/pvpanic.c
deleted file mode 100644
index fd86dab..0000000
--- a/drivers/platform/x86/pvpanic.c
+++ /dev/null
@@ -1,124 +0,0 @@
-/*
- *  pvpanic.c - pvpanic Device Support
- *
- *  Copyright (C) 2013 Fujitsu.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/types.h>
-#include <linux/acpi.h>
-
-MODULE_AUTHOR("Hu Tao <hutao@cn.fujitsu.com>");
-MODULE_DESCRIPTION("pvpanic device driver");
-MODULE_LICENSE("GPL");
-
-static int pvpanic_add(struct acpi_device *device);
-static int pvpanic_remove(struct acpi_device *device);
-
-static const struct acpi_device_id pvpanic_device_ids[] = {
-	{ "QEMU0001", 0 },
-	{ "", 0 },
-};
-MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
-
-#define PVPANIC_PANICKED	(1 << 0)
-
-static u16 port;
-
-static struct acpi_driver pvpanic_driver = {
-	.name =		"pvpanic",
-	.class =	"QEMU",
-	.ids =		pvpanic_device_ids,
-	.ops =		{
-				.add =		pvpanic_add,
-				.remove =	pvpanic_remove,
-			},
-	.owner =	THIS_MODULE,
-};
-
-static void
-pvpanic_send_event(unsigned int event)
-{
-	outb(event, port);
-}
-
-static int
-pvpanic_panic_notify(struct notifier_block *nb, unsigned long code,
-		     void *unused)
-{
-	pvpanic_send_event(PVPANIC_PANICKED);
-	return NOTIFY_DONE;
-}
-
-static struct notifier_block pvpanic_panic_nb = {
-	.notifier_call = pvpanic_panic_notify,
-	.priority = 1, /* let this called before broken drm_fb_helper */
-};
-
-
-static acpi_status
-pvpanic_walk_resources(struct acpi_resource *res, void *context)
-{
-	switch (res->type) {
-	case ACPI_RESOURCE_TYPE_END_TAG:
-		return AE_OK;
-
-	case ACPI_RESOURCE_TYPE_IO:
-		port = res->data.io.minimum;
-		return AE_OK;
-
-	default:
-		return AE_ERROR;
-	}
-}
-
-static int pvpanic_add(struct acpi_device *device)
-{
-	int ret;
-
-	ret = acpi_bus_get_status(device);
-	if (ret < 0)
-		return ret;
-
-	if (!device->status.enabled || !device->status.functional)
-		return -ENODEV;
-
-	acpi_walk_resources(device->handle, METHOD_NAME__CRS,
-			    pvpanic_walk_resources, NULL);
-
-	if (!port)
-		return -ENODEV;
-
-	atomic_notifier_chain_register(&panic_notifier_list,
-				       &pvpanic_panic_nb);
-
-	return 0;
-}
-
-static int pvpanic_remove(struct acpi_device *device)
-{
-
-	atomic_notifier_chain_unregister(&panic_notifier_list,
-					 &pvpanic_panic_nb);
-	return 0;
-}
-
-module_acpi_driver(pvpanic_driver);
-- 
1.8.3.1
