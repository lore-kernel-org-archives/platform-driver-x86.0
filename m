Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267B5C77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 May 2023 09:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbjEPJSg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 May 2023 05:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbjEPJSW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 May 2023 05:18:22 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12D21720
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 May 2023 02:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXGkR8ETGo9GmmBVkBJVlJJyC3KqaTLAXGlpm6BuEIYtyIRgcm8/suqdx8gkf/sftRagZYuohjH444CVck1gWm3I+NLDZZDiqscaXY9EFZVLjH3ZCfZijClbUn68czmhO+pMAW0oLG+uRDqkBx9meG2/cSyDyXHd20DB3p9FcOKPc0YQFDkWzPNJs5CIoEH9Z2PbPOjI47zEgrgzGwPgruCtT4xxXMXeSA8ILojcUy9qHUr/IniCxx93s7cY6CfU0hysPhtqJYaVG4EtM+GubGpXPKbXBsL0UGfOlTYcN3zUW4CvH9w+VcQzCRVlmM/hgMepEUJfY3Z5SmbS+1Rz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeDtv69JQqMWMi5M+lt7ZjJSucaokNPADMaY3+PV8Mg=;
 b=BMYui24RJAcP1tTAs14sn3Y3pIOTl8CmWQZK8Yg5ho8dTZA1VVA9DVISzi9mo9e58FaIS3phcTScHtl/UN+LuHmcpSObOqsIC0oGh1iJ1ugKdUT0GDt9CA2QIxW26UI69tzbRpluRjc7xfp5xBFr+6g6Qo27w7rxlIDv2xAuIREbcO8WFLjN5kYk15JIedX2AKRsanJB2CqY2sO4TUnXp2n+CpjBmOVTEp+DxD7Yp/CTtvq9yGVAmTs7q7tY+1gvdp9t3BLWv4h4/XEjtWM4WFIm37FHJcOVGaTS+4rF+hT0tbr1f0xGLZf2o+IY2JZIUpweUYws/3L1sRwLJK8xcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeDtv69JQqMWMi5M+lt7ZjJSucaokNPADMaY3+PV8Mg=;
 b=HQhZuPurGJuyR+RyDwUH0KVVt2SKyXdJYwFcPzwVS9vxayRa1JxbDmpGrOTHzQKT06w3uWNSlOuBLBpnrJ01toIXYfsfbdLB6IewtiIW7MIGy4zJZ+ETlM/vDpH8wwDPUBXFW9u0dn7JZNvfmUE0LxGjmtx4qfrKwgxOCwLyv9Y=
Received: from MW4PR04CA0316.namprd04.prod.outlook.com (2603:10b6:303:82::21)
 by BN9PR12MB5356.namprd12.prod.outlook.com (2603:10b6:408:105::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 09:14:20 +0000
Received: from CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::37) by MW4PR04CA0316.outlook.office365.com
 (2603:10b6:303:82::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.31 via Frontend
 Transport; Tue, 16 May 2023 09:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT092.mail.protection.outlook.com (10.13.175.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.16 via Frontend Transport; Tue, 16 May 2023 09:14:20 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 04:13:41 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 4/4] platform/x86/amd: pmc: Update metrics table info for Pink Sardine
Date:   Tue, 16 May 2023 14:43:08 +0530
Message-ID: <20230516091308.3905113-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT092:EE_|BN9PR12MB5356:EE_
X-MS-Office365-Filtering-Correlation-Id: 07fe28df-ef67-42ac-eea3-08db55edeed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sAav+sgrRkHFdBUUQPw8CiuRq28B0YphxeIgwiuUtbq/iex3HGHU2bjLIXDeoTzMUsO0iSZrlUNXLBlMdKuucfJP0CXrACIAaoT4mWt0hvFaY26lUIo1TXhXVtQwn6c1DkO9XlBGUHWv49iLfx1a9f12/Y80kbpKCafWOYN0XdAAUcrcjD3CRzHYNdbS6S+gNi8zLk6u8BTQ4Jl74GycqCmGK6QglSZsamHRzKHPmDYnfswzir80Xc9fyLDdCUToWyKxMRPclCapQlnmEKAWsC+zNgFi8xY69bHP5wqzxACPxPzj5QyiEOzGpeGSv+5UXrL16SkfB9b2nUI1OBQx2ti8jGg6Z76zuTT0oXvRnEGF8AB72iEN4Qh25U2sfoQvIIid0SBXb8WOOq36reRmrvIh6ZXb1xek6ZcPSPg2HiNGUtvxcaLAxsBA7uO9cWkVWn/PATNW90ZCQqxnuAWck5gj1nq2plOL7flpiYBesy0HXqUK5LxN8WxfvmThKaWDmc4hB9uf7+LC6RM/r//+QnRPDvGpQBKwxNbqpMj7FdHkXuKBTQ6jtfliwdzW9Pjno86HtMobNPZbT20TN9HNQ8G5hyugtxKdZPqIfe+7vwSir/JTMcPL8Xk/QqYvVGXD7EmBN7TDIQyRVyO94vJnndzs541RtBNDbumKHpS1wM4aH37lVE9/s7CZ82y/FsyrKTNA4pCPEK9r6g42KlckPrc2Tqh5c3P3NHnH0eVB2e0GZa5fAAkbhhsxZfqh0j26o0sAp1JzJ9GBZ1c2GseDdg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(4326008)(36756003)(15650500001)(2906002)(426003)(336012)(8676002)(5660300002)(86362001)(8936002)(40460700003)(41300700001)(40480700001)(316002)(70206006)(70586007)(54906003)(478600001)(6666004)(7696005)(110136005)(186003)(16526019)(82740400003)(356005)(26005)(1076003)(36860700001)(47076005)(82310400005)(83380400001)(2616005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 09:14:20.4299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07fe28df-ef67-42ac-eea3-08db55edeed8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5356
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Starting from Pink Sardine, number of IP blocks were added to the SoC
and the PMFW has the ability to give debug stats on each the IP blocks
after a S0ix cycle within part of the SMU metrics table. Add this new
capability to the driver.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 53 ++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 7e5e6afb3410..0e67325a5aec 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -45,7 +45,6 @@
 #define AMD_PMC_STB_DUMMY_PC		0xC6000007
 
 /* STB S2D(Spill to DRAM) has different message port offset */
-#define STB_SPILL_TO_DRAM		0xBE
 #define AMD_S2D_REGISTER_MESSAGE	0xA20
 #define AMD_S2D_REGISTER_RESPONSE	0xA80
 #define AMD_S2D_REGISTER_ARGUMENT	0xA88
@@ -99,7 +98,6 @@
 #define PMC_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
 
-#define SOC_SUBSYSTEM_IP_MAX	12
 #define DELAY_MIN_US		2000
 #define DELAY_MAX_US		3000
 #define FIFO_SIZE		4096
@@ -133,9 +131,18 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"ISP",		BIT(6)},
 	{"NBIO",	BIT(7)},
 	{"DF",		BIT(8)},
