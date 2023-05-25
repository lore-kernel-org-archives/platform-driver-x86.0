Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A2EC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 14:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241215AbjEYOUK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 10:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241241AbjEYOUJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 10:20:09 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6511AB
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 07:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZAorFGbSZolJLlW6+DeFX8b9UQv72fR7730P4ZXLFQLBG7Z2AMQ8ySGwPPhqkbJr/TcG/mnLhY+iQI0+Pte6xFvVYdzJnVJkMuWx5vgwebmRaMY5sS1UJmYo599GeZNgNKKg0IDsm2d988sV/E/HjdDQ5LeIVkVCT88l9pQNM41Tx8hbygPob4NU1TypJS1kIqDTEZkqOFhEwaDO7EWoe6DcwBOe2H4hT/Q245yDOW3Di43J5zHTdfdSUoOhrMTlMveBCuF6u2Q4PfaHWOIdaEMi+3gwjnEWu8C/+44ZExueIOwTokb+vECL1yZ8uOtm2k2cYltPzSd4a1nijCmdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sud4pIn8CCYvZnJZhb2/BHtqOW+ZMZKBxJDzBA5m6ts=;
 b=WyelAxH1bE5vPZ5hTGigTdtfl/t3t4PFKf262UuOI02UYNpscyvR9U68/G0Se7+A46vQi2vGWa0RSaosN+w/bw3bSNXs1EZ/PzmLR7JBhiPZF5c25gRMGskRSooJNPsyHOPv4PH8EnX+T9sKRSgxxVOB70QCTefrC5tiylSbpWF0kiztwIeEgrcjnMjEzRPlYwsoFXwJgEK5pQY1cppp+0ONw670reJh5D6vgG+zplk6QnV6oWBHISdfu6xXKaxOExSAQO5Cizhhyrlyi7gQEG6dMx4btzEnBJLhUXkWwIdTMuXbe3hCNlPpupOyq4d6UgCgbkqKu4qO6I7FeJhiWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sud4pIn8CCYvZnJZhb2/BHtqOW+ZMZKBxJDzBA5m6ts=;
 b=wRxSdymbTUwIgOabM8oHKKP3jBRZgm53QXpwquoS4FckDlOw/6/yH6X/Ez0t0NMLTXfV051prV11Cr+k8eJQ9FbD28uUh7FeTXPfDf3fHhTKqYUhznkCGQ3NyHu3OT19dOBJ1Cf0s3UxNIohqYDFpYg4sFNColE2bFl+zPd8Zic=
Received: from BN9PR03CA0639.namprd03.prod.outlook.com (2603:10b6:408:13b::14)
 by BY5PR12MB4885.namprd12.prod.outlook.com (2603:10b6:a03:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 14:20:01 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::74) by BN9PR03CA0639.outlook.office365.com
 (2603:10b6:408:13b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 14:20:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 14:20:01 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 09:19:57 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 4/4] platform/x86/amd: pmc: Update metrics table info for Pink Sardine
Date:   Thu, 25 May 2023 19:49:29 +0530
Message-ID: <20230525141929.866385-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
References: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT003:EE_|BY5PR12MB4885:EE_
X-MS-Office365-Filtering-Correlation-Id: 0384f56b-7cd4-477f-f0b6-08db5d2b205b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zYqv1ohap5bGO7WvE265eEPLqdSEaKHrLdAcfq6ldiTKQWFDy2r5tieStPXR2zoJtWpw1ng+Jrxt0V7bqZr0K0AiqCbOmmynuhsZcYrZUUryNPmlwhWsig+J3FPBzEdEQTXdJc0xgsjGHO9tSmUmkJjJOTyRXcICdeIVN8ibrlAOEjGMulcYisTu4pYy7Bi0gCHF8OXuDteZh30kQPadPddHm+rfAs1pY6yCv8NpIXmfzrx+/9nY6RagO2ur2t32g37vaMCutcNNlaAXHZNDEzbsbWeEKryvAp8rk4Toy3dbsiPOnWZmCQP4/4wdrtM/1oFCjaiPlpDOt8h4Q/415IOz5/1ShFwto3YwHiSbKnh1KlXeWQUO1d1x2/xdjc7cvQ5CUowAnZ611rNUtfgQWKTZVj9m3LSrAaK/ivCX3V1iLUKhT4S7nEkH4b4+m79+Z5dtaFG6+ucNIBPCdqh8mWX38BRpPKX8jJafDfv66iWarUcc48ODKjj+KTi9PFPZ3nMRdEmriDBHVOTFpQ+lfHB5RmrjHczHMwc3gjY/hMxW/7pz3OE5v3dLpwNwPeFCyOLzwfXwa3XxfnUiR9UXO+mH/PxCb04wUSanZVdyJd+0JgkyNfQrq7IIJYuPRZppdI6VLM2XoPx3EQBJdg6Lr9uTw6KBra6vr7AotqVfhfTFWtEYl7h4ecB199jTzmJdlxadLP64oYZ3gTrFedxnUGmhp3W7NYWK+X2i7vL0lWSGwbh60yW4ah8YeH/JVkJvfeyCGZscmif6AGuWUmIbfg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199021)(46966006)(40470700004)(36840700001)(54906003)(41300700001)(110136005)(316002)(1076003)(26005)(478600001)(7696005)(70586007)(6666004)(4326008)(70206006)(8676002)(5660300002)(40460700003)(8936002)(83380400001)(2616005)(86362001)(2906002)(426003)(336012)(36756003)(356005)(40480700001)(81166007)(82310400005)(82740400003)(16526019)(186003)(15650500001)(47076005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 14:20:01.0461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0384f56b-7cd4-477f-f0b6-08db5d2b205b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4885
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Starting from Pink Sardine, number of IP blocks were added to the SoC
and the PMFW has the ability to give debug stats on each the IP blocks
after a S0ix cycle within part of the SMU metrics table.

To differentiate this change, the 's2d_msg_id' is also changed. Add these
new capabilities to the driver.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 53 ++++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index c2f03cdc9ca9..f7bda8a64c95 100644
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

