Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A10DC05027
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjBHGhc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:37:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjBHGha (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:37:30 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98FA37F25
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikaWWdk+SqRp/r1fUmwGqrPtW/YH0Bqseq/MrRFYcpAdCy7SEa8gMN00j5/tW2sEa57p7A8kvCGw3N4xJYsNP2xGGHZ/z0XfLoVXtu84nS0a81nVgc+XwuS600UQ61raPEbnCJUhqSUc+Im04nXI7gAd6xIZzK9ZCSQnls2HmWFvbzxlILUwpR3dnIlaRj/Z18ADRsUIomFezggLGHsYxWkYO0f/Fm+5zoTGN1jeLVjrRVRMghMIqCPvSfqg1NGvwRYKnWtgMKiYUCueHYtHbRc+GmOiofHiPC9CuXQv4tU5+wViGqT0HQnkS59Nmz+PZpluur2QvW2B7gjy4k3RIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz1Dl5PLF7qodd4Z7D8Le5eym/rO8f502zKZhaVnhjs=;
 b=oZzeLrO1icIRl/qcVE3XpkOUYjx5rN578EyrUk7XzuYuTiImVp8vKTVC5aq1ajo4OWjjVOGgP0JRKbbpZz5bJ1tpNOCv+SvvKTd/C6Ec1MiXbzspuSVfpUehd/XXETs8v4iwmX6AzMuK+fHqSB8XI+cfOEaiNffYvWZlbXq+mJ85/tZyt7N+wVl5XRLeOsgLZE87jpBcUOJmsSjiP71g68BL45vP/It3U57EIl/Y97DTpKVy2xwJXEBRg+qmXfNugU709hJSdq0pKWkYMf/DHvf0dJTXMpnwjARS4QGw0JT2kMtm7cBt6fTDI4Cv0qfsAwUOzMYAK/EhGRM/Ck55ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz1Dl5PLF7qodd4Z7D8Le5eym/rO8f502zKZhaVnhjs=;
 b=ONXg/TZjjnNDvTqN+ixB/XhfUa75Qlh/Z19np+fY3W937YE4UqjHBJzDHU70/zk5FqzcUEuwDnrxnVvk6o8uYAoOCCEV4JnKgKLpCK87RANCkmKwHPUclHiBNeRQPCHI7+HVNx8tw0M4UMdwjklTKmQxV8guuLaTfPeIKq+Pq05m+TFaPIZVrpJVKnCYiyBSTIWvwcoJUJP+mSQJ2VS13AV4Ktk9G1buHnBXMH5RZGDEbjLCDF5ssEhiQc0xb+OvAiCFRxFlbzjATDh2WyHre31/F0xENN29sBN0NXTfY+iLa3W5+xw1K0Tw+mPr/6CwBUYNvBjE4sfsEOC4d8dQIw==
Received: from DM6PR11CA0048.namprd11.prod.outlook.com (2603:10b6:5:14c::25)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 06:37:25 +0000
Received: from DS1PEPF0000E656.namprd02.prod.outlook.com
 (2603:10b6:5:14c:cafe::67) by DM6PR11CA0048.outlook.office365.com
 (2603:10b6:5:14c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 06:37:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E656.mail.protection.outlook.com (10.167.18.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.16 via Frontend Transport; Wed, 8 Feb 2023 06:37:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:37:14 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:37:12 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 11/13] platform: mellanox: mlx-platform: Add mux selection register to regmap
Date:   Wed, 8 Feb 2023 08:33:28 +0200
Message-ID: <20230208063331.15560-12-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208063331.15560-1-vadimp@nvidia.com>
References: <20230208063331.15560-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E656:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7ebd93-05bd-42e6-f86f-08db099ef0a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qFngLQYpJdnkl8K0Yz5sZRxxMxNRaFiTmvZWQJYribypivuf9ZfcofiJOm1x7D4Iqv09aVnxGNEaN9WxH7QjAQD8pDOSAEmveYGCeU3jjS34Jz6aB40v88ncZkNxcTRgiq+DJaWg3aMvcXWTVG6vQDl/D/N+hAL1To16Wru4PUdaY7wHMQGMZigkoNGf2gG61wXXEN+355SZQnjhn2S5mIbEKjj2MCDLWqmhmRyVtlsqqx2S6m9KzWeECg27pTnxROJFPokYRF+wGN9aFL5Sz6xH0546z/vqaEYnnQKp0S5snatLki58MMJ4Bvhf30OAZxKKWCQI4OqyJ2lMaUY/2592UIjFY3T1DR1dV6JNwp7+0IYfk3w9cePOPlinglx5U7mirLaVpblgPpAVlDG7JdHCSPQ7WlQtv+QW0ZelRXj+jilgUqGcXgJNtl22G7dU4phWyIfpA2ts3iYneCZL5d4zH/TU9V4FjDZbhs5ARqMrFy3oRFV16Ao+2tRi+F47DwhiD3Wf1A53EqmJ7itop44Er0EJu7cHeRXSJLnQqDCtUo4x9ZCLriP7Bc5LQOQb880TO4eVt+gtj41iLGcgA4m/woQv1QMP9Uhww54gWn0ZLdSaD2EUGsPeihLPg6sV2ONP5idDDsV2x+P5f1VQt2eUNfweOyGoYN3CMBSIyfY00fRMoP09Wo4agzHJmi5cA+4v2oYsQ186FddYURwfDw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199018)(36840700001)(40470700004)(46966006)(36756003)(5660300002)(2906002)(426003)(83380400001)(47076005)(2616005)(40480700001)(336012)(356005)(82740400003)(7636003)(8676002)(36860700001)(70206006)(70586007)(4326008)(54906003)(316002)(6916009)(8936002)(41300700001)(6666004)(107886003)(1076003)(186003)(16526019)(26005)(82310400005)(40460700003)(478600001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:37:24.8804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7ebd93-05bd-42e6-f86f-08db099ef0a9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E656.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend writeable, readable, volatile registers of the 'regmap' object
with for I2C mux selector registers.

The motivation is to pass this object extended with selector registers
to I2C mux driver working over ‘regmap’.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index d00fe9f3f1dc..482c62988a6f 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -139,6 +139,10 @@
 #define MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET	0xd2
 #define MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET	0xd3
 #define MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET	0xd9
+#define MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET	0xdb
+#define MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET	0xda
+#define MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET	0xdc
+#define MLXPLAT_CPLD_LPC_REG_I2C_CH4_OFFSET	0xdd
 #define MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET	0xde
 #define MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET	0xdf
 #define MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET	0xe0
@@ -172,23 +176,19 @@
 #define MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET	0xfc
 #define MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET	0xfd
 #define MLXPLAT_CPLD_LPC_IO_RANGE		0x100
-#define MLXPLAT_CPLD_LPC_I2C_CH1_OFF		0xdb
-#define MLXPLAT_CPLD_LPC_I2C_CH2_OFF		0xda
-#define MLXPLAT_CPLD_LPC_I2C_CH3_OFF		0xdc
-#define MLXPLAT_CPLD_LPC_I2C_CH4_OFF		0xdd
 
 #define MLXPLAT_CPLD_LPC_PIO_OFFSET		0x10000UL
 #define MLXPLAT_CPLD_LPC_REG1	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
-				  MLXPLAT_CPLD_LPC_I2C_CH1_OFF) | \
+				  MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET) | \
 				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
 #define MLXPLAT_CPLD_LPC_REG2	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
-				  MLXPLAT_CPLD_LPC_I2C_CH2_OFF) | \
+				  MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET) | \
 				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
 #define MLXPLAT_CPLD_LPC_REG3	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
-				  MLXPLAT_CPLD_LPC_I2C_CH3_OFF) | \
+				  MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET) | \
 				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
 #define MLXPLAT_CPLD_LPC_REG4	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
-				  MLXPLAT_CPLD_LPC_I2C_CH4_OFF) | \
+				  MLXPLAT_CPLD_LPC_REG_I2C_CH4_OFFSET) | \
 				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
 
 /* Masks for aggregation, psu, pwr and fan event in CPLD related registers. */
@@ -4980,6 +4980,10 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM3_OFFSET:
@@ -5107,6 +5111,10 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET:
@@ -5254,6 +5262,10 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH3_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_I2C_CH4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET:
-- 
2.20.1

