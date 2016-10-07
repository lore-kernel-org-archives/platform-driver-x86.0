From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 3/6] intel_pmc_core: ModPhy core lanes pg status
Date: Fri,  7 Oct 2016 16:01:14 +0530
Message-ID: <1475836277-4788-4-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:22398 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754093AbcJGKb1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Oct 2016 06:31:27 -0400
In-Reply-To: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

The PCH implements a number of High Speed I/O (HSIO) lanes that are split
between PCIe*, USB 3.0, SATA, GbE, USB OTG and SSIC. This patch shows the
current power gating status of the available ModPhy Core lanes. This is
done by sending a message to the PMC (MTPMC) that contains the XRAM
register offset for the MPHY_CORE_STS_0 and MPHY_CORE_STS_1 and then by
reading the response sent by the PMC (MFPMC).

While enabling low power modes we often encounter situations when the
ModPhy lanes are not power gated and it becomes hard to debug which lane is
active and which is not in the absence of an external hardware debugger
(JTAG/ITP). This patch eliminates the dependency on an external hardware
debugger for reading the ModPhy Lanes power gating status.

This patch requires PMC_READ_DISABLE setting to be disabled in the platform
bios.

cat /sys/kernel/debug/pmc_core/mphy_lanes_power_gating_status

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 145 +++++++++++++++++++++++++++++++++-
 drivers/platform/x86/intel_pmc_core.h |  31 ++++++++
 2 files changed, 175 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index d5efd6d..9245bc8 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/pci.h>
+#include <linux/delay.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
@@ -32,6 +33,26 @@
 
 static struct pmc_dev pmc;
 
