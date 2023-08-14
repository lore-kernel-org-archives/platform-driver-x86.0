Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2C7EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbjHNJEO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235340AbjHNJD6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:03:58 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE9F10B
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vun2ANOv8zTzjbxWG8yyh+Jgh4YeqK0oP1tji00bEkZqVOZQ0L2Mfs+1oE9PhAcEE9S2r3cove7DND6L9aZGFFdl9Wfy94s6AZg2jGP5wl0tqTTuDuVEFNTLg5CPwW/8KcfklocbZSoHLjzKpjflumqnpH8f/VUBso57MZDG2AaIz5mDyncDR2mLgzfMLuYYAvISZcGiyJT/s/G5mepD9NyCjpOXpGBjfOILAebVjUzXmGA8dIYQx06iM9TpihQ4j/t2LziZfciO8cx4BJDDXQvycon/sFdyOlTcL3+2HCX3nIoohygTYZI6kHLCVqQZWFu5UM1YkyEhuIsdlEk3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/UTiBt53ju3zjGpbgFY7Usyp4hzY8kpdQKfuYK8XGo=;
 b=V2aWxUEjAzUp5GT/QqqWTigjlI05tp5V/lCCT9r7aYTgQZX+JOPrshG5EqAtphMVG7sbqfs9njgSKDJhmlXD54z/uJ/IvEmafsjH+NqnhaZez/SIUazYEj/K2DiwYU6S8LrAF+GmEcmPPYQ38iaJlDJr5gBWn36uKjmsqmk4uS9am4VhNDcLt4vqNyfaWdmxeCvDvr/jVz4DFhZL9Zxt0z0UOXkl1bLvNbkXyQ5gWjzyIpxaTDlCMP4YJJvyXtHCY1jq7qy2CIrhZS/p+gU+SJAT3h9xgnRa5jGD7y+Op1YF8qg/5Pq2s+hW/Olk/OWmGS97LkQ8BKB2SgtnPChkCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/UTiBt53ju3zjGpbgFY7Usyp4hzY8kpdQKfuYK8XGo=;
 b=m6j0cnDIok6PhqaohHUr4lejrTty4hH7TcBKEDh5re3Q5fWlep2LYgNBCSA08XDk+Am0P1Sd8j4ch1Ae/g6zUmLPRl5gfiaFwWk6t9toUA3kjCc6wY+wd256HfYG+b1GiMBHo9lLKb5Rms6bZDn7deQGkV4pYlvetuPs3YZufoOgLorro3QG9boFa+7ahdp62c27SM8iKfu7a+RfczP0ypC8YfVDEa6YPzOPbVEn1fFAOYbCQLzZAJQ0uNX1RdZ9uNZt/JMXJOAmhAWwXVufww5Ju8+BVa4atWH6RS6DWUNisiergq9vXWzgdQ3QX1G3qzoBqcKPRWPgI/8exyUMyw==
Received: from MW4PR03CA0045.namprd03.prod.outlook.com (2603:10b6:303:8e::20)
 by DS0PR12MB8502.namprd12.prod.outlook.com (2603:10b6:8:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 09:02:52 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:303:8e:cafe::25) by MW4PR03CA0045.outlook.office365.com
 (2603:10b6:303:8e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 09:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:02:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:02:37 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:02:36 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 10/16] platform: mellanox: mlx-platform: Prepare driver to allow probing through ACPI infrastructure
