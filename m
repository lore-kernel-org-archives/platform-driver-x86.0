From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 4/6] intel_pmc_core: Add MPHY PLL clock gating status
Date: Fri,  7 Oct 2016 16:01:15 +0530
Message-ID: <1475836277-4788-5-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:33380 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754313AbcJGKb3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Oct 2016 06:31:29 -0400
In-Reply-To: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

ModPhy Common lanes can provide the clock gating status for the important
system PLLs such as Gen2 USB3PCIE2 PLL, DMIPCIE3 PLL, SATA PLL and MIPI
PLL.

On SPT, in addition to the crystal oscillator clock, the 100Mhz Gen2
USB3PCI2 PLL clock is used as the PLL reference clock and Gen2 PLL idling
is a necessary condition for the platform to go into low power states like
PC10 and S0ix.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 63 ++++++++++++++++++++++++++++++++++-
 drivers/platform/x86/intel_pmc_core.h |  7 ++++
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 9245bc8..4840158 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -33,6 +33,14 @@
 
 static struct pmc_dev pmc;
 
+static const struct pmc_bit_map spt_pll_map[] = {
+	{"MIPI PLL",			SPT_PMC_BIT_MPHY_CMN_LANE0},
+	{"GEN2 USB2PCIE2 PLL",		SPT_PMC_BIT_MPHY_CMN_LANE1},
+	{"DMIPCIE3 PLL",		SPT_PMC_BIT_MPHY_CMN_LANE2},
+	{"SATA PLL",			SPT_PMC_BIT_MPHY_CMN_LANE3},
+	{},
+};
+
 static const struct pmc_bit_map spt_mphy_map[] = {
 	{"MPHY CORE LANE 0",           SPT_PMC_BIT_MPHY_LANE0},
 	{"MPHY CORE LANE 1",           SPT_PMC_BIT_MPHY_LANE1},
@@ -100,6 +108,7 @@ static const struct pmc_bit_map spt_pfear_map[] = {
 static const struct pmc_reg_map spt_reg_map = {
 	.pfear_sts = spt_pfear_map,
 	.mphy_sts = spt_mphy_map,
+	.pll_sts = spt_pll_map,
 };
 
 static const struct pci_device_id pmc_pci_ids[] = {
@@ -317,6 +326,53 @@ static const struct file_operations pmc_core_mphy_pg_ops = {
 	.release        = single_release,
 };
 
+static int pmc_core_pll_show(struct seq_file *s, void *unused)
+{
+	struct pmc_dev *pmcdev = s->private;
+	const struct pmc_bit_map *map = pmcdev->map->pll_sts;
+	u32 mphy_common_reg, val;
+	int index, err = 0;
+
+	if (pmcdev->pmc_xram_read_bit) {
+		seq_puts(s, "Access denied: please disable PMC_READ_DISABLE setting in BIOS.");
+		return 0;
+	}
+
+	mphy_common_reg  = (SPT_PMC_MPHY_COM_STS_0 << 16);
+	mutex_lock(&pmcdev->lock);
+
+	if (pmc_core_send_msg(&mphy_common_reg) != 0) {
+		err = -EBUSY;
+		goto out_unlock;
+	}
+
+	/* Observed PMC HW response latency for MTPMC-MFPMC is ~10 ms */
+	msleep(10);
+	val = pmc_core_reg_read(pmcdev, SPT_PMC_MFPMC_OFFSET);
+
+	for (index = 0; map[index].name ; index++) {
+		seq_printf(s, "%-32s\tState: %s\n",
+			   map[index].name,
+			   map[index].bit_mask & val ? "Active" : "Idle");
+	}
+
+out_unlock:
+	mutex_unlock(&pmcdev->lock);
+	return err;
+}
+
+static int pmc_core_pll_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, pmc_core_pll_show, inode->i_private);
+}
+
+static const struct file_operations pmc_core_pll_ops = {
+	.open           = pmc_core_pll_open,
+	.read           = seq_read,
+	.llseek         = seq_lseek,
+	.release        = single_release,
+};
+
 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
 	debugfs_remove_recursive(pmcdev->dbgfs_dir);
@@ -348,8 +404,13 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 	if (!file)
 		goto err;
 
-	return 0;
+	file = debugfs_create_file("pll_status",
+				   S_IFREG | S_IRUGO, dir, pmcdev,
+				   &pmc_core_pll_ops);
+	if (!file)
+		goto err;
 
+	return 0;
 err:
 	pmc_core_dbgfs_unregister(pmcdev);
 	return -ENODEV;
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index 62fe5d1..07161fb 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -32,6 +32,7 @@
 #define SPT_PMC_MFPMC_OFFSET			0x38
 #define SPT_PMC_MPHY_CORE_STS_0			0x1143
 #define SPT_PMC_MPHY_CORE_STS_1			0x1142
+#define SPT_PMC_MPHY_COM_STS_0			0x1155
 #define SPT_PMC_MMIO_REG_LEN			0x1000
 #define SPT_PMC_SLP_S0_RES_COUNTER_STEP		0x64
 #define PMC_BASE_ADDR_MASK			~(SPT_PMC_MMIO_REG_LEN - 1)
@@ -113,6 +114,11 @@ enum ppfear_regs {
 #define SPT_PMC_BIT_MPHY_LANE14			BIT(6)
 #define SPT_PMC_BIT_MPHY_LANE15			BIT(7)
 
+#define SPT_PMC_BIT_MPHY_CMN_LANE0		BIT(0)
+#define SPT_PMC_BIT_MPHY_CMN_LANE1		BIT(1)
+#define SPT_PMC_BIT_MPHY_CMN_LANE2		BIT(2)
+#define SPT_PMC_BIT_MPHY_CMN_LANE3		BIT(3)
+
 struct pmc_bit_map {
 	const char *name;
 	u32 bit_mask;
@@ -121,6 +127,7 @@ struct pmc_bit_map {
 struct pmc_reg_map {
 	const struct pmc_bit_map *pfear_sts;
 	const struct pmc_bit_map *mphy_sts;
+	const struct pmc_bit_map *pll_sts;
 };
 
 /**
-- 
1.9.1
