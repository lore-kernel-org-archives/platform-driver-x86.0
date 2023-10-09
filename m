Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D295E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 14:13:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376960AbjJIONc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376431AbjJIONc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 10:13:32 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F63D9D
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 07:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwH91xIgNpPs96Y8qobLamnybWtRKf02TlCz/SlTNRa4rgt4EeaKBFZqQN16EKlI6A5d8NIY0Bv7Wr9In1NNG/S70PG+GIWMNL8pepkJgyJHGH3XUvUiHy4D8+NQHpZvqHlUEEg1wYX3xBuHhaQo3kg+rICPFKOwbdTegDytB4DMhmuxJm/ouI+ljd4y0FkeX+5o4sOdrkl/9kMpSJQoxueIqLSedageab109C/LHvfC3VCpP8empyfnX1I4aYUINqpXE/S22FE2noSskePRvdXyRiSx5uTWFiiJVM71JsqG4NOl/HMgkT5/OCxWNAGMRLFnvq4Q7BAdSWF/yJphMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhSJlsU7HMJyqqsWtL1jlA9FRe/jK0G7II7pLRO2/DQ=;
 b=O4jFhtQ84DdUpeUvsIagW6hLIDLUGBXJ6ec3MGpCjAU87ZWvUpU+tfnTXwZrfrMYmRjAQizHGdKlKd71GDUs+Aja/MSXzlJbO92jAPQyCO3U5A8U8kAxSwbB/w1yNdztIF9bhuNF0KifSXgPIx4JGxo3W9IHwiWI+jKu2az5y6ZMTK9LAn3cuSJjTPBfjfRHRwpRs9m8zjuLqMnysAeq8cPBi8nmdwEW5sM/xQkhq1vMQ6Gc1YCUUfbQ5b05JrQuaW2Dt4hguYRloxNYCR3k/ChHsWicswE3yMHRYvlols2bThydXXq4a24ScNd/cZY5PgUBhki+I/NXwD/6ND2n0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhSJlsU7HMJyqqsWtL1jlA9FRe/jK0G7II7pLRO2/DQ=;
 b=D9akFskI7i6rOrAuo/c06LS/+5vqfnxv03WvWtVlTHYrAeDWgxZBNxGMUteR0tB6+kZLviTyqWTG3VQZ0jnIrAh+1XLPY8lyN36L+H9wqYGNioL9rpVK/EZzMDeRvSEgrWj+7PQmdlXNs8WOx4KOW0qc9vuLDJcTZ9zf8zuoJzg=
Received: from CY5PR03CA0011.namprd03.prod.outlook.com (2603:10b6:930:8::17)
 by BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 14:13:23 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:8:cafe::3a) by CY5PR03CA0011.outlook.office365.com
 (2603:10b6:930:8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Mon, 9 Oct 2023 14:13:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Mon, 9 Oct 2023 14:13:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 09:13:20 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: [PATCH v7 3/3] platform/x86/amd/pmc: Add dump_custom_stb module parameter
Date:   Mon, 9 Oct 2023 19:42:54 +0530
Message-ID: <20231009141254.22114-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com>
References: <20231009141254.22114-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|BL1PR12MB5032:EE_
X-MS-Office365-Filtering-Correlation-Id: e01eef54-616b-47f4-4adc-08dbc8d1e5b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Nbp3VX8/CVpECpDZacpROdRxR7pvWDZqpvopV0CQ5nyftgAdHrDL4HMii9JfrRd2Q72YBbN9P0BmSXLbdxCWZDGfey9t3M+tXjdC/bGCwP5utCt5YCSHjwbA7gdUwlJkHB9Q5dh+QNMxeDhCt2l2osGo9+xQkyjovUuU4nOeuGyy67P8MkOKaQ98K2C8ElsvqVoV0IFbpHm/N4TbvUE9U09DqWJXzUaahMsjXcjtAzz2q092wVM71Tpex0Q2F8lDsCVsAW7rM6WSSqxfB0sprYEzqQ/59GJ5NBx91E9DiW1I8wTrKvVX0O/PVwTmUIpSKIQPgI0mXa2GFvpKQs2+Uba99lVQPprgs7unvkyieU2nU3yKL/cp31EKzlrphAn6akfLqcJ2YuF5F7VCfDSMvRPi8wnJYQrbXPd9E7MtDbCnaBVUKT/cG1Z92+UKq6w2Ty54D++u01trS8yfzRDFETEyaITOFijLdp0AL8SEFE7YDUTY3UNjIqG1eL+TSrlhBhTokyEzzmMdecEpVzrgjrvBGT65oFaB4Pzk+1EMMvEwd8rKUrbnceg08AI+ZjHdbCb872KpN1iwrqiA4bo+wM7ACeFvhoIN2m+Y49R+HBmypZKc03VGWW7lhEF1Ytf2H2raGAvAfDEIAM/u7IZ0v9bnGd/lYZqsxhNtnnW/MFMZTi0XxI49h7FmffIItCUilk6axv1V7JB70EOiae7pkz5Fes/JSDPqJVsFwrSSsUPxvDdN8KO8+l3OvL3kk0Uewe8FuVOtbNjDa0V4vgZ7A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(1800799009)(82310400011)(451199024)(64100799003)(186009)(40470700004)(46966006)(36840700001)(86362001)(81166007)(356005)(36756003)(40460700003)(40480700001)(2906002)(478600001)(82740400003)(5660300002)(8936002)(7696005)(41300700001)(8676002)(6666004)(4326008)(83380400001)(2616005)(426003)(336012)(1076003)(36860700001)(54906003)(70586007)(70206006)(110136005)(16526019)(316002)(47076005)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 14:13:22.9219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e01eef54-616b-47f4-4adc-08dbc8d1e5b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5032
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There have been instances when the default size (1M) of the STB is not
sufficient to get the complete traces of the failure. In such scenarios
we can use a module_param to enable full trace that shall contain more
debugging data. This is not a regular case and hence not enabling this
capability by default.

With this change, there will be two cases on how the driver fetches the
stb data:
1) A special case (proposed now) - which is required only for certain
platforms. Here, a new module param will be supplied to the driver that
will have a special PMFW supporting enhanced dram sizes for getting
the stb data. Without the special PMFW support, just setting the module
param will not help to get the enhanced stb data.

