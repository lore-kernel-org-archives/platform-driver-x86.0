Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A6F3537CD
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968018; cv=fail; b=I17PmqQ4RckVelfMHDkaPr86sz2Sic0hxY3Z+JLUJhjv4FbqhmpPWd8fG2JY1bYXnzpLLsJF63tBVzmDYvLCLSde6UyIeC2zL4zzenBsNX2Ha+nTggVz7ZaOqimDUzt77MOEPUaDnQaHbbIzq/DvXihAL24+c7bQMZwQy1Rh0BQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968018; c=relaxed/simple;
	bh=5TcmKyVOx3wPe/wdiqm5/fQ1eYNeXvTIfkn1oo791Gs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pzYsVtALd4rzYyjQ3QjbNXy2TR/bqijVsrfB8HYrjk/WP5cUWccrXGnqezTvhpBd1OXW9A62Tbhqwrto6csFcnmC7hQxQFxO9LXWEe10lBIJON7F7IHHH/uISUaBtWpxvzPEQpHVeQyJvDcymAWJXbKYPxwCTskcHB4NVzuzHvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DBm8y78y; arc=fail smtp.client-ip=52.101.53.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DBm8y78y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNVAUuazHtDxpEmxK1BM9aps66qyVJsVGDvPU7dhGsbtWyBIIeLf9uigEkBg6MAuXf+IGEsBbWjfpymZQn451e0fCpIKVEE5i1DVYGYOLbPYQjnc+3o+95SIovAzgZuDhC5kt0VfxBbzROVDTtBE0nnS+ACEmeGYwpEDVFV4h4AW37ovDLAoWBo7GcuJTV5QmYX0oRkNUrNIAOs4Gk2yUf6vQVZpOcHIMfD/wkpGU0T/4rXNBVk8rwAPGmO466kwV3NczvRDxQGMDb+46yjYx1YKv65JP10SBDSzad+plfxhtlV0SsFZyH6QJ/sWgckcnN1++RyB82197O7/2L4bmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLnrxVVbxM0TeHpVogWeBdXmyrMyxNqfRuMSyYbQXVQ=;
 b=XpdwVdQKrrKfoiBQ8OifheeDn9aPcCWjPQt8h0QB6SIG46i8osDwmLNB1Rc21K8eQHGRPqq/dluwg83F5sydDngBwu0ccOeviDzCW8GRZ+SJFqj7tWdoZja6XjnTOo34ki5m890OzBA5kEai4YqZtDA1hNs6N06Qi/rnIzUQwuVeO04hI34k3UhGHmnbl/HsQnr8YpEqM+lhbgyqVBmj3pCpAwfFrJOgKP/Li4b/bILHjDiIfwlvhB9IL+u3SpWoqlIskb0Uvtjth4Lc5qTHOC7bsRIMPYE/NkWQDoRLF13u9sXzAaJWlZCB8VtOtsO8nHQcDNC0K2cxtGHTZhpVIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLnrxVVbxM0TeHpVogWeBdXmyrMyxNqfRuMSyYbQXVQ=;
 b=DBm8y78yl3iIqKg+1TV3uiimMP8HRevAcFO9clT9EXPII+3XHTl6fT2sHQQEaUmMIa/K/dCixyIV50p6Q21+itzbBlfmy79jFsBN3cuR8zmGAQHbSYt0maI8cJ6eOO+PBM9c+odQGiSQZHaLuV/7XA+1eNyCT2ozt55mZo1EH3M=
Received: from BY1P220CA0049.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::15)
 by DS0PR12MB9276.namprd12.prod.outlook.com (2603:10b6:8:1a0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 18:40:09 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:59e:cafe::2d) by BY1P220CA0049.outlook.office365.com
 (2603:10b6:a03:59e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 18:40:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 18:40:07 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 13:40:05 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v2 3/6] platform/x86/amd/pmf: Move metrics code to dedicated file
