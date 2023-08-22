Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3BDEE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbjHVIPr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbjHVIPq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:15:46 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD8712C
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5LMvjJn/SL7ch1qUuwamI6Fz1oPEQOuhPxQp/xE9HPLB7QwoyPQRYx8rP7qmfCA+z8G85FcUvczDqj7Y8GjJDDz7etcLiByq+Rh5OqbPlvO+yFifiNudiK2V5JhexO8dS1IhDINPpF6FlAWL1HmzWYY/rqlkbr6Mvnl9B5u0q9rvoWJ9Y4ZkP+Rp/Q1kpyH86omd0g8o1lnyD5h/KmrhNJCgZDQrYsioLvIuvud5LFYCM55ZLHqvUf6DAUPUCMjz4zybeatg8VESvXs4fZSZJniF59Q/oeyVjtnUx2b8UiztB1GOCLB7rlPNmBGrwZQQdUzkJISakw3A8pHEWH0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1dw01myy66sB0/SglKw/bYCIpKnDSFN0xnNxCn+IdQ=;
 b=gLs8OfxcX+4ftnJv73eOetUGJa4W10kxk3kV8m2eZu7hvSQxBYmczJPqJU0nB87CruVLKNalx7ELqN92bfC1KhmzY8BFJdmw2RHb7N0bIGq1n2KUwO0YuffPCQjdLQiCCisMHhA3jIgopcOaxceyxn8/r65oIpeBH0InL+2gjH2+TFjqXubxle61pSUup6dbKMQZhbRygHxHUBvt/l69lb/iaCRdynP9hzNZksjiUU+zxJz+7Kt9ddNqMG5c/qXnbDSRr+1n5Y0NRjAUfgQEi23RLASdFxIpeQLpSVBzxWPje6tA8Kuzx7l8bmwnNMAbe9MzARyslP6+wOVXOCiueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1dw01myy66sB0/SglKw/bYCIpKnDSFN0xnNxCn+IdQ=;
 b=pab0BJFs8uOWNAk8cJA+ysM0nZnMCJZutpqclDBtmioeCf2Ld4+YEsFsbN/VO4UxeRFsZFf07DBQW187FjeQsBXNUvLA/p0m/5NO2JGFanYVE7KbNF8qDSowcflr8J8+5QhvvUbr6jblErCUVSxzfBLcpsJLaKPc1hN94rNNnCcqnBBy/dmsxusboy/mY76XFNzUfGtW8A2suRC/wBmbpmCT0aOfACZ4Zm3ohiuzsr8mtpFwp8rgUDsxa2I0zSqWSi84lCNMS4edibq8zSTNY9ETUNVSILxGG49KnJ4xm6vE2YX4T93K5t2apGSP+YN5aYzKzHloYv9oq+w88szBOg==
Received: from CY5PR10CA0001.namprd10.prod.outlook.com (2603:10b6:930:1c::13)
 by DM6PR12MB4959.namprd12.prod.outlook.com (2603:10b6:5:208::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:15:41 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:1c:cafe::6f) by CY5PR10CA0001.outlook.office365.com
 (2603:10b6:930:1c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:15:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 08:15:41 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:15:28 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:15:25 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 05/16] platform: mellanox: mlx-platform: Add reset cause attribute
Date:   Tue, 22 Aug 2023 08:13:24 +0000
Message-ID: <20230822081335.64344-6-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|DM6PR12MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: 070ca8c1-3a18-4113-3d4e-08dba2e7f9e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4G3l7H7Na+Tc/1+NvrOQRfp71I6Fg++zW7Uf9ZhOfhInNIHm/kTY4Sh4rx8uc+wIQ2rCto+aKae9DUk/JOpetn5pHSSr6axYh5Giv1viqpkTsBzoY5O1AN8imrq4ID28giNUHvOt77eBUlZoPkaVXFYTjjG7XMMiuVNqmrF9R7dFvABGLQXt65GCQ0e25sptGLH+Zc4GbEf/ro8uWQZBs2G6+ezwJrk8EO8QaRDzB+UQMQYuhBW/eBVDe/D5q4aYXQ0SiXYjMwa2iB2rhPwoFca682eDy02KOMWo+uo4ts9+di75pJ8Kj/vFISXUFe58Ke3Nq9jdkwRF++J0a9LsJDdi9fFia13CAKKzjmSgT71VfI4DG0KkMsdrUE1SsLrUDOiB9fnaacjmjaKKP0kzYv0QCaV3klmmf6kMe6pUKT5pMNyu2v0DviKud0FImM539KnsQHoeaDfSpkKvJ7CF1gQjrdwwX7w17+SGkuLy6zy6PddzoLDhXJEO8SOu2jIUKwlatxaQJj3n4mmx8vWVVCtlvPf8d/gSq0fsjxz1q5vYAkGAbzMAlfpfgtChlrFj8dMI9HxBhAJnVxCbyzKu40zfqhTkK2GAVHu/VBaelAHWPevbCZaat98EkYpJtxV7HRUkeETwl84ZeRY5d5TZfktc3KCWoHnasPNtIAFEr2GHpvbzvPX15gsgxQ2dGCpUMDmJ4FVLrADfEoFlMEzFCdfaaZNU3wwcjCsbMkBnGsVfcwQUS85xTXyCshF8HxUm
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(426003)(36860700001)(336012)(16526019)(40480700001)(107886003)(83380400001)(1076003)(36756003)(26005)(356005)(7636003)(82740400003)(47076005)(41300700001)(2616005)(2906002)(6916009)(316002)(54906003)(4744005)(70206006)(86362001)(5660300002)(70586007)(478600001)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:15:41.5945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 070ca8c1-3a18-4113-3d4e-08dba2e7f9e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4959
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend IO registers description for some system types with reset cause
attribute "reset_swb_dc_dc_pwr_fail" to indicate reset caused by switch
board DC-DC power failure.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/mlx-platform.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 648b27eff0b0..8e07ed3dc552 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -3558,6 +3558,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(2),
 		.mode = 0444,
 	},
+	{
+		.label = "reset_swb_dc_dc_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
 	{
 		.label = "reset_from_asic",
 		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
-- 
2.20.1

