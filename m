From: Gayatri Kammela <gayatri.kammela@intel.com>
Subject: [PATCH v2 4/7] platform/x86: intel_pmc_core: Remove slp_s0 attributes from tgl_reg_map
Date: Tue,  4 Feb 2020 15:01:57 -0800
Message-ID: <2a29abb24e648c10121c52eeb6902993e139e092.1580848931.git.gayatri.kammela@intel.com>
References: <cover.1580848931.git.gayatri.kammela@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1580848931.git.gayatri.kammela@intel.com>
In-Reply-To: <cover.1580848931.git.gayatri.kammela@intel.com>
References: <cover.1580848931.git.gayatri.kammela@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, dvhart@infradead.org, mika.westerberg@intel.com, peterz@infradead.org, charles.d.prestopine@intel.com, Gayatri Kammela <gayatri.kammela@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Box <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

If platforms such as Tiger Lake has sub-states of S0ix, then both
slp_s0_debug_status and slp_s0_dbg_latch entries become invalid. Thus,
remove slp_s0_offset and slp_s0_dbg_maps attributes from tgl_reg_map, so
that both the entries are not created.

Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: David Box <david.e.box@intel.com>
Suggested-by: David Box <david.e.box@intel.com>
Signed-off-by: Gayatri Kammela <gayatri.kammela@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 9c66f253cf2b..a7394cfc4906 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -556,8 +556,6 @@ static const struct pmc_bit_map *tgl_lpm_maps[] = {
 
 static const struct pmc_reg_map tgl_reg_map = {
 	.pfear_sts = ext_tgl_pfear_map,
-	.slp_s0_offset = CNP_PMC_SLP_S0_RES_COUNTER_OFFSET,
-	.slps0_dbg_maps = cnp_slps0_dbg_maps,
 	.ltr_show_sts = cnp_ltr_show_map,
 	.msr_sts = msr_map,
 	.slps0_dbg_offset = CNP_PMC_SLPS0_DBG_OFFSET,
-- 
2.17.1
