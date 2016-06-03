From: Dave Hansen <dave@sr71.net>
Subject: [PATCH 16/20] x86, pmc_core: use Intel family name macros for pmc_core driver
Date: Thu, 02 Jun 2016 17:19:49 -0700
Message-ID: <20160603001949.7D5B9534@viggo.jf.intel.com>
References: <20160603001927.F2A7D828@viggo.jf.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160603001927.F2A7D828@viggo.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, jacob.jun.pan@intel.com, Dave Hansen <dave@sr71.net>, dave.hansen@linux.intel.com, dvhart@infradead.org, rajneesh.bhardwaj@intel.com, vishwanath.somayaji@intel.com, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


From: Dave Hansen <dave.hansen@linux.intel.com>

Another straightforward replacement of magic numbers.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Acked-by: Darren Hart <dvhart@infradead.org>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Vishwanath Somayaji <vishwanath.somayaji@intel.com>
Cc: platform-driver-x86@vger.kernel.org
---

 b/drivers/platform/x86/intel_pmc_core.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff -puN drivers/platform/x86/intel_pmc_core.c~x86-intel-families-pmc_core drivers/platform/x86/intel_pmc_core.c
--- a/drivers/platform/x86/intel_pmc_core.c~x86-intel-families-pmc_core	2016-06-02 15:19:22.437405579 -0700
+++ b/drivers/platform/x86/intel_pmc_core.c	2016-06-02 15:19:22.440405715 -0700
@@ -26,6 +26,7 @@
 #include <linux/seq_file.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
 #include <asm/pmc_core.h>
 
 #include "intel_pmc_core.h"
@@ -138,10 +139,10 @@ static inline void pmc_core_dbgfs_unregi
 #endif /* CONFIG_DEBUG_FS */
 
 static const struct x86_cpu_id intel_pmc_core_ids[] = {
-	{ X86_VENDOR_INTEL, 6, 0x4e, X86_FEATURE_MWAIT,
-		(kernel_ulong_t)NULL}, /* Skylake CPUID Signature */
-	{ X86_VENDOR_INTEL, 6, 0x5e, X86_FEATURE_MWAIT,
-		(kernel_ulong_t)NULL}, /* Skylake CPUID Signature */
+	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_SKYLAKE_MOBILE, X86_FEATURE_MWAIT,
+		(kernel_ulong_t)NULL},
+	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_SKYLAKE_DESKTOP, X86_FEATURE_MWAIT,
+		(kernel_ulong_t)NULL},
 	{}
 };
 
_
