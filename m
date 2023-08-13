Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397FEC04A6A
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Aug 2023 08:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjHMIiN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Aug 2023 04:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjHMIiM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2023 04:38:12 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0649E170C
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2023 01:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+x4t+HqbgwOzZiAHTyx6W4NuEVQPw+s846hcTrxY6K7tB8nLGPmCiqezfs1Kw+g/2YBmClJy4ppK5mTBfbE1z3HoF18plukhzNpNxlvS9uy6rvLXf5UmujC3+OEb4wBRDBGvUlxbrWvcml61QdidwN+djHOlGNN9wcz/QQkVZbe9X1uW1l+YMc2GUVdPgzzKZxC9M19AMwN6PTdf8xYcVJjWfHkx7KWzPnbb/F7X55NnEB84u6iYz67BYMK2tvbtXf7BR9CHhRfHOG3mXRl7chO5au9auSP29uxbCAWHXkBHRW8Vrf7+SfHOPEfNBbtqamUmOkme0587cioGb3/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piZ4OP/v0EPPIixEq+ePiQ8fpJO0+I+rH1XlyRZoXE4=;
 b=SSTRdAcEr67B21uMEYbQR8nrG5btZJaXt6vR0PlSHUd57bD1t7czt7k4DIRLRjxg4nFMVUiAIOqSyEQZUFa/gwAVHs+5YMv8T2ZnnOnGWG7rJhTQlMiXF4W/0uludJUpxHs12Hu1/0OCwQ+YAPtibRwhTf2M8SL7IlxuACQqET5XNwuJi0DN/1OSqFA6I45maqc09PHv5qHUyYxiICl0ZROCFGRlGAllAXZfOgoQSd8EDShPPUViIbGLPoVSa2jbW2rrMjCNtYanGrLHLTuTeWbpaz153iSYRDCqbSv9lXx4Uie8Lnl0YDETZ2/NDeyDUaCWsHraOewlLiQttWckiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piZ4OP/v0EPPIixEq+ePiQ8fpJO0+I+rH1XlyRZoXE4=;
 b=YNqElAonKhlKk6kqwLH2+2UsVxV2Dkv47dY5FKoEp4SHxopanR0Gp+zoWHhcZQowJKCJ5mC475poFrO1Q7Gi9DTC83zyvuvQwJRWZPjWwy9Itkv5C0sIO9e6pV5LXEKiGXkx9GLCnsMekYqy73yxybAxAdMsxxw10RTXhtwVO1trFAgkT/cRkimWDzfghMB3/UfIKRVRkds4Fh8NFbScNKNW3T3B+EE1ggyBZCaRnCmHe2aEs/5NoncaXo9Y/bXN+kfrGgUCqaDI1ze8J2GBFXVvLWm7qW5d1LvBH32D92gOgfMFYZWwXKS1xqzptM0cBcLz+6Zyjv6oBRrNkXy8Qg==
Received: from BY5PR04CA0022.namprd04.prod.outlook.com (2603:10b6:a03:1d0::32)
 by DS0PR12MB7777.namprd12.prod.outlook.com (2603:10b6:8:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Sun, 13 Aug
 2023 08:38:10 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::b9) by BY5PR04CA0022.outlook.office365.com
 (2603:10b6:a03:1d0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Sun, 13 Aug 2023 08:38:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Sun, 13 Aug 2023 08:38:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Sun, 13 Aug 2023
 01:38:00 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Sun, 13 Aug 2023 01:37:59 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 2/4] platform: mellanox: mlx-platform: Fix signals polarity and latch mask
