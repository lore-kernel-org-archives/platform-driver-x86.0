Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB82C001B0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbjHNJCH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235523AbjHNJBs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:01:48 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB791199D
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6YybHY9Zh9wSXk9I6KWWB7TjJT7Hjass5uIg1w5QHYO0Ln/JZTdWBRqAf7W+gSmABP5ioPi5jhKHZ/H/Dxq03N8FRi0j+cPd6p3054SCL9/w15rBYBFucVilG+W72OzI25ftvfMMqNMsqYcsOk0B7k9GYL4Jjfk2LzlkMqPiI/xITGfo4z95CQEI/Eo+OiKq8AW/O561hcKeDeuEa3UwFaC0Yon0gd+C4i3oL4dSS14KfzKhDqgnDGh0F9zYAJ10G8JCfgwuO6roHdfPV7AcgsCKCe5fZymMAMfChOhA4CVwsjThOaJMQiTswHPVHLp9NSy0j47N5/Ay7Rol4KQ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sj/48k7xmk1m/uzjsMFaYjUeKRCSxSITBMelJkeNCBg=;
 b=F1e2vQmXNmgw0MxjgQwviJrVZrsCzg/KvwrQtK85hnI9D6dPNYYHZz94ZVhK17xIeiRtbChwj5L+6qaf65Fkd6iB8FsFLMe6dqZVvBPtnTuhAI4ZyxTSLH+/ju5ZOotMz5+HQy8QbwvsYKwRnP+LC6R2iCmVuMpoRqH/ePUebdubSLj02m54/92fYtM2GeelSt+1kE6+k25NErDnJaWBuvr5JoSWktZbDvOz72VbvuuvFekkP4Z99h3pvI0llBeWkC5owVksKkU7TYQZmHB2fsctEB9NjV48JbGH2OHp4vOAADmsmCkcisifaSwBVQX99aHMcMZR8O3VIoLs8ZISNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sj/48k7xmk1m/uzjsMFaYjUeKRCSxSITBMelJkeNCBg=;
 b=rFa/mQBjP7BShIyxm2+2o5jhcHTwz4QkZfnXLgn1bJ8LpFEnXnC0SZLtZ6Uo6Mt7qduev1W4jYg0n8S4lR5GxaRf4f3Z42Hd23uryi5RruaWYbZ3UCCvIPPk462S16dgEqaZdT9CjLakxMVQNsoADkdRdOolgC1AjGwGkFkwfjcfY034Fpl1DkUD7igoxoq+VR1EtIp9tI7KJ7MWe0TxZU5V4OcO5roujKVjSjA53XLSJTjcN0k2VQAM6wh0eVJ16i0SAkUiYzB2QDaP6gjKGKlgkLe9W5W7CbmnR0CgTq2KfCFS2hVtP1+yvv723FVb9ruunTlHMsvPvi3y3xMewg==
Received: from DM6PR02CA0155.namprd02.prod.outlook.com (2603:10b6:5:332::22)
 by MW6PR12MB8900.namprd12.prod.outlook.com (2603:10b6:303:244::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 09:01:20 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::30) by DM6PR02CA0155.outlook.office365.com
 (2603:10b6:5:332::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 09:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:01:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:01:08 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:01:06 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 06/16] platform: mellanox: mlx-platform: add support for additional CPLD
