Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5731E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 14:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376937AbjJIONW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376431AbjJIONW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 10:13:22 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BC19C
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 07:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBNEfJ73HNRqkdtx8E8ulD+/jT7In/kthNYYgDjXiuixWCPCW9HRCfWPHnjaGx0I/w86sEXv4XL2884SnfS4Jrk9Z6eZeYeKBFEukUnw2LBVgwjyfVKMdU+yptyFkljUA81WjPeNs6bI3fsjZWFjBGdt3d8rDssLvZvZccKoRdP5c7qN5eSNGAMLfNfHE5qPJf21uAcw0L5P82bZfwtZSJHj7zokS3oWaP2ymJ/Go/qXmYAtFfdIfLSKZjCZFx6Hy5ScK7NgG/k5vzDBVZLA4oSqER8589jBmmsux9YvauSHWqCCa6e2IiJX501vKfu+zLBHiY/Z2pPOXK44yMd0+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yHDNUOf0my9eIHZScH8PgXGG0xnhcos/KKnUb2mvyE=;
 b=m8MPT0drfv2t8mAzOlBrYUiV1CCvQNrwfaQYaZTpcTPHJkXkKFmjtV0PHW6HDB9yFjltW/pWxVhLXf2kQ+h7Ojuja/SSEhx6f2zOzl/W0Ys4hzU88+vHMs1ZRUsInA9NOBsWiJ2oTHVCoobokTnSWVO6bbr3SJeOp3WDGcsSsgKz0Je8gUOqFQgg/w0K9H8Zr/8yAIrzYgEUWp6w37lIYn8Qczqe+bI/+f15+1KSIFhGXDlyt/ey7QAK/9/l7VULT3VqgkYDJoMX3EDF2pV/TtmFGwPM9CtjWuOUbyXE6egDtKThv0fspp3bioMaJFxOIYvO5EsLUSTLrCzML5skoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yHDNUOf0my9eIHZScH8PgXGG0xnhcos/KKnUb2mvyE=;
 b=sG7qi5NmBHd7xznzHMx1Zsive450+1HZwW5PrnfV5mJs8y9ubGE0QWowNY/JiB9/2jz6N9lGePXo68jIMHjcN4t8q4S1jx4MtCG9on79kCLobYAPGaCACbETdESoEFQfKb3uorBsXUsz97hkp4gVrQc7ENkPLg5nvbj4q+IGkAo=
Received: from CY5PR15CA0001.namprd15.prod.outlook.com (2603:10b6:930:14::8)
 by CH3PR12MB7644.namprd12.prod.outlook.com (2603:10b6:610:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 14:13:18 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:930:14:cafe::d6) by CY5PR15CA0001.outlook.office365.com
 (2603:10b6:930:14::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Mon, 9 Oct 2023 14:13:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Mon, 9 Oct 2023 14:13:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 09:13:15 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 1/3] platform/x86/amd/pmc: Use flex array when calling amd_pmc_stb_debugfs_open_v2()
