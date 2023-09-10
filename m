Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45085EE57CD
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Sep 2023 14:21:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346693AbjIJOVL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Sep 2023 10:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjIJOVK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Sep 2023 10:21:10 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA15CD1
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Sep 2023 07:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7FxbOHRhSndLUOKfQsh1XzVYod5uTSZ7u9r8HtsnAmOk0QMxKGqYSAU5y6wYNhx4W3Q/BtCwO6JFZ9M31chht+B4rpGooOxV1BeeFBQl+30djpXbAAJAwXuESiYZl7r8zDaPE7li7fb3bJ0Da+Sd6J+bgs6vtWpWLlMVUjv6NdsoIVEz8IXkutldEOZC9sYY80YEGruNh1bm6vaARbTnuNkStxv6K7VBsHsDCNC2spjI4LdDJcz8S7QiuOvifaJjPll+Qo8Sks5lUdAsCCmD8/vKhhrWGcYIABrbGroCrUN+tD8Dis1wGR4tL66odo/WofS7l4ks5cQks7bltfgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeu0EuvWnlp8z5mmxUSamdnVqbqoNf7Dd2bK0+MtA2M=;
 b=XcyM9jE7dvawzGK3bgOAqE2krAqVQ+sBsXq7Ni6lK4YBhdYe+P8REjzVEkop/smr9kUVIFz/9I/gWtLxDdSUJtXGfMTUs/QPeQHdlcU6lCwzdYxm9x6yAiM+7UNNKj5hOSnE7APkElkQc6riX8vnMREUflONbVL65zQcfEOo36Tpk6N3/b3PrIy2Ed85emdDw5C3bhLi/HyCs08JSZI7d/9gLhYCV82CWnQeJ6qkBfe0CH28514lADB0MakLR/LOTpz9VxNj2Jq+96A0Y1Jg5MeUtsU72MaY0WXsHuUsktosztHQY6kRYBLKdKGG6QKTV4yvJy+ZxFsI6buSJuZ27g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeu0EuvWnlp8z5mmxUSamdnVqbqoNf7Dd2bK0+MtA2M=;
 b=vnhaqJs0Fmv/BGxPY621BfRlH9NNWqTb61UoOeDmOBsHn+/pt49/YOnBw3ijT3B3aaguR9XxCQ78x1sH3Z47SRo1xaPMC2//R5/Rb0nl8IpqLeuTPE3IqWIJHu8L7Szz8Zkya2WQ/InQFm4i6ZnM07FhrxgkWuAzPhyducD337g=
