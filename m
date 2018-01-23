From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v10 2/6] platform/mellanox: Group create/destroy with attribute functions
Date: Tue, 23 Jan 2018 20:34:21 +0000
Message-ID: <1516739665-132304-2-git-send-email-vadimp@mellanox.com>
References: <1516739665-132304-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516739665-132304-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Move the mlxreg_hotplug_device_create and _destroy functions up with the
related attribute functions. No functional changes.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
v9->v10:
 Fixes provideded by Darren:
 - make separate patch for relocating create/destroy;
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 70 +++++++++++++++---------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index c015fe9..1a04cb2 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -98,6 +98,41 @@ struct mlxreg_hotplug_priv_data {
 	u8 fan_cache;
 };
 
+static int mlxreg_hotplug_device_create(struct device *dev,
+					struct mlxreg_hotplug_device *item)
+{
+	item->adapter = i2c_get_adapter(item->bus);
+	if (!item->adapter) {
+		dev_err(dev, "Failed to get adapter for bus %d\n",
+			item->bus);
+		return -EFAULT;
+	}
+
+	item->client = i2c_new_device(item->adapter, &item->brdinfo);
+	if (!item->client) {
+		dev_err(dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
+			item->brdinfo.type, item->bus, item->brdinfo.addr);
+		i2c_put_adapter(item->adapter);
+		item->adapter = NULL;
+		return -EFAULT;
+	}
+
+	return 0;
+}
+
+static void mlxreg_hotplug_device_destroy(struct mlxreg_hotplug_device *item)
+{
+	if (item->client) {
+		i2c_unregister_device(item->client);
+		item->client = NULL;
+	}
+
+	if (item->adapter) {
+		i2c_put_adapter(item->adapter);
+		item->adapter = NULL;
+	}
+}
+
 static ssize_t mlxreg_hotplug_attr_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
@@ -183,41 +218,6 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
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
-- 
2.1.4