Date:   Sun, 13 Aug 2023 08:37:33 +0000
Message-ID: <20230813083735.39090-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230813083735.39090-1-vadimp@nvidia.com>
References: <20230813083735.39090-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|DS0PR12MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5488e0-43fd-422f-7bf9-08db9bd8a014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7bT2P4l0wWPw48pzIH9LOR82y8GYDw7p3bN/nW2dowjLUHW2sXiO88JporJmPjDd+nBIM1DbLuvkVX6bXqpS4snNUt5WLqxWjueCN8eYELSe7IsEIzpGra5jwt/rOPZlN2QOCk1qrOLHbCiHg1L+SwKl5ghXjd7OM1kQyYRvKVu9sGhHICFgfgQ+4vSX8KMc+gy50mJtVsDKzlVWafbp4YGVIyc+i5of7FPW06X64Z5SH3HvPwWp4vYC0JEVo44cgBFI8EEyl+2QXKrzt9LH8UcZS7onMcgB699qHeIRE/c0B0cp5Pb72Z4kXw1dsSECTOyJ/n/xqbXs4gvKofsP/84IN8/xt1+TWHchq57dTldou7nqLEz6PnLCAiap9jasY3P2BKnek9xBrNP31d5nR9EbJOVPc0HM0YtRJJF1N3iq7X115o2AXmDu2+kHaTeJhCJ//GE4EioEifO7ck13lBuatdlCvumbnkefNrcBj4y1bBVi9PQUv7Az3fDFJ/j7+0KpR71qvyj04jUGVEDRluDT8kTZxbqA1es/1ifcWLxX7hBB+kSGQVCMdt11ocK+cts2ICtEfCZbrl8hwJzubYq0vr2YEeqp51ifSoLbwBy49dzCljwqj8ZN6byJW+GL9spklzhDtnvDgqLJs47cyT9X2SnR6Zeb0P2e/ZmYE5b2OebeEgFwi+8kc3Kwlv2x5KArOJAVldlqIehbYsN/5aRbyaV72DSm2q8Z13RYQ/C7AK5PRaeaDEuNu/ACuzsA
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(346002)(82310400008)(451199021)(1800799006)(186006)(46966006)(40470700004)(36840700001)(40480700001)(54906003)(6666004)(40460700003)(478600001)(7636003)(356005)(82740400003)(5660300002)(2906002)(36756003)(86362001)(6916009)(4326008)(70586007)(70206006)(41300700001)(336012)(8936002)(8676002)(316002)(16526019)(107886003)(1076003)(26005)(36860700001)(83380400001)(47076005)(2616005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2023 08:38:10.3214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5488e0-43fd-422f-7bf9-08db9bd8a014
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7777
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Change polarity of chassis health and power signals and fix latch reset
mask for L1 switch.

Fixes: dd635e33b5c9 ("platform: mellanox: Introduce support of new Nvidia L1 switch")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 5fb3348023a7..69256af04f05 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -237,7 +237,7 @@
 #define MLXPLAT_CPLD_GWP_MASK		GENMASK(0, 0)
 #define MLXPLAT_CPLD_EROT_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_PWR_BUTTON_MASK	BIT(0)
-#define MLXPLAT_CPLD_LATCH_RST_MASK	BIT(5)
+#define MLXPLAT_CPLD_LATCH_RST_MASK	BIT(6)
 #define MLXPLAT_CPLD_THERMAL1_PDB_MASK	BIT(3)
 #define MLXPLAT_CPLD_THERMAL2_PDB_MASK	BIT(4)
 #define MLXPLAT_CPLD_INTRUSION_MASK	BIT(6)
@@ -2475,7 +2475,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_BUTTON_MASK,
 		.count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_pwr_events_items_data),
-		.inversed = 0,
+		.inversed = 1,
 		.health = false,
 	},
 	{
@@ -2484,7 +2484,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
 		.mask = MLXPLAT_CPLD_L1_CHA_HEALTH_MASK,
 		.count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_health_events_items_data),
-		.inversed = 0,
+		.inversed = 1,
 		.health = false,
 		.ind = 8,
 	},
@@ -3677,7 +3677,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 	{
 		.label = "latch_reset",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mask = GENMASK(7, 0) & ~BIT(6),
 		.mode = 0200,
 	},
 	{
-- 
2.20.1

