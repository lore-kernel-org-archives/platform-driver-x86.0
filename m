Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75BFC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:36:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BA4561353
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbhJBJiP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Oct 2021 05:38:15 -0400
Received: from mail-bn7nam10on2083.outbound.protection.outlook.com ([40.107.92.83]:57056
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232618AbhJBJiN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Oct 2021 05:38:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nz0Gby8aiKfo43JxuuL4SV91/5n27cwh2d6yZaJY2ZF/FYAcxQ7QdQKbY/80LyVetRHpCFs5mhVnodg+UjBeE1Qa9+F/ztVPkXl7o4QODZLJKFa6q4OBFSJmsbWIPzlSq+W7diu1df51lKiN4Z2xl5HqNLTbptMHrzX0fXHjI1J5LzP4qPyVSXqwcIa0qSueP+TonFz31aDHe1lDJbCZuCX6ttVBDJ+jc2uDC6br+hWmbG9Lp3X19YjSqQPVmc+Aa382IEKEFUmubDRF8N4gNiHS5bfskjsDkWvhmCSWTDEwlYJPq/B9OusQXy+iKTEAO9pCkl5D8k3KEIxX1JUM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuvGkLFB+igH4qXqWuI5ACTjebn8IBu4eR22ENzxgvk=;
 b=bIVImanJXoYJkrAvblVCzvVEz2IgcSVuz8w16/4IZmtsqk2mpjz97wDwamLm/O4ypRBSmXLgr2manS8eX17iS+Oh1cPCid3C1Dk/+qMVjzxKOxijBqiPA4U23iiT2qmaOzNA+A1pe/l3ySJw2hvWuH4NAAzcjU3iRxDHs4oeAnpj6cBFE0P7UDjX1dNH8uZIiDZGnpUyBBH2WlIJ3zie67zZwthQOagNkot+LYgG0vCDOWUHqQCsKe6RQk/037+ecYxBqVR/PBZr9HnJoPU5NpUOgGw42WUAIsBTWM3hrPYghOHZMFBWk61wWyFist1x+d7s/448w+clzeH/JbrRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuvGkLFB+igH4qXqWuI5ACTjebn8IBu4eR22ENzxgvk=;
 b=ab8gMzy/U4fqHBJG37jQcKHKkr2R5IC4FWmouHZJHJJHc7TGR4RgNKnSaBmxU7W5r92I1zZtoG9nuiYKNyM88oqBtqypLvEA3RZqDB6t1L/hqnIbevy6VC/OTHFOgW9XzOgqqpOawyrAOMXU/4fFrfEcgSpQOvYAoJL3JiLdpjPdpWu3ZCdr3FRS2wwLVDK6sRaYgForHWDXXf6IQw6LjX4A890mI962cF/hxRHwBtGVsKrzCQI87bY65vECWuSMWWH2KtWCKigXTm7hTQEOOVkABzjVlxr82uXdViZ8sgygaxJsyoWN7moAF3LA9ogTM6L90qq74scqDcerjD3mbw==
Received: from CO1PR15CA0079.namprd15.prod.outlook.com (2603:10b6:101:20::23)
 by BL0PR12MB2354.namprd12.prod.outlook.com (2603:10b6:207:44::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Sat, 2 Oct
 2021 09:36:27 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::1f) by CO1PR15CA0079.outlook.office365.com
 (2603:10b6:101:20::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Sat, 2 Oct 2021 09:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Sat, 2 Oct 2021 09:36:26 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 2 Oct 2021 09:36:24 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <michaelsh@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 10/10] platform/x86: mlx-platform: Add support for multiply cooling devices
Date:   Sat, 2 Oct 2021 12:36:09 +0300
Message-ID: <20211002093609.3771576-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73af992b-ea83-4877-7ddd-08d985881ad2
X-MS-TrafficTypeDiagnostic: BL0PR12MB2354:
X-Microsoft-Antispam-PRVS: <BL0PR12MB235498DAEA21BF9398826C78AFAC9@BL0PR12MB2354.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cfbp459ZHywftKPr9VFFIMrA2G6+RJdJ31R2oLjwWNjZD2CQkO+hWtDxZFdTIFjJHMIo+UsOcKaUOdqz47SU2O/4BSFVBbkbsdbkPvhKDpKtHcOcjEOzRaTJsapWAgaK/A/+4IB2FedAOFdbHAaETWlMfqdAbHex8H+WzYs4n2OX8SUXXjNc4aFeJHVC0hXEtITmup6gXnkMXT+cyPnxc5JKaZuUVtykMmbMAeNA+cPwqHV9T6hwMMA/BzM2F1CPfC3cyKlXoEmw7JyG/TI4DlyIek02RrFAcl3PK+AEXZry+IhmHkMlHXw+b8c94+Tw2GLAAtFof5B4pFUErSSpU5U8u+XAYrBl/LFhtqhIu7plp7jmBqyzZ6X/ZnKTXRQbetcx2BvqUaPljM1EwDXqdq0PPEU7ab3QP7TTEyToRFiF3KWq976Y4H0Hl8MF2QzULFAM50OdkJaajum+b7+Rnsc8P0jHNCFcD/jbPuZhNU9A7l4OgPa1yIUc/sBCBnpHJPRV1CiXvrItBB3QKMSBgNSYsbo/O89d2vszP6nqMP8VYtCMaXH7KaNqeTHM7gVQ89DdESmmpy1V602+ogssEs0b94vvV/9QfYPfjKQD+nOCR+8/miC/qSFKoMu+je/Ym5f+yAureyFd3MFMhqug4rtgpoOwfFVjXmHAGuN5Pld249DJGeS8GNJuqhJlgYoJPlZIOiguz696y0I9M7juRg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(54906003)(26005)(82310400003)(107886003)(2906002)(356005)(83380400001)(36756003)(16526019)(186003)(8676002)(1076003)(7636003)(8936002)(70586007)(5660300002)(70206006)(47076005)(6666004)(426003)(86362001)(36860700001)(316002)(336012)(4326008)(2616005)(6916009)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 09:36:26.0505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73af992b-ea83-4877-7ddd-08d985881ad2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2354
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add new registers to support systems with multiply cooling devices.
Modular systems support up-to four cooling devices. This capability
is detected according to the registers initial setting.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 2ab499686564..7606165980c3 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -120,12 +120,15 @@
 #define MLXPLAT_CPLD_LPC_REG_TACHO4_OFFSET	0xe7
 #define MLXPLAT_CPLD_LPC_REG_TACHO5_OFFSET	0xe8
 #define MLXPLAT_CPLD_LPC_REG_TACHO6_OFFSET	0xe9
+#define MLXPLAT_CPLD_LPC_REG_PWM2_OFFSET	0xea
 #define MLXPLAT_CPLD_LPC_REG_TACHO7_OFFSET	0xeb
 #define MLXPLAT_CPLD_LPC_REG_TACHO8_OFFSET	0xec
 #define MLXPLAT_CPLD_LPC_REG_TACHO9_OFFSET	0xed
 #define MLXPLAT_CPLD_LPC_REG_TACHO10_OFFSET	0xee
 #define MLXPLAT_CPLD_LPC_REG_TACHO11_OFFSET	0xef
 #define MLXPLAT_CPLD_LPC_REG_TACHO12_OFFSET	0xf0
+#define MLXPLAT_CPLD_LPC_REG_PWM3_OFFSET	0xf3
+#define MLXPLAT_CPLD_LPC_REG_PWM4_OFFSET	0xf4
 #define MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET	0xf5
 #define MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET	0xf6
 #define MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET	0xf7
@@ -3414,6 +3417,18 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.label = "pwm1",
 		.reg = MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET,
 	},
