From: Gaurav Singh <gaurav1086@gmail.com>
Subject: [PATCH] [drivers/x86] fix bound check in pmc_core_mphy_pg_show
Date: Tue, 23 Jun 2020 23:31:25 -0400
Message-ID: <20200624033126.5972-1-gaurav1086@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gaurav1086@gmail.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:INTEL PMC CORE DRIVER" <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Check bounds before accessing map[].

Signed-off-by: Gaurav Singh <gaurav1086@gmail.com>
---
 drivers/platform/x86/intel_pmc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 7c8bdab078cf..f571f9cf7217 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -795,7 +795,7 @@ static int pmc_core_mphy_pg_show(struct seq_file *s, void *unused)
 	msleep(10);
 	val_high = pmc_core_reg_read(pmcdev, SPT_PMC_MFPMC_OFFSET);
 
-	for (index = 0; map[index].name && index < 8; index++) {
+	for (index = 0; index < 8 && map[index].name; index++) {
 		seq_printf(s, "%-32s\tState: %s\n",
 			   map[index].name,
 			   map[index].bit_mask & val_low ? "Not power gated" :
-- 
2.17.1
