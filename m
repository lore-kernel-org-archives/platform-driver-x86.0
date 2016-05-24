From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v5] platform:x86: Add PMC Driver for Intel Core SoC
Date: Tue, 24 May 2016 19:55:46 +0530
Message-ID: <1464099946-15078-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:6039 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754204AbcEXOZv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 May 2016 10:25:51 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, olof@lixom.net, tglx@linutronix.de, hpa@zytor.com, dbasehore@google.com, vishwanath.somayaji@intel.com, rajneesh.bhardwaj@intel.com

This patch adds the Power Management Controller driver as a pci driver
for Intel Core SoC architecture.

This driver can utilize debugging capabilities and supported features
as exposed by the Power Management Controller.

Please refer to the below specification for more details on PMC features.
http://www.intel.in/content/www/in/en/chipsets/100-series-chipset-datasheet-vol-2.html

The current version of this driver exposes slp_s0_residency counter.
This counter can be used for detecting fragile SLP_S0 signal related
failures and take corrective actions when PCH SLP_S0 signal is not
asserted after kernel freeze as part of suspend to idle flow
(echo freeze > /sys/power/state).

Intel Platform Controller Hub (PCH) asserts SLP_S0 signal when it
detects favorable conditions to enter its low power mode. As a
pre-requisite the SoC should be in deepest possible Package C-State
and devices should be in low power mode. For example, on Skylake SoC
the deepest Package C-State is Package C10 or PC10. Suspend to idle
flow generally leads to PC10 state but PC10 state may not be sufficient
for realizing the platform wide power potential which SLP_S0 signal
assertion can provide.

SLP_S0 signal is often connected to the Embedded Controller (EC) and the
Power Management IC (PMIC) for other platform power management related
optimizations.

In general, SLP_S0 assertion == PC10 + PCH low power mode + ModPhy Lanes
power gated + PLL Idle.

As part of this driver, a mechanism to read the slp_s0 residency is exposed
as an API and also debugfs features are added to indicate slp_s0 signal
assertion residency in microseconds.

echo freeze > /sys/power/state
wake the system
cat /sys/kernel/debug/pmc_core/slp_s0_residency_usec

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Signed-off-by: Vishwanath Somayaji <vishwanath.somayaji@intel.com>
---
Changes in v5:
 * Addressed generic review comments for v4.
 * Added generic read function "pmc_core_reg_read".
 * Split the header file into two:
	- arch/x86/include/asm/pmc_core.h => exposes API.
	- driver/platform/x86/intel_pmc_core.h => used by the driver.
 * Updated signature for intel_pmc_slp_s0_counter_read as slp_s0
   counter is a 32 bit counter.
 * Updated SOB, Authors and MAINTAINERS.
 * Using managed APIs:
	- pcim_enable_device
	- devm_ioremap_nocache
 * Updated probe and remove code.

Changes in v4:
 * Moved the header file to drivers/platform/x86 directory.
 * Updated the same in MAINTAINERS.
 * Removed 'default y' option from Kconfig.
 * Introduced static inline dummy functions for debugfs register
   and unregister case when CONFIG_DEBUG_FS is not set. Removed
   #if IS_ENABLED(CONFIG_DEBUG_FS) check from .probe and .remove calls.
 * Add CC to LKML (linux-kernel@vger.kernel.org)
 * Earlier review comments till v3 are available at:
   - http://www.spinics.net/lists/platform-driver-x86/msg08790.html
   - http://www.spinics.net/lists/platform-driver-x86/msg08759.html
   - http://www.spinics.net/lists/platform-driver-x86/msg08742.html

Changes in v3:
 * Updated the commit message, added reference to the chipset datasheet.
 * Renamed the header file to intel_pmc_core.h for consistency.
 * Added All rights reserved notification after the Copyright message.
 * Improved variable names in the header file. Added SPT prefix.
 * Fixed kernel-doc related whitespace and comma issues for struct pmc_dev.
 * Changed feature_available to bool has_slp_s0_res.
 * Enhanced the Kconfig description as per the review suggestions.
 * Added error propagating logic to pmc_core_dev_state_show.
 * Streamlined intel_pmc_slp_s0_counter_read as per the review comments.
 * Streamlined the use of #if IS_ENABLED(CONFIG_DEBUG_FS) while registering
   debugfs in the probe call.
 * Removed the *duplicate definition* of pmc_core_debugfs_register.
 * Added MAINTAINERS related changes.
 * Checkpatch warning due to long URL name in the commit message.

