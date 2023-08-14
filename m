Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E6DC41513
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:38:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbjHNUh5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjHNUhz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:37:55 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4970E5E
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIG1TrltHWR4L9gXlXk4hl9O+hFP7RbyxrxBJ/ywsyse0wQxIWVKfWFDFpDDebsbNbN/1p7H/frmTapkuMFbJWU7oFRjryzhsgzURmxHepxFoI7i8zfz5+RbZZOZJDMRARY2VQB2Jrw+9nrfdxD/r/g2i2/zPflzat0c5GLxalBxqZ6jk+Tg0dZKLTBDVqHBXYnhwjf/SmMMyiIKIJja+pA5l5af5k6jtgaKozGkbsfHk1aWVpfPO2UoOVeMbtlg+V7Wzl52nhFYu3nDV8BRqQJV8vi3BCJdt/wehk4MT64pNs7yp6QpyB7LQMkSokOiPjuGBS1cC9ZeEgaOgn94RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbL2bEezRmT8Qmzx77kE/UFMDx684YKbSX+v/z2iOuU=;
 b=PS4ze4/L8c4dbmCXrhMHaJ84WNucYt4r7Su8EIWddEh1i+y0enUcY7tGZ3E9ALw0C0f7K5EEzmutIFgb1qBDegFrr6COyLi+GuXaTjM25Ef54fThSAn1GO5KS76gXkBXmxWvIVzgO9U261kClpoDx0sio5eqRc1EZQYGBJHUt39vz3lE7FAf8gkRHDQDtiZPTHcOIg4pzNeZmksbBwmwYtXUmZcLiU+eZ+jGREA4lE4HqsxHPoIJVCfNAJLKN7tc0AyLli8uuvlww8LfNHH0E4K5MrR9HvxTo54KA1nWjYK+MEDo6TLwKg2bnLk1/f7Ke7aEm+6DcyrqmHldWujo9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbL2bEezRmT8Qmzx77kE/UFMDx684YKbSX+v/z2iOuU=;
 b=ZCejIrc+M/sknNkGS+Y5AsB4yTaE+yrr2zF0b0e+YneBhcHRARnq3/D/jteuSwRHOWhOaMsiv/ckCaoUVIXdKAkqKNnu7bsWfA5mveFdzVK2wOHVTQ68OnQ3+4E6vsUn01gQZhR6mRCT3vw5MPF3FOUeQUtxHs8A1eSf5E0TQHkYmzVMDVLyipiQT3n3zdYkWg/Anfu1h9eMJDd8QT/UdpbbZ/M8OD6KKqQR/dhIlASakZIPZ4kgX3JqBfF49EkvgdytdVAm5oaJf/C+AryZf/JRhVYWiiYYev2kD26PKHI6Wt9NtR1g+DICielCL+sjDgCit4pNJNSQlE9ujHjS8Q==
Received: from MW4PR04CA0367.namprd04.prod.outlook.com (2603:10b6:303:81::12)
 by PH0PR12MB8032.namprd12.prod.outlook.com (2603:10b6:510:26f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 20:37:51 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:303:81:cafe::3a) by MW4PR04CA0367.outlook.office365.com
 (2603:10b6:303:81::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:37:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:37:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:37:36 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:37:34 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 10/16] platform: mellanox: mlx-platform: Prepare driver to allow probing through ACPI infrastructure
