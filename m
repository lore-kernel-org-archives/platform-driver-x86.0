From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v1 2/8] platform/mellanox: mlxreg-hotplug: Add environmental data to uevent
Date: Mon,  1 Jun 2020 12:18:45 +0300
Message-ID: <20200601091851.5491-3-vadimp@mellanox.com>
References: <20200601091851.5491-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200601091851.5491-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Send "udev" event with environmental data in order to allow handling
"ENV{}" variables in "udev" rules.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 832fcf282d45..5420d5bb0e6c 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -97,13 +97,36 @@ struct mlxreg_hotplug_priv_data {
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
+	int i;
+
+	mlxreg_hotplug_udev_envp[0] = event_str;
+	for (i = 0; data->label[i]; i++)
+		label[i] = toupper(data->label[i]);
+
+	if (action)
+		snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=1", label);
+	else
+		snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=0", label);
+
+	return kobject_uevent_env(kobj, KOBJ_CHANGE, mlxreg_hotplug_udev_envp);
+}
+
 static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
 					struct mlxreg_core_data *data)
 {
 	struct mlxreg_core_hotplug_platform_data *pdata;
 
 	/* Notify user by sending hwmon uevent. */
-	kobject_uevent(&priv->hwmon->kobj, KOBJ_CHANGE);
+	mlxreg_hotplug_udev_event_send(&priv->hwmon->kobj, data, true);
 
 	/*
 	 * Return if adapter number is negative. It could be in case hotplug
@@ -141,7 +164,7 @@ mlxreg_hotplug_device_destroy(struct mlxreg_hotplug_priv_data *priv,
 			      struct mlxreg_core_data *data)
 {
 	/* Notify user by sending hwmon uevent. */
-	kobject_uevent(&priv->hwmon->kobj, KOBJ_CHANGE);
+	mlxreg_hotplug_udev_event_send(&priv->hwmon->kobj, data, false);
 
 	if (data->hpdev.client) {
 		i2c_unregister_device(data->hpdev.client);
-- 
2.11.0
