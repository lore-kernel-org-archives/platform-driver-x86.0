From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 2/6] intel_pmc_core: Add PCH IP Power Gating Status
Date: Fri,  7 Oct 2016 16:01:13 +0530
Message-ID: <1475836277-4788-3-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:63784 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753582AbcJGKbZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Oct 2016 06:31:25 -0400
In-Reply-To: <1475836277-4788-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

This patch adds the support for reading the power gating status of various
devices present on Sunrise Point PCH. This is intended to be used for
debugging purpose while tuning the platform for power optimizations and
also to understand which devices (on PCH) are blocking the system to enter
a low power state.

Power Management Controller on Sunrise Point PCH provides access to "PGD
PFET Enable Ack Status Registers (ppfear)". This patch reads and decodes
this register and dumps the output in formatted manner showing various
devices present on the PCH and their "Power Gating" status.

Further documentation can be found in Intel 7th Gen Core family mobile u/y
processor io datasheet volume 2.

Sample output (stripped and not in order):

cat /sys/kernel/debug/pmc_core/pch_ip_power_gating_status
PMC				State: Not Power gated
OPI-DMI				State: Not Power gated
XHCI				State: Power gated
LPSS				State: Power gated
CSME_PSF			State: Not power gated

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 122 ++++++++++++++++++++++++++++++++--
 drivers/platform/x86/intel_pmc_core.h |  67 +++++++++++++++++++
 2 files changed, 184 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index fcb0643..d5efd6d 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -32,11 +32,65 @@
 
 static struct pmc_dev pmc;
 
+static const struct pmc_bit_map spt_pfear_map[] = {
+	{"PMC",				SPT_PMC_BIT_PMC},
+	{"OPI-DMI",			SPT_PMC_BIT_OPI},
+	{"SPI / eSPI",			SPT_PMC_BIT_SPI},
+	{"XHCI",			SPT_PMC_BIT_XHCI},
+	{"SPA",				SPT_PMC_BIT_SPA},
+	{"SPB",				SPT_PMC_BIT_SPB},
+	{"SPC",				SPT_PMC_BIT_SPC},
+	{"GBE",				SPT_PMC_BIT_GBE},
+	{"SATA",			SPT_PMC_BIT_SATA},
+	{"HDA-PGD0",			SPT_PMC_BIT_HDA_PGD0},
+	{"HDA-PGD1",			SPT_PMC_BIT_HDA_PGD1},
+	{"HDA-PGD2",			SPT_PMC_BIT_HDA_PGD2},
+	{"HDA-PGD3",			SPT_PMC_BIT_HDA_PGD3},
+	{"RSVD",			SPT_PMC_BIT_RSVD_0B},
+	{"LPSS",			SPT_PMC_BIT_LPSS},
+	{"LPC",				SPT_PMC_BIT_LPC},
+	{"SMB",				SPT_PMC_BIT_SMB},
+	{"ISH",				SPT_PMC_BIT_ISH},
+	{"P2SB",			SPT_PMC_BIT_P2SB},
+	{"DFX",				SPT_PMC_BIT_DFX},
+	{"SCC",				SPT_PMC_BIT_SCC},
+	{"RSVD",			SPT_PMC_BIT_RSVD_0C},
+	{"FUSE",			SPT_PMC_BIT_FUSE},
+	{"CAMERA",			SPT_PMC_BIT_CAMREA},
+	{"RSVD",			SPT_PMC_BIT_RSVD_0D},
+	{"USB3-OTG",			SPT_PMC_BIT_USB3_OTG},
+	{"EXI",				SPT_PMC_BIT_EXI},
+	{"CSE",				SPT_PMC_BIT_CSE},
+	{"CSME_KVM",			SPT_PMC_BIT_CSME_KVM},
+	{"CSME_PMT",			SPT_PMC_BIT_CSME_PMT},
+	{"CSME_CLINK",			SPT_PMC_BIT_CSME_CLINK},
+	{"CSME_PTIO",			SPT_PMC_BIT_CSME_PTIO},
+	{"CSME_USBR",			SPT_PMC_BIT_CSME_USBR},
+	{"CSME_SUSRAM",			SPT_PMC_BIT_CSME_SUSRAM},
+	{"CSME_SMT",			SPT_PMC_BIT_CSME_SMT},
+	{"RSVD",			SPT_PMC_BIT_RSVD_1A},
+	{"CSME_SMS2",			SPT_PMC_BIT_CSME_SMS2},
+	{"CSME_SMS1",			SPT_PMC_BIT_CSME_SMS1},
+	{"CSME_RTC",			SPT_PMC_BIT_CSME_RTC},
+	{"CSME_PSF",			SPT_PMC_BIT_CSME_PSF},
+	{},
+};
+
+static const struct pmc_reg_map spt_reg_map = {
+	.pfear_sts = spt_pfear_map,
+};
+
 static const struct pci_device_id pmc_pci_ids[] = {
-	{ PCI_VDEVICE(INTEL, SPT_PMC_PCI_DEVICE_ID), (kernel_ulong_t)NULL },
+	{ PCI_VDEVICE(INTEL, SPT_PMC_PCI_DEVICE_ID),
+					(kernel_ulong_t)&spt_reg_map },
 	{ 0, },
 };
 
