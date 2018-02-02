From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 3/4] platform/x86: mlx-platform: Fix power cable setting for systems from msn21xx family
Date: Fri,  2 Feb 2018 08:45:47 +0000
Message-ID: <1517561148-38587-4-git-send-email-vadimp@mellanox.com>
References: <1517561148-38587-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1517561148-38587-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Add dedicated structure with power cable setting for Mellanox system from
family msn21xx. These systems do not have physical device for power
unit controller. So, in case power cable is inserted or removed, relevant
interrupt signal is to be handled, status will be updated, but no device
is to be associated with this signal.

Add definition for interrupt low aggregation signal. On system from
msn21xx family, low aggregation mask should be removed in order to allow
signal hit CPU.

Fixes: 6613d18e9038 ("platform/x86: mlx-platform: Move module from arch/x86")
Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 177b40a..4d8078d 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -77,6 +77,8 @@
 #define MLXPLAT_CPLD_AGGR_FAN_MASK_DEF	0x40
 #define MLXPLAT_CPLD_AGGR_MASK_DEF	(MLXPLAT_CPLD_AGGR_PSU_MASK_DEF | \
 					 MLXPLAT_CPLD_AGGR_FAN_MASK_DEF)
+#define MLXPLAT_CPLD_AGGR_MASK_NG_DEF	0x04
+#define MLXPLAT_CPLD_LOW_AGGR_MASK_LOW	0xc0
 #define MLXPLAT_CPLD_AGGR_MASK_MSN21XX	0x04
 #define MLXPLAT_CPLD_PSU_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_PWR_MASK		GENMASK(1, 0)
@@ -295,14 +297,29 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_data = {
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 };
 
+static struct mlxreg_core_data mlxplat_mlxcpld_msn21xx_pwr_items_data[] = {
+	{
+		.label = "pwr1",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(0),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "pwr2",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(1),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
 /* Platform hotplug MSN21xx system family data */
 static struct mlxreg_core_item mlxplat_mlxcpld_msn21xx_items[] = {
 	{
-		.data = mlxplat_mlxcpld_default_pwr_items_data,
+		.data = mlxplat_mlxcpld_msn21xx_pwr_items_data,
 		.aggr_mask = MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_pwr),
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -314,6 +331,8 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn21xx_data = {
 	.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
 static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
-- 
2.1.4