-	{"USB0",	BIT(9)},
-	{"USB1",	BIT(10)},
+	{"USB3_0",	BIT(9)},
+	{"USB3_1",	BIT(10)},
 	{"LAPIC",	BIT(11)},
+	{"USB3_2",	BIT(12)},
+	{"USB3_3",	BIT(13)},
+	{"USB3_4",	BIT(14)},
+	{"USB4_0",	BIT(15)},
+	{"USB4_1",	BIT(16)},
+	{"MPM",		BIT(17)},
+	{"JPEG",	BIT(18)},
+	{"IPU",		BIT(19)},
+	{"UMSCH",	BIT(20)},
 	{}
 };
 
@@ -149,6 +156,8 @@ struct amd_pmc_dev {
 	u32 cpu_id;
 	u32 active_ips;
 	u32 dram_size;
+	u32 num_ips;
+	u32 s2d_msg_id;
 /* SMU version information */
 	u8 smu_program;
 	u8 major;
@@ -196,8 +205,8 @@ struct smu_metrics {
 	u64 timein_s0i3_totaltime;
 	u64 timein_swdrips_lastcapture;
 	u64 timein_swdrips_totaltime;
-	u64 timecondition_notmet_lastcapture[SOC_SUBSYSTEM_IP_MAX];
-	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
+	u64 timecondition_notmet_lastcapture[32];
+	u64 timecondition_notmet_totaltime[32];
 } __packed;
 
 static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
@@ -263,7 +272,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	dev->msg_port = 1;
 
 	/* Get the num_samples to calculate the last push location */
-	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, true);
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
 	/* Clear msg_port for other SMU operation */
 	dev->msg_port = 0;
 	if (ret) {
@@ -310,6 +319,23 @@ static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
 	.release = amd_pmc_stb_debugfs_release_v2,
 };
 
+static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
+{
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_PCO:
+	case AMD_CPU_ID_RN:
+	case AMD_CPU_ID_YC:
+	case AMD_CPU_ID_CB:
+		dev->num_ips = 12;
+		dev->s2d_msg_id = 0xBE;
+		break;
+	case AMD_CPU_ID_PS:
+		dev->num_ips = 21;
+		dev->s2d_msg_id = 0x85;
+		break;
+	}
+}
+
 static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
 {
 	if (dev->cpu_id == AMD_CPU_ID_PCO) {
@@ -471,7 +497,7 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 		   table.timeto_resume_to_os_lastcapture);
 
 	seq_puts(s, "\n=== Active time (in us) ===\n");
-	for (idx = 0 ; idx < SOC_SUBSYSTEM_IP_MAX ; idx++) {
+	for (idx = 0 ; idx < dev->num_ips ; idx++) {
 		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
 			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
 				   table.timecondition_notmet_lastcapture[idx]);
@@ -919,7 +945,7 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
 		goto err_dram_size;
 	}
 
-	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, STB_SPILL_TO_DRAM, true);
+	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
 	if (ret || !dev->dram_size)
 		goto err_dram_size;
 
@@ -940,7 +966,10 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
 
-	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, true);
+	/* Get num of IP blocks within the SoC */
+	amd_pmc_get_ip_info(dev);
+
+	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
 	if (size != S2D_TELEMETRY_BYTES_MAX)
 		return -EIO;
 
@@ -950,8 +979,8 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
 
 	/* Get STB DRAM address */
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, true);
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, true);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
 
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
-- 
2.25.1

