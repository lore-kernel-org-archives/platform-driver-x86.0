Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0619AE95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 14:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234554AbjJIOsf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbjJIOse (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 10:48:34 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2089.outbound.protection.outlook.com [40.107.101.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50107A3
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 07:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjvGO2eJ+tpzQtxA6Dw10LNplkRod0QebumsAZPfT3AhHl+b834jOpKFQ5uqi5PktV5qnFsZkKC7EvYue3mDl9NZBqQKEpB9Ea8HrjQMaDlwpj7gOEeUTjDaHrl/2wY86vPgE3Xi2nC8gBx36D6XmJqdPZezqHr2e2FndBu2ng6tsUbNvKZsD2Hoz12z+k8o5OAwdQfbFUTZBMPqEf7mU8LigoHXrVqzaFtBdk8gfrI4OVho3N2VGd/hGvnMH8EoGH1vHO/sxYUuG5ApQlomYpSz2lA7GpulCEPCX+NoMmk0LFeoCD1vsNZJ/yN7PCqxoq1rCLpmEh6FJ9x+Lcw8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5En1rATDA02SvjLbH9S+hKE+bFF1SpRQCOIR4LcFnY=;
 b=Wm1RsHmqwV82qseXeyU5mFqmZ8sBdo2vqaSyXFcwxDmDpfU/VkaZZdhtbVkd4A3EWrmruGPvbSIPBPRgsDMklKA6D7v4OHmu0o13/rgM6pZK4tD/N7jO/2H2scNSlgwPAgb6/LQ2w6BAxM3qk/+5/Q9WDIXD6kE7GaTEPW9V3olXrKYboEqB5aesNuwDgVZ3GxP/VwFTDNJyTGdd1HciMCinNfPoUkyby27OiQD2d3FW5G7B4HrRboqf9V2HTaYuuemVrXntgnfButtEsiO59nJ4PDm5GfBbvNw0wSx/IBQPz8u2TUjO2V4ltAEAmeR/TE7cSRIllcQoJgJutfoAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5En1rATDA02SvjLbH9S+hKE+bFF1SpRQCOIR4LcFnY=;
 b=ALsBUaF7jEmiQeW8Iz0KQXlILl7xjCecr0Kko6F+cDvNcpihXOEQWwI+YAHlrvyiJ0JpFc4xpZxXsK3o+4GzbdB02Tf9HjL+7qNHSqPjp1bd00oCdgO3X6NGmM4s+sJEQONCUk8PTkfkAvyiNXz6F/SdFMcVqHzXHbuX1YCNhBE=
Received: from DM5PR08CA0036.namprd08.prod.outlook.com (2603:10b6:4:60::25) by
 SJ2PR12MB8927.namprd12.prod.outlook.com (2603:10b6:a03:547::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Mon, 9 Oct 2023 14:48:31 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::96) by DM5PR08CA0036.outlook.office365.com
 (2603:10b6:4:60::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37 via Frontend
 Transport; Mon, 9 Oct 2023 14:48:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.21 via Frontend Transport; Mon, 9 Oct 2023 14:48:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 09:48:27 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/pmc: Fix fetching DRAM size mechanism
Date:   Mon, 9 Oct 2023 20:17:47 +0530
Message-ID: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|SJ2PR12MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: aadd29ba-7156-4500-dd47-08dbc8d6cdef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: srhPaznExvN1KbQwy4MQt8HKmAmBm8BvybEN6ayM13y++OjKKHEKxf/8mi7Zv+spqs+D0yOztKVpP3x/LMmQl4hxfkX6RTBmQmsIerTr/NoVhm/c2cJsRch6h7/xOGQhnloHoDIakFeq95/j81xKRVZ7a6oSfEYUD5qYe365YUz9Px63+k+FUcCEfZ4oSprRxCQGT4n4nhqtuU+MiMeIiXh8+2IAcnVl5UzLPoe/WWWezxlSl5DjdlJNpJ1H8stm80Te3ybn8/nuejGDCtOaREVyFW/OxKtkE1bTCxZjWRo/iTPwVWG5lIQuCWLwba3OVbDEi4YImtUUiXsOzmACaHZ4iPYdoeRRJ2h7MxGfTiaZk+S4TNyRWTB/NycY1eigBnm8fDF42FTKClLWiQixORujqqg5OQ3nujCaOnIK/9pKhIPCNbQUXJDDSgOjg+k/sayBs4vA/ZgM/lMw6/iRM8k+Bhwvv8YqnUAb/ybX38HZ6kgqHMar7rH+Kw8P/SwGwZFvuTXXeJQMItv1/msMYwLIbhKOvsWgGJuZTrPBciA02pO9L0jCAOXjS2ntsKUq80j0i+mEzBVQQM77VCfynzv8p/IwiqA6naGqjKpBE8UOAN7UNHqqfiKNBnssXweh9WoLSZ9A1LOAYE7AR2Ak97ENuqrP+3E0jErCfRj3FUUIvk50LG+NjBOL8NNzoPTKPzWxcS/ZNHesZ0pTAxgDuwO3GKhUF87Xp4YMd5cVSIhdF1P6QzRd9WcIjpORvOvp8d0gSaJ7/i2CvItW1J1+hg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(82310400011)(451199024)(186009)(1800799009)(64100799003)(40470700004)(46966006)(36840700001)(7696005)(1076003)(2616005)(41300700001)(316002)(478600001)(336012)(426003)(26005)(83380400001)(47076005)(2906002)(70586007)(110136005)(5660300002)(54906003)(70206006)(4326008)(8676002)(8936002)(16526019)(40460700003)(82740400003)(36860700001)(356005)(36756003)(40480700001)(81166007)(86362001)(6666004)(66899024)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 14:48:30.5725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aadd29ba-7156-4500-dd47-08dbc8d6cdef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8927
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

amd_pmc_get_dram_size() is used to get the DRAM size information. But in
the current code, mailbox command to get the DRAM size info is sent based
on the values of dev->major and dev->minor.

But dev->major and dev->minor will have either junk or zero assigned to
them until at least once a call to amd_pmc_get_smu_version() is made which
ideally populates dev->major and dev->minor.

Add a missing amd_pmc_get_smu_version() call to amd_pmc_get_dram_size().

Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
based on review-ilpo, can be added on top of recent stb changes

 drivers/platform/x86/amd/pmc/pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 1424c03c1f03..92adf4523736 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -981,6 +981,10 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
 {
 	int ret;
 
+	ret = amd_pmc_get_smu_version(dev);
+	if (ret)
+		return ret;
+
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_YC:
 		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
-- 
2.25.1

