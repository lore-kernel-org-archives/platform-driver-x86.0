Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87917C001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:01:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235884AbjHNJBD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234036AbjHNJAc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:00:32 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2085.outbound.protection.outlook.com [40.107.95.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCAE3594
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SummNpMvJ+ppsuxafJSjHGjv9pRXfyT0acS2XpD6qm3Jh/pWhaeMWfhhzRUxpsSheH1/M6GVxLSNop2Gs8ZaP2zfMCUs/oG9fNeoU8fWmVMvHs/+9cPi5oONOnq89LTWODScARe5hVtHp8eXRt23Ns8K7R4UCMFmTqKzIy3SIM7CXE453lWZXnfbKVRNClHmsMHHdqUFWjrxkRwrrskOoehtY4uYBV6Wnvp/HDZ0ppm2uc6wbatfFsO5lWHUk3P4Y0ho425e57GsHmXJvLsAx0IRvvVM3UNiAks3ZUxGuMQtSEYyKwliC8bjJ+kvgbDE+dUrOqf5doHHo7VCIVAHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIfvYpg0TpGqP3q8ijl/ltoshmSs0R0qAGqQrwDhAvc=;
 b=TrlKM5U5aM6e3F9nwHfCRtw3I44SDVTZUS2PRicOlW34UTYDgzryAKwcyhoR+/WotcXWU7HH5w76VN4PrVaKbKIqREm+K/BzJ9syekdV/EAP0rZBtkDIKLE6dP2CCYuazQEoYn/Q+wcdpocN6TGg6Gj6hzVJP8DOEBgnVso5G+FmippfmxKAmZlJ2sd4HETZsJqluz4VYjCjeyHl7TnZcJL8wgEEBkCKjCFXigzY6ydclfrsjSBoKltCws1Y3W2SyyggEVunsUNVn49AI5vwOmvUr+J4cdYm5ws+xD75AzImiS6jwU4yaoOS8orkCP1PeT04Y5w80IMVQw+ovTIE6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIfvYpg0TpGqP3q8ijl/ltoshmSs0R0qAGqQrwDhAvc=;
 b=Bd10ckSVSNaJWylaPlbNmvy+7QwJ4a0fv67H2gVRAw6MZ7KszUNJYvGdNqlRAiDdomiaoC7ru/ja+pDuuyNko2Q01gBN7UcnoNHXNkL1PSZSr+OFJh8zd1Sqow7TdLcHZLRr1BP2eGk22mck4BNnOn4AcN04xAJkBA3wGwfZoTKkpaMEIYQX2+H85/t5YPRshe8BbLvG3uS+EWjNdgKs2ifmuW6TI+q4RUXheVO4cWaW0XZMSNmxwDWY/FpGmD8gRB19IaEW42yET6uTTTiB45Mn5NC0ETCv6JNUrUX3OTLPBbEfsYnWa5tfBE41E+0QrvlgE3hBDwhnK4x+djobSQ==
Received: from CY8PR19CA0015.namprd19.prod.outlook.com (2603:10b6:930:44::25)
 by MN2PR12MB4552.namprd12.prod.outlook.com (2603:10b6:208:24f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 08:59:47 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:930:44:cafe::28) by CY8PR19CA0015.outlook.office365.com
 (2603:10b6:930:44::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 08:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 08:59:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 01:59:33 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 01:59:31 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 01/16] platform: mellanox: Add new attributes
Date:   Mon, 14 Aug 2023 08:58:55 +0000
Message-ID: <20230814085910.56069-2-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|MN2PR12MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f89e18-f579-4bf5-db1e-08db9ca4cf5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kcNiMEPyeWFAjKSOfogQje+sw6gdnfrc9vj/KBdzg1WgAnoBvPrewlra9jqYGjvqbQrGECPC0Jghc7BWX1uMB98oKOLDyDomw1A2uIS5TI8Dhb9nOFDwx2/tKGcwbnhxYqH5TrCuuwKAr+qo8EDaNL19RsIfMl5RLRDA9HG0f7K5mUFSMqDISvQ2cZTAgONfLylN5HJTKYJdhj6flF7cZ5ZcYzx/DwuO5Tl0kvDdKt/WVxnkA5ay34ECCqKYYvAPFRCJzLKFxAJE6tAkLtbcsjOzrKpNlsOshNtK8n0HiocFSvLjS/kKxC4E9oX24jDaz9K15ltign0FPsPF+5xRwskb1b3v3tsHLbYouRz6oDEtn0kg+OfOqMJnak6AUsabkTuxiXU/pYfuWBhTnnQxz6nbgdKFwddv33DzoavQW0CtQoZEvKhrOEE0jUM/B7ipQdaexAHARxdhbfXCgNXPf+8+I/6sosmX6z0AiNq1mXBillC/CVuQoRjwEmmD9++NjtHfv5URTTMT+BApadizJYnh4pDGWbFRS4NxfaB1taHS/+CzotZDJNqByr7lJx0+vyXvTikyxe1UVaR8JtjmUIAQk5d2GOIkP1iEYMcuwtilDDbxN94fgBjnsDdopJdtxoIHnwNNj+T2uja/FhqJ++6krVJY6AR5zautEIlV1WWPT1wv/UfjMVYQP9rWzwcKu8dIuYbptw1y/TX4GWqjJMID6mAwMqIHAhnoWiRTKx2Hl/yURhjm3F53XH8ZSIuS
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(1800799006)(186006)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(107886003)(16526019)(26005)(1076003)(41300700001)(336012)(8936002)(70206006)(70586007)(316002)(8676002)(36860700001)(2616005)(47076005)(83380400001)(426003)(6666004)(40460700003)(478600001)(40480700001)(54906003)(36756003)(86362001)(4326008)(6916009)(82740400003)(7636003)(356005)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 08:59:46.9320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f89e18-f579-4bf5-db1e-08db9ca4cf5e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4552
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add new attribute:
"lid_open" - to indicate system intrusion detection.
"reset_long_pwr_pb" - to indicate that system has been reset due to
long press of power button.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
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

