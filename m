From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v11 09/12] platform/x86: mlx-platform: Simplify IO access to regmap context
Date: Wed, 24 Jan 2018 20:34:55 +0000
Message-ID: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Get rid of struct mlxplat_mlxcpld_regmap_context, which contains only the
field with base address. Instead obtain base memory address by
devm_ioport_map  to local variable and pass it to devm_regmap_init.

Modify mlxplat_mlxcpld_reg_read/write to directly use pointer to context
for IO operations.

Add missed description of pdev_hotplug for struct mlxplat_priv.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 03c9e7a..81a7306 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -83,6 +83,7 @@
 /* mlxplat_priv - platform private data
  * @pdev_i2c - i2c controller platform device
  * @pdev_mux - array of mux platform devices
+ * @pdev_hotplug - hotplug platform devices
  */
 struct mlxplat_priv {
 	struct platform_device *pdev_i2c;
@@ -298,27 +299,17 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn21xx_data = {
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 };
 
-struct mlxplat_mlxcpld_regmap_context {
-	void __iomem *base;
-};
-
-static struct mlxplat_mlxcpld_regmap_context mlxplat_mlxcpld_regmap_ctx;
-
 static int
 mlxplat_mlxcpld_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
-	struct mlxplat_mlxcpld_regmap_context *ctx = context;
-
-	*val = ioread8(ctx->base + reg);
+	*val = ioread8(context + reg);
 	return 0;
 }
 
 static int
 mlxplat_mlxcpld_reg_write(void *context, unsigned int reg, unsigned int val)
 {
-	struct mlxplat_mlxcpld_regmap_context *ctx = context;
-
-	iowrite8(val, ctx->base + reg);
+	iowrite8(val, context + reg);
 	return 0;
 }
 
@@ -407,6 +398,7 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 static int __init mlxplat_init(void)
 {
 	struct mlxplat_priv *priv;
+	void __iomem *base;
 	int i, err;
 
 	if (!dmi_check_system(mlxplat_dmi_table))
@@ -446,16 +438,15 @@ static int __init mlxplat_init(void)
 		}
 	}
 
-	mlxplat_mlxcpld_regmap_ctx.base = devm_ioport_map(&mlxplat_dev->dev,
+	base = devm_ioport_map(&mlxplat_dev->dev,
 			       mlxplat_lpc_resources[1].start, 1);
-	if (IS_ERR(mlxplat_mlxcpld_regmap_ctx.base)) {
-		err = PTR_ERR(mlxplat_mlxcpld_regmap_ctx.base);
+	if (IS_ERR(base)) {
+		err = PTR_ERR(base);
 		goto fail_platform_mux_register;
 	}
 
 	mlxplat_hotplug->regmap = devm_regmap_init(&mlxplat_dev->dev, NULL,
-					&mlxplat_mlxcpld_regmap_ctx,
-					&mlxplat_mlxcpld_regmap_config);
+					base, &mlxplat_mlxcpld_regmap_config);
 	if (IS_ERR(mlxplat_hotplug->regmap)) {
 		err = PTR_ERR(mlxplat_hotplug->regmap);
 		goto fail_platform_mux_register;
-- 
2.1.4
