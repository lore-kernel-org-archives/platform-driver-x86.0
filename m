Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5314C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Jul 2022 15:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbiGLPEG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbiGLPDD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Jul 2022 11:03:03 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234A62715B
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2022 07:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMng2vTmaD6NA6c2ATkzUys4Hi1RNEZNU0payMgszcje3viT4rXY19Qv0ioBxWiDY7iY793II18y7DBDMe5ENSFA8KFwBhZxc9ezKfZiN/GcQmJfkulRjgx47cM6FjLEc3kGfbsZuXshWSpGZs4bnC24o38c67EKd7VJ5yrg0Ta2E/MEyLYJJacoJR0Vsd8wqlfa3q2PvaGj+KdtQblOcdQCoEatK9SjjTglN+BlTCL0HeBe3fLvBDtK1YoMP/SCxL8ceuow58QNIJAM1g6gWvBM5YiVipqczO37LvrXoxFEhNF4Wg20ro49k0bmG7Dq1W2EAVpGRe+zHHKVgkkaCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WJeudRFIfsQE/+/gEF/gvz45NDWi6BFfE4eBHNehTk=;
 b=bTd1JAniv9q5geCJy6b6o6XM9SaJNqqhH4RjI96nxoJphN2HLIt1P7E/x8Mr1fnfvf8GkcRb/5N1foBs8WKBFfqnvAxR/ePKN5gGJCs2d9qbvU997e/PY/kmjgMKE0ncB8Z12aiI3Z80XnCUKgotLSSyRmqHtKmvHIqd6tEx50lNpoZqRLof8FW78sFQpHL6CNM+ZIUld02CLeHWf5alZDA4QGMKac4CHNaQHCDkdjQsBM/7R7VjnFzLMfWGf81GRgsfVTV4uYhof64HTnvzu6jnM7JP24A+BQuNbbhkM0IxjiBjH/GOrkJX3r/8OvOVsmsQI3H3x2P7Ba+zsQpvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WJeudRFIfsQE/+/gEF/gvz45NDWi6BFfE4eBHNehTk=;
 b=OnhoWwzkRLF4w5EF070D445PYNmESaQgphyJ0Ck7cpZD55hEPVivZ5b7WBQEHO4CetR9wi4y18TmgGJhfetE1cYX+lz97MBrRPuMu6VJWeiSIUfnLY1Pt9PcfpCR/WiPqAt/xI/zRYCpudDWD8WGyb5SUtaRN3/c/YLhWr/OLxg=
Received: from BN8PR04CA0044.namprd04.prod.outlook.com (2603:10b6:408:d4::18)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 14:59:46 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::9d) by BN8PR04CA0044.outlook.office365.com
 (2603:10b6:408:d4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Tue, 12 Jul 2022 14:59:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:59:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 09:59:43 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 08/15] platform/x86/amd/pmf: Get performance metrics from PMFW
Date:   Tue, 12 Jul 2022 20:28:40 +0530
Message-ID: <20220712145847.3438544-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 806e13cf-098f-4c71-0334-08da641728ed
X-MS-TrafficTypeDiagnostic: LV2PR12MB5751:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zCdhsXnkVXa2w8VnpB8UXSRkg64admxgNx6slwesPhWAKcUgSqdd84usHiCz+bRrPJEOGXy2s6i/fq609fJGbACRXX2L7LucEqrdMz2XXNk/HNiHdaD/RIDBgAy3cSuMlVZBkL+rqraVHHYNgZHhAqWtUo4dqb65db5iDDOOynb7Rvxnlj2FKdxH5cnK95NXEit0J7xuhTDEh+Pp4YnvXpDJTHFz8kKE0BYLrFbPYlHvEjQr/9eyJ9CsXZS+h/1W+nPf/FlSOTVGgqsEBGt1qeAdgaWVJD/A82crvG8b8yHK6DMgAmsF0q2LpEdnObNL0qS9vyNSrt4TwCNLkoZluhNxwiTt1/CbeYx0SwnwrTUJB4A2lettBvDzdS21NSndpo4o4A6ijEqYrgnf33gv8FmyAenZkWEnrzJ+fKEeK6TR8m1mXvQnIBRG3ZmBolRafMNRSaOCEOgeWvWVvj6whTrqb1PkVqtsqTsa8ADl2vr34BzSoGAX8jxD/u/RBLpqP5MfTlyDV+n4t9po55G5tSRFYnXY63hhJqzWMrN5Q6a0yNyxArKkwNbFuQ78+zYjNJEEB+8LhNrgH2duqUNDUgOzX2ipncxuy9Xjvz73RYPYIB8pmc5aOp6VjfPqmlWM8vfSqpzsZ4gn5hLsE1FyQkVxtMY+JY3fjt8IdpcuujvsQExV8KQXGdVsESN5GTmSMFPMpDoLB7LWxUGGKSNqhfna98VGQcPLaImCago850G9oQPwgnBbMXSA9JtsYHeEQWdWuV42aWPMnV/IrS8V5CZS9RiJpnOHkgG1zrJ03A8e46+hdSRqyAz7+bIa1VYbUOMtbhDvkRtwlpi9fSscHB/rdncUWuXxAzpX+HWZnZA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39860400002)(36840700001)(46966006)(40470700004)(110136005)(86362001)(336012)(47076005)(2906002)(426003)(316002)(36756003)(54906003)(82310400005)(16526019)(8936002)(40460700003)(40480700001)(5660300002)(36860700001)(70206006)(70586007)(8676002)(82740400003)(4326008)(478600001)(81166007)(1076003)(41300700001)(26005)(356005)(7696005)(186003)(83380400001)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:59:45.9368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 806e13cf-098f-4c71-0334-08da641728ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PMF driver polls for metrics information from PMFW to understand the system
behavior, power consumption etc.

