Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7DBC7EE29
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 11:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241073AbjEYLvK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 07:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241040AbjEYLvH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 07:51:07 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A123D8
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 04:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZ1PwR6RR8RO/Yk7rJST9y9+imTduGK6CP2x25XbtqOp+2mWxslBskvYxx7a79JAfzIRIBaGMpottmXGnpSHsXLyXZoK3OcwV8Y/ZRFg9a+ZkVjA/woqLF6k2Yg7E0n9oQvze3byqODUmf0i15b4IWj48FJZ0G7TQrQEa5UbQOXnrHIzLxmhDDxr7r4yEHBEOuo2COXb+L0BNw5tBc9yAYQTJOIOjP6BrS46Hn9pligdB6ITo3Xd6ma0RkbPF8up4qIkTep8Y6zWMGuXQJtoRhQf4iZ6aq705N41i/suwl/2FMKtLnid+GXR8XetN4zvFEz71cIU9T6Wys9/Sf0Nfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7y8sW1WUViJFismMBOX6ZiH63Wq8b7JE2Czvt65KujQ=;
 b=iVaPkBRKDvFlX8e5mf2ujeqhq9OgUM63BDf0U1Qj836ggN5vOjkV51cQb5f167J9FCf/LokGN2CTpiu58S3lHnaJbUyWb4az7c+wadvTZWKUlvXKkygpYDP40PrRqDEqivoYZ9W2iczlWe4KhsGgWeDzN2vcx25F5ELmAsjcpyRYSUcVcIqhNG7ETkVoxkLY87gwhxtxUN5oFzE8lThgT8WCwWY+H93p6YXmIxSPq2tbHOKZeXLnV8o8DrbaA9Mtld+bPCCsrd2HOREOWScsmHESTG7eGNUzOeyXs1H/MUzdWVwEqRBHiiguPuvXQNje2Wof+YCi8vtpWjFH2tJDtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y8sW1WUViJFismMBOX6ZiH63Wq8b7JE2Czvt65KujQ=;
 b=JX0j4N2My6YhxrPdpyO1ItSDRkxLG86ZPFSPw4inqnPzqcANkRIT+2mjh8CNENzcnN4T8iXivnvmvPV6rpsC5/jiv9633I9qcFw1z1AafY4i/C1EdD3Iu+/qVTZmdPrfj8eo9vBlYPasUG8e5LOvbLTOHRXtKZ7fG/doAHNktKk=
Received: from DS7PR07CA0005.namprd07.prod.outlook.com (2603:10b6:5:3af::15)
 by MN0PR12MB6368.namprd12.prod.outlook.com (2603:10b6:208:3d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 11:51:04 +0000
Received: from DM6NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::e8) by DS7PR07CA0005.outlook.office365.com
 (2603:10b6:5:3af::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 11:51:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT091.mail.protection.outlook.com (10.13.173.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 11:51:03 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 06:51:01 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 4/4] platform/x86/amd: pmc: Update metrics table info for Pink Sardine
Date:   Thu, 25 May 2023 17:20:04 +0530
Message-ID: <20230525115004.865395-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525115004.865395-1-Shyam-sundar.S-k@amd.com>
References: <20230525115004.865395-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT091:EE_|MN0PR12MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da28f04-6549-4e17-0e5e-08db5d165159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 60etEVDvfbc4AVxoz6uh6+ddp+SCMcXQ5UbfCvGMpEgd2rNEJALQuUdkxUNWAj8fRCVzXqpO5LC2ICya4N7QtAXXEzN7wqegQJDJXGGxF7VlVp1sQrveJjXxJ5vN9ZrAd7fI2zRATJO8MjE+tDcADOGownUc4ocqg282dLsEtp0dG2MD84qrHmPJfxrPEia95exyXff3Sveb7JsO5cwzjnL67j2xKBlfHyqf44+bdcEUYxm4tP2lCMx8dsvqZArOf6C09LA1g20tt2p0sOHZWVGosVfO16ERBhmzqPwh4i12GGFtR7Rp6JqfPtPUVL/s1jsg/1DPWTNVRkKtVf+3SZmCJEwmuWeKqPMG6UtqWBmpUSS0VQDO/EXuVgxpg3l0IKjgo3iCv8IjYrszMBzRxWCbKv4Gk4jhLW6GXyyfZnXGK7XkKe3THiqDZWdaK+dKynW6ervWaRZnZaly7vv3Iye9HneF6tgfZEQo9T5m0zD+Mb0pH10pfxaeLMtLa8pponWI1FPem2qRXNyq/FqlSlqqEjdG1vsjlz8b2ZyciO0h6EQM1l0QwYOnWGacwrg6GuHafGrwsq9r3EcGFQBW+YAcLREqMXyEchHp9SQLTq0YHpDY883c84rOZ43fNbvb+9wrwdcyS6ax5IQaHfuMVoZAtS9uLNFcGkaOL49vfqsVXTaC4fclOq0cRy7onAh8JOn5m2mAy5ybet2bSv/VVKo1ukpwr2/XyykrkJ/ZNnDEMRknxc0arUQ/pQdyG3BWnUASjR9Cerru13psIzi5Qg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(40470700004)(46966006)(36840700001)(2616005)(83380400001)(40460700003)(426003)(336012)(2906002)(47076005)(16526019)(186003)(36756003)(82310400005)(86362001)(81166007)(356005)(82740400003)(36860700001)(40480700001)(7696005)(316002)(8936002)(41300700001)(8676002)(5660300002)(478600001)(110136005)(54906003)(70206006)(70586007)(4326008)(1076003)(15650500001)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 11:51:03.7730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da28f04-6549-4e17-0e5e-08db5d165159
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6368
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
index db0c330d4b85..db435188cc08 100644
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

