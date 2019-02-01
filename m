From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [PATCH 03/10] platform/x86: intel_pmc_core: Fix PCH IP name
Date: Fri,  1 Feb 2019 13:02:27 +0530
Message-ID: <20190201073234.13280-4-rajneesh.bhardwaj@linux.intel.com>
References: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E. Box" <david.e.box@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

For Cannonlake and Icelake, the IP name for Res_6 should be SPF i.e.
South Port F. No functional change is intended other than just renaming
the IP appropriately.

Cc: "David E. Box" <david.e.box@intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Fixes: 291101f6a735 ("platform/x86: intel_pmc_core: Add CannonLake PCH support")
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 9f143cdbea05..80936e6bdc61 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -203,7 +203,7 @@ static const struct pmc_bit_map cnp_pfear_map[] = {
 	{"CNVI",                BIT(3)},
 	{"UFS0",                BIT(4)},
 	{"EMMC",                BIT(5)},
-	{"Res_6",               BIT(6)},
+	{"SPF",			BIT(6)},
 	{"SBR6",                BIT(7)},
 
 	{"SBR7",                BIT(0)},
-- 
2.17.1
