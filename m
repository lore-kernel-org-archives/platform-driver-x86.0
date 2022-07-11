Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E6CC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 08:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiGKIqd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 04:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiGKIqb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 04:46:31 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B749E1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 01:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXFkW6YDEENh05vC0aAec975938u5h05IyIMjxhihu9b0BIRfBwTaCb8kzX50QeyL/BXEQcBiKkT/gJKtXoU77dXB5rN6RETbTmZy32xvUuJRnUuZ2BGy3G4Sl+TRFucyFMwVrGJxdplaxPNwyK2QXzpQibXTsKnjfOeAxi99U84+Qescx9fxA7v4i7FffCToNZSBhJpbgGX9gfSrYm7bHd+Z4d0d3/b6Ho4FAT1CDo6sIogEgCfIHlq/pI9LWy7XwCSFNft+GM1M7NiG6ua1iKIaXyrXqmEFdFkUxt1hCrdqqnwav1xivFwxRjqve++CqZeoeFEoeBdlta7Gm8dtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qd3LL3I+EVi14ZulST+yHpYUJIVEIMZK0yk35PmxZUA=;
 b=WWBxpzfMcXB1IMeeujknWZUE2aJGJAgh6yEeJP3rZMBs3zMr7b/pO/Axkrmve0j1ucaIoQUyUA2nPLxdQ67dSd+BWcyLpq6RA5MclYpXWmDNnsYGY9RiPMMCvFTp8BopJtHj215VApG2JQEQH90AhX/E6HfNJvBYUq1zHhVhNqmKFeli1wKiKyeFgBN1505i2pkc3dImp6MmIIN67EXwarby9mSz3wbSKG4fugYZ0I9c7IQXLR8LsQXQu6ZTf6Us9+ZRvd0XACoWgBBbh1zLqrqemUUxKHhGo43/BrDGrVm9Hdqf+g6JRKovHOLiiEFlMReqqZkHvcPbTLbOhgdZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qd3LL3I+EVi14ZulST+yHpYUJIVEIMZK0yk35PmxZUA=;
 b=dEGMvp5ZDEaji0kJ+LtNAl+fMOjwOV4iD23CLekpwaQ6gs0xJqadwsPTB43y86y0Jta7MrpTwhc37rjj8MQKPtw8//2TYt+wrGGOIp9yf2Y95ZgvRAvvK++HqYlhAQlK5PoXFympVnAuqYshA8k3MHQCwnG2k54/3avhCcqA7Pab0NJ2yqOjDQrSZdb9719KUQuC7pMADUjFlAZtYSFUkoljj4NpQV2LfyP2CyIpynG70JDd23qoMvPG/gwefwclyo/SBrWnqsMzA56WgQd8HUzCzAo34IwC005byfrp2FqRvTPcHBpdjh1Jzw1w6f1sSGaHsDqALSjvH0JKoE7xbQ==
Received: from MW4PR04CA0388.namprd04.prod.outlook.com (2603:10b6:303:81::33)
 by DM6PR12MB3532.namprd12.prod.outlook.com (2603:10b6:5:182::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 08:46:28 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::5b) by MW4PR04CA0388.outlook.office365.com
 (2603:10b6:303:81::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Mon, 11 Jul 2022 08:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 08:46:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 11 Jul
 2022 08:46:27 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 11 Jul 2022 01:46:26 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 3/9] platform/x86: mlx-platform: Add support for systems equipped with two ASICs
