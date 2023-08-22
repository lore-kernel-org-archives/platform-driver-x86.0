Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA512EE49AC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235277AbjHVLi7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235304AbjHVLiY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:38:24 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC201CEF
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7iUjxNme3XXAaldyl56DaOw8lTcLSTaaEb24nEGjHlpb+iJ834MvL69zJ/O4PFwjc3L7hILxMYoenvjHHrjzKTE9qT6yi9mQxffuE4X0m20z0pI6eXZ7ZiErGcfJBjIvUSCqylyWo8/4SSPYSSD4RMcwu7etPfBIsRegv//dVEpN9ZY0CW2vYNtRoCRligpxxM9YwUhAri3x064xhC2gGS9hrTkAWAOOIE2ECgGXI7GvOKyg2eHuk/WRPRB08yPBpuBfZZHblPUjNzkN4gVLX9VM9N3O+0Md9cD+m6iLSGU9aBiRhTRzxwfKp+14aYL5W2YK8V07cII9W+6ICNA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxO8cHGy4t5Zt+k+zkNmmlOWUYL0yAw5z/kJYd1cKgE=;
 b=Vuki1UoyupBU1SVH44QE/bxLtQ2dgfgYLE9kKDrW9sCbrhdoWG5/cF/mF3KwcsRSX4osBd9dRLPbkbXkbQtHCTh+Cl2fsQsJd5UYriZursN+dMy+TOZK6Aoe7jvdeVGWKmPMQIgSErL9udGiEa5eJ94Xq2fPtf55XvxUreoPIoV7Qsn4mRimEFyp8VMZM64esYhvR+NMSstDMufEfctPFCiawoIx/RSCg8gK2r9hClT+3FxKGrW9SVQymdHSniOTVAdoizfGM2TgD3IkGQ2tEy4lcaWpM8BxQAUFtVuTjQ5jC+PDLoSLpx+8bIvZbKfL6sI3cGgl7JLDtpB/a6VPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxO8cHGy4t5Zt+k+zkNmmlOWUYL0yAw5z/kJYd1cKgE=;
 b=qyr7zsiH6HrHwiT4G+F5vER+xus1K8HJpUF3EGSf3eVm4Bk7hQYCprvNPTMhMXwRF8+J6Hv7OsiMK1R0FgnyYBcUCohM56jiOacrjC0RzZucFCvPxluzlLHYzdkA/g4lwX0ovxRzwAGyt1C64Mk3lHRv7W+WNvN/MkHJWukFp2Etts9A7Km61jKnsq7VOLepPcpYGeEi34Pl3AnKbiQYWKZTT9cLdnE8fj8hOBabWkRasHAz0qKg1g16G7ourtv1jnpt8j+rnSHvj+S2RSo5C614u/Dzp8AUGYbwLVDO3jNBZN5BOwL6KYpXSKcDhS97FXNnA2WRR3IHbZDy4A11gQ==
Received: from SN7PR04CA0084.namprd04.prod.outlook.com (2603:10b6:806:121::29)
 by SJ0PR12MB6735.namprd12.prod.outlook.com (2603:10b6:a03:479::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 11:36:58 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::3a) by SN7PR04CA0084.outlook.office365.com
 (2603:10b6:806:121::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:36:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 11:36:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:36:48 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:36:47 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 06/16] platform: mellanox: mlx-platform: add support for additional CPLD
Date:   Tue, 22 Aug 2023 11:34:41 +0000
Message-ID: <20230822113451.13785-7-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SJ0PR12MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 47442d7b-0e67-483a-28e0-08dba3041877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JN6oQXB3Wjw9+w0zdD1sC9xrAMh4X3VN97eiJa9eppqO/PMMM8NJDY2fOKAhu2rThctgbKZG8r3IOwn2lGXNzGrPbSy4/oArzpKIe8KjboWjz+gCMCIcHY6r24T+szPSd8s8Bh16PZsVq3zkHfD0qwx4l0XTIwyC7IqwZSJtq5uRY+ui03Y+ui/WZgwAhcdnvXjGzaa6udM2uu2lQhzhjFM9kOQtA13W95d8E/L8spZOKMXBPut2HXWmCZ8yuVv9om2IEprzCi20A98XUUpq5nCm8ZOsY5r9U/TFOInjqVJ9nij6HJcufKggQqf6ofdkWnjbsf5blMnB06PvmCdnM0WgX3htw7E4hHYymfOW1z+zMQZAvG18uq0yIISIIv24RMr3/XiT0QTZVRzsElJznLf0VSNMuglBRMEXQYjqsKutPVK3U4IczkEp2E+EvzE7R33J2ni4SqChyCEE+HVXHTjQ+YzSDQNc43tvdFJqOgs+yVOBk8il03Vni9bh15oC07nBR4jX7eAIHJndnee7A2xNLvDeo1DCahLNMfsuAP3tlVYddYigBk9/i3A63SQdheaoD/T0RIFhyUFeKDsWX/aId8udWi2kO6iYMxl1Q7jgvD4SQTptyoryFM3Xs718f/87XrfpM0f8ua7Adj9X0EoCTTWabu7EMVpXSxe8uoWYUURpGHD/C0V5itFuhpikHFSdWbLlDkpppLjEObRz1ziYL2a9kRcX4hQBpSLcuDtinD4E9hD5DLro0/JBplgq
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(6916009)(316002)(70586007)(70206006)(8676002)(8936002)(2616005)(107886003)(4326008)(7636003)(36756003)(40460700003)(41300700001)(1076003)(82740400003)(356005)(478600001)(6666004)(40480700001)(2906002)(86362001)(47076005)(36860700001)(336012)(426003)(5660300002)(26005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:36:58.7310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47442d7b-0e67-483a-28e0-08dba3041877
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6735
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend to support 5-th CPLD version, PN and minimal version registers.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

