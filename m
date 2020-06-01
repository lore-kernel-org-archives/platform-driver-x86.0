From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v1 1/8] platform/mellanox: mlxreg-hotplug: Use capability register for attribute creation
Date: Mon,  1 Jun 2020 12:18:44 +0300
Message-ID: <20200601091851.5491-2-vadimp@mellanox.com>
References: <20200601091851.5491-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200601091851.5491-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Create the 'sysfs' attributes according to configuration provided
through the capability register, which purpose is to indicate the
actual number of the components within the particular group.
Such components could be, for example the FAN or power supply units.
The motivation is to avoid adding a new code in the future in order to
distinct between the systems types supported different number of the
components like power supplies, FANs, ASICs, line cards.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 54 ++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 77be37a1fbcf..832fcf282d45 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -196,17 +196,46 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 	struct mlxreg_core_hotplug_platform_data *pdata;
 	struct mlxreg_core_item *item;
 	struct mlxreg_core_data *data;
-	int num_attrs = 0, id = 0, i, j;
+	u32 regval;
+	int num_attrs = 0, id = 0, i, j, k, ret;
 
 	pdata = dev_get_platdata(&priv->pdev->dev);
 	item = pdata->items;
 
 	/* Go over all kinds of items - psu, pwr, fan. */
 	for (i = 0; i < pdata->counter; i++, item++) {
-		num_attrs += item->count;
+		if (item->capability) {
+			/*
+			 * Read group capability register to get actual number
+			 * of interrupt capable components and set group mask
+			 * accordingly.
+			 */
+			ret = regmap_read(priv->regmap, item->capability,
+					  &regval);
+			if (ret)
+				return ret;
+
+			item->mask = GENMASK((regval & item->mask) - 1, 0);
+		}
+
 		data = item->data;
 		/* Go over all units within the item. */
-		for (j = 0; j < item->count; j++, data++, id++) {
+		for (j = 0, k = 0; j < item->count; j++, data++) {
+			/* Skip if bit in mask is not set. */
+			if (!(item->mask & BIT(j)))
+				continue;
+			if (data->capability) {
+				/*
+				 * Read capability register and skip non
+				 * relevant attributes.
+				 */
+				ret = regmap_read(priv->regmap,
+						  data->capability, &regval);
+				if (ret)
+					return ret;
+				if (!(regval & data->bit))
+					continue;
+			}
 			PRIV_ATTR(id) = &PRIV_DEV_ATTR(id).dev_attr.attr;
 			PRIV_ATTR(id)->name = devm_kasprintf(&priv->pdev->dev,
 							     GFP_KERNEL,
@@ -224,9 +253,12 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 			PRIV_DEV_ATTR(id).dev_attr.show =
 						mlxreg_hotplug_attr_show;
 			PRIV_DEV_ATTR(id).nr = i;
-			PRIV_DEV_ATTR(id).index = j;
+			PRIV_DEV_ATTR(id).index = k;
 			sysfs_attr_init(&PRIV_DEV_ATTR(id).dev_attr.attr);
+			id++;
+			k++;
 		}
+		num_attrs += k;
 	}
 
 	priv->group.attrs = devm_kcalloc(&priv->pdev->dev,
@@ -504,20 +536,6 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 	item = pdata->items;
 
 	for (i = 0; i < pdata->counter; i++, item++) {
-		if (item->capability) {
-			/*
-			 * Read group capability register to get actual number
-			 * of interrupt capable components and set group mask
-			 * accordingly.
-			 */
-			ret = regmap_read(priv->regmap, item->capability,
-					  &regval);
-			if (ret)
-				goto out;
-
-			item->mask = GENMASK((regval & item->mask) - 1, 0);
-		}
-
 		/* Clear group presense event. */
 		ret = regmap_write(priv->regmap, item->reg +
 				   MLXREG_HOTPLUG_EVENT_OFF, 0);
-- 
2.11.0
