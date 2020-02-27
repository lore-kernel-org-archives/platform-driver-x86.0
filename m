From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v1 4/4] platform/x86: intel_pmc_core: fix: Add slp_s0_offset attribute back to tgl_reg_map
Date: Wed, 26 Feb 2020 18:43:30 -0800
Message-ID: <8a3ba27589afd8d66545618f863e0c860ddd1944.1582770011.git.gayatri.kammela@intel.com>
References: <cover.1582770011.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1582770011.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1582770011.git.gayatri.kammela@intel.com>
References: <cover.1582770011.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Chen Zhou <chenzhou10@huawei.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "David E . Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

If platforms such as Tiger Lake has sub-states of S0ix, then attributes
such as slps0_dbg_offset become invalid. But slp_s0_offset is still
valid as it is used to get the pmcdev_base_addr.

Hence, add back slp_s0_offset and remove slps0_dbg_offset attributes.

Cc: Chen Zhou <chenzhou10@huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David E. Box <david.e.box@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index bbd3805f36e1..87a6aa4f43fa 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -556,9 +556,9 @@ static const struct pmc_bit_map *tgl_lpm_maps[] = {
 
 static const struct pmc_reg_map tgl_reg_map = {
 	.pfear_sts = ext_tgl_pfear_map,
+	.slp_s0_offset = CNP_PMC_SLP_S0_RES_COUNTER_OFFSET,
 	.ltr_show_sts = cnp_ltr_show_map,
 	.msr_sts = msr_map,
-	.slps0_dbg_offset = CNP_PMC_SLPS0_DBG_OFFSET,
 	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
 	.regmap_length = CNP_PMC_MMIO_REG_LEN,
 	.ppfear0_offset = CNP_PMC_HOST_PPFEAR0A,
-- 
2.17.1
