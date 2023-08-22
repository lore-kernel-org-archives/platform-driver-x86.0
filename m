Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDC0EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233732AbjHVITJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbjHVIS5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:18:57 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD08193
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fP29wJUlDlO0h277z130kpQATXxrYYliF1inlW+4zUJKWOpRNm8SBGuHUxdsev55OnRIA4xYCIdiwAtFrYrJYp6Bf7qe8bkkr0V8uIdLevqSvLWsPJv4mxTQ59l1dTR9tZZcP1dXyReaoGJvArT5VIkZY5/hSXWzLxsEqbR79Pj79t/K/dlAB2YypNu7cNMF8AdmbcQOsakWwbW4RW6aGefiYWiybMpjm9FHeFV9k9s3Okh1xD5osT/B3Z6/Rueu79iNUHlJMLhOmiARokft64WxRF92SPRD6qUKLNDHWLWm0cThZsTn42rdKUQtgaHy/+ia2GLgOu2gh7tdzPN6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wXG5RkJIhJJs8RHNV1679nJ/6r5TITP5pa7tPmSdt0=;
 b=mBj8DgqVhnbWDpunNyqmVls+wwJy7k1JpcgTCBYez9S3TShDrjH/isoWQBJ0nU2Z3Sbon/wXN4aJVLoqANyLqL/KKK2ocOy6pEH/LtMT+XsbCDMKO0AC79JN+cm8xmVXOqPdKoq8ZJ0i3yqgwFQeDk1lAoOr01tNkx2E+Qn/kAvPpohF1vBql6NqtAr6QSt58llF+fqh9x8dSnmZSlpM0uJ/XoFrG7r4bAFdqw0jKv7eOjLOM7s4MSIHtfI7eg7S7dnNPgpQ2iT2izARMtAllJiZ4RdDFPb89zscMJJNScT59au8a6zs46H2uZibNb/01mvHHeI/qpa1sFr8ekO2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wXG5RkJIhJJs8RHNV1679nJ/6r5TITP5pa7tPmSdt0=;
 b=eBeXvZA+nkLacjl8KEuDpE/Un/GPR61vbJYB2kFO6cu6oHm5pQPAV32q3y/e4IFWsXDIIsdH53mFIkwlYvy2JeM1bvrJ+4YOl7Ot/wVYKeMtXDxLBfiL/TBhZuXs0eKJHK0l6IUNograGFffUnoGkjPxGzABn6gccNkdd7aTZa840QYK/oRURTZIi8MlBWlD5qjXVVtxO6WlmzV4lOsTT/nj6dOw9sWXefpUyPVSDKj+LT4y6LG4UeERnSImwX9MhFGl/xcRqEDZ3KHBedJEJqHxFIajbZ44Y1j+61acyqpMIdaiekTVK1Slftw2kYAEDLbcJl1Vx9B5zW8J72wJvA==
Received: from SA9PR13CA0010.namprd13.prod.outlook.com (2603:10b6:806:21::15)
 by IA0PR12MB8840.namprd12.prod.outlook.com (2603:10b6:208:490::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:18:54 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:21:cafe::93) by SA9PR13CA0010.outlook.office365.com
 (2603:10b6:806:21::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.15 via Frontend
 Transport; Tue, 22 Aug 2023 08:18:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 08:18:53 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:18:45 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:18:43 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Michael Shych <michaelsh@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 15/16] platform: mellanox: nvsw-sn2201: change fans i2c busses.
