Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB2C376BC6
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705380; cv=fail; b=hmCRU7FVU4W1mSX0q/yBFCBILmeMuW7iAhjHXOkK/pJgp7PP3WVQAQpRGmCRc6/6wPpi46tBm6JzSCRqejlUP/8KKbJXfObvCg0lu5vKD+QEkFvwpI1Fhr/N+hPv9vF8DyLEHVz9SJX/9CJurS5N7j1atKrc9ynBlRAQJ3Vzjyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705380; c=relaxed/simple;
	bh=kW0QXI00afFfE0M7doogM+1LeSoUOPwicSjuOEIWlXs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H/JKe/8OnuwO7cGjc5+tEi8kffwbUMwjCXbW2+xKKUbZkhRgoaCu+iytdM6dekkhM4ixuAjs2BwjU2f60tkrlA0N2lyTelffJ6f35muBa/hg2Eo/7H5360SeSzoPxgfAwUGFm1lwNa14GjW9WemO3uwC5iZSo6CVJyjPMhhRAPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K8PFp1Dh; arc=fail smtp.client-ip=52.101.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K8PFp1Dh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNDkxPoUIve85lyDEZPBrSk08FBeT2iqHG8TQyVAEDJhqUtpXTbG9C8xNjKFPauFfOINKykreg0os2EF1eEHxKiL0BBGVd15VWqDf4FEZ37/V7sKxveaODUTjF0Xly5E9m0mvPFCONrKju5pDGmj+llwLasAqPNd/a6YrGWI7CCUq+Exrwag/pEptVc4qU2VZoiCnIh4HQel70pHwaUxQSu2TtSXU2GOQJ9R8pTeNd6LdILfTr2/MvmLkILcA2SKHr/vgHhe8C+e/t2lCgPrjeQa5WIb2Bvjqgzhw/R/Bighr4iV2O6yPHptpaMCsrPUyCdvX0yHhqXcUFKQZBMNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7Rncmtqp1R00ciNuOHmLHLnnxY3RSQ+8iMWnfw0vQE=;
 b=hzvWKIBXcnBTmhY3UKPeC/wgmngBw5PuTmbJ127+7KkU9qRRnBXWYGcvzK93sHMYZas3wsoBXR4p88GVlgBgX7vv2wCyu4q+HKUzZqZabQT0galg5ahQ1q5qoAUN/yIqD3T54rgZqQL+W86JfcMKJ4tLizBJ8zb/MyMTp2qCo38L9hw7H9edNxKiR2vOaFGMybQfleqBosLojkCBhGKjbaDbxc+xfKOMYVBn2txZTnJwu/taBzQbEVck0CB7cAcIRpocez7lfmWLcBNn5qpseY7DQIe4xoHb9UCcXHmu+3gAT/9UEwnAqYyKG13IWwC8OOCpqWqC+acDubGtOtoBEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7Rncmtqp1R00ciNuOHmLHLnnxY3RSQ+8iMWnfw0vQE=;
 b=K8PFp1Dh0SJt/aT0e/f4fIPfAJ3GbbpxNTpWIVnqf8vMcyaK+bE5cP87YD6xDuGGpiD6u3g4nTTgZGk9NGVWvbB6Qkg2SuI1rdZXgh5nfGNE6UPYM9OSXTRX6+Bez+gen2CoAk/w9GcoPmh5r1sJmwRrFnShEaGfdHENVbiJ3Qo=
Received: from SJ0PR05CA0128.namprd05.prod.outlook.com (2603:10b6:a03:33d::13)
 by CY5PR12MB6275.namprd12.prod.outlook.com (2603:10b6:930:20::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 17:42:49 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:33d:cafe::90) by SJ0PR05CA0128.outlook.office365.com
 (2603:10b6:a03:33d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Fri, 10
 Jul 2026 17:42:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 17:42:49 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 12:42:46 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/5] platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics support
