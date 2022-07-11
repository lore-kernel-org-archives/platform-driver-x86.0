Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82542C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 08:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbiGKIsY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 04:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbiGKIsP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 04:48:15 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BCB13CC6
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 01:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDIO86W5+6dGJVVzX1Bc55O/i+mYDZA9OwEqNHfB/QDqgj1OOtvhSZI8+9usdzS7v/AMY0HLZKIh+MURFywiJJc/jsVR9mziRmTnznqCjdpLEet1m+0gYUVQLbtnJRyKTVMnL8RzCspuwwrupDHAXVfWOZB803Oc7GLNII0VXHB7jZRxKYl3hG3neeJLRGTqFW7zqaFpyESi3sEpdabYSE48aeW/ScIkdHd+neLeuKn2YWPRlH4j9eAJInjz30Q7BjPaD14PpfQVO8caYHkkedQLp4lTNfLbVdxNKRydn/mZHYkk9kOwGXh5JCW5l86cuQ4SKDkLFNE+WNjycYL/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6KT8d42fkLty/UPLIJCbpkRPdpejsbfmwfkFC6SKF4=;
 b=Is271xBrabU8OXrAE63yaDkybF6mHx8+lrJtltkrPGuviI+SqiQwt//pC8Uu5wQXT5nRCagTrDd0iHJ8BBRT+bOuCUDRstlBR6Vo3EH2y8NSb0TOQbyEEaXpJDarGlVnC43epOQuKlQPZ3FtuBfwx2NqNs/qylSDyVODKQ4Nhh3NfS/1cTI83lwK1Wca3Cn7ELk2ipaeWypTWnjAFgb1Nznn+vNuiMTms+CX4M1KhEDiRi+2mHESAhAjk1Js9SW9rGhWzCLhJKgC5AERhCQMjtgh3PrAmLYIQvkEPYAFO3L5AieypMHB+ww/JxJ7ANQ/oRNMnXOGPs0FC/YdyXwZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6KT8d42fkLty/UPLIJCbpkRPdpejsbfmwfkFC6SKF4=;
 b=ce2SMvDEjzUHvrV6TVQ2TyF7zy5Bjnf/ulFrShEPh6TCdLWY+lQM1AN93dQ4j4Lf25xdFev566WgC1cicuAB9xCb5Vo0vw2bSRQWDLf40hfyho2HFueuXsRWgRhJqhsNHnnM4Aqccs91siVHJakG+w0rmoqcj3Z8M8o0rtJEOEu6G8MjpYMN/VeHJwxgKNtVWAI1ljqCEQG9JraQwuhJLeGGlpB3IVUHRLkThofWzKsmaH9s41O+D5ZNJZaksvgx8CwSy4+a5xVS3vs+zrXf2MsEYGdrdQPjDB7BD1ZjF6+jm+wPOJ5LDAJpPZCuaGH00CMnJLXq1DV6cwZGzdjRDQ==
Received: from MW4PR02CA0014.namprd02.prod.outlook.com (2603:10b6:303:16d::29)
 by MW2PR12MB2427.namprd12.prod.outlook.com (2603:10b6:907:a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Mon, 11 Jul
 2022 08:47:56 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::75) by MW4PR02CA0014.outlook.office365.com
 (2603:10b6:303:16d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25 via Frontend
 Transport; Mon, 11 Jul 2022 08:47:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 08:47:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 11 Jul
 2022 08:47:55 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 11 Jul 2022 01:47:54 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 6/9] platform/x86: mlx-platform: Add COME board revision register
