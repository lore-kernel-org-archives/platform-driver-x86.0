From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH v2] x86/intel_telemetry: Add debugfs entry for S0ix residency
Date: Fri, 23 Jun 2017 22:22:35 +0530
Message-ID: <1498236755-30763-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:50505 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752116AbdFWQwq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Jun 2017 12:52:46 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, shanth.murthy@intel.com, souvik.k.chakravarty@intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

This adds a debugfs consumer for the exported kernel API
intel_pmc_read_s0ix_residency. This debugfs entry reads S0ix residency
directly from the PMC hardware counters.

TEST:
- echo freeze > /sys/power/state
- Wake the system, read the S0ix residency i.e.
  cat /sys/kernel/debug/telemetry/s0ix_residency_usec

Signed-off-by: Shanth Murthy <shanth.murthy@intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
---
Changes in v2:
 * Fixed typo in pr_err :- Changed s0ix_residency_us to s0ix_residency_usec
 * Minor change w.r.t s0ix_total_res variable declaration

 drivers/platform/x86/intel_telemetry_debugfs.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index efc0140..a4267b8 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -713,6 +713,24 @@ static int telem_soc_state_open(struct inode *inode, struct file *file)
 	.release	= single_release,
 };
 
+static int telem_s0ix_res_get(void *data, u64 *val)
+{
+	u64 s0ix_total_res;
+	int ret;
+
+	ret = intel_pmc_s0ix_counter_read(&s0ix_total_res);
+	if (ret) {
+		pr_err("Failed to read S0ix residency");
+		return ret;
+	}
+
+	*val = s0ix_total_res;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(telem_s0ix_fops, telem_s0ix_res_get, NULL, "%llu\n");
+
 static int telem_pss_trc_verb_show(struct seq_file *s, void *unused)
 {
 	u32 verbosity;
@@ -994,6 +1012,14 @@ static int __init telemetry_debugfs_init(void)
 		goto out;
 	}
 
+	f = debugfs_create_file("s0ix_residency_usec", S_IFREG | S_IRUGO,
+				debugfs_conf->telemetry_dbg_dir,
+				NULL, &telem_s0ix_fops);
+	if (!f) {
+		pr_err("s0ix_residency_usec debugfs register failed\n");
+		goto out;
+	}
+
 	f = debugfs_create_file("pss_trace_verbosity", S_IFREG | S_IRUGO,
 				debugfs_conf->telemetry_dbg_dir, NULL,
 				&telem_pss_trc_verb_ops);
-- 
1.9.1
