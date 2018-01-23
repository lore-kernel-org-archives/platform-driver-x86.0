From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v10 3/6] platform/mellanox: Rename i2c bus to nr
Date: Tue, 23 Jan 2018 20:34:22 +0000
Message-ID: <1516739665-132304-3-git-send-email-vadimp@mellanox.com>
References: <1516739665-132304-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:40344 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752501AbeAWSiR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Jan 2018 13:38:17 -0500
In-Reply-To: <1516739665-132304-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

Use Linux convention of nr instead of bus for i2c adapter number.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v9->v10:
 Fixes provideded by Darren:
 - refactore commit into smaller functional changes;
---
 drivers/platform/mellanox/mlxreg-hotplug.c |  6 +++---
 drivers/platform/x86/mlx-platform.c        | 16 ++++++++--------
 include/linux/platform_data/mlxreg.h       |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 1a04cb2..5f0b4ff 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -101,17 +101,17 @@ struct mlxreg_hotplug_priv_data {
 static int mlxreg_hotplug_device_create(struct device *dev,
 					struct mlxreg_hotplug_device *item)
 {
-	item->adapter = i2c_get_adapter(item->bus);
+	item->adapter = i2c_get_adapter(item->nr);
 	if (!item->adapter) {
 		dev_err(dev, "Failed to get adapter for bus %d\n",
-			item->bus);
+			item->nr);
 		return -EFAULT;
 	}
 
 	item->client = i2c_new_device(item->adapter, &item->brdinfo);
 	if (!item->client) {
 		dev_err(dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
-			item->brdinfo.type, item->bus, item->brdinfo.addr);
+			item->brdinfo.type, item->nr, item->brdinfo.addr);
 		i2c_put_adapter(item->adapter);
 		item->adapter = NULL;
 		return -EFAULT;
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
index 8dcbb8e..ffbcb78 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -39,7 +39,7 @@
  * @adapter: I2C device adapter;
  * @client: I2C device client;
  * @brdinfo: device board information;
- * @bus: I2C bus, where device is attached;
+ * @nr: I2C device adapter number, to which device is to be attached;
  *
  * Structure represents I2C hotplug device static data (board topology) and
  * dynamic data (related kernel objects handles).
@@ -48,7 +48,7 @@ struct mlxreg_hotplug_device {
 	struct i2c_adapter *adapter;
 	struct i2c_client *client;
 	struct i2c_board_info brdinfo;
-	u16 bus;
+	int nr;
 };
 
 /**
-- 
2.1.4
