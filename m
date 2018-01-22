From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/4] platform/x86: dell-laptop: Re-use DEFINE_SHOW_ATTRIBUTE() macro
Date: Mon, 22 Jan 2018 18:05:44 +0200
Message-ID: <20180122160546.51611-2-andriy.shevchenko@linux.intel.com>
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
 drivers/platform/x86/dell-laptop.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index a94936a5b6c7..7a6e521b93e6 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -594,19 +594,7 @@ static int dell_debugfs_show(struct seq_file *s, void *data)
 
 	return 0;
 }
-
-static int dell_debugfs_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, dell_debugfs_show, inode->i_private);
-}
-
-static const struct file_operations dell_debugfs_fops = {
-	.owner = THIS_MODULE,
-	.open = dell_debugfs_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(dell_debugfs);
 
 static void dell_update_rfkill(struct work_struct *ignored)
 {
-- 
2.15.1
