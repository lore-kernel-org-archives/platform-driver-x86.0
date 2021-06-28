Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F24C11F64
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C208B6195B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234852AbhF1SHL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:07:11 -0400
Received: from mail-bn7nam10on2081.outbound.protection.outlook.com ([40.107.92.81]:38537
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233028AbhF1SHK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 14:07:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJpbjD0DeAC+vqkWO9ELzTv4TTLX8cE5M1B7DDGu5vTCuRj6KK1aaphJhOxDQfVeXArRT5oQQ8JS2ZpJDpuaHpPO0JqBlIHBHbbfUaolpCZ/VtKLadyNcG5kmajhOWEPtn7qrWLolrtZnVc16ZajKM5I7upeTIN8TYzcm/fFm6ENaVeXFEEiF0q8ThKup17kwcjeGqDGl4Zd8NCR3hpAYsE+qYF3cYdu+2BT1G34N7DbC6QE6Kzpy47l4aIfx2T/MyjCfd8kEln4HFS4Bp8aZy2rHRVQq8z4xGQgE71IkwElLqy1V0RoT95ISVB/2NdhVrmNAhWNiz3w70MZbSPmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCggXaGKBTdDZziNsI3QrkeAuaePO3iGFyaHvWoDcA4=;
 b=eoG32HiHM7RONt5+eJ/Kni97MIS5LfgdMrkG0/k4XwFlptuOAQhLLpRRIJi5H5ZtDNMx64qC6GN4xQbLv2OjCstqtM10f6p54EjMKHrw+v9pz8N9PXNhMbte/0wMXDTClgTEbrvAxfhdabDCE4YBazwkhokDGS971/Eb/Mr6I+X/69q7qB7yVm1ur7mlVPvddOdTedJ7DTqs+Yv/R/QKqL4ylnk6lBz+ijbe3BFwO4Fa+9f7tgWr9BxsLVT1akVEWM8k11aw+Ba205q0+Rjr8QAQkEk2SPxBhBiwkN7EcixBvPjICBtFq82NEEPQmbWYnq4RDqQ8uV/BHNBXvyALow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCggXaGKBTdDZziNsI3QrkeAuaePO3iGFyaHvWoDcA4=;
 b=GX6LIXD+NVeSyZ+3FnqmBMgRyiVd4P6YPXC9ThUzcWSV6WMJixGHWC3suq8i1FND4iaZXkSjCfqA+Tuhc2mZQHDZGcexG5xCkYfGQqu2+1Nf6IVxwGDXZ9fPz26eTL4CTJ4LagpjMCI/Nl8d7oPqOWer1omoVn+ICVSGmpzBgpw=
Received: from MW4PR04CA0301.namprd04.prod.outlook.com (2603:10b6:303:82::6)
 by BYAPR12MB4693.namprd12.prod.outlook.com (2603:10b6:a03:98::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.23; Mon, 28 Jun
 2021 18:04:42 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::fc) by MW4PR04CA0301.outlook.office365.com
 (2603:10b6:303:82::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Mon, 28 Jun 2021 18:04:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 18:04:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 13:04:38 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 5/7] amd-pmc: Add support for logging s0ix counters
Date:   Mon, 28 Jun 2021 23:34:01 +0530
Message-ID: <20210628180403.236553-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628180403.236553-1-Shyam-sundar.S-k@amd.com>
References: <20210628180403.236553-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eddbda3-b006-4a8e-f200-08d93a5f349e
X-MS-TrafficTypeDiagnostic: BYAPR12MB4693:
X-Microsoft-Antispam-PRVS: <BYAPR12MB46931247BDCB150605FA9FF99A039@BYAPR12MB4693.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0c08BP+eb5CHAGsUMStVkKgAG7brn97TV+vbzCJpwq+z+BNwNFLphjURRMoIpCtTyt8MK7lfSZFP6o3RoyKdY6xdvF9i4kqhVZyAYgvJPi9H9OTgkAD+QNaDAZRu4KP4wiT+x5sM83L8KFuivNNhvre7kB6yiG2saLOiRSiF4LpfHCfgoW+qPAO2xSEHQ71eXSbTxq9QXb7b2JlD+BZ1HNfRQ6Y6C9uEDsnCq1H6Wv4i0Oiz4ZMAKhyiMrILWEioSkK91HFVHBRspBjoPh2x2LP7TxWfIA8jdYGw82VTQeQXXxWYlhsaweJFpS7PeE6/+sAk/sq6+vk2HE8Pj2qWnG08A8NVrGDS/fUQam1IqvTBmDrZl+SLpdQcI2G91ypVYHHRdnFMYIgEIujHorINJqRtZSKwE2GZLae9O6y4bzcg9hTKH7ESq5PTRhXJTbBXTM5WsJ1cHGlI8rlWqje9g0HYRkiPustriPp1Hac+HKP55NTQ8rje/x7t6EyddwrnfyxJE3d4UDwG8hO1f9wqdwyjtotf/PTdukPZEMCOlijrKIA0mou9EM5VVeXoyLJQwK74UBBMQ/lBuxH1kWWTsdyRZZdQjjYA0dzZq1QYacy4gjghe09cJHIvQf8WToEQ6Q+Wu0X5//8pe5Rz+03BMNLtlYAFZF/zcQ95kcblyhYwuBvmQv2Fzc3kA/aKCafnszBHGcDKKXxf2W6l/njzEDs6yJWYT12ctGFE8DT6ORr15MLAItG18mvoMRsyc7PqT8jhzzwTDFVZZLVIf8zogA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(36840700001)(46966006)(70206006)(356005)(16526019)(83380400001)(70586007)(186003)(110136005)(81166007)(54906003)(86362001)(7696005)(8676002)(316002)(26005)(6666004)(82740400003)(8936002)(47076005)(5660300002)(4326008)(336012)(2616005)(82310400003)(2906002)(478600001)(36860700001)(36756003)(1076003)(426003)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 18:04:42.7062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eddbda3-b006-4a8e-f200-08d93a5f349e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4693
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: No change
v3: No change
v4: No change

 drivers/platform/x86/amd-pmc.c | 45 +++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b9e987468752..65dc4753b1d4 100644
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
@@ -166,6 +176,29 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
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
+	/* It's in 48MHz. We need to convert it */
+	residency = (exit_time - entry_time) / 48;
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
@@ -176,6 +209,8 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
 	debugfs_create_file("smu_fw_info", 0644, dev->dbgfs_dir, dev,
 			    &smu_fw_info_fops);
+	debugfs_create_file("s0ix_stats", 0644, dev->dbgfs_dir, dev,
+			    &s0ix_stats_fops);
 }
 #else
 static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
@@ -354,7 +389,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = &pmc;
 	struct pci_dev *rdev;
 	u32 base_addr_lo, base_addr_hi;
-	u64 base_addr;
+	u64 base_addr, fch_phys_addr;
 	int err;
 	u32 val;
 
@@ -406,6 +441,14 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
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

