From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 8/8] platform: x86: intel_telemetry: no need to check return value of debugfs_create functions
Date: Wed, 12 Jun 2019 14:12:58 +0200
Message-ID: <20190612121258.19535-8-gregkh@linuxfoundation.org>
References: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E. Box" <david.e.box@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Cc: "David E. Box" <david.e.box@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 .../platform/x86/intel_telemetry_debugfs.c    | 78 ++++---------------
 1 file changed, 16 insertions(+), 62 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index 98ba9185a27b..e84d3e983e0c 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -900,7 +900,7 @@ static int __init telemetry_debugfs_init(void)
 {
 	const struct x86_cpu_id *id;
 	int err;
-	struct dentry *f;
+	struct dentry *dir;
 
 	/* Only APL supported for now */
 	id = x86_match_cpu(telemetry_debugfs_cpu_ids);
@@ -923,68 +923,22 @@ static int __init telemetry_debugfs_init(void)
 
 	register_pm_notifier(&pm_notifier);
 
-	err = -ENOMEM;
-	debugfs_conf->telemetry_dbg_dir = debugfs_create_dir("telemetry", NULL);
-	if (!debugfs_conf->telemetry_dbg_dir)
-		goto out_pm;
-
-	f = debugfs_create_file("pss_info", S_IFREG | S_IRUGO,
-				debugfs_conf->telemetry_dbg_dir, NULL,
-				&telem_pss_states_fops);
-	if (!f) {
-		pr_err("pss_sample_info debugfs register failed\n");
-		goto out;
-	}
-
-	f = debugfs_create_file("ioss_info", S_IFREG | S_IRUGO,
-				debugfs_conf->telemetry_dbg_dir, NULL,
-				&telem_ioss_states_fops);
-	if (!f) {
-		pr_err("ioss_sample_info debugfs register failed\n");
-		goto out;
-	}
-
-	f = debugfs_create_file("soc_states", S_IFREG | S_IRUGO,
-				debugfs_conf->telemetry_dbg_dir,
-				NULL, &telem_soc_states_fops);
-	if (!f) {
-		pr_err("ioss_sample_info debugfs register failed\n");
-		goto out;
-	}
-
-	f = debugfs_create_file("s0ix_residency_usec", S_IFREG | S_IRUGO,
-				debugfs_conf->telemetry_dbg_dir,
-				NULL, &telem_s0ix_fops);
-	if (!f) {
-		pr_err("s0ix_residency_usec debugfs register failed\n");
-		goto out;
-	}
-
-	f = debugfs_create_file("pss_trace_verbosity", S_IFREG | S_IRUGO,
-				debugfs_conf->telemetry_dbg_dir, NULL,
-				&telem_pss_trc_verb_ops);
-	if (!f) {
-		pr_err("pss_trace_verbosity debugfs register failed\n");
-		goto out;
-	}
-
-	f = debugfs_create_file("ioss_trace_verbosity", S_IFREG | S_IRUGO,
-				debugfs_conf->telemetry_dbg_dir, NULL,
-				&telem_ioss_trc_verb_ops);
-	if (!f) {
-		pr_err("ioss_trace_verbosity debugfs register failed\n");
-		goto out;
-	}
-
+	dir = debugfs_create_dir("telemetry", NULL);
+	debugfs_conf->telemetry_dbg_dir = dir;
+
+	debugfs_create_file("pss_info", S_IFREG | S_IRUGO, dir, NULL,
+			    &telem_pss_states_fops);
+	debugfs_create_file("ioss_info", S_IFREG | S_IRUGO, dir, NULL,
+			    &telem_ioss_states_fops);
+	debugfs_create_file("soc_states", S_IFREG | S_IRUGO, dir, NULL,
+			    &telem_soc_states_fops);
+	debugfs_create_file("s0ix_residency_usec", S_IFREG | S_IRUGO, dir, NULL,
+			    &telem_s0ix_fops);
+	debugfs_create_file("pss_trace_verbosity", S_IFREG | S_IRUGO, dir, NULL,
+			    &telem_pss_trc_verb_ops);
+	debugfs_create_file("ioss_trace_verbosity", S_IFREG | S_IRUGO, dir,
+			    NULL, &telem_ioss_trc_verb_ops);
 	return 0;
-
-out:
-	debugfs_remove_recursive(debugfs_conf->telemetry_dbg_dir);
-	debugfs_conf->telemetry_dbg_dir = NULL;
-out_pm:
-	unregister_pm_notifier(&pm_notifier);
-
-	return err;
 }
 
 static void __exit telemetry_debugfs_exit(void)
-- 
2.22.0