Date:   Mon, 11 Jul 2022 11:45:53 +0300
Message-ID: <20220711084559.62447-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220711084559.62447-1-vadimp@nvidia.com>
References: <20220711084559.62447-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfc5814e-e5bd-45e6-95e1-08da6319d89a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7TMHvmk0rdmCKkDRqQELEQGn5IfCVwVAcNQGAfpoS/ckwrKG99XLNdQDnocWLc4PZEQpPvyNxsVTWd1iQQXPARMAahv+lYDQ81Fe2o3l4096PURbFANvgiI5ZwyuhT87bHFY4J7Mxh1fUYVvRBudRyXRnGR/5AUVdVkEWPZwZVqE1tb7iCQTta7NFkzCRF4tlV0JXVro2yg/3nFhIWDU1kaK+nr4SSKMghuw37EUiHmPWwn301zzScjuJDcTLpxE0l+K3lsKQieSGR4E0BG7T4uIoA/wzUfk+iy1CnM4N/OhRZ1YR0b6ugTR0lZ7ZUJ9Z/8EB9AM8539SavN8V+s1cEwR2pYx95hRv6+NQcVG0GQFIqimbKhrtevhBCuvc+f91/RG5KH0fw5FovBQK2AS/zy/YuEbxTLrDOsG+9xTf897jYCvEEDUF+7eghAT5QMc993iyGCa6iTOH9C5dIFMruY9N1djODF9qS64Ncd7jbvpm1OejMulOtU3fUcc8Lp6EuxwcqPvGQdxEWhLN2ROcnuglY4J9oxwekpXMVUDQg5wvr2EFo0kMmcH+XCGjuYE7clT2NEJX26MH89ISObqMCBoPnDJnvQ0DgFAI+zdUZO2zTCntaoROuFyyl5CnXFblB1ZOUWIDE4DBTtux1Mnl4H4y3Uu3xPYzQPjXvC+msDrfhIu1ild9q8o9vV3em7XnGNKMvnAhVelYey2MvYqIusGeHHdh08O8UtcxhYah+VJCVQ7XCmCQKPPGpHriQ7y8UWEMdc3fFK/+X2+wjgGUPqZoTdZwrwuPdUnY18lwPc0ciL5VMMoLWxuTqk5kU2lvKPGQX+mKavDmq8Sc82vhJ28ruzrJfGQ0WGSkXZ9uo=
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(346002)(396003)(40470700004)(36840700001)(46966006)(8936002)(81166007)(2906002)(426003)(478600001)(5660300002)(70586007)(82740400003)(86362001)(40480700001)(70206006)(8676002)(186003)(4326008)(356005)(36756003)(26005)(82310400005)(6666004)(336012)(47076005)(16526019)(36860700001)(316002)(40460700003)(41300700001)(2616005)(1076003)(6916009)(83380400001)(107886003)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:46:28.4594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc5814e-e5bd-45e6-95e1-08da6319d89a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3532
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Motivation is to support new systems equipped with two ASICs.

Extend driver with:
- The second ASIC health event.
- Per ASIC reset control, triggering reset of ASIC internal resources
  and restarting ASIC initialization flow.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 52 ++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 12d56d7090f1..190d488d4cd1 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -34,6 +34,7 @@
 #define MLXPLAT_CPLD_LPC_REG_CPLD3_PN1_OFFSET	0x09
 #define MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET	0x0a
 #define MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET	0x0b
+#define MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET	0x19
 #define MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET	0x1c
 #define MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET	0x1d
 #define MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET	0x1e
@@ -69,6 +70,9 @@
 #define MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET 0x50
 #define MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET	0x51
 #define MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET	0x52
+#define MLXPLAT_CPLD_LPC_REG_ASIC2_HEALTH_OFFSET 0x53
+#define MLXPLAT_CPLD_LPC_REG_ASIC2_EVENT_OFFSET	0x54
+#define MLXPLAT_CPLD_LPC_REG_ASIC2_MASK_OFFSET	0x55
 #define MLXPLAT_CPLD_LPC_REG_AGGRLC_OFFSET	0x56
 #define MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET	0x57
 #define MLXPLAT_CPLD_LPC_REG_PSU_OFFSET		0x58
@@ -193,6 +197,7 @@
 					 MLXPLAT_CPLD_AGGR_MASK_LC_ACT | \
 					 MLXPLAT_CPLD_AGGR_MASK_LC_SDWN)
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_LOW	0xc1
+#define MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2	BIT(2)
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_I2C	BIT(6)
 #define MLXPLAT_CPLD_PSU_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_PWR_MASK		GENMASK(1, 0)
@@ -588,6 +593,15 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_asic_items_data[] = {
 	},
 };
 
+static struct mlxreg_core_data mlxplat_mlxcpld_default_asic2_items_data[] = {
+	{
+		.label = "asic2",
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC2_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
 static struct mlxreg_core_item mlxplat_mlxcpld_default_items[] = {
 	{
 		.data = mlxplat_mlxcpld_default_psu_items_data,
@@ -1151,6 +1165,15 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
 		.inversed = 0,
 		.health = true,
 	},
+	{
+		.data = mlxplat_mlxcpld_default_asic2_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC2_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic2_items_data),
+		.inversed = 0,
+		.health = true,
+	}
 };
 
 static
@@ -1160,7 +1183,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
-	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,
 };
 
 static struct mlxreg_core_data mlxplat_mlxcpld_modular_pwr_items_data[] = {
@@ -2856,6 +2879,18 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.bit = GENMASK(7, 0),
 		.mode = 0444,
 	},
+	{
+		.label = "asic_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "asic2_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
 	{
 		.label = "reset_long_pb",
 		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
@@ -2995,6 +3030,13 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.bit = 1,
 		.mode = 0444,
 	},
+	{
+		.label = "asic2_health",
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC2_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
 	{
 		.label = "fan_dir",
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION,
@@ -3934,6 +3976,8 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_ASIC2_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_ASIC2_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET:
@@ -4026,6 +4070,9 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_ASIC2_HEALTH_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_ASIC2_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_ASIC2_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
@@ -4153,6 +4200,9 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_ASIC2_HEALTH_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_ASIC2_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_ASIC2_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
-- 
2.20.1