Date: Fri, 10 Jul 2026 23:12:19 +0530
Message-ID: <20260710174219.2522269-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|CY5PR12MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abd1996-ec11-4180-00e0-08dedeaaa8f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|5023799004|56012099006|11063799006|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Vo/3uxqBpepZePKL9lN+J0unppQHar9tPobTdJH/ys+1bySOcFB1sP5xLqIvQiXKZvZwvE6MypnU4cIx3QBTtiy/dsflS4I/HRsUYkYy9sI0VhKc+poaLM3Wk1TyOVjVf0iU5RPV7MEsAB7davcQd32CJlHZVFvBloeB4aWQCvDtLUpeSw8Ju3QMXiJeRNL4L97WAPpXr+0vRcdSYNoa5GLwgsDFGWXF3qBQCyLT+JEGezOimlmnaVnMBZ1rT/7B4EedClgHrrBOdE0v+FYI0zo/LCaQawAH4lbASymIum8UxEP06zjuhr1SFMt8ov5UPFw9QLc32B/16r9B2Y8WRsy72/Rz7Uom6tzhlKg2jlqGrPdRmkWNzyqrE92Ln13Vb/8vLLAvtvrre3uiINSkFKiYauqKYtCCTMjV3xue6P43J3vzZ9c9suD9LpmrJDyJdtk021Jsloq4J2ueg8FpqNfviHdQ8mShZYJSYLvtCZTTQ95fEUVJggPJVM1FMUEhZOJzFREQlDy8Ola3QIH90reNBJa1pSAPLlzrrXKlc98B+Ufe8g2InLlChPI5QCPCo+zzTDnCIQio4bX27qYMFUqSxF652Vh3qtNxfSgXHdSzV7O8BsK6sfuwEUUwgsBlfjPbyisdWVt368sXqNQb4ulL1dqAvY+ubzRkxgXIw1lCWRF/mizYUq4+o4db4v6A/JUxnAEyM63dAVKKEpusMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(5023799004)(56012099006)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	buKD6u+8Yz9TbtzuChNUhe2C1GpZnXfyQnDGmp4A2c7V4j8caRuCh8Hqxjmo6Wgc8ZjKP92cYNc1WC6hdziT7foZxcwJIwpJRsYj3Jn12ZkGF3cP9oNgi1ymfWwovUL5vBTOztseJnJUTGpaS7KlF/4w3hRHEGRMRSwsXPL6XnRg8Bvokwpf8VIDXKbbcvH/d0FN2BYQXt4+WUNTe3ccbQMc5N2/l6Fsi/trKoDsXCzHAorLadcC0qfw0QnWHdMc/910qvCBizGVvc9AF1jthnlCb2WKtt/E8B31LbAIH0xZLBrbe4y/un+uENhiNE9scdC5LLxrcNCaviqRe2doC8W6wiOo5/o3xzET1dCGO3cK9RsR3eokRVD5g0chFrIw6TbQvxzk2oBEmrQxb16f1bpcOc7KL4TTblOK4dgzidLGgEnlsEiTkZSHCkwf1B6y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 17:42:49.2477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abd1996-ec11-4180-00e0-08dedeaaa8f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6275

The 1AH_M80H platform introduces a new firmware managed DRAM based
metrics table (amd_pmf_metrics_v3) covering the full platform telemetry
including power, voltages, frequencies, throttlers and activity monitors.

As a first consumer of this table, add NPU metrics retrieval. Unlike
earlier platforms that use a transfer table command, 1AH_M80H metrics
are accumulator based and require delta calculation between consecutive
samples.

Extend amd_pmf_npu_metrics with npu_temp, populated from the
npu_temp_acc accumulator field available on 1AH_M80H.

Key changes include:
 - Add DRAM based metrics table support for the 1AH_M80H platform
 - Introduce amd_pmf_get_tbl_dram_addr() to obtain the DRAM address
 - Add amd_pmf_get_metrics_table_log_sample() to trigger metrics updates
 - Add struct amd_pmf_metrics_v3 for the 1AH_M80H metrics format
 - Implement accumulator based delta calculation for metrics
 - Introduce amd_pmf_calculate_acc_npu_metrics() to get NPU metrics

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c    |  25 +++
 drivers/platform/x86/amd/pmf/metrics.c | 142 ++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h     | 218 +++++++++++++++++++++++++
 include/linux/amd-pmf-io.h             |   2 +
 4 files changed, 387 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index c0a21808b867..5d744eb71418 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -68,6 +68,12 @@ static bool smart_pc_support = true;
 module_param(smart_pc_support, bool, 0444);
 MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
 