Date: Tue, 14 Jul 2026 00:09:33 +0530
Message-ID: <20260713183936.690228-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
References: <20260713183936.690228-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|DS0PR12MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: c14782e2-a2e8-4b0e-0cee-08dee10e29c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fYm2YIFFHKrCwIqcnsDdyqWLBzr0uDUkMKfoxA0+Yyc7DlcME4KmBzKn3NB+Q1C96waDcie4ArzkIYgD6rxNOvjZqav/4VpCd7NysUgoBYItT65bEyFQezHfFcSrpl7EoF3u6TzNOekLiOhAP/xo3N4ImSrWHzbLMqQJJfzRCgmp/sSeHSqNQUZC6v7M9eXHXYFpJMpSg1ls/M6iGtV/Ci2If7lMdU7D1cokEML7o/6/4YJ0gw5MjpQkOnAyYk2vUCJu/+aebJVOFMWxNNEokOGKAiSk3OfIwbhByxoCR8mPohrjxmXp2dYb+jN+ed6DpX1n54yOT41wxS3WPrseUqi0H4RCQUfbEl1RT6QeDAVBSSoYerKHwB8y7dqBPnyMnmFSnnH/sGdoTXjemppnV19okM9X0j3a8tSqsAbyh6kyX1b3IIWWeg+sq9TVYc9e+Jg4z59k+GGle7QAh9t0uRSHaa4y4cyQUZSQSwhGIZFdXE+SXG8mG+XMhX/rw6sFB4w0CK7GiZIla4tnofw6jSNJqea8Cn8kZs+EFGBh4hwVSDMkpiq4GNx9V2GAGM+1y5GLe7g/2DsyiQ1KYb5BFn7/vQ0lLmotey4Oysn/yiWvHJe71C1BAw07iJ1RLbi6Eeg6sBXQ/9pWFcCYmyfDhhNDvu4A6+MDZgRJPFeoDF8PWWwnUudzyAazcqT/s5n5x5wl+MKgxWpjothC6w7LeQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DYLVjvJESm3tMpNx014MBYHEwK957fxnXvw1JGmA05TjZj0k+v23Vz7nC6Hx6+JP8kcZDQNxY7Ic72zHNoq0lnKYS5Y4994CdL2WaolJ198wMBgN9MMDEXIYZfaVKSEkLzmExxjEdUoeoBbYsFBJBwSIFxa3mHg+xC902T65cxq2YY3TcUVFvsmTcyQN93hWEZlSZEcxl1qVISoMhagdqNIZs5HcfE3t/9YDh3Ji5GScKnGJel1Yhz2G75PVL2OevQO4LdRbAB/k1xtQ97aeX+3xl4/A8WbRklb/9zEaqBjmaKiNPQGSUvKZwNDFcvdeppGNaH3uFrKMye0MCmkmqEUSNhhjc636jpzDs/c7qy8Z6r6RDLdP75aYfasRf1jcB3DcVmo4dI+8b1di9y8y0IIS/2J3+10YpA6VCWynvypFbLEhgR6WTq+7Emb6C2SF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:40:07.8614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c14782e2-a2e8-4b0e-0cee-08dee10e29c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9276

Refactor metrics related code from core.c into a new metrics.c file
to improve code organization and maintainability. The metrics
functionality is evolving with new platform support, warranting a
separate file.

No functional changes.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/platform/x86/amd/pmf/Makefile  |   2 +-
 drivers/platform/x86/amd/pmf/core.c    | 156 +--------------------
 drivers/platform/x86/amd/pmf/metrics.c | 180 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h     |   3 +
 4 files changed, 186 insertions(+), 155 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmf/metrics.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index bf7aad80b9e9..8cac51182433 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -7,6 +7,6 @@
 obj-$(CONFIG_AMD_PMF)		+= amd-pmf.o
 amd-pmf-y 			:= core.o acpi.o sps.o \
 				   auto-mode.o cnqf.o \