Received: from BL0PR0102CA0005.prod.exchangelabs.com (2603:10b6:207:18::18) by
 PH0PR12MB5402.namprd12.prod.outlook.com (2603:10b6:510:ef::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.33; Sun, 10 Sep 2023 14:21:02 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:207:18:cafe::b0) by BL0PR0102CA0005.outlook.office365.com
 (2603:10b6:207:18::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Sun, 10 Sep 2023 14:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Sun, 10 Sep 2023 14:21:02 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 10 Sep
 2023 09:20:59 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: [PATCH v4 2/2] platform/x86/amd/pmc: Add dump_custom_stb module parameter
Date:   Sun, 10 Sep 2023 19:50:34 +0530
Message-ID: <20230910142034.2967110-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230910142034.2967110-1-Shyam-sundar.S-k@amd.com>
References: <20230910142034.2967110-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|PH0PR12MB5402:EE_
X-MS-Office365-Filtering-Correlation-Id: 1adcbf68-39ed-47e6-6f29-08dbb2092974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yJnQw/Q6z2GuKkYDeqGxTv/4lTCyDfxiuHdYeiGhECNfOql8f3/B7zI3NdNVGBEy2ZMqkgEShtidvg3eY9iGezvukzVPzPDFOtIOiL0fLG+o3uZAPhPSLcFOaWvfadw3p4sKuud0wMbmsZxEG6ZS0MGL6fO4yBCMYZHNHrJ9BEiRQkY8BJlVTXEeD0NU7UoQAyTW37VE5RWv7o3TDoRq2auJUBZPx4ZxdJlr2jC3YdkIx1rwksojY5AGk7xIhw1xWsaieSpEj80HNVuAXE/ez3c3wR8WqEUFR21EL/zTI5UOoMVZ88UmaXy1Lc3s2brzzalQVLSpuf9bHka/p5iTdoldH+tg/YQ/UiycMABB+fl0IVX9ciol9Insg/rHQ+xtI/0u3B4isEhXb8EiOaa6/Nmb75MuoQ+6dCNZ3KEYMFscma/NwYWCSKYvvxC918EUGckV2nbLmqgMss0WYEPct6mlrF3IxivzVnm9e75BrAfpHEUq7GS8anAb2L8fT+Lp3zn0Tujahmtmr1vAv8hiRkN+IGRFshqiCQkDE1A3UB4NxW6k9Czgf1duQhBuL27J2ZAwbme4VugFd7gtlIwWYqg4yc9yI4u6I7TVfnSzFRZBUqzSRmokTUt5eAs7pQO02SihH7fEHc4QWgwbGVSr/aRPSoYbcmcsWkWypLVRjdIYxUDQTQXtsT6vUfWqpnRpDeidy5ONAkz/zz8r0PElwRfVDGGDyR/LIDdqxZl891nhEgc+eqdKDquCzkeeM6Qi
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(82310400011)(451199024)(186009)(1800799009)(46966006)(36840700001)(40470700004)(2906002)(4326008)(8936002)(41300700001)(5660300002)(8676002)(54906003)(70586007)(70206006)(110136005)(316002)(478600001)(40460700003)(6666004)(7696005)(1076003)(2616005)(16526019)(47076005)(426003)(336012)(26005)(83380400001)(36756003)(36860700001)(40480700001)(81166007)(356005)(82740400003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2023 14:21:02.2534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adcbf68-39ed-47e6-6f29-08dbb2092974
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5402
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

2) Current code branch which fetches the stb data based on the parameters
like the num_samples, fsize and the r/w pointer.

Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v3->v4:
 - Update code branches and commit-msg as per Ilpo's remark.

v2->v3:
 - no change

v1->v2:
 - rebase to 'review-hans' branch
 - drop 2/4 of v1
   (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)

 drivers/platform/x86/amd/pmc/pmc.c | 43 +++++++++++++++++++++---------
 drivers/platform/x86/amd/pmc/pmc.h |  1 +
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 443bb78ea5f4..7e907cb50787 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -53,6 +53,7 @@
 
 /* STB Spill to DRAM Parameters */
 #define S2D_TELEMETRY_BYTES_MAX		0x100000
+#define S2D_TELEMETRY_FSIZE_MAX		0x200000
 #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
 
 /* STB Spill to DRAM Message Definition */
@@ -160,6 +161,10 @@ static bool disable_workarounds;
 module_param(disable_workarounds, bool, 0644);
 MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
 
+static bool dump_custom_stb;
+module_param(dump_custom_stb, bool, 0644);
+MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
+
 static struct amd_pmc_dev pmc;
 static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
 static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
@@ -239,7 +244,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
 static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 {
 	struct amd_pmc_dev *dev = filp->f_inode->i_private;
-	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
+	u32 *buf, num_samples, val, stb_rdptr_offset = 0;
 	int ret;
 
 	/* Write dummy postcode while reading the STB buffer */
@@ -247,10 +252,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	if (ret)
 		dev_err(dev->dev, "error writing to STB: %d\n", ret);
 
-	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
 	/* Spill to DRAM num_samples uses separate SMU message port */
 	dev->msg_port = 1;
 
@@ -264,20 +265,36 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	dev->msg_port = 0;
 	if (ret) {
 		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
-		kfree(buf);
 		return ret;
 	}
 
 	/* Start capturing data from the last push location */
-	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
-		fsize  = S2D_TELEMETRY_BYTES_MAX;
-		stb_rdptr_offset = num_samples - fsize;
+	if (dump_custom_stb &&
+	    (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)) {
+		/*
+		 * we have a custom stb size and the PMFW is supposed to give
+		 * the enhanced dram size. Note that we land here only for the
+		 * platforms that support enhanced dram size reporting.
+		 */
+		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
+		stb_rdptr_offset = 0;
+	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
+		/*
+		 * This is for general cases, where the stb limits are meant for
+		 * standard usage
+		 */
+		dev->fsize  = S2D_TELEMETRY_BYTES_MAX;
+		stb_rdptr_offset = num_samples - dev->fsize;
 	} else {
-		fsize = num_samples;
+		dev->fsize = num_samples;
 		stb_rdptr_offset = 0;
 	}
 
-	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
+	buf = kzalloc(dev->fsize, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, dev->fsize);
 	filp->private_data = buf;
 
 	return 0;
@@ -286,11 +303,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
 					   loff_t *pos)
 {
+	struct amd_pmc_dev *dev = filp->f_inode->i_private;
+
 	if (!filp->private_data)
 		return -EINVAL;
 
 	return simple_read_from_buffer(buf, size, pos, filp->private_data,
-					S2D_TELEMETRY_BYTES_MAX);
+					dev->fsize);
 }
 
 static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index c27bd6a5642f..f73d265430b8 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -26,6 +26,7 @@ struct amd_pmc_dev {
 	u32 dram_size;
 	u32 num_ips;
 	u32 s2d_msg_id;
+	u32 fsize;
 /* SMU version information */
 	u8 smu_program;
 	u8 major;
-- 
2.25.1

