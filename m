From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] platform/x86: intel_pmc_core: Get rid of custom ICPU() macro
Date: Fri, 31 Aug 2018 11:34:32 +0300
Message-ID: <20180831083432.15872-2-andriy.shevchenko@linux.intel.com>
References: <20180831083432.15872-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831083432.15872-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Replace custom grown macro with generic INTEL_CPU_FAM6() one.

No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 2d272a3e0176..ab904f238a3d 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -33,9 +33,6 @@
 
 #include "intel_pmc_core.h"
 
-#define ICPU(model, data) \
-	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_MWAIT, (kernel_ulong_t)data }
-
 static struct pmc_dev pmc;
 
 static const struct pmc_bit_map spt_pll_map[] = {
@@ -648,11 +645,11 @@ static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 #endif /* CONFIG_DEBUG_FS */
 
 static const struct x86_cpu_id intel_pmc_core_ids[] = {
-	ICPU(INTEL_FAM6_SKYLAKE_MOBILE, &spt_reg_map),
-	ICPU(INTEL_FAM6_SKYLAKE_DESKTOP, &spt_reg_map),
-	ICPU(INTEL_FAM6_KABYLAKE_MOBILE, &spt_reg_map),
-	ICPU(INTEL_FAM6_KABYLAKE_DESKTOP, &spt_reg_map),
-	ICPU(INTEL_FAM6_CANNONLAKE_MOBILE, &cnp_reg_map),
+	INTEL_CPU_FAM6(SKYLAKE_MOBILE,		spt_reg_map),
+	INTEL_CPU_FAM6(SKYLAKE_DESKTOP,		spt_reg_map),
+	INTEL_CPU_FAM6(KABYLAKE_MOBILE,		spt_reg_map),
+	INTEL_CPU_FAM6(KABYLAKE_DESKTOP,	spt_reg_map),
+	INTEL_CPU_FAM6(CANNONLAKE_MOBILE,	cnp_reg_map),
 	{}
 };
 
-- 
2.18.0