-				   tee-if.o spc.o
+				   tee-if.o spc.o metrics.o
 # Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
 amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) += util.o
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 0f85ac0ba803..600992f0e2c7 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -55,7 +55,7 @@
 #define DELAY_MAX_US	3000
 
 /* override Metrics Table sample size time (in ms) */
-static int metrics_table_loop_ms = 1000;
+int metrics_table_loop_ms = 1000;
 module_param(metrics_table_loop_ms, int, 0644);
 MODULE_PARM_DESC(metrics_table_loop_ms, "Metrics Table sample size time (default = 1000ms)");
 
@@ -68,8 +68,6 @@ static bool smart_pc_support = true;
 module_param(smart_pc_support, bool, 0444);
 MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
 
-static struct device *pmf_device;
-
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
@@ -138,37 +136,6 @@ int amd_pmf_get_power_source(void)
 		return POWER_SOURCE_DC;
 }
 
-static void amd_pmf_get_metrics(struct work_struct *work)
-{
-	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
-	ktime_t time_elapsed_ms;
-	int socket_power;
-
-	guard(mutex)(&dev->update_mutex);
-
-	/* Transfer table contents */
-	memset(dev->buf, 0, sizeof(dev->m_table));
-	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
-	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
-
-	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
-	/* Calculate the avg SoC power consumption */
-	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
-
-	if (dev->amt_enabled) {
-		/* Apply the Auto Mode transition */
-		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
-	}
-
-	if (dev->cnqf_enabled) {
-		/* Apply the CnQF transition */
-		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
-	}
-
-	dev->start_time = ktime_to_ms(ktime_get());
-	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
-}
-
 static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
 {
 	return ioread32(dev->regbase + reg_offset);
@@ -296,125 +263,6 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ }
 };
 