Date:   Mon, 14 Aug 2023 08:59:04 +0000
Message-ID: <20230814085910.56069-11-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814085910.56069-1-vadimp@nvidia.com>
References: <20230814085910.56069-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|DS0PR12MB8502:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d113db5-36ee-464b-c433-08db9ca53dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wDWnYcGLkmBJxaOBztEC/n5TWGhPyEu4WMjym9yMtgaYqWSxtf7EiNaEROfMkY3lfGkP6diiicRJ/Ve1cKCTwwVETzzbFjB1kbUHey+uCBNzfhSGihSyf0e8VCzYO2Gj99INjgpocNUscDXa3M+quDjfJyvrWo3Lor+e3J24rREuJp4UYbk0TiyNbTkm3JdHNLhBtLNjwD8mPF8RlBpDliKYR+VUvMmkQNiMd8RnXtIUk3aSmgG4mkdvkCbEC3N2m/11RY3Iid0UzWIyRMvPmBR833pDdJxwhGWvG81xFwK9PS0IQjIfAXocthkwr4CD6ZqxisjgICMXPxeLZhnnvqW5xPg8Vq1dPOF0jDBi6r9fiMyC/n4e163CTCpJAFC/6LWzFlTSJfMMExr4aOEjMe/NwiTTlZIb58GaBVYZm6ew3Th8s6dBHvK00oMkKjOtdOd5YFqU+9NXRUqSrCDRjaTFKMmRcWw4DZ+sRR/sCXUE7hXnVA8bNB4/tdBEfR4bnN1o0M2T7Nt0EJxhgPacgV8sWhbAMIiMp4DmfKpuvyyh5Ftmsfo9B+8KZGg9HvoB0J4kRjv+kD8DykFJtZ+WWz4kC8lBv1VifIkuIZjCLd7NofCrzYHCj2AB19GtnJOrxW65pARNaa6IDFi9RimRqwpQzTnTADeNY3zllZ9rwE99gNpL+vdzICUjhD+V4UAH2ju6uNB9kQcZXUvMHonWPTduvL3sI76s4V3AL7OsRplw2LbolmsaFnoPrK01eJI5
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(82310400008)(186006)(1800799006)(36840700001)(40470700004)(46966006)(40460700003)(6666004)(478600001)(70206006)(70586007)(47076005)(83380400001)(36860700001)(16526019)(36756003)(86362001)(2906002)(40480700001)(426003)(1076003)(26005)(107886003)(2616005)(336012)(82740400003)(356005)(7636003)(316002)(4326008)(8676002)(6916009)(54906003)(5660300002)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:02:52.2264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d113db5-36ee-464b-c433-08db9ca53dcb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8502
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently driver is activated through DMI hooks.
Prepare driver to allow activation also through ACPI trigger.

Modify mlxplat_init()/mlxplat_exit() routines.
Add mlxplat_probe()/mlxplat_remove() routines and "mlxplat_driver"
structure.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 91 +++++++++++++++++++----------
 1 file changed, 61 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index b577ce572ab1..68bfa446738e 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -5573,6 +5573,17 @@ static void mlxplat_poweroff(void)
 	kernel_halt();
 }
 
