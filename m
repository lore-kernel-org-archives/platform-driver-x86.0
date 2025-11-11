Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF002D879F
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762843113; cv=fail; b=L2Q8I58NsDqanH1FcQLyr4G4wNOpL9x2KCc6+TgJbsUNszmdf0J0cisGedTz0gwkwXgCzdET6p2uqfI4Uh7y8RvjCdtUaO2Ezn2iZwIPBGcY6u4BX7BEmIApuz9tP0UGB4EnndfI+K+wZguuFa/QkpNDCzSRIpVzy0NrVGjjMCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762843113; c=relaxed/simple;
	bh=txBkQ0z1Z1g+Q3sjYIC9o6NuwmYF+SMlf9u5cKEdNBA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tLQ8t/e2vP7tqojJiM7bxD3KqNuAF7zsHCqOgyYxs8LoTJuAbVHWQFSlmtDkZAJJX7oq8Y6UbQClLAVAwcA+/u6Q/TAEesnO68KR6PKzRroVOXOsk5hpGn1BmzS25WBk16JcbLJj39Rx9t3LPfo6f5qE/6IRy6zUHTUq1+anahM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rtgZGVhu; arc=fail smtp.client-ip=40.107.208.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rtgZGVhu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkki6ctlzTGIMtuIPeTL5mbh+rzDbZYTNT+MHAY5nlS9ItGK006HFU5IsjwJCOjmg29PRPiURBQ2pwmm3uAwACXHvIqy/sAO/krKLf1gG7IHy0Y0vypH458EqjDOzWVM/5B+YkiT/UtOaBkZmIxdLGqC0THDZqlgng6X7GrQpqnw6iy+f196N53mP4XCaepCpui2uVwoWww8TogX/kJcN9VZcOmiHc5L+YnIyUvcIiohD9Bmt/bTrBV3kdjHe8DWd9LKq11to2/iOX9Rhj0XzwCUYRZXgsRoT0bPRxqkfcJ1oawJA1H8nYo5xGhQ+dMsjW4laninigjzqQvHHibmRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rQmLlAL3Ie41wwlvSihBZOX67E6+a1CNkLgxHw9F/I=;
 b=ZoAjYSpMkHj3Bk6cNB37lG2jIAfAvYbdUmMBXXSILxVVoxg9mWuSehouKRgeKM8OJYRSd95bJIjW0CsQozp3NU5LVer8sq+3h7A+3HwBf9JdhezDXGFTSOibLVC/1iwgBT4Dk4QzjmjfdDauFz/94fpEpaUHCIM+R+wQSzAtlX0z7HUdtWxM8V/7XpVMEOJYnYOnjvSecn/vkHFNllH9bGFHlj2jFiOKOQzNa5o4/BkOWnpFd7UdOONP69IQOzjQzS6Ql/yi3idtE8H6kbJhPflKX/pfgnBm+gcRNyeA73qRX6QvZMAYiv9gD8VfWsQNsTxs5NOp9BOBfeyNdWQI4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rQmLlAL3Ie41wwlvSihBZOX67E6+a1CNkLgxHw9F/I=;
 b=rtgZGVhuMpnVr/edfKbgvQzY6J1O632kPi2DHZRjolI+pXULaSwVw+TjHrRRzzUA/K7+S8Oz1cl1vj7sd5Htx0OtHip6aNdc4f4MZOLkPZa9rILLIEIvHQIRYyX7Cf3kS35mrzpwymFYhn6kLURPrIjd9jyjHCDVzdbul41ZXL8=
Received: from CH0PR03CA0082.namprd03.prod.outlook.com (2603:10b6:610:cc::27)
 by DM4PR12MB6159.namprd12.prod.outlook.com (2603:10b6:8:a8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Tue, 11 Nov 2025 06:38:26 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::49) by CH0PR03CA0082.outlook.office365.com
 (2603:10b6:610:cc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 06:38:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 06:38:26 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 22:38:23 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <lizhi.hou@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/5] platform/x86/amd/pmf: Introduce new interface to export NPU metrics
