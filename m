From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH v1 4/5] platform/x86: intel_telemetry: Remove redundancies
Date: Thu, 16 Nov 2017 15:48:16 +0530
Message-ID: <1510827497-25188-5-git-send-email-souvik.k.chakravarty@intel.com>
References: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:25908 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934264AbdKPN6Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2017 08:58:25 -0500
In-Reply-To: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

This patch removes unnecessary header files and newlines.
It also fixes some alignment issues.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 drivers/platform/x86/intel_telemetry_debugfs.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index 60596a1..2a960f6 100644
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
@@ -252,7 +250,6 @@ static struct telem_ioss_pg_info telem_apl_ioss_pg_data[] = {
 	{"PRTC",	25},
 };
 
-
 struct telemetry_debugfs_conf {
 	struct telemetry_susp_stats suspend_stats;
 	struct dentry *telemetry_dbg_dir;
@@ -387,7 +384,6 @@ static int telem_pss_states_show(struct seq_file *s, void *unused)
 			TELEM_APL_MASK_PCS_STATE;
 		}
 
-
 		TELEM_CHECK_AND_PARSE_EVTS(conf->pss_idle_id,
 					   conf->pss_idle_evts - 1,
 					   pss_idle, evtlog[index].telem_evtlog,
@@ -407,7 +403,6 @@ static int telem_pss_states_show(struct seq_file *s, void *unused)
 					   conf->pcs_s0ix_blkd_data,
 					   TELEM_MASK_BYTE);
 
-
 		TELEM_CHECK_AND_PARSE_EVTS(conf->pss_wakeup_id,
 					   conf->pss_wakeup_evts,
 					   pss_s0ix_wakeup,
@@ -500,7 +495,6 @@ static const struct file_operations telem_pss_ops = {
 	.release	= single_release,
 };
 
-
 static int telem_ioss_states_show(struct seq_file *s, void *unused)
 {
 	struct telemetry_evtlog evtlog[TELEM_MAX_OS_ALLOCATED_EVENTS];
@@ -774,7 +768,6 @@ static const struct file_operations telem_pss_trc_verb_ops = {
 	.release	= single_release,
 };
 
-
 static int telem_ioss_trc_verb_show(struct seq_file *s, void *unused)
 {
 	u32 verbosity;
-- 
2.7.4
