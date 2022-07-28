Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E47DC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 17:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbiG1RnB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 13:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbiG1Rm7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 13:42:59 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCB2747BB
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 10:42:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsTcg1KdBQr2jqpjDXWMIXuT0/jOUbiCHn6kd826gLsNCl8THe35Kt32DnYOCAS/uqw6qhsfwU3FFfbHkdd4G/eOVg5BrQ5Uv/HIuH5jiKeuplOMrMRls8UjVi2aVCKwhrSFFGXBJVhlPj423BKwzb1Tqd/CIoL4iAxnu07aCmxrZTGerH3B8/xevT5eKXTpzSwHAG3JG8cHpwkbDmHK810zKuHw4bMQbbtwa21VoHWcHC71foJaBNdN6OuR5PESmjUzx6wx0e3L05tD523t2wEI61wQbvaEa8uQtY1dm0c7wF7vhzzbQQ/DJF6tb14BXvKZp+5WEAx8I+QQL16YDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOxtJ4DKgMm0hz6TZKphQ1AwOtdPNzsyNxNATdJndvM=;
 b=KL/5J3O7I8k0sVMg8zjKajjZ6Qx+0PB+Eym8KLHiXrrU1k8RNddp3a2eqSBNNTwG2mDR+l+rcjJZP941viIx0Tlw5AUOC94qe9dhwzAqopPyVgJlu0hT05SzkqbBbWeEAc3NT6+UCx58tfDhdOLuNUnUtDhw6+aTcon0sDdRLKRx/8NXZJqTmoHE4Y1MWpUPVtlTIn1ElP9y0EX6SoAjmP4snqP+0Hdb/UNGDZyOW6bWb/Vj/j5R4Iktxkq78qDdYp7cgtKt0DOasKBQ8sIckRYpt/2RBzvcZNG+4QoDx8eLpCOqccRmY0BSj1SfUhNBSfZIZdafPH5h9sCb5DFf9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOxtJ4DKgMm0hz6TZKphQ1AwOtdPNzsyNxNATdJndvM=;
 b=PbLOTyZKQjJZDvKrsPqvdPsiGycIFB2dUcxX/Osjwcs40gntPljz0pdS8jqI+XRcKQBZ8k9wl5pNQHWg9lzppsuW3MhsgPxCy2rAbwYMsEBBnkHpo1wco+ojt6yXOyByzfR/tmzA2P3VmijXCvQNVJSA8J7DGBJoxg8bgWvJk6k=
Received: from MW4PR04CA0257.namprd04.prod.outlook.com (2603:10b6:303:88::22)
 by BN6PR1201MB2515.namprd12.prod.outlook.com (2603:10b6:404:a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 17:42:55 +0000
Received: from CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::45) by MW4PR04CA0257.outlook.office365.com
 (2603:10b6:303:88::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 17:42:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT027.mail.protection.outlook.com (10.13.174.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 17:42:54 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 12:42:52 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 07/11] platform/x86/amd/pmf: Get performance metrics from PMFW
Date:   Thu, 28 Jul 2022 23:12:04 +0530
Message-ID: <20220728174208.2081453-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
References: <20220728174208.2081453-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab058500-a341-4251-68a6-08da70c09a2f
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2515:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /8JaqHz4pV44zYHOxBZd0UdVIgKPt18HRUZszDGUJrDR7pPiiX+u8vwLzdguSUoI1H6t86a9h5JVLIEp6dr8ybhR0pHnTdHpILFBTPLfUWVjkceIs/cYn5gSiokpgcMJA1KzMFpXiOxMeBxNSXSTKgXqPPUEeA2GuzjOcrueEJQzP1+Myr/lTMGO2T7TKNI0OJ+HDoQK9a2NPtNhVKE6kvMeL7SDtKslmj+PxpZO4OZ29JSGhi0HbMVn4Igk0EWljvbXN4wKF85vNv0jr3paB7FMF9n0QvKaTuLv8VsJzssmgCHH3jeNUVdqPehlzJwaxnHkPVc6sLIEHpsMB0QVXSAy98BP1NqYGDcIxDOaFLmwFHoRNl82uz7Y9XjNIDV6T5ZGWGKor3noOcp8ifaF8bkawL37jZ5VzWvkfp8trWRF1hYnK7++mbVS3hjYs8CWIaEbTuER1jAb0ZsLkuYIiTV8HQGaR0RhCXL6boC1LmRMx8pX5YRF6GzqyRSLRNkH+mtAtfXk1zftxoalxubBOg8DUPVdqCxqQM4u/W2ZG7o0Vh9uiJ9djRPt6O6+GzqbzsovRKdYeV46ukRanWAV0zZNaKJ7jVbngpxP2sESHpgi5sxLWiGgJaNPxxWKk3eJKcl4j5lR/oK1/NnV5p9pe4qRUeUASrWeLO5knaCTEgQE0QzfEX7NJzkXqlBBGOyX9tQr5KKgT1WNMSFyr4neUQkfnY9E+byyZ9RB/PI8D8EPGbKQ/7tAfI/T29KBa2CzwPzv586K67Q6FZ7skN87z1knJae09/9kWLR8sKSCan/NZxzvV9PL500sap2bsvPDYNhbUn0/vbSWnLJP+Pv8jA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966006)(40470700004)(36840700001)(16526019)(82740400003)(316002)(41300700001)(36756003)(6666004)(86362001)(478600001)(40480700001)(83380400001)(2906002)(82310400005)(186003)(110136005)(356005)(7696005)(36860700001)(54906003)(1076003)(2616005)(81166007)(70586007)(47076005)(4326008)(70206006)(40460700003)(336012)(5660300002)(8936002)(8676002)(426003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 17:42:54.7301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab058500-a341-4251-68a6-08da70c09a2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2515
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
 drivers/platform/x86/amd/pmf/core.c | 56 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 39 ++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 6c1c5a89fe71..ede4eefc33a4 100644
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
 static int current_power_limits_show(struct seq_file *seq, void *unused)
 {
 	struct amd_pmf_dev *dev = seq->private;
@@ -88,6 +93,29 @@ int amd_pmf_get_power_source(void)
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
+	current_profile = READ_ONCE(dev->current_profile);
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
+	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
+}
+
 static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
 {
 	return ioread32(dev->regbase + reg_offset);
@@ -181,6 +209,34 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ }
 };
 
+int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
+{
+	u64 phys_addr;
+	u32 hi, low;
+
+	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
+
+	/* Get Metrics Table Address */
+	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
+	if (!dev->buf)
+		return -ENOMEM;
+
+	phys_addr = virt_to_phys(dev->buf);
+	hi = phys_addr >> 32;
+	low = phys_addr & GENMASK(31, 0);
+
+	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
+	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
+
+	/*
+	 * Start collecting the metrics data after a small delay
+	 * or else, we might end up getting stale values from PMFW.
+	 */
+	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms * 3));
+
+	return 0;
+}
+
 static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 {
 	/* Enable Static Slider */
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index b6501a68aa4e..49d3232ee2e0 100644
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
@@ -121,6 +156,9 @@ struct amd_pmf_dev {
 	struct delayed_work heart_beat;
 	struct mutex lock; /* protects the PMF interface */
 	struct dentry *dbgfs_dir;
+	struct smu_pmf_metrics m_table;
+	struct delayed_work work_buffer;
+	ktime_t start_time;
 };
 
 struct apmf_sps_prop_granular {
@@ -154,6 +192,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
 int is_apmf_func_supported(unsigned long index);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
+int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);
 
 /* SPS Layer */
-- 
2.25.1

