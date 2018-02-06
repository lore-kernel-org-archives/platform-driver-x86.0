From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] platform/x86: mlx-platform: Fix an ERR_PTR vs NULL issue
Date: Tue, 6 Feb 2018 15:45:36 +0300
Message-ID: <20180206124536.GA9445@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aserp2130.oracle.com ([141.146.126.79]:58722 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752403AbeBFMqK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Feb 2018 07:46:10 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

devm_ioport_map() returns NULL on error but we accidentally check for
error pointers instead.

Fixes: c6acad68eb2d ("platform/mellanox: mlxreg-hotplug: Modify to use a regmap interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index dfecba4407ac..27de29961f5e 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -522,8 +522,8 @@ static int __init mlxplat_init(void)
 
 	mlxplat_mlxcpld_regmap_ctx.base = devm_ioport_map(&mlxplat_dev->dev,
 			       mlxplat_lpc_resources[1].start, 1);
-	if (IS_ERR(mlxplat_mlxcpld_regmap_ctx.base)) {
-		err = PTR_ERR(mlxplat_mlxcpld_regmap_ctx.base);
+	if (!mlxplat_mlxcpld_regmap_ctx.base) {
+		err = -ENOMEM;
 		goto fail_platform_mux_register;
 	}
 