Date:   Mon, 11 Jul 2022 11:45:56 +0300
Message-ID: <20220711084559.62447-7-vadimp@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: c858f7af-19c6-4664-9598-08da631a0ce0
X-MS-TrafficTypeDiagnostic: MW2PR12MB2427:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2TPDShv3LhPQvEmK7UxOxB5rer/NVjAVzjF6sCx7MwzmSz8PfeFF9pSzAkg9Hy3XMwhtv+9K4GwmOcDZERPyfU7hwLdLGh66kH+RqwutbeHTIP8fN/7K9V/ar6p6DQedDbffALpOKhBq43aqEqOIg5g23TP2tZqLEU/FC7rkeubTwGw1IS95Cr13oX4hH0lg24Ji3XoM3mr7uNqdH+EMVjbXhlPbjpCu7Df6tVzcSZK5YlozIOWQ0tTa8cvWltbumHRFRKklX0CLWUmmCrDUPvtDI5SjX8cmGgsupaBfbo/Y7ppqKV2S+XRyneEdpUSR/f/wvtvPaXEMCTRUYX/dqV19pIpx63SKGejM9tR9gkBVZSxlnbiTQkahQOxXhPf8ArJfpsL+cf3SdAbzYAYLyuf2c/hgRgl8J6YVTIw9xWA8nmrLjgpCdKteN01aWMAOK/sdlFaMJwf8BFhMaQgMnz7leoUfgtZGDzWrxDKSR+RpdJ7EMtON+7aTlqDOSC+GhB0KIrV6O4GQsMx9ZYz2DIx6EzBZQQhJk23X2KP/Z3PMdxERqDpGMVoVPO/k6vo9BE7aDu0RY0TDHEHi6AA4WF6UPKjCb4d4reEJidBGt4w4Jdcyg6UFWO7hJSmgnlzgRWqHEjxpjJlEih1gzG2Mn14qtA1fisQQcz9QRJBgOz2T2H+CXKASgEgsav/CR1jAn5ed11NwIRzQuHrVBWrWsJqDfm+PpLlAoHXqM+3u8/luF47gHBekP1afiW/vBEHxn131Q1Dv3yNvgMpEwnBYuE6/epQWyKjF5Lkc8uBY33xXuU9hd5+9h7CsOTuYfJNm/rlKDjAHrcrYsHjZDtWCvTCoH4xYtVdXcKp6yUJZ1J4=
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(40470700004)(36840700001)(46966006)(8936002)(36860700001)(54906003)(316002)(40480700001)(478600001)(36756003)(5660300002)(426003)(2906002)(26005)(82740400003)(81166007)(47076005)(336012)(86362001)(356005)(186003)(6916009)(40460700003)(16526019)(82310400005)(41300700001)(70586007)(2616005)(1076003)(70206006)(107886003)(8676002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:47:56.1597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c858f7af-19c6-4664-9598-08da631a0ce0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2427
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend COME CPLD with board configuration register for getting board
revision. The value of this register is pushed by hardware through GPIO
pins.
The purpose of it is to expose some minor BOM changes.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 31609c1df027..5e072a0666f4 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -150,6 +150,7 @@
 #define MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET	0xfa
 #define MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET	0xfb
 #define MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET	0xfc
+#define MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET	0xfd
 #define MLXPLAT_CPLD_LPC_IO_RANGE		0x100
 #define MLXPLAT_CPLD_LPC_I2C_CH1_OFF		0xdb
 #define MLXPLAT_CPLD_LPC_I2C_CH2_OFF		0xda
@@ -3153,6 +3154,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.bit = GENMASK(7, 0),
 		.mode = 0444,
 	},
+	{
+		.label = "config3",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
 	{
 		.label = "ufm_version",
 		.reg = MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET,
@@ -3631,6 +3638,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_regs_io_data[] = {
 		.bit = GENMASK(7, 0),
 		.mode = 0444,
 	},
+	{
+		.label = "config3",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
 	{
 		.label = "ufm_version",
 		.reg = MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET,
@@ -3828,6 +3841,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_nvlink_blade_regs_io_data[] = {
 		.bit = GENMASK(7, 0),
 		.mode = 0444,
 	},
+	{
+		.label = "config3",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
 	{
 		.label = "ufm_version",
 		.reg = MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET,
@@ -4404,6 +4423,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET:
 		return true;
 	}
@@ -4531,6 +4551,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET:
 		return true;
 	}
-- 
2.20.1

