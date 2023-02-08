Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E902C636D3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjBHGfr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjBHGfq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:35:46 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B369442C2
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:35:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGdAuhCczTnTY7mNw2vicWwcgwMZx4Paa/lKE5/eeN77ehFaCziArFJ7b+YIJuqMgDP7y9u1tRal9caAbjvk+Y01O4oYnXp/yOHSN7hVkJEw78ipCWyDblg6emPRJii77PSimAzJ0eYb3K4mL42aku2B+AYxcxfmMwUovPgn6UPY0164xicqdXgb/SJnwWSXe8mX+36OY4SoxSBlWX0VV79i9bsOvt39zToCuqDqUG4abwj25qoH5m7PTNFKFbDMsaiIBxDfiRZiCz5zcirPExTUA6KeeRS58QVLrcilshyDWJRNVCHNyaIxImkbvGhtZWUMd1j7c4J42S81PuFGNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEV6TBKtc9+XbpTz68e9Vux5FR/vXlDRTqKAFC6NgZU=;
 b=kHvxI86NhKdXUdtp238w2QtEPqd4B26GLs9Uf70b9XNdMRK2IGd8/IPDTiHCX6tz3qOz/s6o/ak4jRs1jdWVmuUR7q+BSkxjyhhVU3Q/lJ9u0LBF7t9+Kmxa0Y5tNaBhCKzA5GkS4kEIHMXvF7eK2R3kKAVcbexN8q4Nd6gyFJfy5iEAEejP2ffvh8Ob+1BciapOtg+Kw+DC0CM30i/VBLNTHMYuv0/Sitd0QJqXjyH+J/qlKU56Drwd9DmbzSQG0vjtuyA3QTbwnCj8NG40PItmx5VDyyaSi13f1NJW5PsRyd1eFMojOdwz/JWFxdMdnqUqN4GmLbj+XwmeLD7upQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEV6TBKtc9+XbpTz68e9Vux5FR/vXlDRTqKAFC6NgZU=;
 b=EmuXyXp2QO3bOTB0tDc7aNLbSzEtf1bZ+JT9dLrCpqVZkaur2gC92CL4uSFDFNpdXgb3PTECOc/05KuyWfkK3mfQOdJD0Ffok5GMXZn98Ig+bjuQ/pJLz8n7QigwTPjxDEKkpADOoMsHOHQx64cfiMal7fubnls54cTuFpZo2+VBr7jKiJE2tkbsxdL7Qj9WisrmMpIyjr1ATEVtMvtVyNYNDuMHkEFt+JEQNIe8FA3qX8QjIW+G53vawBFQhJW2GAycwPdxGxe7JX7flZThF8X/ag/gYSGNWIZPNeKwH8shpSCrlq7Y5l5FZMOvzi1LPM9/AoPhjxZxHlLusENOpA==