+static int __init mlxplat_register_platform_device(void)
+{
+	mlxplat_dev = platform_device_register_simple(MLX_PLAT_DEVICE_NAME, -1,
+						      mlxplat_lpc_resources,
+						      ARRAY_SIZE(mlxplat_lpc_resources));
+	if (IS_ERR(mlxplat_dev))
+		return PTR_ERR(mlxplat_dev);
+	else
+		return 1;
+}
+
 static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
 {
 	int i;
@@ -5593,7 +5604,7 @@ static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_default_wc_matched(const struct dmi_system_id *dmi)
@@ -5616,7 +5627,7 @@ static int __init mlxplat_dmi_default_wc_matched(const struct dmi_system_id *dmi
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_default_eth_wc_blade_matched(const struct dmi_system_id *dmi)
@@ -5641,7 +5652,7 @@ static int __init mlxplat_dmi_default_eth_wc_blade_matched(const struct dmi_syst
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
@@ -5664,7 +5675,7 @@ static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_msn274x_matched(const struct dmi_system_id *dmi)
@@ -5687,7 +5698,7 @@ static int __init mlxplat_dmi_msn274x_matched(const struct dmi_system_id *dmi)
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_msn201x_matched(const struct dmi_system_id *dmi)
@@ -5710,7 +5721,7 @@ static int __init mlxplat_dmi_msn201x_matched(const struct dmi_system_id *dmi)
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_qmb7xx_matched(const struct dmi_system_id *dmi)
@@ -5736,7 +5747,7 @@ static int __init mlxplat_dmi_qmb7xx_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_comex_matched(const struct dmi_system_id *dmi)
@@ -5761,7 +5772,7 @@ static int __init mlxplat_dmi_comex_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_comex;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_ng400_matched(const struct dmi_system_id *dmi)
@@ -5787,7 +5798,7 @@ static int __init mlxplat_dmi_ng400_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_modular_matched(const struct dmi_system_id *dmi)
@@ -5807,7 +5818,7 @@ static int __init mlxplat_dmi_modular_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_eth_modular;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_chassis_blade_matched(const struct dmi_system_id *dmi)
@@ -5829,7 +5840,7 @@ static int __init mlxplat_dmi_chassis_blade_matched(const struct dmi_system_id *
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_rack_switch_matched(const struct dmi_system_id *dmi)
@@ -5850,7 +5861,7 @@ static int __init mlxplat_dmi_rack_switch_matched(const struct dmi_system_id *dm
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_rack_switch;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_ng800_matched(const struct dmi_system_id *dmi)
@@ -5871,7 +5882,7 @@ static int __init mlxplat_dmi_ng800_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_l1_switch_matched(const struct dmi_system_id *dmi)
@@ -5894,7 +5905,7 @@ static int __init mlxplat_dmi_l1_switch_matched(const struct dmi_system_id *dmi)
 	pm_power_off = mlxplat_poweroff;
 	mlxplat_reboot_nb = &mlxplat_reboot_default_nb;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
@@ -6138,12 +6149,6 @@ static int mlxplat_lpc_cpld_device_init(struct resource **hotplug_resources,
 {
 	int err;
 
-	mlxplat_dev = platform_device_register_simple(MLX_PLAT_DEVICE_NAME, PLATFORM_DEVID_NONE,
-						      mlxplat_lpc_resources,
-						      ARRAY_SIZE(mlxplat_lpc_resources));
-	if (IS_ERR(mlxplat_dev))
-		return PTR_ERR(mlxplat_dev);
-
 	mlxplat_mlxcpld_regmap_ctx.base = devm_ioport_map(&mlxplat_dev->dev,
 							  mlxplat_lpc_resources[1].start, 1);
 	if (!mlxplat_mlxcpld_regmap_ctx.base) {
@@ -6157,13 +6162,11 @@ static int mlxplat_lpc_cpld_device_init(struct resource **hotplug_resources,
 	return 0;
 
 fail_devm_ioport_map:
-	platform_device_unregister(mlxplat_dev);
 	return err;
 }
 
 static void mlxplat_lpc_cpld_device_exit(void)
 {
-	platform_device_unregister(mlxplat_dev);
 }
 
 static int
@@ -6388,16 +6391,13 @@ static void mlxplat_i2c_main_exit(struct mlxplat_priv *priv)
 		platform_device_unregister(priv->pdev_i2c);
 }
 
-static int __init mlxplat_init(void)
+static int mlxplat_probe(struct platform_device *pdev)
 {
-	unsigned int hotplug_resources_size;
-	struct resource *hotplug_resources;
+	unsigned int hotplug_resources_size = 0;
+	struct resource *hotplug_resources = NULL;
 	struct mlxplat_priv *priv;
 	int i, err;
 
-	if (!dmi_check_system(mlxplat_dmi_table))
-		return -ENODEV;
-
 	err = mlxplat_pre_init(&hotplug_resources, &hotplug_resources_size);
 	if (err)
 		return err;
@@ -6460,9 +6460,8 @@ static int __init mlxplat_init(void)
 
 	return err;
 }
-module_init(mlxplat_init);
 
-static void __exit mlxplat_exit(void)
+static int mlxplat_remove(struct platform_device *pdev)
 {
 	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
 
@@ -6473,6 +6472,38 @@ static void __exit mlxplat_exit(void)
 	mlxplat_pre_exit(priv);
 	mlxplat_i2c_main_exit(priv);
 	mlxplat_post_exit();
+	return 0;
+}
+
+static struct platform_driver mlxplat_driver = {
+	.driver		= {
+		.name	= "mlxplat",
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
+	},
+	.probe		= mlxplat_probe,
+	.remove		= mlxplat_remove,
+};
+
+static int __init mlxplat_init(void)
+{
+	int err;
+
+	if (!dmi_check_system(mlxplat_dmi_table))
+		return -ENODEV;
+
+	err = platform_driver_register(&mlxplat_driver);
+	if (err)
+		return err;
+	return 0;
+}
+module_init(mlxplat_init);
+
+static void __exit mlxplat_exit(void)
+{
+	if (mlxplat_dev)
+		platform_device_unregister(mlxplat_dev);
+
+	platform_driver_unregister(&mlxplat_driver);
 }
 module_exit(mlxplat_exit);
 
-- 
2.20.1

