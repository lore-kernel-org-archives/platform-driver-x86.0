Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326EFC41513
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbjHNUgw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232427AbjHNUg1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:36:27 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FF410F4
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqeWDTLlGR3NEkMN1N+1QkIKhbB+PzQvKFrQF+js03ba9kS8jOn4WLHvD4u4IfwYH7qQbMg/md9iK2z028MWEvBVFnvKSUBhYE74UGiFmQHD9JbSBVt3pgmMnnsfPS3Tq5aby612fwcfQCLO2BuYNlWIQ3bpAb9gCCTYeudWo2IdgxRvGGpurX3vKZFk9Ej0v0LKX4ABXVmIEghA+ED6XIVyRu892aQHLYFZ4J2zyWQQZgkhTt9MQobfBZa8uGrCgVU2BPzou0Zr/s8Gq416bIm1LSDGT6Ej5V2nFgVOg+9CJPkbkkEsJTFd5h/pUzpf2h9Jitu0LY1E+vo2sJqIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sj/48k7xmk1m/uzjsMFaYjUeKRCSxSITBMelJkeNCBg=;
 b=SJdZcNbBUf7QEjGEo+RZl3xPxSIRjMPVPnpda89CnhLmEmGWFSktU6uxVWxsdF3W2YDzbgYWtLkZsKbEMlDlpQpOV5pL4mE6kw2Xt6VcEOS1UKu557VAmjhGoZIhpM1BRF9CKqksFZveJREOxHDI2QAW/HoRN+Rfd0dcFc+CYwFu/uPVsSTR8Igr9cw5vSX6XBsxSaiBBVsCp0CgKU1LeYuaULECU5QNSWYqI4w+mJkIp76wrt8TJE6g7LmxzLCfL4H2ZaJQlcPh1ETTLb4Hlb/C5M21uCT8iewpkmo0GPrJWMc7WftObiC4CpcPUFWWE/TC2/91e93j7P005Ux9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sj/48k7xmk1m/uzjsMFaYjUeKRCSxSITBMelJkeNCBg=;
 b=Y1geJ/exXMEZ+0Xqp4bQ3re2LjN618JjkEBIjglryGRz9kGxVoFx4n5J3Qu0kwr6PH1fN7hxfm3A8pxpP/AFQ16tPp2KaUoSddh2vyJXHArvvAMRvh1J2ykgVkYjgb3/9sS2TJdOq0daoVDGoNRDxGVc5tmik311su+e5WAbIMwoFERo8ZZeDB/flX4ibhpNw/+/+tLaM1wFSKOcuzavdyKg93zZMnIz6fUDJeX5c0f0RZiNLoFMt2sF6sPJDFxeEv7R9uRx/U1HoFMKnxodzHD9qYQQDvK2ms2qXdcTCed9ipWBCYErqv3GnIMhq+5F/oPgsQ/WzHo+B9i9FstuwA==
Received: from BYAPR08CA0033.namprd08.prod.outlook.com (2603:10b6:a03:100::46)
 by DS7PR12MB6239.namprd12.prod.outlook.com (2603:10b6:8:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 20:36:23 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::12) by BYAPR08CA0033.outlook.office365.com
 (2603:10b6:a03:100::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:36:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:36:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:36:06 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:36:04 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 06/16] platform: mellanox: mlx-platform: add support for additional CPLD
Date:   Mon, 14 Aug 2023 20:33:56 +0000
Message-ID: <20230814203406.12399-7-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|DS7PR12MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 57db7995-bae8-42d6-8c6e-08db9d061fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: udZwSHnhURcsVQ2X3kC8BSY+ZJnqZDIv15YxRzOKbp/lPmXchtxmoYt5wOySwUtGrW7bWPUmVeZn71cX80Bns8Uc7oJSHqCKMg9tziraXNSNQkNqFpjUK7ipOJ9+ePwYgVaVstdVfKNB6N9bkAtigx4Wmzsg64ZSJ1WpnbNEMMChoFriIPLn9D6I4cvGueCa0VAiSEWRg95tNlV/+2vhTbH82HVPeW8noNJydNOSnIaVllrQycVzgsXn7A2Ceuvp9Jfdsq0aouhVFcfzXPyaBpOb7k+dVl/Xg6tLLE3UvZycPMMi+YfBsHXcv2WVsteZ1CHfBSYbE7wKHSxJKxz0GUYm/ZQkRSU2ikpBFWQNibnKEtrbgXPRvBs52mQd8EGxvChDvNaKGpTNnOSh5tlD/cf4zHe9h1rT4JvDxq0dMZIneu8XbpVnMXuNNyag1qTdcpPXNed1SDhBtHFc97mGRE09sWyB7sUZsqOSi3la17y5HXiB//CoGokzMmp0MT3li5tXS/9sv8JNaYnuZXYBn8fUOpA/U/Qv7XgADlWPYxMe20fyNoexwcid3u6ARNYkmwGsafuPhuT93Edg+6galecb4HUFGwQ3QL85GOc7sNOqt1w5TvFks9wpSq11/EIvtG1ACyBWXz2/V7TUd1hEtok3d4igIVHhIOOsDyebk/+Rkh/Q0ocfeA842al9b0R1NJrTp0hIAforR/qnd68YlBoQ1mB58GAbKLHn/VsDEGm4Df2mqtbua+SwJ4+jkRdq
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(1800799006)(186006)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(107886003)(16526019)(26005)(1076003)(41300700001)(8936002)(336012)(70206006)(70586007)(316002)(8676002)(36860700001)(2616005)(426003)(47076005)(6666004)(40460700003)(478600001)(40480700001)(54906003)(36756003)(86362001)(6916009)(4326008)(82740400003)(356005)(7636003)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:36:23.2324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57db7995-bae8-42d6-8c6e-08db9d061fea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6239
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

