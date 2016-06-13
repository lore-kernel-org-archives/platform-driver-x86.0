From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] platform/x86/intel_pmc_core: Convert to DEFINE_DEBUGFS_ATTRIBUTE
Date: Mon, 13 Jun 2016 20:56:49 +0300
Message-ID: <1465840609-136143-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:33417 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1423278AbcFMR47 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Jun 2016 13:56:59 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This patch does the following:
- refactors code to use recently introduced DEFINE_DEBUGFS_ATTRIBUTE() macro
- makes absence of DEBUG_FS non-fatal error

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 45 ++++++++---------------------------
 drivers/platform/x86/intel_pmc_core.h |  5 ++--
 2 files changed, 13 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index e57f923..c29f59b 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -23,7 +23,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/pci.h>
-#include <linux/seq_file.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
@@ -78,30 +77,18 @@ int intel_pmc_slp_s0_counter_read(u32 *data)
 }
 EXPORT_SYMBOL_GPL(intel_pmc_slp_s0_counter_read);
 
-#if IS_ENABLED(CONFIG_DEBUG_FS)
-static int pmc_core_dev_state_show(struct seq_file *s, void *unused)
+static int pmc_core_dev_state_get(void *data, u64 *val)
 {
-	struct pmc_dev *pmcdev = s->private;
-	u32 counter_val;
+	struct pmc_dev *pmcdev = data;
+	u32 value;
 
-	counter_val = pmc_core_reg_read(pmcdev,
-					SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
-	seq_printf(s, "%u\n", pmc_core_adjust_slp_s0_step(counter_val));
+	value = pmc_core_reg_read(pmcdev, SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
+	*val = pmc_core_adjust_slp_s0_step(value);
 
 	return 0;
 }
 
-static int pmc_core_dev_state_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pmc_core_dev_state_show, inode->i_private);
-}
-
-static const struct file_operations pmc_core_dev_state_ops = {
-	.open           = pmc_core_dev_state_open,
-	.read           = seq_read,
-	.llseek         = seq_lseek,
-	.release        = single_release,
-};
+DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_get, NULL, "%llu");
 
 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
@@ -113,12 +100,12 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 	struct dentry *dir, *file;
 
 	dir = debugfs_create_dir("pmc_core", NULL);
-	if (!dir)
+	if (IS_ERR_OR_NULL(dir))
 		return -ENOMEM;
 
 	pmcdev->dbgfs_dir = dir;
 	file = debugfs_create_file("slp_s0_residency_usec", S_IFREG | S_IRUGO,
-				   dir, pmcdev, &pmc_core_dev_state_ops);
+				   dir, pmcdev, &pmc_core_dev_state);
 
 	if (!file) {
 		pmc_core_dbgfs_unregister(pmcdev);
@@ -127,16 +114,6 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 
 	return 0;
 }
-#else
-static inline int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
-{
-	return 0;
-}
-
-static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
-{
-}
-#endif /* CONFIG_DEBUG_FS */
 
 static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_SKYLAKE_MOBILE, X86_FEATURE_MWAIT,
@@ -183,10 +160,8 @@ static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	err = pmc_core_dbgfs_register(pmcdev);
-	if (err < 0) {
-		dev_err(&dev->dev, "PMC Core: debugfs register failed.\n");
-		return err;
-	}
+	if (err < 0)
+		dev_warn(&dev->dev, "PMC Core: debugfs register failed.\n");
 
 	pmc.has_slp_s0_res = true;
 	return 0;
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index a9dadaf..9689b92 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -23,11 +23,14 @@
 
 /* Sunrise Point Power Management Controller PCI Device ID */
 #define SPT_PMC_PCI_DEVICE_ID			0x9d21
+
 #define SPT_PMC_BASE_ADDR_OFFSET		0x48
 #define SPT_PMC_SLP_S0_RES_COUNTER_OFFSET	0x13c
 #define SPT_PMC_MMIO_REG_LEN			0x100
 #define SPT_PMC_SLP_S0_RES_COUNTER_STEP		0x64
 
+struct dentry;
+
 /**
  * struct pmc_dev - pmc device structure
  * @base_addr:		comtains pmc base address
@@ -42,9 +45,7 @@
 struct pmc_dev {
 	u32 base_addr;
 	void __iomem *regbase;
-#if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *dbgfs_dir;
-#endif /* CONFIG_DEBUG_FS */
 	bool has_slp_s0_res;
 };
 
-- 
2.8.1
