From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v8 0/3] drivers/platform: replace module
 x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Mon, 15 Jan 2018 19:46:06 -0800
Message-ID: <20180116034606.GF4590@fury>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
 <20180116034209.GA4590@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180116034209.GA4590@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 15, 2018 at 07:42:09PM -0800, Darren Hart wrote:
> To follow this email, are two patches which are minor incremental
> cleanups, which I'd appreciate your review of before I push them to
> testing.


From ccfc9b138034b5ccd89da1d938e9241eaeb4dabf Mon Sep 17 00:00:00 2001
Message-Id: <ccfc9b138034b5ccd89da1d938e9241eaeb4dabf.1516073719.git.dvhart@infradead.org>
In-Reply-To: <2c5d26ee913e0f5f7d13c559d85e8da7e4ddcdab.1516073719.git.dvhart@infradead.org>
References: <2c5d26ee913e0f5f7d13c559d85e8da7e4ddcdab.1516073719.git.dvhart@infradead.org>
From: "Darren Hart (VMware)" <dvhart@infradead.org>
Date: Mon, 15 Jan 2018 19:28:10 -0800
Subject: [PATCH 2/2] platform/mellanox: mlxreg-hotplug: Cleanup local variable
 declarations

Make the local variable declarations more consistent throughout the
driver. Separate inline initial assignments when it cleans up the
declaration block.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
Cc: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 78056f7..7cf7c17 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -361,17 +361,18 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
  */
 static void mlxreg_hotplug_work_handler(struct work_struct *work)
 {
-	struct mlxreg_hotplug_priv_data *priv = container_of(work,
-			struct mlxreg_hotplug_priv_data, dwork_irq.work);
 	struct mlxreg_core_hotplug_platform_data *pdata;
+	struct mlxreg_hotplug_priv_data *priv;
 	struct mlxreg_core_item *item;
-	unsigned long flags;
 	u32 regval, aggr_asserted;
-	int i;
-	int ret;
+	unsigned long flags;
+	int i, ret;
 
+	priv = container_of(work, struct mlxreg_hotplug_priv_data,
+			    dwork_irq.work);
 	pdata = dev_get_platdata(&priv->pdev->dev);
 	item = pdata->items;
+
 	/* Mask aggregation event. */
 	ret = regmap_write(priv->regmap, pdata->cell +
 			   MLXREG_HOTPLUG_AGGR_MASK_OFF, 0);
@@ -431,8 +432,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 {
 	struct mlxreg_core_hotplug_platform_data *pdata;
 	struct mlxreg_core_item *item;
-	int i;
-	int ret;
+	int i, ret;
 
 	pdata = dev_get_platdata(&priv->pdev->dev);
 	item = pdata->items;
@@ -520,8 +520,9 @@ static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
 
 static irqreturn_t mlxreg_hotplug_irq_handler(int irq, void *dev)
 {
-	struct mlxreg_hotplug_priv_data *priv =
-				(struct mlxreg_hotplug_priv_data *)dev;
+	struct mlxreg_hotplug_priv_data *priv;
+
+	priv = (struct mlxreg_hotplug_priv_data *)dev;
 
 	/* Schedule work task for immediate execution.*/
 	schedule_delayed_work(&priv->dwork_irq, 0);
-- 
2.9.4
