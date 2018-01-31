From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH 11/11] platform/x86: mlx-platform: Add hotplug platform driver un-registration for faulty flow
Date: Wed, 31 Jan 2018 21:55:13 +0000
Message-ID: <1517435713-124919-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Add hotplug platform driver un-registration in case regmap cache
synchronization failed. In such case hotplug platform driver registration
should be rolled back.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 2d34aa8..1811451 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -548,10 +548,12 @@ static int __init mlxplat_init(void)
 	regcache_mark_dirty(mlxplat_hotplug->regmap);
 	err = regcache_sync(mlxplat_hotplug->regmap);
 	if (err)
-		goto fail_platform_mux_register;
+		goto fail_platform_hotplug_register;
 
 	return 0;
 
+fail_platform_hotplug_register:
+	platform_device_unregister(priv->pdev_hotplug);
 fail_platform_mux_register:
 	while (--i >= 0)
 		platform_device_unregister(priv->pdev_mux[i]);
-- 
2.1.4
