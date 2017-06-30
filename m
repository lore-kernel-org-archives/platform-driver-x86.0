From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] platform/x86: intel_telemetry_debugfs: fix some error codes
 in init
Date: Fri, 30 Jun 2017 10:52:18 +0300
Message-ID: <20170630075218.m4eal2iqu5i2skx5@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There are bunch of "goto out;" paths where we don't set the error code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
index 4cc2f4ea0a25..b8be058a8754 100644
--- a/drivers/platform/x86/intel_telemetry_debugfs.c
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c
@@ -938,7 +938,7 @@ static struct notifier_block pm_notifier = {
 static int __init telemetry_debugfs_init(void)
 {
 	const struct x86_cpu_id *id;
-	int err = -ENOMEM;
+	int err;
 	struct dentry *f;
 
 	/* Only APL supported for now */
@@ -958,11 +958,10 @@ static int __init telemetry_debugfs_init(void)
 
 	register_pm_notifier(&pm_notifier);
 
+	err = -ENOMEM;
 	debugfs_conf->telemetry_dbg_dir = debugfs_create_dir("telemetry", NULL);
-	if (!debugfs_conf->telemetry_dbg_dir) {
-		err = -ENOMEM;
+	if (!debugfs_conf->telemetry_dbg_dir)
 		goto out_pm;
-	}
 
 	f = debugfs_create_file("pss_info", S_IFREG | S_IRUGO,
 				debugfs_conf->telemetry_dbg_dir, NULL,
