From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] platform/x86: convert to DEFINE_SHOW_ATTRIBUTE
Date: Sat,  1 Dec 2018 10:52:29 -0500
Message-ID: <20181201155229.8532-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@intel.com, vishwanath.somayaji@intel.com, dvhart@infradead.org, andy@infradead.org, david.e.box@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/platform/x86/intel_pmc_core.c         | 46 ++++---------------
 .../platform/x86/intel_telemetry_debugfs.c    | 42 +++--------------
 2 files changed, 14 insertions(+), 74 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 6b31d410cb09..95311ad6ec6f 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -311,7 +311,7 @@ static void pmc_core_display_map(struct seq_file *s, int index,
 		   pf_map[index].bit_mask & pf_reg ? "Off" : "On");
 }
 
-static int pmc_core_ppfear_sts_show(struct seq_file *s, void *unused)
+static int pmc_core_ppfear_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
 	const struct pmc_bit_map *map = pmcdev->map->pfear_sts;
@@ -330,17 +330,7 @@ static int pmc_core_ppfear_sts_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int pmc_core_ppfear_sts_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pmc_core_ppfear_sts_show, inode->i_private);
-}
-
-static const struct file_operations pmc_core_ppfear_ops = {
-	.open           = pmc_core_ppfear_sts_open,
-	.read           = seq_read,
-	.llseek         = seq_lseek,
-	.release        = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(pmc_core_ppfear);
 
 /* This function should return link status, 0 means ready */
 static int pmc_core_mtpmc_link_status(void)
@@ -372,7 +362,7 @@ static int pmc_core_send_msg(u32 *addr_xram)
 	return 0;
 }
 
-static int pmc_core_mphy_pg_sts_show(struct seq_file *s, void *unused)
+static int pmc_core_mphy_pg_show(struct seq_file *s, void *unused)
 {
 	struct pmc_dev *pmcdev = s->private;
 	const struct pmc_bit_map *map = pmcdev->map->mphy_sts;
@@ -425,17 +415,7 @@ static int pmc_core_mphy_pg_sts_show(struct seq_file *s, void *unused)
 	return err;
 }
 
-static int pmc_core_mphy_pg_sts_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pmc_core_mphy_pg_sts_show, inode->i_private);
-}
-
-static const struct file_operations pmc_core_mphy_pg_ops = {
-	.open           = pmc_core_mphy_pg_sts_open,
-	.read           = seq_read,
-	.llseek         = seq_lseek,
-	.release        = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(pmc_core_mphy_pg);
 
 static int pmc_core_pll_show(struct seq_file *s, void *unused)
 {
@@ -472,17 +452,7 @@ static int pmc_core_pll_show(struct seq_file *s, void *unused)
 	return err;
 }
 
-static int pmc_core_pll_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pmc_core_pll_show, inode->i_private);
-}
-
-static const struct file_operations pmc_core_pll_ops = {
-	.open           = pmc_core_pll_open,
-	.read           = seq_read,
-	.llseek         = seq_lseek,
-	.release        = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(pmc_core_pll);
 
 static ssize_t pmc_core_ltr_ignore_write(struct file *file, const char __user
 *userbuf, size_t count, loff_t *ppos)
@@ -602,19 +572,19 @@ static int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
 			    &pmc_core_dev_state);
 
 	debugfs_create_file("pch_ip_power_gating_status", 0444, dir, pmcdev,
-			    &pmc_core_ppfear_ops);
+			    &pmc_core_ppfear_fops);
 
 	debugfs_create_file("ltr_ignore", 0644, dir, pmcdev,
 			    &pmc_core_ltr_ignore_ops);
 
 	if (pmcdev->map->pll_sts)
 		debugfs_create_file("pll_status", 0444, dir, pmcdev,
-				    &pmc_core_pll_ops);
+				    &pmc_core_pll_fops);
 
 	if (pmcdev->map->mphy_sts)
 		debugfs_create_file("mphy_core_lanes_power_gating_status",
 				    0444, dir, pmcdev,
-				    &pmc_core_mphy_pg_ops);
+				    &pmc_core_mphy_pg_fops);
 
 	if (pmcdev->map->slps0_dbg_maps) {
 		debugfs_create_file("slp_s0_debug_status", 0444,
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
