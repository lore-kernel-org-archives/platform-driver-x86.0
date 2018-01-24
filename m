From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v11 - re-ordered 04/12] platform/mellanox: Group create/destroy with attribute functions
Date: Wed, 24 Jan 2018 20:33:38 +0000
Message-ID: <1516826019-124903-2-git-send-email-vadimp@mellanox.com>
References: <1516826019-124903-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516826019-124903-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Move the mlxreg_hotplug_device_create and _destroy functions up with the
related attribute functions. No functional changes.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
[dvhart: refactored commit into smaller functional changes]
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 60 +++++++++++++++---------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 0ccd327..4b67909 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -98,6 +98,36 @@ struct mlxreg_hotplug_priv_data {
 	u8 fan_cache;
 };
 
+static int mlxreg_hotplug_device_create(struct device *dev,
+					struct mlxreg_hotplug_device *item)
+{
+	item->adapter = i2c_get_adapter(item->bus);
+	if (!item->adapter)
+		return -EFAULT;
+
+	item->client = i2c_new_device(item->adapter, &item->brdinfo);
+	if (!item->client) {
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
@@ -183,36 +213,6 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 	return 0;
 }
 
-static int mlxreg_hotplug_device_create(struct device *dev,
-					struct mlxreg_hotplug_device *item)
-{
-	item->adapter = i2c_get_adapter(item->bus);
-	if (!item->adapter)
-		return -EFAULT;
-
-	item->client = i2c_new_device(item->adapter, &item->brdinfo);
-	if (!item->client) {
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