Date:   Mon, 14 Aug 2023 20:34:00 +0000
Message-ID: <20230814203406.12399-11-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814203406.12399-1-vadimp@nvidia.com>
References: <20230814203406.12399-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|PH0PR12MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f6e08e-e9eb-4790-a82d-08db9d065433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36tOxB5efA7tmZ/X3jKfPUxonG41EmNV1efynAbNn20c5G1sWvWtTl4bPk+DbW7DObkIEGAgRnJv1y88qaT8adq8IgR48uxsAexiX9GfwBBEgrkq19/nPZWGbtqwWXJAhVb0SkMAP4SJN2/hLgm/Mpqx4OdNiXUw7+h9JiBxnYYxIR4xfSsHq/gUzh/OwaeuErWuzp8qEi2q/NS4JbbBOVvtpdlTv6EVorZmH5eWqsT/UQo1jBcXzQTlQrog1Mcod0uw2ZJwAgxBHARKIcniRHUOLRIIOOttGYKJVLcQFoFX1EvnzpJuCAwuok2bPUe2Nwuh+f53IV+osyrGsDrpo8IOOS4c2JOGGFKJvC5ECM/Ptv66+V1HSz2UnqhdXBCn2CUSHA3u4tvniVgfRQdSwWaISkfeBLMLc4cRiIB1Pyn1Wso05ETgy7CU7B8lFT95j5xDuRrN5y4JKT1Wn/l+uBoLYjhJrB+y4wrIJJKc0DCYpedE+4OK7JpVzgHPtBKEjdPMAyvEbEdxev4ROGHnYHlitZTbyvLvRYYMmv/FVfG27U9IaQ/5j7PqHPKjpGyRyFwRycysW//EY6TjPE4Iwvg/zlUshVGHrA/7XP+yiy2tqHefTjPbATNBw+0WNXMixpCz9kjG7kK1MGM02KNACBpF20WrLA+OzHXw07WEmeIwqIWY2FGQdmn1zClttIU0kZdUFWylFf4oemU27KSxfBTxZbeMajrWyXWmYthQZho=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(82310400008)(451199021)(1800799006)(186006)(46966006)(40470700004)(36840700001)(6666004)(40480700001)(54906003)(40460700003)(478600001)(7636003)(356005)(82740400003)(2906002)(5660300002)(36756003)(86362001)(6916009)(4326008)(336012)(70586007)(41300700001)(70206006)(8936002)(8676002)(316002)(16526019)(107886003)(1076003)(26005)(36860700001)(47076005)(2616005)(83380400001)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:37:50.9530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f6e08e-e9eb-4790-a82d-08db9d065433
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8032
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
index 296569492a71..73f887614e04 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -5574,6 +5574,17 @@ static void mlxplat_poweroff(void)
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
@@ -5594,7 +5605,7 @@ static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_default_wc_matched(const struct dmi_system_id *dmi)
@@ -5617,7 +5628,7 @@ static int __init mlxplat_dmi_default_wc_matched(const struct dmi_system_id *dmi
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_default_eth_wc_blade_matched(const struct dmi_system_id *dmi)
@@ -5642,7 +5653,7 @@ static int __init mlxplat_dmi_default_eth_wc_blade_matched(const struct dmi_syst
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
@@ -5665,7 +5676,7 @@ static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_msn274x_matched(const struct dmi_system_id *dmi)
@@ -5688,7 +5699,7 @@ static int __init mlxplat_dmi_msn274x_matched(const struct dmi_system_id *dmi)
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_msn201x_matched(const struct dmi_system_id *dmi)
@@ -5711,7 +5722,7 @@ static int __init mlxplat_dmi_msn201x_matched(const struct dmi_system_id *dmi)
 	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_qmb7xx_matched(const struct dmi_system_id *dmi)
@@ -5737,7 +5748,7 @@ static int __init mlxplat_dmi_qmb7xx_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_comex_matched(const struct dmi_system_id *dmi)
@@ -5762,7 +5773,7 @@ static int __init mlxplat_dmi_comex_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_default_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_comex;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_ng400_matched(const struct dmi_system_id *dmi)
@@ -5788,7 +5799,7 @@ static int __init mlxplat_dmi_ng400_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_modular_matched(const struct dmi_system_id *dmi)
@@ -5808,7 +5819,7 @@ static int __init mlxplat_dmi_modular_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_eth_modular;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_chassis_blade_matched(const struct dmi_system_id *dmi)
@@ -5830,7 +5841,7 @@ static int __init mlxplat_dmi_chassis_blade_matched(const struct dmi_system_id *
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_rack_switch_matched(const struct dmi_system_id *dmi)
@@ -5851,7 +5862,7 @@ static int __init mlxplat_dmi_rack_switch_matched(const struct dmi_system_id *dm
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_rack_switch;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_ng800_matched(const struct dmi_system_id *dmi)
@@ -5872,7 +5883,7 @@ static int __init mlxplat_dmi_ng800_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static int __init mlxplat_dmi_l1_switch_matched(const struct dmi_system_id *dmi)
@@ -5895,7 +5906,7 @@ static int __init mlxplat_dmi_l1_switch_matched(const struct dmi_system_id *dmi)
 	pm_power_off = mlxplat_poweroff;
 	mlxplat_reboot_nb = &mlxplat_reboot_default_nb;
 
-	return 1;
+	return mlxplat_register_platform_device();
 }
 
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
@@ -6139,12 +6150,6 @@ static int mlxplat_lpc_cpld_device_init(struct resource **hotplug_resources,
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
@@ -6158,13 +6163,11 @@ static int mlxplat_lpc_cpld_device_init(struct resource **hotplug_resources,
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
@@ -6389,16 +6392,13 @@ static void mlxplat_i2c_main_exit(struct mlxplat_priv *priv)
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
@@ -6461,9 +6461,8 @@ static int __init mlxplat_init(void)
 
 	return err;
 }
-module_init(mlxplat_init);
 
-static void __exit mlxplat_exit(void)
+static int mlxplat_remove(struct platform_device *pdev)
 {
 	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
 
@@ -6474,6 +6473,38 @@ static void __exit mlxplat_exit(void)
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

