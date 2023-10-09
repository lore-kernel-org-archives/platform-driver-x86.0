Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5AEE95A97
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 09:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345608AbjJIJrf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345860AbjJIJrd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 05:47:33 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5BE6A3
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 02:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WixRRZvry874XE6Rqvl/nCfiJaqthTeZU2/QpeRrZjTlGzdbaUGt6PvV2FMFzI7RYLLZnY/B0zcmI9yO0v05LS0tC5yg5yg0uJIVndoNGfQvWvl5YRlXCEdgPZsO1iBgPSnbhBjf9QNWMlgK2KHVbaM6xtsHG1CAfQGI17wJLz9BPwbUnJjOY0t0KYNtZMd5026ktvurifs4BmyBcGQhAik7vXSSi06GG9u0m1mPglw8C+5juqKFsij2VfmQv0KaMiVwLrYUXDEc2EwZeq9dAjrEA8h3oNbQVXIy9rpml2n0yuFB2fHjyEAP9CR0g9jxL+/BurEtxoVM7BLPgEPUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N922K7Xd6WJoKEDLRMZ6r6n99hdniMq8hjdfRTvBgdQ=;
 b=IwfGS7rxYwESQMWmvmI2evwBSfjdEFH0wEnoIYbjYqtID5Rowry6M70zvNVX7dWFqLRkIY0b+cwqtO9R/islYlwALMyUcxt2wAQnILRP5BgmncrEwUCVTnb2ws1qVQPuKcGT74jf7B/ocoG0nw3WX+UmTZkSsNSZ0/TMVQJUBsTeGbuOqr8qgN5jHfHuEpp8GkmFfyiXeHOyUaXl9Tfvx6dxz26c+Htw/YPggmNzubyGljPpVCHelKqdRqtnzGwPc8jbJGJnXZrONYbBfzbxQxPmg231hKv5j6NN8d/X0vrmS3jIG2RNAfqPozw+640evsuoAf149zlShL4L82FTZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N922K7Xd6WJoKEDLRMZ6r6n99hdniMq8hjdfRTvBgdQ=;
 b=vu9r6qVz6T3ZPSHGKnt+sd7dYJyW6SvQS5CUWDCtwGHyM11LykbSyb8wa6fbhe1X1KciNc9FHvbzkPP0VVs3yrLx7kyynnw7UN29zxp/Q6aKFYuBfApPY1i3M6mn84qeeVgTa9lPFG1gxP1WhbgbB368jlCdt0fTq8PNrUAgDeo=
Received: from PH0PR07CA0012.namprd07.prod.outlook.com (2603:10b6:510:5::17)
 by CH3PR12MB8546.namprd12.prod.outlook.com (2603:10b6:610:15f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 09:47:26 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::3d) by PH0PR07CA0012.outlook.office365.com
 (2603:10b6:510:5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Mon, 9 Oct 2023 09:47:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 09:47:26 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 04:47:20 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 3/4] platform/x86/amd/pmc: move some variables to struct amd_pmc_dev
