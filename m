From: michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org
Subject: [PATCH v4 3/4] watchdog: mlx-wdt: support new watchdog type with longer timeout period
Date: Mon,  4 May 2020 17:14:26 +0300
Message-ID: <20200504141427.17685-4-michaelsh@mellanox.com>
References: <20200504141427.17685-1-michaelsh@mellanox.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200504141427.17685-1-michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>

New programmable logic device can have watchdog type 3 implementation.
It's same as Type 2 with extended maximum timeout period.
Maximum timeout is up-to 65535 sec.
Type 3 HW watchdog implementation can exist on all Mellanox systems.
It is differentiated by WD capability bit.

Signed-off-by: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Reviewed-by: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
---
v1-v2:
Make changes pointed out by Guenter:
-Simplify bit operations
-Consistency in registers access
-Don't check irrelevant return code
---
v2-v3
Remove unnecessary cpu_to_le16 and vice versa conversions
---
 drivers/watchdog/mlx_wdt.c | 73 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/mlx_wdt.c b/drivers/watchdog/mlx_wdt.c
index 03b9ac4b99af..54193369e85c 100644
--- a/drivers/watchdog/mlx_wdt.c
+++ b/drivers/watchdog/mlx_wdt.c
@@ -21,6 +21,7 @@
 #define MLXREG_WDT_CLOCK_SCALE		1000
 #define MLXREG_WDT_MAX_TIMEOUT_TYPE1	32
 #define MLXREG_WDT_MAX_TIMEOUT_TYPE2	255
+#define MLXREG_WDT_MAX_TIMEOUT_TYPE3	65535
 #define MLXREG_WDT_MIN_TIMEOUT		1
 #define MLXREG_WDT_OPTIONS_BASE (WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | \
 				 WDIOF_SETTIMEOUT)
@@ -49,6 +50,7 @@ struct mlxreg_wdt {
 	int tleft_idx;
 	int ping_idx;
 	int reset_idx;
+	int regmap_val_sz;
 	enum mlxreg_wdt_type wdt_type;
 };
 
@@ -111,7 +113,8 @@ static int mlxreg_wdt_set_timeout(struct watchdog_device *wdd,
 	u32 regval, set_time, hw_timeout;
 	int rc;
 
-	if (wdt->wdt_type == MLX_WDT_TYPE1) {
+	switch (wdt->wdt_type) {
+	case MLX_WDT_TYPE1:
 		rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
 		if (rc)
 			return rc;
@@ -120,14 +123,32 @@ static int mlxreg_wdt_set_timeout(struct watchdog_device *wdd,
 		regval = (regval & reg_data->mask) | hw_timeout;
 		/* Rowndown to actual closest number of sec. */
 		set_time = BIT(hw_timeout) / MLXREG_WDT_CLOCK_SCALE;
-	} else {
+		rc = regmap_write(wdt->regmap, reg_data->reg, regval);
+		break;
+	case MLX_WDT_TYPE2:
+		set_time = timeout;
+		rc = regmap_write(wdt->regmap, reg_data->reg, timeout);
+		break;
+	case MLX_WDT_TYPE3:
+		/* WD_TYPE3 has 2B set time register */
 		set_time = timeout;
-		regval = timeout;
+		if (wdt->regmap_val_sz == 1) {
+			regval = timeout & 0xff;
+			rc = regmap_write(wdt->regmap, reg_data->reg, regval);
+			if (!rc) {
+				regval = (timeout & 0xff00) >> 8;
+				rc = regmap_write(wdt->regmap,
+						reg_data->reg + 1, regval);
+			}
+		} else {
+			rc = regmap_write(wdt->regmap, reg_data->reg, timeout);
+		}
+		break;
+	default:
+		return -EINVAL;
 	}
 
 	wdd->timeout = set_time;
-	rc = regmap_write(wdt->regmap, reg_data->reg, regval);
-
 	if (!rc) {
 		/*
 		 * Restart watchdog with new timeout period
@@ -147,10 +168,25 @@ static unsigned int mlxreg_wdt_get_timeleft(struct watchdog_device *wdd)
 {
 	struct mlxreg_wdt *wdt = watchdog_get_drvdata(wdd);
 	struct mlxreg_core_data *reg_data = &wdt->pdata->data[wdt->tleft_idx];
-	u32 regval;
+	u32 regval, msb, lsb;
 	int rc;
 
-	rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
+	if (wdt->wdt_type == MLX_WDT_TYPE2) {
+		rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
+	} else {
+		/* WD_TYPE3 has 2 byte timeleft register */
+		if (wdt->regmap_val_sz == 1) {
+			rc = regmap_read(wdt->regmap, reg_data->reg, &lsb);
+			if (!rc) {
+				rc = regmap_read(wdt->regmap,
+						reg_data->reg + 1, &msb);
+				regval = (msb & 0xff) << 8 | (lsb & 0xff);
+			}
+		} else {
+			rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
+		}
+	}
+
 	/* Return 0 timeleft in case of failure register read. */
 	return rc == 0 ? regval : 0;
 }
@@ -212,13 +248,23 @@ static void mlxreg_wdt_config(struct mlxreg_wdt *wdt,
 		wdt->wdd.info = &mlxreg_wdt_aux_info;
 
 	wdt->wdt_type = pdata->version;
-	if (wdt->wdt_type == MLX_WDT_TYPE2) {
-		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
-		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE2;
-	} else {
+	switch (wdt->wdt_type) {
+	case MLX_WDT_TYPE1:
 		wdt->wdd.ops = &mlxreg_wdt_ops_type1;
 		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE1;
+		break;
+	case MLX_WDT_TYPE2:
+		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
+		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE2;
+		break;
+	case MLX_WDT_TYPE3:
+		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
+		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE3;
+		break;
+	default:
+		break;
 	}
+
 	wdt->wdd.min_timeout = MLXREG_WDT_MIN_TIMEOUT;
 }
 
@@ -249,6 +295,11 @@ static int mlxreg_wdt_probe(struct platform_device *pdev)
 
 	wdt->wdd.parent = dev;
 	wdt->regmap = pdata->regmap;
+	rc = regmap_get_val_bytes(wdt->regmap);
+	if (rc < 0)
+		return -EINVAL;
+
+	wdt->regmap_val_sz = rc;
 	mlxreg_wdt_config(wdt, pdata);
 
 	if ((pdata->features & MLXREG_CORE_WD_FEATURE_NOWAYOUT))
-- 
2.11.0
