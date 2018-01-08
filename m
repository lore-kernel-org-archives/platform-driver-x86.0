From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v7 2/3] platform/mellanox: mlxreg-hotplug: allow driver for ARM architecture
Date: Mon,  8 Jan 2018 14:16:38 +0000
Message-ID: <1515420999-4133-3-git-send-email-vadimp@mellanox.com>
References: <1515420999-4133-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515420999-4133-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

It allows driver to run on x86 and ARM architecture based systems.
And allows to specify hotplug device parameters through the device
table tree files.
Also some unnecessary includes are removed.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
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
 drivers/platform/mellanox/Kconfig          |   2 +-
 drivers/platform/mellanox/mlxreg-hotplug.c | 163 +++++++++++++++++++++--------
 drivers/platform/x86/mlx-platform.c        |  16 +--
 include/linux/platform_data/mlxreg.h       |   6 +-
 4 files changed, 132 insertions(+), 55 deletions(-)

diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index d735292..0267e1d 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -5,7 +5,7 @@
 
 menuconfig MELLANOX_PLATFORM
 	bool "Platform support for Mellanox hardware"
-	depends on X86 || COMPILE_TEST
+	depends on X86 || ARM || COMPILE_TEST
 	---help---
 	  Say Y here to get to see options for platform support for
 	  Mellanox systems. This option alone does not add any kernel code.
diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 2866c76..d609520 100644
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
@@ -50,6 +48,10 @@
 #define MLXREG_HOTPLUG_MASK_OFF	2
 #define MLXREG_HOTPLUG_AGGR_MASK_OFF	1
 
+#define MLXREG_HOTPLUG_PROP_OKAY	"okay"
+#define MLXREG_HOTPLUG_PROP_DISABLED	"disabled"
+#define MLXREG_HOTPLUG_PROP_STATUS	"status"
+
 #define MLXREG_HOTPLUG_ATTRS_NUM	8
 
 /**
@@ -99,6 +101,114 @@ struct mlxreg_hotplug_priv_data {
 	u8 fan_cache;
 };
 
+#if defined(CONFIG_OF_DYNAMIC)
+/**
+ * struct mlxreg_hotplug_device_en - Open Firmware property for enabling device
+ *
+ * @name - property name;
+ * @value - property value string;
+ * @length - length of proprty value string;
+ *
+ * The structure is used for the devices, which require some dynamic
+ * selection operation allowing access to them.
+ */
+static struct property mlxreg_hotplug_device_en = {
+	.name = MLXREG_HOTPLUG_PROP_STATUS,
+	.value = MLXREG_HOTPLUG_PROP_OKAY,
+	.length = sizeof(MLXREG_HOTPLUG_PROP_OKAY),
+};
+
+/**
+ * struct mlxreg_hotplug_device_dis - Open Firmware property for disabling
+ * device
+ *
+ * @name - property name;
+ * @value - property value string;
+ * @length - length of proprty value string;
+ *
+ * The structure is used for the devices, which require some dynamic
+ * selection operation disallowing access to them.
+ */
+static struct property mlxreg_hotplug_device_dis = {
+	.name = MLXREG_HOTPLUG_PROP_STATUS,
+	.value = MLXREG_HOTPLUG_PROP_DISABLED,
+	.length = sizeof(MLXREG_HOTPLUG_PROP_DISABLED),
+};
+
+static int mlxreg_hotplug_of_device_create(struct mlxreg_hotplug_device *data)
+{
+	return of_update_property(data->np, &mlxreg_hotplug_device_en);
+}
+
+static void
+mlxreg_hotplug_of_device_destroy(struct mlxreg_hotplug_device *data)
+{
+	of_update_property(data->np, &mlxreg_hotplug_device_dis);
+	of_node_clear_flag(data->np, OF_POPULATED);
+}
+#else
+static int mlxreg_hotplug_of_device_create(struct mlxreg_hotplug_device *data)
+{
+	return 0;
+}
+
+static void
+mlxreg_hotplug_of_device_destroy(struct mlxreg_hotplug_device *data)
+{
+}
+#endif
+
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
+static int mlxreg_hotplug_dev_enable(struct mlxreg_hotplug_device *data)
+{
+	int err;
+
+	/* Enable and create device. */
+	if (data->np)
+		err = mlxreg_hotplug_of_device_create(data);
+	else
+		err = mlxreg_hotplug_device_create(data);
+
+	return err;
+}
+
+static void mlxreg_hotplug_dev_disable(struct mlxreg_hotplug_device *data)
+{
+	/* Disable and unregister platform device. */
+	if (data->np)
+		mlxreg_hotplug_of_device_destroy(data);
+	else
+		mlxreg_hotplug_device_destroy(data);
+}
+
 static ssize_t mlxreg_hotplug_attr_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
@@ -184,41 +294,6 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
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
@@ -250,14 +325,14 @@ mlxreg_hotplug_work_helper(struct device *dev,
 	for_each_set_bit(bit, (unsigned long *)&asserted, 8) {
 		if (val & BIT(bit)) {
 			if (is_inverse)
-				mlxreg_hotplug_device_destroy(item + bit);
+				mlxreg_hotplug_dev_disable(item + bit);
 			else
-				mlxreg_hotplug_device_create(dev, item + bit);
+				mlxreg_hotplug_dev_enable(item + bit);
 		} else {
 			if (is_inverse)
-				mlxreg_hotplug_device_create(dev, item + bit);
+				mlxreg_hotplug_dev_enable(item + bit);
 			else
-				mlxreg_hotplug_device_destroy(item + bit);
+				mlxreg_hotplug_dev_disable(item + bit);
 		}
 	}
 
@@ -408,13 +483,13 @@ static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
 
 	/* Remove all the attached devices. */
 	for (i = 0; i < priv->plat->psu_count; i++)
-		mlxreg_hotplug_device_destroy(priv->plat->psu + i);
+		mlxreg_hotplug_dev_disable(priv->plat->psu + i);
 
 	for (i = 0; i < priv->plat->pwr_count; i++)
-		mlxreg_hotplug_device_destroy(priv->plat->pwr + i);
+		mlxreg_hotplug_dev_disable(priv->plat->pwr + i);
 
 	for (i = 0; i < priv->plat->fan_count; i++)
-		mlxreg_hotplug_device_destroy(priv->plat->fan + i);
+		mlxreg_hotplug_dev_disable(priv->plat->fan + i);
 }
 
 static irqreturn_t mlxreg_hotplug_irq_handler(int irq, void *dev)
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