+/* Helper to check if platform is 1AH_M80H */
+bool is_amd_pmf_1ah_m80h(struct amd_pmf_dev *pdev)
+{
+	return pdev->cpu_id == PCI_DEVICE_ID_AMD_1AH_M80H_ROOT;
+}
+
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
@@ -155,6 +161,12 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
 
 	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
 	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
+	if (is_amd_pmf_1ah_m80h(dev)) {
+		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[1]);
+		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT1:%d\n", value);
+		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[2]);
+		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT2:%d\n", value);
+	}
 
 	value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
 	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
@@ -214,6 +226,13 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 			/* PMFW may take longer time to return back the data */
 			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
 			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
+			if (is_amd_pmf_1ah_m80h(dev) &&
+			    message == GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR) {
+				dev->dram_addr.hi = amd_pmf_reg_read(dev,
+								     dev->smu_regs->arg_reg[1]);
+				dev->dram_addr.size = amd_pmf_reg_read(dev,
+								       dev->smu_regs->arg_reg[2]);
+			}
 		}
 		break;
 	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
@@ -518,6 +537,12 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (is_amd_pmf_1ah_m80h(dev)) {
+		err = amd_pmf_get_tbl_dram_addr(dev);
+		if (err)
+			return err;
+	}
+
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_dbgfs_register(dev);
diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index 5a8ebacbc3b3..4cb45a8bbdb4 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -17,6 +17,8 @@
 #include <linux/device/devres.h>
 #include <linux/io.h>
 #include <linux/ktime.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
 #include <linux/string.h>
 #include <linux/workqueue.h>
 
@@ -24,6 +26,89 @@
 
 static struct device *pmf_device;
 
