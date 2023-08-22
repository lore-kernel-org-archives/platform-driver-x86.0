Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21854EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjHVLkG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbjHVLkF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:40:05 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::617])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC90E77
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4kOYhIl1/WwwKGhKXo/MyEhmMU+vTJoOhp9MocvhACk32gfczXPQrfNj4YV0qqtgZW5vlsdRPbLqjn7M1X0m+R9OjEzaoZfDSrw9xFDY8kxQE6h5S5D7i0f5Vs7Jt/3KjjhrvTCIDSVD9ENbNnUWCLYPXiMHqAyHc65S/N8NLK2oQEWUVr521MfslORc/S75XIP+1BIJP513n5sAwir8tgRONOJXFoVH1EjjTqI4r9CH9KXyHAFT32RzOHcMhduk6w67BqFz5GgAkV5nmlLOKNT4Gqrvh5+Jyr5ijXC/9YhPiEQIbtPlP0x54Fx+SkWBv6R7j3UcnMr9+L8ZfQLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3c5mI/r2oZ59kUZ1R8KC9cQnelkWenbvLZtoZDpODQ=;
 b=RoYL0gM8SjOndle5kb7drLn7IlMVl2zZh8ALGT6ryYDCLHdcDdFuwaFLtOLi3+AfkRChoSxVd/4Rrg0uI63+IVTuS5QYgr6sPHQCALAzcl4uCAys+ygWVhW+AnJYTlSSfXMqMmCFcyohqI4Fi0DKrIDnx0FKgbysH2QcQZ3LuhhHDPYU6zL8/4oLoOqavkzxaTx9yfcD+C2u2XuBsAAcltY8gKQtOlZlD+3ROnl8H/eBxSrbYo0315umhnPjHoLxJe8appq/gtY6moFQ26juU7P+oiu0S+Bu5JIu1b0hkbiI4+QKOGTpSBimcNZYQRYJrA8AwL7O/er8mzmN6iM+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3c5mI/r2oZ59kUZ1R8KC9cQnelkWenbvLZtoZDpODQ=;
 b=qGb7XU5odbflG7/Jk2z7BVVxIHCQ5pzsKBxf5/EmoSgWuKDbMJIjRWUIruYllMppSLD8kLggR68NmEYyUYfIZ80d1L+j1npckNwqWnvlMf19hKXlzR8zkLW5k7NUWNuPXFnI5hs8OpU36FvZWg1D60V5aaoyHxxaxoQehYX/9D/rZWDGk/3O9Ekk496Ahh3M8u1LW1WS8VT/nZBsN2le47IXBZ2zdQ4ghT3EkiMG/qymmBHtNL5hvnCm8UQlpzCX0phqUkUvPXG03jOPKzfLnoKv1SQkoqDcVk2L7CUU9J53+0c7zFBrBo+CTbmLELXA+thpimfyCn0X1v8fqgVu2A==
Received: from CY8PR11CA0041.namprd11.prod.outlook.com (2603:10b6:930:4a::13)
 by PH7PR12MB6667.namprd12.prod.outlook.com (2603:10b6:510:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 11:38:28 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:4a:cafe::5c) by CY8PR11CA0041.outlook.office365.com
 (2603:10b6:930:4a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:38:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:38:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:38:17 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:38:16 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 10/16] platform: mellanox: mlx-platform: Prepare driver to allow probing through ACPI infrastructure
Date:   Tue, 22 Aug 2023 11:34:45 +0000
Message-ID: <20230822113451.13785-11-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822113451.13785-1-vadimp@nvidia.com>
References: <20230822113451.13785-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|PH7PR12MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a54e8e-b4b4-4859-2371-08dba3044d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cLs08jEjm4dtazc2eMHnm8ZDPHqwh3zbgnfvyPOw2JSM34gFcJ1EqGcCpGaaGRxbZHoqQFvoKw5icFXYEJnIaYsT4i2I7N1IHuPimxJqZ30B52kjhus6XgAIWjyHqJ7A37wX65bSoxbrQT+0wCEEC5q9NV8V5THwRRQoHFmhu7snpzHoR/Mv6MTahvI96QN/MGIwDEbhUZVL75+GMGNv0LZSnEwfKXh3lBhw8AUyN54hSJ07TWYRVDU3X8MuDdPm2Wlcib1nbHkpvGdHhV09Y3abbfdv54hiwK1vtzpyFwm/V/D9J/iualcJqMoNpV5ENuJae2za/lmhf7oMANyP5YXQxgLXQBMfJjNF7ld+DlkdppR38m2YAx9KWoPHV8ErqGEirvgLRdaq6sxvW7XK93SnQWTBnzP1I7AVbrXzdX2WSsOXJNuebJGhukUm1eQAyI1St7hrLMjpojMEnprdIta3g3LBSfRta97Fs36hCbCXLnwYiiJNUjgyqWk5J+pB+BgVmrxrXeBKFCpc/jAPv39onmH6IaN1iaLKtjIEpP71DXzMYuzOWX1OkPd0mnqO+s355+owg/aus29jBCwwkBnNdyvaOMwsDvZ2t6fqtlfNmFvsrZQslduAa7eK5DX8rWqOZ1xMZ+sPQQWJ1BHfGNROprw4upkxI+rppaL82n0NFIk4StRkfM7abhH2h4YUp9S6453lLfm8MSGS0T2Ijp8c4oNOPWQhXA2tM966MLc=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(82310400011)(451199024)(186009)(1800799009)(46966006)(36840700001)(40470700004)(83380400001)(2906002)(66574015)(40480700001)(5660300002)(336012)(426003)(26005)(16526019)(36860700001)(86362001)(47076005)(8676002)(4326008)(2616005)(8936002)(107886003)(70206006)(316002)(54906003)(6916009)(70586007)(82740400003)(478600001)(356005)(6666004)(36756003)(41300700001)(40460700003)(1076003)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:38:27.8845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a54e8e-b4b4-4859-2371-08dba3044d96
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6667
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
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

