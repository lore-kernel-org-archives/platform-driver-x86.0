From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: pmc_atom: introduce DEFINE_SHOW_ATTRIBUTE() macro
Date: Tue, 19 Dec 2017 16:29:07 +0200
Message-ID: <20171219142907.18132-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:45987 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759630AbdLSO3L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 09:29:11 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This macro deduplicates a lot of similar code in the pmc_atom.c module.
Targeting to be moved to seq_file.h eventually.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/pmc_atom.c | 56 +++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 77bac859342d..4b3c37b6288c 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -208,6 +208,20 @@ static const struct pmc_data cht_data = {
 	.clks = cht_clks,
 };
 
+#define DEFINE_SHOW_ATTRIBUTE(__name)					\
+static int __name ## _open(struct inode *inode, struct file *file)	\
+{									\
+	return single_open(file, __name ## _show, inode->i_private);	\
+}									\
+									\
+static const struct file_operations __name ## _fops = {			\
+	.owner		= THIS_MODULE,					\
+	.open		= __name ## _open,				\
+	.read		= seq_read,					\
+	.llseek		= seq_lseek,					\
+	.release	= single_release,				\
+}
+
 static inline u32 pmc_reg_read(struct pmc_dev *pmc, int reg_offset)
 {
 	return readl(pmc->regmap + reg_offset);
@@ -309,17 +323,7 @@ static int pmc_dev_state_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int pmc_dev_state_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pmc_dev_state_show, inode->i_private);
-}
-
-static const struct file_operations pmc_dev_state_ops = {
-	.open		= pmc_dev_state_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(pmc_dev_state);
 
 static int pmc_pss_state_show(struct seq_file *s, void *unused)
 {
@@ -336,17 +340,7 @@ static int pmc_pss_state_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int pmc_pss_state_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pmc_pss_state_show, inode->i_private);
-}
-
-static const struct file_operations pmc_pss_state_ops = {
-	.open		= pmc_pss_state_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(pmc_pss_state);
 
 static int pmc_sleep_tmr_show(struct seq_file *s, void *unused)
 {
@@ -367,17 +361,7 @@ static int pmc_sleep_tmr_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int pmc_sleep_tmr_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, pmc_sleep_tmr_show, inode->i_private);
-}
-
-static const struct file_operations pmc_sleep_tmr_ops = {
-	.open		= pmc_sleep_tmr_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(pmc_sleep_tmr);
 
 static void pmc_dbgfs_unregister(struct pmc_dev *pmc)
 {
@@ -395,17 +379,17 @@ static int pmc_dbgfs_register(struct pmc_dev *pmc)
 	pmc->dbgfs_dir = dir;
 
 	f = debugfs_create_file("dev_state", S_IFREG | S_IRUGO,
-				dir, pmc, &pmc_dev_state_ops);
+				dir, pmc, &pmc_dev_state_fops);
 	if (!f)
 		goto err;
 
 	f = debugfs_create_file("pss_state", S_IFREG | S_IRUGO,
-				dir, pmc, &pmc_pss_state_ops);
+				dir, pmc, &pmc_pss_state_fops);
 	if (!f)
 		goto err;
 
 	f = debugfs_create_file("sleep_state", S_IFREG | S_IRUGO,
-				dir, pmc, &pmc_sleep_tmr_ops);
+				dir, pmc, &pmc_sleep_tmr_fops);
 	if (!f)
 		goto err;
 
-- 
2.15.1
