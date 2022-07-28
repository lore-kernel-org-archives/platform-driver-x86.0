Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984BDC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbiG1SVQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbiG1SVP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:21:15 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8FC5A8A3
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIOigDjWOF4yHdNZnmt847fOZzO4LKArSNNc5ly1pPGrk6K2HL2XA40d/SGdHFIiaPNyuOI8u+N18nKOMG5TD+fmgELrM2KB5vuQtE6dZ5dW+/F5uUDVPqN/EgCwapELnoUUyQ1VM+7JgGxW2oPYBdw7GPpmqvpJEDpfh56/G53b+2E8su+rVAgcIK3qzbmO8fOVAGnsnH4JqjDIJfvc10PoEZXq6SgLK4C6NLs3F0slSEcxFfC9SHKqgecFOnzAiy22zdElXdAOJ0x4QtobiTfxNY0HZAqTeix/CWb8hl9nCh6ynBMun13gCMcGwzFkEVVWxy9EOPCs8etBixMouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOxtJ4DKgMm0hz6TZKphQ1AwOtdPNzsyNxNATdJndvM=;
 b=ZUHsd5ULwuYrusfKvVoLUPYnUhXI4GvQTSXgXqIXwb6XZXtAsa/3BMNRD7baZ8uOPwqzc/7sg3m5vrCSMUeu8GOcPwx4xy0VkBQqkYUQPcYU60an1oby0TKktTyacYC9QN3Y2mzV8b5GV/wdnWrathIQenu1PSLuko4WsV0ON2t/oDGGvDAb3loezHgozHcsmZQeNubTi76/ktzDw0SMkO9AzC47imS2z9MXUk90+vl8HhEorWtY8McMu8ex9kgGA6cYakPWPcww2q7jU9I+mZ7SBS86lenZsqQ7FYrHaHuQrXlsni3KVylQVAHvLMwKtlrgPP1Jo6l0SwKU/gMytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOxtJ4DKgMm0hz6TZKphQ1AwOtdPNzsyNxNATdJndvM=;
 b=ZdP30h48kL0ykqLscivigv5HwN92FTPf0lJmtHbRCI+psnRJnND6pvclQubguC2BK+LDwwMgyHC0NEJNnkJbRFvXzmZOPX564dWOX26+6XsOSyoDA5zrZzNkOZthIn1JFVURrFCzSYHmXWo2mBzwqlYnMlBtvu7wolsYHZLCVZc=
Received: from BN9P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::18)
 by CH0PR12MB5105.namprd12.prod.outlook.com (2603:10b6:610:bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 18:21:11 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::9b) by BN9P222CA0013.outlook.office365.com
 (2603:10b6:408:10c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Thu, 28 Jul 2022 18:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.10 via Frontend Transport; Thu, 28 Jul 2022 18:21:11 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 28 Jul
 2022 13:21:05 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     <hdegoede@redhat.com>, <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
        "Shyam Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 RESEND 07/11] platform/x86/amd/pmf: Get performance metrics from PMFW
Date:   Thu, 28 Jul 2022 23:50:24 +0530
Message-ID: <20220728182028.2082096-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da1909e3-9de2-4455-e7bb-08da70c5f306
X-MS-TrafficTypeDiagnostic: CH0PR12MB5105:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4xzRxqg80plziM0/4NBi+cDhF0X9ZYgc4hvQ4ShAdYSAOZSi5MvFgwo19t82XEjtds7FAGD9tDOO8oF/RO1X6EnKB45ZWeAhvADWvxVh7iOQX+ZxjjIINx5W6pEECuUE4CV7KphtlmRo4I/c9ml+h1ZaDZkZvv9IEALwUcPNzaOVfCjHoFNzx8miU67jcxrIeaDgAox0lkgb+1SA9pjLZ8chQCmrlYZmVTq6Lg75o3G+6Ypn7KjPfEkOwqFjPRWZmzfrecnGfRFeRuhZ4T3aInF+UvRbw2oijZiq/aDPttb91Y5NjRyEhOj67IuFpfLYm50ckHkv8ibUGC8SbDBjFwZxpAcZdJGwUHgjI0EF6uv8fHne1pn0GCB9Tt1AbaYS+zyG7cFCOS4yenbO6LxXEDahgOjIlWW66nv3WNue45u8sVqCsR5BRWlzcRtJkAa6TYx9P5MNzrkzoxhX+RC6QcTWLYIvakRSBdHwr9eWFiEJj7ZssNoWPL2uQPa4rSSAnJWYZDf6kay9dPkFIkq5F5RunY1U952YoCkydcwfFAvBQonysraZa/0u1keFXW9N5UsTLlU5Pi/Rogvys7zMUjvcCLazV3Nx1Ci1lp4V2tgNK2WFFsiEx7+N9mgYbEQkmDW1vsnYh7GYbyu3jI601ReGXBl2STPPUuvoVM40M9paQlDDBx/WBBE14vLDrGlTBpt2DtCcRRM6h/Mu2jB4rdWCFbedZnhT1PCEhC5L/55T0HBXWQCHPL08H1Z+yGGcLGxwGjB6f6In6QUJ6Eco3iSV9/kYzxCyfi8qC3zBnCOTHB29vFCo1pj6jNY2yA6Q73U2E6+yeYJ1DYzrPIKbQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(36840700001)(40470700004)(46966006)(5660300002)(8936002)(70206006)(186003)(82310400005)(4326008)(40480700001)(8676002)(2906002)(16526019)(40460700003)(83380400001)(36860700001)(70586007)(36756003)(81166007)(86362001)(356005)(316002)(82740400003)(426003)(54906003)(47076005)(2616005)(110136005)(336012)(1076003)(26005)(41300700001)(478600001)(7696005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:21:11.3593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da1909e3-9de2-4455-e7bb-08da70c5f306
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5105
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

