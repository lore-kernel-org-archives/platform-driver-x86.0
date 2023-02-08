Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3923C636CC
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:35:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjBHGfx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjBHGfw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:35:52 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EBD442C3
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ky9/jP1xSxodxZHSozfbRu1KigYpPFgFayvGc4eEek7x3REQIsJulS4XqfMxoSY/AilhnNeHZgwzDCJtR1ARaZX1tob2njO/Zl5yLgf/FS38zYHsyiq5Vs3bZevkHA6NlKYPvTFOfrLfhuGM79aH6Ls1kmdL8C6s5D56uH3QPl3LtEVAA1hU7t1lBWM1rVR9/WP5+n7509oiW6ogrilLy44q2geU2bWVDHUMznQx4JmQ3m79PDdQSvtm3CngXr/+wvn1VroO8kkxr5it0TsxWAtsbHV9SPnU3w4qHfQt3OxvHNWRb128dLS7C8xKupssVW/ZgK162RizWGP5UsGW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyeZUrMUkn5HwQUd9K0PbXivy7iMwxiYUy5cuJxBrqk=;
 b=akUWgwZAdUpY3AjgbJKFpsyDIB1PgaBlMFKddut0hw0UDr0hbw7j3/md4pz2s+Ke8IZcZ3og+H7VW02xHzyw050fCfAvoBJ8uLLOxfzccMuO7OADyDEhs4bvWPd9y1u8ugxch7ag4Mrw09Qa9v3S+eS7PQL6y0J4bSmHxTtl8bF6A5xn5uunS1wk98HwAC04tlYwnkyMBeCHP2GvputpFD+tvT6tZnhQUQ8qw3P6S4xUwWEdrLJnB6wil6myK7/o2hIUp4EjsZhINUywttznM8VyImAI9NvsChn9hcS5ZrSS601fSBLIlrke8GbKuqDE55gatBIOvsk6tVJ6Nn13tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyeZUrMUkn5HwQUd9K0PbXivy7iMwxiYUy5cuJxBrqk=;
 b=K8o8fIatjDklj+9fqUdnVqhouWY4KFi4Z8X1JkD8EpCKuS+6j2NF/FDMqntpR9PTJ551Xnv2VGDBo7C7VHOzrA8RHUmYsFi0K4aD19ZaY6VHadlxWJ9lzesqSfLHsHao00K0jC3bHNUyCL1Afklu/myrgfk+T2GVttCimDnEq9/TCcf88lNRztLJNuO8R1DD/Ah+k4rC7VnYPopEzDusFiUEqq9GizpqfYrT6guxe0FqbEwxmIL6Lkoi72gshGjVhz62vQcUyFZUCgkyL/VoPYYxeiPf20LGKCQDleIDS4k5dyyUIr/++wt8EEn5qwwI7/nMS2xXwUOsPYn5VY+h1A==
Received: from DS7PR03CA0123.namprd03.prod.outlook.com (2603:10b6:5:3b4::8) by
 SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.36; Wed, 8 Feb 2023 06:35:48 +0000
