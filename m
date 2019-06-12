From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 5/8] platform: x86: samsung-laptop: no need to check return value of debugfs_create functions
Date: Wed, 12 Jun 2019 14:12:55 +0200
Message-ID: <20190612121258.19535-5-gregkh@linuxfoundation.org>
References: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Corentin Chary <corentin.chary@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/x86/samsung-laptop.c | 89 +++++++--------------------
 1 file changed, 23 insertions(+), 66 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 7b160ee98115..e84f11398c1b 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1280,15 +1280,12 @@ static void samsung_debugfs_exit(struct samsung_laptop *samsung)
 	debugfs_remove_recursive(samsung->debug.root);
 }
 
-static int samsung_debugfs_init(struct samsung_laptop *samsung)
+static void samsung_debugfs_init(struct samsung_laptop *samsung)
 {
-	struct dentry *dent;
+	struct dentry *root;
 
-	samsung->debug.root = debugfs_create_dir("samsung-laptop", NULL);
-	if (!samsung->debug.root) {
-		pr_err("failed to create debugfs directory");
-		goto error_debugfs;
-	}
+	root = debugfs_create_dir("samsung-laptop", NULL);
+	samsung->debug.root = root;
 
 	samsung->debug.f0000_wrapper.data = samsung->f0000_segment;
 	samsung->debug.f0000_wrapper.size = 0xffff;
@@ -1299,60 +1296,24 @@ static int samsung_debugfs_init(struct samsung_laptop *samsung)
 	samsung->debug.sdiag_wrapper.data = samsung->sdiag;
 	samsung->debug.sdiag_wrapper.size = strlen(samsung->sdiag);
 
-	dent = debugfs_create_u16("command", S_IRUGO | S_IWUSR,
-				  samsung->debug.root, &samsung->debug.command);
-	if (!dent)
-		goto error_debugfs;
-
-	dent = debugfs_create_u32("d0", S_IRUGO | S_IWUSR, samsung->debug.root,
-				  &samsung->debug.data.d0);
-	if (!dent)
-		goto error_debugfs;
-
-	dent = debugfs_create_u32("d1", S_IRUGO | S_IWUSR, samsung->debug.root,
-				  &samsung->debug.data.d1);
-	if (!dent)
-		goto error_debugfs;
-
-	dent = debugfs_create_u16("d2", S_IRUGO | S_IWUSR, samsung->debug.root,
-				  &samsung->debug.data.d2);
-	if (!dent)
-		goto error_debugfs;
-
-	dent = debugfs_create_u8("d3", S_IRUGO | S_IWUSR, samsung->debug.root,
-				 &samsung->debug.data.d3);
-	if (!dent)
-		goto error_debugfs;
-
-	dent = debugfs_create_blob("data", S_IRUGO | S_IWUSR,
-				   samsung->debug.root,
-				   &samsung->debug.data_wrapper);
-	if (!dent)
-		goto error_debugfs;
-
-	dent = debugfs_create_blob("f0000_segment", S_IRUSR | S_IWUSR,
-				   samsung->debug.root,
-				   &samsung->debug.f0000_wrapper);
-	if (!dent)
-		goto error_debugfs;
-
-	dent = debugfs_create_file("call", S_IFREG | S_IRUGO,
-				   samsung->debug.root, samsung,
-				   &samsung_laptop_call_fops);
-	if (!dent)
-		goto error_debugfs;
-
-	dent = debugfs_create_blob("sdiag", S_IRUGO | S_IWUSR,
-				   samsung->debug.root,
-				   &samsung->debug.sdiag_wrapper);
-	if (!dent)
-		goto error_debugfs;
-
-	return 0;
-
-error_debugfs:
-	samsung_debugfs_exit(samsung);
-	return -ENOMEM;
+	debugfs_create_u16("command", S_IRUGO | S_IWUSR, root,
+			   &samsung->debug.command);
+	debugfs_create_u32("d0", S_IRUGO | S_IWUSR, root,
+			   &samsung->debug.data.d0);
+	debugfs_create_u32("d1", S_IRUGO | S_IWUSR, root,
+			   &samsung->debug.data.d1);
+	debugfs_create_u16("d2", S_IRUGO | S_IWUSR, root,
+			   &samsung->debug.data.d2);
+	debugfs_create_u8("d3", S_IRUGO | S_IWUSR, root,
+			  &samsung->debug.data.d3);
+	debugfs_create_blob("data", S_IRUGO | S_IWUSR, root,
+			    &samsung->debug.data_wrapper);
+	debugfs_create_blob("f0000_segment", S_IRUSR | S_IWUSR, root,
+			    &samsung->debug.f0000_wrapper);
+	debugfs_create_file("call", S_IFREG | S_IRUGO, root, samsung,
+			    &samsung_laptop_call_fops);
+	debugfs_create_blob("sdiag", S_IRUGO | S_IWUSR, root,
+			    &samsung->debug.sdiag_wrapper);
 }
 
 static void samsung_sabi_exit(struct samsung_laptop *samsung)
@@ -1745,9 +1706,7 @@ static int __init samsung_init(void)
 	if (ret)
 		goto error_lid_handling;
 
-	ret = samsung_debugfs_init(samsung);
-	if (ret)
-		goto error_debugfs;
+	samsung_debugfs_init(samsung);
 
 	samsung->pm_nb.notifier_call = samsung_pm_notification;
 	register_pm_notifier(&samsung->pm_nb);
@@ -1755,8 +1714,6 @@ static int __init samsung_init(void)
 	samsung_platform_device = samsung->platform_device;
 	return ret;
 
-error_debugfs:
-	samsung_lid_handling_exit(samsung);
 error_lid_handling:
 	samsung_leds_exit(samsung);
 error_leds:
-- 
2.22.0
