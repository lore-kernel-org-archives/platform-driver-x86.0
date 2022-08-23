Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D411EC3F6B0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Aug 2022 20:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiHWUhP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Aug 2022 16:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiHWUhA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Aug 2022 16:37:00 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5128356C0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2022 13:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pp5SXYhaQLgJuNSOZY6L43M3In/0gil33iPptzE5CTGEmt7o68qseA1p3P3cr0GC7ZV3rbRo9MtNE4pL7tyvufpx5bS7b0eLaA2gv+CUBEO+zu1ofeYib96h8QC3JlI/kiyaZZwr7Byflt0d1c7h6bXNpLH0rKiWMl/3Ui1JzDhMA0QayvG9efcX8bbaLnhURTUCVE3/FVgalhkq3gaKodgXPblmEqEPemKNtuxG6t5vCk5ZSFRMFEYlRc6bEDIJh1KF/LSKfp3vWpvOJSlNC0riczl/fXubhrSOv62bM8wdKHvdsWJv1H/1UARZufL5A9uCDx0s6oSW+zexEAiiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TggDQH64bAIYx91GQeCjVAfJva7eMoliu6tfDUOiE+8=;
 b=glpwNwcKA43bFZGQApC404NgnJ77vGsNQimpFcv3nulEbOwQpiKFUKh7WubMOnl57R3YVnJ1qGDduXYm2HnYVsfrzw6Zy/7GH8ZT9n2QK4DqChVW0N0jDg+eFAC0ntJVVcPMnARNwMDwouRFyP7G4S+0Vf/mEqlC/QwkmxglCBV55Oc84L1IDMF5ODZNRAqUJkj+y4r0q3IOpAuTIBxFVo4jzE/oSaYWdYSlcFAUC/FXWP0HJKXoi7+QhQQPUGXeFawgtvNbdvg/TkagOgxtJK+BoUJDidvTAmxcWruurHeTNz9+x9D83s8ZYAiPvlYsy3HAzvQukOSKNo9H+Jf3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TggDQH64bAIYx91GQeCjVAfJva7eMoliu6tfDUOiE+8=;
 b=GPaLNEfTyZw9cVmcbuu48ArNJx2IPj3U9ets/XI8h9OV+ODKKCpeUXZf/ECNu8Gmy1IjKgud12PGknXeDAo38SslRRv3KrIhbJXrGZedPvzc8PH8hv2GoJyNw524e6pnEsTaRuMsePDBXGv4NlDJTl07budm9JJ9hZTANQP6Ot5XXyjuwU05mCURs5aMpF9n5tRDaumSahKKkesnoxRCTiOXW6DHla0qUGBDuPkbfIevp6BfMgY9+AJ3Hu23Oh3J/aKwI9rTTSZJRMPI7d7IJEp3VCowBDqRowlDqSgl81UEuLy5Hip8RIrl2ytyH3GxTlNmYt2qZ2TE3we53cBe9A==
