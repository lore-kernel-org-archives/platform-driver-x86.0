Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60046C11F66
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47F4461DC1
	for <platform-driver-x86@archiver.kernel.org>; Tue, 29 Jun 2021 08:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232601AbhF2IvH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 29 Jun 2021 04:51:07 -0400
Received: from mail-mw2nam10on2066.outbound.protection.outlook.com ([40.107.94.66]:29153
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232599AbhF2IvH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Jun 2021 04:51:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/wrJa8xvwuSeDn0IDS1MDF/DCQze9ZFlPGSxaVYqprCPZcmr7/mlvAP8X0RKGDtiG5IYrxeWg9ZP6W1VamzS56Wyjy+ILrnqVu5BIJgysr3Xzs2i0ezrWgByT9DXK2zIJQwjp2vr5C7PtCmW2RdvlppPf0FkJgTYMgq2NguLVecbxQaqL4qI2qd4Iq1JCfn3SYzgEfDwadKfsaDr0S6KPvW/FX965HkBw87wqZIEHuqc8HfQdH4I5lQV2Z8x7QEKdaoOHa+QTdsrKCm2EfFYm85GVa0vyB0YumSDwSVYWpiz0xwmqcl1An5C3SYnmfh8NESN4n+goXVTMpbogwJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sM3A5EBNXu1VqD1FF9lrwbpj+SKi8AgwAaTV27UuA+s=;
 b=OLpVSv9S6Gd4bBZFIN0PNGi5OWy2BzswaThTpl1YSRjnwcKuPEPZRqZcC2BvrbqL+Sm3oSjQyQr3azhboful5bRqN8VhyxHuXD2NmF9n7HY2Xd/s/sbw5WvXhXOcwABXH7UB0xdiwuAyPmrag2sY14LIqdU8yy6R+XfQf8Vxx5iBUlZplbET66+s8ZLtytsJriWMGw1q6egU5km51Ye76ca6HuAknR59eSSSwMyXge0ljqDefqzvPAD2w6pOuRSfT/q0nt92DX7Qa8Gym/K0bZgYpB4o6Ap3iyaLPjWxIV6atzT0NVUPFFx1u+efCxL6vyJ/APQFoROa0BtPtPg9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sM3A5EBNXu1VqD1FF9lrwbpj+SKi8AgwAaTV27UuA+s=;
 b=1w/b3yKCp+8JS1O90yE/Tzn8QuEfPSwoAhvNn4rGE1CqVXr6ksMWL3N7w60CLzh4ybwTpSi7652WfwmQA5eTPDGYjIMCYHGtZplVa7ZOMKWr2lFF5Nw6Q10eBGcJGDmxDDhz2kCe7y+VezU8eaEJBjYboD00ZZHIQr5aS+x6c08=
Received: from MW4PR03CA0211.namprd03.prod.outlook.com (2603:10b6:303:b9::6)
 by BL1PR12MB5352.namprd12.prod.outlook.com (2603:10b6:208:314::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 08:48:38 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::c0) by MW4PR03CA0211.outlook.office365.com
 (2603:10b6:303:b9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Tue, 29 Jun 2021 08:48:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 08:48:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 29 Jun
 2021 03:48:35 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 4/7] platform/x86: amd-pmc: Add support for logging SMU metrics
Date:   Tue, 29 Jun 2021 14:18:00 +0530
Message-ID: <20210629084803.248498-5-Shyam-sundar.S-k@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 35d5dce8-68b9-4980-dd2b-08d93adab037
X-MS-TrafficTypeDiagnostic: BL1PR12MB5352:
X-Microsoft-Antispam-PRVS: <BL1PR12MB535288145307CB35140EDF689A029@BL1PR12MB5352.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sSPggDrQDl9e+mMaad5WCMCraidYF9ULAxfc4SVXmnyXdC9lkWRElAKUCgNi85lVulpn83VQt6SSDS6xXOen3zAiIWiJIV2lwmE5ff+2VgrXxP4GtvovRmzq/eFBiYNurY+muOjRb+jcGgtYsW+WkRQ28DQlDLzo1B29+IvWJU0rrHbHep9Bq4KhJTruebkv/2T7fr+x8os0aXu/AFtc0TYUCFPzZgfc0YYcwgob8D0N8Wqhp2w+3YAyzkOQ+5z/ByjpiZxsEPXymyFZRHV4wkzSBWcpo5CWb2CupGfPiDaUpNZll2/1qjtMBc0Da1dd50F5pfJ3JPPGf5xtlxiHH5KAKtepMDo62ehdj80QwhSf9d5EjPZPvvOF9ArdAIppvtwnWJNBWlrqCaljGDKMWGEHTgtlc5TJG4eVU7E+c4O1splKiukXADuwfErJ0B2bRfFh2Mo8lGLHoYAMdGeTC9ydgptdJWBHnIIcaPXu8olAUxAEhWhHGFOxQSbLuETJpllkza9MNkjTmDVInkYd3UIG1q+m3/oNF8hQ7rYN9c5VTRZMlK8ZoNLyfpbkJDWS2dKntmpL8+W0m1zSNP+AklIajLocqEVHDOuOnTsPD5HUliMy6aLTCWXD1cqjj16SbtrSmXgihqL7dhQ8jiQ9OHn2tIEXmgqwc7fXc8Iz4G8zseT5UFIyPQ9dUwbLEWIu08exuWY4E7CrSaxfxr7R57P3zIIORsUwnF/CqHauAIM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966006)(36840700001)(86362001)(82740400003)(4326008)(8936002)(186003)(16526019)(83380400001)(2616005)(36756003)(82310400003)(36860700001)(47076005)(26005)(8676002)(1076003)(5660300002)(70206006)(2906002)(81166007)(336012)(426003)(110136005)(478600001)(54906003)(7696005)(356005)(6666004)(316002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 08:48:38.1639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d5dce8-68b9-4980-dd2b-08d93adab037
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5352
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SMU provides a way to dump the s0ix debug statistics in the form of a
metrics table via a of set special mailbox commands.

Add support to the driver which can send these commands to SMU and expose
the information received via debugfs. The information contains the s0ix
entry/exit, active time of each IP block etc.

As a side note, SMU subsystem logging is not supported on Picasso based
SoC's.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2: No change
v3: No change
v4: No change
v5: No change

 drivers/platform/x86/amd-pmc.c | 147 +++++++++++++++++++++++++++++++--
 1 file changed, 139 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index e5107e3b1911..0ebb2732c46a 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -46,6 +46,14 @@
 #define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
 #define AMD_PMC_RESULT_FAILED                0xFF
 
+/* SMU Message Definations */
+#define SMU_MSG_GETSMUVERSION		0x02
+#define SMU_MSG_LOG_GETDRAM_ADDR_HI	0x04
+#define SMU_MSG_LOG_GETDRAM_ADDR_LO	0x05
+#define SMU_MSG_LOG_START		0x06
+#define SMU_MSG_LOG_RESET		0x07
+#define SMU_MSG_LOG_DUMP_DATA		0x08
+#define SMU_MSG_GET_SUP_CONSTRAINTS	0x09
 /* List of supported CPU ids */
 #define AMD_CPU_ID_RV			0x15D0
 #define AMD_CPU_ID_RN			0x1630
@@ -55,17 +63,42 @@
 #define PMC_MSG_DELAY_MIN_US		100
 #define RESPONSE_REGISTER_LOOP_MAX	200
 
+#define SOC_SUBSYSTEM_IP_MAX	12
+#define DELAY_MIN_US		2000
+#define DELAY_MAX_US		3000
 enum amd_pmc_def {
 	MSG_TEST = 0x01,
 	MSG_OS_HINT_PCO,
 	MSG_OS_HINT_RN,
 };
 
+struct amd_pmc_bit_map {
+	const char *name;
+	u32 bit_mask;
+};
+
+static const struct amd_pmc_bit_map soc15_ip_blk[] = {
+	{"DISPLAY",	BIT(0)},
+	{"CPU",		BIT(1)},
+	{"GFX",		BIT(2)},
+	{"VDD",		BIT(3)},
+	{"ACP",		BIT(4)},
+	{"VCN",		BIT(5)},
+	{"ISP",		BIT(6)},
+	{"NBIO",	BIT(7)},
+	{"DF",		BIT(8)},
+	{"USB0",	BIT(9)},
+	{"USB1",	BIT(10)},
+	{"LAPIC",	BIT(11)},
+	{}
+};
+
 struct amd_pmc_dev {
 	void __iomem *regbase;
-	void __iomem *smu_base;
+	void __iomem *smu_virt_addr;
 	u32 base_addr;
 	u32 cpu_id;
+	u32 active_ips;
 	struct device *dev;
 	struct mutex lock; /* generic mutex lock */
 #if IS_ENABLED(CONFIG_DEBUG_FS)
@@ -74,6 +107,7 @@ struct amd_pmc_dev {
 };
 
 static struct amd_pmc_dev pmc;
+static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, u32 *data, u8 msg, bool ret);
 
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
 {
@@ -85,9 +119,49 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
 	iowrite32(val, dev->regbase + reg_offset);
 }
 
+struct smu_metrics {
+	u32 table_version;
+	u32 hint_count;
+	u32 s0i3_cyclecount;
+	u32 timein_s0i2;
+	u64 timeentering_s0i3_lastcapture;
+	u64 timeentering_s0i3_totaltime;
+	u64 timeto_resume_to_os_lastcapture;
+	u64 timeto_resume_to_os_totaltime;
+	u64 timein_s0i3_lastcapture;
+	u64 timein_s0i3_totaltime;
+	u64 timein_swdrips_lastcapture;
+	u64 timein_swdrips_totaltime;
+	u64 timecondition_notmet_lastcapture[SOC_SUBSYSTEM_IP_MAX];
+	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
+} __packed;
+
 #ifdef CONFIG_DEBUG_FS
 static int smu_fw_info_show(struct seq_file *s, void *unused)
 {
+	struct amd_pmc_dev *dev = s->private;
+	struct smu_metrics table;
+	int idx;
+
+	if (dev->cpu_id == AMD_CPU_ID_PCO)
+		return -EINVAL;
+
+	memcpy_fromio(&table, dev->smu_virt_addr, sizeof(struct smu_metrics));
+
+	seq_puts(s, "\n=== SMU Statistics ===\n");
+	seq_printf(s, "Table Version: %d\n", table.table_version);
+	seq_printf(s, "Hint Count: %d\n", table.hint_count);
+	seq_printf(s, "S0i3 Cycle Count: %d\n", table.s0i3_cyclecount);
+	seq_printf(s, "Time (in us) to S0i3: %lld\n", table.timeentering_s0i3_lastcapture);
+	seq_printf(s, "Time (in us) in S0i3: %lld\n", table.timein_s0i3_lastcapture);
+
+	seq_puts(s, "\n=== Active time (in us) ===\n");
+	for (idx = 0 ; idx < SOC_SUBSYSTEM_IP_MAX ; idx++) {
+		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
+			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
+				   table.timecondition_notmet_lastcapture[idx]);
+	}
+
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
@@ -113,6 +187,32 @@ static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
 }
 #endif /* CONFIG_DEBUG_FS */
 
