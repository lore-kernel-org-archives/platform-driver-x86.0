Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23189E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 09:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345708AbjJIJre (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345608AbjJIJrd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 05:47:33 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BAA197
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 02:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5DOyrSmW77WNAYCliu+QZFKzXpSnhgtT/7INo3X19O4Y8mVII00KBtend2nCbDxnkZq+gFrd0Jq2rOTZ8JW/nFM8f9+al3i428PmrccuvTgUbjJWZqMvv0I604qaSJnD+RjfLH4OA214pyaIHHjCtC8PZVbvV56XoM5wKWCEtfvXFaUcke1XIkqB4BFTs0o7cA1nfdFX/t4yL4F0DShWDdRMlBetrBojfe6jkjs7Haa8Rs0ECD2gV1H5FNEQeLqsSFBPf+kMqbkw28bp1gYjqSe/smfxBwbLQ/q+Nk/cjMcULrEjhskYDDMzubRiYRe5U70oYTaX8yqnfC99q9iCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKR+nAvzMXWD71Q8r0D7bjmA6dVlRX5aLI5yE5N1MVA=;
 b=IGUprS293AKDrWKURvtDMwlJxV7M/pcPO/8xneZN1I5IerUHZEyL7vs0tfVkHLkp6aZ9yhUDVPgfEyg9BIWkT91xYNT67R0jQVrqcb+nD1gH6HYiWSrNEzXMdYsw1DSMC4i/QS1n+B1iPpLw1e7YJaXrMAHUV439fy3uB7BCluFTXm6bEj4unFZNczVVkFRDUqyDJxsFSmLEiWy1EcRjq0oqsVayUq71LYZXmzpeB6/Ekhq/61w7o5LXpE7+scemJKpol+RspDtJemTf2fDoxud3SQM/rkD5IYNzrv5EVrfZoaWvy6tNC1ou0FR1X4rygxX1WPGFF26rn9YsGDSWiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKR+nAvzMXWD71Q8r0D7bjmA6dVlRX5aLI5yE5N1MVA=;
 b=acBaar8KpArWlZFhRQJHQTN11c2uGq3bjIyiOQFgZQ45I/YIifuXPEEjVzpGXH+1URpVe8Y3KZtkwiYuQq2+BNh0etNiAh/UnHV9TF2C3pVt4FRtGJ1yA13G6i+HUgF8uelVQP+431XUhqN5RAgm+XF86gd/Twxj+CBp68BOJrc=
Received: from PH0PR07CA0030.namprd07.prod.outlook.com (2603:10b6:510:5::35)
 by SA1PR12MB7343.namprd12.prod.outlook.com (2603:10b6:806:2b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 09:47:27 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::75) by PH0PR07CA0030.outlook.office365.com
 (2603:10b6:510:5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Mon, 9 Oct 2023 09:47:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 09:47:27 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 04:47:22 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
        <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: [PATCH v5 4/4] platform/x86/amd/pmc: Add dump_custom_stb module parameter
Date:   Mon, 9 Oct 2023 15:15:39 +0530
Message-ID: <20231009094539.6746-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SA1PR12MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 592c9a51-30cb-43e4-d434-08dbc8acbf35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YwBkEaKHu+VKLQ85R9ZHcLVMLcz2jS9WFYc+dLZRl3kfYJ4317iatH5xR7T/EzJ2P94wPVH4ayltLJJrMxM/MoUPXI1/4WtjLELg520TQaKAAJ20YSjCuXfncs//hCVniZCnLuoB7mh432Z4OM7GbcSiaw4iP5VjL0DwdgKqpCrhScUkV4mZA0nL/VLvPC7fglvSe/kJ1Ut9ZeF5RSHxOOLzu9EalVp+Y+gwqjBuZRxkQ9B8WX0Kg4taw0mNQm9imHDm3OoPwo4c7OEk9SEEevqU3BBzEotbsjKA5GUqOvaJqbDfSrHatd51t73MWN2cSPymfkZ5rBWmfr2Fe8j36rprpfp6BtZWZycvd6imfsTM3t0etSXlMyNP3GVF339DSHWkRShkqmcOQJRI2HMRuuXz+vgI2w2K7Bhdijv0h5GcbTybbG0WzvJjwh+sGXnae1K/V9sV2BRoQJ65zgvrM0Nk5RqfmHcUmdPjNYxEz3+KLRD2UueE0NQJ5uWceckvccgN+hVY/ONQAsSHeQJ7IEakLENjVeuGojj/wVuy3xv0/SnLw4NwgZtaQTOqoBK0IVQcXeY14BYwOgWx5rf2FuP3vIa6uMgy0p1FVxHSUhe5z2CY6sl3zxPZB1T8zebEkWnfJ9FM3mMT6hFV4ocKcPEj0nIiIHxRtLTvbOzU5LsIatqg3elxhSRRTqdDcb/+5mRO5SpalseJyLT321LKIdI9zcGzmgRgHYrc6XSoWa9er4Ts2KVgebQGhRq3wuW/
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(46966006)(40470700004)(36840700001)(81166007)(356005)(86362001)(36756003)(40480700001)(2906002)(478600001)(82740400003)(4326008)(5660300002)(8676002)(8936002)(6666004)(7696005)(41300700001)(83380400001)(2616005)(336012)(1076003)(40460700003)(426003)(36860700001)(70586007)(70206006)(110136005)(316002)(54906003)(26005)(16526019)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 09:47:27.0338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 592c9a51-30cb-43e4-d434-08dbc8acbf35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7343
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

Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
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

 drivers/platform/x86/amd/pmc/pmc.c | 45 ++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 071d92b7fbde..1424c03c1f03 100644
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
@@ -241,6 +246,26 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 	.release = amd_pmc_stb_debugfs_release,
 };
 
+/* Enhanced STB Firmware Reporting Mechanism */
+static int amd_pmc_stb_handle_efr(struct file *filp)
+{
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+	struct amd_pmc_stb_v2_data *flex_arr;
+
+	dev->fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
+	dev->stb_rdptr_offset = 0;
+
+	flex_arr = kzalloc(struct_size(flex_arr, data, dev->fsize), GFP_KERNEL);
+	if (!flex_arr)
+		return -ENOMEM;
+
+	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + dev->stb_rdptr_offset, dev->fsize);
+	flex_arr->size = dev->fsize;
+	filp->private_data = flex_arr->data;
+
+	return 0;
+}
+
 static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
