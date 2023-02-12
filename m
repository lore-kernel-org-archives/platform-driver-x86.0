Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21139C636D3
	for <platform-driver-x86@archiver.kernel.org>; Sun, 12 Feb 2023 08:34:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjBLIe2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 12 Feb 2023 03:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjBLIe1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 12 Feb 2023 03:34:27 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D96B7EFB3
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Feb 2023 00:34:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVuZDiWJ77m8hrlcRR8/ZZgmZKtJ0/e3wxPumHSwDMpxbzzNceZAWQK53AJ0hrjXM+br2bDYnr4sHHLhEHwAVRKcNi2gepICfhmO8LQthr6v2Ah7gFSNMg3RUYdFVRqSjlaaZYCthmmLUdHLQma8jhe3p89WmCUxq7ZKhEXx4u0/KK980i5zLPatO8KDowRu0JIT/tkZltZXJpJs5FyhRJ1T1MNi9Hz5rOdeO2tlZW4PNcoPK9Dv3UleaFftpfs3o0lfdrlIbimsqj+D2kTMEE0uvmrITd7kaYjXqjmPVwmbqsbtA825vpqd7dJc9WBO3W/oBHo1DUXeF0wNq4XPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3B8Nke+cdBhqhccvwyx1MHusMCJQj5QE+r4TRPrVAyk=;
 b=eVQoNpWU5AuYtHBlDr4mCmxZ7AEfhfAg1gr3zVZyQT2HeePA+97zVK+uRxeYHsklirOGzVzMcLBrhideMKKPf6i9YbXY8YKm+aZWoG5HmHL+toqiBPeQVcLDQxldcpWRFcAAtlqhAu5qgb3fSItDc2xd8MxyYCLF93Tad/qevJDS97T6gebTBQC4YApBIuqZ/11hMCu3jA3y5akGwz96Xt3yYiBZEqajFQ2ZRWNJ836YYf/0rdX6VF+KS0WnnoBWH8UeSkI5FmBk0S9fijgiwdKlx8C1WbqSbu5b3ixQhojmCaNE203XgD+42w6Q8//GQ0tj4+qUe+z34uzNyzhfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3B8Nke+cdBhqhccvwyx1MHusMCJQj5QE+r4TRPrVAyk=;
 b=SoSVE6dHSb7YoPmBF8SaGOm/JN+5kfnC38L8faHftA3hIEObliHGOqjh5sR1xZCMbykw95ZwB52F6rdrDh+FtGDZy3JmRXEx6oepAmIsVGsr/y8NWDfUnZZ5N47w7dJdA2/OAMicdFLY7JMjxgS+BvxN7r65xKRIaB9ihTvhf1Cox5OsmONoSM9pIWavm8WQihyVHI8ppfCZIPkM2fhrkC6Q40B5OiNgJu6Np+C188RHqCcsgbQSQlB75d6kcmRPRs1n9kuVdWitdMKnEizFTYDIvIzETUVhiSuAHBfIG8qBGPacI8wXayXcXEZgtcQnm/yfwlDgyvsmiF/gZFBrXQ==
Received: from MW4PR03CA0293.namprd03.prod.outlook.com (2603:10b6:303:b5::28)
 by CY5PR12MB6225.namprd12.prod.outlook.com (2603:10b6:930:23::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 08:34:24 +0000
Received: from CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::9) by MW4PR03CA0293.outlook.office365.com
 (2603:10b6:303:b5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23 via Frontend
 Transport; Sun, 12 Feb 2023 08:34:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT070.mail.protection.outlook.com (10.13.175.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.22 via Frontend Transport; Sun, 12 Feb 2023 08:34:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 12 Feb
 2023 00:34:11 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 12 Feb 2023 00:34:09 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 1/1] Squash to commit cbf3f15f51c5 ("platform: mellanox: Split logic in init and exit flow")
Date:   Sun, 12 Feb 2023 10:33:50 +0200
Message-ID: <20230212083350.52633-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT070:EE_|CY5PR12MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: 18b27041-ca2e-45c6-afb3-08db0cd3f201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XTc/D2QiEeV4PMxb87KYaAVS5yM8oD8syswpfQwWYX7SD8iWvLNlxgWk53C4+DYZGWbKRNyvmVnUlOXE8FL1EqFF8KGmZQ14wNKH8i2UwGmPqyXjOZ0ErBWKPyZb1aNfR1x0FeHLlidDwvVDiATIQYl9NMVyUv/IBKRMt0L/jtrFtpSY/cOnMr002HTrr2y1eGAK29lGRSG4/W3CywRxQ27NSxqjTJi3EDzebkwDBMtHiZPol5skLNUhvltM3LezJZBKJAtwdF8QJGUHv5NyYfSFvoB3PPQkVqKrtUhdgYfMM3Q33TsoUA4lgwBbTiMlgGq4F8Hk3mW4s14UGQSCLdJmyO5BKFrtqya5JhJinN00t+2R+L5XrZof/ccAVCaER6PJItt4dgiDwDBXv1nOLzxDzdSjFSHnjXB9+n7acdlsjizL0G3xX61AZrW9XRnd8boyzw2p29H/TsxPqOtPtCYpPyDjztITxekjJDSIpLh5T7iOcvgdRJ+colcdIjD84nzw40w3A4gBCy3IIqzasgnL86vtBaf8IVAfLQRgZT+q+BLEs+slk91QqEERHlmU6eX0UWrNkwddpCqCSS/2UvFZknI3h4BdHCft/Bgh76VwBM8j/CoDG9FFQRRKmiDj+WjH1ihDrtcInN/2eKYLFB4wRoUe/dhQI15t7RsjB3tSyFNC/TnrU7+3hwzeYTTJH6IXtVBh25TWb5Lq8WiUhw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(356005)(7636003)(40480700001)(40460700003)(82740400003)(86362001)(186003)(36756003)(478600001)(426003)(336012)(82310400005)(47076005)(1076003)(2616005)(26005)(6666004)(16526019)(70206006)(70586007)(4326008)(6916009)(8676002)(5660300002)(107886003)(41300700001)(8936002)(4744005)(2906002)(54906003)(316002)(36860700001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2023 08:34:23.9949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b27041-ca2e-45c6-afb3-08db0cd3f201
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6225
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Squash to branch review-hans.

Fix robot warning: drivers/platform/x86/mlx-platform.c:6121:6:
warning: variable 'i' is used uninitialized whenever 'if' condition is
true [-Wsometimes-uninitialized].

drivers/platform/x86/mlx-platform.c:6062:7: note: initialize the
variable 'i' to silence this warning
	int i, err;
		^
		= 0

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/platform/x86/mlx-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 1bf9ef6e8c97..7b6779cdb134 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6083,7 +6083,7 @@ static void mlxplat_post_exit(void)
 
 static int mlxplat_post_init(struct mlxplat_priv *priv)
 {
-	int i, err;
+	int i = 0, err;
 
 	/* Add hotplug driver */
 	if (mlxplat_hotplug) {
-- 
2.20.1

