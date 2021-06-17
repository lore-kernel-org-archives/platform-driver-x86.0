Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCE1C48BE5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB08E613CE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 11:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbhFQLdY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 07:33:24 -0400
Received: from mail-sn1anam02on2052.outbound.protection.outlook.com ([40.107.96.52]:62265
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232308AbhFQLdY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 07:33:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hc4HHR+p5YbcvXSfmgSJflkS3a07TJhjSifq37kYMPXRKW5vmDPh0+kCh5Pjpi6pT0LnjHTiG5kQZ9m80lk4Qeq86hBmVs1W4JOnYZ9qMvK8xIdrfZbK2cwi6KvLT310cvamslSCbT5m0bR3kL40XNO11aijoqfkWq/Nb4iYG+hhDrLn1b0x//l7EMXJR3B1GOAOZnxEmf9m0uu3opUEWTDqNLddUqrDUngYf5YFN0emou9DOBxxaZ8M2SWBfxA2tF7cMv17xS3JFp0HEr8EMJNfQceMDvUv7yWd4JXthpA3sz3czk1uOW32NhuqQujuEqaV+cx138Qfm9BbUg8ppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VcUa0e2Zdqdquhsj4egb/VVohjhUf8ysDOeft4XjPU=;
 b=MYuCHkrLtC8qlsnNT3uRVSkfY7XzL02Mo6fVv44a/zIVK3WKz/6vU8R+4V3iJlhjvXnTroWz8ccaWTRTHr6Spua76tXQGakLUTp/fdzR3sfUhfGVfQZwJ2E6LBT2mG9vDCrPXLJWhQ4nqbRHE5nztTAGnVR/0BFiqevgQ60nXHZXy6UjSjZ59KIWTxuAs6n/UlBBIeuj6mXQ0XZ66HJzKb2JCSTXQ+OkAFwaOg3TG27Hvw45G758lXZiSrAXPV7YyUIL2OMIQm+zc5K5Ihj/VtbF5n64QNFY1bSmYPc7XBES4qFG49qNWDla9ToYLVh4PqgpVvHEvzo5cFd1JNWBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VcUa0e2Zdqdquhsj4egb/VVohjhUf8ysDOeft4XjPU=;
 b=V0/bUs8fkdz8QXvcr/bzWppV2XKbwxzqD7+fBxGyU7kvpwUCak1RCuLaEpk8EJ9k0Onz+VNR8R0Fr+hlJFF4r5/WzIsMIKvYAXSqoKbDldr0bWR9yrgnUL83J20YzDeS1INYSzk1lbrr6XQpylMz1OQf2TPbVzzcNDjkTNroR6M=
Received: from DM3PR11CA0022.namprd11.prod.outlook.com (2603:10b6:0:54::32) by
 DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15; Thu, 17 Jun 2021 11:31:15 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:54:cafe::21) by DM3PR11CA0022.outlook.office365.com
 (2603:10b6:0:54::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend
 Transport; Thu, 17 Jun 2021 11:31:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Thu, 17 Jun 2021 11:31:15 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 17 Jun
 2021 06:31:13 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/6] platform/x86: amd-pmc: Add support for logging s0ix counters
Date:   Thu, 17 Jun 2021 17:00:38 +0530
Message-ID: <20210617113040.1603970-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
References: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6300ccf6-1590-44b0-2f13-08d931836b31
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:
X-Microsoft-Antispam-PRVS: <DM8PR12MB5447D97949F6C79E988CC83D9A0E9@DM8PR12MB5447.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bCah1Ws6X09rukVBFBikJLAQSkiPGFk+/BjPmT603gtTnng16naFgAnxaPUh50AsJNpW1oSyG61X0uF1pV71HsdpXJZjBHsJbKTXlA91j2QzKkd9nuuGPBVgsWvyrNZusDKC80UykUZrnTNfRq3rGERU55SnDA7NBfQvy0CBLWq/ONdQAZI2WCoYZL+WNOiGXOGPIkkr/HGvdFNYxxAGfiat23XKGyFXwTPkTDD4A5KHg3D6QkWmPiZjG1uf7d0R3ELMnlzU+52RW1GpPvYUqq2OaRiuArz68d/Alh3AYl3C24B1uBGAO6T4rjpxzCHnV8ab6Rua2dp6pC4gyxCpFu5atSqAbjriX4+sZJpwCP7nsvjwFe2OITUZXEb5J6MBAR8R4E14DTxpPGhICTAAfUUGykP0A8EiGMr3muGPSqq8Sh6iHcpX77IP68Q7Bgwq49LALO4/4fAtZwgwITxu6RnJn1WTB6Y1v8qwSy1WpmxR4gjwUQR5nhyDj+3FrIXglr0jvj6juUwBybPq4nfwlcywHdq9zPTG19lMMPkSoRDjoQYKbndThsMG5AL8IZs2glbYXyFY9PBAIBvYidorXStHwpDBiu7DxKeUA+4Gsyf/UhlH+ytg/jjO8gCGlpSwIpHjoTz5BJSQ/VMtxtrf96/HmRjt576+ap3hPsUDO+pfo3krYGpf+zRGn6RTzzQW0539RPy5vd4bceKH3CD13Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(46966006)(36840700001)(6666004)(316002)(86362001)(186003)(81166007)(70586007)(16526019)(1076003)(426003)(26005)(8936002)(110136005)(83380400001)(70206006)(54906003)(336012)(356005)(47076005)(82310400003)(5660300002)(8676002)(2616005)(478600001)(4326008)(2906002)(36756003)(82740400003)(36860700001)(7696005)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2021 11:31:15.7438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6300ccf6-1590-44b0-2f13-08d931836b31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5447
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Even the FCH SSC registers provides certain level of information
about the s0ix entry and exit times which comes handy when the SMU
fails to report the statistics via the mailbox communication.

