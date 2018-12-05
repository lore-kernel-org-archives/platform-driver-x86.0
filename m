From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 2/2] platform/x86: intel_telemetry: convert to DEFINE_SHOW_ATTRIBUTE
Date: Wed,  5 Dec 2018 10:12:55 -0500
Message-ID: <20181205151255.15367-2-tiny.windzz@gmail.com>
References: <20181205151255.15367-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205151255.15367-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@intel.com, vishwanath.somayaji@intel.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 .../platform/x86/intel_telemetry_debugfs.c    | 42 +++----------------
 1 file changed, 6 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index 40bce560eb30..98ba9185a27b 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -466,17 +466,7 @@ static int telem_pss_states_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int telem_pss_state_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, telem_pss_states_show, inode->i_private);
-}
-
-static const struct file_operations telem_pss_ops = {
-	.open		= telem_pss_state_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(telem_pss_states);
 
 static int telem_ioss_states_show(struct seq_file *s, void *unused)
 {
@@ -505,17 +495,7 @@ static int telem_ioss_states_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int telem_ioss_state_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, telem_ioss_states_show, inode->i_private);
-}
-
-static const struct file_operations telem_ioss_ops = {
-	.open		= telem_ioss_state_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(telem_ioss_states);
 
 static int telem_soc_states_show(struct seq_file *s, void *unused)
 {
@@ -664,17 +644,7 @@ static int telem_soc_states_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int telem_soc_state_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, telem_soc_states_show, inode->i_private);
-}
-
-static const struct file_operations telem_socstate_ops = {
-	.open		= telem_soc_state_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(telem_soc_states);
 
 static int telem_s0ix_res_get(void *data, u64 *val)
 {
@@ -960,7 +930,7 @@ static int __init telemetry_debugfs_init(void)
 
 	f = debugfs_create_file("pss_info", S_IFREG | S_IRUGO,
 				debugfs_conf->telemetry_dbg_dir, NULL,
-				&telem_pss_ops);
+				&telem_pss_states_fops);
 	if (!f) {
 		pr_err("pss_sample_info debugfs register failed\n");
 		goto out;
@@ -968,7 +938,7 @@ static int __init telemetry_debugfs_init(void)
 
 	f = debugfs_create_file("ioss_info", S_IFREG | S_IRUGO,
 				debugfs_conf->telemetry_dbg_dir, NULL,
-				&telem_ioss_ops);
+				&telem_ioss_states_fops);
 	if (!f) {
 		pr_err("ioss_sample_info debugfs register failed\n");
 		goto out;
@@ -976,7 +946,7 @@ static int __init telemetry_debugfs_init(void)
 
 	f = debugfs_create_file("soc_states", S_IFREG | S_IRUGO,
 				debugfs_conf->telemetry_dbg_dir,
-				NULL, &telem_socstate_ops);
+				NULL, &telem_soc_states_fops);
 	if (!f) {
 		pr_err("ioss_sample_info debugfs register failed\n");
 		goto out;
-- 
2.17.0
