Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967D6C11F66
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 807E461D4D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbhF2IvL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Jun 2021 04:51:11 -0400
Received: from mail-bn8nam11on2050.outbound.protection.outlook.com ([40.107.236.50]:6945
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232599AbhF2IvL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Jun 2021 04:51:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHypiqJbbZ5z1m4+e7SwVFy3D2GSLy/Nk8I5duR2c/c/NYb0NPL7r1DKrrikjpanodAqh8B/3S7tMGCTafpAyb8GUeDgyVqbutsd48TABqeme+1lMbYFIaLdhtHi0mCbSSdPEhIYFt7FAOhG6m3swATKOJOSIkMWxuDHkfk6mylMTK0WoN12Xe2u3Ny9GTUP0M1mAeb6ZtTAja47+NYA2QgwBSOpmNgt/4i+9gH2Aa7hvoerl1a/1Hl3rHK+5a9PCxus+KPwTMEIFS6rjBMmLQMWp7/AZcjHhfBD1izGolry8WTwlxKIkkhx4ryBdD/BJEGfJmDx/B2dJ67CmL7vAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggNbfgBVw52v+4G3pCFXLb/Dm3DIORC8CFEfDsia5lY=;
 b=fHf+CuhmSCRjXN/dNTV+vENfGTTC4AMspq9boW4MHqkLMG7oE32+jMGNKq92P1laxbvTWHuW4CcnlxcGyi064kgXQn/ptV4G6REOPdsKIuESJFpHfi5Zo8wJEcfDZhh9YxPCAmYzQeq/jpm3VRIxNyzMfU0U5/V9whN+mOaOBJaxKVXn14eJWS+Yxo63oejjSfTwFhIG0m9DK9nYtPbOOTJtG7bIBlNr9rPXSJ6zGW5L0G3R6m8pY4ur7u+2V8OesStkG6uFWyonV7YFDye6H7V/v+xP9wfocO3nlftJeqmzaudYcItGPjAqOF9j2fMSAF7NN1X+boHwyCp2lph4Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggNbfgBVw52v+4G3pCFXLb/Dm3DIORC8CFEfDsia5lY=;
 b=qA3pylQenmjQgm/ohx9Rlj4qm5NkO7PE2yCSr3CdtGKagj2shA+URVD9HKISAJkzKtjPDrsiEvUrt5NCnj/X42prDIfiNiGeexSbNv4I/Swix/IEMh2TKLtPAjiP5nKD0p05OIG/f7im7yXnhc5ON6JoLGwvbROonF2HTReOZ00=
Received: from MWHPR1201CA0014.namprd12.prod.outlook.com
 (2603:10b6:301:4a::24) by DM6PR12MB3820.namprd12.prod.outlook.com
 (2603:10b6:5:1c2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 08:48:41 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4a:cafe::e0) by MWHPR1201CA0014.outlook.office365.com
 (2603:10b6:301:4a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Tue, 29 Jun 2021 08:48:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 08:48:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 29 Jun
 2021 03:48:39 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 5/7] amd-pmc: Add support for logging s0ix counters
Date:   Tue, 29 Jun 2021 14:18:01 +0530
Message-ID: <20210629084803.248498-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
References: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 659b0fc0-e6ff-418f-c145-08d93adab232
X-MS-TrafficTypeDiagnostic: DM6PR12MB3820:
X-Microsoft-Antispam-PRVS: <DM6PR12MB382087546C4F04E84E65C1379A029@DM6PR12MB3820.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLgo+2tlG5Fxu67grkLs2bfUSuFURqmkwLxmFV1XlwwdlH0DS/aa1rAiH4eC73oVmnX0WXdsJbaLdVxMoTXyIXhRgGYRcS4M9T6hTgWf8IxCq3jaTznMF7R3tCZ+RdBBeGLBPxHO/ViHj8VKylaLjSl7kRLYYr6XUAZfe5XtSJY3e2yvyC1l5feEJirzJb1mkwjTLxuHzpzTb9zQMqCLGmx+OJVYTpDP1wHUQVPu55capqnjfCea2NcE6ljR0y6xEYyZRQTglVC0dSH+7+ik+Lrl4uslqIG9YSC5KC2uTtAvTQ7NBrDvFT564FWf9RgPchjUanZzXu5dKfpc9MUJfPbnVcUMYPxocdiKR89uG22P0nEAXRTx1q2shIZZgZ/sbRnTS6WrMUDkCxpaJs7m0Qx+1otK5Kf9cnNSR2VMYJwYZy2i0gGUVpVuWDVN2WMk1Xhm0v4ZL3Pr/MZyLYQsWITatJRo/+t4PXYoz4flIeZkol6PYdE2ngh11Uc62UbEPNLOF0gsG1F125VLQZANDCBn4idj5iJ4nqoUTAFqsNJeX58uKzuE/hr4Qu6Pox19moX80DhZEpmQPRaWMGrXO80wVZBpWhgf8zgXzJZ4iLI+9HX0uDfkRp77USpFCx04rgTjTnA8xxRbz+KbnCPsCBqXTYyke2NIW78c8KkZDNL9IMGDa8bW2Cbqq4MgV9kuGKFu8/Mk5WWEqbHmnmU3lNEWd5c4veRGMz5slsm9Baaf1ilW7xf5TI5N3DK8rraj/mgpHleH61QAnPlCwPEpeA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(36840700001)(46966006)(1076003)(8936002)(82310400003)(54906003)(47076005)(2616005)(110136005)(4326008)(81166007)(82740400003)(478600001)(8676002)(356005)(426003)(26005)(316002)(6666004)(36860700001)(70206006)(70586007)(5660300002)(336012)(7696005)(36756003)(2906002)(186003)(86362001)(16526019)(83380400001)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:48:41.4939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 659b0fc0-e6ff-418f-c145-08d93adab232
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3820
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
v5: No change

 drivers/platform/x86/amd-pmc.c | 45 +++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 0ebb2732c46a..7f011c3f60f2 100644
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
@@ -353,7 +388,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 	struct amd_pmc_dev *dev = &pmc;
 	struct pci_dev *rdev;
 	u32 base_addr_lo, base_addr_hi;
-	u64 base_addr;
+	u64 base_addr, fch_phys_addr;
 	int err;
 	u32 val;
 
@@ -405,6 +440,14 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
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

