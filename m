From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v11 12/12] platform/mellanox: Add validation of return code of hotplug device creation routine
Date: Wed, 24 Jan 2018 20:34:58 +0000
Message-ID: <1516826098-125036-4-git-send-email-vadimp@mellanox.com>
References: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Adding validation of return code of mlxreg_hotplug_device_create. It could
fail in case the requested adapter is not available or if client can not
be connected to the adapter. Error is to be reported in case of bad flow.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index c806451..e852219 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -263,13 +263,15 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 			if (item->inversed)
 				mlxreg_hotplug_device_destroy(data);
 			else
-				mlxreg_hotplug_device_create(data);
+				ret = mlxreg_hotplug_device_create(data);
 		} else {
 			if (item->inversed)
-				mlxreg_hotplug_device_create(data);
+				ret = mlxreg_hotplug_device_create(data);
 			else
 				mlxreg_hotplug_device_destroy(data);
 		}
+		if (ret)
+			dev_err(priv->dev, "Failed to create hotplug device.\n");
 	}
 
 	/* Acknowledge event. */
@@ -312,8 +314,11 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
 		if (regval == MLXREG_HOTPLUG_HEALTH_MASK) {
 			if ((data->health_cntr++ == MLXREG_HOTPLUG_RST_CNTR) ||
 			    !priv->after_probe) {
-				mlxreg_hotplug_device_create(data);
-				data->attached = true;
+				ret = mlxreg_hotplug_device_create(data);
+				if (ret)
+					dev_err(priv->dev, "Failed to create hotplug device.\n");
+				else
+					data->attached = true;
 			}
 		} else {
 			if (data->attached) {
-- 
2.1.4
