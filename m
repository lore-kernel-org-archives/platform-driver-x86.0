From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [PATCH 07/10] platform/x86: intel_pmc_core: Convert to INTEL_CPU_FAM6 macro
Date: Fri,  1 Feb 2019 13:02:31 +0530
Message-ID: <20190201073234.13280-8-rajneesh.bhardwaj@linux.intel.com>
References: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

INTEL_CPU_FAM6() macro provides better abstraction and reduces code size so use
it instead of custom grown ICPU().

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 835ed6d333bf..d3752d75075b 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -25,9 +25,6 @@
 
 #include "intel_pmc_core.h"
 
-#define ICPU(model, data) \
-	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_MWAIT, (kernel_ulong_t)data }
-
 static struct pmc_dev pmc;
 
 static const struct pmc_bit_map spt_pll_map[] = {
@@ -738,11 +735,11 @@ static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 #endif /* CONFIG_DEBUG_FS */
 
 static const struct x86_cpu_id intel_pmc_core_ids[] = {
-	ICPU(INTEL_FAM6_SKYLAKE_MOBILE, &spt_reg_map),
-	ICPU(INTEL_FAM6_SKYLAKE_DESKTOP, &spt_reg_map),
-	ICPU(INTEL_FAM6_KABYLAKE_MOBILE, &spt_reg_map),
-	ICPU(INTEL_FAM6_KABYLAKE_DESKTOP, &spt_reg_map),
-	ICPU(INTEL_FAM6_CANNONLAKE_MOBILE, &cnp_reg_map),
+	INTEL_CPU_FAM6(SKYLAKE_MOBILE, spt_reg_map),
+	INTEL_CPU_FAM6(SKYLAKE_DESKTOP, spt_reg_map),
+	INTEL_CPU_FAM6(KABYLAKE_MOBILE, spt_reg_map),
+	INTEL_CPU_FAM6(KABYLAKE_DESKTOP, spt_reg_map),
+	INTEL_CPU_FAM6(CANNONLAKE_MOBILE, cnp_reg_map),
 	{}
 };
 
-- 
2.17.1
