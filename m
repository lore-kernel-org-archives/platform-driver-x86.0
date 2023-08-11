Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AA3C0015E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Aug 2023 11:24:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236196AbjHKLYU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Aug 2023 07:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236191AbjHKLYT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Aug 2023 07:24:19 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254C41FEC
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Aug 2023 04:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STdlNs/4KjkgyMTMkalTzbXR0asYQltGMEpTM+2eTy6sB/aoj827oKJUptHaKFAF8n7OXT5PhNSQpuen3noebBrkkNoNNRej0mO1dxYzRgGsHBpNaP7bxrTxnW0UapcoJl+Q2sfK7DWKtE9k5wJpdz8ympgYiv7tdy+X6Sqqvh9zsbVbfFs19dgbKAHmFWjuK1h3IpleDa5amMLA0NaenW4patIz+z9AxQmJRNTdVipStIcASrXhjPT5ICmUfOIzfdpaDNpQGrjjxUrPi7jLQAfBV4iwLzfmc/kzKI3MpXiU7hel37XwHG4GPav5iCGpY75wKs5c70P7gXoFDg8wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5ynKp312ZqpiHcehms+bMCoI0wBYhONTKfiiVY12Yo=;
 b=nk79XL3rZKP5TL0WNTpD122pF/tPPPFuAF1I+yFK+R1Ogfyuy57Jn7l68+kdXW6nnyegmAQJe6rm8OreF/60eN7qd6XCAxDMP5j5zYOT40Z0wlA5o8pmOdDHPck+BhU1sHZCf0DCoHPDeJK/98detGOVPFkWWjGS8WTE/5XhOGqcX4czpC9409+U5f8Mhhv35qvXc0yp2gw+ueBls5Nzhw+5wKQko2ufIVU96OgnqNruDVEYOJLPbxq+9cWuZDUz0Mldfu4nP0rNTkQWN8w/Pfb1ImwIorkRIrvXkgszTFGeWwnT9wP0gF6faWHG2uLBaauYtmQrVRS2AH7tlnSjHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5ynKp312ZqpiHcehms+bMCoI0wBYhONTKfiiVY12Yo=;
 b=S3gHfhGSX9iDDOgN5L32SbHN9zVXPBBLqqtK/6N+RsWsMKvNjvBhg+xS40nvoQ8YLejiqSuiX4LbwVB1GEYpBmGnQQv2AK4Y7js1EptPZd87fd8VGCSKewVsQ6KYJt5IUFtAWS5TxOW0LktBCYDmliaZwzxiMMPkteLCtergNv4=
Received: from MW4PR03CA0108.namprd03.prod.outlook.com (2603:10b6:303:b7::23)
 by IA1PR12MB7520.namprd12.prod.outlook.com (2603:10b6:208:42f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 11:22:14 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:303:b7:cafe::4) by MW4PR03CA0108.outlook.office365.com
 (2603:10b6:303:b7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.31 via Frontend
 Transport; Fri, 11 Aug 2023 11:22:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6652.20 via Frontend Transport; Fri, 11 Aug 2023 11:22:13 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 06:22:11 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: [PATCH 4/4] platform/x86/amd/pmc: Add dump_custom_stb module parameter
Date:   Fri, 11 Aug 2023 16:51:16 +0530
Message-ID: <20230811112116.2279419-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
References: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|IA1PR12MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 927b2dbb-17ed-446f-b0d7-08db9a5d368f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EzM53z5cFnzIPZude+VpjiT41QeClLzefTz1w/8tfizN31HmOXfkwh9BSbZ4zvLSQ5Bh1EsA98QvPee3iwAPndkBxIkp+w18WalxBBBZLQWn+/v1NbthGo029eSzKVE2sKVh8S4Tyh5be4zPPhsvyLRrFxUzJPlQ6Scm4OLNEwO7YDMYmK6x6IR/bqUV6B/D4/037zP55RoatBDqbrGkgFMvNbrAcH+1IuXgByf/ynhdchO7EFhSfxtKrynvq5l2PuND33/qBq2MyaVGfw0kdCG3DLf6RaIiIjXsPAJELg6mpwdKRBIBkeioJTbbSsiMOIAKCFImHBCTDU9y+BKLCMcoQFTl9ZnfIFijvNIFcyv0bbhrbCSoc8kicJH9TGA/aIK44bdqzzAuRyloaaHe9irC0bMYfBCzBz30Zz+xcZHBOau3nf9T5vjVVZrwg6zjKDeomJPexG7eoPkWL4zByLYovchTE8NZ0E92BR08Wmd/IKXr4osAhm3q/s59BGxUizJCHftNBr7IDplgeymxh5eODrZV6SOuxMKzbufnXvt+54hUO+LyLqh/+pG3ymOa1n5gzPEHEX8ITHB3yCoAeeEAmR0PvlDPKdc9zPh0LlCNGvzalxMkh5nX+D5df0Yx7tbYqfgHMFRSxjlqbLuKRRzARYxt9pMaRGsRGWj/mbnuv7whBj7xcW0FvmLddJ4Cc477hcPl1fpksVSXpYzSImIE3pSvlOVsyKMNQR3LHEghhzTOQbL7zs33A+6RHKphEpAnMZACdQd3+HOMM1iP4Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(186006)(451199021)(82310400008)(1800799006)(40470700004)(46966006)(36840700001)(40460700003)(2616005)(4326008)(81166007)(336012)(82740400003)(16526019)(356005)(36756003)(41300700001)(70586007)(47076005)(36860700001)(40480700001)(5660300002)(426003)(83380400001)(70206006)(7696005)(316002)(110136005)(8936002)(54906003)(8676002)(86362001)(2906002)(478600001)(26005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 11:22:13.9517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 927b2dbb-17ed-446f-b0d7-08db9a5d368f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7520
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
 drivers/platform/x86/amd/pmc/pmc.c | 34 +++++++++++++++++++-----------
 drivers/platform/x86/amd/pmc/pmc.h |  1 +
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 45f7d21276bb..06d901a8f6e5 100644
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

