From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] platform/x86: intel_mid_powerbtn: Get rid of custom ICPU() macro
Date: Fri, 31 Aug 2018 11:34:31 +0300
Message-ID: <20180831083432.15872-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Replace custom grown macro with generic INTEL_CPU_FAM6() one.

No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index d79fbf924b13..c93299002169 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -121,12 +121,9 @@ static const struct mid_pb_ddata mrfld_ddata = {
 	.setup	= mrfld_setup,
 };
 
-#define ICPU(model, ddata)	\
-	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (kernel_ulong_t)&ddata }
-
 static const struct x86_cpu_id mid_pb_cpu_ids[] = {
-	ICPU(INTEL_FAM6_ATOM_PENWELL,		mfld_ddata),
-	ICPU(INTEL_FAM6_ATOM_MERRIFIELD,	mrfld_ddata),
+	INTEL_CPU_FAM6(ATOM_PENWELL,		mfld_ddata),
+	INTEL_CPU_FAM6(ATOM_MERRIFIELD,		mrfld_ddata),
 	{}
 };
 
-- 
2.18.0
