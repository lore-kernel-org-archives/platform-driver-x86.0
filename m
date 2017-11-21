From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v2 3/4] platform/x86: intel_telemetry: Improve S0ix logs
Date: Tue, 21 Nov 2017 20:06:23 +0530
Message-ID: <1511274984-6165-4-git-send-email-souvik.k.chakravarty@intel.com>
References: <1511274984-6165-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:21621 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753023AbdKUGaZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Nov 2017 01:30:25 -0500
In-Reply-To: <1511274984-6165-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Suspend with shallow wakes is not a useful parameter since the phenomena
does not exist on deployed devices and is only a parameter of use during
device power-on phase. The field always reads zero. Additionally there
are other easier methods to detect it, e.g., if the S0ix counter
increments by more than one during suspend. Hence the field is superfluous
and can be removed.

This patch also slightly renames the S0ix total field for better
viewability.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 45 ++++----------------------
 1 file changed, 7 insertions(+), 38 deletions(-)

Changes since v1:
 * Remove alignment changes from this patch

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index d7e90fd..ab4a20f 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -98,10 +98,6 @@ static u32 suspend_shlw_ctr_temp, suspend_deep_ctr_temp;
 static u64 suspend_shlw_res_temp, suspend_deep_res_temp;
 
 struct telemetry_susp_stats {
-	u32 shlw_swake_ctr;
-	u32 deep_swake_ctr;
-	u64 shlw_swake_res;
-	u64 deep_swake_res;
 	u32 shlw_ctr;
 	u32 deep_ctr;
 	u64 shlw_res;
@@ -598,19 +594,15 @@ static int telem_soc_states_show(struct seq_file *s, void *unused)
 
 	seq_printf(s, "S0IX Shallow\t\t\t %10u\t %10llu\n",
 		   s0ix_shlw_ctr -
-		   conf->suspend_stats.shlw_ctr -
-		   conf->suspend_stats.shlw_swake_ctr,
+		   conf->suspend_stats.shlw_ctr,
 		   (u64)((s0ix_shlw_res -
-		   conf->suspend_stats.shlw_res -
-		   conf->suspend_stats.shlw_swake_res)*10/192));
+		   conf->suspend_stats.shlw_res)*10/192));
 
 	seq_printf(s, "S0IX Deep\t\t\t %10u\t %10llu\n",
 		   s0ix_deep_ctr -
-		   conf->suspend_stats.deep_ctr -
-		   conf->suspend_stats.deep_swake_ctr,
+		   conf->suspend_stats.deep_ctr,
 		   (u64)((s0ix_deep_res -
-		   conf->suspend_stats.deep_res -
-		   conf->suspend_stats.deep_swake_res)*10/192));
+		   conf->suspend_stats.deep_res)*10/192));
 
 	seq_printf(s, "Suspend(With S0ixShallow)\t %10u\t %10llu\n",
 		   conf->suspend_stats.shlw_ctr,
@@ -620,13 +612,7 @@ static int telem_soc_states_show(struct seq_file *s, void *unused)
 		   conf->suspend_stats.deep_ctr,
 		   (u64)(conf->suspend_stats.deep_res*10)/192);
 
-	seq_printf(s, "Suspend(With Shallow-Wakes)\t %10u\t %10llu\n",
-		   conf->suspend_stats.shlw_swake_ctr +
-		   conf->suspend_stats.deep_swake_ctr,
-		   (u64)((conf->suspend_stats.shlw_swake_res +
-		   conf->suspend_stats.deep_swake_res)*10/192));
-
-	seq_printf(s, "S0IX+Suspend Total\t\t %10u\t %10llu\n", s0ix_total_ctr,
+	seq_printf(s, "TOTAL S0IX\t\t\t %10u\t %10llu\n", s0ix_total_ctr,
 				(u64)(s0ix_total_res*10/192));
 	seq_puts(s, "\n-------------------------------------------------\n");
 	seq_puts(s, "\t\tDEVICE STATES\n");
@@ -920,23 +906,15 @@ static int pm_suspend_exit_cb(void)
 	suspend_shlw_res_exit -= suspend_shlw_res_temp;
 	suspend_deep_res_exit -= suspend_deep_res_temp;
 
-	if (suspend_shlw_ctr_exit == 1) {
+	if (suspend_shlw_ctr_exit != 0) {
 		conf->suspend_stats.shlw_ctr +=
 		suspend_shlw_ctr_exit;
 
 		conf->suspend_stats.shlw_res +=
 		suspend_shlw_res_exit;
 	}
-	/* Shallow Wakes Case */
-	else if (suspend_shlw_ctr_exit > 1) {
-		conf->suspend_stats.shlw_swake_ctr +=
-		suspend_shlw_ctr_exit;
-
-		conf->suspend_stats.shlw_swake_res +=
-		suspend_shlw_res_exit;
-	}
 
-	if (suspend_deep_ctr_exit == 1) {
+	if (suspend_deep_ctr_exit != 0) {
 		conf->suspend_stats.deep_ctr +=
 		suspend_deep_ctr_exit;
 
@@ -944,15 +922,6 @@ static int pm_suspend_exit_cb(void)
 		suspend_deep_res_exit;
 	}
 
-	/* Shallow Wakes Case */
-	else if (suspend_deep_ctr_exit > 1) {
-		conf->suspend_stats.deep_swake_ctr +=
-		suspend_deep_ctr_exit;
-
-		conf->suspend_stats.deep_swake_res +=
-		suspend_deep_res_exit;
-	}
-
 out:
 	suspend_prep_ok = 0;
 	return NOTIFY_OK;
-- 
2.7.4