Received: from DM6PR07CA0129.namprd07.prod.outlook.com (2603:10b6:5:330::23)
 by CH2PR12MB4971.namprd12.prod.outlook.com (2603:10b6:610:6b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Wed, 8 Feb
 2023 06:35:43 +0000
Received: from DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::bf) by DM6PR07CA0129.outlook.office365.com
 (2603:10b6:5:330::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Wed, 8 Feb 2023 06:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT009.mail.protection.outlook.com (10.13.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.16 via Frontend Transport; Wed, 8 Feb 2023 06:35:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:35:35 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:35:34 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 06/13] platform: mellanox: Split initialization procedure
Date:   Wed, 8 Feb 2023 08:33:23 +0200
Message-ID: <20230208063331.15560-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208063331.15560-1-vadimp@nvidia.com>
References: <20230208063331.15560-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT009:EE_|CH2PR12MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: 453f8300-9168-41fd-6958-08db099eb40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsuMT2Glz+G94FMGq50eiwWfwCuJ5jEPhBMbFu/Ow/jkLCftiG5hgYRsC0m3MXMaV2MuZqa7ru/kcl9QFHt0LAcqWJk0JnpXjltpdXtzg4Bq40DFdaRrisPZpvU/5LJXagqx2+rbsv/nrmYqQFUdhojEAHaj4XVQbsp1oNQaRjycxBc2C3hiCK+UvHEz714WSm8oq6D2c9Z1FJMzklB0U9TXxYwGyYprIEuNctKFPL06mle+6fxHpRX9lVNpe6KX/2Ji6M023mK7ItKIt3TRfF3a6xLq6jBcdll9pSsScXsP5vIc5+4W31qaDW8lcVRtz7Sd8MhDrP8bfk1S+Z3Qt8jwNLSGbutdrUK6m5Moo+L2E4oXM1mKr27Z1VseKKQGdn9vzTuiMuuVjqAL21HxkMU14WMpxfxgBEhMVg0whOi8MrO3W83cUCs4DY9vA0ZWHGW82gbnz4XV/ZVdb6qJylHru497oTXpRhG9hWZDQzDna7LbpIPaf71BnZQJTzXwXCXooSx0iHLXCdZnB96rIRnpplOXFneBbh8edUquuSIiZbHaQvmuUh0qaXWur13AdADkcuRQjZkjNh9qpDWKM6Nit24rLQlBxT+gYAT8K7Z28NomzDZBZfGsf4ftz78yek5T95mnYHxT5PLeB7HOiRAwfU1o4J5ac/9DitepB47Z/KaZHLiAGGaUmlyVr9UBx/GSBR/0pM6p8V0jHMbwMw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(36756003)(86362001)(36860700001)(70206006)(70586007)(7636003)(2616005)(316002)(54906003)(40460700003)(8676002)(4326008)(6916009)(478600001)(5660300002)(2906002)(40480700001)(82310400005)(82740400003)(6666004)(8936002)(41300700001)(47076005)(1076003)(16526019)(26005)(186003)(426003)(107886003)(336012)(83380400001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:35:43.1886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 453f8300-9168-41fd-6958-08db099eb40f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4971
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Split mlxplat_init() into two by adding mlxplat_pre_init().

Motivation is to prepare 'mlx-platform' driver to support systems
equipped PCIe based programming logic device.

Such systems are supposed to use different system resources, thus this
commit separates resources allocation related code.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 78 ++++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 1a07a9994f05..2d33d1e5d427 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -328,6 +328,8 @@
  * @pdev_fan - FAN platform devices
  * @pdev_wd - array of watchdog platform devices
  * @regmap: device register map
+ * @hotplug_resources: system hotplug resources
+ * @hotplug_resources_size: size of system hotplug resources
  */
 struct mlxplat_priv {
 	struct platform_device *pdev_i2c;
@@ -338,6 +340,8 @@ struct mlxplat_priv {
 	struct platform_device *pdev_fan;
 	struct platform_device *pdev_wd[MLXPLAT_CPLD_WD_MAX_DEVS];
 	void *regmap;
+	struct resource *hotplug_resources;
+	unsigned int hotplug_resources_size;
 };
 
 static struct platform_device *mlxplat_dev;
@@ -6002,20 +6006,63 @@ static int mlxplat_mlxcpld_check_wd_capability(void *regmap)
 	return 0;
 }
 
+static int mlxplat_lpc_cpld_device_init(struct resource **hotplug_resources,
+					unsigned int *hotplug_resources_size)
+{
+	int err;
+
+	mlxplat_dev = platform_device_register_simple(MLX_PLAT_DEVICE_NAME, PLATFORM_DEVID_NONE,
+						      mlxplat_lpc_resources,
+						      ARRAY_SIZE(mlxplat_lpc_resources));
+	if (IS_ERR(mlxplat_dev))
+		return PTR_ERR(mlxplat_dev);
+
+	mlxplat_mlxcpld_regmap_ctx.base = devm_ioport_map(&mlxplat_dev->dev,
+							  mlxplat_lpc_resources[1].start, 1);
+	if (!mlxplat_mlxcpld_regmap_ctx.base) {
+		err = -ENOMEM;
+		goto fail_devm_ioport_map;
+	}
+
+	*hotplug_resources = mlxplat_mlxcpld_resources;
+	*hotplug_resources_size = ARRAY_SIZE(mlxplat_mlxcpld_resources);
+
+	return 0;
+
+fail_devm_ioport_map:
+	platform_device_unregister(mlxplat_dev);
+	return err;
+}
+
+static void mlxplat_lpc_cpld_device_exit(void)
+{
+	platform_device_unregister(mlxplat_dev);
+}
+
+static int
+mlxplat_pre_init(struct resource **hotplug_resources, unsigned int *hotplug_resources_size)
+{
+	return mlxplat_lpc_cpld_device_init(hotplug_resources, hotplug_resources_size);
+}
+
+static void mlxplat_post_exit(void)
+{
+	mlxplat_lpc_cpld_device_exit();
+}
+
 static int __init mlxplat_init(void)
 {
+	unsigned int hotplug_resources_size;
+	struct resource *hotplug_resources;
 	struct mlxplat_priv *priv;
 	int i, j, nr, err;
 
 	if (!dmi_check_system(mlxplat_dmi_table))
 		return -ENODEV;
 
-	mlxplat_dev = platform_device_register_simple(MLX_PLAT_DEVICE_NAME, PLATFORM_DEVID_NONE,
-					mlxplat_lpc_resources,
-					ARRAY_SIZE(mlxplat_lpc_resources));
-
-	if (IS_ERR(mlxplat_dev))
-		return PTR_ERR(mlxplat_dev);
+	err = mlxplat_pre_init(&hotplug_resources, &hotplug_resources_size);
+	if (err)
+		return err;
 
 	priv = devm_kzalloc(&mlxplat_dev->dev, sizeof(struct mlxplat_priv),
 			    GFP_KERNEL);
@@ -6025,12 +6072,8 @@ static int __init mlxplat_init(void)
 	}
 	platform_set_drvdata(mlxplat_dev, priv);
 
-	mlxplat_mlxcpld_regmap_ctx.base = devm_ioport_map(&mlxplat_dev->dev,
-			       mlxplat_lpc_resources[1].start, 1);
-	if (!mlxplat_mlxcpld_regmap_ctx.base) {
-		err = -ENOMEM;
-		goto fail_alloc;
-	}
+	priv->hotplug_resources = hotplug_resources;
+	priv->hotplug_resources_size = hotplug_resources_size;
 
 	if (!mlxplat_regmap_config)
 		mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config;
@@ -6051,8 +6094,8 @@ static int __init mlxplat_init(void)
 	if (mlxplat_i2c)
 		mlxplat_i2c->regmap = priv->regmap;
 	priv->pdev_i2c = platform_device_register_resndata(&mlxplat_dev->dev, "i2c_mlxcpld",
-							   nr, mlxplat_mlxcpld_resources,
-							   ARRAY_SIZE(mlxplat_mlxcpld_resources),
+							   nr, priv->hotplug_resources,
+							   priv->hotplug_resources_size,
 							   mlxplat_i2c, sizeof(*mlxplat_i2c));
 	if (IS_ERR(priv->pdev_i2c)) {
 		err = PTR_ERR(priv->pdev_i2c);
@@ -6076,8 +6119,8 @@ static int __init mlxplat_init(void)
 		priv->pdev_hotplug =
 		platform_device_register_resndata(&mlxplat_dev->dev,
 						  "mlxreg-hotplug", PLATFORM_DEVID_NONE,
-						  mlxplat_mlxcpld_resources,
-						  ARRAY_SIZE(mlxplat_mlxcpld_resources),
+						  priv->hotplug_resources,
+						  priv->hotplug_resources_size,
 						  mlxplat_hotplug, sizeof(*mlxplat_hotplug));
 		if (IS_ERR(priv->pdev_hotplug)) {
 			err = PTR_ERR(priv->pdev_hotplug);
@@ -6179,7 +6222,6 @@ static int __init mlxplat_init(void)
 		platform_device_unregister(priv->pdev_mux[i]);
 	platform_device_unregister(priv->pdev_i2c);
 fail_alloc:
-	platform_device_unregister(mlxplat_dev);
 
 	return err;
 }
@@ -6207,7 +6249,7 @@ static void __exit mlxplat_exit(void)
 		platform_device_unregister(priv->pdev_mux[i]);
 
 	platform_device_unregister(priv->pdev_i2c);
-	platform_device_unregister(mlxplat_dev);
+	mlxplat_post_exit();
 }
 module_exit(mlxplat_exit);
 
-- 
2.20.1