Changes in v2:
 * Fixed inconsistent spaces in the header file.
 * Updated commit message.
 * Enhanced acronym SKL CPU to Skylake CPUID Signature.
 * Put error check on pci_read_config_dword in probe function.
 * Changed goto label (disable) to disable_pci.
 * Changed x86_match_cpu error handling for consistency.

MAINTAINERS                           |   9 ++
 arch/x86/include/asm/pmc_core.h       |  28 +++++
 drivers/platform/x86/Kconfig          |  12 ++
 drivers/platform/x86/Makefile         |   1 +
 drivers/platform/x86/intel_pmc_core.c | 213 ++++++++++++++++++++++++++++++++++
 drivers/platform/x86/intel_pmc_core.h |  53 +++++++++
 6 files changed, 316 insertions(+)
 create mode 100644 arch/x86/include/asm/pmc_core.h
 create mode 100644 drivers/platform/x86/intel_pmc_core.c
 create mode 100644 drivers/platform/x86/intel_pmc_core.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3302006..4ebca10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6096,6 +6096,15 @@ S:	Maintained
 F:	arch/x86/include/asm/intel_telemetry.h
 F:	drivers/platform/x86/intel_telemetry*
 
+INTEL PMC CORE DRIVER
+M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
+M:	Vishwanath Somayaji <vishwanath.somayaji@intel.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	arch/x86/include/asm/pmc_core.h
+F:	drivers/platform/x86/intel_pmc_core.h
+F:	drivers/platform/x86/intel_pmc_core.c
+
 IOC3 ETHERNET DRIVER
 M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-mips@linux-mips.org
diff --git a/arch/x86/include/asm/pmc_core.h b/arch/x86/include/asm/pmc_core.h
new file mode 100644
index 0000000..248afd7
--- /dev/null
+++ b/arch/x86/include/asm/pmc_core.h
@@ -0,0 +1,28 @@
+/*
+ * Intel Core SOC Power Management Controller Header File
+ *
+ * Copyright (c) 2016, Intel Corporation.
+ * All Rights Reserved.
+ * Author: Rajneesh Bhardwaj (rajneesh.bhardwaj@intel.com)
+ * Author: Vishwanath Somayaji (vishwanath.somayaji@intel.com)
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ */
+
+#ifndef _ASM_PMC_CORE_H
+#define _ASM_PMC_CORE_H
+
+/* API to read slp_s0 residency */
+int intel_pmc_slp_s0_counter_read(u32 *data);
+
+#endif
+
+/* _ASM_PMC_CORE_H */
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ed2004b..6434c9c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -846,6 +846,18 @@ config INTEL_IMR
 
 	  If you are running on a Galileo/Quark say Y here.
 
+config INTEL_PMC_CORE
+	bool "Intel PMC Core driver"
+	depends on X86 && PCI
+	---help---
+	  The Intel Platform Controller Hub for Intel Core SoCs provides access
+	  to Power Management Controller registers via a pci interface. This
+	  driver can utilize debugging capabilities and supported features as
+	  exposed by the Power Management Controller.
+
+	  Supported features:
+		- slp_s0_residency counter.
+
 config IBM_RTL
 	tristate "Device driver to enable PRTL support"
 	depends on X86 && PCI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 448443c..9b11b40 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -69,3 +69,4 @@ obj-$(CONFIG_INTEL_PUNIT_IPC)  += intel_punit_ipc.o
 obj-$(CONFIG_INTEL_TELEMETRY)	+= intel_telemetry_core.o \
 				   intel_telemetry_pltdrv.o \
 				   intel_telemetry_debugfs.o
+obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
new file mode 100644
index 0000000..9d91cea
--- /dev/null
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -0,0 +1,213 @@
+/*
+ * Intel Core SoC Power Management Controller Driver
+ *
+ * Copyright (c) 2016, Intel Corporation.
+ * All Rights Reserved.
+ * Author: Rajneesh Bhardwaj (rajneesh.bhardwaj@intel.com)
+ * Author: Vishwanath Somayaji (vishwanath.somayaji@intel.com)
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ */
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/seq_file.h>
+
+#include <asm/cpu_device_id.h>
+#include <asm/pmc_core.h>
+
+#include "intel_pmc_core.h"
+
+static struct pmc_dev pmc;
+
+static const struct pci_device_id pmc_pci_ids[] = {
+	{ PCI_VDEVICE(INTEL, SPT_PMC_PCI_DEVICE_ID), (kernel_ulong_t)NULL },
+	{ 0, },
+};
+MODULE_DEVICE_TABLE(pci, pmc_pci_ids);
+
+static inline u32 pmc_core_reg_read(struct pmc_dev *pmc, int reg_offset)
+{
+	return readl(pmc->regmap + reg_offset);
+}
+
+static inline u32 pmc_core_adjust_slp_s0_step(u32 value)
+{
+	return value * SPT_PMC_SLP_S0_RES_COUNTER_STEP;
+}
+
+/**
+ * intel_pmc_slp_s0_counter_read() - Read slp_s0 residency.
+ * @data: Out param that contains current slp_s0 count.
+ *
+ * This API currently supports Intel Skylake SoC and Sunrise
+ * Point Platform Controller Hub. Future platform support
+ * should be added for platforms that support low power modes
+ * beyond Package C10 state.
+ *
+ * SLP_S0_RESIDENCY counter counts in 100 us granularity per
+ * step hence function populates the multiplied value in out
+ * parameter @data.
+ *
+ * Return: an error code or 0 on success.
+ */
+int intel_pmc_slp_s0_counter_read(u32 *data)
+{
+	struct pmc_dev *pmcdev = &pmc;
+	u32 value;
+
+	if (!pmcdev->has_slp_s0_res)
+		return -EACCES;
+
+	value = pmc_core_reg_read(pmcdev, SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
+	*data = pmc_core_adjust_slp_s0_step(value);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(intel_pmc_slp_s0_counter_read);
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static int pmc_core_dev_state_show(struct seq_file *s, void *unused)
+{
+	struct pmc_dev *pmcdev = s->private;
+	u32 counter_val;
+
+	counter_val = pmc_core_reg_read(pmcdev,
+					SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
+	seq_printf(s, "%u\n", pmc_core_adjust_slp_s0_step(counter_val));
+
+	return 0;
+}
+
+static int pmc_core_dev_state_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, pmc_core_dev_state_show, inode->i_private);
+}
+
+static const struct file_operations pmc_core_dev_state_ops = {
+	.open           = pmc_core_dev_state_open,
+	.read           = seq_read,
+	.llseek         = seq_lseek,
+	.release        = single_release,
+};
+
+static void pmc_core_dbgfs_unregister(struct pmc_dev *pmc)
+{
+	debugfs_remove_recursive(pmc->dbgfs_dir);
+}
+
+static int pmc_core_dbgfs_register(struct pmc_dev *pmc)
+{
+	struct dentry *dir, *file;
+	int ret = 0;
+
+	dir = debugfs_create_dir("pmc_core", NULL);
+	if (!dir)
+		return -ENOMEM;
+
+	pmc->dbgfs_dir = dir;
+	file = debugfs_create_file("slp_s0_residency_usec", S_IFREG | S_IRUGO,
+				   dir, pmc, &pmc_core_dev_state_ops);
+
+	if (!file) {
+		pmc_core_dbgfs_unregister(pmc);
+		ret = -ENODEV;
+	}
+	return ret;
+}
+#else
+static inline int pmc_core_dbgfs_register(struct pmc_dev *pmc)
+{
+	return 0; /* nothing to register */
+}
+
+static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmc)
+{
+	/* nothing to deregister */
+}
+#endif /* CONFIG_DEBUG_FS */
+
+static const struct x86_cpu_id intel_pmc_core_ids[] = {
+	{ X86_VENDOR_INTEL, 6, 0x4e, X86_FEATURE_MWAIT,
+		(kernel_ulong_t)NULL}, /* Skylake CPUID Signature */
+	{ X86_VENDOR_INTEL, 6, 0x5e, X86_FEATURE_MWAIT,
+		(kernel_ulong_t)NULL}, /* Skylake CPUID Signature */
+	{}
+};
+MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_ids);
+
+static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
+{
+	struct device *ptr_dev = &dev->dev;
+	struct pmc_dev *pmcdev = &pmc;
+	const struct x86_cpu_id *cpu_id;
+	int err;
+
+	cpu_id = x86_match_cpu(intel_pmc_core_ids);
+	if (!cpu_id) {
+		dev_dbg(&dev->dev, "PMC Core: cpuid mismatch.\n");
+		return -EINVAL;
+	}
+
+	err = pcim_enable_device(dev);
+	if (err < 0) {
+		dev_dbg(&dev->dev, "PMC Core: failed to enable Power Management Controller.\n");
+		return err;
+	}
+
+	err = pci_read_config_dword(dev,
+				    SPT_PMC_BASE_ADDR_OFFSET,
+				    &pmcdev->base_addr);
+	if (err < 0) {
+		dev_dbg(&dev->dev, "PMC Core: failed to read pci config space.\n");
+		return err;
+	}
+	dev_dbg(&dev->dev, "PMC Core: PWRMBASE is %#x\n", pmcdev->base_addr);
+
+	pmcdev->regmap = devm_ioremap_nocache(ptr_dev,
+					      pmcdev->base_addr,
+					      SPT_PMC_MMIO_REG_LEN);
+	if (!pmcdev->regmap) {
+		dev_dbg(&dev->dev, "PMC Core: ioremap failed.\n");
+		return -ENOMEM;
+	}
+
+	err = pmc_core_dbgfs_register(pmcdev);
+	if (err < 0) {
+		dev_err(&dev->dev, "PMC Core: debugfs register failed.\n");
+		return err;
+	}
+
+	pmc.has_slp_s0_res = true;
+	return 0;
+}
+
+static void intel_pmc_core_remove(struct pci_dev *pdev)
+{
+	pmc_core_dbgfs_unregister(&pmc);
+}
+
+static struct pci_driver intel_pmc_core_driver = {
+	.name = "intel_pmc_core",
+	.id_table = pmc_pci_ids,
+	.probe = pmc_core_probe,
+	.remove = intel_pmc_core_remove,
+};
+module_pci_driver(intel_pmc_core_driver);
+
+MODULE_AUTHOR("Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>");
+MODULE_AUTHOR("Vishwanath Somayaji <vishwanath.somayaji@intel.com>");
+MODULE_DESCRIPTION("Intel CORE SoC Power Management Controller Interface");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
new file mode 100644
index 0000000..6bb2892
--- /dev/null
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -0,0 +1,53 @@
+/*
+ * Intel Core SOC Power Management Controller Header File
+ *
+ * Copyright (c) 2016, Intel Corporation.
+ * All Rights Reserved.
+ * Author: Rajneesh Bhardwaj (rajneesh.bhardwaj@intel.com)
+ * Author: Vishwanath Somayaji (vishwanath.somayaji@intel.com)
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ */
+
+#ifndef PMC_CORE_H
+#define PMC_CORE_H
+
+/* Sunrise Point Power Management Controller PCI Device ID */
+#define SPT_PMC_PCI_DEVICE_ID			0x9d21
+#define SPT_PMC_BASE_ADDR_OFFSET		0x48
+#define SPT_PMC_SLP_S0_RES_COUNTER_OFFSET	0x13c
+#define SPT_PMC_MMIO_REG_LEN			0x100
+#define SPT_PMC_REG_BIT_WIDTH			0x20
+#define SPT_PMC_SLP_S0_RES_COUNTER_STEP		0x64
+
+/**
+ * struct pmc_dev - pmc device structure
+ * @base_addr:		comtains pmc base address
+ * @regmap:		pointer to io-remapped memory location
+ * @dbgfs_dir:		path to debug fs interface
+ * @feature_available:	flag to indicate whether
+ *			the feature is available
+ *			on a particular platform or not.
+ *
+ * pmc_dev contains info about power management controller device.
+ */
+struct pmc_dev {
+	u32 base_addr;
+	void __iomem *regmap;
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	struct dentry *dbgfs_dir;
+#endif /* CONFIG_DEBUG_FS */
+	bool has_slp_s0_res;
+};
+
+#endif
+
+/* PMC_CORE_H */
-- 
1.9.1