Date:   Mon, 9 Oct 2023 19:42:52 +0530
Message-ID: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|CH3PR12MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ecd7f4-83c1-4591-9dd7-08dbc8d1e2ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hnc6mW1XxYM2QZVjgwwdyYcMPLB9AAkqWfns2lt3hE5VlVgkBeBMyQBnyaFLhCNkNH+iidxFrAAOKYrZfwCZBgl7iap9z21bbS8BOoZQbR8rmXvBG63bkHlOq/DugRGq1M8C9rm1F6kRnXTBOxDSci1a9FgWYagT6YtKyyQznqxW03xJp8RRztNweGxryA/jV8TDKTjoobynE362XYeDGSEpCSVP81s/ahrVtlYqck5hFPJ6K0LqMm4yB/PPCIEoEmjra+JZkKxDWPIvx7J9TPDOM/RyKqU5fUOPc6JeQxk1D+wF29c8t13aaZdcj7SiGWMyiKrSnxViyze64mx3lhxj1JL4PmsOmcyDaoR0h+jgXHw58vb6Ax5tzSkidRu3/P9caBD/M1VnaBEc91aK2ROhugwML/9UzyMnaEroeDX8tcZkTg+m5BOxCn5XFFF3uinSXkiY7WZJgWLIwB15IvfFxRUjfGKQm9jgzGMWMzYJAjyIK9oF6BxfuO1ADh9TIHPpLynaqywW3g0GFvpjswU3DWNg3yMYfwES9/SlcXVNmAT+lwi2lvTmSQ5Eu9N9D1F3/jqiphbraqV8j9KxJAF86Awq2Zrjk4D6QHY3RCxWUg1IsQCEvi/DMnExZzcEI3OHEhFiB3o2p+MdB/O0BCC/e/OiE2NmbRHpRwh34yKBGUsG+o7SC2HoS8hBwCEbapj7m9ILV9MTvsdXD7gCuk+K2sEd0SSoHsxydix9YOtyRefLvh626k1NO3oQhLF2YoiBuYkVnkD/n6+lrrwz/g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(82310400011)(64100799003)(451199024)(1800799009)(186009)(36840700001)(40470700004)(46966006)(81166007)(356005)(86362001)(36756003)(40480700001)(2906002)(82740400003)(478600001)(7696005)(5660300002)(8936002)(4326008)(8676002)(6666004)(41300700001)(1076003)(83380400001)(336012)(426003)(2616005)(40460700003)(16526019)(316002)(36860700001)(70586007)(70206006)(54906003)(110136005)(26005)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 14:13:17.8087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ecd7f4-83c1-4591-9dd7-08dbc8d1e2ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7644
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently in amd_pmc_stb_debugfs_open_v2() the buffer size is assumed to
be fixed and a second call to amd_pmc_stb_debugfs_open_v2() may race with
a process holding open another fd. This could change "fsize" to a
bigger size causing an out of bounds read.

Instead create a struct with a flexarray to solve this.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v6->v7:
- No change

v6:
- Handle release buffer case as per Hans remarks
- based on review-ilpo branch

v5:
- new patch based on comments in v4 from Hans.
- based on review-ilpo branch

 drivers/platform/x86/amd/pmc/pmc.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c92dd5077a16..fdc1e104c437 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -122,6 +122,11 @@ enum s2d_arg {
 	S2D_DRAM_SIZE,
 };
 
+struct amd_pmc_stb_v2_data {
+	size_t size;
+	u8 data[] __counted_by(size);
+};
+
 struct amd_pmc_bit_map {
 	const char *name;
 	u32 bit_mask;
@@ -239,7 +244,8 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
+	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
+	struct amd_pmc_stb_v2_data *flex_arr;
 	int ret;
 
 	/* Write dummy postcode while reading the STB buffer */
@@ -247,10 +253,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	if (ret)
 		dev_err(dev->dev, "error writing to STB: %d\n", ret);
 
-	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
 	/* Spill to DRAM num_samples uses separate SMU message port */
 	dev->msg_port = 1;
 
@@ -264,10 +266,16 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	dev->msg_port = 0;
 	if (ret) {
 		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
-		kfree(buf);
 		return ret;
 	}
 
+	fsize = (num_samples > S2D_TELEMETRY_BYTES_MAX) ? S2D_TELEMETRY_BYTES_MAX : num_samples;
+	flex_arr = kmalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
+	if (!flex_arr)
+		return -ENOMEM;
+
+	flex_arr->size = fsize;
+
 	/* Start capturing data from the last push location */
 	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
 		fsize  = S2D_TELEMETRY_BYTES_MAX;
@@ -277,8 +285,8 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		stb_rdptr_offset = 0;
 	}
 
-	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
-	filp->private_data = buf;
+	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
+	filp->private_data = flex_arr;
 
 	return 0;
 }
@@ -286,11 +294,9 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
 					   loff_t *pos)
 {
-	if (!filp->private_data)
-		return -EINVAL;
+	struct amd_pmc_stb_v2_data *data = filp->private_data;
 
-	return simple_read_from_buffer(buf, size, pos, filp->private_data,
-					S2D_TELEMETRY_BYTES_MAX);
+	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
 }
 
 static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
-- 
2.25.1

