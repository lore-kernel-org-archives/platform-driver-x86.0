From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: [PATCH] x86/intel_telemetry: Add debugfs entry for S0ix residency
Date: Thu, 22 Jun 2017 19:11:58 +0530
Message-ID: <1498138918-30544-1-git-send-email-rajneesh.bhardwaj@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, shanth.murthy@intel.com, souvik.k.chakravarty@intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

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
 drivers/platform/x86/intel_telemetry_debugfs.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index efc0140..2eacb16 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -713,6 +713,24 @@ static int telem_soc_state_open(struct inode *inode, struct file *file)
 	.release	= single_release,
 };
 
+static int telem_s0ix_res_get(void *data, u64 *val)
+{
+	u64 s0ix_total_res = 0;
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
+		pr_err("s0ix_residency_us debugfs register failed\n");
+		goto out;
+	}
+
 	f = debugfs_create_file("pss_trace_verbosity", S_IFREG | S_IRUGO,
 				debugfs_conf->telemetry_dbg_dir, NULL,
 				&telem_pss_trc_verb_ops);
-- 
1.9.1
