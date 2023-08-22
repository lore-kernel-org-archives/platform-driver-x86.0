Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED23BEE49A3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:17:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbjHVIRZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233701AbjHVIRY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:17:24 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272F1196
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjCXr2IPsZEzeXs3RrnSvAC77Sj07vBfw8I0cOfcvPo0X4sLeY7Y6BiLAqj7RQCcW/VkcDE2ztMHMyTa3UT1TMBFw6r9m/glyHOvGTCHiOKL8TRsyt3rVZK7psuYXSG84wrPIgghuWidb4Q01N6I5SAKBrP/j/HF/jOAmErphzj2AjGtwKxCKOVcqfvf9PoFnOLZzl8fE3ORHINxseDQnjNWTJHiT/uIxNXbpFXtWH1FpiGhAJHC6ALLiq3Q/wkyzGPLj3x9ZVBLIF17jHT7kZ8GD3QEBPGF3/WRlKSbHJvZidb1Is96kwFSblkk+lqZ02ahSp3kIqdw5KQlMW6hzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYfDRWBP+PJN57L4JsMwH/gMwl9QvV+/wgy7hH0pHtw=;
 b=IZDjAvEcdJ3NxeMq6k0mNv+5CEIkGwBrEVG9EgDbVxFJZAHFH0cXF/F6M9O38UImRTALp9OjifHxW+e6u1TN2LtbekZp+EfQ9DAFkfQJzlBh+IAZF8IjU0B2zRRoj5ZH+WKqKniKg/Gsz+vwH91Tx4W7qNTAgxRtlPELXecKzi8Z3QK6acPii7EEqIyqCdsLPZlBmUMQdx8e4ziFay/7+E3dLqdxtVjdAbaox07DgqQJ9TMV53Id1IvVXsFqoWsQQNgCHVPSjg6x1VrmdycQv2kQESLZAxI+tUR8XkOb23rVbNkNGGjfgvuscaxGvAILmLeUkTdex1KriVx6i+RYTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYfDRWBP+PJN57L4JsMwH/gMwl9QvV+/wgy7hH0pHtw=;
 b=Q53qvatVsoHG8rOKTc/X6ouneNzYHVNjPqmAzuEOkj2jAx29A7iIQg76nph58nU30TL+cRVJjS3/vMbe1ImZUtOfQzh6VkV/sIKikxVJ85P1Vhg/3DE/773DJElGtlbEGeLGBxLcU7v2iuI3itMZw38qNIH6DWrnZRxxJmehQbiuwqmC6k0lCP7RQHIAI+fANKXKqSbkPDnOi4zmRj73WyGS5ZwomuUN4nh3exWGDyrb3RtMIWwlzjCxHpJP9tF0f1KGk5AY+edkB/dPYw30JJcaRruwdnkgxRM7eZHYXwAUNcs1yzdxe8DBt+BWqOp5b3wsxmVNbL6uvj5dg3dJaA==
Received: from SN4PR0501CA0056.namprd05.prod.outlook.com
 (2603:10b6:803:41::33) by LV8PR12MB9407.namprd12.prod.outlook.com
 (2603:10b6:408:1f9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:17:17 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:803:41:cafe::95) by SN4PR0501CA0056.outlook.office365.com
 (2603:10b6:803:41::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Tue, 22 Aug 2023 08:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 08:17:17 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:17:05 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:17:02 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 10/16] platform: mellanox: mlx-platform: Prepare driver to allow probing through ACPI infrastructure
Date:   Tue, 22 Aug 2023 08:13:29 +0000
Message-ID: <20230822081335.64344-11-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822081335.64344-1-vadimp@nvidia.com>
References: <20230822081335.64344-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 drhqmail201.nvidia.com (10.126.190.180)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|LV8PR12MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: c900bef7-95d1-4f5f-38b8-08dba2e832ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qb4rJdBnTAv0m52tEP36XviHrycZJWwd2h6QKqkJeL9LyNAugqbTZamdaYCJxTblwT1YAhsh04xTRxpgExyjDpCByRlYUH/AY/HJLwFBlaH3UwF86oqzBZ8PVjKXGDl1vPOYiYgp0P5NhN2HJTYadorPWhu/o0lVVaVvQVtkiCakMQkk9+mbOnBcN/PH//wFjNAkk3WnJb25B1bf8VtQAO5eylDogqBlKqt2FoMtVp6l99xMILiDJTvz/j5VHNit1R2Pn0cRi6FhmrYcXayR0AQpz/QeC12tUnc02CADuWjJv9sOhUp02ssV6d00IiRjb1duBdczqECgnIvWEQotmeRNrBy0ghXfmgBAcAssKAGaHUMk36ti2pLOpSdr7CQnGXKiK5IsiPGAO3XS9EX81TVpk9FmhBSsl923CxuaOPh7UL0VNPQKZWQ02n3OojaY6AEwT7Y87jjd4vmGiz9LzPPZ85DptUgMb2Cmv/XhTv1CHQrxX9g30xT2NDfOnkDFzVpSoVIaSMagLUWmz7d9g441gGrUC3EywNH6Stx3WgUDHi2+b9cMTEXlAtAtST1ElfHGaTTTXrFQzqBgUxHjB7bivsd3oDkjAkgsnLdWqRDcA803qM1ZYRsBdK7ciEc+0pVPKaQO6w04qPz6rH5Rkc9tN53UdRcN87mKNnOETyBt4iEzNFmeixc7rFjfs4DUjMa/yIYHOtNZ07TF0ryr2wo5Zm44wYyaMlCVYeAgXBc=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(83380400001)(5660300002)(336012)(426003)(16526019)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(107886003)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:17:17.2105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c900bef7-95d1-4f5f-38b8-08dba2e832ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9407
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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