-int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
-{
-	u64 phys_addr;
-	u32 hi, low;
-
-	/* Get Metrics Table Address */
-	if (alloc_buffer) {
-		switch (dev->cpu_id) {
-		case AMD_CPU_ID_PS:
-		case AMD_CPU_ID_RMB:
-			dev->mtable_size = sizeof(dev->m_table);
-			break;
-		case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
-		case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-			dev->mtable_size = sizeof(dev->m_table_v2);
-			break;
-		default:
-			dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
-		}
-
-		dev->buf = devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL);
-		if (!dev->buf)
-			return -ENOMEM;
-	}
-
-	phys_addr = virt_to_phys(dev->buf);
-	hi = phys_addr >> 32;
-	low = phys_addr & GENMASK(31, 0);
-
-	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
-	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
-
-	return 0;
-}
-
-int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
-{
-	int ret;
-
-	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
-
-	ret = amd_pmf_set_dram_addr(dev, true);
-	if (ret)
-		return ret;
-
-	/*
-	 * Start collecting the metrics data after a small delay
-	 * or else, we might end up getting stale values from PMFW.
-	 */
-	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms * 3));
-
-	return 0;
-}
-
-static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
-{
-	switch (pdev->cpu_id) {
-	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
-	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
-		return 0;
-	default:
-		return -EOPNOTSUPP;
-	}
-}
-
-static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
-{
-	int ret, i;
-
-	guard(mutex)(&dev->metrics_mutex);
-
-	ret = is_npu_metrics_supported(dev);
-	if (ret)
-		return ret;
-
-	ret = amd_pmf_set_dram_addr(dev, true);
-	if (ret)
-		return ret;
-
-	memset(dev->buf, 0, dev->mtable_size);
-
-	/* Send SMU command to get NPU metrics */
-	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
-	if (ret) {
-		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
-		return ret;
-	}
-
-	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
-
-	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
-	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
-		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
-	data->npu_power = dev->m_table_v2.npu_power;
-	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
-	data->npu_reads = dev->m_table_v2.npu_reads;
-	data->npu_writes = dev->m_table_v2.npu_writes;
-
-	return 0;
-}
-
-int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
-{
-	struct amd_pmf_dev *pdev;
-
-	if (!info)
-		return -EINVAL;
-
-	if (!pmf_device)
-		return -ENODEV;
-
-	pdev = dev_get_drvdata(pmf_device);
-	if (!pdev)
-		return -ENODEV;
-
-	return amd_pmf_get_smu_metrics(pdev, info);
-}
-EXPORT_SYMBOL_NS_GPL(amd_pmf_get_npu_data, "AMD_PMF");
-
 static int amd_pmf_reinit_ta(struct amd_pmf_dev *pdev)
 {
 	bool status;
@@ -677,7 +525,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
 
-	pmf_device = dev->dev;
+	amd_pmf_set_device(dev->dev);
 
 	err = amd_pmf_cdev_register(dev);
 	if (err)
diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
new file mode 100644
index 000000000000..4fabe4ee4149
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Platform Management Framework Driver - Metrics Support
+ *
+ * Copyright (c) 2026, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *	    Patil Rajesh Reddy <Patil.Reddy@amd.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
+#include <linux/io.h>
+#include <linux/ktime.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include "pmf.h"
+
+static struct device *pmf_device;
+
+static void amd_pmf_get_metrics(struct work_struct *work)
+{
+	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
+	ktime_t time_elapsed_ms;
+	int socket_power;
+
+	guard(mutex)(&dev->update_mutex);
+
+	/* Transfer table contents */
+	memset(dev->buf, 0, sizeof(dev->m_table));
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
+	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
+
+	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
+	/* Calculate the avg SoC power consumption */
+	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
+
+	if (dev->amt_enabled) {
+		/* Apply the Auto Mode transition */
+		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
+	}
+
+	if (dev->cnqf_enabled) {
+		/* Apply the CnQF transition */
+		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
+	}
+
+	dev->start_time = ktime_to_ms(ktime_get());
+	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
+}
+
+int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
+{
+	u64 phys_addr;
+	u32 hi, low;
+
+	/* Get Metrics Table Address */
+	if (alloc_buffer) {
+		switch (dev->cpu_id) {
+		case AMD_CPU_ID_PS:
+		case AMD_CPU_ID_RMB:
+			dev->mtable_size = sizeof(dev->m_table);
+			break;
+		case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+		case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+			dev->mtable_size = sizeof(dev->m_table_v2);
+			break;
+		default:
+			dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
+		}
+
+		dev->buf = devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL);
+		if (!dev->buf)
+			return -ENOMEM;
+	}
+
+	phys_addr = virt_to_phys(dev->buf);
+	hi = phys_addr >> 32;
+	low = phys_addr & GENMASK(31, 0);
+
+	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, SET_CMD, hi, NULL);
+	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, SET_CMD, low, NULL);
+
+	return 0;
+}
+
+int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
+{
+	int ret;
+
+	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
+
+	ret = amd_pmf_set_dram_addr(dev, true);
+	if (ret)
+		return ret;
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
+void amd_pmf_set_device(struct device *p_device)
+{
+	pmf_device = p_device;
+}
+
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
+	ret = is_npu_metrics_supported(dev);
+	if (ret)
+		return ret;
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
+	struct amd_pmf_dev *pdev;
+
+	if (!info)
+		return -EINVAL;
+
+	if (!pmf_device)
+		return -ENODEV;
+
+	pdev = dev_get_drvdata(pmf_device);
+	if (!pdev)
+		return -ENODEV;
+
+	return amd_pmf_get_smu_metrics(pdev, info);
+}
+EXPORT_SYMBOL_NS_GPL(amd_pmf_get_npu_data, "AMD_PMF");
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 088edfab08f0..4873685c84ad 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -137,6 +137,8 @@ struct cookie_header {
 #define METRICS_TABLE_ID	7
 #define BIOS_OUTPUT_MAX		10
 
+extern int metrics_table_loop_ms;
+
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
 static const uuid_t amd_pmf_ta_uuid[] __used = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8,
@@ -864,6 +866,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
 int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
 u32 fixp_q88_fromint(u32 val);
 int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
+void amd_pmf_set_device(struct device *p_device);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.34.1