+	{
+		.label = "pwm2",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWM2_OFFSET,
+	},
+	{
+		.label = "pwm3",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWM3_OFFSET,
+	},
+	{
+		.label = "pwm4",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWM4_OFFSET,
+	},
 	{
 		.label = "tacho1",
 		.reg = MLXPLAT_CPLD_LPC_REG_TACHO1_OFFSET,
@@ -3803,6 +3818,9 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWM2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWM3_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWM4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET:
 		return true;
 	}
@@ -3902,6 +3920,9 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWM2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWM3_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWM4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO3_OFFSET:
@@ -4014,6 +4035,9 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWM2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWM3_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWM4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO3_OFFSET:
@@ -4069,6 +4093,9 @@ static const struct reg_default mlxplat_mlxcpld_regmap_ng400[] = {
 static const struct reg_default mlxplat_mlxcpld_regmap_eth_modular[] = {
 	{ MLXPLAT_CPLD_LPC_REG_GP2_OFFSET, 0x61 },
 	{ MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_PWM2_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_PWM3_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_PWM4_OFFSET, 0x00 },
 	{ MLXPLAT_CPLD_LPC_REG_WD1_ACT_OFFSET, 0x00 },
 	{ MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET, 0x00 },
 	{ MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET, 0x00 },
-- 
2.20.1

