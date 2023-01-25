Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A042C61DA2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 10:00:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjAYKAU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 05:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235474AbjAYKAQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 05:00:16 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39F253E7B
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 02:00:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHEZVGA6o7UWJwfmaJYbNa2SJ1lbnkzIa7KruWY6XeMz0JfpfKT3vZzhEMnsXvrjA3uI+DQibKB2fO2IB2sLInqXgEW80EO3nQJFV9nUAmj9DAcZElqjS9Oml18jYaxb3Ogs+PwBGcW/Ye3/MLjpFqZMbuWyobsjmUk+J1iwoNZsqQr5gVPUFFzddcFzXMTMraJkMpATTteiJH+gDSTubgybbbGZ9xZnq2B5Kq7YBKc1EJ1KqPc2uSnPdllWYMH14+yqDM2Nzg5nY1iLbiC7Rpy2LX+6fBTjU4Cu0TLCGITpsfvn8ZdZT0R9UCLBhCSuC3K0wek1nolPSCEX7Er3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLj1CLMXG9O3xAYddWMV1raf69V6yJB5Bylarx/UYVM=;
 b=RjRHeKL/xyJlq/FsgTH5NrOZB+EDgmwk+FPw+dSNcLs+NTDKSyRCMuKP6BYx++ou9Et1YJG5IBn2a5v3+DiPaixxgzVpJn9o8y2GxYcdGhKTuWHfhboS1RD/FGJXp4ufHoE7mXzHJFGdfn4Hzj8kPerJMbmp9y80vzPkW3ZYqZG6pC6XdXvWfcITR2r/Qpm0iRgcY6evdVvSQ+nCOZX9t41eT1ilFQUT2+jt9ztavBVEIDFiNYbcc/tfEvUTbkqPLXyGmkiItkJuXxuJKkDLvd4uwmBHUG5v3t9D48A1caEseUvrUZ5/ak/nEuZJ9iPYpikmNmJ/TDOP2Sqv1NBKQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLj1CLMXG9O3xAYddWMV1raf69V6yJB5Bylarx/UYVM=;
 b=UlNbrlUyTfkZlCd//gp+fzUyrNK/2CBX43kLL2UJ5PbhJQMBvugv8gF2g1vQG5kGOsxGEzhXmFLNb0OAcW4/0WK9ZDWKXhk0teLnLr/MUbDxxd4BzN8t4f3rnTD481fP50DcF8aFMSCNMZxnqHGkSz4tsL0lsClcQ5sGbf3eb9g=
Received: from MW2PR2101CA0029.namprd21.prod.outlook.com (2603:10b6:302:1::42)
 by IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 10:00:12 +0000
Received: from CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::1d) by MW2PR2101CA0029.outlook.office365.com
 (2603:10b6:302:1::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.3 via Frontend
 Transport; Wed, 25 Jan 2023 10:00:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT103.mail.protection.outlook.com (10.13.174.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:00:12 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 04:00:10 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/5] platform/x86/amd/pmf: Fix to update SPS default pprof thermals
Date:   Wed, 25 Jan 2023 15:29:35 +0530
Message-ID: <20230125095936.3292883-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125095936.3292883-1-Shyam-sundar.S-k@amd.com>
References: <20230125095936.3292883-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT103:EE_|IA1PR12MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d372c8-496a-419d-728c-08dafebaf34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fKw8zQBA//055OtPgV11lRdjXZTYnUby9hoK+s1HrgB8uUwXw+UPz+CegaZm4lRf7z0zo/2pwe955WGpMhMiBCXElbMl1+8TXJOuKyKF1+sl6jFDATUIC90dcIxraEnU88mOzI/vbLe5ioiTE5oR908oyLlN+wCEGAKpkAsdq9cP7jJgXCRh7b/SUWvJvpnR4D8eW2Uq/u+urdbQAu05JyX+OPQU6ldkknmDNrIpVgqGjspdlyESUfOeOsOwuUgVErw0tHYzTD2plW6W8aFfHkm/i+IEMdEEIJx0ZdSPAgHO0shgyLmRBcWPnWyYgggzbNS6ZwF3CJCiIYTp93HkDFcYtczFoaJUOLXV38sQldfVKecHw4CYMYlnhxBG7JdWAPkBXubqFy8zsl8ZYp2Aj1l+kBuQacNhHJhWQISCvxuA1bSw7igJh9K2rH2OYZQIxotniyR4Wmgzh0zw4Ywy/LlEEubwpzi4gtd2z7lwrrkSLXiIUB4Yu6DPY0o1mTx/4WYjDWAbpc3hKR4XxIxX/rvI4DQys3RJFiPOTDPiBC2iKrRuAVkQ4hhsLxdnnKGq+Q1R658V36TpbBw6Rr5ZLt82VLxLeqRbLyAS6G5hz1VID5QBbuQbKOxDb4gkQw1Qv9ZXKFuXXUMl6FcXYnQkmqrJy5vLNKrVU8wjh80irhveeaULrHGM4YwC2GQQaiqze9l73+pssPZUtbakpnj1UVlH4ydq2xPZfrHH5DuLEDI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199018)(36840700001)(40470700004)(46966006)(82740400003)(82310400005)(81166007)(4326008)(86362001)(41300700001)(36756003)(2906002)(110136005)(40460700003)(186003)(70586007)(8676002)(26005)(6666004)(47076005)(16526019)(40480700001)(426003)(54906003)(336012)(1076003)(5660300002)(7696005)(8936002)(2616005)(83380400001)(356005)(478600001)(15650500001)(70206006)(36860700001)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:00:12.4186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d372c8-496a-419d-728c-08dafebaf34c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

By design PMF static slider will be set to BALANCED during
init, but updating to corresponding thermal values from
the PMF config store was missed, leading to improper settings
getting propagated to PMFW.

Fixes: 4c71ae414474 ("platform/x86/amd/pmf: Add support SPS PMF feature")
Suggested-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/sps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 3b4a09a84c29..bed762d47a14 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -136,6 +136,9 @@ int amd_pmf_init_sps(struct amd_pmf_dev *dev)
 	dev->current_profile = PLATFORM_PROFILE_BALANCED;
 	amd_pmf_load_defaults_sps(dev);
 
+	/* update SPS balanced power mode thermals */
+	amd_pmf_set_sps_power_limits(dev);
+
 	dev->pprof.profile_get = amd_pmf_profile_get;
 	dev->pprof.profile_set = amd_pmf_profile_set;
 
-- 
2.25.1