+static inline u8 pmc_core_reg_read_byte(struct pmc_dev *pmcdev, int offset)
+{
+	return readb(pmcdev->regbase + offset);
+}
+
 static inline u32 pmc_core_reg_read(struct pmc_dev *pmcdev, int reg_offset)
 {
 	return readl(pmcdev->regbase + reg_offset);
@@ -90,6 +144,45 @@ static int pmc_core_dev_state_get(void *data, u64 *val)
 
 DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_get, NULL, "%llu\n");
 
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+static void pmc_core_display_map(struct seq_file *s, int index,
+				 u8 pf_reg, const struct pmc_bit_map *pf_map)
+{
+	seq_printf(s, "PCH IP: %-2d - %-32s\tState: %s\n",
+		   index, pf_map[index].name,
+		   pf_map[index].bit_mask & pf_reg ? "Off" : "On");
+}
+
+static int pmc_core_ppfear_sts_show(struct seq_file *s, void *unused)
+{
+	struct pmc_dev *pmcdev = s->private;
+	const struct pmc_bit_map *map = pmcdev->map->pfear_sts;
+	u8 pf_regs[NUM_ENTRIES];
+	int index, iter;
+
+	iter = SPT_PMC_XRAM_PPFEAR0A;
+
+	for (index = 0; index < NUM_ENTRIES; index++, iter++)
+		pf_regs[index] = pmc_core_reg_read_byte(pmcdev, iter);
+
+	for (index = 0; map[index].name; index++)
+		pmc_core_display_map(s, index, pf_regs[index / 8], map);
+
+	return 0;
+}
+
+static int pmc_core_ppfear_sts_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, pmc_core_ppfear_sts_show, inode->i_private);
+}
+
+static const struct file_operations pmc_core_ppfear_ops = {
+	.open           = pmc_core_ppfear_sts_open,
+	.read           = seq_read,
+	.llseek         = seq_lseek,
+	.release        = single_release,
+};
+
 static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 {
 	debugfs_remove_recursive(pmcdev->dbgfs_dir);
@@ -106,14 +199,31 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 	pmcdev->dbgfs_dir = dir;
 	file = debugfs_create_file("slp_s0_residency_usec", S_IFREG | S_IRUGO,
 				   dir, pmcdev, &pmc_core_dev_state);
+	if (!file)
+		goto err;
 
-	if (!file) {
-		pmc_core_dbgfs_unregister(pmcdev);
-		return -ENODEV;
-	}
+	file = debugfs_create_file("pch_ip_power_gating_status",
+				   S_IFREG | S_IRUGO, dir, pmcdev,
+				   &pmc_core_ppfear_ops);
+	if (!file)
+		goto err;
 
 	return 0;
+
+err:
+	pmc_core_dbgfs_unregister(pmcdev);
+	return -ENODEV;
+}
+#else
+static inline int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
+{
+	return 0;
+}
+
+static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
+{
 }
+#endif /* CONFIG_DEBUG_FS */
 
 static const struct x86_cpu_id intel_pmc_core_ids[] = {
 	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_SKYLAKE_MOBILE, X86_FEATURE_MWAIT,
@@ -128,6 +238,7 @@ static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct device *ptr_dev = &dev->dev;
 	struct pmc_dev *pmcdev = &pmc;
 	const struct x86_cpu_id *cpu_id;
+	const struct pmc_reg_map *map = (struct pmc_reg_map *)id->driver_data;
 	int err;
 
 	cpu_id = x86_match_cpu(intel_pmc_core_ids);
@@ -164,6 +275,7 @@ static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (err < 0)
 		dev_warn(&dev->dev, "PMC Core: debugfs register failed.\n");
 
+	pmcdev->map = map;
 	pmc.has_slp_s0_res = true;
 	return 0;
 }
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index cde31ec..d034cd3 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -29,6 +29,70 @@
 #define SPT_PMC_MMIO_REG_LEN			0x1000
 #define SPT_PMC_SLP_S0_RES_COUNTER_STEP		0x64
 #define PMC_BASE_ADDR_MASK			~(SPT_PMC_MMIO_REG_LEN - 1)