Date:   Tue, 22 Aug 2023 08:13:34 +0000
Message-ID: <20230822081335.64344-16-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822081335.64344-1-vadimp@nvidia.com>
References: <20230822081335.64344-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 drhqmail201.nvidia.com (10.126.190.180)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|IA0PR12MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: f09635b0-4ea0-4210-1121-08dba2e86c82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4AWVdQ+blDHlsdVDVwVWuqcJBoXmgOpR/yz+9useyuQxasz+B26enKkGVesTDlZXpZzEK/Dr44QVMiDWlhxtOwmN6F2DY6xm4fzT1ciXvLOJ4gg7i6KGsLENVaQNuN5aPSfnMnd7EgHZDmIR0H60l3V1+kXJ/nNE0kgXlV8dxDoLeyqnSrL/vPFvUx6PvFVbBmww1UczOmcX+KV4dxhfLGCfOhS3153F+oSAz/ju06iuYi9PgUVa5LUgBzv1VGwwtMo+v/BeAOx0KFIGot1AYnRziTLntXuETZ09/Q65rUxo2WIuHYDTaSjzeBhK+eKvmEA7zkd4QrcLcKnTWBKusimcmjJWyZGERcf907bJalffKmr5UxH9NFO54XqWdsZLH57o1yiBHRtylILNd02wFK7ibyfMVeZ/rerLqGqpQri1EpLHd/WQW24WdpEBeVJBEAe0Q1CXizgS0/7PcjAhNZb+xybLTFl+6rDYlGdLfe0LcRu9RCPXLR6H+rGzEs+/qiuSo4Qihq+B5sDtHCcO6/GgLNw2f2CyDRzGIsz8cVN7qe97yDbMJosLZwBJ9SgdS4LlR84mZDTQKAKSPLMVZwq2ohn8l1L9RrS1H5gMcr/OySLgf4j9zPXTEYFdjo+jexEUz2r+fDkBe7/Wa68CiaB3CpyGG0SfW66pgJnUdx2lGbQ7qj9JDRdVjsIKz4Z1XJ9vZvVPbzrVYQmkG9SuYJrPZ4ZLGO7f5K/uMkHDx91bYGqqdpyUQ7BhYjXfXOfi
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(82310400011)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(6666004)(40460700003)(426003)(36860700001)(336012)(16526019)(40480700001)(107886003)(83380400001)(1076003)(36756003)(26005)(356005)(7636003)(82740400003)(47076005)(41300700001)(2616005)(2906002)(6916009)(316002)(54906003)(70206006)(86362001)(5660300002)(70586007)(478600001)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:18:53.8382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f09635b0-4ea0-4210-1121-08dba2e86c82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8840
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Michael Shych <michaelsh@nvidia.com>

Define the exact i2c bus (adapter number) of fans on the SN2201 system.
This will cause fan's EEPROMs be connected already from nvsw-sn2201
platform driver and not from user space after receiving udev events.

Signed-off-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/mellanox/nvsw-sn2201.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index 7b9c107c17ce..75b699676ca6 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -84,6 +84,10 @@
 #define NVSW_SN2201_MAIN_MUX_CH5_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 5)
 #define NVSW_SN2201_MAIN_MUX_CH6_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 6)
 #define NVSW_SN2201_MAIN_MUX_CH7_NR	(NVSW_SN2201_MAIN_MUX_CH0_NR + 7)
+#define NVSW_SN2201_2ND_MUX_CH0_NR	(NVSW_SN2201_MAIN_MUX_CH7_NR + 1)
+#define NVSW_SN2201_2ND_MUX_CH1_NR	(NVSW_SN2201_MAIN_MUX_CH7_NR + 2)
+#define NVSW_SN2201_2ND_MUX_CH2_NR	(NVSW_SN2201_MAIN_MUX_CH7_NR + 3)
+#define NVSW_SN2201_2ND_MUX_CH3_NR	(NVSW_SN2201_MAIN_MUX_CH7_NR + 4)
 
 #define NVSW_SN2201_CPLD_NR		NVSW_SN2201_MAIN_MUX_CH0_NR
 #define NVSW_SN2201_NR_NONE		-1
@@ -425,28 +429,28 @@ static struct mlxreg_core_data nvsw_sn2201_fan_items_data[] = {
 		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
 		.mask = BIT(0),
 		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[0],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
+		.hpdev.nr = NVSW_SN2201_2ND_MUX_CH0_NR,
 	},
 	{
 		.label = "fan2",
 		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
 		.mask = BIT(1),
 		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[1],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
+		.hpdev.nr = NVSW_SN2201_2ND_MUX_CH1_NR,
 	},
 	{
 		.label = "fan3",
 		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
 		.mask = BIT(2),
 		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[2],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
+		.hpdev.nr = NVSW_SN2201_2ND_MUX_CH2_NR,
 	},
 	{
 		.label = "fan4",
 		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
 		.mask = BIT(3),
 		.hpdev.brdinfo = &nvsw_sn2201_fan_devices[3],
-		.hpdev.nr = NVSW_SN2201_NR_NONE,
+		.hpdev.nr = NVSW_SN2201_2ND_MUX_CH3_NR,
 	},
 };
 
-- 
2.20.1