To adapt to this change, we will have a new amd_pmc_stb_handle_efr() to
handle enhanced firmware reporting mechanism. Note that, since num_samples
based r/w pointer offset calculation is not required for enhanced firmware
reporting we will have this mailbox command sent only in case of regular
STB cases.

2) Current code branch which fetches the stb data based on the parameters
like the num_samples, fsize and the r/w pointer.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v6->v7:
- Code simplication

v5->v6:
- No change

v4->v5:
 - create a new function amd_pmc_stb_handle_efr() to handle enhanced firmware reporting mechanism
 - based on review-ilpo branch
 
v3->v4:
 - Update code branches and commit-msg as per Ilpo's remark.

v2->v3:
 - no change

v1->v2:
 - rebase to 'review-hans' branch
 - drop 2/4 of v1
   (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)

 drivers/platform/x86/amd/pmc/pmc.c | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index e0b5d9de473a..af6d400193ff 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -53,6 +53,7 @@
 
 /* STB Spill to DRAM Parameters */
 #define S2D_TELEMETRY_BYTES_MAX		0x100000
+#define S2D_RSVD_RAM_SPACE		0x100000
 #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
 
 /* STB Spill to DRAM Message Definition */
@@ -165,6 +166,10 @@ static bool disable_workarounds;
 module_param(disable_workarounds, bool, 0644);
 MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
 
+static bool dump_custom_stb;
+module_param(dump_custom_stb, bool, 0644);
+MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
+
 static struct amd_pmc_dev pmc;
 static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
 static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
@@ -241,6 +246,25 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 	.release = amd_pmc_stb_debugfs_release,
 };
 
+/* Enhanced STB Firmware Reporting Mechanism */
+static int amd_pmc_stb_handle_efr(struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	struct amd_pmc_stb_v2_data *flex_arr;
+	u32 fsize;
+
+	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
+	flex_arr = kmalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
+	if (!flex_arr)
+		return -ENOMEM;
+
+	flex_arr->size = fsize;
+	memcpy_fromio(flex_arr->data, dev->stb_virt_addr, fsize);
+	filp->private_data = flex_arr;
+
+	return 0;
+}
+
 static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
@@ -260,6 +284,14 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	if (ret)
 		dev_warn_once(dev->dev, "S2D force flush not supported\n");
 
+	/*
+	 * We have a custom stb size and the PMFW is supposed to give
+	 * the enhanced dram size. Note that we land here only for the
+	 * platforms that support enhanced dram size reporting.
+	 */
+	if (dump_custom_stb)
+		return amd_pmc_stb_handle_efr(filp);
+
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
-- 
2.25.1

