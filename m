From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] platform/x86: mlx-platform: free first dev on error
Date: Sat, 7 Jan 2017 09:33:34 +0300
Message-ID: <20170107063334.GF26959@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:46261 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967877AbdAGGeX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Jan 2017 01:34:23 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

There is an off-by-one error so we don't unregister priv->pdev_mux[0].
Also it's slightly simpler as a while loop instead of a for loop.

Fixes: 58cbbee2391c ("x86/platform/mellanox: Introduce support for Mellanox systems platform")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 04e1f2b30fa6..8f98c211b440 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -342,7 +342,7 @@ static int __init mlxplat_init(void)
 	return 0;
 
 fail_platform_mux_register:
-	for (i--; i > 0 ; i--)
+	while (--i >= 0)
 		platform_device_unregister(priv->pdev_mux[i]);
 	platform_device_unregister(priv->pdev_i2c);
 fail_alloc:
