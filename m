From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH 10/11] platform/mellanox: mlxreg-hotplug: Add check for negative adapter number
Date: Fri, 26 Jan 2018 19:03:45 +0000
Message-ID: <1516993426-11384-2-git-send-email-vadimp@mellanox.com>
References: <1516993426-11384-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516993426-11384-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Verify before creation of hotplug device if the associated adapter number
is negative. It could be in case hotplug event is not associated with
hotplug device.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 5b3cb66..a37afc1 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -95,6 +95,13 @@ struct mlxreg_hotplug_priv_data {
 
 static int mlxreg_hotplug_device_create(struct mlxreg_core_data *data)
 {
+	/*
+	 * Return if adapter number is negative. It could be in case hotplug
+	 * event is not associated with hotplug device.
+	 */
+	if (data->hpdev.nr < 0)
+		return 0;
+
 	data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr);
 	if (!data->hpdev.adapter) {
 		dev_err(dev, "Failed to get adapter for bus %d\n",
-- 
2.1.4
