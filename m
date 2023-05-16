Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A882C77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 May 2023 07:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbjEPHqJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 May 2023 03:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbjEPHqI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 May 2023 03:46:08 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5AA448E
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 May 2023 00:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiRGSYy4wx/ow3Z3O4CP1716V+w90utQFUlBpp2eGpIpG4c6LX1YM7hkfYfYEj3mkv48dVwPhUGGAT7Ikv16nVHPHulSdlRl7GXZE8i1dPSYu3ZqOJSqSukM79qtr7MqIwmGCTHDxVLU8K3GHjJfBBv4tE9LU1qlDbQfYGyxcq97gqJHEyVt9tNON2OCMMpuMDFEBFKuFhrJ5cxlgbBUmVlLKzjIJENsp1jF7ulS+u2gS37Dc74Mw1hHuK6zI/45jAnGxdQyKZOA9bEH71Tq0+hwn12GVos2Sl/N0qOaasi15o9wySOkp26GIqUESAl3MhiCpj5TZIuMQ1Wg3bXqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kICipT26vhGJqpWfs58IuAe+hZP5X5oqDWfA5+UOMwI=;
 b=Ih/xiccrzLX8NqSBhGQC33anD4sSDqpsQljpBpSlDLv/ZeS1pWw/kZ93y25gpC3SeaRpayrIkQDH7gLFCgYv6NECWtagcTahpQGrXxrfbBGSIyH2Eov904D1SwaDAkL8S2P+CBXZq8BuWXOU0FZUie7d9M9n97123bJCAiqFtgWvQ3ijPsiC5RvvK1/knl5RzAtMmTVxckjD/U5o60LiA/k3F7+Vypg/CErh4OGeZXwOcNHttESdOZwvAxoRRsEmtANR9Yd+driSRdQIxx9SOz3NGn6p2d8rzaV0x/J4Xi3ahIxg5bMWMSSyeKKUnspuDCD0wqBrB+257EDLuRvsIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kICipT26vhGJqpWfs58IuAe+hZP5X5oqDWfA5+UOMwI=;
 b=EeA4fpwPDRg3bi+Bb3Gg53qA1Jsk3UuiaQ5r2qaIFtRgxSI0l3PGsy5VXn5JuvF5ptiOJfY1VaoCU+cyZKZlnM1SKy/L1pEg8Kt+0ZZzzYYMglDnr81lUJZLa3jlR5XKCDVaiLNczxDIBr2FjC8wqBpR4zGnzOqbPZ/mAsHXs3o=
Received: from MW4PR02CA0006.namprd02.prod.outlook.com (2603:10b6:303:16d::12)
 by MW4PR12MB6755.namprd12.prod.outlook.com (2603:10b6:303:1ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 07:46:04 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::a0) by MW4PR02CA0006.outlook.office365.com
 (2603:10b6:303:16d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 07:46:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 07:46:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 02:46:01 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/x86/amd/pmf: Fix compiler warnings in static slider
Date:   Tue, 16 May 2023 13:15:31 +0530
Message-ID: <20230516074531.2885235-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT063:EE_|MW4PR12MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff6c1cd-c7bd-4b48-a83f-08db55e19a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSVOn3N9zGg336d6wSsQnABXx5OOa2QR7hBVp7vNIqm/pJxXsjsnATSxy2nm0GhjGkhz4ymJlUvxPCwQlu5ymmvGkfD3KD8UEKxc5eHN1zve7xw6zhWR3dFOW/5piEPY8/FYHIuZchFNsjDHJMDHj5U0FRbMzIFheOwcM/Ry6iOhKWg/98S5l4+W46I6abVImDHH+KMfKNU3x3lQ7mYIYdSKvLpQsBNZcd17JPgzbJtzeWHnp2eJ/zA+2YnRnso28glXGo41JliDX5oCkrMyPyh+K9czURB9+x+xt2DtcbModgQm97m+3wOQuKWjDuSIzN57ILtQbM+KjVD3f8Ur2+v+BmdmH7xrinvz2/yeeEmbAPDt/iqCEl3PCdWmfx/26AuiYa3S0LkQssSBRu/zc2wxqKlEQGMUvR439NaGsPmFbNRpwT/oBfPZ3jhWNeuzJtAmjoL6ozF9EujbuqJKL/lBt+m5e2BdnrVUBhBeLylbe0dwjhJ2veQgkyfBI6qSW9wRpWj8vOelR/IcC0ZC++ix4pcn0oBwS9CYj7H6P8Ph41987JOM2CENUjpxY1M4mQ15Yf/qjSUlOnwE2dkEWH5tIRlZd9knyx9QCBR+1YQcV4DuHZyfOHX1A7qebFvDEQcrfxruxG/xVojPD7e4Io8t1FRL3FBJmFjLOsgZRkL4WWiDMcZxj/RgevbDKiGofiio8xEqqYMo/G95gwa78BQ9CErJA/nW4SnpiWoEI0qr1WWoffyx54KnPrwCC418emJ5uPwuYlD5aejX6ttBOQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199021)(36840700001)(46966006)(40470700004)(26005)(40460700003)(1076003)(7696005)(966005)(47076005)(426003)(336012)(36756003)(36860700001)(40480700001)(83380400001)(2616005)(81166007)(86362001)(82310400005)(356005)(82740400003)(186003)(16526019)(54906003)(110136005)(478600001)(2906002)(8676002)(8936002)(70206006)(70586007)(4326008)(316002)(41300700001)(5660300002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:46:04.2910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff6c1cd-c7bd-4b48-a83f-08db55e19a1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6755
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch fixes warnings with -Wmissing-prototypes:

warning: no previous prototype for 'source_as_str' [-Wmissing-prototypes]
warning: no previous prototype for 'slider_as_str' [-Wmissing-prototypes]

Fixes: a82ebb3d800d ("platform/x86/amd/pmf: Add PMF acpi debug support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305160220.REQc5T2y-lkp@intel.com/
Suggested-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/sps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 0a4d0549ea03..445ff053b4df 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -13,7 +13,7 @@
 static struct amd_pmf_static_slider_granular config_store;
 
 #ifdef CONFIG_AMD_PMF_DEBUG
-const char *slider_as_str(unsigned int state)
+static const char *slider_as_str(unsigned int state)
 {
 	switch (state) {
 	case POWER_MODE_PERFORMANCE:
@@ -27,7 +27,7 @@ const char *slider_as_str(unsigned int state)
 	}
 }
 
-const char *source_as_str(unsigned int state)
+static const char *source_as_str(unsigned int state)
 {
 	switch (state) {
 	case POWER_SOURCE_AC:
-- 
2.25.1

