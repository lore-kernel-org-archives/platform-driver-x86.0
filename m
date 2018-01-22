From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] seq_file: Introduce DEFINE_SHOW_ATTRIBUTE() helper macro
Date: Mon, 22 Jan 2018 18:05:43 +0200
Message-ID: <20180122160546.51611-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:22281 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751070AbeAVQGB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 11:06:01 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The DEFINE_SHOW_ATTRIBUTE() helper macro would be useful for current
users, which are many of them, and for new comers to decrease code
duplication.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/ab8500-debugfs.c    | 14 --------------
 drivers/platform/x86/pmc_atom.c | 14 --------------
 include/linux/seq_file.h        | 14 ++++++++++++++
 net/bluetooth/hci_debugfs.c     | 13 -------------
 4 files changed, 14 insertions(+), 41 deletions(-)

diff --git a/drivers/mfd/ab8500-debugfs.c b/drivers/mfd/ab8500-debugfs.c
index f66c458228ec..d878a599c87f 100644
--- a/drivers/mfd/ab8500-debugfs.c
+++ b/drivers/mfd/ab8500-debugfs.c
@@ -1258,20 +1258,6 @@ static struct ab8500_prcmu_ranges ab8540_debug_ranges[AB8500_NUM_BANKS] = {
 	},
 };
 
-#define DEFINE_SHOW_ATTRIBUTE(__name)					      \
-static int __name ## _open(struct inode *inode, struct file *file)	      \
-{									      \
-	return single_open(file, __name ## _show, inode->i_private);	      \
-}									      \
-									      \
-static const struct file_operations __name ## _fops = {			      \
-	.owner		= THIS_MODULE,					      \
-	.open		= __name ## _open,				      \
-	.read		= seq_read,					      \
-	.llseek		= seq_lseek,					      \
-	.release	= single_release,				      \
-}									      \
-
 static irqreturn_t ab8500_debug_handler(int irq, void *data)
 {
 	char buf[16];
diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 4b3c37b6288c..8f018b3f3cd4 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -208,20 +208,6 @@ static const struct pmc_data cht_data = {
 	.clks = cht_clks,
 };
 
-#define DEFINE_SHOW_ATTRIBUTE(__name)					\
-static int __name ## _open(struct inode *inode, struct file *file)	\
-{									\
-	return single_open(file, __name ## _show, inode->i_private);	\
-}									\
-									\
-static const struct file_operations __name ## _fops = {			\
-	.owner		= THIS_MODULE,					\
-	.open		= __name ## _open,				\
-	.read		= seq_read,					\
-	.llseek		= seq_lseek,					\
-	.release	= single_release,				\
-}
-
 static inline u32 pmc_reg_read(struct pmc_dev *pmc, int reg_offset)
 {
 	return readl(pmc->regmap + reg_offset);
diff --git a/include/linux/seq_file.h b/include/linux/seq_file.h
index 802e6944b6ce..11e051388f54 100644
--- a/include/linux/seq_file.h
+++ b/include/linux/seq_file.h
@@ -147,6 +147,20 @@ void *__seq_open_private(struct file *, const struct seq_operations *, int);
 int seq_open_private(struct file *, const struct seq_operations *, int);
 int seq_release_private(struct inode *, struct file *);
 
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
 static inline struct user_namespace *seq_user_ns(struct seq_file *seq)
 {
 #ifdef CONFIG_USER_NS
diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
index 57403bd567d0..418b76e557b0 100644
--- a/net/bluetooth/hci_debugfs.c
+++ b/net/bluetooth/hci_debugfs.c
@@ -90,19 +90,6 @@ static int __name ## _show(struct seq_file *f, void *ptr)		      \
 									      \
 DEFINE_SHOW_ATTRIBUTE(__name)
 
-#define DEFINE_SHOW_ATTRIBUTE(__name)					      \
-static int __name ## _open(struct inode *inode, struct file *file)	      \
-{									      \
-	return single_open(file, __name ## _show, inode->i_private);	      \
-}									      \
-									      \
-static const struct file_operations __name ## _fops = {			      \
-	.open		= __name ## _open,				      \
-	.read		= seq_read,					      \
-	.llseek		= seq_lseek,					      \
-	.release	= single_release,				      \
-}									      \
-
 static int features_show(struct seq_file *f, void *ptr)
 {
 	struct hci_dev *hdev = f->private;
-- 
2.15.1
