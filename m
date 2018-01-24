From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v11 11/12] platform/mellanox: mlxreg-hotplug: Add check for negative adapter number value
Date: Wed, 24 Jan 2018 20:34:57 +0000
Message-ID: <1516826098-125036-3-git-send-email-vadimp@mellanox.com>
References: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Verify before creation of hotplug device if the associated adapter number
is negative. It could be in case hotplug event is not associated with
hotplug device.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index b891ec7..c806451 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -95,6 +95,14 @@ struct mlxreg_hotplug_priv_data {
 
 static int mlxreg_hotplug_device_create(struct mlxreg_core_data *data)
 {
+	/*
+	 * Return if adapter number is negative. Return if adapter number is
+	 * negative. It could be in case hotplug event is not associated with
+	 * hotplug device.
+	 */
+	if (data->hpdev.nr < 0)
+		return 0;
+
 	data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr);
 	if (!data->hpdev.adapter)
 		return -EFAULT;
-- 
2.1.4