Received: from DM6NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::69) by DS7PR03CA0123.outlook.office365.com
 (2603:10b6:5:3b4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 06:35:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT084.mail.protection.outlook.com (10.13.172.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 06:35:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:35:38 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:35:37 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 07/13] platform: mellanox: Split logic in init and exit flow
Date:   Wed, 8 Feb 2023 08:33:24 +0200
Message-ID: <20230208063331.15560-8-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT084:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd02ab9-1bc5-4b36-50a2-08db099eb702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pXQRl7pKI4WgYM1L/g3OyPwFkqrLnh3TTE8RKpA6nuthy05CTxDbSR8y8uV3vqFoYnUwu3Pis/ii9j9pJDYiHkUqH5WF2LMnkDmHrb1olPbz/bcpAIomQZMRMptOFbiBpDTS31G12W7e4GMPLuGRQJVH6mIYmPixFRQ3I10kiIwviGQAdlKn4r8Fkf/mxjA0EiuG8y+HU38QtWk9XZckcfzT96Db/yj3R2BucKitbhkOQLtbtxV0w+MpIw+CCYtldS7ViMjztKtuH8quKRFeo08UYx0cZGWFDpifXTGWNQATzmG4mkBYclgvj0MEALt4QZwCQmACSA+fmLmMFw5Ky7AG6A1YVx/ECDW3BkFbx47iKLc3qMc3sTUuFjTgB7bcEYVUNWfdLnDTUpEwOmoZdxeAP7qWKpCtCnxMj7KCgBTan/FvoTi8MwV1LW9IYedvTBZX6AxwUnqxMW+mWzBnLvH+iDkUKC2P3J92ujBtqoQCwPdGgFBQdTWVf3sc/MxZezQdQgOfW0XUAXAQALPQCmxgkmjzIcZyetOhxrkkcic2TcAF2EVVLY0VVc4orDD6em4Jb5Qm90eJVFnfwepuBg4lCa5vZq6+g7mnLEai476KK4hGIXSmHrgZ5n1o38deOSuLHh301jUA15Zysg/gEOZUD7SjNbeCKFw+XP5Dfwa6K0/luRjfgn20w7IDt+hpkM7IM5DwSc2sLhDAvjthQA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199018)(36840700001)(40470700004)(46966006)(82310400005)(426003)(83380400001)(36756003)(86362001)(2906002)(8936002)(30864003)(5660300002)(4326008)(6916009)(70206006)(8676002)(40480700001)(70586007)(41300700001)(356005)(7636003)(82740400003)(36860700001)(316002)(54906003)(47076005)(6666004)(107886003)(40460700003)(336012)(2616005)(16526019)(478600001)(1076003)(26005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:35:48.1359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd02ab9-1bc5-4b36-50a2-08db099eb702
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Split logic in mlxplat_init()/mlxplat_exit() routines.
Separate initialization of I2C infrastructure and others platform
drivers.

Motivation is to provide synchronization between I2C bus and mux
drivers and other drivers using this infrastructure.
I2C main bus and MUX busses are implemented in FPGA logic. On some new
systems the numbers allocated for these busses could be variable
depending on order of initialization of I2C native busses. Since bus
numbers are passed to some other platform drivers during initialization
flow, it is necessary to synchronize completion of I2C infrastructure
drivers and activation of rest of drivers.

Thus initialization flow will be performed in synchronized order.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 313 ++++++++++++++++++----------
 1 file changed, 204 insertions(+), 109 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 2d33d1e5d427..30998b0a8bc8 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -319,6 +319,9 @@
 /* Default value for PWM control register for rack switch system */
 #define MLXPLAT_REGMAP_NVSWITCH_PWM_DEFAULT 0xf4
 
+#define MLXPLAT_I2C_MAIN_BUS_NOTIFIED		0x01
+#define MLXPLAT_I2C_MAIN_BUS_HANDLE_CREATED	0x02
+
 /* mlxplat_priv - platform private data
  * @pdev_i2c - i2c controller platform device
  * @pdev_mux - array of mux platform devices
@@ -330,6 +333,7 @@
  * @regmap: device register map
  * @hotplug_resources: system hotplug resources
  * @hotplug_resources_size: size of system hotplug resources
+ * @hi2c_main_init_status: init status of I2C main bus
  */
 struct mlxplat_priv {
 	struct platform_device *pdev_i2c;
@@ -342,9 +346,11 @@ struct mlxplat_priv {
 	void *regmap;
 	struct resource *hotplug_resources;
 	unsigned int hotplug_resources_size;
+	u8 i2c_main_init_status;
 };
 
 static struct platform_device *mlxplat_dev;
+static int mlxplat_i2c_main_complition_notify(void *handle, int id);
 
 /* Regions for LPC I2C controller and LPC base register space */
 static const struct resource mlxplat_lpc_resources[] = {
@@ -379,6 +385,7 @@ static struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_i2c_ng_data = {
 	.mask = MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRCO_OFFSET,
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_I2C,
+	.completion_notify = mlxplat_i2c_main_complition_notify,
 };
 
 /* Platform default channels */
@@ -6050,68 +6057,9 @@ static void mlxplat_post_exit(void)
 	mlxplat_lpc_cpld_device_exit();
 }
 
-static int __init mlxplat_init(void)
+static int mlxplat_post_init(struct mlxplat_priv *priv)
 {
-	unsigned int hotplug_resources_size;
-	struct resource *hotplug_resources;
-	struct mlxplat_priv *priv;
-	int i, j, nr, err;
-
-	if (!dmi_check_system(mlxplat_dmi_table))
-		return -ENODEV;
-
-	err = mlxplat_pre_init(&hotplug_resources, &hotplug_resources_size);
-	if (err)
-		return err;
-
-	priv = devm_kzalloc(&mlxplat_dev->dev, sizeof(struct mlxplat_priv),
-			    GFP_KERNEL);
-	if (!priv) {
-		err = -ENOMEM;
-		goto fail_alloc;
-	}
-	platform_set_drvdata(mlxplat_dev, priv);
-
-	priv->hotplug_resources = hotplug_resources;
-	priv->hotplug_resources_size = hotplug_resources_size;
-
-	if (!mlxplat_regmap_config)
-		mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config;
-
-	priv->regmap = devm_regmap_init(&mlxplat_dev->dev, NULL,
-					&mlxplat_mlxcpld_regmap_ctx,
-					mlxplat_regmap_config);
-	if (IS_ERR(priv->regmap)) {
-		err = PTR_ERR(priv->regmap);
-		goto fail_alloc;
-	}
-
-	err = mlxplat_mlxcpld_verify_bus_topology(&nr);
-	if (nr < 0)
-		goto fail_alloc;
-
-	nr = (nr == mlxplat_max_adap_num) ? -1 : nr;
-	if (mlxplat_i2c)
-		mlxplat_i2c->regmap = priv->regmap;
-	priv->pdev_i2c = platform_device_register_resndata(&mlxplat_dev->dev, "i2c_mlxcpld",
-							   nr, priv->hotplug_resources,
-							   priv->hotplug_resources_size,
-							   mlxplat_i2c, sizeof(*mlxplat_i2c));
-	if (IS_ERR(priv->pdev_i2c)) {
-		err = PTR_ERR(priv->pdev_i2c);
-		goto fail_alloc;
-	}
-
-	for (i = 0; i < mlxplat_mux_num; i++) {
-		priv->pdev_mux[i] = platform_device_register_resndata(&priv->pdev_i2c->dev,
-								      "i2c-mux-reg", i, NULL, 0,
-								      &mlxplat_mux_data[i],
-								      sizeof(mlxplat_mux_data[i]));
-		if (IS_ERR(priv->pdev_mux[i])) {
-			err = PTR_ERR(priv->pdev_mux[i]);
-			goto fail_platform_mux_register;
-		}
-	}
+	int i, err;
 
 	/* Add hotplug driver */
 	if (mlxplat_hotplug) {
@@ -6124,19 +6072,10 @@ static int __init mlxplat_init(void)
 						  mlxplat_hotplug, sizeof(*mlxplat_hotplug));
 		if (IS_ERR(priv->pdev_hotplug)) {
 			err = PTR_ERR(priv->pdev_hotplug);
-			goto fail_platform_mux_register;
+			goto fail_platform_hotplug_register;
 		}
 	}
 
-	/* Set default registers. */
-	for (j = 0; j <  mlxplat_regmap_config->num_reg_defaults; j++) {
-		err = regmap_write(priv->regmap,
-				   mlxplat_regmap_config->reg_defaults[j].reg,
-				   mlxplat_regmap_config->reg_defaults[j].def);
-		if (err)
-			goto fail_platform_mux_register;
-	}
-
 	/* Add LED driver. */
 	if (mlxplat_led) {
 		mlxplat_led->regmap = priv->regmap;
@@ -6146,7 +6085,7 @@ static int __init mlxplat_init(void)
 						  sizeof(*mlxplat_led));
 		if (IS_ERR(priv->pdev_led)) {
 			err = PTR_ERR(priv->pdev_led);
-			goto fail_platform_hotplug_register;
+			goto fail_platform_leds_register;
 		}
 	}
 
@@ -6160,7 +6099,7 @@ static int __init mlxplat_init(void)
 								       sizeof(*mlxplat_regs_io));
 		if (IS_ERR(priv->pdev_io_regs)) {
 			err = PTR_ERR(priv->pdev_io_regs);
-			goto fail_platform_led_register;
+			goto fail_platform_io_register;
 		}
 	}
 
