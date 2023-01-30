Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD79C54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 16:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236454AbjA3Qto (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 11:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236494AbjA3Qtn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 11:49:43 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2045.outbound.protection.outlook.com [40.107.212.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457523CE36
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 08:49:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MH1RawyCPpeI78L76bhxDqLojsxy966aijjkloN/FvgHNPAEVWbaj+kPUJB+idxm2aXWeRxLyDQBVvtE1smwGqmVqHtChni5UkjRxeY8hAiFEagxvI0CYl1+BndYlOtMntM/1AX70O0BTKC9B5IXacUdyN6p/8jpVLi5aCvJ+9U3Zi1urttGOlydvOoqpdTFTu5Ic7i3WYXq/1wuj5WKdGGNK2kNCacjzFngHIfHimP9nRZV9n9XX/fc2TnYCiCc7kU6a3yiJ7VpC6lQfVzbvU5VX7J2+iXkwT/I/GU9/+pvyaFI74P5NyYkyMo6mYpockehNDgccDwcYFZ2QMCzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXKcYeq/C6+k88yHRt7RR81nRFIoeF3UaX7kmaWFk+s=;
 b=hmuF+hiFZphMfIIgaX/ck5PHdw8W89alBnd7A02oaxDpoDdE9duGXvb48Bd85SrVQmtcyHQJiUzgV5Z/yQyyyjhrqz1NihMJCNZoiv1ko2CpCjLjV0ypUS9zLCcYV/NtbtnfeHM311VczSWf5VGIEXke6A6ykAkNNjDhUafvuiSRutM5D+rjgYCILptCreNR102cTqQheqG+tAODTI2wVtcY/KdiksonxDAA2gY/UdCGP1/ENKZ/gSmSiPhMvhEhDIjWGrI4rbw+ThEsm8EXnKT1iYCZM7CEbj3vMBcb4HI1XfpsvpyTgXkYrp1/vIe2S7Vw3OHy2kCP1KCnDhvJ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXKcYeq/C6+k88yHRt7RR81nRFIoeF3UaX7kmaWFk+s=;
 b=wUeI21yrkoSRYzuj5MZ9QLNAa75KMzSOWeouv7KaHROwc5WoLqusg6PFZlwzk1cvqhWBrsohRLomh6DIguD5Ip30UhVWgz0VXP4lueZZ92gbiF0mMy1E8nWqnb/iexjJNCmBpibbbK2x0cIfvdQKPYAbfevvdq/9fjXhZSLZACY=
Received: from CY5PR15CA0217.namprd15.prod.outlook.com (2603:10b6:930:88::6)
 by BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 16:49:39 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:88:cafe::34) by CY5PR15CA0217.outlook.office365.com
 (2603:10b6:930:88::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 16:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.17 via Frontend Transport; Mon, 30 Jan 2023 16:49:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 10:49:36 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/4] platform/x86/amd: pmc: Write dummy postcode into the STB DRAM
Date:   Mon, 30 Jan 2023 22:18:53 +0530
Message-ID: <20230130164855.168437-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130164855.168437-1-Shyam-sundar.S-k@amd.com>
References: <20230130164855.168437-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|BL1PR12MB5851:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc968b4-59fe-4868-d981-08db02e1fa19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gsXWnIvATMKoLYMdldRD+usD2pjSzc4Fnji6EDuQb91dnxP7LdgCAxgnv2fkjreVOlLdi8i+JanWKPww/zyc861IwfeedQ0PoUdQHfeNgxSo815BiKx3k+w42EKQPNKaJgTVMFZRh65ywryoQ2imWvIIh8CaotXoE4bYjkkW0UVxgg7j2MtXqujwT9dk4z4tpF1KU1RKOSEdzOxgF+wtiK5PYfklKBToekwQtpiFP79927vnJdTHEzsj07cZgrWJnI70A6ZgXkW0kLYVAmL2eKzIvGeHf8ArCb308kyTksgPeAI6uDWcTatY9wkcSVJttlfbc2Y2Kd9Mb8DVV1eK23Igc6biwNU9fuzbbiYPFP9pHFbFvI2Gy+PK0ZeoVV7jz0M+OibtMaqfA33wU/ylhl4frWgO+dfZy1mvOWCKDAASkyfSViUHJzC2iM+gzVJKgbaZ66AMbkiS3PUkhvfXOakX3TOSUEUngJjQFzn1ur9qHUKsf4Jnwhg8k9d3zvle8SPMefQHZu7GjP/9EFk1jNBZNh5LzPOTM2M0bBaOmUB8OAUtOj0eT/VecpeTuwbqnMiHJYfEwoyfrG4JxC5W1BtBUqOsF+n5tNjhgiav5Qi56V+vfACMB7dA+ioyB0iH4MIdSdsD9lCvtvvCnLCj8vNRhmsSy58gn3hECYRptN+lv7LrJMF/2+peQl1WFlcQ7BJ+xWEJznIDoR3/l4+fHVjPgPim9Xlxk7WzOOUm2d0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199018)(36840700001)(46966006)(40470700004)(83380400001)(2616005)(336012)(426003)(47076005)(86362001)(82740400003)(82310400005)(356005)(81166007)(2906002)(7696005)(40460700003)(36756003)(36860700001)(1076003)(26005)(186003)(478600001)(16526019)(6666004)(40480700001)(110136005)(8676002)(8936002)(41300700001)(4326008)(54906003)(5660300002)(70206006)(316002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 16:49:38.8858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc968b4-59fe-4868-d981-08db02e1fa19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5851
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Based on the recommendation from the PMFW team in order to get the
recent telemetry data present on the STB DRAM the driver is required
to send one dummy write to the STB buffer, so it internally triggers
the PMFW to emit the latest telemetry data in the STB DRAM region.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index b0f98a201a81..4073ad9fe63a 100644
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

