Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACC8C43332
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6CDA64F8C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhBCRhY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 12:37:24 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50964 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232138AbhBCRhX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 12:37:23 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 3 Feb 2021 19:36:28 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 113HaOOJ001002;
        Wed, 3 Feb 2021 19:36:28 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy@infradead.org, hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH RFC platform-next 4/8] platform/mellanox: mlxreg-hotplug: Extend logic for hotplug devices operations
Date:   Wed,  3 Feb 2021 19:36:18 +0200
Message-Id: <20210203173622.5845-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210203173622.5845-1-vadimp@nvidia.com>
References: <20210203173622.5845-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend the structure 'mlxreg_hotplug_device" with platform device field
to allow transition of the register map and system interrupt line number
to underlying hotplug devices, sharing the same register map and
same interrupt line with 'mlxreg-hotplug' driver.

Extend logic for hotplug devices creation and removing according to
the action associated with the hotplug device description. Previously
hotplug driver was capable to attach / de-attach upon hotplug events
only I2C devices handled by simple I2C drivers. Now it should be able
to attach also devices handled by the platform drivers.

The motivation is to allow transition of platform data like:
- system interrupt line number, sharing with 'mlxreg-hotplug' to
  underlying hotplug devices.
- shared register map of programmable devices on main board to
  underlying hotplug devices.

Additioanlly the number of 'sysfs’ attributes is increased, since
modular system defines more 'sysfs’ attributes.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 96 ++++++++++++++++++++++--------
 include/linux/platform_data/mlxreg.h       |  2 +
 2 files changed, 72 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index b013445147dd..b0512e525964 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -28,7 +28,7 @@
 /* ASIC good health mask. */
 #define MLXREG_HOTPLUG_GOOD_HEALTH_MASK	0x02
 
-#define MLXREG_HOTPLUG_ATTRS_MAX	24
+#define MLXREG_HOTPLUG_ATTRS_MAX	128
 #define MLXREG_HOTPLUG_NOT_ASSERT	3
 
 /**
@@ -89,9 +89,19 @@ mlxreg_hotplug_udev_event_send(struct kobject *kobj,
 	return kobject_uevent_env(kobj, KOBJ_CHANGE, mlxreg_hotplug_udev_envp);
 }
 
+static void
+mlxreg_hotplug_pdata_export(void *pdata, void *regmap)
+{
+	struct mlxreg_core_hotplug_platform_data *dev_pdata = pdata;
+
+	/* Export regmap to underlying device. */
+	dev_pdata->regmap = regmap;
+}
+
 static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
 					struct mlxreg_core_data *data)
 {
+	struct i2c_board_info *brdinfo = data->hpdev.brdinfo;
 	struct mlxreg_core_hotplug_platform_data *pdata;
 	struct i2c_client *client;
 
@@ -106,27 +116,51 @@ static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
 		return 0;
 
 	pdata = dev_get_platdata(&priv->pdev->dev);
-	data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr +
-					      pdata->shift_nr);
-	if (!data->hpdev.adapter) {
-		dev_err(priv->dev, "Failed to get adapter for bus %d\n",
-			data->hpdev.nr + pdata->shift_nr);
-		return -EFAULT;
-	}
+	switch (data->hpdev.action) {
+	case MLXREG_HOTPLUG_DEVICE_DEFAULT_ACTION:
+		data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr +
+						      pdata->shift_nr);
+		if (!data->hpdev.adapter) {
+			dev_err(priv->dev, "Failed to get adapter for bus %d\n",
+				data->hpdev.nr + pdata->shift_nr);
+			return -EFAULT;
+		}
 
-	client = i2c_new_client_device(data->hpdev.adapter,
-				       data->hpdev.brdinfo);
-	if (IS_ERR(client)) {
-		dev_err(priv->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
-			data->hpdev.brdinfo->type, data->hpdev.nr +
-			pdata->shift_nr, data->hpdev.brdinfo->addr);
+		/* Export platform data to underlying device. */
+		if (brdinfo->platform_data)
+			mlxreg_hotplug_pdata_export(brdinfo->platform_data, pdata->regmap);
 
-		i2c_put_adapter(data->hpdev.adapter);
-		data->hpdev.adapter = NULL;
-		return PTR_ERR(client);
-	}
+		client = i2c_new_client_device(data->hpdev.adapter,
+					       brdinfo);
+		if (IS_ERR(client)) {
+			dev_err(priv->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
+				brdinfo->type, data->hpdev.nr +
+				pdata->shift_nr, brdinfo->addr);
+
+			i2c_put_adapter(data->hpdev.adapter);
+			data->hpdev.adapter = NULL;
+			return PTR_ERR(client);
+		}
 
-	data->hpdev.client = client;
+		data->hpdev.client = client;
+		break;
+	case MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION:
+		/* Export platform data to underlying device. */
+		if (data->hpdev.brdinfo && data->hpdev.brdinfo->platform_data)
+			mlxreg_hotplug_pdata_export(data->hpdev.brdinfo->platform_data,
+						    pdata->regmap);
+		data->hpdev.pdev = platform_device_register_resndata(&priv->pdev->dev,
+								     brdinfo->type,
+								     data->hpdev.nr,
+								     NULL, 0, data,
+								     sizeof(*data));
+		if (IS_ERR(data->hpdev.pdev))
+			return PTR_ERR(data->hpdev.pdev);
+
+		break;
+	default:
+		break;
+	}
 
 	return 0;
 }
@@ -138,14 +172,24 @@ mlxreg_hotplug_device_destroy(struct mlxreg_hotplug_priv_data *priv,
 	/* Notify user by sending hwmon uevent. */
 	mlxreg_hotplug_udev_event_send(&priv->hwmon->kobj, data, false);
 
-	if (data->hpdev.client) {
-		i2c_unregister_device(data->hpdev.client);
-		data->hpdev.client = NULL;
-	}
+	switch (data->hpdev.action) {
+	case MLXREG_HOTPLUG_DEVICE_DEFAULT_ACTION:
+		if (data->hpdev.client) {
+			i2c_unregister_device(data->hpdev.client);
+			data->hpdev.client = NULL;
+		}
 
-	if (data->hpdev.adapter) {
-		i2c_put_adapter(data->hpdev.adapter);
-		data->hpdev.adapter = NULL;
+		if (data->hpdev.adapter) {
+			i2c_put_adapter(data->hpdev.adapter);
+			data->hpdev.adapter = NULL;
+		}
+		break;
+	case MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION:
+		if (data->hpdev.pdev)
+			platform_device_unregister(data->hpdev.pdev);
+		break;
+	default:
+		break;
 	}
 }
 
diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 59acbcd0219b..6d24aa5823b3 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -76,6 +76,7 @@ enum mlxreg_hotplug_device_action {
  * @client: I2C device client;
  * @brdinfo: device board information;
  * @nr: I2C device adapter number, to which device is to be attached;
+ * @pdev: platform device, if device is instantiated as a platform device;
  * @action: action to be performed upon event receiving;
  *
  * Structure represents I2C hotplug device static data (board topology) and
@@ -86,6 +87,7 @@ struct mlxreg_hotplug_device {
 	struct i2c_client *client;
 	struct i2c_board_info *brdinfo;
 	int nr;
+	struct platform_device *pdev;
 	enum mlxreg_hotplug_device_action action;
 };
 
-- 
2.11.0