+static const struct pmc_bit_map spt_mphy_map[] = {
+	{"MPHY CORE LANE 0",           SPT_PMC_BIT_MPHY_LANE0},
+	{"MPHY CORE LANE 1",           SPT_PMC_BIT_MPHY_LANE1},
+	{"MPHY CORE LANE 2",           SPT_PMC_BIT_MPHY_LANE2},
+	{"MPHY CORE LANE 3",           SPT_PMC_BIT_MPHY_LANE3},
+	{"MPHY CORE LANE 4",           SPT_PMC_BIT_MPHY_LANE4},
+	{"MPHY CORE LANE 5",           SPT_PMC_BIT_MPHY_LANE5},
+	{"MPHY CORE LANE 6",           SPT_PMC_BIT_MPHY_LANE6},
+	{"MPHY CORE LANE 7",           SPT_PMC_BIT_MPHY_LANE7},
+	{"MPHY CORE LANE 8",           SPT_PMC_BIT_MPHY_LANE8},
+	{"MPHY CORE LANE 9",           SPT_PMC_BIT_MPHY_LANE9},
+	{"MPHY CORE LANE 10",          SPT_PMC_BIT_MPHY_LANE10},
+	{"MPHY CORE LANE 11",          SPT_PMC_BIT_MPHY_LANE11},
+	{"MPHY CORE LANE 12",          SPT_PMC_BIT_MPHY_LANE12},
+	{"MPHY CORE LANE 13",          SPT_PMC_BIT_MPHY_LANE13},
+	{"MPHY CORE LANE 14",          SPT_PMC_BIT_MPHY_LANE14},
+	{"MPHY CORE LANE 15",          SPT_PMC_BIT_MPHY_LANE15},
+	{},
+};
+
 static const struct pmc_bit_map spt_pfear_map[] = {
 	{"PMC",				SPT_PMC_BIT_PMC},
 	{"OPI-DMI",			SPT_PMC_BIT_OPI},
@@ -78,6 +99,7 @@ static const struct pmc_bit_map spt_pfear_map[] = {
 
 static const struct pmc_reg_map spt_reg_map = {
 	.pfear_sts = spt_pfear_map,
+	.mphy_sts = spt_mphy_map,
 };
 
 static const struct pci_device_id pmc_pci_ids[] = {
@@ -96,6 +118,12 @@ static inline u32 pmc_core_reg_read(struct pmc_dev *pmcdev, int reg_offset)
 	return readl(pmcdev->regbase + reg_offset);
 }
 
+static inline void pmc_core_reg_write(struct pmc_dev *pmcdev, int
+							reg_offset, u32 val)
+{
+	writel(val, pmcdev->regbase + reg_offset);
+}
+
 static inline u32 pmc_core_adjust_slp_s0_step(u32 value)
 {
 	return value * SPT_PMC_SLP_S0_RES_COUNTER_STEP;
@@ -144,6 +172,16 @@ static int pmc_core_dev_state_get(void *data, u64 *val)
 
 DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_get, NULL, "%llu\n");
 
+static int pmc_core_check_read_lock_bit(void)
+{
+	struct pmc_dev *pmcdev = &pmc;
+	u32 value;
+
+	value = pmc_core_reg_read(pmcdev, SPT_PMC_PM_CFG_OFFSET);
+	return test_bit(SPT_PMC_READ_DISABLE_BIT,
+			(unsigned long *)&value);
+}
+
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 static void pmc_core_display_map(struct seq_file *s, int index,
 				 u8 pf_reg, const struct pmc_bit_map *pf_map)
@@ -183,6 +221,102 @@ static const struct file_operations pmc_core_ppfear_ops = {
 	.release        = single_release,
 };
 
+/* This function should return link status, 0 means ready */
+static int pmc_core_mtpmc_link_status(void)
+{
+	struct pmc_dev *pmcdev = &pmc;
+	u32 value;
+
+	value = pmc_core_reg_read(pmcdev, SPT_PMC_PM_STS_OFFSET);
+	return test_bit(SPT_PMC_MSG_FULL_STS_BIT,
+			(unsigned long *)&value);
+}
+
+static int pmc_core_send_msg(u32 *addr_xram)
+{
+	struct pmc_dev *pmcdev = &pmc;
+	u32 dest;
+	int timeout;
+
+	for (timeout = NUM_RETRIES; timeout > 0; timeout--) {
+		if (pmc_core_mtpmc_link_status() == 0)
+			break;
+		msleep(5);
+	}
+
+	if (timeout <= 0 && pmc_core_mtpmc_link_status())
+		return -EBUSY;
+
+	dest = (*addr_xram & MTPMC_MASK) | (1U << 1);
+	pmc_core_reg_write(pmcdev, SPT_PMC_MTPMC_OFFSET, dest);
+	return 0;
+}
+
+static int pmc_core_mphy_pg_sts_show(struct seq_file *s, void *unused)
+{
+	struct pmc_dev *pmcdev = s->private;
+	const struct pmc_bit_map *map = pmcdev->map->mphy_sts;
+	u32 mphy_core_reg_low, mphy_core_reg_high;
+	u32 val_low, val_high;
+	int index, err = 0;
+
+	if (pmcdev->pmc_xram_read_bit) {
+		seq_puts(s, "Access denied: please disable PMC_READ_DISABLE setting in BIOS.");
+		return 0;
+	}
+
+	mphy_core_reg_low  = (SPT_PMC_MPHY_CORE_STS_0 << 16);
+	mphy_core_reg_high = (SPT_PMC_MPHY_CORE_STS_1 << 16);
+
+	mutex_lock(&pmcdev->lock);
+
+	if (pmc_core_send_msg(&mphy_core_reg_low) != 0) {
+		err = -EBUSY;
+		goto out_unlock;
+	}
+
+	msleep(10);
+	val_low = pmc_core_reg_read(pmcdev, SPT_PMC_MFPMC_OFFSET);
+
+	if (pmc_core_send_msg(&mphy_core_reg_high) != 0) {
+		err = -EBUSY;
+		goto out_unlock;
+	}
+
+	msleep(10);
+	val_high = pmc_core_reg_read(pmcdev, SPT_PMC_MFPMC_OFFSET);
+
+	for (index = 0; map[index].name && index < 8; index++) {
+		seq_printf(s, "%-32s\tState: %s\n",
+			   map[index].name,
+			   map[index].bit_mask & val_low ? "Not power gated" :
+			   "Power gated");
+	}
+
+	for (index = 8; map[index].name; index++) {
+		seq_printf(s, "%-32s\tState: %s\n",
+			   map[index].name,
+			   map[index].bit_mask & val_high ? "Not power gated" :
+			   "Power gated");
+	}
+
+out_unlock:
+	mutex_unlock(&pmcdev->lock);
+	return err;
+}
+
+static int pmc_core_mphy_pg_sts_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, pmc_core_mphy_pg_sts_show, inode->i_private);
+}
+
+static const struct file_operations pmc_core_mphy_pg_ops = {
+	.open           = pmc_core_mphy_pg_sts_open,
+	.read           = seq_read,
+	.llseek         = seq_lseek,
+	.release        = single_release,
+};
+
 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
 	debugfs_remove_recursive(pmcdev->dbgfs_dir);
