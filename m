Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626CDC6FD19
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 09:53:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjCJJxx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Mar 2023 04:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbjCJJxv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2023 04:53:51 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2057.outbound.protection.outlook.com [40.107.100.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DC9A02A4
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 01:53:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhyKjjvPi2NAxUBACsd0BOApiMKJGFhWroQ1oBolltRAKuSb9UL4VJKuUpH/RE6CFveKN9dVa28jQQ61pF1qdqhQORyMUiJqbr0/lXlAhmi5/aoaadE6KDdHVnUxrJFcDCw56kFM9VmY+jy/V2l3Pf8YTFdh+N6u9gBPiDviAiPb37WvASDdO7Bw4v+TIy+5YZ2vjuVsikCCgtHlE3cgxl+SCCCRYuBaz/W/f+XPmsmf8gxjH9s5NdSmVr8iNvTAIfJ7ORgBoPk/6aCt60JHH4a2J369hW01sa6Op26aM4GhjADk84s5bv8o1Lvqo5SzN44jd2Lyiz3c4NtFo3Aecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMNs22gNDMp3tw9PCEIS31eSAa748+M5/igVJXIeYYU=;
 b=GdexpFl4vnMXoVyQBUWC10ezQlHCg8czrcpcKMl+iue5CRzsZTSJy0+Za+UhgkGNv0ang5g5cAhm940PwVSqwU8tPeeDI1PCGRof0YlbW25A9TNGVE267nINShF6JUBCH9TE5IOL0Dq3Uf+9jHge+kp/2t+EyDgqu5i3tY4Hw3hab2xyqBceyR9nKUeI3FFAHLKn+Q3yfdQ0UqIouTVHcroM0my2xT1/9BRqM7s+U2dAPOUlW+LIAIkX7VyHVY+c1G+OW3ZFHDXeKywUIrA0vdiVCZs1x9+Gh5MqZ1dZQHMbLxU7eoCr1RjB2p5uXoNlZqPPDnRrV4lTS+mZikB93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMNs22gNDMp3tw9PCEIS31eSAa748+M5/igVJXIeYYU=;
 b=Hiqu6jXTO1ISQDnUpWx+2taU4WgszpbB6M1EnQYACEr3hXEzn5Z17JyxyJ533DnC87jm+r92G9UXGzgOJFTWBmeZy0V2uRmrCJV5o3oAw1xePUm/f6qW+eZtDt07/koMDFfo1vUuiT/GgfcRYhbPm8CEw/JtAVf6mWSlWk0W2+s=
Received: from DM6PR04CA0021.namprd04.prod.outlook.com (2603:10b6:5:334::26)
 by IA1PR12MB6236.namprd12.prod.outlook.com (2603:10b6:208:3e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 09:53:37 +0000
Received: from DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::eb) by DM6PR04CA0021.outlook.office365.com
 (2603:10b6:5:334::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20 via Frontend
 Transport; Fri, 10 Mar 2023 09:53:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT094.mail.protection.outlook.com (10.13.172.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.20 via Frontend Transport; Fri, 10 Mar 2023 09:53:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 03:53:32 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>,
        Robert Swiecki <robert@swiecki.net>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH] platform/x86/amd: pmc: decouple CONFIG_SUSPEND from AMD STB API usage
Date:   Fri, 10 Mar 2023 15:23:01 +0530
Message-ID: <20230310095301.1596369-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT094:EE_|IA1PR12MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 99cdc150-5e34-47a7-222e-08db214d51f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vX6KoJnKEQl7iEAlJFyYwcbFEunXQySVSVnvl8C2soqEjJLx9Cz5r2M0zjRQq6oRojEYKVp5AEoZqEp5YRhr3MbQaVQ48dptJOC5PoFJDsRDAJSQ3wRhNeh9PgzyhGzC3uizUnKiKAn4es5bTsOpJusg4+/2TQUQmjDnbZUTta8eS13vXBo2bDOKaj9OA1gqn9sDE87dveNTe2XkveyTEpYwmQ+r5wGUQLdQt5VJl+fCrEb8OKftS6TdUqhj2CGd8c67F4MPoou1rS5anFDWLWQmRkxSqFs5WLt3F2n3nedXpnXFXu6JN6PsV/nAQ+Fbwan4KpRqA85HNzsuTQLRaPKCazU/9PEgL2QVOxe514mmV3LYewU9SNFrBs7W644szb9bVmQhDzOb0YY5qIZXmZUCLZ7Lr68KCqs88s4iTgn85AfpPSwUkG0Hk37MnhLjqLmepWyUxM1odXqFXuQF2OAhBRPdO0gBTYkUsFbIeoj4xpNiHgEY7J9PkEfzHlONH1fVU83aYpMGfpiufwOpZh7vxiKvJ3KaZymDvxsIjgthCmtl+vc943Dn+M/18bbvcAcOSEEF7CzSLQ+NJwTN/nVAN3X/soflh4gDcyZ3nQQVHU4qkF2+1CtlOlOYtuo6bwuV9Di+M5cbksIYQksQ2kp2ccVUo8+kFz4KmTfIGrZOaCnyIT7w3mJqOk7j+pMcn5WRHCF5haaDiX2RnzlkNN1HIpTm6AqrJUH/c2jVLjo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(2906002)(5660300002)(26005)(8936002)(36756003)(70586007)(70206006)(4326008)(8676002)(110136005)(40460700003)(316002)(41300700001)(356005)(40480700001)(86362001)(7696005)(478600001)(54906003)(966005)(36860700001)(81166007)(6666004)(1076003)(82740400003)(16526019)(186003)(336012)(2616005)(82310400005)(426003)(47076005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 09:53:37.3690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cdc150-5e34-47a7-222e-08db214d51f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6236
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The initial introduction of AMD STB was limited to only suspend/resume
use cases, but the need for STB APIs like amd_pmc_write_stb() have grown
overtime and guarding it with CONFIG_SUSPEND seems to be incorrect.

Also, with the recent commit, it seems to create a build failure where
CONFIG_SUSPEND is not enabled. Remove the association of CONFIG_SUSPEND
with STB APIs altogether.

Cc: Sanket Goswami <Sanket.Goswami@amd.com>
Fixes: b0d4bb973539 ("platform/x86/amd: pmc: Write dummy postcode into the STB DRAM")
Reported-by: Robert Swiecki <robert@swiecki.net>
Link: https://lore.kernel.org/platform-driver-x86/20230309225016.2e8cd211@gandalf.local.home/T/#t
Reported-by: Steven Rostedt <rostedt@goodmis.org>
Link: https://lore.kernel.org/platform-driver-x86/20230309225016.2e8cd211@gandalf.local.home/T/#t
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index ab05b9ee6655..8db608e2c1ea 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -171,9 +171,7 @@ MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
 static struct amd_pmc_dev pmc;
 static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
 static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
-#ifdef CONFIG_SUSPEND
 static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
-#endif
 
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
 {
@@ -905,7 +903,6 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	return 0;
 }
 
-#ifdef CONFIG_SUSPEND
 static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
 {
 	int err;
@@ -926,7 +923,6 @@ static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
 
 	return 0;
 }
-#endif
 
 static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
 {
-- 
2.25.1