+#define NUM_ENTRIES				5
+
+/* Sunrise Point: PGD PFET Enable Ack Status Registers */
+enum ppfear_regs {
+	SPT_PMC_XRAM_PPFEAR0A = 0x590,
+	SPT_PMC_XRAM_PPFEAR0B,
+	SPT_PMC_XRAM_PPFEAR0C,
+	SPT_PMC_XRAM_PPFEAR0D,
+	SPT_PMC_XRAM_PPFEAR1A,
+};
+
+#define SPT_PMC_BIT_PMC				BIT(0)
+#define SPT_PMC_BIT_OPI				BIT(1)
+#define SPT_PMC_BIT_SPI				BIT(2)
+#define SPT_PMC_BIT_XHCI			BIT(3)
+#define SPT_PMC_BIT_SPA				BIT(4)
+#define SPT_PMC_BIT_SPB				BIT(5)
+#define SPT_PMC_BIT_SPC				BIT(6)
+#define SPT_PMC_BIT_GBE				BIT(7)
+
+#define SPT_PMC_BIT_SATA			BIT(0)
+#define SPT_PMC_BIT_HDA_PGD0			BIT(1)
+#define SPT_PMC_BIT_HDA_PGD1			BIT(2)
+#define SPT_PMC_BIT_HDA_PGD2			BIT(3)
+#define SPT_PMC_BIT_HDA_PGD3			BIT(4)
+#define SPT_PMC_BIT_RSVD_0B			BIT(5)
+#define SPT_PMC_BIT_LPSS			BIT(6)
+#define SPT_PMC_BIT_LPC				BIT(7)
+
+#define SPT_PMC_BIT_SMB				BIT(0)
+#define SPT_PMC_BIT_ISH				BIT(1)
+#define SPT_PMC_BIT_P2SB			BIT(2)
+#define SPT_PMC_BIT_DFX				BIT(3)
+#define SPT_PMC_BIT_SCC				BIT(4)
+#define SPT_PMC_BIT_RSVD_0C			BIT(5)
+#define SPT_PMC_BIT_FUSE			BIT(6)
+#define SPT_PMC_BIT_CAMREA			BIT(7)
+
+#define SPT_PMC_BIT_RSVD_0D			BIT(0)
+#define SPT_PMC_BIT_USB3_OTG			BIT(1)
+#define SPT_PMC_BIT_EXI				BIT(2)
+#define SPT_PMC_BIT_CSE				BIT(3)
+#define SPT_PMC_BIT_CSME_KVM			BIT(4)
+#define SPT_PMC_BIT_CSME_PMT			BIT(5)
+#define SPT_PMC_BIT_CSME_CLINK			BIT(6)
+#define SPT_PMC_BIT_CSME_PTIO			BIT(7)
+
+#define SPT_PMC_BIT_CSME_USBR			BIT(0)
+#define SPT_PMC_BIT_CSME_SUSRAM			BIT(1)
+#define SPT_PMC_BIT_CSME_SMT			BIT(2)
+#define SPT_PMC_BIT_RSVD_1A			BIT(3)
+#define SPT_PMC_BIT_CSME_SMS2			BIT(4)
+#define SPT_PMC_BIT_CSME_SMS1			BIT(5)
+#define SPT_PMC_BIT_CSME_RTC			BIT(6)
+#define SPT_PMC_BIT_CSME_PSF			BIT(7)
+
+struct pmc_bit_map {
+	const char *name;
+	u32 bit_mask;
+};
+
+struct pmc_reg_map {
+	const struct pmc_bit_map *pfear_sts;
+};
 
 /**
  * struct pmc_dev - pmc device structure
@@ -44,7 +108,10 @@
 struct pmc_dev {
 	u32 base_addr;
 	void __iomem *regbase;
+	const struct pmc_reg_map *map;
+#if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *dbgfs_dir;
+#endif /* CONFIG_DEBUG_FS */
 	bool has_slp_s0_res;
 };
 
-- 
1.9.1