This information is captured via a new debugfs file "s0ix_stats".
A non-zero entry in this counters would mean that the system entered
the s0ix state.

If s0ix entry time and exit time don't change during suspend to idle,
the silicon has not entered the deepest state.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd-pmc.c | 46 ++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index bb067324644d..174f067f0756 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -46,6 +46,15 @@
 #define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
 #define AMD_PMC_RESULT_FAILED                0xFF
 
+/* FCH SSC Registers */
+#define FCH_S0I3_ENTRY_TIME_L_OFFSET	0x30
+#define FCH_S0I3_ENTRY_TIME_H_OFFSET	0x34
+#define FCH_S0I3_EXIT_TIME_L_OFFSET	0x38
+#define FCH_S0I3_EXIT_TIME_H_OFFSET	0x3C
+#define FCH_SSC_MAPPING_SIZE		0x800
+#define FCH_BASE_PHY_ADDR_LOW		0xFED81100
+#define FCH_BASE_PHY_ADDR_HIGH		0x00000000
+
 /* SMU Message Definations */
 #define SMU_MSG_GETSMUVERSION		0x02
 #define SMU_MSG_LOG_GETDRAM_ADDR_HI	0x04
@@ -96,6 +105,7 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 struct amd_pmc_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
+	void __iomem *fch_virt_addr;
 	u32 base_addr;
 	u32 cpu_id;
 	u32 active_ips;
@@ -140,7 +150,6 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
 	struct amd_pmc_dev *dev = s->private;
 	struct smu_metrics table;
-	u32 value;
 	int idx;
 
 	if (dev->cpu_id == AMD_CPU_ID_PCO)
@@ -166,6 +175,29 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
 
+static int s0ix_stats_show(struct seq_file *s, void *unused)
+{
+	struct amd_pmc_dev *dev = s->private;
+	u64 entry_time, exit_time, residency;
+
+	entry_time = ioread32(dev->fch_virt_addr + FCH_S0I3_ENTRY_TIME_H_OFFSET);
+	entry_time = entry_time << 32 | ioread32(dev->fch_virt_addr + FCH_S0I3_ENTRY_TIME_L_OFFSET);
+
+	exit_time = ioread32(dev->fch_virt_addr + FCH_S0I3_EXIT_TIME_H_OFFSET);
+	exit_time = exit_time << 32 | ioread32(dev->fch_virt_addr + FCH_S0I3_EXIT_TIME_L_OFFSET);
+
+	/* It's in 48MHz. We need to convert it to unit of 100ns */
+	residency = (exit_time - entry_time) * 10 / 48;
+
+	seq_puts(s, "=== S0ix statistics ===\n");
+	seq_printf(s, "S0ix Entry Time: %lld\n", entry_time);
+	seq_printf(s, "S0ix Exit Time: %lld\n", exit_time);
+	seq_printf(s, "Residency Time: %lld\n", residency);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(s0ix_stats);
+
 static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
 {
 	debugfs_remove_recursive(dev->dbgfs_dir);
@@ -176,6 +208,8 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
 	debugfs_create_file("smu_fw_info", 0644, dev->dbgfs_dir, dev,
 			    &smu_fw_info_fops);
+	debugfs_create_file("s0ix_stats", 0644, dev->dbgfs_dir, dev,
+			    &s0ix_stats_fops);
 }
 #else
 static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
@@ -332,7 +366,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = &pmc;
 	struct pci_dev *rdev;
 	u32 base_addr_lo, base_addr_hi;
-	u64 base_addr;
+	u64 base_addr, fch_phys_addr;
 	int err;
 	u32 val;
 
@@ -382,6 +416,14 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	if (!dev->regbase)
 		return -ENOMEM;
 
+	/* Use FCH registers to get the S0ix stats */
+	base_addr_lo = FCH_BASE_PHY_ADDR_LOW;
+	base_addr_hi = FCH_BASE_PHY_ADDR_HIGH;
+	fch_phys_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
+	dev->fch_virt_addr = devm_ioremap(dev->dev, fch_phys_addr, FCH_SSC_MAPPING_SIZE);
+	if (!dev->fch_virt_addr)
+		return -ENOMEM;
+
 	/* Use SMU to get the s0i3 debug stats */
 	err = amd_pmc_setup_smu_logging(dev);
 	if (err)
-- 
2.25.1

