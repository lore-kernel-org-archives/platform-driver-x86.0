From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v10 5/6] platform/mellanox: mlxreg-hotplug: Add check for negative adapter number value
Date: Tue, 23 Jan 2018 20:34:24 +0000
Message-ID: <1516739665-132304-5-git-send-email-vadimp@mellanox.com>
References: <1516739665-132304-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516739665-132304-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Verify before creation of hotplug device if the associated adapter number
is negative. It could be in case hotplug event is not associated with
hotplug device.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v10->v9:
 Fixes added by Vadim:
 - add this patch to the series;
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index f841379..b0d7587 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -96,6 +96,14 @@ struct mlxreg_hotplug_priv_data {
 static int mlxreg_hotplug_device_create(struct device *dev,
 					struct mlxreg_core_data *data)
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
 	if (!data->hpdev.adapter) {
 		dev_err(dev, "Failed to get adapter for bus %d\n",
-- 
2.1.4