@@ -6173,7 +6112,7 @@ static int __init mlxplat_init(void)
 								   sizeof(*mlxplat_fan));
 		if (IS_ERR(priv->pdev_fan)) {
 			err = PTR_ERR(priv->pdev_fan);
-			goto fail_platform_io_regs_register;
+			goto fail_platform_fan_register;
 		}
 	}
 
@@ -6181,59 +6120,42 @@ static int __init mlxplat_init(void)
 	err = mlxplat_mlxcpld_check_wd_capability(priv->regmap);
 	if (err)
 		goto fail_platform_wd_register;
-	for (j = 0; j < MLXPLAT_CPLD_WD_MAX_DEVS; j++) {
-		if (mlxplat_wd_data[j]) {
-			mlxplat_wd_data[j]->regmap = priv->regmap;
-			priv->pdev_wd[j] =
-				platform_device_register_resndata(&mlxplat_dev->dev, "mlx-wdt", j,
-								  NULL, 0, mlxplat_wd_data[j],
-								  sizeof(*mlxplat_wd_data[j]));
-			if (IS_ERR(priv->pdev_wd[j])) {
-				err = PTR_ERR(priv->pdev_wd[j]);
+	for (i = 0; i < MLXPLAT_CPLD_WD_MAX_DEVS; i++) {
+		if (mlxplat_wd_data[i]) {
+			mlxplat_wd_data[i]->regmap = priv->regmap;
+			priv->pdev_wd[i] =
+				platform_device_register_resndata(&mlxplat_dev->dev, "mlx-wdt", i,
+								  NULL, 0, mlxplat_wd_data[i],
+								  sizeof(*mlxplat_wd_data[i]));
+			if (IS_ERR(priv->pdev_wd[i])) {
+				err = PTR_ERR(priv->pdev_wd[i]);
 				goto fail_platform_wd_register;
 			}
 		}
 	}
 
-	/* Sync registers with hardware. */
-	regcache_mark_dirty(priv->regmap);
-	err = regcache_sync(priv->regmap);
-	if (err)
-		goto fail_platform_wd_register;
-
 	return 0;
 
 fail_platform_wd_register:
-	while (--j >= 0)
-		platform_device_unregister(priv->pdev_wd[j]);
-	if (mlxplat_fan)
-		platform_device_unregister(priv->pdev_fan);
-fail_platform_io_regs_register:
+	while (--i >= 0)
+		platform_device_unregister(priv->pdev_wd[i]);
+fail_platform_fan_register:
 	if (mlxplat_regs_io)
 		platform_device_unregister(priv->pdev_io_regs);
-fail_platform_led_register:
+fail_platform_io_register:
 	if (mlxplat_led)
 		platform_device_unregister(priv->pdev_led);
-fail_platform_hotplug_register:
+fail_platform_leds_register:
 	if (mlxplat_hotplug)
 		platform_device_unregister(priv->pdev_hotplug);
-fail_platform_mux_register:
-	while (--i >= 0)
-		platform_device_unregister(priv->pdev_mux[i]);
-	platform_device_unregister(priv->pdev_i2c);
-fail_alloc:
-
+fail_platform_hotplug_register:
 	return err;
 }
-module_init(mlxplat_init);
 
-static void __exit mlxplat_exit(void)
+static void mlxplat_pre_exit(struct mlxplat_priv *priv)
 {
-	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
 	int i;
 
-	if (pm_power_off)
-		pm_power_off = NULL;
 	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0 ; i--)
 		platform_device_unregister(priv->pdev_wd[i]);
 	if (priv->pdev_fan)
@@ -6244,13 +6166,186 @@ static void __exit mlxplat_exit(void)
 		platform_device_unregister(priv->pdev_led);
 	if (priv->pdev_hotplug)
 		platform_device_unregister(priv->pdev_hotplug);
+}
+
+static int
+mlxplat_i2c_mux_complition_notify(void *handle, struct i2c_adapter *parent,
+				  struct i2c_adapter *adapters[])
+{
+	struct mlxplat_priv *priv = handle;
+
+	return mlxplat_post_init(priv);
+}
 
-	for (i = mlxplat_mux_num - 1; i >= 0 ; i--)
+static int mlxplat_i2c_mux_topolgy_init(struct mlxplat_priv *priv)
+{
+	int i, err;
+
+	if (!priv->pdev_i2c) {
+		priv->i2c_main_init_status = MLXPLAT_I2C_MAIN_BUS_NOTIFIED;
+		return 0;
+	}
+
+	priv->i2c_main_init_status = MLXPLAT_I2C_MAIN_BUS_HANDLE_CREATED;
+	for (i = 0; i < mlxplat_mux_num; i++) {
+		priv->pdev_mux[i] = platform_device_register_resndata(&priv->pdev_i2c->dev,
+								      "i2c-mux-reg", i, NULL, 0,
+								      &mlxplat_mux_data[i],
+								      sizeof(mlxplat_mux_data[i]));
+		if (IS_ERR(priv->pdev_mux[i])) {
+			err = PTR_ERR(priv->pdev_mux[i]);
+			goto fail_platform_mux_register;
+		}
+	}
+
+	return mlxplat_i2c_mux_complition_notify(priv, NULL, NULL);
+
+fail_platform_mux_register:
+	while (--i >= 0)
 		platform_device_unregister(priv->pdev_mux[i]);
+	return err;
+}
+
+static void mlxplat_i2c_mux_topolgy_exit(struct mlxplat_priv *priv)
+{
+	int i;
+
+	for (i = mlxplat_mux_num - 1; i >= 0 ; i--) {
+		if (priv->pdev_mux[i])
+			platform_device_unregister(priv->pdev_mux[i]);
+	}
 
-	platform_device_unregister(priv->pdev_i2c);
 	mlxplat_post_exit();
 }
+
+static int mlxplat_i2c_main_complition_notify(void *handle, int id)
+{
+	struct mlxplat_priv *priv = handle;
+
+	return mlxplat_i2c_mux_topolgy_init(priv);
+}
+
+static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
+{
+	int nr, err;
+
+	if (!mlxplat_i2c)
+		return 0;
+
+	err = mlxplat_mlxcpld_verify_bus_topology(&nr);
+	if (nr < 0)
+		goto fail_mlxplat_mlxcpld_verify_bus_topology;
+
+	nr = (nr == mlxplat_max_adap_num) ? -1 : nr;
+	mlxplat_i2c->regmap = priv->regmap;
+	mlxplat_i2c->handle = priv;
+
+	priv->pdev_i2c = platform_device_register_resndata(&mlxplat_dev->dev, "i2c_mlxcpld",
+							   nr, priv->hotplug_resources,
+							   priv->hotplug_resources_size,
+							   mlxplat_i2c, sizeof(*mlxplat_i2c));
+	if (IS_ERR(priv->pdev_i2c)) {
+		err = PTR_ERR(priv->pdev_i2c);
+		goto fail_platform_i2c_register;
+	}
+
+	if (priv->i2c_main_init_status == MLXPLAT_I2C_MAIN_BUS_NOTIFIED) {
+		err = mlxplat_i2c_mux_topolgy_init(priv);
+		if (err)
+			goto fail_mlxplat_i2c_mux_topolgy_init;
+	}
+
+	return 0;
+
+fail_mlxplat_i2c_mux_topolgy_init:
+fail_platform_i2c_register:
+fail_mlxplat_mlxcpld_verify_bus_topology:
+	return err;
+}
+
+static void mlxplat_i2c_main_exit(struct mlxplat_priv *priv)
+{
+	mlxplat_i2c_mux_topolgy_exit(priv);
+	if (priv->pdev_i2c)
+		platform_device_unregister(priv->pdev_i2c);
+}
+
+static int __init mlxplat_init(void)
+{
+	unsigned int hotplug_resources_size;
+	struct resource *hotplug_resources;
+	struct mlxplat_priv *priv;
+	int i, err;
+
+	if (!dmi_check_system(mlxplat_dmi_table))
+		return -ENODEV;
+
+	err = mlxplat_pre_init(&hotplug_resources, &hotplug_resources_size);
+	if (err)
+		return err;
+
+	priv = devm_kzalloc(&mlxplat_dev->dev, sizeof(struct mlxplat_priv),
+			    GFP_KERNEL);
+	if (!priv) {
+		err = -ENOMEM;
+		goto fail_alloc;
+	}
+	platform_set_drvdata(mlxplat_dev, priv);
+	priv->hotplug_resources = hotplug_resources;
+	priv->hotplug_resources_size = hotplug_resources_size;
+
+	if (!mlxplat_regmap_config)
+		mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config;
+
+	priv->regmap = devm_regmap_init(&mlxplat_dev->dev, NULL,
+					&mlxplat_mlxcpld_regmap_ctx,
+					mlxplat_regmap_config);
+	if (IS_ERR(priv->regmap)) {
+		err = PTR_ERR(priv->regmap);
+		goto fail_alloc;
+	}
+
+	/* Set default registers. */
+	for (i = 0; i <  mlxplat_regmap_config->num_reg_defaults; i++) {
+		err = regmap_write(priv->regmap,
+				   mlxplat_regmap_config->reg_defaults[i].reg,
+				   mlxplat_regmap_config->reg_defaults[i].def);
+		if (err)
+			goto fail_regmap_write;
+	}
+
+	err = mlxplat_i2c_main_init(priv);
+	if (err)
+		goto fail_mlxplat_i2c_main_init;
+
+	/* Sync registers with hardware. */
+	regcache_mark_dirty(priv->regmap);
+	err = regcache_sync(priv->regmap);
+	if (err)
+		goto fail_regcache_sync;
+
+	return 0;
+
+fail_regcache_sync:
+	mlxplat_pre_exit(priv);
+fail_mlxplat_i2c_main_init:
+fail_regmap_write:
+fail_alloc:
+	mlxplat_post_exit();
+
+	return err;
+}
+module_init(mlxplat_init);
+
+static void __exit mlxplat_exit(void)
+{
+	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
+
+	if (pm_power_off)
+		pm_power_off = NULL;
+	mlxplat_pre_exit(priv);
+	mlxplat_i2c_main_exit(priv);
+}
 module_exit(mlxplat_exit);
 
 MODULE_AUTHOR("Vadim Pasternak (vadimp@mellanox.com)");
-- 
2.20.1

