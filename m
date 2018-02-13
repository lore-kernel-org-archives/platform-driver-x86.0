From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 3/4] platform/mellanox: mlxreg-hotplug: Change input for device create routine
Date: Tue, 13 Feb 2018 22:09:35 +0000
Message-ID: <1518559776-188942-4-git-send-email-vadimp@mellanox.com>
References: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518559776-188942-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Change the first input parameter in mlxreg_hotplug_device_create to the
pointer to mlxreg_hotplug private data in order to allow to use the fields
from the private data structure inside this routine.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index fe4910b..c1e1c4f 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -93,7 +93,7 @@ struct mlxreg_hotplug_priv_data {
 	bool after_probe;
 };
 
-static int mlxreg_hotplug_device_create(struct device *dev,
+static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
 					struct mlxreg_core_data *data)
 {
 	/*
@@ -105,7 +105,7 @@ static int mlxreg_hotplug_device_create(struct device *dev,
 
 	data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr);
 	if (!data->hpdev.adapter) {
-		dev_err(dev, "Failed to get adapter for bus %d\n",
+		dev_err(priv->dev, "Failed to get adapter for bus %d\n",
 			data->hpdev.nr);
 		return -EFAULT;
 	}
@@ -113,7 +113,7 @@ static int mlxreg_hotplug_device_create(struct device *dev,
 	data->hpdev.client = i2c_new_device(data->hpdev.adapter,
 					    data->hpdev.brdinfo);
 	if (!data->hpdev.client) {
-		dev_err(dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
+		dev_err(priv->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
 			data->hpdev.brdinfo->type, data->hpdev.nr,
 			data->hpdev.brdinfo->addr);
 
@@ -270,10 +270,10 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 			if (item->inversed)
 				mlxreg_hotplug_device_destroy(data);
 			else
-				mlxreg_hotplug_device_create(priv->dev, data);
+				mlxreg_hotplug_device_create(priv, data);
 		} else {
 			if (item->inversed)
-				mlxreg_hotplug_device_create(priv->dev, data);
+				mlxreg_hotplug_device_create(priv, data);
 			else
 				mlxreg_hotplug_device_destroy(data);
 		}
@@ -319,7 +319,7 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
 		if (regval == MLXREG_HOTPLUG_HEALTH_MASK) {
 			if ((data->health_cntr++ == MLXREG_HOTPLUG_RST_CNTR) ||
 			    !priv->after_probe) {
-				mlxreg_hotplug_device_create(priv->dev, data);
+				mlxreg_hotplug_device_create(priv, data);
 				data->attached = true;
 			}
 		} else {
-- 
2.1.4
