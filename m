Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A81EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjHNJCG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235829AbjHNJBc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:01:32 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFF2172E
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SU0LV/m7Q9oa1H1pEJPw3IsOuOj7mPrUqmnrsjptdSha3j5t6OQXxKOugeyzoDgqi3tZbLFOt7ZN7+9NY9t25dAIQENAeD92jtg4yNssEsPFMNhlJabKL5J6A+V8ZTw31Epf9kyXRV8cEGciDf5Revg8Bp6M3GJgiA6O1sY3ZF4rTF2GLdyoAuJBAj6VTSx/yV755qUeP8UD7OGHvQAbQdWscmxnZKiF0ExssUEPv7yhUBil7PbsnyITC6laJTx4Yhg1XPub1YGzsDUDjAgwmf+0gKijak79KYvOuruPJpm9tg5Vpw9mTyp8xNzsAAkdR4+uEsF4LZYEmHDnlNSoag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5lkbwuXaKYhnHRx76HIGr0lMKCPiw3Uu3qMe14L4FQ=;
 b=ALwGWUBGYxoSXIjKEDMD/OsvyvcB8MFui2vfv4jsyPcDe+o5TAts1GEpU1GuB3GpJ+B6oRgkW10oCtYVqjNU+EuspwNlq6vxqGCyBrz4ZdMSJvRdNBPWOJZ4CSsrjamU16NCNGFUNYLISccMibUSrsMQvKoYccSX4I0IUjkk2mL1wpSYTfCv1iuugw9DIWVo8zs7ByOM7LSpT4YSxglTpPRdyuW6UuA7CDViKo0hHX6Yx1wa2WuRsfK4O4SDjhTMEcE/RBSRhtKlmzrzcnAGs8zntDmIvVl5LXKyKnQKPCPQzqeiWDeHN0Ot3S+YLaFd27Q8k0MOjQFWUh6Pq5U4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5lkbwuXaKYhnHRx76HIGr0lMKCPiw3Uu3qMe14L4FQ=;
 b=mgPSNpEZoZmYwE5wwvCWXgZ3uvExnjonXwEsFabAbD9KmsPbxxCktqlbycixuC/cGFgBp0A5PVyyJtuHv9hfRTkaOodnSeji+7ZITovNaEZYmTniS25m7pRk7DYHe8Ed75bGd1/MRuV7xgeRdkXZdHMzJf0zev511z55LEO6dtP+mJtliIeq7nVp04CQCUfXz1P2wAPyIRlds6fYLASLypBd8v0j4JXmJuBUONIYqdqpO46v0R2XcxXfowyQMjbXQotY3zXQYzmmrBBSrZzi+3f/J6A+48rXCb44CFEFSZMHFF4u8wqefzdR84/HetBwob5JcWG/ZdsBHBQyBFmbVg==
Received: from BYAPR06CA0006.namprd06.prod.outlook.com (2603:10b6:a03:d4::19)
 by DS0PR12MB8248.namprd12.prod.outlook.com (2603:10b6:8:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 09:01:15 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::92) by BYAPR06CA0006.outlook.office365.com
 (2603:10b6:a03:d4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 09:01:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:01:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:01:04 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:01:03 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 05/16] platform: mellanox: mlx-platform: Add reset cause attribute
Date:   Mon, 14 Aug 2023 08:58:59 +0000
Message-ID: <20230814085910.56069-6-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|DS0PR12MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 064e304b-c836-4a72-4dd4-08db9ca50382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nijBI1LBoYAQR6J9lNBh0s3yyTgm5CpvyIvwK6mWe1QSBEtybgp+haW4xAecvRxI0qiATfOaSOwg4nkiQKVYtVb13whI1rp40ZfvPEwRckyQ1O4mLcLv4c7JaYyWZ9MKa1zQWnJHdF/sH06QSoVe+u53r2190F7zjNf1oQ/X/UC20JPMdLnyrDRgtBatgYt3YvDGnxBgZ6rE3TSKeOYrlFlpXLFvtYHz3U79w5uloMbu+WhVAn1GyXLJjcDSsThw5DCYONOjPeNBD2Rft6hta8MFU1y2npqa8MSaGB/WGxUyJBosfQL8VaN5MTRGAYBlq2jFi/9w9ZY+R3MNToPltXGSJsFr2rv5t78lTva0X6WqqUf74jyUK0YszlnlqzrU5inALtgEPw71jQsmuqIzyca+SWYhlhQPgE6DjCpbsMDsoqLxbfBVbz70oZSi5a+E+BC7LMzWIseICX62XefGCF83D7ma8S1iEFB8rZyicEsNv4gn3dld978LDWb0n9viZM9GYqh/2b9y1Re+o1LqI6KXdYdkLIuPDqdiXwdPMhXkMWHo0KaBkybvX5uvTJ9uXEx6bXJV2T3KyVS9evjO6MUqrVTxRZXtGYCcbvRAOVipJvSkPHpFr7s/7iD3d+BXBsFrg22LAh9zYoDaJFMV0x1mXS9b2Any31vluWHfQ4FU/jy/Qh/pI986gigSGiTz1nmegFSSDPT5X+07BB3/KJH80++edLq0f8z0v3qqN13+Y7cqxm06Lzn3Q95mQfHR
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(1800799006)(186006)(82310400008)(451199021)(40470700004)(36840700001)(46966006)(6666004)(36756003)(356005)(7636003)(82740400003)(83380400001)(47076005)(36860700001)(86362001)(26005)(1076003)(107886003)(2906002)(4744005)(54906003)(40480700001)(426003)(2616005)(16526019)(336012)(478600001)(8676002)(41300700001)(8936002)(70206006)(5660300002)(40460700003)(70586007)(6916009)(316002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:01:14.4527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 064e304b-c836-4a72-4dd4-08db9ca50382
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8248
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend IO registers description for some system types with reset cause
attribute "reset_swb_dc_dc_pwr_fail" to indicate reset caused by switch
board DC-DC power failure.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
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

