From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v1 2/6] platform/x86: intel_pmc_core: Remove unused variable
Date: Thu, 11 Jan 2018 16:40:32 +0530
Message-ID: <1515669036-3465-3-git-send-email-rajneesh.bhardwaj@intel.com>
References: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515669036-3465-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, vishwanath.somayaji@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

base_address field is redundant and unused in the driver so get rid of it.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
 drivers/platform/x86/intel_pmc_core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index ecff50356c71..c6169fe0edf2 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -135,7 +135,6 @@ struct pmc_bit_map {
  * @pll_sts:		Maps name of PLL to corresponding bit status
  * @slp_s0_offset:	PWRMBASE offset to read SLP_S0 residency
  * @ltr_ignore_offset:	PWRMBASE offset to read/write LTR ignore bit
- * @base_address:	Base address of PWRMBASE defined in BIOS writer guide
  * @regmap_length:	Length of memory to map from PWRMBASE address to access
  * @ppfear0_offset:	PWRMBASE offset to to read PPFEAR*
  * @ppfear_buckets:	Number of 8 bits blocks to read all IP blocks from
@@ -152,7 +151,6 @@ struct pmc_reg_map {
 	const struct pmc_bit_map *pll_sts;
 	const u32 slp_s0_offset;
 	const u32 ltr_ignore_offset;
-	const u32 base_address;
 	const int regmap_length;
 	const u32 ppfear0_offset;
 	const int ppfear_buckets;
-- 
2.7.4
