Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D0BE95A8E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 09:47:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345822AbjJIJrc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345608AbjJIJrb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 05:47:31 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DBD94
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 02:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q80bnotolkQVoQgneqel4AjHG9MERBFT7WP/2Yaxgsel7o9PzBWZUZK96Z6EfENydkoFRUFDLPDKRBKzE9NHbsEaV1SWs+V5C9rRHCuudoQeVNfI/HPVmORxcucWiX03W+G9G1V3sLYW8lIWI89Vwg1UZShW2b4qMvqTO2IOG8cR8OXDLuW5YPBqQa+b92bKdGC5Tl1WfMPd8+QOS44Vum9ijdG9QPU6ItP9ZjICLhdeWlHiJF9a9CQYqlZM0rzIBXqsiVljpU48I8Tg/yCyzt09GvWWrtAbgIqgL9hjc857sTdKerVGy8GPOntBEMuAAbQYNDero+Hwy2/wouOcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWOYDgrUbR0TbWJeT3UuAY6+6DsXTd9NCwbyZxeOglc=;
 b=Jarts/ePkLS+Jl7U5/reISJyW4JZbCpHbA7SqYZrdnajGvBCru7ZNQzLdboWG4gw1qEXqw/AaYFdsaDsx51hl/gZEX05FGrafedEXOzOARm8rNYJ3MNs6EtREeEO18OQWsCqMLmQa/lKbzY9+gUj6KQmn35tJYWE5shmwKo59W8KfJgghVF6h4s9XeBHat2JDBrZNYrgOhNhXO/SwJgkyG4lf7yekb6PtAAu+/LdE5rgjqzfz/Lxb3678zqNxhdPU0BoKgdlQISCA+6QnfSILJj4epr5R5usY9a8a4BieDgRAX7sDdHYXc7IcwWgKvAe3xuKY97YRFtWf44ggefFtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWOYDgrUbR0TbWJeT3UuAY6+6DsXTd9NCwbyZxeOglc=;
 b=u3NL4DmFE9keyFUMRoBMEPFNe3JU1skoQgyTfuQAiQaCVCqc/2sU5SQkvNOOzEut1x+AKOrz30CMNs3GN5c1AZkNkHoqV8Tm9ee1qtwuTtmhTiP9umK+ktSNKoPKhVpfmyWLAG9ztYph21/oiF+eM1HlnimidExgM99CukBxu50=
Received: from PH0PR07CA0026.namprd07.prod.outlook.com (2603:10b6:510:5::31)
 by PH0PR12MB5419.namprd12.prod.outlook.com (2603:10b6:510:e9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 09:47:25 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::e4) by PH0PR07CA0026.outlook.office365.com
 (2603:10b6:510:5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Mon, 9 Oct 2023 09:47:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 09:47:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 04:47:17 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 2/4] platform/x86/amd/pmc: Handle overflow cases where the num_samples range is higher
