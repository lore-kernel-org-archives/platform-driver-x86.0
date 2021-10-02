Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F43C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3465619F8
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhJBJex (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Oct 2021 05:34:53 -0400
Received: from mail-bn7nam10on2060.outbound.protection.outlook.com ([40.107.92.60]:40992
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232691AbhJBJex (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Oct 2021 05:34:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hz/ph0muiTkOncR+NUPChtdY0+s3kcCa2JuJVYbJMOG3WNIlG8bN4rfPMprgy4Zj8unHVv4cJ2FagG96osyg6U552s97YhWIvoc6X5RzMVrLKk0VGit9hp/71BDWz2PZyrBfceCQvkiUNuHeX5fywlMGU59OfOKTJ5uPrJFdbM5H6MZGZ3Zk6Nf0USKgnjQW0Ajqt2/mxlFExcFGTCagxCfzSATaEz66svK9L907XQLSdvocgMHNZ/wwnVFg/5eoNzrmM7JRdVlWUH3sEMxD5g0ybzpZ568oXB8OD04cACZsluoFOojKTni7H25Ng7LVyXc+JEXSM4yVv+jMxZGmQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFkFolattQm+wlubpN52dzpxzGJRk92BAqh5uZk3vLg=;
 b=oTu+m0wcV/hXiIf+0ywlqh0qnAZELkyQIJaNeDHfnJhtrf3IzIONeDdpfBDsLdbKSgzCNdNgpZdQ9R3X5mzdq5dZTJ++qLJkZwfUWtLs/kC8IlV6jrgb88TNPOIqlsegbTrMNQ76YMNvsPct0YOAIUpCxJx8vpnCZP7QwpBQXCeIQzf5NOHfb1tLsp2fqZRSNH5eiuDVsIb4/2gFRUtoGXlFJm7OuSmx4WrqoSQGpW4BRia70vI2OmRqksLO6TtsAQhIWTM4r8R67vaPLOJe2xamOfmAD71bU7SyDN6ldSP0e3tmzEaEberzWq2+EqLRWG3WREAQ8s2mluTcYf9uMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFkFolattQm+wlubpN52dzpxzGJRk92BAqh5uZk3vLg=;
 b=ll3uTYlZHVHfmXaZqHZToq4hn3O6N2bCiARptGbYiPPyivORQI8HMo++KADSYY7EnCLL57+P2Eqn1QXN6K0I41AoDfBllxOrnRWmMDkbORtii5kRUgoInmMVBb6BofxERB/FNZ0tBw/HKm6vtDVx6VgS4+Fm5MMnu3foF7r3u6b42KImksnxXWzBCHDDA+cxgQbeW0DS4p+CkyOFrfVmQKTgniwZC+x6taYgpqspH8LyAHnM4ByExfi2U4fDJriEoasuIEb69LbUhPg6MkwzS88wnwu8E47Rcfcmml9nYiFPOOlnDsjFhv43KVLYt2oBi14288pcGoaBgenAPL1QwA==
Received: from MW4PR04CA0152.namprd04.prod.outlook.com (2603:10b6:303:85::7)
 by DM6PR12MB4796.namprd12.prod.outlook.com (2603:10b6:5:16a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.21; Sat, 2 Oct
 2021 09:33:05 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::c9) by MW4PR04CA0152.outlook.office365.com
 (2603:10b6:303:85::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17 via Frontend
 Transport; Sat, 2 Oct 2021 09:33:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Sat, 2 Oct 2021 09:33:05 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 2 Oct 2021 09:33:03 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <michaelsh@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 03/10] platform/mellanox: mlxreg-hotplug: Extend logic for hotplug devices operations
Date:   Sat, 2 Oct 2021 12:32:32 +0300
Message-ID: <20211002093238.3771419-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002093238.3771419-1-vadimp@nvidia.com>
References: <20211002093238.3771419-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1490c502-92d0-4ea4-a561-08d98587a308
X-MS-TrafficTypeDiagnostic: DM6PR12MB4796:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4796E445E30F77F379690E0DAFAC9@DM6PR12MB4796.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GkIwHr4/O7OD5JsOqVIY89OK+kjIEfRD7gAQRPxwiCcfumWx2sMQ9JOj6l+SRS8rNMaQtHBEU0uwUnMnDqR0Wu6TyGOjb50fhmazPJ3UL4Am5uOVpiWNorYpQIdWeIoHG5uTsiZ3Gf84Mx0bsfpWmsmA3l5prkOauGUwkgcXA0ksBakYV9P0XM1eWOcfAn/DxJ2qKhhCGBNox1WvHHkKEy6B0TLY1osVyYx26tRJI9e+2nGwYJhkZf4sGQcQXDoq9TLlnESdU3dvL6ljRnnB14Zm6MjqLbH016+B4u68zhmTCXk98krsf0XEpDEbEkepZceNuLsjLF7YgvGaJxk012uI9wcj26NfBZ7MAyGOXlbzlB3xHcdzeATUeZCDx2pb7KYpg+aH7pJqekDsdbeSMyFE3xcLRQjWorzZxzXai3TCPfnIuyIUPPSHjecvm4upIO79AVqfT95r0ECRTj/NNf2VZHi5GN4TLxOU9ux1pYAX5kcky0RYgQOntzsFsn8MP+Czd3hhaLaKuEZq4uMlAPixlVYDEPv10qRuIz72OBudBA3LgQaxOSY7CvqscODDZNaL2fXLoCUQ7AI+Q8Le8l28T9wrYBXIFR/1WbAQr5c7WExar1EnvxqYCg0A3aPY2exEV/7sxbPZQvw5lbGjxqVn2Bxbu3xithTs08nr2fPw+SvyCWho5rrbf1O3vEoJuUV/9QggDtaoFjWLerxH3w==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(47076005)(4326008)(82310400003)(36756003)(36860700001)(70586007)(86362001)(70206006)(426003)(6916009)(8676002)(54906003)(1076003)(316002)(26005)(107886003)(2906002)(8936002)(186003)(16526019)(356005)(83380400001)(7636003)(5660300002)(2616005)(6666004)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 09:33:05.0708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1490c502-92d0-4ea4-a561-08d98587a308
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4796
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

Additioanlly the number of 'sysfs' attributes is increased, since
modular system defines more 'sysfs' attributes.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 123 +++++++++++++++------
 include/linux/platform_data/mlxreg.h       |  24 ++++
 2 files changed, 112 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index b013445147dd..117bc3f395fd 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -28,7 +28,7 @@
 /* ASIC good health mask. */
 #define MLXREG_HOTPLUG_GOOD_HEALTH_MASK	0x02
 
-#define MLXREG_HOTPLUG_ATTRS_MAX	24
+#define MLXREG_HOTPLUG_ATTRS_MAX	128
 #define MLXREG_HOTPLUG_NOT_ASSERT	3
 
 /**
@@ -89,9 +89,20 @@ mlxreg_hotplug_udev_event_send(struct kobject *kobj,
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
-					struct mlxreg_core_data *data)
+					struct mlxreg_core_data *data,
+					enum mlxreg_hotplug_kind kind)
 {
+	struct i2c_board_info *brdinfo = data->hpdev.brdinfo;
 	struct mlxreg_core_hotplug_platform_data *pdata;
 	struct i2c_client *client;
 
@@ -106,46 +117,88 @@ static int mlxreg_hotplug_device_create(struct mlxreg_hotplug_priv_data *priv,
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
+
+		data->hpdev.client = client;
+		break;
+	case MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION:
+		/* Export platform data to underlying device. */
+		if (data->hpdev.brdinfo && data->hpdev.brdinfo->platform_data)
+			mlxreg_hotplug_pdata_export(data->hpdev.brdinfo->platform_data,
+						    pdata->regmap);
+		/* Pass parent hotplug device handle to underlying device. */
+		data->notifier = data->hpdev.notifier;
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
 	}
 
-	data->hpdev.client = client;
+	if (data->hpdev.notifier && data->hpdev.notifier->user_handler)
+		return data->hpdev.notifier->user_handler(data->hpdev.notifier->handle, kind, 1);
 
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
+	if (data->hpdev.notifier && data->hpdev.notifier->user_handler)
+		data->hpdev.notifier->user_handler(data->hpdev.notifier->handle, kind, 0);
+
+	switch (data->hpdev.action) {
+	case MLXREG_HOTPLUG_DEVICE_DEFAULT_ACTION:
+		if (data->hpdev.client) {
+			i2c_unregister_device(data->hpdev.client);
+			data->hpdev.client = NULL;
+		}
 
-	if (data->hpdev.client) {
-		i2c_unregister_device(data->hpdev.client);
-		data->hpdev.client = NULL;
-	}
-
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
 
@@ -317,14 +370,14 @@ mlxreg_hotplug_work_helper(struct mlxreg_hotplug_priv_data *priv,
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
 
@@ -381,7 +434,7 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
 				 * ASIC is in steady state. Connect associated
 				 * device, if configured.
 				 */
-				mlxreg_hotplug_device_create(priv, data);
+				mlxreg_hotplug_device_create(priv, data, item->kind);
 				data->attached = true;
 			}
 		} else {
@@ -391,7 +444,7 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
 				 * in steady state. Disconnect associated
 				 * device, if it has been connected.
 				 */
-				mlxreg_hotplug_device_destroy(priv, data);
+				mlxreg_hotplug_device_destroy(priv, data, item->kind);
 				data->attached = false;
 				data->health_cntr = 0;
 			}
@@ -630,7 +683,7 @@ static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
 		/* Remove all the attached devices in group. */
 		count = item->count;
 		for (j = 0; j < count; j++, data++)
-			mlxreg_hotplug_device_destroy(priv, data);
+			mlxreg_hotplug_device_destroy(priv, data, item->kind);
 	}
 }
 
diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 49f0e15a10dd..3122d550dc00 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -69,6 +69,19 @@ enum mlxreg_hotplug_device_action {
 	MLXREG_HOTPLUG_DEVICE_NO_ACTION = 2,
 };
 
+/**
+ * struct mlxreg_core_hotplug_notifier - hotplug notifier block:
+ *
+ * @identity: notifier identity name;
+ * @handle: user handle to be passed by user handler function;
+ * @user_handler: user handler function associated with the event;
+ */
+struct mlxreg_core_hotplug_notifier {
+	char identity[MLXREG_CORE_LABEL_MAX_SIZE];
+	void *handle;
+	int (*user_handler)(void *handle, enum mlxreg_hotplug_kind kind, u8 action);
+};
+
 /**
  * struct mlxreg_hotplug_device - I2C device data:
  *
@@ -76,7 +89,11 @@ enum mlxreg_hotplug_device_action {
  * @client: I2C device client;
  * @brdinfo: device board information;
  * @nr: I2C device adapter number, to which device is to be attached;
+ * @pdev: platform device, if device is instantiated as a platform device;
  * @action: action to be performed upon event receiving;
+ * @handle: user handle to be passed by user handler function;
+ * @user_handler: user handler function associated with the event;
+ * @notifier: pointer to event notifier block;
  *
  * Structure represents I2C hotplug device static data (board topology) and
  * dynamic data (related kernel objects handles).
@@ -86,7 +103,11 @@ struct mlxreg_hotplug_device {
 	struct i2c_client *client;
 	struct i2c_board_info *brdinfo;
 	int nr;
+	struct platform_device *pdev;
 	enum mlxreg_hotplug_device_action action;
+	void *handle;
+	int (*user_handler)(void *handle, enum mlxreg_hotplug_kind kind, u8 action);
+	struct mlxreg_core_hotplug_notifier *notifier;
 };
 
 /**
@@ -104,10 +125,12 @@ struct mlxreg_hotplug_device {
  * @mode: access mode;
  * @np - pointer to node platform associated with attribute;
  * @hpdev - hotplug device data;
+ * @notifier: pointer to event notifier block;
  * @health_cntr: dynamic device health indication counter;
  * @attached: true if device has been attached after good health indication;
  * @regnum: number of registers occupied by multi-register attribute;
  * @slot: slot number, at which device is located;
+ * @secured: if set indicates that entry access is secured;
  */
 struct mlxreg_core_data {
 	char label[MLXREG_CORE_LABEL_MAX_SIZE];
@@ -122,6 +145,7 @@ struct mlxreg_core_data {
 	umode_t	mode;
 	struct device_node *np;
 	struct mlxreg_hotplug_device hpdev;
+	struct mlxreg_core_hotplug_notifier *notifier;
 	u32 health_cntr;
 	bool attached;
 	u8 regnum;
-- 
2.20.1

