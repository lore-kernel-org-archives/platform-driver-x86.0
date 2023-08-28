Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712CBC83F12
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Aug 2023 15:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbjH1PW2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Aug 2023 11:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbjH1PWL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Aug 2023 11:22:11 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2047.outbound.protection.outlook.com [40.107.102.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09D7E8
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Aug 2023 08:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8z66OhdwoAXDwoS3a+/StrX9d6Tfmxf0OLXCHTnx5h1L4517xpAQ6XaH9lmKUHYVwO3KLbmyIv2h1a7nC4YiuJ7eciv2H+FStuQpDeGUyWRztNEOf6HBVagny7MJDTjUavh7SH0aTfbEGsnw1eVsJJ4sERR37YTtFlMZCV1rSGWTGd1txj5dsCsHK7ewcxz4HdzKKkaIgYIxZNEqpVE68jCUsr/gLyBmmwRqvu++8VyyzutcqEK8Z1oZGx1khScri02dFYq77/xsiyJEW937BEom/u3LgpjvyH+VLELkNCyhCJNlmfT3RNCbm3k1qeUlcFeQsPqaqwMzOQPNBU4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H3CVglO/O+Af7Fv464eM/QR3PNZEWt/bFfbc/rGYCM=;
 b=jFMt8Pt96EAPWjm5xBxwHzSU2NyBcwFp/DPaoWIFNirm6yLG9ux9iDbDXzeN7cj/po59F5s6IUMgGSbcrMaj4PThPtScig05+CXYUncItpK4FvIO1o0nfxkeV4dQs0QVY8N4T7ZZpP/P/8lGOEg/NBohb1Ba7VgGK3eu7ZGo6fSsMdLA2IZJrG4WEqSCuVtT77TCQHon2CJi4058lYAvhwsGpoHmVonr55CVwpxUGukigCOXIqVTQnVP26pcaozABlaGcGMklJsZ8daRai9dnnowbGINDSOu1JaAeftBanFs9gT5qfUvKuYPy2dSAXTeZVghD+IH3yj8Tb5wHAzWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H3CVglO/O+Af7Fv464eM/QR3PNZEWt/bFfbc/rGYCM=;
 b=SlXWY3GjfbWVYZ16IeZIvhoH0OYDFxQwY34R8DoSlCB1vx/85TSrPgF0ktjrTugQX9+TdsLqp80OMwRfo1VjUEdBKP59ZXta7TdfIpJ493MfZJJ9IVUJxlasUhlhDu0clBGY5U82vFr7dyIwF0tURhjqJyoc9fIel9rpXdDv+Bg=
Received: from PR0P264CA0058.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::22)
 by CO6PR12MB5393.namprd12.prod.outlook.com (2603:10b6:5:356::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Mon, 28 Aug
 2023 15:22:06 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10a6:100:1d:cafe::c6) by PR0P264CA0058.outlook.office365.com
 (2603:10a6:100:1d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Mon, 28 Aug 2023 15:22:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 15:22:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 10:22:01 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Harsh Jain <Harsh.Jain@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/pmc: Add dump_custom_stb module parameter
Date:   Mon, 28 Aug 2023 20:51:34 +0530
Message-ID: <20230828152134.4120496-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828152134.4120496-1-Shyam-sundar.S-k@amd.com>
References: <20230828152134.4120496-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|CO6PR12MB5393:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d2f166-b9c7-4011-a386-08dba7da88d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C+nNKJ9qkY7CmUY1ZJkwRfGwFZ2MLUAtJj9mQlQ1crkp9z/4XxeIU8HXimlXsrAbFf9yq9JffpfJq/s2kbE/eIT12CNjfT0f9kzDHdxzcgJeCCmF7ZhVF3vm3pjv3kG8rVHkpoLcSahoQWw3luGjl4/657wp/Ur+vKDGTB4XQFHg0hIn+tWCNPaaZZrf1PG4i73yeGwmI9PsB4H+TmpOPsWvWL4pZZC5ZzzROWUxuGkYbp8GQTt22bRNwiRYyCVtUgPiHCBhasJwBVc/77C5rdpp1Nvzbjy9Gxi5PfaZ6NZvDalnaO2E1EyN0H/I3T+V6nTLpwDsmTEOTda3wcJ5q6JnyqdKwQs5MQ1XElvKK/p9KcfojIyIvO72GRN/y6eevnaQLcZHK7Pa7ZJ2TDINZQ5jMfwgYL8iBdHqixqpL8KPTwtfBXWeeoQmYWcSwYQJNApz22yu/0/EolQD04bHFOEy7mmEgzU8Tm3akyOk/PAV/nNtjWn12OphM0/nEgJnMGkGZl/OOzfRujBWQjmY1PrL07kdnV6pBjH/6prTb1rekWBmCH6XN16OMOkNkmv+6S1Qph5eQlSvNYJAffa/lGZki8nzN2Z7nD6J2eEpEmgzslCeQS1AZQ3ZzUFWadx4Lnfn+pJRC8AfQpv++7ccO6BIXeZKaYGRFx7d3d+Rj0DE9eakosl/gl3l+zOWgBWHzi+8YnIMV52+YsBgwjI02WGsfYVmx/7RwCif/r/Fwg0IsybVV5xVnYatySZG3069znygMLpdv8VUYWBhlvS6fQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(82740400003)(7696005)(6666004)(36756003)(40460700003)(86362001)(81166007)(356005)(40480700001)(36860700001)(47076005)(2616005)(1076003)(336012)(2906002)(426003)(26005)(16526019)(83380400001)(478600001)(110136005)(70586007)(70206006)(4326008)(8676002)(8936002)(5660300002)(41300700001)(54906003)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 15:22:04.2843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d2f166-b9c7-4011-a386-08dba7da88d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5393
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
v1->v2:
 - rebase to 'review-hans' branch
 - drop 2/4 of v1
   (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)

 drivers/platform/x86/amd/pmc/pmc.c | 34 +++++++++++++++++++-----------
 drivers/platform/x86/amd/pmc/pmc.h |  1 +
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c92dd5077a16..1af7b6ac93bd 100644
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

