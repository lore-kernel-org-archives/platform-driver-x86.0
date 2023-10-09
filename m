Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F50CE95A8E
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 13:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377399AbjJINnc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 09:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377397AbjJINnb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 09:43:31 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7AA91
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 06:43:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6J+oL2gQHyHp3AtVHxS9JL1iLBI82W/Fpzg2y2M6j0DUdIC70tuT/cAC6NIVYi0gmXLe+hARokNmmMaYwWyZR9b9Lamw1in+MhTWg8ecFFDC8XbzgvKVbM3xozlZfBOe6ZpPiGVjpDAEv6Pk7aCb5pDZfniMtQ/TA3UoEP0h5iFeSQ4CV/AEJPRy0GbvHJ8u9rloCBjgkBZaCrw2gz3OlBYhWBOXifnBVYeFswaFtAoUUf2gczdBbEwGikPNpIlMmU46lwW/CusB/5l2UbQ0Fhi3RgrrLVgqDVgw1Sj2qlmnKc0V/Run+yrwuFeyVtzK006Kw0waefauRImhTSoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ofvw7+rpvscPlau07aC4vgDpEaZgdYtGtXlvH4LuoII=;
 b=DMtwOW4UOK/4+GT1/vtLtPbL2tQMoQLYIR17wZtK3RgcA2YLzsZbJo13xtuijsg+pH/cCbPsI6brU4TjXZsFrv8BkAsjBv+G1F3hUfiRswdoPxuDp96Qv99dw8RMUujjQpF43YU6PosjNQAWS6+hLlQULu9AqbhhEzlxGeKJS6wdO1nfHxE+HvxpBOCeEtRUfy+HMJ+D2ub932bAtuEWpbIrAd+uCOQt2IMnsqPXThe3JyFmjJuOPW9Vu9DSV4D1KvSZZdo0upS8nMMg/H0A1dcjQM0wPG/c99pUy8FZ6ShZHgWmqtCzpFCNtPoQNbHDrHNYj8wSD9vrd1yY6N4CFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ofvw7+rpvscPlau07aC4vgDpEaZgdYtGtXlvH4LuoII=;
 b=sP3RR74/kyYSC8uOO3tQLIconBc8+gr3gLOq+6rf3mLHgz+DcWOvdyabwxgocu6jW2xeD4UuDbtEZwXYtRts/tkeKmQTfIbscElbRHOWzEAaVCWaFfMApte4OA3suZYqkA3Duq+xGu41yvry9NOPpxFRgRHy4m7xjxQ/5Zhn7MA=
Received: from BY3PR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:254::9)
 by PH8PR12MB6700.namprd12.prod.outlook.com (2603:10b6:510:1cf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 13:43:26 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::f) by BY3PR05CA0004.outlook.office365.com
 (2603:10b6:a03:254::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.20 via Frontend
 Transport; Mon, 9 Oct 2023 13:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 13:43:25 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 08:43:22 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 1/3] platform/x86/amd/pmc: Use flex array when calling amd_pmc_stb_debugfs_open_v2()
Date:   Mon, 9 Oct 2023 19:13:05 +0530
Message-ID: <20231009134307.21001-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|PH8PR12MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a15b0b-3a94-449b-0f5a-08dbc8cdb699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FPRzoGoo2YSWjvAekk+iwWpftxxGlqJgyTx0nhquCk4oBBAGjMpSzSuhC1KGVJLS8g9ZdY/TRuR26yRJf5HL01veaS2nPuJ0D9lrddyImuJ5VhrpzIFe6XtzWU5dBlHkiNK2GznZbtNHKOnd4u+sONhyAJkKfRCiFnwh4Ej1grP/ZxCoMJY22c3n/XuGvuvAKiYFoNAjeive1suBFJFxVJCxAbICGgzQzzjC5B6uIAZ2t/7usIMqiU3U0MQETBanCiIyOYvvQbnc9aMBUF1nDbapP9EY0uPYa4wqMyEMtYiGBfgSOFt7vvjCQ4heE0/Oab7oaY7dhPZGjfdeVe8ylw9QUPw6rUylGgEgeuSrz3zsNsNPk118b9Ofm71wnACXWV+bhdAAO7/nKuJzyOP82+gsU33l2rmSwEJ24VRmsG6mGGzUDrEwoOezKlw8qmjLyMa7j2VLgqrtwmPc2CxQukDQlrV64OK4c8rLi3mSjrz63pbbFOrgjegiTkGH1wwXGCTL437G9KvbUB9QYyFnCO2sKtat7hbkfbzmZB8/unDEw5C+mS3NDKESzIhNyaaI7s2tLeIOi8LQ4MgrIsNWFKrqm4ZyY+s7tiiz+X7mnCdjsZmVYlajhSljeQyo0XtTctZIOQxDqCBYrzxVjDJsNFxC8BZAYjiZVS91daJZp7ZzU0gGHkry6p1ApywIfkWtGIgVWsuEWxRRk0yg46CrtJWGG50ytY79etU5tpMdWjc2V3SVTOu4NguYl0KuOZBh/vl0Ex2/FRpkcRdGRHalqQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(451199024)(82310400011)(1800799009)(186009)(64100799003)(46966006)(40470700004)(36840700001)(36756003)(86362001)(316002)(40480700001)(1076003)(2616005)(5660300002)(2906002)(110136005)(70586007)(70206006)(478600001)(6666004)(54906003)(41300700001)(40460700003)(7696005)(426003)(336012)(26005)(47076005)(16526019)(36860700001)(82740400003)(4326008)(83380400001)(8676002)(8936002)(81166007)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 13:43:25.8673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a15b0b-3a94-449b-0f5a-08dbc8cdb699
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6700
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently in amd_pmc_stb_debugfs_open_v2() the buffer size is assumed to
be fixed and a second call to amd_pmc_stb_debugfs_open_v2() may race with
a process holding open another fd. This could change "fsize" to a
bigger size causing an out of bounds read.

Instead create a struct with a flexarray to solve this.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
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

