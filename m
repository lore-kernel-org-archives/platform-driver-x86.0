From: vadimp@mellanox.com
Subject: [patch v1 2/2] drivers/platform/x86: add mlxcpld-hotplug driver registration to mlx-platform driver
Date: Thu, 27 Oct 2016 13:59:30 +0000
Message-ID: <1477576770-102060-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, fengguang.wu@intel.com
Cc: davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, andriy.shevchenko@linux.intel.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Vadim Pasternak <vadimp@mellanox.com>

Add calls for mlxcpld-hotplug platform driver registration/unregistration
and add platform hotplug data configurations.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 100 +++++++++++++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 86a1356..ef9fd1f 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -37,8 +37,9 @@
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/platform_data/i2c-mux-reg.h>
+#include <linux/platform_data/mlxcpld-hotplug.h>
+#include <linux/platform_device.h>
 
 #define MLX_PLAT_DEVICE_NAME		"mlxplat"
 
@@ -70,6 +71,7 @@
 struct mlxplat_priv {
 	struct platform_device *pdev_i2c;
 	struct platform_device *pdev_mux[MLXPLAT_CPLD_LPC_MUX_DEVS];
+	struct platform_device *pdev_hotplug;
 };
 
 /* Regions for LPC I2C controller and LPC base register space */
@@ -121,7 +123,87 @@ static struct i2c_mux_reg_platform_data mlxplat_mux_data[] = {
 
 };
 
-static struct platform_device *mlxplat_dev;
+/* Platform hotplug devices */
+static struct mlxcpld_hotplug_device mlxplat_mlxcpld_hotplug_psu[] = {
+	{
+		.brdinfo = { I2C_BOARD_INFO("24c02", 0x51) },
+		.bus = 10,
+	},
+	{
+		.brdinfo = { I2C_BOARD_INFO("24c02", 0x50) },
+		.bus = 10,
+	},
+};
+
+static struct mlxcpld_hotplug_device mlxplat_mlxcpld_hotplug_pwr[] = {
+	{
+		.brdinfo = { I2C_BOARD_INFO("dps460", 0x59) },
+		.bus = 10,
+	},
+	{
+		.brdinfo = { I2C_BOARD_INFO("dps460", 0x58) },
+		.bus = 10,
+	},
+};
+
+static struct mlxcpld_hotplug_device mlxplat_mlxcpld_hotplug_fan[] = {
+	{
+		.brdinfo = { I2C_BOARD_INFO("24c32", 0x50) },
+		.bus = 11,
+	},
+	{
+		.brdinfo = { I2C_BOARD_INFO("24c32", 0x50) },
+		.bus = 12,
+	},
+	{
+		.brdinfo = { I2C_BOARD_INFO("24c32", 0x50) },
+		.bus = 13,
+	},
+	{
+		.brdinfo = { I2C_BOARD_INFO("24c32", 0x50) },
+		.bus = 14,
+	},
+};
+
+/* Platform hotplug default data */
+static
+struct mlxcpld_hotplug_platform_data mlxplat_mlxcpld_hotplug_default_data = {
+	.top_aggr_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x3a),
+	.top_aggr_mask = 0x48,
+	.top_aggr_psu_mask = 0x08,
+	.psu_reg_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x58),
+	.psu_mask = 0x03,
+	.psu_count = ARRAY_SIZE(mlxplat_mlxcpld_hotplug_psu),
+	.psu = mlxplat_mlxcpld_hotplug_psu,
+	.top_aggr_pwr_mask = 0x08,
+	.pwr_reg_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x64),
+	.pwr_mask = 0x03,
+	.pwr_count = ARRAY_SIZE(mlxplat_mlxcpld_hotplug_pwr),
+	.pwr = mlxplat_mlxcpld_hotplug_pwr,
+	.top_aggr_fan_mask = 0x40,
+	.fan_reg_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x88),
+	.fan_mask = 0x0f,
+	.fan_count = ARRAY_SIZE(mlxplat_mlxcpld_hotplug_fan),
+	.fan = mlxplat_mlxcpld_hotplug_fan,
+};
+
+/* Platform hotplug MSN21xx system family data */
+static
+struct mlxcpld_hotplug_platform_data mlxplat_mlxcpld_hotplug_msn21xx_data = {
+	.top_aggr_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x3a),
+	.top_aggr_mask = 0x04,
+	.top_aggr_pwr_mask = 0x04,
+	.pwr_reg_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x64),
+	.pwr_mask = 0x03,
+	.pwr_count = ARRAY_SIZE(mlxplat_mlxcpld_hotplug_pwr),
+};
+
+static struct resource mlxplat_mlxcpld_hotplug_resources[] = {
+	[0] = DEFINE_RES_IRQ_NAMED(17, "mlxcpld-hotplug"),
+};
+
+struct platform_device *mlxplat_dev;
+struct mlxcpld_hotplug_platform_data *mlxplat_hotplug;
 
 static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
 {
@@ -132,6 +214,7 @@ static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
 		mlxplat_mux_data[i].n_values =
 				ARRAY_SIZE(mlxplat_default_channels[i]);
 	}
+	mlxplat_hotplug = &mlxplat_mlxcpld_hotplug_default_data;
 
 	return 1;
 };
@@ -145,6 +228,7 @@ static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
 		mlxplat_mux_data[i].n_values =
 				ARRAY_SIZE(mlxplat_msn21xx_channels);
 	}
+	mlxplat_hotplug = &mlxplat_mlxcpld_hotplug_msn21xx_data;
 
 	return 1;
 };
@@ -230,6 +314,16 @@ static int __init mlxplat_init(void)
 		}
 	}
 
+	priv->pdev_hotplug = platform_device_register_resndata(
+				&mlxplat_dev->dev, "mlxcpld-hotplug", -1,
+				mlxplat_mlxcpld_hotplug_resources,
+				ARRAY_SIZE(mlxplat_mlxcpld_hotplug_resources),
+				mlxplat_hotplug, sizeof(*mlxplat_hotplug));
+	if (IS_ERR(priv->pdev_hotplug)) {
+		err = PTR_ERR(priv->pdev_hotplug);
+		goto fail_platform_mux_register;
+	}
+
 	return 0;
 
 fail_platform_mux_register:
@@ -248,6 +342,8 @@ static void __exit mlxplat_exit(void)
 	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
 	int i;
 
+	platform_device_unregister(priv->pdev_hotplug);
+
 	for (i = ARRAY_SIZE(mlxplat_mux_data) - 1; i >= 0 ; i--)
 		platform_device_unregister(priv->pdev_mux[i]);
 
-- 
2.1.4