@@ -208,6 +342,12 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 	if (!file)
 		goto err;
 
+	file = debugfs_create_file("mphy_core_lanes_power_gating_status",
+				   S_IFREG | S_IRUGO, dir, pmcdev,
+				   &pmc_core_mphy_pg_ops);
+	if (!file)
+		goto err;
+
 	return 0;
 
 err:
@@ -271,11 +411,14 @@ static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		return -ENOMEM;
 	}
 
+	mutex_init(&pmcdev->lock);
+	pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
+	pmcdev->map = map;
+
 	err = pmc_core_dbgfs_register(pmcdev);
 	if (err < 0)
 		dev_warn(&dev->dev, "PMC Core: debugfs register failed.\n");
 
-	pmcdev->map = map;
 	pmc.has_slp_s0_res = true;
 	return 0;
 }
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index d034cd3..62fe5d1 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -26,10 +26,20 @@
 
 #define SPT_PMC_BASE_ADDR_OFFSET		0x48
 #define SPT_PMC_SLP_S0_RES_COUNTER_OFFSET	0x13c
+#define SPT_PMC_PM_CFG_OFFSET			0x18
+#define SPT_PMC_PM_STS_OFFSET			0x1c
+#define SPT_PMC_MTPMC_OFFSET			0x20
+#define SPT_PMC_MFPMC_OFFSET			0x38
+#define SPT_PMC_MPHY_CORE_STS_0			0x1143
+#define SPT_PMC_MPHY_CORE_STS_1			0x1142
 #define SPT_PMC_MMIO_REG_LEN			0x1000
 #define SPT_PMC_SLP_S0_RES_COUNTER_STEP		0x64
 #define PMC_BASE_ADDR_MASK			~(SPT_PMC_MMIO_REG_LEN - 1)
+#define MTPMC_MASK				0xffff0000
 #define NUM_ENTRIES				5
+#define SPT_PMC_READ_DISABLE_BIT		0x16
+#define SPT_PMC_MSG_FULL_STS_BIT		0x18
+#define NUM_RETRIES				100
 
 /* Sunrise Point: PGD PFET Enable Ack Status Registers */
 enum ppfear_regs {
@@ -85,6 +95,24 @@ enum ppfear_regs {
 #define SPT_PMC_BIT_CSME_RTC			BIT(6)
 #define SPT_PMC_BIT_CSME_PSF			BIT(7)
 
+#define SPT_PMC_BIT_MPHY_LANE0			BIT(0)
+#define SPT_PMC_BIT_MPHY_LANE1			BIT(1)
+#define SPT_PMC_BIT_MPHY_LANE2			BIT(2)
+#define SPT_PMC_BIT_MPHY_LANE3			BIT(3)
+#define SPT_PMC_BIT_MPHY_LANE4			BIT(4)
+#define SPT_PMC_BIT_MPHY_LANE5			BIT(5)
+#define SPT_PMC_BIT_MPHY_LANE6			BIT(6)
+#define SPT_PMC_BIT_MPHY_LANE7			BIT(7)
+
+#define SPT_PMC_BIT_MPHY_LANE8			BIT(0)
+#define SPT_PMC_BIT_MPHY_LANE9			BIT(1)
+#define SPT_PMC_BIT_MPHY_LANE10			BIT(2)
+#define SPT_PMC_BIT_MPHY_LANE11			BIT(3)
+#define SPT_PMC_BIT_MPHY_LANE12			BIT(4)
+#define SPT_PMC_BIT_MPHY_LANE13			BIT(5)
+#define SPT_PMC_BIT_MPHY_LANE14			BIT(6)
+#define SPT_PMC_BIT_MPHY_LANE15			BIT(7)
+
 struct pmc_bit_map {
 	const char *name;
 	u32 bit_mask;
@@ -92,6 +120,7 @@ struct pmc_bit_map {
 
 struct pmc_reg_map {
 	const struct pmc_bit_map *pfear_sts;
+	const struct pmc_bit_map *mphy_sts;
 };
 
 /**
@@ -113,6 +142,8 @@ struct pmc_dev {
 	struct dentry *dbgfs_dir;
 #endif /* CONFIG_DEBUG_FS */
 	bool has_slp_s0_res;
+	int pmc_xram_read_bit;
+	struct mutex lock; /* generic mutex lock for PMC Core */
 };
 
 #endif /* PMC_CORE_H */
-- 
1.9.1
