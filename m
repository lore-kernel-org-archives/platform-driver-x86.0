From: Dinghao Liu <dinghao.liu@zju.edu.cn>
Subject: [PATCH] Platform: OLPC: Fix memleak in olpc_ec_probe
Date: Sun, 23 Aug 2020 19:12:11 +0800
Message-ID: <20200823111214.24030-1-dinghao.liu@zju.edu.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Lubomir Rintel <lkundrak@v3.sk>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When devm_regulator_register() fails, ec should be
freed just like when olpc_ec_cmd() fails.

Fixes: 231c0c216172a ("Platform: OLPC: Add a regulator for the DCON")
Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/platform/olpc/olpc-ec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc-ec.c
index 190e4a6186ef..f64b82824db2 100644
--- a/drivers/platform/olpc/olpc-ec.c
+++ b/drivers/platform/olpc/olpc-ec.c
@@ -439,7 +439,9 @@ static int olpc_ec_probe(struct platform_device *pdev)
 								&config);
 	if (IS_ERR(ec->dcon_rdev)) {
 		dev_err(&pdev->dev, "failed to register DCON regulator\n");
-		return PTR_ERR(ec->dcon_rdev);
+		err = PTR_ERR(ec->dcon_rdev);
+		kfree(ec);
+		return err;
 	}
 
 	ec->dbgfs_dir = olpc_ec_setup_debugfs();
-- 
2.17.1
