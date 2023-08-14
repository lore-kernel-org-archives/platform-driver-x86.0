Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829C5C41513
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbjHNUfR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbjHNUe5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:34:57 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F804E5E
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvhvCSNggv7kdc4NfB+VhTYuW8HH0thFdaJWo2bDX09B8T3vGBxfqvXKyQq2V9D3Fddghl4lhIMzBH8Fiapl09u+XClAEuAORr3T0ouv9cvGG2KSN7O42wCdIfKtMZmb1WhRQtq47VvRmP0zC0sDcXBi5X8W4TNufz2yLE6WkSBdYDeT9Gjxy8tR3ZYziQLNGz6dJt4fl78j0LC2qK7w2IiOIbXfxbyhOd9b2Cbh242GFBXVaRjZydH87XWKkvVX7nSOk5/G1aZIm1JtrOYnweWfgXQvFo5tBc7Ki6ukRlPGG/+zUEcFJuF8mgNjEH/Wj3KMSNtqeJeSULd80h6AIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbH3OpWQ/Ba2/foULmBl6D9UOhRd/lHXNh2M5Uj+Awo=;
 b=WnSiEA+TM4l1T/p51CCoIHPCm+8OmH2QZQqJWVb/uxTkd04U7rVtNWVS4Fx23t3AfoPYuxDCp2noEQImz3zWXv7+itrKVi2MMAPd6u1tgJMamT3Ahmd4UvlidIjgRIc9ZC6X6bm9XHuhvl6Q7aAIK8sXQZTlQWptCdbletvPPCle6Z+kGG5kj/24BYgxCBHURDYZwLCUfMxRUgLyr0ILH5zhXzct8DPq7PH/nF6DkQc/tgy0ABbQDLpotLBbeGtlcQzptFUmm2ViZjyyG1ptiQNQxDVsee7k599sNU0pmOyxUfCQS7bVYUWVXaNCcZKKvuLf/qcrMtNp10D/U15eSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbH3OpWQ/Ba2/foULmBl6D9UOhRd/lHXNh2M5Uj+Awo=;
 b=LDOo3Jwtyij1aXPEQcsEfYxsauOCjOgD8O1wMzi/Pw3UR7S5lKQQAfNu1I/Cg6RYlBDzggdXTEF3QJJ4mvyOvvjGF9ij6Lsy1flr6r86SJxFChv7NacqXOgG+cr7a4TCXKUOTAavvNVRd9VrxsSpYz9sYK+DBfkjT869TE56uHHLzCrhHV8od/kIVXuAKnWuoNyz+NnJQ3f/58TxZV4mqg+KcRPkq8gmqWcmEbRgWTiz7f7pjRrdM1K1KtY+JlKkPx94sMshaWs0dffPgem2k0Dy14Ovqzb13Sujcx61O5QvZKsLrh3agGLWV3Uw8dVPVbXzCPhdd4HDQu6jHYiMOw==
Received: from CH0PR03CA0402.namprd03.prod.outlook.com (2603:10b6:610:11b::23)
 by BN9PR12MB5161.namprd12.prod.outlook.com (2603:10b6:408:11a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 20:34:55 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:610:11b:cafe::d0) by CH0PR03CA0402.outlook.office365.com
 (2603:10b6:610:11b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:34:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:34:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:34:39 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:34:37 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 03/16] platform: mellanox: Modify reset causes description
Date:   Mon, 14 Aug 2023 20:33:53 +0000
Message-ID: <20230814203406.12399-4-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|BN9PR12MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e65e4f-19b5-45f2-4af4-08db9d05eb0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LOq84BKHRw46V3sbZaqtJwxj80JlNqfqx3lugY06ZzhOMwLr4WFL8+YpM4puvi9LU4hY+7Z6DD4Yzrbbt1A3tzF5NKwoSK8YN5+MjoP84YDYPgZ7RQSWBmyWrhsAcPuHW8RayyeT5OAyQAX8VelMwX98F5QyzHccceQB06IeAXqPT1WXENiXCGKkS7X+XfafuLY9CPJsOas0Ejfu4dWtfn/16WqZ3TdFu9mc2uy0vPKxNBOaXaETQsWgpCsBQpjWjUW0xjIHzywqXQoQRFK2bo4eBAlXfycFjf/T4skJSApLzGyeKLSQqESwgNq4Cxip11WB1m4UzpJqst4xK9IiNusbHV++6GDLjHyc8iffCK/AudzKdPF1EeIEBAaPqYS5vfrcR1JnMbcysAZxX/q4b0iCB871DdBxsffJQ16J/BdKKoOqyXvctgUvXvWgES68hy/fpgnidbZBcgGCUfGbRoRTP8ssaT5mrc00BJHok0dLk1Ak1dCpSLngJnSqKfClCfe79X0DUMRalDFoxT0HgPBLa3GL9cogkbwbggxNi1YkFESJSKk3QrHst95o4e3zz8MPCNrY4s+RlSUGxalBzLnNrUbgriv/WOSyZb/RCeQU6YsijwfpK1SJuJLBkEiPZo9N0KWwVcTL1Uy524EsDALE79BbdPaDK+APR7f+75kPtWoqmsmKL2J3/KKNc3gzmtpNHdI8C+ZQA5/xb29elrddWhg/Qc0N2fh7tquXj0f8nxJSGZ/+BSbLvPMjqmBQ
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(82310400008)(451199021)(1800799006)(186006)(46966006)(40470700004)(36840700001)(40480700001)(54906003)(6666004)(478600001)(40460700003)(7636003)(356005)(82740400003)(2906002)(5660300002)(36756003)(86362001)(4326008)(6916009)(70586007)(70206006)(41300700001)(336012)(8936002)(8676002)(316002)(16526019)(107886003)(1076003)(26005)(36860700001)(83380400001)(47076005)(2616005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:34:54.5630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e65e4f-19b5-45f2-4af4-08db9d05eb0e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5161
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For system of classes VMOD0005, VMOD0010:
- remove "reset_from_comex", since this cause doesn't define specific
  reason.
- add more specific reason "reset_sw_reset", which is set along with
  removed "reset_from_comex".

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
v0->v2:
- Comments pointed out by Ilpo:
  - Fix misspelling in commit text.
---
 drivers/platform/x86/mlx-platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 647a10252c2f..5b0579752afb 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -3556,12 +3556,6 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(2),
 		.mode = 0444,
 	},
-	{
-		.label = "reset_from_comex",
-		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(4),
-		.mode = 0444,
-	},
 	{
 		.label = "reset_from_asic",
 		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
@@ -3580,6 +3574,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(7),
 		.mode = 0444,
 	},
+	{
+		.label = "reset_sw_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
 	{
 		.label = "reset_comex_pwr_fail",
 		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
-- 
2.20.1

