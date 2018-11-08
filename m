From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [Patch v4 2/3] platform/x86: intel_pmc_core: Fix LTR IGNORE Max offset
Date: Fri,  9 Nov 2018 00:32:43 +0530
Message-ID: <20181108190244.19204-2-rajneesh.bhardwaj@linux.intel.com>
References: <20181108190244.19204-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108190244.19204-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, srinivas.pandruvada@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Cannonlake PCH allows us to ignore LTR from more IPs than Sunrisepoint
PCH so make the LTR ignore platform specific.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
 drivers/platform/x86/intel_pmc_core.c | 4 +++-
 drivers/platform/x86/intel_pmc_core.h | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 54080c0e52fb..0c18f328cd0d 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -137,6 +137,7 @@ static const struct pmc_reg_map spt_reg_map = {
 	.ppfear_buckets = SPT_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = SPT_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = SPT_PMC_READ_DISABLE_BIT,
+	.ltr_ignore_max = SPT_NUM_IP_IGN_ALLOWED,
 };
 
 /* Cannonlake: PGD PFET Enable Ack Status Register(s) bitmap */
@@ -307,6 +308,7 @@ static const struct pmc_reg_map cnp_reg_map = {
 	.ppfear_buckets = CNP_PPFEAR_NUM_ENTRIES,
 	.pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
 	.pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
+	.ltr_ignore_max = CNP_NUM_IP_IGN_ALLOWED,
 };
 
 static inline u8 pmc_core_reg_read_byte(struct pmc_dev *pmcdev, int offset)
@@ -553,7 +555,7 @@ static ssize_t pmc_core_ltr_ignore_write(struct file *file, const char __user
 		goto out_unlock;
 	}
 
-	if (val > NUM_IP_IGN_ALLOWED) {
+	if (val > map->ltr_ignore_max) {
 		err = -EINVAL;
 		goto out_unlock;
 	}
diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
index fcb13ca1f2bd..e57b26cdb442 100644
--- a/drivers/platform/x86/intel_pmc_core.h
+++ b/drivers/platform/x86/intel_pmc_core.h
@@ -35,7 +35,7 @@
 #define SPT_PMC_READ_DISABLE_BIT		0x16
 #define SPT_PMC_MSG_FULL_STS_BIT		0x18
 #define NUM_RETRIES				100
-#define NUM_IP_IGN_ALLOWED			17
+#define SPT_NUM_IP_IGN_ALLOWED			17
 
 #define SPT_PMC_LTR_CUR_PLT			0x350
 #define SPT_PMC_LTR_CUR_ASLT			0x354
@@ -146,6 +146,7 @@ enum ppfear_regs {
 #define CNP_PMC_MMIO_REG_LEN			0x2000
 #define CNP_PPFEAR_NUM_ENTRIES			8
 #define CNP_PMC_READ_DISABLE_BIT		22
+#define CNP_NUM_IP_IGN_ALLOWED			19
 #define CNP_PMC_LTR_CUR_PLT			0x1B50
 #define CNP_PMC_LTR_CUR_ASLT			0x1B54
 #define CNP_PMC_LTR_SPA				0x1B60
@@ -208,6 +209,7 @@ struct pmc_reg_map {
 	const u32 pm_cfg_offset;
 	const int pm_read_disable_bit;
 	const u32 slps0_dbg_offset;
+	const u32 ltr_ignore_max;
 };
 
 /**
-- 
2.17.1
