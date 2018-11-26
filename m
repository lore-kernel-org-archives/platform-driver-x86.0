From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] platform/x86: intel-ips: fix 'passing zero to ERR_PTR()' warning
Date: Mon, 26 Nov 2018 21:06:46 +0800
Message-ID: <20181126130646.22568-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, jkosina@suse.cz
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, andriy.shevchenko@linux.intel.com, YueHaibing <yuehaibing@huawei.com>
List-Id: platform-driver-x86.vger.kernel.org

Fix a static code checker warning:
drivers/platform/x86/intel_ips.c:1314
 ips_debugfs_init() warn: passing zero to 'PTR_ERR'
drivers/platform/x86/intel_ips.c:1328
 ips_debugfs_init() warn: passing zero to 'PTR_ERR'

If error occurs,debugfs_create_dir/debugfs_create_file
return NULL while debugfs is enabled, which should not
passing to ERR_PTR.

Fixes: aa7ffc01d254 ("x86 platform driver: intelligent power sharing driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/platform/x86/intel_ips.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 225638a..a5d1a68 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1311,8 +1311,7 @@ static void ips_debugfs_init(struct ips_driver *ips)
 
 	ips->debug_root = debugfs_create_dir("ips", NULL);
 	if (!ips->debug_root) {
-		dev_err(ips->dev, "failed to create debugfs entries: %ld\n",
-			PTR_ERR(ips->debug_root));
+		dev_err(ips->dev, "failed to create debugfs entries\n")
 		return;
 	}
 
@@ -1325,8 +1324,7 @@ static void ips_debugfs_init(struct ips_driver *ips)
 					  ips->debug_root, node,
 					  &ips_debugfs_ops);
 		if (!ent) {
-			dev_err(ips->dev, "failed to create debug file: %ld\n",
-				PTR_ERR(ent));
+			dev_err(ips->dev, "failed to create debug file\n");
 			goto err_cleanup;
 		}
 	}
-- 
2.7.0