@@ -260,6 +285,16 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	if (ret)
 		dev_warn_once(dev->dev, "S2D force flush not supported\n");
 
+	/*
+	 * We have a custom stb size and the PMFW is supposed to give
+	 * the enhanced dram size. Note that we land here only for the
+	 * platforms that support enhanced dram size reporting.
+	 */
+	if (dump_custom_stb) {
+		ret = amd_pmc_stb_handle_efr(filp);
+		return ret;
+	}
+
 	/* Get the num_samples to calculate the last push location */
 	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &dev->num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
@@ -269,7 +304,11 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 		return ret;
 	}
 
-	/* Start capturing data from the last push location */
+	/*
+	 * Start capturing data from the last push location.
+	 * This is for general cases, where the stb limits
+	 * are meant for standard usage.
+	 */
 	if (dev->num_samples > S2D_TELEMETRY_BYTES_MAX) {
 		/* First read oldest data starting 1 behind last write till end of ringbuffer */
 		dev->stb_rdptr_offset = dev->num_samples % S2D_TELEMETRY_BYTES_MAX;
@@ -303,11 +342,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
 					   loff_t *pos)
 {
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+
 	if (!filp->private_data)
 		return -EINVAL;
 
 	return simple_read_from_buffer(buf, size, pos, filp->private_data,
-					S2D_TELEMETRY_BYTES_MAX);
+					 dev->fsize);
 }
 
 static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
-- 
2.25.1

