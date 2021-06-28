Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD17C49361
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE35661C6A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 11:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhF1LHw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 07:07:52 -0400
Received: from mail-dm6nam10on2047.outbound.protection.outlook.com ([40.107.93.47]:16929
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232617AbhF1LHw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 07:07:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jw7BufzgSc2d71K+EU6vp/b4TA/kcUcJj/I8WvHxd57h6fOHRiOfa6NsXYcUOpSNIVkglWuY/meWaLZeJudiRbteLFdbscahk32j6Mkb0AZo7mIM6hh1ij53z3vCh3xBg+AzSejKs4FFFlLU/46KBcWlx24RQUPQ5lU5IYfHF+mUQLgzPQRV0VqCJc+g82vSoWfPc5KGu/sMC6QTmrxH+hEwUBqmUl2lquVEk9yxOgVbwLkPpI3nY5ZQlWnNw8V6WShpPpSvhcUQ0u6LqY1LtALujYzn2JsNzfYH6Of7mpDEoEgC/N3yjg9hplIr+d0EpyPGNEOdqB/Kl72bEYgqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr5gfR/twSqwEDXyAoZDdUVSKAD9Z5mXcvlLtUbZc8s=;
 b=oHZLXYRf5J2mTB3ZlL4GFL/+2/m6ENgDz8RBVn2H7oBO+Qif1btz992biMEzUkGox8sZjJqrtIx++V+wu6eB5A5qbunnsJnG6qAOF9raERvTX+2SGLmSx85lQnxcArWkdp5ekMeCDzajTOfy2csOkGu31yCwB+mVjNGGusabQt6U23e4qb/SY6LjPrqbuDIzAkETbQalP/gRxBP1aVB4YITcTRuchBFMSEgxE6X80CZYmLO41Ql6x3IfrnrzplEhhf9TOU2j/pnwxiEawgU3KtLA700nWjcZqk6Mfn8qG35DBCTcYrgKIGccVSuR+SkGWuMXCwQbIvtu52vTmV9xXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr5gfR/twSqwEDXyAoZDdUVSKAD9Z5mXcvlLtUbZc8s=;
 b=QyJDqFPxBcPIp3yrlcNhVi0zYEvvxYjECPjB/J3L1ja5fV3ZpiboPeZ9Wp+DDfVVH8v3ZlLBDvzfoS0KQjrdim5ghAhMWxeikXNWoxMPhjnHhdm+1f/wVvtHP2kk859JqYre2X+/IsHKfKeDnAWEmsiBHDjNGjMOBUElyhY3nRo=
Received: from MWHPR22CA0001.namprd22.prod.outlook.com (2603:10b6:300:ef::11)
 by DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Mon, 28 Jun
 2021 11:05:25 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ef:cafe::91) by MWHPR22CA0001.outlook.office365.com
 (2603:10b6:300:ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Mon, 28 Jun 2021 11:05:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 11:05:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 28 Jun
 2021 06:05:21 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <rrangel@chromium.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 4/7] platform/x86: amd-pmc: Add support for logging SMU metrics
Date:   Mon, 28 Jun 2021 16:34:48 +0530
Message-ID: <20210628110451.4047142-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
References: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c43b2b0-4517-4f1c-6498-08d93a24a138
X-MS-TrafficTypeDiagnostic: DM6PR12MB3916:
X-Microsoft-Antispam-PRVS: <DM6PR12MB39163773965E4A0FEC248E219A039@DM6PR12MB3916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yyilYvSb5Z8lvFWbNjaH3Bfp+fqAjJCLuenQYaz/w95/6pfh373W9cBsP0kkd8qyIAb6K+VDo1HxcDHUDaBUlQqtIOJv9lU+pcGS2spRktttMQQma6cGQA2jfVoWGV3W4XIUe7qnVUAe9MTMwHPvCBmpIBhJwqqG4Qt03xy0ByXA1HSJJq3rMavQmO2j1yp5ajjO6U/Z7vFwtAc5f4Z6uT3h4uUEhk3NNfZp2H3dUJyZ8lTLFW2GJ902Dyb0VExyTzJl6uVtHXXWs7zYMga3fdBdWgb3aKsQXYkuhU8sWVZPKhr9fxJ0R/rpOLkwBrbauYAq8yxmCzbqQBjZwgm2Mkzx54hEuK9bm+VumI6QCX6Hw/XKpdhxjgzUFayyVJgKj7KhOc4T4G/uZibc+nnCJbMNzoynHMckfrFuIduRsdaq0Kp6zyithRknPxnYUB9Bs2eMZ7nPWRJMqq38xk4hpflX0z4+XxF0w/5sgS9XLF3vRbSQGXgM84Q7x5xTEU0ibZ1DhjWzdLKHYCHzdfNwmECVal0hwFyqmRG0t+vkOKvkbtnKnHkNWNKfKViz8KMhQhCuHvfHnOR95iS2LF7gTOnf/qNYtGLn/Th6I/ZT45ZGK6m1Imh3Cm5IR6qpP8YOJ48yCtZiobUIFoYQCObzvFO114ssrukqozM4uMajmkNx7CK5rawSVEXUNh/QMX9Wk38KXh0fXEP/sR9THa4hbJ81OdVqrurnZ03RdDsY4MI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(36840700001)(46966006)(8676002)(81166007)(8936002)(86362001)(110136005)(2906002)(47076005)(82310400003)(1076003)(478600001)(36860700001)(83380400001)(70206006)(54906003)(5660300002)(316002)(7696005)(356005)(336012)(186003)(6666004)(16526019)(26005)(426003)(4326008)(70586007)(2616005)(82740400003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:05:24.6038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c43b2b0-4517-4f1c-6498-08d93a24a138
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3916
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
v2: no change

 drivers/platform/x86/amd-pmc.c | 147 +++++++++++++++++++++++++++++++--
 1 file changed, 139 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 5be2b1167c6b..baa5cc3e386b 100644
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
@@ -161,6 +260,11 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
 
 	switch (val) {
 	case AMD_PMC_RESULT_OK:
+		if (ret) {
+			/* PMFW may take longer time to return back the data */
+			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
+			*data = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
+		}
 		break;
 	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
 	case AMD_PMC_RESULT_CMD_REJECT_PREREQ:
@@ -177,12 +281,29 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
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
 
@@ -193,8 +314,13 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
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
 
@@ -217,8 +343,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
 {
 	struct amd_pmc_dev *dev = &pmc;
 	struct pci_dev *rdev;
-	u32 base_addr_lo;
-	u32 base_addr_hi;
+	u32 base_addr_lo, base_addr_hi;
 	u64 base_addr;
 	int err;
 	u32 val;
@@ -270,6 +395,12 @@ static int amd_pmc_probe(struct platform_device *pdev)
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

