From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v3 4/5] platform/x86: intel_pmc_core: Make pmc_core_substate_res_show() generic
Date: Sun,  1 Mar 2020 12:44:25 -0800
Message-ID: <683f6e76eace905f570d496a3e6e21b5fd795229.1583093898.git.gayatri.kammela@intel.com>
References: <cover.1583093898.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1583093898.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1583093898.git.gayatri.kammela@intel.com>
References: <cover.1583093898.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Chen Zhou <chenzhou10@huawei.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David E . Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently pmc_core_substate_res_show() uses array of char pointers
i.e., lpm_modes for Tiger Lake directly to iterate through and to get
the number of low power modes which is hardcoded and cannot be re-used
for future platforms that support sub-states. To maintain readability,
make pmc_core_substate_res_show() generic, so that it can re-used for
future platforms.

Cc: Chen Zhou <chenzhou10@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David E. Box <david.e.box@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 2 ++
 drivers/platform/x86/intel_pmc_core.h | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 986fe677d6fe..04ac058b9871 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -566,6 +566,7 @@ static const struct pmc_reg_map tgl_reg_map = {
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
 	.ltr_ignore_max = TGL_NUM_IP_IGN_ALLOWED,
+	.lpm_modes = tgl_lpm_modes,
 	.lpm_en_offset = TGL_LPM_EN_OFFSET,
 	.lpm_residency_offset = TGL_LPM_RESIDENCY_OFFSET,
 	.lpm_sts = tgl_lpm_maps,
@@ -991,6 +992,7 @@ DEFINE_SHOW_ATTRIBUTE(pmc_core_ltr);
 static int pmc_core_substate_res_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
+	const char **lpm_modes = pmcdev->map->lpm_modes;
 	u32 offset = pmcdev->map->lpm_residency_offset;
 	u32 lpm_en;
 	int index;
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index 1bbdffe80bde..0d50b2402abe 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -198,7 +198,7 @@ enum ppfear_regs {
 #define TGL_LPM_STATUS_OFFSET			0x1C3C
 #define TGL_LPM_LIVE_STATUS_OFFSET		0x1C5C
 
-const char *lpm_modes[] = {
+const char *tgl_lpm_modes[] = {
 	"S0i2.0",
 	"S0i2.1",
 	"S0i2.2",
@@ -255,6 +255,7 @@ struct pmc_reg_map {
 	const u32 ltr_ignore_max;
 	const u32 pm_vric1_offset;
 	/* Low Power Mode registers */
+	const char **lpm_modes;
 	const u32 lpm_en_offset;
 	const u32 lpm_residency_offset;
 	const u32 lpm_status_offset;
-- 
2.17.1
