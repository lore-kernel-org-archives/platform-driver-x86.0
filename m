Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A86EE49A8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:15:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbjHVIPu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbjHVIPt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:15:49 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D87510E
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2iawt+bX1293hAMXBEiv0QcbO9CY3UpNsZflv+1Ui5m4l+uKwgrl4GDteiMzqFs6NcZI2IwgbcvnXc6/raMBKaREwNofAS2tXWbxNzWNm8hpTphZo8vtufOf5YNNEjJpAJSiabqkYazvawuvt0NiIktcaGNQ2GJZvDBvHONz5L+GqMNOHDP4N3XSkcqRv1fBDTZfs4geLOH+8z3ur9owaXDPQTvCsbrcGqHucpe/ETqPjv5sGw3zzhwLVHl3ud0XHsCJZ5DJdUjDtlqJeWwvrzQC5XWwf+aVuqXm0WYGnRBypB0tTuD33TqyNIqLCKyFScx1IPph/e7H+1aSOyX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvihbpPlhgjNgxL51Yi0rZV4VivxBKEAIqcSqmgLVzM=;
 b=F3hAFhBJKRyUBIcFdPM3zYH8RFqgKl77AGNTtTy3i2XdiTnQHV64Ohmj189c+8orXs87h9dGJRY3kam+6nQe6nA6Xxte3ovXiYy5vri7WNaRXhGX3gB7y1spzcXYUKpK2ajd+NKox0pAryWk2HOr2TGfUlJJ4sP+i7CJX7xEoLcp6bm3a1zsgS/wGKFM3xOAoTWrq8H3x1agRRx5jLaq3Q4hqqpApmm3BwEiJCNHF/0XUwmruFHEr6JylgktE24fIYtaROAtNeAIg091HnW+04AMkBNQ8oUStqDxMXd6iNt5qYYHLCfvo0ogyENHCbaQyghq6iUpxxKDmPchpPyJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvihbpPlhgjNgxL51Yi0rZV4VivxBKEAIqcSqmgLVzM=;
 b=lvtmRe4ZvwoC12hi7X8q384S5PL9U8RuzEtYKT5MNXMwLZx22yskHNKgVYTZtpjgiINWWulM9i15aLl9Q+bojyFHgPATYd7oXzZmHHiAj/f2lBeG6QKxwqB6YktOPLDLK4D9aVXwiiW5hJuGPS5+cPh5V4pycqFW06GXfIgsfcOTGmDm1sAKQchzI1Uxj0Pg/DXckjreRBrnkygnwuAWK0PpbsJQYRo3nl7SGL/MVy4NEQclQrzV7NDF9A8d/ZuliPr/uaDXPUu8eSSOZ8DSnUpbQXL3orqmoQoYHXWgIWpgrHFkaV94Taec+nrBd59PNTdJdtiUZFsRjOgzhj4xNg==
Received: from SA1P222CA0160.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::6)
 by DM4PR12MB5199.namprd12.prod.outlook.com (2603:10b6:5:396::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:15:45 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:3c3:cafe::67) by SA1P222CA0160.outlook.office365.com
 (2603:10b6:806:3c3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 08:15:45 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:15:32 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:15:30 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 06/16] platform: mellanox: mlx-platform: add support for additional CPLD
Date:   Tue, 22 Aug 2023 08:13:25 +0000
Message-ID: <20230822081335.64344-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822081335.64344-1-vadimp@nvidia.com>
References: <20230822081335.64344-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 drhqmail201.nvidia.com (10.126.190.180)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DM4PR12MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 4616f590-9f7b-470e-b298-08dba2e7fc49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 231aN1NbybRStEfd9Jm729HsMCj8uBRubbHTeyOhRqV22OyBE3KfCD6EeuzZoOjI4/RAtTW3fDj/zS3Qg+jODqHHv/y/Dt16j8g1WfeZbE1SZ9zgMQSvcj0dHCrL0cfYnYD7PkhLt7ZaQT9ixrzOgK3vmPgDK4P4xxPmTL6whNXn5VuhseoCtqBrP4fEyHam72pHonnGTpzna5hazLx03B+t2d451wFZZH8mEMHBNO8guxcfhVNHPvuO9mHXY58qQR5VVC7i7lHMC/b5jowlRBTj1sNKyx67IgV00eF1g1CEj7X7SXLYMqn3tVcGBYc6qGdL6fKCoDwAF87akvDB4DAP6jE+vHX2v4SlSZmFy+YS3BUGpIQlc5xiM08yyKz4DA1A5qHfp0iORA4aPRQRvGLFeSJzQJUCVCCtGnlQm81VlV+a+sOJ8GIg4vjdxJ3cs5Umlj4wY+RJNGlmxhAKH5FNvCuHLO9CET3QQWL8fDrWx0QJNBcHFbT/imcavixhcHuxo5yW7ln34o6bevanoM22rUR0aBVQI38r17zehhWs3pFYbT2fKn1es+/HK+Y7sm2MV3IAb7KCLzqgIvIMAbyqiFNaSN636N7pd0plGeZ9YTMaTj+4HBvkzxx9S9Lb5PmZM7ZRNGHzSOQUpV+/fMw3XahM03TH/u7ZjJ8J5qYVhqpcwhV46Y3Di3ITc1FGXziyfcEU7jhExik7PrcjvS4Ho5HHoz3mmzd9+wH3vonGPdDHkorYQnroIzFoaRwd
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(70586007)(70206006)(6916009)(316002)(8676002)(8936002)(2616005)(107886003)(4326008)(1076003)(41300700001)(36756003)(40460700003)(7636003)(356005)(82740400003)(478600001)(6666004)(40480700001)(2906002)(86362001)(36860700001)(47076005)(336012)(426003)(5660300002)(26005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:15:45.5328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4616f590-9f7b-470e-b298-08dba2e7fc49
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5199
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend to support 5-th CPLD version, PN and minimal version registers.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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

