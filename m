From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH 11/11] platform/mellanox: mlxreg-hotplug: Fix issue of commit (9228b4ffec): Modify to use a regmap interface
Date: Fri, 26 Jan 2018 19:03:46 +0000
Message-ID: <1516993426-11384-3-git-send-email-vadimp@mellanox.com>
References: <1516993426-11384-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516993426-11384-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

It fixes issue introduced by commit:
platform/mellanox: mlxreg-hotplug: Modify to use a regmap interface.
In this commit the device parameter in mlxreg_hotplug_device_create has
been dropped, while it is used inside this routine.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index a37afc1..0dfa1ca 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -93,7 +93,8 @@ struct mlxreg_hotplug_priv_data {
 	bool after_probe;
 };
 
-static int mlxreg_hotplug_device_create(struct mlxreg_core_data *data)
+static int mlxreg_hotplug_device_create(struct device *dev,
+					struct mlxreg_core_data *data)
 {
 	/*
 	 * Return if adapter number is negative. It could be in case hotplug
@@ -269,10 +270,10 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 			if (item->inversed)
 				mlxreg_hotplug_device_destroy(data);
 			else
-				mlxreg_hotplug_device_create(data);
+				mlxreg_hotplug_device_create(priv->dev, data);
 		} else {
 			if (item->inversed)
-				mlxreg_hotplug_device_create(data);
+				mlxreg_hotplug_device_create(priv->dev, data);
 			else
 				mlxreg_hotplug_device_destroy(data);
 		}
@@ -318,7 +319,7 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
 		if (regval == MLXREG_HOTPLUG_HEALTH_MASK) {
 			if ((data->health_cntr++ == MLXREG_HOTPLUG_RST_CNTR) ||
 			    !priv->after_probe) {
-				mlxreg_hotplug_device_create(data);
+				mlxreg_hotplug_device_create(priv->dev, data);
 				data->attached = true;
 			}
 		} else {
-- 
2.1.4
