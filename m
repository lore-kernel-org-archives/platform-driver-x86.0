Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E62AC77B6E
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 Apr 2023 18:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjDISzB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 9 Apr 2023 14:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjDISzB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2023 14:55:01 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BB730C6
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Apr 2023 11:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnGx5ycUquaw71lc8kJ/muKUr7/x5CrvdVfshxXlnpTwu7knjjw/clvErr61BXC+tZ3PEgQtQ2r9Ag16vGewBfDPysyTt5w5oMLM/5jZkiCsiQzs9gVm7qKZ4/JDHVpAhliTVuCdNChlCKFGeEmYgwpvzUl0ebyeSRlnX0dZ6ySWkiPRieXKgwKsKiO/TF1GKo+Dw/nKnjIPCoQw7zC6rSp+As9ijL0dqm9xd8D/fWbvkixVkuLZIqlOMWaTPbCEU3UF/aHUeUbdZG0Pkrrjh9E1HNZKVMUNPnb+6cQTpJ6FbgOKvUOPvASDjjctGPnSZFfoxPEC6+yR9zXa+HovjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2g5IDVgaDEPIjGeNaGJOeliioV2GgttausGBLKhRRM=;
 b=RgZ53tpvF9glQuUzIoL1eZ+kHo5IM74HkqUKCx2geGu2ikY/nUE+I+OyqoMkwx86c0DdCYm1MsrTARP62wVIYoAZtq/IqWx3krD6ugS3+DNxt7omh3FC9nSP7dmIhsSRPeqfqNkZKSo9sR/o+bHFqVpRZCrNbmcQpF0FyF993EpPedIpiA4f4Sh3xMqvvl3PXiwSvEoyNoO/djCzQetIZGTyaony7f9FlPrEO3myvJkIpLG1g4HO0BiF+7mVtvy13LwPnBH6mwhiZ/OrAuAHTBnq+RDIjuyUIIrzbBsWWGpKdcofFjSoTkeZ81iG+CNjn/5Tl5o9U5ynNFlIijMq+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2g5IDVgaDEPIjGeNaGJOeliioV2GgttausGBLKhRRM=;
 b=Z5ScaPsEUYoCjbkycKaurTElbQ0WFnbxYmZb0D4b0u1rZlsofzWBNAmF7jgYa5lXdXsIUlmU1x12yZZiTSHsJjRx/b4PQHwJNYRCIRoV7UdEfZzvd7YRGyL6IbIBbPKeUIqDAKj+Tm+QuWjqhV8gahwKeVC6YX3DKrZyBnhcOoA=
