From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4/8] platform: x86: ideapad-laptop: no need to check return value of debugfs_create functions
Date: Wed, 12 Jun 2019 14:12:54 +0200
Message-ID: <20190612121258.19535-4-gregkh@linuxfoundation.org>
References: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Ike Panhc <ike.pan@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/x86/ideapad-laptop.c | 36 ++++++---------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 5fb9bfdf1019..7598cd46cf60 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -316,34 +316,15 @@ static int debugfs_cfg_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(debugfs_cfg);
 
-static int ideapad_debugfs_init(struct ideapad_private *priv)
+static void ideapad_debugfs_init(struct ideapad_private *priv)
 {
-	struct dentry *node;
+	struct dentry *dir;
 
-	priv->debug = debugfs_create_dir("ideapad", NULL);
-	if (priv->debug == NULL) {
-		pr_err("failed to create debugfs directory");
-		goto errout;
-	}
-
-	node = debugfs_create_file("cfg", S_IRUGO, priv->debug, priv,
-				   &debugfs_cfg_fops);
-	if (!node) {
-		pr_err("failed to create cfg in debugfs");
-		goto errout;
-	}
-
-	node = debugfs_create_file("status", S_IRUGO, priv->debug, priv,
-				   &debugfs_status_fops);
-	if (!node) {
-		pr_err("failed to create status in debugfs");
-		goto errout;
-	}
-
-	return 0;
+	dir = debugfs_create_dir("ideapad", NULL);
+	priv->debug = dir;
 
-errout:
-	return -ENOMEM;
+	debugfs_create_file("cfg", S_IRUGO, dir, priv, &debugfs_cfg_fops);
+	debugfs_create_file("status", S_IRUGO, dir, priv, &debugfs_status_fops);
 }
 
 static void ideapad_debugfs_exit(struct ideapad_private *priv)
@@ -1012,9 +993,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = ideapad_debugfs_init(priv);
-	if (ret)
-		goto debugfs_failed;
+	ideapad_debugfs_init(priv);
 
 	ret = ideapad_input_init(priv);
 	if (ret)
@@ -1071,7 +1050,6 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	ideapad_input_exit(priv);
 input_failed:
 	ideapad_debugfs_exit(priv);
-debugfs_failed:
 	ideapad_sysfs_exit(priv);
 	return ret;
 }
-- 
2.22.0
