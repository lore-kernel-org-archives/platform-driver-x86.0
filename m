From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH] platform/x86: intel_pmc_core: Add Package C-states residency info
Date: Fri, 18 Aug 2017 18:07:33 +0530
Message-ID: <1503059853-5118-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:4165 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750846AbdHRMjz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2017 08:39:55 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

This patch introduces a new debugfs entry to read current Package C-state
residency values and, one new kernel API to read the Package C-10 residency
counter.

Package C-state residency MSRs provide useful debug information about system
idle states. In idle states system must enter deeper Package C-states.

For example, on Intel Skylake/Kabylake based systems one should expect more
Package C-8 residency in "Idle Display On" scenarios compared to higher
Package C-states. With a self refresh display panel we must expect even more
deeper Package C-9/C-10 residencies indicating more power savings. Package
C-states depend not only on Core C-States but also on various IP blocks
power gating status and LTR values.

For Intel Core SoCs Package C-10 entry is a must for deeper sleep states
such as S0ix. "Suspend-to-idle"  should ideally take this path:
PC0 -> PC10 -> S0ix. For S0ix debug, its logical to check for Package-C10
residency if for some reason system fails to enter S0ix.

Please refer to this link for MSR details:
https://software.intel.com/sites/default/files/managed/22/0d/335592-sdm-vol-4.pdf

Usage:
cat /sys/kernel/debug/pmc_core/package_cstate_residency
Package C2       : 0xec2e21735f
Package C3       : 0xc30113ba4
Package C6       : 0x9ef4be15c5
Package C7       : 0x1e011904
Package C8       : 0x3c5653cfe5a
Package C9       : 0x0
Package C10      : 0x16fff4289

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 * Applied on top of "Make the driver PCH family agnostic" sent by Srinivas
 * Tested on 4.13-rc4 as well as on the "testing" branch of the
   platform/drivers/x86. 

 arch/x86/include/asm/pmc_core.h       |  1 +
 drivers/platform/x86/intel_pmc_core.c | 74 +++++++++++++++++++++++++++++++++++
 drivers/platform/x86/intel_pmc_core.h |  1 +
 3 files changed, 76 insertions(+)

diff --git a/arch/x86/include/asm/pmc_core.h b/arch/x86/include/asm/pmc_core.h
index d4855f11136d..99f48e63fafc 100644
--- a/arch/x86/include/asm/pmc_core.h
+++ b/arch/x86/include/asm/pmc_core.h
@@ -23,5 +23,6 @@
 
 /* API to read SLP_S0_RESIDENCY counter */
 int intel_pmc_slp_s0_counter_read(u32 *data);
+int intel_pkgc10_counter_read(u64 *data);
 
 #endif /* _ASM_PMC_CORE_H */
diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 17e08b42b0a9..5eea99f24b10 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -29,11 +29,24 @@
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include <asm/pmc_core.h>
+#include <asm/msr.h>
 
 #include "intel_pmc_core.h"
 
 static struct pmc_dev pmc;
 
+/* PKGC MSRs are common across Intel Core cpus */
+static const struct pmc_bit_map msr_map[] = {
+	{"Package C2",			MSR_PKG_C2_RESIDENCY},
+	{"Package C3",			MSR_PKG_C3_RESIDENCY},
+	{"Package C6",			MSR_PKG_C6_RESIDENCY},
+	{"Package C7",			MSR_PKG_C7_RESIDENCY},
+	{"Package C8",			MSR_PKG_C8_RESIDENCY},
+	{"Package C9",			MSR_PKG_C9_RESIDENCY},
+	{"Package C10",			MSR_PKG_C10_RESIDENCY},
+	{},
+};
+
 static const struct pmc_bit_map spt_pll_map[] = {
 	{"MIPI PLL",			SPT_PMC_BIT_MPHY_CMN_LANE0},
 	{"GEN2 USB2PCIE2 PLL",		SPT_PMC_BIT_MPHY_CMN_LANE1},
@@ -110,6 +123,7 @@ static const struct pmc_reg_map spt_reg_map = {
 	.pfear_sts = spt_pfear_map,
 	.mphy_sts = spt_mphy_map,
 	.pll_sts = spt_pll_map,
+	.msr_sts = msr_map,
 	.slp_s0_offset = SPT_PMC_SLP_S0_RES_COUNTER_OFFSET,
 	.ltr_ignore_offset = SPT_PMC_LTR_IGNORE_OFFSET,
 	.regmap_length = SPT_PMC_MMIO_REG_LEN,
@@ -147,6 +161,26 @@ static inline u32 pmc_core_adjust_slp_s0_step(u32 value)
 }
 
 /**
+ * intel_pkgc10_counter_read() - Read Package C10 residency.
+ * @data: Out param that contains current PC10 count by reading MSR 0x632
+ *
+ * MSR_PKG_C10_RESIDENCY counter counts at the same frequency as the TSC.
+ * BIT 0:59 represent the value since the last reset that this package is in
+ * processor specific C10 states.
+ * BIT 63:60 are reserved.
+ *
+ * Return: an error code or 0 on success.
+ */
+int intel_pkgc10_counter_read(u64 *data)
+{
+	if (!data)
+		return -EINVAL;
+
+	return rdmsrl_safe(MSR_PKG_C10_RESIDENCY, data);
+}
+EXPORT_SYMBOL_GPL(intel_pkgc10_counter_read);
+
+/**
  * intel_pmc_slp_s0_counter_read() - Read SLP_S0 residency.
  * @data: Out param that contains current SLP_S0 count.
  *
@@ -430,6 +464,39 @@ static const struct file_operations pmc_core_ltr_ignore_ops = {
 	.release        = single_release,
 };
 
+static int pmc_core_pkgc_show(struct seq_file *s, void *unused)
+{
+	struct pmc_dev *pmcdev = s->private;
+	const struct pmc_bit_map *map = pmcdev->map->msr_sts;
+	u64 pcstate_count;
+	int index, err;
+
+	for (index = 0; map[index].name ; index++) {
+		err = rdmsrl_safe(map[index].bit_mask, &pcstate_count);
+		if (err) {
+			pr_debug("Failed to read %s residency MSR",
+				 map[index].name);
+			return err;
+		}
+		seq_printf(s, "%s\t : 0x%llx\n", map[index].name,
+			   pcstate_count);
+	}
+
+	return 0;
+}
+
+static int pmc_core_pkgc_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, pmc_core_pkgc_show, inode->i_private);
+}
+
+static const struct file_operations pmc_core_pkgc_ops = {
+	.open           = pmc_core_pkgc_open,
+	.read           = seq_read,
+	.llseek         = seq_lseek,
+	.release        = single_release,
+};
+
 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
 	debugfs_remove_recursive(pmcdev->dbgfs_dir);
@@ -474,6 +541,13 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 	if (!file)
 		goto err;
 
+	file = debugfs_create_file("package_cstate_residency",
+				   S_IFREG | S_IRUGO, dir, pmcdev,
+				   &pmc_core_pkgc_ops);
+
+	if (!file)
+		goto err;
+
 	return 0;
 err:
 	pmc_core_dbgfs_unregister(pmcdev);
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index 3d225a9cc09f..4423b84c53c0 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -150,6 +150,7 @@ struct pmc_reg_map {
 	const struct pmc_bit_map *pfear_sts;
 	const struct pmc_bit_map *mphy_sts;
 	const struct pmc_bit_map *pll_sts;
+	const struct pmc_bit_map *msr_sts;
 	const u32 slp_s0_offset;
 	const u32 ltr_ignore_offset;
 	const u32 base_address;
-- 
2.7.4
