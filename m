Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3299BC83F17
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Aug 2023 03:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbjH2Dxt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Aug 2023 23:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232974AbjH2DxR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Aug 2023 23:53:17 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE6D1AA
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 20:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzsqQh8IPXjx/tKggsD1p96DIxAO4ge4S+2QOFw5r8IKxbpSN03rSOXyCB4t49VI97VSmkfN1Wgfo9DegBJ2qw2gfKhxqYPDI8SzH62WMi4gkN1aa+otTbrKYvhQOq11Ddyj6xHdNpK17Y9BEp3n1zQ6erOo1nOkq40r/0PITLKYktMNnm3G+70O2VKjrxFwJIIlS/Cb25mf5auKGonKTKK9xjkGEL8RU1cmyy7xUcUc/wRDgaWuT1kXhangV/ZDlxov7zEeRZOdHPJAhYnEBsbEa+1x6Oe8p9B7I6NCw5eN60FqV7cHW86kvW9SxU1MmtIGUX0wDBmIYnwgS7uQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sduFlprTYOyjGQoxJF2okKwX6xfNP7ZKRnQP2xKh74=;
 b=hSK2SYj//65p9F9fGpB6g1gI0KMKM+vHoRGVzAb3EUiXyzEv1LNwKze1o8qXhf2jeEksShLVPnhBfUcGjHJ1AgC1r0OAiXeDmRDdk5V9AEee5qUUVswLg18xu4DOSXbxfPeHC7Dy1Ty8r2UEeuUiwqO++n021/FHA7354DqReMILN0ZIt3sQEd2kfJRfyoA0hu8qhMOc5lj2c/n7NODbukwcan0QQ96av064p+WaGobx900HIywdJQwmxk8yQMtEu/F06vC6Bq2cSKfkQ5LRGftgorgbMweks7x9M+iX0y9oMHgOyttfgKUIkp3mKwzc9WttfsR9cooDnprITy9Shg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sduFlprTYOyjGQoxJF2okKwX6xfNP7ZKRnQP2xKh74=;
 b=0vrORINLTtyyq1ahTN6fUrWuIkIscNEydPVDACmKG1ilCZ5wgRb+JoyhEDqKO2TVeNwBXpEDqiNLQS0/BLuctSCC/9XKt6CeHHtyLBThssmA6IJUSJIpXS9g6plhu7ztUDgDORngk6Yh1Em1+0cpw+b4cAWNoJKVBuy5cEZc5j0=
Received: from SA0PR11CA0087.namprd11.prod.outlook.com (2603:10b6:806:d2::32)
 by SJ2PR12MB8063.namprd12.prod.outlook.com (2603:10b6:a03:4d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 03:53:03 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:d2:cafe::cc) by SA0PR11CA0087.outlook.office365.com
 (2603:10b6:806:d2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Tue, 29 Aug 2023 03:53:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Tue, 29 Aug 2023 03:53:02 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 22:52:59 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: [PATCH v3 2/2] platform/x86/amd/pmc: Add dump_custom_stb module parameter
Date:   Tue, 29 Aug 2023 09:22:39 +0530
Message-ID: <20230829035239.4132737-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230829035239.4132737-1-Shyam-sundar.S-k@amd.com>
References: <20230829035239.4132737-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|SJ2PR12MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: ee50511c-022b-4f24-dfa2-08dba84371b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xn+yMXoiZXwsBIKcxCNpVhydCSuzkAj0PuDgl2Dp8IEpWu5S/fjbCZtauZ8t6GmsjZrhC15/KcSKELraO2Z3F/eomw+g/4mFDh4ek7r+QDDZIDxpipXS3y44jtbo3WR3n12X3gKymAeihMajQmCau3WyYImnu4ap/JnG9TlkJEjcwnv5SYQCIdGwSlXkJA9D7Nb+0mr3uAv63IIpTqZF2y+DBzBp5+Sui+z1rjQH3ah38VQVQA24QI6wAqA2cbOtoUtazsB5iopfs78Cbnt+EPZbCoY9NWy/eZfOKzE4KG+3ZegaREzagRyabAQM6f4Ume6kSheNEiX0AXsmGAJSPYGLRSLFpQgBszlN3f7wcLXLYSbMN4Ocx3uCK8JBsM9ciILEJsqwIPLfUPZlFSN27C11YjeMnGrmtNVDV7UGKBZTeFckN8igt0eK0GJtV+IA9ueJ368Ml4pY9D9g8GUQXRIwkO2cz7AyiqoLGvu/jJYFSfS4CdoG5+KnYAbVnOVPNOZFCRLwbUH32cpIPYYtxpa/qurGu5oTxTCYFqMylgbVR1bvgM/ZWhDNB80nJ1H1rhR2JqB1X2gWXj0uZGTXE53zhHjjWwm8+HZdHBHdh0Ol4YTCLBdJMoRMvs6AyChZ7eh2N25b8DpPU0To4luDpiN/klaAucrX1MnwViXhFusYSMQQMIiZSUXXZpFQgGIoyo3JA2pDuGzZXh4inVer9MlSCnabBmd2OQekosVX345GGx1TYhJ21YOSAM7Zd9vx+DBN924ThKekWUTurWpMjA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(186009)(451199024)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(6666004)(7696005)(5660300002)(70206006)(40460700003)(36756003)(2616005)(86362001)(81166007)(356005)(47076005)(40480700001)(36860700001)(82740400003)(1076003)(2906002)(83380400001)(336012)(478600001)(426003)(110136005)(16526019)(26005)(8676002)(70586007)(8936002)(54906003)(41300700001)(316002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 03:53:02.6255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee50511c-022b-4f24-dfa2-08dba84371b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8063
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There have been instances when the default size (1M) of the STB is not
sufficient to get the complete traces of the failure. In such scenarios
we can use a module_param to enable full trace that shall contain more
debugging data. This is not a regular case and hence not enabling this
capability by default.

Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2->v3:
 - no change

v1->v2:
 - rebase to 'review-hans' branch
 - drop 2/4 of v1
   (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)

 drivers/platform/x86/amd/pmc/pmc.c | 34 +++++++++++++++++++-----------
 drivers/platform/x86/amd/pmc/pmc.h |  1 +
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 443bb78ea5f4..0e61ae74f1a9 100644
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
 
@@ -264,20 +265,27 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
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
+		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
+		stb_rdptr_offset = 0;
+	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
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
@@ -286,11 +294,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
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

