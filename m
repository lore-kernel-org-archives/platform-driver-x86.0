From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/4] platform/x86: samsung-laptop: Re-use DEFINE_SHOW_ATTRIBUTE() macro
Date: Mon, 22 Jan 2018 18:05:46 +0200
Message-ID: <20180122160546.51611-4-andriy.shevchenko@linux.intel.com>
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
 drivers/platform/x86/samsung-laptop.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index d3cb26f6df73..03305e0b89ff 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1252,7 +1252,7 @@ static int __init samsung_sysfs_init(struct samsung_laptop *samsung)
 
 }
 
-static int show_call(struct seq_file *m, void *data)
+static int samsung_laptop_call_show(struct seq_file *m, void *data)
 {
 	struct samsung_laptop *samsung = m->private;
 	struct sabi_data *sdata = &samsung->debug.data;
@@ -1274,19 +1274,7 @@ static int show_call(struct seq_file *m, void *data)
 		   sdata->d0, sdata->d1, sdata->d2, sdata->d3);
 	return 0;
 }
-
-static int samsung_debugfs_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, show_call, inode->i_private);
-}
-
-static const struct file_operations samsung_laptop_call_io_ops = {
-	.owner = THIS_MODULE,
-	.open = samsung_debugfs_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(samsung_laptop_call);
 
 static void samsung_debugfs_exit(struct samsung_laptop *samsung)
 {
@@ -1351,7 +1339,7 @@ static int samsung_debugfs_init(struct samsung_laptop *samsung)
 
 	dent = debugfs_create_file("call", S_IFREG | S_IRUGO,
 				   samsung->debug.root, samsung,
-				   &samsung_laptop_call_io_ops);
+				   &samsung_laptop_call_fops);
 	if (!dent)
 		goto error_debugfs;
 
-- 
2.15.1
