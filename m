From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/8] platform: x86: asus-wmi: no need to check return value of debugfs_create functions
Date: Wed, 12 Jun 2019 14:12:52 +0200
Message-ID: <20190612121258.19535-2-gregkh@linuxfoundation.org>
References: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Corentin Chary <corentin.chary@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: acpi4asus-user@lists.sourceforge.net
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/x86/asus-wmi.c | 47 ++++++++-------------------------
 1 file changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 3e4336025e8f..4e3786eae349 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2005,50 +2005,29 @@ static void asus_wmi_debugfs_exit(struct asus_wmi *asus)
 	debugfs_remove_recursive(asus->debug.root);
 }
 
-static int asus_wmi_debugfs_init(struct asus_wmi *asus)
+static void asus_wmi_debugfs_init(struct asus_wmi *asus)
 {
-	struct dentry *dent;
 	int i;
 
 	asus->debug.root = debugfs_create_dir(asus->driver->name, NULL);
-	if (!asus->debug.root) {
-		pr_err("failed to create debugfs directory\n");
-		goto error_debugfs;
-	}
 
-	dent = debugfs_create_x32("method_id", S_IRUGO | S_IWUSR,
-				  asus->debug.root, &asus->debug.method_id);
-	if (!dent)
-		goto error_debugfs;
+	debugfs_create_x32("method_id", S_IRUGO | S_IWUSR, asus->debug.root,
+			   &asus->debug.method_id);
 
-	dent = debugfs_create_x32("dev_id", S_IRUGO | S_IWUSR,
-				  asus->debug.root, &asus->debug.dev_id);
-	if (!dent)
-		goto error_debugfs;
+	debugfs_create_x32("dev_id", S_IRUGO | S_IWUSR, asus->debug.root,
+			   &asus->debug.dev_id);
 
-	dent = debugfs_create_x32("ctrl_param", S_IRUGO | S_IWUSR,
-				  asus->debug.root, &asus->debug.ctrl_param);
-	if (!dent)
-		goto error_debugfs;
+	debugfs_create_x32("ctrl_param", S_IRUGO | S_IWUSR, asus->debug.root,
+			   &asus->debug.ctrl_param);
 
 	for (i = 0; i < ARRAY_SIZE(asus_wmi_debug_files); i++) {
 		struct asus_wmi_debugfs_node *node = &asus_wmi_debug_files[i];
 
 		node->asus = asus;
-		dent = debugfs_create_file(node->name, S_IFREG | S_IRUGO,
-					   asus->debug.root, node,
-					   &asus_wmi_debugfs_io_ops);
-		if (!dent) {
-			pr_err("failed to create debug file: %s\n", node->name);
-			goto error_debugfs;
-		}
+		debugfs_create_file(node->name, S_IFREG | S_IRUGO,
+				    asus->debug.root, node,
+				    &asus_wmi_debugfs_io_ops);
 	}
-
-	return 0;
-
-error_debugfs:
-	asus_wmi_debugfs_exit(asus);
-	return -ENOMEM;
 }
 
 static int asus_wmi_fan_init(struct asus_wmi *asus)
@@ -2162,14 +2141,10 @@ static int asus_wmi_add(struct platform_device *pdev)
 		goto fail_wmi_handler;
 	}
 
-	err = asus_wmi_debugfs_init(asus);
-	if (err)
-		goto fail_debugfs;
+	asus_wmi_debugfs_init(asus);
 
 	return 0;
 
-fail_debugfs:
-	wmi_remove_notify_handler(asus->driver->event_guid);
 fail_wmi_handler:
 	asus_wmi_backlight_exit(asus);
 fail_backlight:
-- 
2.22.0