Received: from DS7PR07CA0021.namprd07.prod.outlook.com (2603:10b6:5:3af::23)
 by MN2PR12MB3744.namprd12.prod.outlook.com (2603:10b6:208:166::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 20:20:09 +0000
Received: from DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::b0) by DS7PR07CA0021.outlook.office365.com
 (2603:10b6:5:3af::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Tue, 23 Aug 2022 20:20:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT004.mail.protection.outlook.com (10.13.172.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 23 Aug 2022 20:20:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Tue, 23 Aug
 2022 20:20:08 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 23 Aug 2022 13:20:06 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <dan.carpenter@oracle.comq>, <platform-driver-x86@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform 3/4] platform/mellanox: Remove unnecessary code
Date:   Tue, 23 Aug 2022 23:19:36 +0300
Message-ID: <20220823201937.46855-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220823201937.46855-1-vadimp@nvidia.com>
References: <20220823201937.46855-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e10eb762-8b93-4005-fa24-08da8544e004
X-MS-TrafficTypeDiagnostic: MN2PR12MB3744:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DwjMx8dhQd3/K1tC6vXTe9WJ4Niir9x6W4p/l/EbO8nXXoVtuwLmG0MLF7A3hnWC1BuM1aJVOyR8mS2dLbZJo6uwRhaSJ+HK+bPgBdWeGNQEJTD4V6BHSJkXoa9tCu9PP5j/b6ImzREFZqoD+A4Iti1iIi30UeT5xFXcsfxfK7GPC9NTIXTeZ0lBB9WSW6ZIZq1ulenKYy4ZuJ8ESsVkPU73UhtzRN8l7rY/hKovzvXBD3LLfdtRhezXf770tPd7Ar4wz+4gg/Q4/0Qfbhqxj//PgWOO9BK2AdnCsPe9maRhHBbOZ7xcRTEw2PE6JMl3ISOhHj5HEohP+xZErhHvKuG4GBUoMQ0owXfJk0Ikcaa6vZR9QjkA+GmPwS0Ce1RpUB+nqN3qH7yi5PlabH9CvUhcEOvdctOU7ID6QlM0/8qifZYCbDZ8LTw6qh40vOsgofux0/w4a7gymb0D8mBop7rZKglD8fTXjsKfpp+CVrQJUU679XqtthkT/QKKbzW9avAi4ZyT+XSCiEObGDruT08V4mPC31UGalE2/0h2CrUi5ZwkJN9nnUfWkcqByg9TYHPNyruXy171+Yqzo/yrKgdzJARl4/k9JA4PFcGNSHfrnrdDptM1qX/Oxq9MDVKycXvsNHEPu/ME+/wMo6E7Dee6IeoFUzLUQ0rr5EwYL2eoZcZn+6X7v/yVwfiuj0/Q999ZPhETrPrO4Pt9/TMJ2cUZDXciAAVcihGO+RnjkOEL5ImDT//7lh7Szumo38G4wl7WP2GmaZB0pad5lIvvLHD6J6Wzgl+TYfsjsq389lbyecsTalqxdqFL6j4kI8Jf
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(136003)(40470700004)(36840700001)(46966006)(86362001)(36860700001)(83380400001)(82740400003)(356005)(81166007)(40460700003)(6916009)(54906003)(316002)(8936002)(5660300002)(70586007)(70206006)(2616005)(8676002)(2906002)(4326008)(82310400005)(16526019)(47076005)(1076003)(478600001)(336012)(186003)(426003)(41300700001)(107886003)(40480700001)(26005)(6666004)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 20:20:08.7789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e10eb762-8b93-4005-fa24-08da8544e004
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3744
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove redundant 'NULL' check for of if 'data->notifier'.

Replace 'return err' by 'return 0' in mlxreg_lc_probe().

Fixes: 62f9529b8d5c87b ("platform/mellanox: mlxreg-lc: Add initial support for Nvidia line card devices")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-lc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
index e578c7bc060b..1e0c3ddc46cd 100644
--- a/drivers/platform/mellanox/mlxreg-lc.c
+++ b/drivers/platform/mellanox/mlxreg-lc.c
@@ -825,10 +825,9 @@ static int mlxreg_lc_probe(struct platform_device *pdev)
 
 	mutex_init(&mlxreg_lc->lock);
 	/* Set event notification callback. */
-	if (data->notifier) {
-		data->notifier->user_handler = mlxreg_lc_event_handler;
-		data->notifier->handle = mlxreg_lc;
-	}
+	data->notifier->user_handler = mlxreg_lc_event_handler;
+	data->notifier->handle = mlxreg_lc;
+
 	data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr);
 	if (!data->hpdev.adapter) {
 		dev_err(&pdev->dev, "Failed to get adapter for bus %d\n",
@@ -888,7 +887,7 @@ static int mlxreg_lc_probe(struct platform_device *pdev)
 	if (err)
 		goto mlxreg_lc_config_init_fail;
 
-	return err;
+	return 0;
 
 mlxreg_lc_config_init_fail:
 regcache_sync_fail:
-- 
2.20.1

