Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AA6EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:36:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234801AbjHVLgm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235004AbjHVLgm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:36:42 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBB6CD2
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:36:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4sbBo6dAKbvxh6Pciy9h7ajY9uA1riS5XXFRwbpI9nz3vD0UCc4WwsoRPEbf50DNDw+UwxhfFO6vyDRQJiwQAyj2O5lWAGPq7Dp1yoCemcMoEKqHLAQLDS1vLmxBBpWvdDHn8Rpvkr0Hr5l6+ZWy4AnBl1lKGd2rlRACSrfF+j7N4pxciShl2tcbuV9q0tPvUgffvwogfClQ1FjZgVNPQOr/HRqarAsskg5I9+6Ryidd3ImnFaQTkVqEqVFLUFoHKTMEeF9TXx74ohmZa2YSqhNQda6qXfzEMwhg1BrXlkacj3T1oZMa9YeXHvZj8A69prYUBcxfTk0r6sjeMOk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQPMzLhnLkv8wAiENCqlSSvYqlkNiqDypwFOEoqY+Mw=;
 b=AGKYfHQJ1NvvJLa0/O8JKXIOO/BqKB0JfZ159KDTdEVJkNCqtunBK7EY7TG07hFwVEiF44AiRTqSSfsQflQqAPlNfdOdRGM1QL/aXooGM1T+WPdtXgs6aCkgUaDl4bGGsN0PgkobDlhSs9xHtsopuadTD1rfem9GaSTUmTBR1+bMx3d0/sj8mGHM3krAranrJZB9bJBitnPkGEOeHHoaB0GY3l7r2ZxsjWaRy183AGFEXpjz5hFoNijsqKJMoJthE0s5NT3wFdNmXpOAuLEQdU/UBhld5ijsV7Tf2kFE8hzeNjhtpV9HCI0ISoncclFbIApzuMKYJpZU1kuNTqGfDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQPMzLhnLkv8wAiENCqlSSvYqlkNiqDypwFOEoqY+Mw=;
 b=DVAV7SV8Rag2F9xgMax6QvdXSlMEXpmNWRvv6rLhdd1bwqAscufJu4FqZ56BCpjVsSfdIXT3mPUZrM8isWU1tZAj9jTwe8eQ5IAsXUxnldx0YgDIKnvav5XMcpc1sdghdoYYDJ1O/+/JSvCDZaPyTBv0mpSwfAUD2O38ZW2yYaDonUI/YwEWybaHLO5MXG3X61/LXP1VByHyTao2SQTvfDgIWy2XvdvbQORPU/O63fyqlClFEADcveb+7FTKgNNithre1LWuV5cPRWNB8mIh25K5OinFpNMj4YIWpldCjOrSzyWiFkYDqMDLwSMAUiF9ik1Z5zPEt7/SGYTxw/aNsg==
Received: from DM6PR03CA0003.namprd03.prod.outlook.com (2603:10b6:5:40::16) by
 SA1PR12MB7150.namprd12.prod.outlook.com (2603:10b6:806:2b4::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.20; Tue, 22 Aug 2023 11:35:26 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:5:40:cafe::7f) by DM6PR03CA0003.outlook.office365.com
 (2603:10b6:5:40::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:35:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:35:14 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:35:12 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 01/16] platform: mellanox: Add new attributes
Date:   Tue, 22 Aug 2023 11:34:36 +0000
Message-ID: <20230822113451.13785-2-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SA1PR12MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: bf819432-a3ad-4d40-6e67-08dba303e128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ugozOyzlcGK81cFy1iV9PtSBN5BApuLsLXojH28kftF82hGx69+m/pvgs/y3A595CD9XOspw/BTS2LNhximsJpUILuOM6aKnJRPqsB/VNWcD/519C8Is6V4YDycII5hLoovKs59+SjtprZKzgLLkeJXRyNYYCDdUMg+/3uTbTYiFwKdUZcQSY5c6GzigP94Quz5dLzhUUZZlK+lq9Joh1TpA8DSPgEneoqdBAl+044hNn7Cd/kH8SXQxbk991yfRLbjsNW67m8VJXzQZNmLAcnySz0SIee74wMXS7GzdOEIdPEHJrmHutNI/4+kM9QT58hQqPt5+Haxz6h5hQemSzd3BX952W9YsmqzbjwkBpXgjuQuLp8AjS969Rp4D4srhOsLFezzmhVPPZYtyUi2xO+qdsgPq1beM7nUUNFsU+a3rgbeBUGFEluhx8NmmeaxvzBVO1+1f22f+erhjmErnbu5xbhLXk8taVdM9fsGg+MoPdONTeFQdodIFi6zhEdAUWVDoJ4qJW1QME8BhqYErM6wASdSm/bqQSMUQfJj74WBfjW5pb7YJYYZpCFXwvlvHPpgBjw96CdAj5kMQhwqKHDZr04tuI0ZxGV8YRP9LaItg8lyCSQxFEKdrA6klxQ6Ap+O8qtynajZdEEPtcHxXnGKomZmJPlE+tCwaHfTJipxdm/+pTUcxABGAwvYrSZgpmv2F+jiSWsfdZEnPhC+I834508+lj4egvz65pB442N2utX3cASUUcgs9qsolF+ev
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(6916009)(316002)(70586007)(70206006)(8676002)(8936002)(2616005)(107886003)(4326008)(7636003)(36756003)(40460700003)(41300700001)(1076003)(82740400003)(356005)(478600001)(6666004)(40480700001)(83380400001)(2906002)(86362001)(47076005)(36860700001)(336012)(426003)(5660300002)(26005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:35:25.9559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf819432-a3ad-4d40-6e67-08dba303e128
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7150
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add new attribute:
"lid_open" - to indicate system intrusion detection.
"reset_long_pwr_pb" - to indicate that system has been reset due to
long press of power button.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/mlx-platform.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 7d33977d9c60..26748c285ddc 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -3792,6 +3792,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(1),
 		.mode = 0444,
 	},
+	{
+		.label = "lid_open",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
 	{
 		.label = "clk_brd1_boot_fail",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
@@ -4431,6 +4437,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_chassis_blade_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(6),
 		.mode = 0444,
 	},
+	{
+		.label = "reset_long_pwr_pb",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
 	{
 		.label = "pwr_cycle",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
-- 
2.20.1

