From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [Patch v1 5/8] platform/x86: intel_pmc_core: Convert to ICPU macro
Date: Fri, 19 Jan 2018 14:28:24 +0530
Message-ID: <1516352307-20123-6-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1516352307-20123-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:52690 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754217AbeASJES (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jan 2018 04:04:18 -0500
In-Reply-To: <1516352307-20123-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

Use ICPU macro to refactor code related to x86_cpu_id for better
readability.

Suggested-by: Andriy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 549ee5852d4f..da9326740647 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -33,6 +33,9 @@
 
 #include "intel_pmc_core.h"
 
+#define ICPU(cpu, data) \
+	{ X86_VENDOR_INTEL, 6, cpu, X86_FEATURE_MWAIT, (kernel_ulong_t)data }
+
 static struct pmc_dev pmc;
 
 static const struct pmc_bit_map spt_pll_map[] = {
@@ -439,14 +442,10 @@ static inline void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
 #endif /* CONFIG_DEBUG_FS */
 
 static const struct x86_cpu_id intel_pmc_core_ids[] = {
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_SKYLAKE_MOBILE, X86_FEATURE_MWAIT,
-		(kernel_ulong_t)&spt_reg_map},
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_SKYLAKE_DESKTOP, X86_FEATURE_MWAIT,
-		(kernel_ulong_t)&spt_reg_map},
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_KABYLAKE_MOBILE, X86_FEATURE_MWAIT,
-		(kernel_ulong_t)&spt_reg_map},
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_KABYLAKE_DESKTOP, X86_FEATURE_MWAIT,
-		(kernel_ulong_t)&spt_reg_map},
+	ICPU(INTEL_FAM6_SKYLAKE_MOBILE, &spt_reg_map),
+	ICPU(INTEL_FAM6_SKYLAKE_DESKTOP, &spt_reg_map),
+	ICPU(INTEL_FAM6_KABYLAKE_MOBILE, &spt_reg_map),
+	ICPU(INTEL_FAM6_KABYLAKE_DESKTOP, &spt_reg_map),
 	{}
 };
 
-- 
2.7.4
