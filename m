From: michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org
Subject: [PATCH v4 2/4] platform/x86: mlx-platform: support new watchdog type with longer timeout
Date: Mon,  4 May 2020 17:14:25 +0300
Message-ID: <20200504141427.17685-3-michaelsh@mellanox.com>
References: <20200504141427.17685-1-michaelsh@mellanox.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200504141427.17685-1-michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

Add verification of WD capability in order to distinguish between
the existing WD types and new type, implemented in CPLD.
Add configuration for a new WD type.
Change access mode for watchdog registers.

Signed-off-by: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Reviewed-by: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Acked-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v3-v4
Platform driver part acknowledged by Andy Shevchenko
---
 drivers/platform/x86/mlx-platform.c | 106 ++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index c27548fd386a..9d3371cd58d5 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -178,7 +178,9 @@
 #define MLXPLAT_CPLD_WD_RESET_ACT_MASK	GENMASK(7, 1)
 #define MLXPLAT_CPLD_WD_FAN_ACT_MASK	(GENMASK(7, 0) & ~BIT(4))
 #define MLXPLAT_CPLD_WD_COUNT_ACT_MASK	(GENMASK(7, 0) & ~BIT(7))
+#define MLXPLAT_CPLD_WD_CPBLTY_MASK	(GENMASK(7, 0) & ~BIT(6))
 #define MLXPLAT_CPLD_WD_DFLT_TIMEOUT	30
+#define MLXPLAT_CPLD_WD3_DFLT_TIMEOUT	600
 #define MLXPLAT_CPLD_WD_MAX_DEVS	2
 
 /* mlxplat_priv - platform private data
@@ -1959,6 +1961,84 @@ static struct mlxreg_core_platform_data mlxplat_mlxcpld_wd_set_type2[] = {
 	},
 };
 
+/* Watchdog type3: hardware implementation version 3
+ * Can be on all systems. It's differentiated by WD capability bit.
+ * Old systems (MSN2700, MSN2410, MSN2740, MSN2100 and MSN2140)
+ * still have only one main watchdog.
+ */
+static struct mlxreg_core_data mlxplat_mlxcpld_wd_main_regs_type3[] = {
+	{
+		.label = "action",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_RESET_ACT_MASK,
+		.bit = 0,
+	},
+	{
+		.label = "timeout",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD2_TMR_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_TYPE2_TO_MASK,
+		.health_cntr = MLXPLAT_CPLD_WD3_DFLT_TIMEOUT,
+	},
+	{
+		.label = "timeleft",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD2_TMR_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_TYPE2_TO_MASK,
+	},
+	{
+		.label = "ping",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_RESET_ACT_MASK,
+		.bit = 0,
+	},
+	{
+		.label = "reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.bit = 6,
+	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_wd_aux_regs_type3[] = {
+	{
+		.label = "action",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_FAN_ACT_MASK,
+		.bit = 4,
+	},
+	{
+		.label = "timeout",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_TYPE2_TO_MASK,
+		.health_cntr = MLXPLAT_CPLD_WD3_DFLT_TIMEOUT,
+	},
+	{
+		.label = "timeleft",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_TYPE2_TO_MASK,
+	},
+	{
+		.label = "ping",
+		.reg = MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET,
+		.mask = MLXPLAT_CPLD_WD_FAN_ACT_MASK,
+		.bit = 4,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_mlxcpld_wd_set_type3[] = {
+	{
+		.data = mlxplat_mlxcpld_wd_main_regs_type3,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_wd_main_regs_type3),
+		.version = MLX_WDT_TYPE3,
+		.identity = "mlx-wdt-main",
+	},
+	{
+		.data = mlxplat_mlxcpld_wd_aux_regs_type3,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_wd_aux_regs_type3),
+		.version = MLX_WDT_TYPE3,
+		.identity = "mlx-wdt-aux",
+	},
+};
+
 static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
@@ -1989,8 +2069,10 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD1_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD1_ACT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD2_TMR_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_WD2_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET:
@@ -2601,6 +2683,27 @@ static int mlxplat_mlxcpld_verify_bus_topology(int *nr)
 	return 0;
 }
 
+static int mlxplat_mlxcpld_check_wd_capability(void *regmap)
+{
+	u32 regval;
+	int i, rc;
+
+	rc = regmap_read(regmap, MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+			 &regval);
+	if (rc)
+		return rc;
+
+	if (!(regval & ~MLXPLAT_CPLD_WD_CPBLTY_MASK)) {
+		for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type3); i++) {
+			if (mlxplat_wd_data[i])
+				mlxplat_wd_data[i] =
+					&mlxplat_mlxcpld_wd_set_type3[i];
+		}
+	}
+
+	return 0;
+}
+
 static int __init mlxplat_init(void)
 {
 	struct mlxplat_priv *priv;
@@ -2733,6 +2836,9 @@ static int __init mlxplat_init(void)
 	}
 
 	/* Add WD drivers. */
+	err = mlxplat_mlxcpld_check_wd_capability(priv->regmap);
+	if (err)
+		goto fail_platform_wd_register;
 	for (j = 0; j < MLXPLAT_CPLD_WD_MAX_DEVS; j++) {
 		if (mlxplat_wd_data[j]) {
 			mlxplat_wd_data[j]->regmap = priv->regmap;
-- 
2.11.0
