From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/4] platform/x86: ideapad-laptop: Re-use DEFINE_SHOW_ATTRIBUTE() macro
Date: Mon, 22 Jan 2018 18:05:45 +0200
Message-ID: <20180122160546.51611-3-andriy.shevchenko@linux.intel.com>
References: <20180122160546.51611-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180122160546.51611-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

...instead of open coding file operations followed by custom ->open()
callbacks per each attribute.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/ideapad-laptop.c | 28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 5ab638d4d243..7e9e9bf78f1d 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -284,19 +284,7 @@ static int debugfs_status_show(struct seq_file *s, void *data)
 
 	return 0;
 }
-
-static int debugfs_status_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, debugfs_status_show, inode->i_private);
-}
-
-static const struct file_operations debugfs_status_fops = {
-	.owner = THIS_MODULE,
-	.open = debugfs_status_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(debugfs_status);
 
 static int debugfs_cfg_show(struct seq_file *s, void *data)
 {
@@ -337,19 +325,7 @@ static int debugfs_cfg_show(struct seq_file *s, void *data)
 	}
 	return 0;
 }
-
-static int debugfs_cfg_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, debugfs_cfg_show, inode->i_private);
-}
-
-static const struct file_operations debugfs_cfg_fops = {
-	.owner = THIS_MODULE,
-	.open = debugfs_cfg_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(debugfs_cfg);
 
 static int ideapad_debugfs_init(struct ideapad_private *priv)
 {
-- 
2.15.1