+static u16 amd_pmf_q10_acc_to_mW(u64 avg_acc)
+{
+	u64 val = DIV_ROUND_CLOSEST_ULL(avg_acc, 1024) * 1000;
+
+	return min_t(u16, val, U16_MAX);
+}
+
+static u16 amd_pmf_q10_acc_to_int(u64 avg_acc)
+{
+	u64 val = DIV_ROUND_CLOSEST_ULL(avg_acc, 1024);
+
+	return min_t(u16, val, U16_MAX);
+}
+
+static u64 amd_pmf_avg_acc_metric(u32 curr_counter, u32 prev_counter,
+				  u64 curr_value, u64 prev_value)
+{
+	u32 counter_diff;
+	u64 val_diff;
+
+	/* Check for counter reset */
+	if (curr_counter <= prev_counter)
+		return 0;
+
+	counter_diff = curr_counter - prev_counter;
+
+	if (curr_value < prev_value)
+		return 0;
+
+	val_diff = curr_value - prev_value;
+
+	return DIV_ROUND_CLOSEST_ULL(val_diff, counter_diff);
+}
+
+int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev)
+{
+	int ret;
+
+	ret = amd_pmf_send_cmd(dev, GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR, GET_CMD,
+			       ARG_NONE, &dev->dram_addr.lo);
+	if (ret) {
+		dev_err(dev->dev, "Failed to get DRAM address: %d\n", ret);
+		return ret;
+	}
+
+	dev->metrics_table_phys = ((u64)dev->dram_addr.hi << 32) | dev->dram_addr.lo;
+	dev->mtable_size = dev->dram_addr.size;
+
+	if (dev->mtable_size != sizeof(dev->mtable_v3)) {
+		dev_err(dev->dev, "Metrics table size mismatch: got %u, expected %zu\n",
+			dev->dram_addr.size, sizeof(dev->mtable_v3));
+		return -EINVAL;
+	}
+
+	dev->metrics_table_virt = devm_ioremap(dev->dev, dev->metrics_table_phys, dev->mtable_size);
+	if (!dev->metrics_table_virt) {
+		dev_err(dev->dev, "Failed to map DRAM address for PMF metrics table\n");
+		dev->metrics_table_phys = 0;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int amd_pmf_get_metrics_table_log_sample(struct amd_pmf_dev *dev)
+{
+	int ret;
+
+	if (!dev->metrics_table_virt) {
+		dev_err(dev->dev, "Metrics DRAM not mapped\n");
+		return -EINVAL;
+	}
+
+	/* Send command to PMFW to update metrics table log sample */
+	ret = amd_pmf_send_cmd(dev, GET_1AH_M80H_METRICS_TABLE_LOG_SAMPLE, SET_CMD, ARG_NONE, NULL);
+	if (ret) {
+		dev_err(dev->dev, "Failed to request metrics log sample: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void amd_pmf_get_metrics(struct work_struct *work)
 {
 	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
@@ -119,12 +204,46 @@ static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
 	switch (pdev->cpu_id) {
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
 		return 0;
 	default:
 		return -EOPNOTSUPP;
 	}
 }
 
+static void amd_pmf_calculate_acc_npu_metrics(struct amd_pmf_dev *dev,
+					      struct amd_pmf_npu_metrics *data)
+{
+	struct amd_pmf_metrics_iod *curr, *prev;
+	u64 val;
+	int i;
+
+	curr = &dev->mtable_v3.iod;
+	prev = &dev->prev_metrics.iod;
+
+	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
+				     curr->npu_temp_acc, prev->npu_temp_acc);
+	data->npu_temp = amd_pmf_q10_acc_to_int(val);
+	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
+				     curr->npu_power_acc, prev->npu_power_acc);
+	data->npu_power = amd_pmf_q10_acc_to_mW(val);
+	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
+				     curr->npuhclk_freq_eff_acc,
+				     prev->npuhclk_freq_eff_acc);
+	data->mpnpuclk_freq = amd_pmf_q10_acc_to_int(val);
+	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
+				     curr->aieclk_freq_eff_acc,
+				     prev->aieclk_freq_eff_acc);
+	data->npuclk_freq = amd_pmf_q10_acc_to_int(val);
+
+	for (i = 0; i < ARRAY_SIZE(curr->npu_busy_acc); i++) {
+		val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
+					     curr->npu_busy_acc[i],
+					     prev->npu_busy_acc[i]);
+		data->npu_busy[i] = amd_pmf_q10_acc_to_int(val);
+	}
+}
+
 static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
 {
 	int ret, i;
@@ -135,6 +254,8 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
 	if (ret)
 		return ret;
 
+	memset(data, 0, sizeof(*data));
+
 	switch (dev->cpu_id) {
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
@@ -161,6 +282,27 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
 		data->npu_reads = dev->m_table_v2.npu_reads;
 		data->npu_writes = dev->m_table_v2.npu_writes;
 		break;
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
+		ret = amd_pmf_get_metrics_table_log_sample(dev);
+		if (ret)
+			return ret;
+
+		memcpy_fromio(&dev->mtable_v3, dev->metrics_table_virt, sizeof(dev->mtable_v3));
+
+		/*Ignore the first sample, as previous metrics is uninitialized (zero)
+		 * Metrics are calculated as:
+		 *	metrics = current_metrics - previous_metrics
+		 * Skipping the initial sample ensures accurate delta calculations.
+		 */
+		if (!dev->npu_metrics_have_prev) {
+			memcpy(&dev->prev_metrics, &dev->mtable_v3, sizeof(dev->mtable_v3));
+			dev->npu_metrics_have_prev = true;
+			return 0;
+		}
+
+		amd_pmf_calculate_acc_npu_metrics(dev, data);
+		memcpy(&dev->prev_metrics, &dev->mtable_v3, sizeof(dev->mtable_v3));
+		break;
 	}
 
 	return 0;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 4873685c84ad..76cfeb2b963c 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -75,6 +75,10 @@ struct cookie_header {
 #define SET_PMF_PPT            0x25
 #define SET_PMF_PPT_APU_ONLY   0x26
 
+/* Message IDs for 1AH_M80H platform */
+#define GET_1AH_M80H_METRICS_TABLE_LOG_SAMPLE	0x0E
+#define GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR	0x0F
+
 /* OS slider update notification */
 #define DC_BEST_PERF		0
 #define DC_BETTER_PERF		1
@@ -139,6 +143,11 @@ struct cookie_header {
 
 extern int metrics_table_loop_ms;
 
+#define AMD_PMF_METRIC_CORE_TYPE_MAX	4
+#define AMD_PMF_METRIC_CCX_MAX		4
+#define AMD_PMF_NUM_CLK_DPM_LEVELS	8
+#define AMD_PMF_NUM_MAX_CORES		12
+
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
 static const uuid_t amd_pmf_ta_uuid[] __used = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8,
@@ -250,6 +259,199 @@ struct apmf_fan_idx {
 	u32 fan_ctl_idx;
 } __packed;
 
+struct amd_pmf_metrics_iod {
+	u32 counter_acc;
+	/* Set Voltage */
+	u64 vddcr_set_voltage;
+	u64 vddcr_soc_set_voltage;
+	u64 vddcr_npu_set_voltage;
+	u64 vddcr_lp_set_voltage;
+	u64 vddcr_gfx_set_voltage;
+	u64 vdd_misc_set_voltage;
+	/* Telemetry Voltages */
+	u64 vddcr_telemetry_voltage;
+	u64 vddcr_soc_telemetry_voltage;
+	u64 vddcr_npu_telemetry_voltage;
+	u64 vddcr_lp_telemetry_voltage;
+	u64 vddcr_gfx_telemetry_voltage;
+	u64 vdd_misc_telemetry_voltage;
+	/* Telemetry Powers */
+	u64 vddcr_telemetry_power;
+	u64 vddcr_soc_telemetry_power;
+	u64 vddcr_npu_telemetry_power;
+	u64 vddcr_lp_telemetry_power;
+	u64 vddcr_gfx_telemetry_power;
+	u64 vdd_misc_telemetry_power;
+	/* Throttlers - Fast PPT */
+	u32 fppt_fused_limit;
+	u32 fppt_max_irm_limit;
+	u32 fppt_max_pbo_limit;
+	u32 fppt_limit;
+	u64 fppt_value_acc;
+	u32 fppt_residency_acc;
+	/* Throttlers - Slow PPT */
+	u32 sppt_fused_limit;
+	u32 sppt_max_irm_limit;
+	u32 sppt_max_pbo_limit;
+	u32 sppt_limit;
+	u64 sppt_value_acc;
+	u32 sppt_residency_acc;
+	/* Throttlers - STAPM */
+	u32 spl_fused_limit;
+	u32 spl_max_irm_limit;
+	u32 spl_max_pbo_limit;
+	u32 spl_limit;
+	u64 spl_value_acc;
+	u32 spl_residency_acc;
+	/* Throttlers - TDC VDDCR */
+	u32 tdc_vddcr_fused_limit;
+	u32 tdc_vddcr_max_irm_limit;
+	u32 tdc_vddcr_max_pbo_limit;
+	u32 tdc_vddcr_limit;
+	u64 tdc_vddcr_value_acc;
+	u32 tdc_vddcr_residency_acc;
+	/* Throttlers - TDC VDDCR_SOC */
+	u32 tdc_vddcr_soc_fused_limit;
+	u32 tdc_vddcr_soc_max_irm_limit;
+	u32 tdc_vddcr_soc_max_pbo_limit;
+	u32 tdc_vddcr_soc_limit;
+	u64 tdc_vddcr_soc_value_acc;
+	u32 tdc_vddcr_soc_residency_acc;
+	/* Throttlers - TDC VDDCR_NPU */
+	u32 tdc_vddcr_npu_fused_limit;
+	u32 tdc_vddcr_npu_max_irm_limit;
+	u32 tdc_vddcr_npu_max_pbo_limit;
+	u32 tdc_vddcr_npu_limit;
+	u64 tdc_vddcr_npu_value_acc;
+	u32 tdc_vddcr_npu_residency_acc;
+	/* Throttlers - TDC VDDCR_LP */
+	u32 tdc_vddcr_lp_fused_limit;
+	u32 tdc_vddcr_lp_max_irm_limit;
+	u32 tdc_vddcr_lp_max_pbo_limit;
+	u32 tdc_vddcr_lp_limit;
+	u64 tdc_vddcr_lp_value_acc;
+	u32 tdc_vddcr_lp_residency_acc;
+	/* Throttlers - TDC VDDCR_GFX */
+	u32 tdc_vddcr_gfx_fused_limit;
+	u32 tdc_vddcr_gfx_max_irm_limit;
+	u32 tdc_vddcr_gfx_max_pbo_limit;
+	u32 tdc_vddcr_gfx_limit;
+	u64 tdc_vddcr_gfx_value_acc;
+	u32 tdc_vddcr_gfx_residency_acc;
+	/* Throttlers - EDC VDDCR */
+	u32 edc_vddcr_fused_limit;
+	u32 edc_vddcr_max_irm_limit;
+	u32 edc_vddcr_max_pbo_limit;
+	u32 edc_vddcr_limit;
+	/* Throttlers - Thermal */
+	u32 thm_fused_limit;
+	u32 thm_limit;
+	u64 thm_value_acc;
+	u32 thm_residency_acc;
+	u32 prochot_residency_acc;
+	u64 gfx_temp_acc;
+	u64 soc_temp_acc;
+	u32 p3t_fused_limit;
+	u64 p3t_value_acc;
+	/* Power */
+	u64 system_power_acc;
+	u64 apu_power_acc;
+	u64 dgpu_power_acc;
+	u64 npu_power_acc;
+	/* Frequencies */
+	u64 fclk_freq_eff_acc;
+	u64 memclk_freq_eff_acc;
+	u64 lclk_freq_eff_acc;
+	u64 gfxclk_freq_eff_acc;
+	u64 socclk_freq_eff_acc;
+	u64 vclk_freq_eff_acc;
+	u64 vpeclk_freq_eff_acc;
+	u64 aieclk_freq_eff_acc;
+	u64 npuhclk_freq_eff_acc;
+	/* Bandwidth */
+	u64 dram_read_bandwidth;
+	u64 dram_write_bandwidth;
+	/* Activity Monitors */
+	u64 gfx_busy_acc;
+	u64 vcn_busy_acc;
+	u64 npu_busy_acc[3];
+	/* STT Limits */
+	u32 stt_min_limit;
+	u64 stt_apu_hotspot_temp_acc;
+	u64 stt_hs2_hotspot_temp_acc;
+	u32 stt_apu_temp_limit;
+	u64 stt_apu_skin_temp_acc;
+	/* Residencies */
+	u64 cpuoff_residency_ccx0;
+	u64 cpuoff_residency_ccx1;
+	u64 cpuoff_residency_ccx2;
+	u64 cpuoff_residency_ccx3;
+	/* DF-pstates */
+	u32 fclk_freq_table[AMD_PMF_NUM_CLK_DPM_LEVELS];
+	u32 uclk_freq_table[AMD_PMF_NUM_CLK_DPM_LEVELS];
+	u32 ddr_rate_table[AMD_PMF_NUM_CLK_DPM_LEVELS];
+	u8 dfpstate_source[AMD_PMF_NUM_CLK_DPM_LEVELS];
+	/* System */
+	u8 gfx_disabled;
+	u8 spare2[3];
+	u32 gfxclk_fmax;
+	u8 cclk_core_fuse_enable[AMD_PMF_METRIC_CORE_TYPE_MAX][AMD_PMF_NUM_MAX_CORES];
+	u8 cclk_core_enabled[AMD_PMF_METRIC_CORE_TYPE_MAX][AMD_PMF_NUM_MAX_CORES];
+	u32 cclk_fmax[AMD_PMF_METRIC_CORE_TYPE_MAX][AMD_PMF_NUM_MAX_CORES];
+	/* Overclock Capable */
+	u8 cpu_precise_and_direct_oc_capable;
+	u8 gfx_precise_and_direct_oc_capable;
+	u8 pbo_basic_oc_capable;
+	u8 pbo_advanced_oc_capable;
+	u8 pbo_nitro_oc_capable;
+	u8 memory_and_fabric_oc_capable;
+	u8 misc_oc_capable;
+	u8 extreme_cold_oc_capable;
+	u8 down_config_control_capable;
+	u8 spare0[3];
+	/* Overclock Status */
+	u32 fit_limit_scalar;
+	u8 ln2_enabled;
+	u8 cpu_precise_and_direct_oc_enabled;
+	u8 gfx_precise_and_direct_oc_enabled;
+	u8 spare1[2];
+	/* Voltage Guardband in PSM count */
+	s8 psm_guardband[5][5][3];
+	s32 core_power_limit_offset;
+	u32 max_freq_offset[5];
+	u64 npu_temp_acc;
+	u64 dfpstate_residency_acc[AMD_PMF_NUM_CLK_DPM_LEVELS];
+	u32 cclk_fboost;
+	/* PMF */
+	u32 pmf_fast_apu_ppt_limit;
+	u64 pmf_fast_apu_ppt_value_acc;
+	u32 pmf_fast_apu_ppt_residency_acc;
+	u32 pmf_slow_apu_ppt_limit;
+	u64 pmf_slow_apu_ppt_value_acc;
+	u32 pmf_slow_apu_ppt_residency_acc;
+	u32 pmf_fast_spm_limit;
+	u64 pmf_fast_spm_value_acc;
+	u32 pmf_fast_spm_residency_acc;
+	u32 pmf_slow_spm_limit;
+	u64 pmf_slow_spm_value_acc;
+	u32 pmf_slow_spm_residency_acc;
+	u32 spare3[5];
+} __packed __aligned(4);
+
+struct amd_pmf_metrics_ccx {
+	u64 core_c0[AMD_PMF_NUM_MAX_CORES];
+	u64 core_cc6[AMD_PMF_NUM_MAX_CORES];
+	u64 core_freq[AMD_PMF_NUM_MAX_CORES];
+	u64 core_freqeff[AMD_PMF_NUM_MAX_CORES];
+	u64 core_temp[AMD_PMF_NUM_MAX_CORES];
+	u64 core_power[AMD_PMF_NUM_MAX_CORES];
+} __packed __aligned(4);
+
+struct amd_pmf_metrics_v3 {
+	struct amd_pmf_metrics_iod iod;
+	struct amd_pmf_metrics_ccx ccx[AMD_PMF_METRIC_CCX_MAX];
+} __packed __aligned(4);
+
 struct smu_pmf_metrics_v2 {
 	u16 core_frequency[16];		/* MHz */
 	u16 core_power[16];		/* mW */
@@ -406,6 +608,12 @@ struct amd_pmf_smu_regs {
 	u32 arg_reg[3];
 };
 
+struct amd_pmf_1ah_m80h_arg_data {
+	u32 lo;
+	u32 hi;
+	u32 size;
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -459,6 +667,12 @@ struct amd_pmf_dev {
 	struct mutex metrics_mutex;
 	u32 bios_output[BIOS_OUTPUT_MAX];
 	const struct amd_pmf_smu_regs *smu_regs;
+	void __iomem *metrics_table_virt;	/* Mapped DRAM virtual address for metrics table */
+	phys_addr_t metrics_table_phys;		/* DRAM physical address for metrics table */
+	struct amd_pmf_metrics_v3 mtable_v3;	/* IOD and CCX */
+	struct amd_pmf_1ah_m80h_arg_data dram_addr;
+	struct amd_pmf_metrics_v3 prev_metrics;	/* Previous metrics for delta calculation */
+	bool npu_metrics_have_prev;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -867,6 +1081,10 @@ int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
 u32 fixp_q88_fromint(u32 val);
 int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
 void amd_pmf_set_device(struct device *p_device);
+bool is_amd_pmf_1ah_m80h(struct amd_pmf_dev *pdev);
+
+/* Metrics layer */
+int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index e014d4ce5a20..b84c200b0f8e 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -60,6 +60,7 @@ struct amd_sfh_info {
  * @mpnpuclk_freq: MPNPU [MHz]
  * @npu_reads: NPU read bandwidth [MB/sec]
  * @npu_writes: NPU write bandwidth [MB/sec]
+ * @npu_temp: NPU temperature [C]
  */
 struct amd_pmf_npu_metrics {
 	u16 npuclk_freq;
@@ -68,6 +69,7 @@ struct amd_pmf_npu_metrics {
 	u16 mpnpuclk_freq;
 	u16 npu_reads;
 	u16 npu_writes;
+	u16 npu_temp;
 };
 
 int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
-- 
2.34.1