+static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
+{
+	u32 phys_addr_low, phys_addr_hi;
+	u64 smu_phys_addr;
+
+	if (dev->cpu_id == AMD_CPU_ID_PCO)
+		return -EINVAL;
+
+	/* Get Active devices list from SMU */
+	amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
+
+	/* Get dram address */
+	amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
+	amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
+	smu_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
+
+	dev->smu_virt_addr = devm_ioremap(dev->dev, smu_phys_addr, sizeof(struct smu_metrics));
+	if (!dev->smu_virt_addr)
+		return -ENOMEM;
+
+	/* Start the logging */
+	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, 0);
+
+	return 0;
+}
+
 static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 {
 	u32 value;
@@ -127,10 +227,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
 }
 
-static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
+static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, u32 *data, u8 msg, bool ret)
 {
 	int rc;
-	u8 msg;
 	u32 val;
 
 	mutex_lock(&dev->lock);
@@ -150,8 +249,8 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, set);
 
 	/* Write message ID to message ID register */
-	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
 	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
+
 	/* Wait until we get a valid response */
 	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
 				val, val != 0, PMC_MSG_DELAY_MIN_US,
@@ -163,6 +262,11 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 
 	switch (val) {
 	case AMD_PMC_RESULT_OK:
+		if (ret) {
+			/* PMFW may take longer time to return back the data */
+			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
+			*data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
+		}
 		break;
 	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
 		dev_err(dev->dev, "SMU not ready. err: 0x%x\n", val);
@@ -186,12 +290,29 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 	return rc;
 }
 
