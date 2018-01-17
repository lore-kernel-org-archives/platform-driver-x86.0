From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v9 3/4] platform/mellanox: mlxreg-hotplug: Code cleanup
Date: Wed, 17 Jan 2018 18:21:55 +0000
Message-ID: <1516213316-32278-4-git-send-email-vadimp@mellanox.com>
References: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Renaming field bus in structure mlxreg_hotplug_device to nr to have a name
consistent with Linux i2c naming.

Removing unnecessary includes.

Removing from mlxreg_hotplug_device_create dev_err to upper layer should
produce error on EFAULT return.

Relocation mlxreg_hotplug_device_create/destroy to the beginning of the
mlxreg-hotplug.c in order to have attribute related code at the same
location.

Add to structure mlxreg_hotplug_device device node handle for devices
defined in device table tree;

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v9->v8
  Comments pointed out by Darren:
 - Remove from this patch code related to ARM architecture.
v7->v8
 Fixes added by Vadim:
 - Drop routines using of_update_property. It causes  Kbuild error for
   ia64 arch during on modpost, since of_update_property is not exported.
   The intension of these routines was the dynamic enabling and disabling
   of the device tree node, when relevant signal is received. Such node
   has been supposed to set with the property disabled in DTS, and
   changing property by using of_update_property just flips the device.
   It was OK for arm and sparc, but not for ia64.
v6->v7
 Fixes added by Vadim:
 - Dont remove include <linux/io.h> in mlxreg-hotplug.c to avoid Kbuild
   errors. Make this change in patch 3/3.
v5->v6:
v4->v5:
 Comments pointed out by Andy:
 - remove unnessecary logic in Kconfig;
 - remove !COMPILE_TEST in mlxreg-hotplug;
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 70 +++++++++++++-----------------
 drivers/platform/x86/mlx-platform.c        | 16 +++----
 include/linux/platform_data/mlxreg.h       |  6 ++-
 3 files changed, 43 insertions(+), 49 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 2866c76..556e612 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -41,8 +41,6 @@
 #include <linux/module.h>
 #include <linux/platform_data/mlxreg.h>
 #include <linux/platform_device.h>
-#include <linux/spinlock.h>
-#include <linux/wait.h>
 #include <linux/workqueue.h>
 
 /* Offset of event and mask registers from status register */
@@ -99,6 +97,35 @@ struct mlxreg_hotplug_priv_data {
 	u8 fan_cache;
 };
 
+static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_device *data)
+{
+	data->adapter = i2c_get_adapter(data->nr);
+	if (!data->adapter)
+		return -EFAULT;
+
+	data->client = i2c_new_device(data->adapter, &data->brdinfo);
+	if (!data->client) {
+		i2c_put_adapter(data->adapter);
+		data->adapter = NULL;
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static void mlxreg_hotplug_device_destroy(struct mlxreg_hotplug_device *data)
+{
+	if (data->client) {
+		i2c_unregister_device(data->client);
+		data->client = NULL;
+	}
+
+	if (data->adapter) {
+		i2c_put_adapter(data->adapter);
+		data->adapter = NULL;
+	}
+}
+
 static ssize_t mlxreg_hotplug_attr_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
@@ -184,41 +211,6 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 	return 0;
 }
 
-static int mlxreg_hotplug_device_create(struct device *dev,
-					struct mlxreg_hotplug_device *item)
-{
-	item->adapter = i2c_get_adapter(item->bus);
-	if (!item->adapter) {
-		dev_err(dev, "Failed to get adapter for bus %d\n",
-			item->bus);
-		return -EFAULT;
-	}
-
-	item->client = i2c_new_device(item->adapter, &item->brdinfo);
-	if (!item->client) {
-		dev_err(dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
-			item->brdinfo.type, item->bus, item->brdinfo.addr);
-		i2c_put_adapter(item->adapter);
-		item->adapter = NULL;
-		return -EFAULT;
-	}
-
-	return 0;
-}
-
-static void mlxreg_hotplug_device_destroy(struct mlxreg_hotplug_device *item)
-{
-	if (item->client) {
-		i2c_unregister_device(item->client);
-		item->client = NULL;
-	}
-
-	if (item->adapter) {
-		i2c_put_adapter(item->adapter);
-		item->adapter = NULL;
-	}
-}
-
 static inline void
 mlxreg_hotplug_work_helper(struct device *dev,
 			   struct mlxreg_hotplug_device *item, u8 is_inverse,
@@ -252,10 +244,10 @@ mlxreg_hotplug_work_helper(struct device *dev,
 			if (is_inverse)
 				mlxreg_hotplug_device_destroy(item + bit);
 			else
-				mlxreg_hotplug_device_create(dev, item + bit);
+				mlxreg_hotplug_device_create(item + bit);
 		} else {
 			if (is_inverse)
-				mlxreg_hotplug_device_create(dev, item + bit);
+				mlxreg_hotplug_device_create(item + bit);
 			else
 				mlxreg_hotplug_device_destroy(item + bit);
 		}
diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 0fbec1f..5601714 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -141,41 +141,41 @@ static struct i2c_mux_reg_platform_data mlxplat_mux_data[] = {
 static struct mlxreg_hotplug_device mlxplat_mlxcpld_psu[] = {
 	{
 		.brdinfo = { I2C_BOARD_INFO("24c02", 0x51) },
-		.bus = 10,
+		.nr = 10,
 	},
 	{
 		.brdinfo = { I2C_BOARD_INFO("24c02", 0x50) },
-		.bus = 10,
+		.nr = 10,
 	},
 };
 
 static struct mlxreg_hotplug_device mlxplat_mlxcpld_pwr[] = {
 	{
 		.brdinfo = { I2C_BOARD_INFO("dps460", 0x59) },
-		.bus = 10,
+		.nr = 10,
 	},
 	{
 		.brdinfo = { I2C_BOARD_INFO("dps460", 0x58) },
-		.bus = 10,
+		.nr = 10,
 	},
 };
 
 static struct mlxreg_hotplug_device mlxplat_mlxcpld_fan[] = {
 	{
 		.brdinfo = { I2C_BOARD_INFO("24c32", 0x50) },
-		.bus = 11,
+		.nr = 11,
 	},
 	{
 		.brdinfo = { I2C_BOARD_INFO("24c32", 0x50) },
-		.bus = 12,
+		.nr = 12,
 	},
 	{
 		.brdinfo = { I2C_BOARD_INFO("24c32", 0x50) },
-		.bus = 13,
+		.nr = 13,
 	},
 	{
 		.brdinfo = { I2C_BOARD_INFO("24c32", 0x50) },
-		.bus = 14,
+		.nr = 14,
 	},
 };
 
diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 8dcbb8e..5c98ad1 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -39,7 +39,8 @@
  * @adapter: I2C device adapter;
  * @client: I2C device client;
  * @brdinfo: device board information;
- * @bus: I2C bus, where device is attached;
+ * @nr: I2C device adapter number, to which device is to be attached;
+ * @np - pointer to node platform associated with attribute;
  *
  * Structure represents I2C hotplug device static data (board topology) and
  * dynamic data (related kernel objects handles).
@@ -48,7 +49,8 @@ struct mlxreg_hotplug_device {
 	struct i2c_adapter *adapter;
 	struct i2c_client *client;
 	struct i2c_board_info brdinfo;
-	u16 bus;
+	int nr;
+	struct device_node *np;
 };
 
 /**
-- 
2.1.4
