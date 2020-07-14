From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v2 05/11] platform/mellanox: mlxreg-hotplug: Add environmental data to uevent
Date: Tue, 14 Jul 2020 15:01:57 +0300
Message-ID: <20200714120203.10352-6-vadimp@mellanox.com>
References: <20200714120203.10352-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200714120203.10352-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Send "udev" event with environmental data in order to allow handling
"ENV{}" variables in "udev" rules.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v1->v2:
Comments pointed out by Andy:
- Add string_upper(), string_lower() helpers. Use string_upper() for
  label conversion.
- Simplify code for event string construction.
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index d9863e7fd491..b013445147dd 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -16,6 +16,7 @@
 #include <linux/platform_data/mlxreg.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
+#include <linux/string_helpers.h>
 #include <linux/regmap.h>
 #include <linux/workqueue.h>
 
@@ -71,6 +72,23 @@ struct mlxreg_hotplug_priv_data {
 	u8 not_asserted;
 };
 
+/* Environment variables array for udev. */
+static char *mlxreg_hotplug_udev_envp[] = { NULL, NULL };
+
+static int
+mlxreg_hotplug_udev_event_send(struct kobject *kobj,
+			       struct mlxreg_core_data *data, bool action)
+{
+	char event_str[MLXREG_CORE_LABEL_MAX_SIZE + 2];
+	char label[MLXREG_CORE_LABEL_MAX_SIZE] = { 0 };
+
+	mlxreg_hotplug_udev_envp[0] = event_str;
+	string_upper(label, data->label);
+	snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=%d", label, !!action);
+
+	return kobject_uevent_env(kobj, KOBJ_CHANGE, mlxreg_hotplug_udev_envp);
+}
+
 static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
 					struct mlxreg_core_data *data)
 {
@@ -78,7 +96,7 @@ static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
 	struct i2c_client *client;
 
 	/* Notify user by sending hwmon uevent. */
-	kobject_uevent(&priv->hwmon->kobj, KOBJ_CHANGE);
+	mlxreg_hotplug_udev_event_send(&priv->hwmon->kobj, data, true);
 
 	/*
 	 * Return if adapter number is negative. It could be in case hotplug
@@ -118,7 +136,7 @@ mlxreg_hotplug_device_destroy(struct mlxreg_hotplug_priv_data *priv,
 			      struct mlxreg_core_data *data)
 {
 	/* Notify user by sending hwmon uevent. */
-	kobject_uevent(&priv->hwmon->kobj, KOBJ_CHANGE);
+	mlxreg_hotplug_udev_event_send(&priv->hwmon->kobj, data, false);
 
 	if (data->hpdev.client) {
 		i2c_unregister_device(data->hpdev.client);
-- 
2.11.0
