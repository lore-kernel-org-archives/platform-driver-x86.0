From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v2 4/4] platform/x86: intel_telemetry: Remove redundancies
Date: Tue, 21 Nov 2017 20:06:24 +0530
Message-ID: <1511274984-6165-5-git-send-email-souvik.k.chakravarty@intel.com>
References: <1511274984-6165-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511274984-6165-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch removes unnecessary header files and newlines.
It also fixes some alignment issues.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

Changes since v1:
 * Consolidated alignment changes into this patch

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index ab4a20f..6e0a9dd 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -23,7 +23,6 @@
  */
 #include <linux/debugfs.h>
 #include <linux/device.h>
-#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
@@ -32,11 +31,10 @@
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include <asm/intel_pmc_ipc.h>
-#include <asm/intel_punit_ipc.h>
 #include <asm/intel_telemetry.h>
 
-#define DRIVER_NAME	"telemetry_soc_debugfs"
-#define DRIVER_VERSION	"1.0.0"
+#define DRIVER_NAME			"telemetry_soc_debugfs"
+#define DRIVER_VERSION			"1.0.0"
 
 /* ApolloLake SoC Event-IDs */
 #define TELEM_APL_PSS_PSTATES_ID	0x2802
@@ -246,7 +244,6 @@ static struct telem_ioss_pg_info telem_apl_ioss_pg_data[] = {
 	{"PRTC",	25},
 };
 
-
 struct telemetry_debugfs_conf {
 	struct telemetry_susp_stats suspend_stats;
 	struct dentry *telemetry_dbg_dir;
@@ -381,7 +378,6 @@ static int telem_pss_states_show(struct seq_file *s, void *unused)
 			TELEM_APL_MASK_PCS_STATE;
 		}
 
-
 		TELEM_CHECK_AND_PARSE_EVTS(conf->pss_idle_id,
 					   conf->pss_idle_evts - 1,
 					   pss_idle, evtlog[index].telem_evtlog,
@@ -401,7 +397,6 @@ static int telem_pss_states_show(struct seq_file *s, void *unused)
 					   conf->pcs_s0ix_blkd_data,
 					   TELEM_MASK_BYTE);
 
-
 		TELEM_CHECK_AND_PARSE_EVTS(conf->pss_wakeup_id,
 					   conf->pss_wakeup_evts,
 					   pss_s0ix_wakeup,
@@ -494,7 +489,6 @@ static const struct file_operations telem_pss_ops = {
 	.release	= single_release,
 };
 
-
 static int telem_ioss_states_show(struct seq_file *s, void *unused)
 {
 	struct telemetry_evtlog evtlog[TELEM_MAX_OS_ALLOCATED_EVENTS];
@@ -613,7 +607,7 @@ static int telem_soc_states_show(struct seq_file *s, void *unused)
 		   (u64)(conf->suspend_stats.deep_res*10)/192);
 
 	seq_printf(s, "TOTAL S0IX\t\t\t %10u\t %10llu\n", s0ix_total_ctr,
-				(u64)(s0ix_total_res*10/192));
+		   (u64)(s0ix_total_res*10/192));
 	seq_puts(s, "\n-------------------------------------------------\n");
 	seq_puts(s, "\t\tDEVICE STATES\n");
 	seq_puts(s, "-------------------------------------------------\n");
@@ -758,7 +752,6 @@ static const struct file_operations telem_pss_trc_verb_ops = {
 	.release	= single_release,
 };
 
-
 static int telem_ioss_trc_verb_show(struct seq_file *s, void *unused)
 {
 	u32 verbosity;
-- 
2.7.4
