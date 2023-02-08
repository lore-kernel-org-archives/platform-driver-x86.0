Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933CFC636D4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbjBHGeR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjBHGeQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:34:16 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83628442C0
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JthoUST8sknTUzhkMxzoxJbiRZP3yF/CUJw4ltxGLkBglzXXfW0CGsPz+B6PE6nsGkD9URVLMrT95Quoadq79C1IC4IeR0iP1yRf/cz6a+5HRK3qScbTqqyKEjTuZsOXj4CR2RFdpnhaO63yqRTZPSpyTTxiULGg2zL4BWhof373OJFA7Z7LY/DYB5LQr7+XTU/ihwz6rV9qX8eJR9haFtdZfCAhfRipQvhwB0kOCCjJxYluiC9cvxZool+t+vCNjkcEcwuM1o1Zk6vs9BBU1SJXHLIzStL6knZ787qFOk3JbsLoqzNlJmnJIqRUzviUOdNWquDLGPwLpohMLXrZvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sym00mgbFb8a8okYnHuXOJU3vxc+KbFzCsXFRER6iqc=;
 b=fEvq3idpas4wc2VXcZcb8osCyFppjKaha6MJ416iOYNI54SpgMI4c/1QBfvmJQLIR6qeoBCsllnHY4m978fhrrFp7Wtd9ZUpwDxOt+64OhNvcaFSUwZ4ysQt9JWS3ue7uCCV9vduqBZHxgroWea2MUwaFTXmwGmYzgjHpdP30wfIIMM8yhZRjcRXDTLPeGK+OvDoYngedZLZtyP0oZvw310hW/dE/zxOaphk4bSiZsxhDPgE0LNhmnQwSBq5Dl6kajNmHNThJ6LSIST57Scxks9oJIYnyEvOiRipjMWnaFohJ/lXSrDWppBr8163homfEbXYyUCvTRBVaA0cudh9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sym00mgbFb8a8okYnHuXOJU3vxc+KbFzCsXFRER6iqc=;
 b=ePM92HyQKWYjljyy/v4PJQLx4aj5WaEA3XjBMqOGl98UqxT7rfWivBH6IcXmijtvdQp28gvZj05HU/z/vMSefWwujU/iDDe8PzbQcxYKv+KOs0H32+vgBY2NRwj/8mFcDaSoZsO461LoRK3e1fmj8oHw6uzOfWiAXpBmV91L7v5vPJ5PfxmDCsdVpceHmJMLHmjKAAd2T2QsFy6LCxSSoZJZfwug8XP+dKPnaA8JOwSX08ADww+9mCqi6NDcMU0ZMMklpYk+0h1XcUKderPoB3HZFC0Tt01lU2sFMNf09fIecAYJv0keaDzeWZ2PCECO8wqhjYz6SSIjestoI18aTw==
Received: from MW4PR03CA0240.namprd03.prod.outlook.com (2603:10b6:303:b9::35)
 by PH7PR12MB7871.namprd12.prod.outlook.com (2603:10b6:510:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Wed, 8 Feb
 2023 06:34:12 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::48) by MW4PR03CA0240.outlook.office365.com
 (2603:10b6:303:b9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 06:34:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 06:34:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:34:02 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:34:01 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 02/13] platform: mellanox: Change "reset_pwr_converter_fail" attribute
Date:   Wed, 8 Feb 2023 08:33:19 +0200
Message-ID: <20230208063331.15560-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208063331.15560-1-vadimp@nvidia.com>
References: <20230208063331.15560-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT040:EE_|PH7PR12MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d1a34f-0e6f-4333-a9ff-08db099e7dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WuIU7jSolrnKUk3SiMCfBOzIB2WZnZjgBr1EydBcblWN0C363tr8MiW2AVh6Piv9S3/oSYljiaaz/krANvJ27GaKIrcUZ7L9rKa/vkb2ByegCBuRgIImCCCXgSiHUHlBMsDPKQNmB6QjpMcuqa5bupWsUjvK4w0s9J82oPHvqC9TyxPVuMSXnZNeG7OOnc4EEgFaX4/ajGQF2e4e35KVzxRL7aIg3ictZWkwvOjCvK4V4ogFI12w2mcfmX+s2PQq9PioDqDKqCbF8BCQ3Jj9QGEoLF/gmKMe9uJ/NXzsJkVScMArV7HWhZYEwA/wD8nmTj3BG8EAiLYxZiDV1b8PbsZH+zLyP/VykScdx1c2E1gts4zBHpk9pZ8S0v/L/szdnKDA23a4cpyRWJqWWkvoAbpMJa9yA6akjwawC44XNVWqHAbNA0njDC2eIv/q3kCJrKqoAmJnFxQ1GWjOOac4W8tu+HW7b0AwTblMGZmk69lrIZ+0pih8HvczFAy0i2GUHbI2d2hvob2omIHJI6M58sCG5N2VbCFPkJT9V4o/q+5NK6ACLI3KBNthZu00AehWcDhphQhOQPUR+5wWILTuV5q2LUwPuxpWdgG9ynI98KLIBZ8ovlKRJtv76tx9C3i/E3TDIIgfTr4XCxheRIehmME6dV/OTWbd8Fzyhpu2VjBS+66aqc8imqWcMwbIyOrMUo3DxqMmFNNLbLq2GG513A==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(36756003)(336012)(40460700003)(186003)(26005)(4326008)(70586007)(2616005)(426003)(83380400001)(36860700001)(47076005)(16526019)(8676002)(82740400003)(7636003)(5660300002)(478600001)(41300700001)(8936002)(86362001)(6916009)(2906002)(54906003)(40480700001)(70206006)(1076003)(6666004)(356005)(107886003)(316002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:34:12.2863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d1a34f-0e6f-4333-a9ff-08db099e7dd9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7871
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Change "reset_voltmon_upgrade_fail" attribute name to
"reset_pwr_converter_fail".

For systems using "mlxplat_mlxcpld_default_ng_regs_io_data", relevant
CPLD 'register.bit' indicates the failure of power converter, while on
older systems same 'register.bit' indicates failure of voltage monitor
devices upgrade failure.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 3e4adeb20a7e..c53eca49c47f 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -3186,7 +3186,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mode = 0444,
 	},
 	{
-		.label = "reset_voltmon_upgrade_fail",
+		.label = "reset_pwr_converter_fail",
 		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
 		.mask = GENMASK(7, 0) & ~BIT(0),
 		.mode = 0444,
-- 
2.20.1