Received: from BL0PR1501CA0029.namprd15.prod.outlook.com
 (2603:10b6:207:17::42) by BL1PR12MB5270.namprd12.prod.outlook.com
 (2603:10b6:208:31e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Sun, 9 Apr
 2023 18:54:55 +0000
Received: from BL02EPF00010208.namprd05.prod.outlook.com
 (2603:10b6:207:17:cafe::bd) by BL0PR1501CA0029.outlook.office365.com
 (2603:10b6:207:17::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Sun, 9 Apr 2023 18:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010208.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6277.30 via Frontend Transport; Sun, 9 Apr 2023 18:54:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 9 Apr
 2023 13:54:53 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 8/8] platform/x86/amd: pmc: update metrics table info for Pink Sardine
Date:   Mon, 10 Apr 2023 00:23:48 +0530
Message-ID: <20230409185348.556161-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010208:EE_|BL1PR12MB5270:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f26558-7506-4f4d-cbe6-08db392be8ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +/c8b/SUE3FxkqVTS7cQklZBGwruQ+AFN7BNRPvXySEzjLJ5H2wC2bvy0QqTUTz+ziiEKq5noEP5ehVrPehBEglKzA6i1i+DySv2+IkzfixCGig0Kwn8WXJLO7/bk+OTTDyAp5x0HPrpBH9qRapVyD8U2C7KlU4l0jjPC4bOJEZVx4n+OYFA55NRklE56sNy+Us2IG5Km1IdGCyT9ekp9Nc7v4RVEW/EJdQUxcEtI6e5QXPgq0joAZC9kVyBkjQhYSvWc7rlQhvmSoqExfLpr+g1koUjadXplcJAzKf6NVdrpPoy/AWdFhLxVu0n5fkehBzFPJ4/QSUBR/CGlyJJkA38m47ef9angdYIDwbGYUPG/ST5I1m/PtlnRI+aj5zOlgC5Jt8Zcr5or1E+NVBU1uvcNWkN5ic6W0hMVS24bilGhTKJq8BjxXqpoHHXkiDsKrApS2tWYLrnrTnnwbVvK1ZkklwLvJOVKQrelYmMyhXcWAA5WT4ikVHgabd/BVjjrrXlGXNFFx3b7cyYZjD4VKWbrgaTxzQLX/GXQzMGe5ROwca2f60pRbmGGs0jbyUjTZInRsRzT04CrVtctU/7GgzqcI/a12mG0llK5aQm+EHGMsapB76/ksqtjIyOaFwJwsC62r5GtZ+QDFvME4Y4RUEXUJYn2PP/tvynKrIf6aaxbpQV4r14Zs1kJgH3vTYyTNDXxPzyt88vg0aUU8EXi+91FNbWuVGox+BQxRSR38I=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(6666004)(81166007)(70206006)(36860700001)(478600001)(70586007)(4326008)(356005)(41300700001)(8676002)(316002)(54906003)(110136005)(8936002)(82740400003)(5660300002)(336012)(186003)(47076005)(16526019)(83380400001)(7696005)(2616005)(426003)(1076003)(26005)(15650500001)(82310400005)(36756003)(2906002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2023 18:54:55.6863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f26558-7506-4f4d-cbe6-08db392be8ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5270
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Starting from Pink Sardine, number of IP blocks were added to the
SoC and the PMFW has the ability to give debug stats on each the IP blocks
after a S0ix cycle within part of the SMU metrics table. Add this new
capability to the driver.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc.c | 56 ++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 86f32b01e3ff..b27e93cfbe61 100644
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
@@ -197,8 +206,8 @@ struct smu_metrics {
 	u64 timein_s0i3_totaltime;
 	u64 timein_swdrips_lastcapture;
 	u64 timein_swdrips_totaltime;
-	u64 timecondition_notmet_lastcapture[SOC_SUBSYSTEM_IP_MAX];
-	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
+	u64 timecondition_notmet_lastcapture[32];
+	u64 timecondition_notmet_totaltime[32];
 } __packed;
 
 static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
@@ -264,7 +273,7 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
 	dev->msg_port = 1;
 
 	/* Get the num_samples to calculate the last push location */
-	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, STB_SPILL_TO_DRAM, 1);
+	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, 1);
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
@@ -474,7 +500,7 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 		   table.timeto_resume_to_os_lastcapture);
 
 	seq_puts(s, "\n=== Active time (in us) ===\n");
-	for (idx = 0 ; idx < SOC_SUBSYSTEM_IP_MAX ; idx++) {
+	for (idx = 0 ; idx < dev->num_ips ; idx++) {
 		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
 			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
 				   table.timecondition_notmet_lastcapture[idx]);
@@ -905,7 +931,7 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
 	if (dev->major > 90 || (dev->major == 90 && dev->minor > 39))
 		goto err_dram_size;
 
-	amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, STB_SPILL_TO_DRAM, 1);
+	amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, 1);
 	if (!dev->dram_size)
 		goto err_dram_size;
 
@@ -926,7 +952,10 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
 
-	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, STB_SPILL_TO_DRAM, 1);
+	/* Get num of IP blocks within the SoC */
+	amd_pmc_get_ip_info(dev);
+
+	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, 1);
 	if (size != S2D_TELEMETRY_BYTES_MAX)
 		return -EIO;
 
@@ -936,8 +965,8 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
 
 	/* Get STB DRAM address */
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, STB_SPILL_TO_DRAM, 1);
-	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, STB_SPILL_TO_DRAM, 1);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, 1);
+	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, 1);
 
 	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
 
@@ -1028,7 +1057,8 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
-	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)) {
+	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB ||
+			   dev->cpu_id == AMD_CPU_ID_PS)) {
 		err = amd_pmc_s2d_init(dev);
 		if (err)
 			goto err_pci_dev_put;
-- 
2.25.1

