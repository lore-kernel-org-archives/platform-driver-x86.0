Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF59C77B71
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 10:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbjDLKWz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 06:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbjDLKWr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 06:22:47 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04BCB65B8
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 03:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdQs86pS03foaGRrNwrN27ib4UKQiaLme3unMRDylGuVzS+TmsaxpyGw1ggL2ILwmGAlLDxPLtzpkWxRqTKQMbjpzC2nweZ+Tf5xX4uQsTfkQAJc5svD33yuLdOhdgEHe23rpYlRnxIh4Rzxup2gvVfnWritrm/6WQjrM4tDFDeD6p1/GrhN++8LD2Z1tWgtNHbhTrs+pMAoPpuljxnzhe+MDPsToUXws2M/hk0jmGVT8ulNcqTYBHBglmY+oddtuS6dvjCxL3YbVrhFKiuAiYVbyBt71PYlmlWJPWPjjMuLZPwxyliIHMGaWbQhAxn5tnP2/LgiMAdcOWvkr+dirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WMG1JBY8hWgC5mlmhkRXdBBREnXG+Bj1AN/DeujlBU=;
 b=oQ2PrEL1eyak0yO6rrmaKaSbbHybIngfwCq8kU4f0nHwcH52kULlmSiq4TmgH2LDa2S4GAcaRx8bLwLOaneLXEoOmouBP/wo42My3zWq83RFo7OOpwX4tE8DJCLYjhn6wXqZZKHBU+ea/gnvSgnUAWJOXewNEVTmqfzIVP4g54VatxHFA9kHvZe4eWH21Osfnz7xex9In9om6I8pd1h7H1fTDtWr+nZdWhKlFc5sGiJkmWQyYpJzMAMPP+GPe41NmU7n+MVuTMhH2QiG03ePawexqY1R5OU9QrRjt2zZA4lLmtCbAHytgyf6ofhJ89TAkphw6+GTkxJ85LAVUkjQ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WMG1JBY8hWgC5mlmhkRXdBBREnXG+Bj1AN/DeujlBU=;
 b=4fe7yV2JcoujxUyi/iIaX8PTThyhKYtsTFKtlO5M6h4Bzcuo0WTz143INNOH/NPWqFRtH19vJ5Ov4gNUf0zsubJxu6wdiKXFa+0nH50x38Lnrdo4uG9Y7Lr5n0oIZavrJOREvioqacOEbBG7BvwAKwEf7hzetqpc/goqGkmcT3Q=