Date: Tue, 11 Nov 2025 12:07:36 +0530
Message-ID: <20251111063737.4156385-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|DM4PR12MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: b457fd09-a876-4eb2-a692-08de20eceb34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+eFqbfli/+Zn8ylRqZAMA7mKaJ5zRuxXiwAbcfZCRDsloxfsT6POGJZcRLEQ?=
 =?us-ascii?Q?dr+9wy3l9f9Y12XXYWRL+mRCJ31fdm2YpUmbcq54rPhdG9p/+qQf+Nfx78Kv?=
 =?us-ascii?Q?qp4gbgrPwZtEfTfBPVL/kluX780dXPstFYi2XYapFG/nWbC3Ts/t3gJT61Lc?=
 =?us-ascii?Q?xG92orO78NVEMel6w+6uk9yw/StPV28xroogU8oTEqsivWA9fDVMVP4UdoeO?=
 =?us-ascii?Q?hM4cIZ1AF30tgkUUUIXvN4TJ9dmbG1LzzotpizWAq9Y8xS1oo2O3VO8LeFTh?=
 =?us-ascii?Q?bSOB2ayMJIBFe9OIwBZQlXqOignTah4iYDhCF8ApG1+nCS/40Q5IAIIhBJFP?=
 =?us-ascii?Q?prwqwhietEa95Jl6RQXbFo3grDxIc7q6yMh/Rhs61ukkBhVbCgqZuuG7atFv?=
 =?us-ascii?Q?ZYMKyRW8iSD/USCTfiCO9W4a06d5Q5+D86T7piwEPnDu1TfUMHAmwupA7tme?=
 =?us-ascii?Q?h/ey3SLbcpJiMUQVbdyFXwhGuI9PzByNZIpHHxCNyO/o3VABgsytM/RTebjS?=
 =?us-ascii?Q?7yYC1RkdigIF+84CP09fJ4oxjMHEKMyjvggIYbdS0Og6EXkr/6x2obGqskym?=
 =?us-ascii?Q?olg4cNVDLMOxN7IUu4NKc7omgGiPfPx22Djt+adQHBnpsIgE5ZFd3+/7dIqE?=
 =?us-ascii?Q?OItrcibwvQG606JoQmSjyQEsPbtl7Qyve7WyYC2LaeMrhWFmQx2B3TcMTUAu?=
 =?us-ascii?Q?u6gbv4yTrXNvKmieCVkltaQFwwmASn/JbfBof7mB0D6OCFvgvo5gc7biMRN7?=
 =?us-ascii?Q?YHM8cQtg/Gks5ttd9i1BTA5NCMSSUFFCfCIIYw6yeOyHrI6QWpcvmt6kgMnB?=
 =?us-ascii?Q?P4ACTukJqo4Y0Om3oeC5Gx/X8VWpiZt2b5NIN4Wm3e+7LGV792Gu5yzTp/iP?=
 =?us-ascii?Q?MKwAmU4dmQ4sMMBpmz5LEvSmyb6Rx0Ws7Uizgo0/RZsxz7+Rphdfy5tqYVLz?=
 =?us-ascii?Q?MQ2yLtjnd74V5IZF5pyu6lFHCRiyTl6LitP8DTDx1DTEf63Er/LWqlwwkMVb?=
 =?us-ascii?Q?T0TZ8aiATGHwQI8Wp1MN10NkszR8YSNc1Rc7pZCpLpkkSg/k4WCHBA242Pzg?=
 =?us-ascii?Q?43QxFnbaHsvMr4EJ0lClS/WtH0wMo3p80sgKh6s4vdr8dm265yJd9oL/s5F6?=
 =?us-ascii?Q?1bPBiCwjJkZpznm/FIbqIbktzHzV9kqnYCDUIpolQEoj3US00fWV/tWtL4n2?=
 =?us-ascii?Q?8ATwtqQMAhbe7RrCImMObb1hDQw8MSvZFy2iaP/ytvmKzraySTL1CJ/d7fMn?=
 =?us-ascii?Q?K384iHb3RN2+31s04+TwqOh9fL+Ab3DyL95l9eqmuAoUUK/O71lH8NC85WTp?=
 =?us-ascii?Q?a5bwvDW7tp3+kJda31JyHp40trn1O8o0tA7gNkJ0izGRB3oob1Fa5SHjnTHu?=
 =?us-ascii?Q?KUub2eW+hZApR2mxeYpZF8nf+hTMvBcaP7VtwFSKmdv8VJKG+TD1IjE5sMU7?=
 =?us-ascii?Q?UeEPjhTchWtcRmyJFM5Le00nWTUY+D8DkytHKsSzH4LoiQKgTHCvTG9mBjas?=
 =?us-ascii?Q?uRRN8tHUEVeH/D2DyO5huw5KuhLjjK1BNEnjpYMiD9dQqzs11N3nnIJALZsj?=
 =?us-ascii?Q?Z03izI7iFu2jpHsyFWs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 06:38:26.3129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b457fd09-a876-4eb2-a692-08de20eceb34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6159

