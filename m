Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D65C19F2B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 11:28:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236940AbiHBL2H (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 07:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236926AbiHBL2B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:28:01 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CCE45064
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KI91pcI4WAqwXyRaBP7w1rTyhsrmaCrC/mQcazm4eI26pnJU2rfHt3A3N+Rb9+ioyOMvhvwIMViqhX8vnkURinMEWmyQTxS5j/Pqvm9KIr7rqK0WZOykB3eViRLDZcUvESzFYNqPJpT35SSjGLPvkf97de1KgiOhmjRGiT+JELwn3xlk1rUI2E+Q89jB+gF+Z7ny8/KAB8tiYBU7DBii/iCUme74kweVNS9pvrNRO2McdLZRPUkSxigOInOMvMyBZYsHZHtrKl7OydZRizt5bFhhADKSYPJN5k7wIrFlleBDJblQiMsLAiZc6XADBZBQWjbKNUZa67W6Ch6p7Zm6zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGgvGqoHCMeY55V0NFcCxe5Sumax+bujLzQiCw917Ns=;
 b=mtXuYzWATLAvzD/GuGIjnlLwk6HJNaq5jKQvB1HpsX7D+EfhAJ3gZGM8EXxHvLZfpOKVKjwvnHlumzbwFwFFtSIF4L0aopdPVRlfYQSvDGlJ/nweGOl9drPsuBUxYhJzf9Qt8J7ktATeENLXNXBNIsapobAnnqeEs7HCcnYVvFBXymqBOkpAtbHVVAbBkF1xIlJvl9sKsijABun7nmu7DSnwOAKKhUy1/KXEAjU5zNt6EvkGPYoCmiLDuZ1gxFp86p3b1pvPMLJSFVt4uU5HBxTzmk+myvDDS3jfzEtf6s0wj1NS7ftcGy+J09zp0RJdaAoisho6ZlcQC083z31/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGgvGqoHCMeY55V0NFcCxe5Sumax+bujLzQiCw917Ns=;
 b=HDIwbFcg+DUefJs9eaRXa+6QI8/KRoJ9YPyWLE669ehV5wdVtBV3KuYDdJI5uV68cmMIVBtVxmD8+KmbEo2n0il68V5cMahX9kBb8BnIVxHxdqPaLMbpLjWou3tEdwml+XPt9Tsz9ENAR+UeaoKuTcj7H6oIJd5HRBcm/Au8FBk=
Received: from MW4PR04CA0143.namprd04.prod.outlook.com (2603:10b6:303:84::28)
 by SJ0PR12MB7006.namprd12.prod.outlook.com (2603:10b6:a03:486::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 11:27:52 +0000
Received: from CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::65) by MW4PR04CA0143.outlook.office365.com
 (2603:10b6:303:84::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24 via Frontend
 Transport; Tue, 2 Aug 2022 11:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT039.mail.protection.outlook.com (10.13.174.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Tue, 2 Aug 2022 11:27:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 2 Aug
 2022 06:27:29 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 07/11] platform/x86/amd/pmf: Get performance metrics from PMFW
Date:   Tue, 2 Aug 2022 16:55:41 +0530
Message-ID: <20220802112545.2118632-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff6821ae-2f3c-46ee-c767-08da747a0968
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7006:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pA4rPzo7IE8eUkJnHSLoUN6TGp3jsbdQ+QDFAqOWZPN+FQtCbc6NrherDzuzK63e4QdyvLMea6gwzwHyJ4gcDd1ixhKG+eqMhc6ffg/9EDeCcUQRbxwZBNvldryflvXC0rSDJWa5gD8hB+q8jh+eoWBiGpzk2m1qts369ywP79KDN9gWksu8umezGUAuVY/wKCdoDpAZrgA6Sqxs+BRYUf9OZRXq/KJ9G+SVMfa8VfSb9IgwaHwigOvC9DOJv0iG6XiIH2gQ6WN7krMfD0cP+PPzkzYgl0wp55o2agLUELmODtGCfsvwmLqPiaCCeo6GAyFqJssKHEK9kTL2PcEo06kbK7bC65alAQdRvosHZrUQLzsuDLBDMGCZO2yJe0KhMrkDPQwV9+2OufmpHDf2FjTdJ7HkPIytFkui+A3j/8uSyjhfFBQ6KsowqmgYPn83p4+Hu7LE3pZfw3CTw31JyAgmaNgX3Yz9Nm0CsYa4oFnd+bpoXllq7+/+Tr+CJq1DWzBhTy+2REfOq4VXLduSYGC202+sNfdDgtMKm+C9PTmXlt/z+GUixQ9OIdSkItXXdzwTEI/gdlp6UgRuWKHN/n32NsnOoXq68WJG7zoCW/VvK7gTv427cEcmphG8Y8z0l8d8Rk9jE3rm9D1eGBTtvSG/7P8VRummj7w5pkV+Wi5eOFJ3SBCN0RgcYqqNrE4bcxjfJ9mWe6e2y0Gpt54cpcjrZ2eL79a5TebAc9SknXMVzepUqeOUGm8Z3UBu2z21Y8O/LL6rd9qnYGe4HLqyRLrDw9MFUifQJmMAufguMuFjefY48KTs6Fa1CFHUqbFY7wt9BcMn/hrbQ714U9LZ7A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(376002)(40470700004)(46966006)(36840700001)(5660300002)(7696005)(6666004)(41300700001)(81166007)(8936002)(40480700001)(54906003)(110136005)(82740400003)(356005)(316002)(82310400005)(86362001)(70586007)(70206006)(2616005)(4326008)(40460700003)(8676002)(478600001)(2906002)(186003)(426003)(47076005)(16526019)(336012)(36860700001)(1076003)(83380400001)(36756003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 11:27:51.7165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6821ae-2f3c-46ee-c767-08da747a0968
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7006
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
 drivers/platform/x86/amd/pmf/core.c | 52 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 39 ++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 87a1f9b27d2c..762f769bf7ee 100644
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
@@ -88,6 +93,25 @@ int amd_pmf_get_power_source(void)
 		return POWER_SOURCE_DC;
 }
 
+static void amd_pmf_get_metrics(struct work_struct *work)
+{
+	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
+	ktime_t time_elapsed_ms;
+	int socket_power;
+
+	/* Transfer table contents */
+	memset(dev->buf, 0, sizeof(dev->m_table));
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
@@ -181,6 +205,34 @@ static const struct pci_device_id pmf_pci_ids[] = {
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
index d40613a30ed7..42e4a5f512c0 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -67,6 +67,41 @@ struct apmf_fan_idx {
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
+} __packed;
+
 enum amd_stt_skin_temp {
 	STT_TEMP_APU,
 	STT_TEMP_HS2,
@@ -105,6 +140,9 @@ struct amd_pmf_dev {
 	struct dentry *dbgfs_dir;
 	int hb_interval; /* SBIOS heartbeat interval */
 	struct delayed_work heart_beat;
+	struct smu_pmf_metrics m_table;
+	struct delayed_work work_buffer;
+	ktime_t start_time;
 };
 
 struct apmf_sps_prop_granular {
@@ -138,6 +176,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
 int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
+int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);
 
 /* SPS Layer */
-- 
2.25.1