This metrics table information will be used the PMF features to tweak the
thermal heuristics. The poll duration can also be changed by the user
by changing the poll duration time.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 57 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 39 ++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index ff26928e6a49..c6fd52c46818 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -47,6 +47,11 @@
 #define DELAY_MIN_US	2000
 #define DELAY_MAX_US	3000
 
+/* override Metrics Table sample size time (in ms) */
+static int metrics_table_loop_ms = 1000;
+module_param(metrics_table_loop_ms, int, 0644);
+MODULE_PARM_DESC(metrics_table_loop_ms, " Metrics Table sample size time (default = 1000ms) ");
+
 #ifdef CONFIG_DEBUG_FS
 static int current_power_limits_show(struct seq_file *seq, void *unused)
 {
@@ -98,6 +103,30 @@ int amd_pmf_get_power_source(void)
 		return POWER_SOURCE_DC;
 }
 
+static void amd_pmf_get_metrics(struct work_struct *work)
+{
+	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
+	enum platform_profile_option current_profile;
+	ktime_t time_elapsed_ms;
+	int socket_power;
+
+	/* Get the current profile information */
+	platform_profile_get(&current_profile);
+
+	/* Transfer table contents */
+	memset(&dev->m_table, 0, sizeof(dev->m_table));
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
+	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
+
+	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
+	/* Calculate the avg SoC power consumption */
+	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
+
+	dev->start_time = ktime_to_ms(ktime_get());
+	dev_dbg(dev->dev, "Metrics table sample size time:%d\n", metrics_table_loop_ms);
+	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
+}
+
 static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
 {
 	return ioread32(dev->regbase + reg_offset);
@@ -191,6 +220,34 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ }
 };
 
+int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
+{
+	struct smu_pmf_metrics *m_table;
+	u64 phys_addr;
+
+	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
+
+	/*
+	 * Start collecting the metrics data after a small delay
+	 * or else, we might end up getting stale values from PMFW.
+	 */
+	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms * 3));
+
+	/* Get Metrics Table Address */
+	dev->buf = kzalloc(sizeof(*m_table), GFP_KERNEL);
+	if (!dev->buf)
+		return -ENOMEM;
+
+	phys_addr = virt_to_phys(dev->buf);
+	dev->hi = phys_addr >> 32;
+	dev->low = phys_addr & GENMASK(31, 0);
+
+	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, dev->hi, NULL);
+	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, dev->low, NULL);
+
+	return 0;
+}
+
 static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 {
 	/* Enable Static Slider */
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 1e9e2e498d15..8f318ff59c2e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -84,6 +84,41 @@ struct apmf_fan_idx {
 	u32 fan_ctl_idx;
 } __packed;
 
+struct smu_pmf_metrics {
+	u16 gfxclk_freq; /* in MHz */
+	u16 socclk_freq; /* in MHz */
+	u16 vclk_freq; /* in MHz */
+	u16 dclk_freq; /* in MHz */
+	u16 memclk_freq; /* in MHz */
+	u16 spare;
+	u16 gfx_activity; /* in Centi */
+	u16 uvd_activity; /* in Centi */
+	u16 voltage[2]; /* in mV */
+	u16 currents[2]; /* in mA */
+	u16 power[2];/* in mW */
+	u16 core_freq[8]; /* in MHz */
+	u16 core_power[8]; /* in mW */
+	u16 core_temp[8]; /* in centi-Celsius */
+	u16 l3_freq; /* in MHz */
+	u16 l3_temp; /* in centi-Celsius */
+	u16 gfx_temp; /* in centi-Celsius */
+	u16 soc_temp; /* in centi-Celsius */
+	u16 throttler_status;
+	u16 current_socketpower; /* in mW */
+	u16 stapm_orig_limit; /* in W */
+	u16 stapm_cur_limit; /* in W */
+	u32 apu_power; /* in mW */
+	u32 dgpu_power; /* in mW */
+	u16 vdd_tdc_val; /* in mA */
+	u16 soc_tdc_val; /* in mA */
+	u16 vdd_edc_val; /* in mA */
+	u16 soc_edcv_al; /* in mA */
+	u16 infra_cpu_maxfreq; /* in MHz */
+	u16 infra_gfx_maxfreq; /* in MHz */
+	u16 skin_temp; /* in centi-Celsius */
+	u16 device_state;
+};
+
 enum amd_stt_skin_temp {
 	STT_TEMP_APU,
 	STT_TEMP_HS2,
@@ -120,8 +155,11 @@ struct amd_pmf_dev {
 	struct apmf_if *apmf_if;
 	enum platform_profile_option current_profile;
 	struct platform_profile_handler pprof;
+	struct smu_pmf_metrics m_table;
+	struct delayed_work work_buffer;
 	struct delayed_work heart_beat;
 	struct mutex lock; /* protects the PMF interface */
+	ktime_t start_time;
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *dbgfs_dir;
 #endif /* CONFIG_DEBUG_FS */
@@ -158,6 +196,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
 int is_apmf_func_supported(unsigned long index);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
+int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);
 
 /* SPS Layer */
-- 
2.25.1

