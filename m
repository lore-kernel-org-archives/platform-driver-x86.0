From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH] Vibrator Driver for Intel MID Platforms
Date: Tue, 01 Jun 2010 12:56:46 +0100
Message-ID: <20100601115558.23256.16674.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:45251 "EHLO
	bob.linux.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756102Ab0FAMnH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 1 Jun 2010 08:43:07 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org

From: Kalhan Trisal <kalhan.trisal@intel.com>

This patch provides support for the MID vibrator can be switched
on/off using sysfs interfaces.

Signed-off-by: Kalhan Trisal <kalhan.trisal@intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/Kconfig              |    9 +++
 drivers/platform/x86/Makefile             |    1 
 drivers/platform/x86/intel_mid_vibrator.c |   88 +++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 0 deletions(-)
 create mode 100644 drivers/platform/x86/intel_mid_vibrator.c


diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3e1b8a2..02a55db 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -537,4 +537,13 @@ config INTEL_SCU_IPC
 	  some embedded Intel x86 platforms. This is not needed for PC-type
 	  machines.
 
+config INTEL_MID_VIB
+	tristate "Vibrator driver for Intel MID platforms"
+	depends on INTEL_SCU_IPC
+	help
+	  This driver provides a sys interface to the vibrator device
+	  on the Intel MID platforms.
+	
+	  If unsure, say N.
+
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 8770bfe..7bcb5d8 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -26,3 +26,4 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
 obj-$(CONFIG_ACPI_TOSHIBA)	+= toshiba_acpi.o
 obj-$(CONFIG_TOSHIBA_BT_RFKILL)	+= toshiba_bluetooth.o
 obj-$(CONFIG_INTEL_SCU_IPC)	+= intel_scu_ipc.o
+obj-$(CONFIG_INTEL_MID_VIB)	+= intel_mid_vibrator.o
diff --git a/drivers/platform/x86/intel_mid_vibrator.c b/drivers/platform/x86/intel_mid_vibrator.c
new file mode 100644
index 0000000..73f5e02
--- /dev/null
+++ b/drivers/platform/x86/intel_mid_vibrator.c
@@ -0,0 +1,88 @@
+/*
+ * intel_mid_vibrator.c - Intel vibrator Driver
+ *
+ * Copyright (C) 2008 Intel Corp
+ *
+ *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, write to the Free Software Foundation, Inc.,
+ * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ *
+ */
+
+#include <linux/platform_device.h>
+#include <linux/kernel.h>
+#include <linux/sysfs.h>
+#include <asm/intel_scu_ipc.h>
+
+
+static struct platform_device *vib_pdev;
+
+/*
+ *	If the PMIC hasn't been discovered or one is not found then
+ *	the calls will error for us.
+ */
+
+static ssize_t vib_store(struct device *dev, struct device_attribute *attr,
+			const char *buf, size_t count)
+{
+
+	unsigned long val;
+
+	if (strict_strtoul(buf, 10, &val))
+		return -EINVAL;
+	if (val) {
+		if (intel_scu_ipc_iowrite8(0x49, 0xAD))
+			return -EINVAL;
+	} else  {
+		if (intel_scu_ipc_iowrite8(0x49, 0x14))
+			return -EINVAL;
+	}
+	return count;
+}
+
+static struct device_attribute dev_attr_vib =
+	__ATTR(vib, S_IWUSR, NULL, vib_store);
+
+
+/*
+ *	The vibrator interface is non-discoverable and attached only via
+ *	the PMIC IPC, so we create ourselves as a platform device. If it
+ *	becomes discoverable this will change to a match handler for the
+ *	device and the device itself will be created by whoever enumerates it.
+ */
+
+static int __init mrst_vib_init(void)
+{
+	vib_pdev = platform_device_register_simple("mrst_vib", -1, NULL, 0);
+	if (IS_ERR(vib_pdev)) {
+		printk(KERN_WARNING
+			"mrst_vib: unable to register platform device\n");
+		return PTR_ERR(vib_pdev);
+	}
+	return device_create_file(&vib_pdev->dev, &dev_attr_vib);
+}
+
+static void __exit mrst_vib_exit(void)
+{
+	device_remove_file(&vib_pdev->dev, &dev_attr_vib);
+	platform_device_unregister(vib_pdev);
+}
+
+module_init(mrst_vib_init);
+module_exit(mrst_vib_exit);
+
+MODULE_AUTHOR("Kalhan Trisal");
+MODULE_DESCRIPTION("Intel Moorestown Vibrator Driver");
+MODULE_LICENSE("GPL v2");