Received: from BN9PR03CA0924.namprd03.prod.outlook.com (2603:10b6:408:107::29)
 by CH3PR12MB8330.namprd12.prod.outlook.com (2603:10b6:610:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 10:22:42 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::7b) by BN9PR03CA0924.outlook.office365.com
 (2603:10b6:408:107::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30 via Frontend
 Transport; Wed, 12 Apr 2023 10:22:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.30 via Frontend Transport; Wed, 12 Apr 2023 10:22:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 12 Apr
 2023 05:22:39 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
        <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd: pmc: update metrics table info for Pink Sardine
Date:   Wed, 12 Apr 2023 15:51:56 +0530
Message-ID: <20230412102156.2592318-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412102156.2592318-1-Shyam-sundar.S-k@amd.com>
References: <20230412102156.2592318-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|CH3PR12MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d39e6b-9bd3-4842-0a82-08db3b3fd974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8X9/4i8s0MYEiUk8LwW/LWg3JOXeLdbRJvFASKaXnkZy5OI7faU6VH1AfQekR16ihxmHNcEvIZ+9DCIxr6zGezn/K1CYzx7wMYgynD/VxgpvNHUxJGpFdxNFx+QnfDUG+KaNQASY6APWTiuBJgFiQg32NJCevG8pSgSePbpUSIlLbs7xW0baPmaPetxjajk785gsvwhcTl4NxzMhBBNfA/t8TYo9BNeP86Dl/zXkZF62FjckT+tngybEJTVSfWsY1mZHpjkAKGh2xsj9d8bIjls+KJLJYG6O5t3vfipovtSiSzxC1BFh3/MrUeVqH/CO1SOAhL1LazFXnb5f6Ph8/mcjVlSWjtwUU+6MEVBOyChEOGJLz1WllHA6vtRjuRzF9BYV2iaUPiHGTox67UXx3FMuCbc8YMfUCEn6pT0rjUDFnsQT4s02wXkNWnw2GsyFNatUTt2LWrv/pufRs4lbm8Ld/uzShUX4DX3Cxm38Gm6SkdQnOHHfwdA94/EJorYYAKA05G2l+I7pBUcfP4J8VSFjWP/EbOREQsZkkf4ALbdDQxNZdWR5mDJhrWOhhG+N3YI8UGSNsWYvSN/UOCfJUt1zd8zDQrvr1JI6EBg3xodmc5cMcltrl08ytx7k7IBu+FLbwrNBQ4yjGZOVoL7M8SC0E7As0pDag/BQ0U5VXxWWgF53FlWQmT+Jze/5hWjw1ENGVuPH82OaICAjmZy65okEB88PXDcYUFFfbgNpAmg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(478600001)(7696005)(6666004)(40460700003)(1076003)(83380400001)(40480700001)(36756003)(82740400003)(81166007)(356005)(86362001)(47076005)(2616005)(36860700001)(426003)(2906002)(336012)(26005)(110136005)(316002)(54906003)(5660300002)(186003)(4326008)(8676002)(82310400005)(8936002)(41300700001)(15650500001)(70206006)(70586007)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 10:22:41.9827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d39e6b-9bd3-4842-0a82-08db3b3fd974
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8330
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Starting from Pink Sardine, number of IP blocks were added to the SoC
and the PMFW has the ability to give debug stats on each the IP blocks
after a S0ix cycle within part of the SMU metrics table. Add this new
capability to the driver.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2:
 - Based on review-hans branch
 - No code change

 drivers/platform/x86/amd/pmc.c | 56 ++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 9f8bc6711413..bb7597ca334f 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -45,7 +45,6 @@
 #define AMD_PMC_STB_DUMMY_PC		0xC6000007
 
 /* STB S2D(Spill to DRAM) has different message port offset */
-#define STB_SPILL_TO_DRAM		0xBE
 #define AMD_S2D_REGISTER_MESSAGE	0xA20
 #define AMD_S2D_REGISTER_RESPONSE	0xA80
 #define AMD_S2D_REGISTER_ARGUMENT	0xA88
@@ -98,7 +97,6 @@
 #define PMC_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
 
-#define SOC_SUBSYSTEM_IP_MAX	12
 #define DELAY_MIN_US		2000
 #define DELAY_MAX_US		3000
 #define FIFO_SIZE		4096
@@ -132,9 +130,18 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
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
 
@@ -148,6 +155,8 @@ struct amd_pmc_dev {
 	u32 cpu_id;
 	u32 active_ips;
 	u32 dram_size;
+	u32 num_ips;
+	u32 s2d_msg_id;
 /* SMU version information */
 	u8 smu_program;
 	u8 major;
@@ -195,8 +204,8 @@ struct smu_metrics {
 	u64 timein_s0i3_totaltime;
 	u64 timein_swdrips_lastcapture;
 	u64 timein_swdrips_totaltime;
-	u64 timecondition_notmet_lastcapture[SOC_SUBSYSTEM_IP_MAX];
-	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
+	u64 timecondition_notmet_lastcapture[32];
+	u64 timecondition_notmet_totaltime[32];
 } __packed;
 
 static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
@@ -262,7 +271,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	dev->msg_port = 1;
 
 	/* Get the num_samples to calculate the last push location */
-	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, 1);
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, 1);
 	/* Clear msg_port for other SMU operation */
 	dev->msg_port = 0;
 	if (ret) {
@@ -308,6 +317,23 @@ static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
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
@@ -470,7 +496,7 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 		   table.timeto_resume_to_os_lastcapture);
 
 	seq_puts(s, "\n=== Active time (in us) ===\n");
-	for (idx = 0 ; idx < SOC_SUBSYSTEM_IP_MAX ; idx++) {
+	for (idx = 0 ; idx < dev->num_ips ; idx++) {
 		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
 			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
 				   table.timecondition_notmet_lastcapture[idx]);
@@ -901,7 +927,7 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
 		goto err_dram_size;
 	}
 
-	amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, STB_SPILL_TO_DRAM, 1);
+	amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, 1);
 	if (!dev->dram_size)
 		goto err_dram_size;
 
@@ -922,7 +948,10 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
 
-	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, 1);
+	/* Get num of IP blocks within the SoC */
+	amd_pmc_get_ip_info(dev);
+
+	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, 1);
 	if (size != S2D_TELEMETRY_BYTES_MAX)
 		return -EIO;
 
@@ -932,8 +961,8 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
 
 	/* Get STB DRAM address */
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, 1);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, 1);
 
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
@@ -1022,7 +1051,8 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
-	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)) {
+	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB ||
+			   dev->cpu_id == AMD_CPU_ID_PS)) {
 		err = amd_pmc_s2d_init(dev);
 		if (err)
 			goto err_pci_dev_put;
-- 
2.25.1