Date:   Mon, 14 Aug 2023 08:59:00 +0000
Message-ID: <20230814085910.56069-7-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|MW6PR12MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e90d4b-3926-48f2-3e27-08db9ca50718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4WEMWk62ol5ggJeBHiBtK5Qo79wvajiFYG5kDaqi9pyZnWXI9um1vImNSTm5RB/XAuE2KBOdysQLca4+ZFt68zWs+jASTqiWeKfFGeAjc6LFSLrY3F5N1tsGcDcmNg2bOsbmYB24CdrQDIUhlo9GjmPN3SAzJuTQ1J/XnsUNpRGRsbB3t69VComCP29n4lHUjDm3GpA+BUKBJfOYcg9EbCH+Ht7KH37IlR2yL/y6f4YBqGtXtzrb7vG2zI1HUCmVFRqEbGfwyqj2y0TG8Xf9XBXqex0Uscp44AYTeN6L1/pHhxWgzcNKpJCo8MraFGsO0rtwBuBRKmpcWvkRLXt3m/hYx90lUcNt8MAiUVJ/yta8mWTyh/0QqQu03mcCTYw8ZP9svbzIganyMpM/pltmqNrj4L26PA0iXCT4vW79NJaau1IQcRZV39bFQrdMhUHIZNs7htAfesf1cQ0Y3cdgLmahjaZnZ1zAe5bzYYCY6DqTgDAqfX8OjV6ZVVHk9Etfn6WSbXZ6jDzl1ojLxUmy7tqUYPMH9KQ4OgHTLsaE34jwnYQV/lQ+DOQfoqIML3HqpocXPyLt1M+6LXyKlQ8k9mvi29yXdd7iMiLAT7AL0Ir3w83XE4sl0wKda79459Eh1p9twjC073+3fbtDjICGuORR+xFdLLoqFjEYTfTiBwKY4EMsFha9p4Lv8IR55b56/e361NLlfxG62EE8WziyPcoAiQe7/t82YPcnDTNgYElnTNzhZxGX/NU892QsQEy
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(82310400008)(1800799006)(186006)(451199021)(40470700004)(46966006)(36840700001)(16526019)(36860700001)(36756003)(1076003)(107886003)(26005)(336012)(54906003)(478600001)(6666004)(426003)(2616005)(47076005)(82740400003)(356005)(7636003)(86362001)(5660300002)(316002)(6916009)(70586007)(41300700001)(70206006)(4326008)(2906002)(40480700001)(40460700003)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:01:20.4217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e90d4b-3926-48f2-3e27-08db9ca50718
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8900
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend to support 5-th CPLD version, PN and minimal version registers.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 8e07ed3dc552..dce35934cc37 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -95,6 +95,9 @@
 #define MLXPLAT_CPLD_LPC_REG_FAN_OFFSET		0x88
 #define MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET	0x89
 #define MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET	0x8a
+#define MLXPLAT_CPLD_LPC_REG_CPLD5_VER_OFFSET	0x8e
+#define MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET	0x8f
+#define MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET	0x90
 #define MLXPLAT_CPLD_LPC_REG_EROT_OFFSET	0x91
 #define MLXPLAT_CPLD_LPC_REG_EROT_EVENT_OFFSET	0x92
 #define MLXPLAT_CPLD_LPC_REG_EROT_MASK_OFFSET	0x93
@@ -129,6 +132,7 @@
 #define MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET	0xb9
 #define MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET	0xc2
 #define MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT	0xc3
+#define MLXPLAT_CPLD_LPC_REG_CPLD5_MVER_OFFSET	0xc4
 #define MLXPLAT_CPLD_LPC_REG_WD_CLEAR_OFFSET	0xc7
 #define MLXPLAT_CPLD_LPC_REG_WD_CLEAR_WP_OFFSET	0xc8
 #define MLXPLAT_CPLD_LPC_REG_WD1_TMR_OFFSET	0xc9
@@ -3431,6 +3435,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.bit = GENMASK(7, 0),
 		.mode = 0444,
 	},
+	{
+		.label = "cpld5_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD5_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
 	{
 		.label = "cpld1_pn",
 		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET,
@@ -3459,6 +3469,13 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mode = 0444,
 		.regnum = 2,
 	},
+	{
+		.label = "cpld5_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
 	{
 		.label = "cpld1_version_min",
 		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET,
@@ -3483,6 +3500,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.bit = GENMASK(7, 0),
 		.mode = 0444,
 	},
+	{
+		.label = "cpld5_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD5_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
 	{
 		.label = "asic_reset",
 		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
@@ -5031,6 +5054,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_VER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_VER_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD5_VER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD1_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET:
@@ -5039,6 +5063,8 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
@@ -5150,6 +5176,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_MVER_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD5_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM3_OFFSET:
@@ -5191,6 +5218,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_VER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_VER_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD5_VER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD1_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET:
@@ -5199,6 +5227,8 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
@@ -5302,6 +5332,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_MVER_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD5_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM3_OFFSET:
-- 
2.20.1

