Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84B6C4332E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B609364F87
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbhBCRhX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 12:37:23 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50972 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232315AbhBCRhV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 12:37:21 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 3 Feb 2021 19:36:30 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 113HaOOL001002;
        Wed, 3 Feb 2021 19:36:30 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy@infradead.org, hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH RFC platform-next 6/8] platform/mellanox: mlxreg-hotplug: Add line card event callbacks support for modular system
Date:   Wed,  3 Feb 2021 19:36:20 +0200
Message-Id: <20210203173622.5845-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210203173622.5845-1-vadimp@nvidia.com>
References: <20210203173622.5845-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add event callback field to 'mlxreg_hotplug_device' structure. These
callback functions are set by a probing routine of a driver, which is
supposed to perform some action when particular event is received. The
probing routine is also supposed to set the handle of the object
associated with the events. For example power on/ready/shutdown events
for the line card in slot #n.
If callback function is set, it will be called by ‘mlxreg-hotplug’
driver, when it receives signals related to line card state change.

The next signals could be received  for line card in particular slot:
- Line card was inserted or removed.
- Line card passed security signature validation by hardware.
- Line card has been powered on / off.
- Line card passed hardware-firmware synchronization handshake.
- Line card received ready event, indicating its PHYs ready / unready
  states.
- Line card received enable event indicating that line card’s FPGA and
  PHYs have been enabled.
- Line card received ready event indicating that ASIC firmware is ready
  for handling network, hardware monitoring and thermal interfaces
  associated with PHYs and ports found on this line card.
- Line card thermal shutdown event indicating that line card has some
  thermal issue and should be powered off.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 26 +++++++++++++++++---------
 include/linux/platform_data/mlxreg.h       |  4 ++++
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index b0512e525964..096cfe5d4a6f 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -99,7 +99,8 @@ mlxreg_hotplug_pdata_export(void *pdata, void *regmap)
 }
 
 static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
-					struct mlxreg_core_data *data)
+					struct mlxreg_core_data *data,
+					enum mlxreg_hotplug_kind kind)
 {
 	struct i2c_board_info *brdinfo = data->hpdev.brdinfo;
 	struct mlxreg_core_hotplug_platform_data *pdata;
@@ -162,12 +163,16 @@ static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
 		break;
 	}
 
+	if (data->hpdev.user_handler)
+		return data->hpdev.user_handler(data->hpdev.handle, kind, 1);
+
 	return 0;
 }
 
 static void
 mlxreg_hotplug_device_destroy(struct mlxreg_hotplug_priv_data *priv,
-			      struct mlxreg_core_data *data)
+			      struct mlxreg_core_data *data,
+			      enum mlxreg_hotplug_kind kind)
 {
 	/* Notify user by sending hwmon uevent. */
 	mlxreg_hotplug_udev_event_send(&priv->hwmon->kobj, data, false);
@@ -191,6 +196,9 @@ mlxreg_hotplug_device_destroy(struct mlxreg_hotplug_priv_data *priv,
 	default:
 		break;
 	}
+
+	if (data->hpdev.user_handler)
+		data->hpdev.user_handler(data->hpdev.handle, kind, 0);
 }
 
 static ssize_t mlxreg_hotplug_attr_show(struct device *dev,
@@ -361,14 +369,14 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
 		data = item->data + bit;
 		if (regval & BIT(bit)) {
 			if (item->inversed)
-				mlxreg_hotplug_device_destroy(priv, data);
+				mlxreg_hotplug_device_destroy(priv, data, item->kind);
 			else
-				mlxreg_hotplug_device_create(priv, data);
+				mlxreg_hotplug_device_create(priv, data, item->kind);
 		} else {
 			if (item->inversed)
-				mlxreg_hotplug_device_create(priv, data);
+				mlxreg_hotplug_device_create(priv, data, item->kind);
 			else
-				mlxreg_hotplug_device_destroy(priv, data);
+				mlxreg_hotplug_device_destroy(priv, data, item->kind);
 		}
 	}
 
@@ -425,7 +433,7 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
 				 * ASIC is in steady state. Connect associated
 				 * device, if configured.
 				 */
-				mlxreg_hotplug_device_create(priv, data);
+				mlxreg_hotplug_device_create(priv, data, item->kind);
 				data->attached = true;
 			}
 		} else {
@@ -435,7 +443,7 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
 				 * in steady state. Disconnect associated
 				 * device, if it has been connected.
 				 */
-				mlxreg_hotplug_device_destroy(priv, data);
+				mlxreg_hotplug_device_destroy(priv, data, item->kind);
 				data->attached = false;
 				data->health_cntr = 0;
 			}
@@ -674,7 +682,7 @@ static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
 		/* Remove all the attached devices in group. */
 		count = item->count;
 		for (j = 0; j < count; j++, data++)
-			mlxreg_hotplug_device_destroy(priv, data);
+			mlxreg_hotplug_device_destroy(priv, data, item->kind);
 	}
 }
 
diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 6d24aa5823b3..4b4149256039 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -78,6 +78,8 @@ enum mlxreg_hotplug_device_action {
  * @nr: I2C device adapter number, to which device is to be attached;
  * @pdev: platform device, if device is instantiated as a platform device;
  * @action: action to be performed upon event receiving;
+ * @handle: user handle to be passed by user handler function;
+ * @user_handler: user handler function associated with the event;
  *
  * Structure represents I2C hotplug device static data (board topology) and
  * dynamic data (related kernel objects handles).
@@ -89,6 +91,8 @@ struct mlxreg_hotplug_device {
 	int nr;
 	struct platform_device *pdev;
 	enum mlxreg_hotplug_device_action action;
+	void *handle;
+	int (*user_handler)(void *handle, enum mlxreg_hotplug_kind kind, u8 action);
 };
 
 /**
-- 
2.11.0

