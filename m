Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5B6C54E94
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Jan 2023 11:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235282AbjAYLcJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 06:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235368AbjAYLb6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 06:31:58 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::626])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298139EF8
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 03:31:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0UItnsmDRx+Rq2+naGaby/sCjW/xVO3KK1thoMHQGrgEwSmJBrBkiUySaXnwR+Qzjh97AExRBigLfnvYwpDe0tN5PbsgVK2nwbdE/XMCHgULMND/SekRi/2pjG/QSYb4tO7EH/T2PSnqo0BrKjxEIQotx/REg9cHZck0U5vWkX7gYTukrjDsD6LvDJ5Wu2CoG8G1+q+BgjGyLVWSs8vgRp0cM+Na+KNRrX9+CAOZyfqkMoHY2LmgCE9CFn/J977DslEcFQYvnoJyS2M9Mwuc/l+F9PsYzLVomK9yn0drFnAKMHlyCjUZnKJ5WJBXUlGrNDHO/gfPaEnS9TMX2lhGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDD9seureiK9yvB9vEXlOU2T/eUDRh8cWQgKtGmpCzo=;
 b=O6Is2sJgmsME8sLaL6BAPEcBNfoSTnQ/whDslRfFPgOPXNpLW74GfRrAle4f9DEZq/hVcXwpwfJzYWUUsql/uCUAgVBu8fnh0Gil9qb1s10jxllY6U344mFonxoJjr0kkKBx8gPrIlHE8oDeI/I94Ci3q8FMuXfsZ60Yq2oQx+18b2sRw74CrKurAjIVBQ8DqNypJ93ON4fV9vU4MovgsOnRe/ih5dxd3vERMccCmG2kxwhhupAK7OfOK30QjaPDHb5wEDOeV9Eu8NfV8bROLRL2H1a1XdYF/9KlPUAA2JrHhFKask0iFqpUD5jzeQnX7/bZAjCU9MYEIZpKa7EZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDD9seureiK9yvB9vEXlOU2T/eUDRh8cWQgKtGmpCzo=;
 b=DhuHZ96iUdYtctNo3s1RYC5y5sbQhZDRxWnKuZgJo1ngZLzxAHD72dwzbQU5U0wxZHIFa/ZQJBVt6x3NVHlwb30o73PllwHONVM60hlzp3YWAjb05cWQj9wZLAdlquUZTkDFFp1HS/PyHfcLC5ucRnFLmEnE+y7Vfg55bl4srZs=
Received: from DS7PR03CA0009.namprd03.prod.outlook.com (2603:10b6:5:3b8::14)
 by SN7PR12MB7417.namprd12.prod.outlook.com (2603:10b6:806:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 11:31:54 +0000
Received: from DS1PEPF0000E62F.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::55) by DS7PR03CA0009.outlook.office365.com
 (2603:10b6:5:3b8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 11:31:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E62F.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Wed, 25 Jan 2023 11:31:54 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 05:31:52 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/4] platform/x86/amd: pmc: Write dummy postcode into the STB DRAM
Date:   Wed, 25 Jan 2023 17:01:25 +0530
Message-ID: <20230125113127.3862898-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E62F:EE_|SN7PR12MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: eb87aa88-1d47-4c53-e0c2-08dafec7c2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0rcBEZ7k/q6aDypoMjcBmlHNOwDDKUjv2Quv2IL3+lIHuZ4fJOrsD8EiVJXA5zcHUP8nKC+obirhhLoQSFKzVg4GvS94r+JKpnziaMmv31a0r9ubP0pXYrAsSp639j08k2D/Dfoy/WipasWmKKpZ/X8UdNtQEy8O5VpJm9BbVZ8uZ5J5RQx3xwtuDbZNDGFb2LXE5/Q/XCyM7rNkRqfXINWmfuKleO1Q5iW43EGl8TmxNb44niVpTgFiOZLIxbYnvlqpfzE0nsAZrU8ceIgkSvkXGrC6O8jFRNmG/fIrC4kmrI3JyhscDA4ay7IutVPFv/uTz8kuuC/JJo6kuxEURiRfq8GQv9cDbCKTqSdWOaHZBgWllDYYPv6J3WzaUY2zRDRZZeJzkhXLPQIgMYCQIW8vJQGIOwwy+5i+yBfaXHm2SiqXeBzQ7DLLWhjiQOhor7mq9GIa+11NA/ieP5gmrQDWwt2ohGnHeWz6lqeu9bnzrY5sUw2kKpv/lmcz1+D9hKzayc5f8osBQft8ncCF0DiQgojTA8ypx4ikiiwoUF0eKKB1hoK7637pGCzFWzCGpx9J/32TFdme7oZeokVmNPqLSzgkvWkYnUz9jfZ+EDYBuM5HebpmHNan6gQYLQ3hLc5HTpbqQo6apesI6N92CKvi3C1rmyoFiKJErJry4IJRzssMj7blPDUd3AMNC+vX5GEL2kEfZB0R7d64y6AESVrsikDxExH4TwE4d6Ojyes=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199018)(36840700001)(40470700004)(46966006)(82740400003)(36756003)(47076005)(40480700001)(2616005)(2906002)(4326008)(70206006)(8936002)(5660300002)(83380400001)(70586007)(36860700001)(8676002)(426003)(1076003)(7696005)(82310400005)(110136005)(316002)(41300700001)(81166007)(356005)(86362001)(40460700003)(478600001)(26005)(16526019)(6666004)(186003)(336012)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 11:31:54.4514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb87aa88-1d47-4c53-e0c2-08dafec7c2bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E62F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7417
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Based on the recommendation from the PMFW team in order to get the
recent telemetry data present on the STB DRAM the driver is required
to send one dummy write to the STB buffer, so it internally triggers
the PMFW to emit the latest telemetry data in the STB DRAM region.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 01632e6b7820..0dd9fb576f09 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -43,6 +43,7 @@
 #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
 #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
 #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
+#define AMD_PMC_STB_DUMMY_PC		0xC6000007
 
 /* STB S2D(Spill to DRAM) has different message port offset */
 #define STB_SPILL_TO_DRAM		0xBE
@@ -250,6 +251,11 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	u32 *buf, fsize, num_samples, stb_rdptr_offset = 0;
 	int ret;
 
+	/* Write dummy postcode while reading the STB buffer */
+	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
+	if (ret)
+		dev_err(dev->dev, "error writing to STB: %d\n", ret);
+
 	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-- 
2.25.1