Date:   Mon, 9 Oct 2023 15:15:37 +0530
Message-ID: <20231009094539.6746-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009094539.6746-1-Shyam-sundar.S-k@amd.com>
References: <20231009094539.6746-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|PH0PR12MB5419:EE_
X-MS-Office365-Filtering-Correlation-Id: d53092fe-98c6-4e66-67b5-08dbc8acbe66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Q0OgW+3C3ILi8Ql+vTuL82JeWP7+bRdoccIkSgMC71XXkmbICTmQWKChE4aj7oKQVKKtcXRXJFcM2VPquV21wuaoIRJwELpFUeNxHm8VvcqA83nBsFDOeaai5oaOdNMYOk68BbnC1JF6wiGMmXbDtfl6oCTPeTLVb1jUP6H7Ei0CmPrYSnbGtZYimeY8sx1Lq4lAYSarb+w33so0c0kihhLCQKjUW8NCx6x1Br0q/BfyJP6RFIxS1dvnqiW/hd4CzaXyDwGpEW0tWAEPWt+iYGvh4G6tkGgp0M1PP6w/S8zl7t3EowuRqjpfsAd7aYYXOGB/1k7SGx5JcvASnuSJMHM+3fotw74pz97XVDN7sXgmjzMx54MJM2U+kows4LqtILfjwhgPHzRbN3NLBWDGOhEW5mp7L9BH9wxmovbfUP7GbqzkmQ606v5Eg1BJVFOizXLI/nS/n+gk0UDI9A9bkSY1aCf/FwFGyFfOHuuUFfbWrEUyc+AHWpgaxBzBdnCOpqrLJg2lrqGolSgfLfqnZqfIQMw2trVnNBiXLswGvcDfrqS5r7rqea6HypHr8bkamaoN1uATip11oTZ5OHALiRovoEj0O301J0iEc84t0V6Kpx8JEj0XyLAwi1m/pkVlWMjGpq4b+6q+MiBTiDqXkUPL5IvjJ368BA8gJT5xQOEqYzbS4uUtAFHTRkIx/Cae+9dkUsP+VvtMtnbtarjHkEpd6AN5d4jLYaBENNllM169m+Dik2G6UMGIc/A/Z/x
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(186009)(82310400011)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(83380400001)(1076003)(2616005)(336012)(426003)(26005)(16526019)(47076005)(70206006)(36860700001)(110136005)(70586007)(316002)(54906003)(8936002)(8676002)(4326008)(41300700001)(5660300002)(7696005)(6666004)(2906002)(478600001)(82740400003)(36756003)(356005)(81166007)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 09:47:25.6744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d53092fe-98c6-4e66-67b5-08dbc8acbe66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5419
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In amd_pmc_stb_debugfs_open_v2(), the stb buffer is created based on the
num_samples and the read/write pointer offset. This holds good when the
num_samples reported by PMFW is less than S2D_TELEMETRY_BYTES_MAX; where
the stb buffer gets filled from 0th position until
S2D_TELEMETRY_BYTES_MAX - 1 based on the read/write pointer offset.

But when the num_samples exceeds the S2D_TELEMETRY_BYTES_MAX, the current
code does not handle it well as it does not account for the cases where
the stb buffer has to filled up as a circular buffer.

Handle this scenario into two cases, where first memcpy will have the
samples from location:
(num_samples % S2D_TELEMETRY_BYTES_MAX) - (S2D_TELEMETRY_BYTES_MAX - 1)
and next memcpy will have the newest ones i.e.
0 - (num_samples % S2D_TELEMETRY_BYTES_MAX - 1)

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v4->v5:
 - Fix exisiting code problems when reading stb buffer as a circular data
 - based on review-ilpo branch

v3->v4:
 - Update code branches and commit-msg as per Ilpo's remark.

v2->v3:
 - no change

v1->v2:
 - rebase to 'review-hans' branch
 - drop 2/4 of v1
   (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)

 drivers/platform/x86/amd/pmc/pmc.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index e00d69801369..67daa655cc6a 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -271,18 +271,27 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 
 	/* Start capturing data from the last push location */
 	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
-		fsize  = S2D_TELEMETRY_BYTES_MAX;
-		stb_rdptr_offset = num_samples - fsize;
+		/* First read oldest data starting 1 behind last write till end of ringbuffer */
+		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
+		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
+
+		flex_arr = kzalloc(struct_size(flex_arr, data, S2D_TELEMETRY_BYTES_MAX),
+				   GFP_KERNEL);
+		if (!flex_arr)
+			return -ENOMEM;
+
+		memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
+		/* Second copy the newer samples from offset 0 - last write */
+		memcpy_fromio(flex_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
 	} else {
 		fsize = num_samples;
-		stb_rdptr_offset = 0;
-	}
+		flex_arr = kzalloc(struct_size(flex_arr, data, num_samples), GFP_KERNEL);
+		if (!flex_arr)
+			return -ENOMEM;
 
-	flex_arr = kzalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
-	if (!flex_arr)
-		return -ENOMEM;
+		memcpy_fromio(flex_arr->data, dev->stb_virt_addr, num_samples);
+	}
 
-	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
 	flex_arr->size = fsize;
 	filp->private_data = flex_arr->data;
 
-- 
2.25.1