+static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
+{
+	switch (dev->cpu_id) {
+	case AMD_CPU_ID_PCO:
+		return MSG_OS_HINT_PCO;
+	case AMD_CPU_ID_RN:
+		return MSG_OS_HINT_RN;
+	}
+	return -EINVAL;
+}
+
 static int __maybe_unused amd_pmc_suspend(struct device *dev)
 {
 	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
 	int rc;
+	u8 msg;
 
-	rc = amd_pmc_send_cmd(pdev, 1);
+	/* Reset and Start SMU logging - to monitor the s0i3 stats */
+	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
+	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
+
+	msg = amd_pmc_get_os_hint(pdev);
+	rc = amd_pmc_send_cmd(pdev, 1, NULL, msg, 0);
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
 
@@ -202,8 +323,13 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
 {
 	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
 	int rc;
+	u8 msg;
 
-	rc = amd_pmc_send_cmd(pdev, 0);
+	/* Let SMU know that we are looking for stats */
+	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_DUMP_DATA, 0);
+
+	msg = amd_pmc_get_os_hint(pdev);
+	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, 0);
 	if (rc)
 		dev_err(pdev->dev, "resume failed\n");
 
@@ -226,8 +352,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 {
 	struct amd_pmc_dev *dev = &pmc;
 	struct pci_dev *rdev;
-	u32 base_addr_lo;
-	u32 base_addr_hi;
+	u32 base_addr_lo, base_addr_hi;
 	u64 base_addr;
 	int err;
 	u32 val;
@@ -279,6 +404,12 @@ static int amd_pmc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mutex_init(&dev->lock);
+
+	/* Use SMU to get the s0i3 debug stats */
+	err = amd_pmc_setup_smu_logging(dev);
+	if (err)
+		dev_err(dev->dev, "SMU debugging info not supported on this platform\n");
+
 	platform_set_drvdata(pdev, dev);
 	amd_pmc_dbgfs_register(dev);
 	return 0;
-- 
2.25.1

