Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531EBC636D3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Feb 2023 15:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjBFPJx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Feb 2023 10:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjBFPJw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2023 10:09:52 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3AA59F4
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Feb 2023 07:09:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7DkJHUYvGbxFpONIWkdiaVFmiExciAwxn30Q1LOEQakC1yTCgeKaS24UVxoRMvwVHNcuaTfyvTc5Y9b8jBe2+mkXRkFoC9ynEuYq4wRmXKQKvPRMje9530zX5vEq30hHpHXFne3eNDl1+yvDfCwcmPeT1kC8h/rH6vdnyRVChJMZTx/P6L4FW3juuoyQFcD1gZdimQt9yozRgPvOaNh2OGgC/nvbLOtfLaKi3AH94o82tFgyMz78sECvUQWhV0/vG1WCz+kxloV6VUc8U5G+xOvrkJK9bEv/MN3v8RRDL+iNFPbDN50Bnl5MHb4DJfeZq4TfeTH3Fy5gxebeEiITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENxmEu+WXRCE8iGSgc2SyBg79SpcmSVlmpF63Tf/mMQ=;
 b=UPN+ar/uMzSUsyPUxl/xEIpu09LDAa54ML/tBTPDoHRWVfaHMcJjAgtJ3QFaMxtIhlPzcBg0Tx5JOf2vuJaLMFZYvm6bs5QD8UONryMTy1qgY6Dd+7STXpgmhHDAq7J7GXUW98uHMu3YF2xD6rlcE2dluh6V4lUc651h1Hx20pAFSwrCC23Bq4LDq6emU3qy3d9WyUCG8Y/pbzbV1RncphUVZQLpz/obQGl+WS7iP1Q/V1ygWTn8evFu54PQbN5p5/X5wxF6Im+ZM2mI3u07vWTZnkV4hLWqQBKeID8jsvle7qKicN+oaoEQ2CBPgUKwZbOCudfsvZW3stjw9UeqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENxmEu+WXRCE8iGSgc2SyBg79SpcmSVlmpF63Tf/mMQ=;
 b=FrnxdmEYfTGc9INilQ6VKsUdrYtu0DhSr7nUPMw+ehqfGZkt4RBvfJXkctdKoYBygLUhOgrcK41Htib1d03oBs5nI/JoGDrSOGy2dUaEyI4pRAWNzVxXGcFMNw1jorsEtPZxrtNHS8/lAO9uEznqUpeTkv3oStDvP3kV0TqKAYY=
Received: from MW3PR05CA0019.namprd05.prod.outlook.com (2603:10b6:303:2b::24)
 by MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 15:09:29 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::57) by MW3PR05CA0019.outlook.office365.com
 (2603:10b6:303:2b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.15 via Frontend
 Transport; Mon, 6 Feb 2023 15:09:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.25 via Frontend Transport; Mon, 6 Feb 2023 15:09:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 6 Feb
 2023 09:09:25 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/4] platform/x86/amd: pmc: Write dummy postcode into the STB DRAM
Date:   Mon, 6 Feb 2023 20:38:53 +0530
Message-ID: <20230206150855.1938810-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206150855.1938810-1-Shyam-sundar.S-k@amd.com>
References: <20230206150855.1938810-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT043:EE_|MN0PR12MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d6991d-0f84-4554-0e91-08db0854245e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cGkkGgGIOtMc8BaSoMABaR+8i5/+ea0jdq3expgc4h3BoK9lBZC9ye5ptaSviEYVjhq27YkYqfcanqeHzcsnhFIfe/5fwAMwwNNiklr65JvEx1mONIQhBYcfH5JsF8zHUueKBAjFPNWQ0sDsRO3nEnNGPVXHmxn0jYFdztAtBEUyOcCsHqtHEfu9wLNjBQIyjWrQgG2EuNXkDfNH2M1A6K0amGcMv1nj32/nyrjM7byO9H0ys6nHfnU1ukAhTJ5+L9AALcCIKvrMUQnbfI6qMbeny5ZnTG7O33uxFa/pVl7WG63F6dw+c52nWlxN4C03NlXv2KTdmQBXYr/SRHafNJR6uYbZ5BvW8ggjA8i1fNsrgkj/ax4M6g/osb6adltMnzeROVGfboA8o+YsivnJGHkEWjKUK/A+QW2AavVmPp4Nf0Hl9QAm2Qz6E9nohnk41VbUiDpJ62ZYTQnwR/fBSUIMXWr7RTBHM+Ifbi9Nv/JGKQS8DiR4w8n8D1V6qCGZUpWRTj5CIF6R76HnESas/XAmeEhOhISjcTMju1XzI+5qqfk/owuczcvfydcn4Ja0UgtkSA5XHi7K4muMKC4SPptUV4Gru07tnDv9TxGz9GoPpH11J0dwotSP5YbAaSPXcyd8FgfFZ4NZ3lDXn5sBNNz53ErXUTI2iSoLV+WErBn7PzVZs5dKyNeGOw16O10kUcUuSfqhr+HMvj/pzsaBIQmq5nTfvaUi7KTKjf9NP4E=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(41300700001)(478600001)(6666004)(8676002)(4326008)(5660300002)(7696005)(8936002)(316002)(70586007)(40460700003)(54906003)(86362001)(110136005)(70206006)(82310400005)(47076005)(336012)(426003)(83380400001)(2906002)(16526019)(186003)(26005)(1076003)(2616005)(40480700001)(356005)(36756003)(36860700001)(82740400003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 15:09:28.1913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d6991d-0f84-4554-0e91-08db0854245e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319
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
index 23440f70d3df..27774020597c 100644
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

