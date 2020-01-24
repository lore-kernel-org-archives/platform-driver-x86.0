From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1 7/7] platform/x86: intel_pmc_core: Add debugfs support to access live status registers
Date: Fri, 24 Jan 2020 10:50:28 -0800
Message-ID: <d83b86cb79b304b573cf27718bed685ee93489d2.1579890793.git.gayatri.kammela@intel.com>
References: <cover.1579890793.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1579890793.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1579890793.git.gayatri.kammela@intel.com>
References: <cover.1579890793.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David E . Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Just like status registers, Tiger Lake has another set of 6 registers
that help with status of the low power mode requirements. They are
latched on every PC10 entry/exit and S0ix.y entry/exit as well.

Though status and live status registers show the status of same list
of requirements, live status registers show the status of the low power
mode requirements at the time of reading.

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David E. Box <david.e.box@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 19 +++++++++++++++++++
 drivers/platform/x86/intel_pmc_core.h |  2 ++
 2 files changed, 21 insertions(+)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 92c9840b5029..d583cd5adb31 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -570,6 +570,7 @@ static const struct pmc_reg_map tgl_reg_map = {
 	.lpm_residency_offset = TGL_LPM_RESIDENCY_OFFSET,
 	.lpm_sts = tgl_lpm_maps,
 	.lpm_status_offset = TGL_LPM_STATUS_OFFSET,
+	.lpm_live_status_offset = TGL_LPM_LIVE_STATUS_OFFSET,
 };
 
 static inline u8 pmc_core_reg_read_byte(struct pmc_dev *pmcdev, int offset)
@@ -1018,6 +1019,18 @@ static int pmc_core_substate_sts_regs_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_sts_regs);
 
+static int pmc_core_substate_l_sts_regs_show(struct seq_file *s, void *unused)
+{
+	struct pmc_dev *pmcdev = s->private;
+	const struct pmc_bit_map **maps = pmcdev->map->lpm_sts;
+	u32 offset = pmcdev->map->lpm_live_status_offset;
+
+	pmc_core_lpm_display(pmcdev, NULL, s, offset, "LIVE_STATUS", maps);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(pmc_core_substate_l_sts_regs);
+
 static int pmc_core_pkgc_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
@@ -1095,6 +1108,12 @@ static void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 				    pmcdev->dbgfs_dir, pmcdev,
 				    &pmc_core_substate_sts_regs_fops);
 	}
+
+	if (pmcdev->map->lpm_status_offset) {
+		debugfs_create_file("substate_live_status_registers", 0444,
+				    pmcdev->dbgfs_dir, pmcdev,
+				    &pmc_core_substate_l_sts_regs_fops);
+	}
 }
 #else
 static inline void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index 3fdf4735c56f..1bbdffe80bde 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -196,6 +196,7 @@ enum ppfear_regs {
 
 /* Tigerlake Low Power Mode debug registers */
 #define TGL_LPM_STATUS_OFFSET			0x1C3C
+#define TGL_LPM_LIVE_STATUS_OFFSET		0x1C5C
 
 const char *lpm_modes[] = {
 	"S0i2.0",
@@ -257,6 +258,7 @@ struct pmc_reg_map {
 	const u32 lpm_en_offset;
 	const u32 lpm_residency_offset;
 	const u32 lpm_status_offset;
+	const u32 lpm_live_status_offset;
 };
 
 /**
-- 
2.17.1
