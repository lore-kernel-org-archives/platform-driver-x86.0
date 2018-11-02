From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [PATCH v3 2/3] platform/x86: intel_pmc_core: Fix LTR IGNORE Max offset
Date: Fri,  2 Nov 2018 15:57:02 +0530
Message-ID: <20181102102703.21846-2-rajneesh.bhardwaj@linux.intel.com>
References: <20181102102703.21846-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181102102703.21846-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Cannonlake PCH allows us to ignore LTR from more IPs than Sunrisepoint
PCH so make the LTR ignore platform specific.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 4 +++-
 drivers/platform/x86/intel_pmc_core.h | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 69270888558b..11e8ecde95f0 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -148,6 +148,7 @@ static const struct pmc_reg_map spt_reg_map = {
 	.ppfear_buckets = SPT_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = SPT_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = SPT_PMC_READ_DISABLE_BIT,
+	.ltr_ignore_max = SPT_NUM_IP_IGN_ALLOWED,
 };
 
 /* Cannonlake: PGD PFET Enable Ack Status Register(s) bitmap */
@@ -319,6 +320,7 @@ static const struct pmc_reg_map cnp_reg_map = {
 	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
+	.ltr_ignore_max = CNP_NUM_IP_IGN_ALLOWED,
 };
 
 static inline u8 pmc_core_reg_read_byte(struct pmc_dev *pmcdev, int offset)
@@ -565,7 +567,7 @@ static ssize_t pmc_core_ltr_ignore_write(struct file *file, const char __user
 		goto out_unlock;
 	}
 
-	if (val > NUM_IP_IGN_ALLOWED) {
+	if (val > map->ltr_ignore_max) {
 		err = -EINVAL;
 		goto out_unlock;
 	}
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index 7a00436e337d..7f8181057ec8 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -44,7 +44,7 @@
 #define SPT_PMC_READ_DISABLE_BIT		0x16
 #define SPT_PMC_MSG_FULL_STS_BIT		0x18
 #define NUM_RETRIES				100
-#define NUM_IP_IGN_ALLOWED			17
+#define SPT_NUM_IP_IGN_ALLOWED			17
 
 #define SPT_PMC_LTR_CUR_PLT			0x350
 #define SPT_PMC_LTR_CUR_ASLT			0x354
@@ -154,6 +154,7 @@ enum ppfear_regs {
 #define CNP_PPFEAR_NUM_ENTRIES			8
 #define CNP_PMC_READ_DISABLE_BIT		22
 #define CNP_PMC_LATCH_SLPS0_EVENTS		BIT(31)
+#define CNP_NUM_IP_IGN_ALLOWED			19
 #define CNP_PMC_LTR_CUR_PLT			0x1B50
 #define CNP_PMC_LTR_CUR_ASLT			0x1B54
 #define CNP_PMC_LTR_SPA				0x1B60
@@ -216,6 +217,7 @@ struct pmc_reg_map {
 	const u32 pm_cfg_offset;
 	const int pm_read_disable_bit;
 	const u32 slps0_dbg_offset;
+	const u32 ltr_ignore_max;
 };
 
 /**
-- 
2.17.1