The PMF driver retrieves NPU metrics data from the PMFW. Introduce a new
interface to make NPU metrics accessible to other drivers like AMDXDNA
driver, which can access and utilize this information as needed.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 65 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  |  2 +
 include/linux/amd-pmf-io.h          | 21 ++++++++++
 3 files changed, 88 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index a6a5d416edf9..c1c317418633 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -53,6 +53,8 @@ static bool force_load;
 module_param(force_load, bool, 0444);
 MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
 
+static struct device *pmf;
+
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
@@ -314,6 +316,63 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
+{
+	switch (pdev->cpu_id) {
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
+{
+	int ret, i;
+
+	guard(mutex)(&dev->metrics_mutex);
+
+	if (is_npu_metrics_supported(dev))
+		return -EOPNOTSUPP;
+
+	ret = amd_pmf_set_dram_addr(dev, true);
+	if (ret)
+		return ret;
+
+	memset(dev->buf, 0, dev->mtable_size);
+
+	/* Send SMU command to get NPU metrics */
+	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
+	if (ret) {
+		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
+		return ret;
+	}
+
+	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
+
+	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
+	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
+		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
+	data->npu_power = dev->m_table_v2.npu_power;
+	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
+	data->npu_reads = dev->m_table_v2.npu_reads;
+	data->npu_writes = dev->m_table_v2.npu_writes;
+
+	return 0;
+}
+
+int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(pmf);
+
+	if (!pdev || !info)
+		return -EINVAL;
+
+	return amd_pmf_get_smu_metrics(pdev, info);
+}
+EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
+
 static int amd_pmf_suspend_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
@@ -468,6 +527,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	mutex_init(&dev->lock);
 	mutex_init(&dev->update_mutex);
 	mutex_init(&dev->cb_mutex);
+	mutex_init(&dev->metrics_mutex);
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
@@ -477,6 +537,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
 
+	pmf = dev->dev;
+
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
 	return 0;
@@ -494,6 +556,9 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	mutex_destroy(&dev->lock);
 	mutex_destroy(&dev->update_mutex);
 	mutex_destroy(&dev->cb_mutex);
+	mutex_destroy(&dev->metrics_mutex);
+	if (pmf)
+		pmf = NULL;
 }
 
 static const struct attribute_group *amd_pmf_driver_groups[] = {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 561919b9f671..63de4172a383 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -12,6 +12,7 @@
 #define PMF_H
 
 #include <linux/acpi.h>
+#include <linux/amd-pmf-io.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
@@ -410,6 +411,7 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 	bool cb_flag;			     /* To handle first custom BIOS input */
+	struct mutex metrics_mutex;
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index 6fa510f419c0..55198d2875cc 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -61,5 +61,26 @@ enum laptop_placement {
 	LP_UNDEFINED,
 };
 
+/**
+ * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
+ * @npuclk_freq: NPU clock frequency [MHz]
+ * @npu_busy: NPU busy % [0-100]
+ * @npu_power: NPU power [mW]
+ * @mpnpuclk_freq: MPNPU [MHz]
+ * @npu_reads: NPU read bandwidth [MB/sec]
+ * @npu_writes: NPU write bandwidth [MB/sec]
+ */
+struct amd_pmf_npu_metrics {
+	u16 npuclk_freq;
+	u16 npu_busy[8];
+	u16 npu_power;
+	u16 mpnpuclk_freq;
+	u16 npu_reads;
+	u16 npu_writes;
+};
+
 int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
+
+/* AMD PMF and NPU interface */
+int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
 #endif
-- 
2.34.1

