Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4BBEB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbjHNUep (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbjHNUeo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:34:44 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6A510F4
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhkOnblyNpzEq7M2QRmuto0S5AaVAhC5AOy9u8utcRJwmQR2JNwIHu1oiDbNLf+AGYD8ey6YmMKX+GPwcIO8JDZn8ZBXp10VND62YqUGCLX079CKKnYqSgf8Do82Bj6SQRPjaeVaj2X99T8JTve5JR2sV2BWmRVnkQFSa+Cl27kSanfa9Wa3fAmY/kHZGh4mFkiawQ/460L7/Mz5Zc42q4qERyLsMNjh3FDo+I0p6oDaC/Y1iI9ysmHbk99kF7FEd/51uTZpzLqAU0NvkVYK1sm9gQRWq0C8s60Sd3WEjOKyJMBpCMQMWdS+kk1/x9vEBs0nufQY1rxmSGoGDDJIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIfvYpg0TpGqP3q8ijl/ltoshmSs0R0qAGqQrwDhAvc=;
 b=ZoaJ1H7lyL9p5s1ek3/2HfO5jqvZbrfW5sBhAx74ZYXL/LeFlYQ0oEgOZrpVyYA3Vo+G5qQNvjUV273JUJ2Zf2j4eMZRTppNyV1QP6ezKh3LvV4ptqisrVGCkHG83C+fIyD4zWWzTuDbtjVB7PUYYabZWE+TscqdY3hHvxIhfDBvLfIR8NTgx6pedPjAiY5YYvRBkCG9v+f5wUuPLfJ31wG4a0BOIeXIIFE0AacmPjQQIctrDPy3v7q8NZW9Xkvev92GGWIwy78XLwoLbcngADyQXfuI15pUaKDf4+wLqTGKYvbHzW7mRjVULJIWKs8EzC+xlLZVKJkaZycd+sFrsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIfvYpg0TpGqP3q8ijl/ltoshmSs0R0qAGqQrwDhAvc=;
 b=Emk0u7F/kCYW0xjfKa58uQfKCMN+QKc3ggImw/RNWbNxOok/ENtRlucc/9U2OqxWYaUG5hxv3z/MNF6lzr15rtQM/ETpw4/W3rzDXzmpGw4mJz11KhyWULOpLbvLeX7r8xO2tnXyTCX4uQALMYO6JojWASuqY83KhXWFyEOjhpPxyo33Rm38a984XZQHYjitqmWBYkVTgTNNf+4OQPHbmLeFRvU0sOjHdAK3IJtWnLD+GaHE5p4wTHsPPD14wB7iKV2xyqjPBiJBqbE8qxjN9G6FX3t4mmTA5/AjCBN/jeRchwWNHBsRblDba9irsA/Hjf+4DMwKmltljqJVdCoaqA==
Received: from MW2PR2101CA0012.namprd21.prod.outlook.com (2603:10b6:302:1::25)
 by LV3PR12MB9267.namprd12.prod.outlook.com (2603:10b6:408:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 20:34:40 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:302:1:cafe::41) by MW2PR2101CA0012.outlook.office365.com
 (2603:10b6:302:1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.7 via Frontend
 Transport; Mon, 14 Aug 2023 20:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:34:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:34:29 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:34:28 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 01/16] platform: mellanox: Add new attributes
Date:   Mon, 14 Aug 2023 20:33:51 +0000
Message-ID: <20230814203406.12399-2-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|LV3PR12MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe94aba-3524-4853-204e-08db9d05e2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fHVfVJfjwW0gwAt4DWevxKZMkJw0BCWvt0EaHiFU3gPdBGGwtI+e+Cxq2rySPUThBZvJ9bLsDbXWez/TEBcecnHcSzSrGnlY9MMF0HJAXMQhEDgX/gQH8Wg/kSpFpX//h80uBBjLoI7YAnwC9oI4bppXx/OWEqhRscKbeyOc1ZaZwlViUNIY2TQF9IeF/F93r7dz9vsHrBqE1CQE7/bNwAz8ypK2zwnEP/0heUgAD0JNLPTfnv9EVLi5n+KzdvKUKsjwNwuCyQiR6ZNYbuUYZGUawt5ZPVjAAZyhmKpHPOPIRFw0IAL7tUSPiP1Xdd1iq1PeeXc+uoC5IzitFPebR2YB2/VLpb1/1xS/MOm72bsbmD+OTwnJj52lYNytS/iv+ajGcvIk8sO7EvOwC4td6kzEES3j7p2pLOmMlgawX1Cu5HMLsxcQKMFJWuAcNjldPzH51NaLtpwxnHWsm6/W8V6jn9Guu4Ee2dHW/Qr5a3jZv5ceuHruyNfB99e5nC5xnfs50BrRuvyDxXgo5PxBirrQ8iU0WrVD4sX6VdyMEs0CzagRo2ckLpVaym/oITAolzPJnDRFF7tufPI91FfMCWu7/wMuJB5kuChlRVoLohlZv3sMiNmsoyx9zjwA6rnh4M2j7YK38v0RyP1vgr9OIXi8C6zymdAagYjSj7gBLw+/ouCFV5epHjT+jgKoQO6l3V4x8Q6dedGeTDRs8X+mFPz7/gE2jZUf9y+8ogkcCESXnf5bLUMii3p4XspJ53t+
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(1800799006)(186006)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(6666004)(478600001)(70586007)(70206006)(107886003)(336012)(1076003)(26005)(426003)(2616005)(40480700001)(2906002)(8676002)(8936002)(54906003)(4326008)(6916009)(316002)(5660300002)(41300700001)(82740400003)(356005)(7636003)(36756003)(86362001)(36860700001)(47076005)(83380400001)(16526019)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:34:40.6562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fe94aba-3524-4853-204e-08db9d05e2bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9267
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

