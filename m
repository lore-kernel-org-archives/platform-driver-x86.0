Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A172EC433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat, 23 Oct 2021 09:41:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 760CD60FD9
	for <platform-driver-x86@archiver.kernel.org>; Sat, 23 Oct 2021 09:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhJWJnW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 23 Oct 2021 05:43:22 -0400
Received: from mail-mw2nam12on2050.outbound.protection.outlook.com ([40.107.244.50]:25387
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230104AbhJWJnU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 23 Oct 2021 05:43:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIzs0v9xBeLI70h2D3dm192yOe5TfoJwILoZL8mno1HMsDSgVOOAPWNGLc6Ex59hL399GXpZf5bQhOdn9aVw23t18G+V1vPYBZehLhT9A6nleS794Gt3MUFSi8ndXd2JCje9ucMLmsPXJI94BLxLsYnUI6A9bNVF6pk+Si8ya5JToKWQSMKwPiCuGz4YSeGvJ2Uvvlmy2G0M223TcgQldGUPOcMX6EcxDxuVUC8osXrIlSxWVJSjH+K0S/JORNLJoorkWhFfSErAgu0JMnqRBPbDOy/UKmMGZpGHAu/D07Fy8FFLH0dKfuWQkOghc7WslzUL7hYjoXzeZkdKl4x4Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMOpGkD+gnIrbpnlyT7T1dMn3ItMEI737FUg8sQOxpk=;
 b=V6qDafsXmQTY8J/USa42pIoVb/YKyOozwbz3JYshXDNrgVwBJqybRaJGuwZGQPAtwg5HgrBUIqcgFkDf5I8vW944jQ/9cXurPz8dkPsF+epc3OD60Rdm0cI96V17PqW0bPEOaCljKChNhds1Fv/MoJyhMK+nW2dCSxrXPywGleL1fEQr0K/8WaDEeLm6slnhRTgqqOd8aow4s9jnOBCTLke2aGHcq8XVo1SDuTGDxcUNv7imZILRpcEWBoAp2GUByMisW7aTJM3rFXZGw7ARNXz2vWi8XpaOHzmUfzGZMTpRxw5yPiB+jyjFFYuW2X40NZxaTl0CV98MupcJRXjTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMOpGkD+gnIrbpnlyT7T1dMn3ItMEI737FUg8sQOxpk=;
 b=U97WUpVWLyb1PAguVXp8zGtISGGr+TpNPXfXF7GySdCcQ5uHVawPIDTxeFwTbT5bWxKJ/9JwmBYFZlB1NuyGVOxFZGVEgL5OyT3ZAadtMX5OiWZMmHfDbQ+IMasRaSRFaT4Vv5F9inm8D6+YTiIzgYxSO72MR2ObgWUqi7bHfEKSNTV7AziQqeoxDks3PpYT+GEf8VWHZ+7m3xPACjMNCu7KwfrFqlNgH3WrhpUMq80YlFEglipQ8Yj2JtBgjDgFnqQ1sc4uaRG5NEBaQKGdHSjlpMDqLIghtV4gH4Yv669e6YGrdvDvZvERJtvKScN2Q5tL8bwRy5TIoHKDB4mI6A==
Received: from MW4PR03CA0353.namprd03.prod.outlook.com (2603:10b6:303:dc::28)
 by MWHPR1201MB2559.namprd12.prod.outlook.com (2603:10b6:300:e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Sat, 23 Oct
 2021 09:40:52 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::e) by MW4PR03CA0353.outlook.office365.com
 (2603:10b6:303:dc::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Sat, 23 Oct 2021 09:40:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Sat, 23 Oct 2021 09:40:51 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 23 Oct 2021 09:40:49 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <oleksandrs@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 3/3] platform/x86: mlx-platform: Add support for new system SGN2410
Date:   Sat, 23 Oct 2021 12:40:22 +0300
Message-ID: <20211023094022.4193813-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023094022.4193813-1-vadimp@nvidia.com>
References: <20211023094022.4193813-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c6ec04f-487b-4777-db9e-08d9960933f8
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2559:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB255974DFCD8CAD74457CD5E3AF819@MWHPR1201MB2559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8HTKLgs6hQJfmAIDkRnKsikXxzech6PG57m9aknqVocderqBrcI0f5SE3fN+w7R43teMeh1shmWERvpkbceJvKbbaQaZovPmzvYZ/+bOuAUgiLbVFI/u0UVpDZ/BF0G+Lul7LnfFIQoeSntTpCKvEt2yY0Rheaef5y6YG/iYD/9q7b+YaCcu/670ab6Nmr3s42U8q6c099NA0m5WOTlbqDm01cvg1AdiBk8Gc7IVkBsF90vtgWqbycGBzpZhqSV/VNKf8qrZQNDLCERANrIezhZ4yOkLcmK7kpH5APKoeWQ1lliegH0y5nGNhFEEz95oE98KS9MFd5htUVAuYCk0IviaOi4PB8dBKvqoJNAZvW8HtigGncHpKIX5/sU/m48yIZnJacPauIU8XhOd906ljc00vauB5jryZ7Fc3/vAOfyf7eJY2UNAUqhEDM3VK7L6KqbQ1FfIJTQr6es28cISZhIEOdT2TwZz8dhCcvx4U/+gyD3LlgeGEh7F7KmHNzpo61xUdDyX2btF2E2TojOM9649vMTcmMNfRAc2RPDou7GQVvIx6aiL5DnpIStmPK26xj51RplYMCu0uRdDpsIjOfKqwfSZPLHZXcrsEw3HFHuYURX2h7RsljRnT0FmUkM2M9J4ZceXCHMlwVLbsa2o+lbar++FyUWg1UsOaTiN7A16QjDS0qY4tXt70IgIwimMH4bvcYToSLVvB+LsTNHog==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(8676002)(8936002)(508600001)(70206006)(336012)(26005)(4326008)(6916009)(36860700001)(107886003)(6666004)(426003)(2616005)(16526019)(186003)(36756003)(86362001)(316002)(5660300002)(1076003)(82310400003)(54906003)(83380400001)(47076005)(7636003)(2906002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 09:40:51.9375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6ec04f-487b-4777-db9e-08d9960933f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2559
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for new system type, which is a water-cooling flavor
of the VMOD001 system class, equipped with 48xSFP28 and 8xQSFP28
100G Ethernet ports.

System is recognized by "DMI_BOARD_NAME" and " DMI_PRODUCT_SKU"
matches, when these fields are set respectively to "VMOD001" and
"HI138".

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 113 ++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 3d017e889ce5..447044fdcb77 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -533,6 +533,21 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_items_data[] = {
 	},
 };
 
+static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_wc_items_data[] = {
+	{
+		.label = "pwr1",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(0),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "pwr2",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(1),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
 static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_items_data[] = {
 	{
 		.label = "fan1",
@@ -661,6 +676,46 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
+static struct mlxreg_core_item mlxplat_mlxcpld_default_wc_items[] = {
+	{
+		.data = mlxplat_mlxcpld_comex_psu_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = MLXPLAT_CPLD_PSU_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_default_pwr_wc_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = MLXPLAT_CPLD_PWR_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_default_asic_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.inversed = 0,
+		.health = true,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_wc_data = {
+	.items = mlxplat_mlxcpld_default_wc_items,
+	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_wc_items),
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
+};
+
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_comex_data = {
 	.items = mlxplat_mlxcpld_comex_items,
@@ -2018,6 +2073,35 @@ static struct mlxreg_core_platform_data mlxplat_default_led_data = {
 		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_led_data),
 };
 
+/* Platform led default data for water cooling */
+static struct mlxreg_core_data mlxplat_mlxcpld_default_led_wc_data[] = {
+	{
+		.label = "status:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "status:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
+	},
+	{
+		.label = "psu:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "psu:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_default_led_wc_data = {
+		.data = mlxplat_mlxcpld_default_led_wc_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_led_wc_data),
+};
+
 /* Platform led MSN21xx system family data */
 static struct mlxreg_core_data mlxplat_mlxcpld_msn21xx_led_data[] = {
 	{
@@ -4311,6 +4395,28 @@ static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
 	return 1;
 }
 
+static int __init mlxplat_dmi_default_wc_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_default_mux_data);
+	mlxplat_mux_data = mlxplat_default_mux_data;
+	for (i = 0; i < mlxplat_mux_num; i++) {
+		mlxplat_mux_data[i].values = mlxplat_default_channels[i];
+		mlxplat_mux_data[i].n_values =
+				ARRAY_SIZE(mlxplat_default_channels[i]);
+	}
+	mlxplat_hotplug = &mlxplat_mlxcpld_default_wc_data;
+	mlxplat_hotplug->deferred_nr =
+		mlxplat_default_channels[i - 1][MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
+	mlxplat_led = &mlxplat_default_led_wc_data;
+	mlxplat_regs_io = &mlxplat_default_regs_io_data;
+	mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
+
+	return 1;
+}
+
 static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
 {
 	int i;
@@ -4474,6 +4580,13 @@ static int __init mlxplat_dmi_modular_matched(const struct dmi_system_id *dmi)
 }
 
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
+	{
+		.callback = mlxplat_dmi_default_wc_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0001"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI138"),
+		},
+	},
 	{
 		.callback = mlxplat_dmi_default_matched,
 		.matches = {
-- 
2.20.1