Date:   Mon, 9 Oct 2023 15:15:38 +0530
Message-ID: <20231009094539.6746-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|CH3PR12MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d566588-6c4e-43c6-ee34-08dbc8acbead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BYJvckttZyMBIV/Sb+36BqxdxS+uzAXEPCwin9LJHyK4/AT2pmYcLuuyA5erpzIULIyWRSR9u4zQgzLPXGb78uAcoE9KvzRglMdchhNXBVBe3Ig6QoY9SjaQG+ydNMUZkzudVeVkh+0dH08Dc9o+E0sS2GAmiMdTsKpjTNaTtGvnQx3a2epFOhMyMC5HJaRbwrpFX0ZzHSD5RlMJVyACQhEwI+fr8T3wRhIEMHJ7t1uMkPTnDYiwoFoHhhSujrcBJ0tKLx8bci9WYPT9dIz5DJDF5sCmDmfj6yGY/Z01J5HRnTC/KjZp/VAzJ26J9nzKoHO/cqh3FDmZRkc/pVcNrfKxFZh81YR9G7RECtlID37z+szN4Wydc7d6sVZ590iSyQL+lAGNiaLNkjBje16N3QX+UN8OVFv6+POE2NOsKjabEf2kZsEcbo3ESS1wegxhMBhyegDhrDHIMnJ6usFY04JoMwLi+qYpDNuHlhEkYFRgkHhovioDXGoe0ORoNHD5VpJb1FfgrDPtgaAnqGg0OyCd3/Zlf9GYYgo7OSuuo+PkkP0sCLNPNDyZ+OoC5XFkvs80t/4kfLKMJcxgVIVaC4mzXpq56+8iOSIoa7o0BtJ8PsOJ6uF1pJPHbW5ofKQyQTG8i1BfdOzxGGiCr8uLiGEai6/4DojUmyRzhAeJKGgv5/m/2uVe6WCcE0Y67mUmfMNfGp0XN9zy8LWj/9fYDhNdc0altjDS+Ua9K/mqvs565o/PU5rQizXqnGcd3Ug5T+3M9yRMg6txBVMN6O1Hrw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(6666004)(1076003)(2616005)(7696005)(40460700003)(36756003)(86362001)(81166007)(40480700001)(82740400003)(356005)(36860700001)(16526019)(26005)(83380400001)(47076005)(426003)(336012)(2906002)(478600001)(41300700001)(8676002)(4326008)(8936002)(316002)(5660300002)(70586007)(110136005)(54906003)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 09:47:26.1275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d566588-6c4e-43c6-ee34-08dbc8acbead
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8546
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move fsize, stb_rdptr_offset, num_samples to struct amd_pmc_dev so
that these variables are accessible across functions.

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v5:
- new patch based on comments in v4 from Hans.
- based on review-ilpo branch

 drivers/platform/x86/amd/pmc/pmc.c | 24 +++++++++++++-----------
 drivers/platform/x86/amd/pmc/pmc.h |  3 +++
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 67daa655cc6a..071d92b7fbde 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -244,8 +244,8 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
 	struct amd_pmc_stb_v2_data *flex_arr;
+	u32 val;
 	int ret;
 
 	/* Write dummy postcode while reading the STB buffer */
@@ -261,7 +261,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		dev_warn_once(dev->dev, "S2D force flush not supported\n");
 
 	/* Get the num_samples to calculate the last push location */
-	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &dev->num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
 	dev->msg_port = 0;
 	if (ret) {
@@ -270,29 +270,31 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	}
 
 	/* Start capturing data from the last push location */
-	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
+	if (dev->num_samples > S2D_TELEMETRY_BYTES_MAX) {
 		/* First read oldest data starting 1 behind last write till end of ringbuffer */
-		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
-		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
+		dev->stb_rdptr_offset = dev->num_samples % S2D_TELEMETRY_BYTES_MAX;
+		dev->fsize = S2D_TELEMETRY_BYTES_MAX - dev->stb_rdptr_offset;
 
 		flex_arr = kzalloc(struct_size(flex_arr, data, S2D_TELEMETRY_BYTES_MAX),
 				   GFP_KERNEL);
 		if (!flex_arr)
 			return -ENOMEM;
 
-		memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
+		memcpy_fromio(flex_arr->data, dev->stb_virt_addr + dev->stb_rdptr_offset,
+			      dev->fsize);
 		/* Second copy the newer samples from offset 0 - last write */
-		memcpy_fromio(flex_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
+		memcpy_fromio(flex_arr->data + dev->fsize, dev->stb_virt_addr,
+			      dev->stb_rdptr_offset);
 	} else {
-		fsize = num_samples;
-		flex_arr = kzalloc(struct_size(flex_arr, data, num_samples), GFP_KERNEL);
+		dev->fsize = dev->num_samples;
+		flex_arr = kzalloc(struct_size(flex_arr, data, dev->num_samples), GFP_KERNEL);
 		if (!flex_arr)
 			return -ENOMEM;
 
-		memcpy_fromio(flex_arr->data, dev->stb_virt_addr, num_samples);
+		memcpy_fromio(flex_arr->data, dev->stb_virt_addr, dev->num_samples);
 	}
 
-	flex_arr->size = fsize;
+	flex_arr->size = dev->fsize;
 	filp->private_data = flex_arr->data;
 
 	return 0;
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index c27bd6a5642f..12728eedecda 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -26,6 +26,9 @@ struct amd_pmc_dev {
 	u32 dram_size;
 	u32 num_ips;
 	u32 s2d_msg_id;
+	u32 fsize;
+	u32 num_samples;
+	u32 stb_rdptr_offset;
 /* SMU version information */
 	u8 smu_program;
 	u8 major;
-- 
2.25.1

