From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v1 8/9] platform/mellanox: mlxreg-hotplug: Add support for new capability register
Date: Tue, 31 Dec 2019 10:29:16 +0000
Message-ID: <20191231102917.24181-9-vadimp@mellanox.com>
References: <20191231102917.24181-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191231102917.24181-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Add support for capability register, which is used for detection of the
actual number of interrupt capable components within the particular
group, supported by the specific system.
Such components could be for example the number of power units and
interrupts related to these units.
The motivation is to avoid adding a new code in the future in order to
distinct between the systems type supported different number of the
components like power supplies, FANs, ASICs, line cards.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 14 ++++++++++++++
 include/linux/platform_data/mlxreg.h       |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 706207d192ae..77be37a1fbcf 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -504,6 +504,20 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 	item = pdata->items;
 
 	for (i = 0; i < pdata->counter; i++, item++) {
+		if (item->capability) {
+			/*
+			 * Read group capability register to get actual number
+			 * of interrupt capable components and set group mask
+			 * accordingly.
+			 */
+			ret = regmap_read(priv->regmap, item->capability,
+					  &regval);
+			if (ret)
+				goto out;
+
+			item->mask = GENMASK((regval & item->mask) - 1, 0);
+		}
+
 		/* Clear group presense event. */
 		ret = regmap_write(priv->regmap, item->reg +
 				   MLXREG_HOTPLUG_EVENT_OFF, 0);
diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 6d54fe3bcac9..b8da8aef2446 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -101,6 +101,7 @@ struct mlxreg_core_data {
  * @aggr_mask: group aggregation mask;
  * @reg: group interrupt status register;
  * @mask: group interrupt mask;
+ * @capability: group capability register;
  * @cache: last status value for elements fro the same group;
  * @count: number of available elements in the group;
  * @ind: element's index inside the group;
@@ -112,6 +113,7 @@ struct mlxreg_core_item {
 	u32 aggr_mask;
 	u32 reg;
 	u32 mask;
+	u32 capability;
 	u32 cache;
 	u8 count;
 	u8 ind;
-- 
2.11.0
