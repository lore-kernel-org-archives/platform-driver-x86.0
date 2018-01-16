From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v8 0/3] drivers/platform: replace module
 x86/mlxcpld-hotplug with mellanox/mlxreg-hotplug
Date: Mon, 15 Jan 2018 19:45:11 -0800
Message-ID: <20180116034511.GE4590@fury>
References: <1515661123-76604-1-git-send-email-vadimp@mellanox.com>
 <20180116034209.GA4590@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:52414 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750842AbeAPDpN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jan 2018 22:45:13 -0500
Content-Disposition: inline
In-Reply-To: <20180116034209.GA4590@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Mon, Jan 15, 2018 at 07:42:09PM -0800, Darren Hart wrote:
> To follow this email, are two patches which are minor incremental
> cleanups, which I'd appreciate your review of before I push them to
> testing.


From 2c5d26ee913e0f5f7d13c559d85e8da7e4ddcdab Mon Sep 17 00:00:00 2001
Message-Id: <2c5d26ee913e0f5f7d13c559d85e8da7e4ddcdab.1516073719.git.dvhart@infradead.org>
From: "Darren Hart (VMware)" <dvhart@infradead.org>
Date: Mon, 15 Jan 2018 19:16:36 -0800
Subject: [PATCH 1/2] platform/mellanox: mlxreg-hotplug: Simplify exit path

Several functions use a "goto access_error" pattern result in a
duplicated exit path at the end of the function. Address this by using a
single exit path, and checking for (ret) prior to printing the error
message. This adds a conditional, but only in the failure case, and
simplifies the exit path.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
Cc: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 62 ++++++++++++------------------
 1 file changed, 25 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 9bbaa8c..78056f7 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -236,12 +236,12 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 	ret = regmap_write(priv->regmap, item->reg + MLXREG_HOTPLUG_MASK_OFF,
 			   0);
 	if (ret)
-		goto access_error;
+		goto out;
 
 	/* Read status. */
 	ret = regmap_read(priv->regmap, item->reg, &regval);
 	if (ret)
-		goto access_error;
+		goto out;
 
 	/* Set asserted bits and save last status. */
 	regval &= item->mask;
@@ -267,18 +267,15 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 	ret = regmap_write(priv->regmap, item->reg + MLXREG_HOTPLUG_EVENT_OFF,
 			   0);
 	if (ret)
-		goto access_error;
+		goto out:
 
 	/* Unmask event. */
 	ret = regmap_write(priv->regmap, item->reg + MLXREG_HOTPLUG_MASK_OFF,
 			   item->mask);
-	if (ret)
-		goto access_error;
-
-	return;
 
-access_error:
-	dev_err(priv->dev, "Failed to complete workqueue.\n");
+ out:
+	if (ret)
+		dev_err(priv->dev, "Failed to complete workqueue.\n");
 }
 
 static void
@@ -294,12 +291,12 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
 		ret = regmap_write(priv->regmap, data->reg +
 				   MLXREG_HOTPLUG_MASK_OFF, 0);
 		if (ret)
-			goto access_error;
+			goto out;
 
 		/* Read status. */
 		ret = regmap_read(priv->regmap, data->reg, &regval);
 		if (ret)
-			goto access_error;
+			goto out;
 
 		regval &= data->mask;
 		item->cache = regval;
@@ -321,19 +318,18 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
 		ret = regmap_write(priv->regmap, data->reg +
 				   MLXREG_HOTPLUG_EVENT_OFF, 0);
 		if (ret)
-			goto access_error;
+			goto out;
 
 		/* Unmask event. */
 		ret = regmap_write(priv->regmap, data->reg +
 				   MLXREG_HOTPLUG_MASK_OFF, data->mask);
 		if (ret)
-			goto access_error;
+			goto out;
 	}
 
-	return;
-
-access_error:
-	dev_err(priv->dev, "Failed to complete workqueue.\n");
+ out:
+	if (ret)
+		dev_err(priv->dev, "Failed to complete workqueue.\n");
 }
 
 /*
@@ -380,12 +376,12 @@ static void mlxreg_hotplug_work_handler(struct work_struct *work)
 	ret = regmap_write(priv->regmap, pdata->cell +
 			   MLXREG_HOTPLUG_AGGR_MASK_OFF, 0);
 	if (ret < 0)
-		goto access_error;
+		goto out;
 
 	/* Read aggregation status. */
 	ret = regmap_read(priv->regmap, pdata->cell, &regval);
 	if (ret)
-		goto access_error;
+		goto out;
 
 	regval &= pdata->mask;
 	aggr_asserted = priv->aggr_cache ^ regval;
@@ -425,13 +421,10 @@ static void mlxreg_hotplug_work_handler(struct work_struct *work)
 	/* Unmask aggregation event (no need acknowledge). */
 	ret = regmap_write(priv->regmap, pdata->cell +
 			   MLXREG_HOTPLUG_AGGR_MASK_OFF, pdata->mask);
-	if (ret)
-		goto access_error;
 
-	return;
-
-access_error:
-	dev_err(priv->dev, "Failed to complete workqueue.\n");
+ out:
+	if (ret)
+		dev_err(priv->dev, "Failed to complete workqueue.\n");
 }
 
 static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
@@ -449,7 +442,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 		ret = regmap_write(priv->regmap, item->reg +
 				   MLXREG_HOTPLUG_EVENT_OFF, 0);
 		if (ret)
-			goto access_error;
+			goto out;
 
 		/* Set group initial status as mask and unmask group event. */
 		if (item->inversed) {
@@ -458,7 +451,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 					   MLXREG_HOTPLUG_MASK_OFF,
 					   item->mask);
 			if (ret)
-				goto access_error;
+				goto out;
 		}
 	}
 
@@ -466,7 +459,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 	ret = regmap_write(priv->regmap, pdata->cell +
 			   MLXREG_HOTPLUG_AGGR_MASK_OFF, pdata->mask);
 	if (ret)
-		goto access_error;
+		goto out;
 
 	/* Keep low aggregation initial status as zero and unmask events. */
 	if (pdata->cell_low) {
@@ -474,21 +467,16 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 				   MLXREG_HOTPLUG_AGGR_MASK_OFF,
 				   pdata->mask_low);
 		if (ret)
-			goto access_error;
+			goto out;
 	}
 
 	/* Invoke work handler for initializing hot plug devices setting. */
 	mlxreg_hotplug_work_handler(&priv->dwork_irq.work);
 
+ out:
+	if (ret)
+		dev_err(priv->dev, "Failed to set interrupts.\n");
 	enable_irq(priv->irq);
-
-	return 0;
-
-access_error:
-	dev_err(priv->dev, "Failed to set interrupts.\n");
-
-	enable_irq(priv->irq);
-
 	return ret;
 }
 
-- 
2.9.4
