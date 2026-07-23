Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09170432300
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805391; cv=fail; b=DeJFxgOV5MzCIwhfLlY/vWvwkrYQHFXPTfekTXakIc7pLBUeOboChD6eOrjrzplzJUcauYsTnzKLIdSqDJYpn0c7URVXY0ULIqiNbRWs1JjpISPvLr2pbzbjEzWopONH2nsy5HeXYFU4EEkpp9HOlpUk/KWO0ij1IaJI71Kfuf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805391; c=relaxed/simple;
	bh=mPEqgn2xjNjuT5BZuAc6dLRNKASFw3YtcFRM77E8JII=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rKqgpAIe84SzUP1bocxgmncBbIeNCKBBICFyAxU3anknpzNCh1X3UyZ6npeOv4LvT1dbxj0M4/sL5dVegSTlWTOuQHMNdM+PeA61AgvTxAyhh5yg88fv6/NnK4XyucJIwhhuixQ15XHwLjJX92LIbFQxm3Th81T7QYxw//ROp/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FHb3AgbQ; arc=fail smtp.client-ip=52.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FHb3AgbQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=au9hNPjYL/6egRvCwDIDaTUM4f3jsteEi2wD8Y4vVDwOyzL6BXlSa9xa8FTzGTkFD0S3COGHNxG2AK+h6/6PM7AoSM9XsND3Q+Q9RSlzYmbFfAXDsek3qBP4BtHOs7nc2aPTNjai7SDyS2Laqf3bwe2ZssSBlPof2qpVWMdZSJHr7r19QRWEjYan1LpQA1NjxmLD7FnQY0n1ljNJKITbfxRJSJSWc8hpyJiFl81zsknBgUlJo8z6ru36UOwSj4XybybPuaxpThu8sGHVx6WP3m+s/wcjcIViddH8IDGDFF70APEtzw/GDs3LOZn4qYgLpEBlnJG9UJFmn1zXTZKynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNktZPn1nlbUV4Y408qGdkjVdx1+L+z4oiInBJKbOtg=;
 b=vixsJMGYhCUpxxC/FZaPnwDh92US3cMkmEu7E4X8gv6tDrnmZkA77D/FCNFmnFwLIotmHALRp2L9xBDgaV20on+bVY5T1bQ5ktTxhDXdX6cKjd+KpnFi2dL53LDXAZhnUTeKTZb2D5yPhBXJUnIAYRR75QoOXjr+OizYKj5BlE6xoGbW8uNSn5OjCA/veDwQ5PLjv0IgPJCq2v73lhqSI7YnFod702WXyxTk9bANULfoaYwFW7LjHHyGPByx3yyMYAj8oXuDU4McG58mtySEYUXxIt8B/XfYoHsC/PrDszfzo2qfC2zvB8V6ouOURyxlfgB5ozoogINXHnEygdu/Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNktZPn1nlbUV4Y408qGdkjVdx1+L+z4oiInBJKbOtg=;
 b=FHb3AgbQueR6oNkXmc4b2Qfbz1Wmnj38ZdjtyK82xA6sLLVcWKKyjuRwC2pu3nuQDxtj7NxDcWebVo20dUv6lv3y2qbFX5T3iYd1puoosnOinK5KRu8FK+HBdt8m2MrRb8qhJMs6EDrjnHaoFECV6AUeB0BvgHG8zC4rRDs02v8=
Received: from BY3PR03CA0002.namprd03.prod.outlook.com (2603:10b6:a03:39a::7)
 by BL1PR12MB5778.namprd12.prod.outlook.com (2603:10b6:208:391::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Thu, 23 Jul
 2026 11:16:20 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::a3) by BY3PR03CA0002.outlook.office365.com
 (2603:10b6:a03:39a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 11:16:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 11:16:20 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 06:16:17 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 7/7] platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics support
Date: Thu, 23 Jul 2026 16:45:34 +0530
Message-ID: <20260723111534.1940925-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
References: <20260723111534.1940925-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|BL1PR12MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a637c4f-b345-454b-6d7c-08dee8abd28b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|22082099003|18002099003|3023799007|56012099006|10067099003|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	JYdUeZWQS8DfP5+So5YL9NmX5ME8cNN73t6XrUGWgROf3y1yyObxFAfrQ40z3u1zshANagGebw6Mpx1qlDBsCXOB/5ec5/mdXYFDnTxpyVU6z2qX4Du5HD4BJWxh9kRfSkjw59GK6GvyPj78nHzqGYUzAHkK1uuRPMNxqV8eO1bCZoKjw58p2ufq6LY6ekDVW/pdvLKLnHYsU3ArM/1U+ZlbDBl3qYTq7ecZhkpkUIqQ8wm9afU7Dv6r/Ld01CZZ5bheQx4XcMVhBxEg/wEB/ZK1Y+jmpsy3r4xoXKe6A8F3MqU4L0yXna3ItDbO1/FBmzfrTCMsDheLY0m3ACCJ/UcJ1X+l9M9lVX1bQyryKEQs+Z37yDDRL0f3BTuDUWiIAP6Ja8tOZhGU6p8b5hTchGlEdnsEm9Ek1Sh2DZWjTRKdDhMwY8nzl/OuwkmTdhArQJgWgvhssPq4UQ7kYNEMH7X/+U5j4m9QFAbSosgRpyXiB+XbMdFJDhaIkw1FGidpc+L/sojVHzWkgZSA91/EYG2cl8VAVbuytG360uRw4wrLZRIBKYDVf1YiWMuy/EyaI9x7bf8UD6t7yK9Z4kqsvlmMl1DEv9cGi9WqaG/FzW6a0ne+OQoGanIaS2ZLBCpiu58TuVx4ppI5HYE0aqUvZO3UCHX+rw0W0QTzVikeQa3db4Qo9QxNMZOglItBGv4SQvxN7tHKTphHXpV7NfobCA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G6XWJkXVYpMREC4JlFfprZD0mHfMFa9CeIZEf4xOFdFY0guiP+k8rzj6IgyZnB1zGxmL3Njc2cR8mi3bWtQcM+fuKr3ey+Dnv4/Q5FA7AbBwMVTMJ7V4qlfJAmnJ3H01OK1DVQ0bTJuqFsDLczeuLjynTzL8UHs1p1ekFrkgVqKCcUPjo6DfKuZsf2nuA0CFGZhVMH+t7covQvxsU1vlU8NMrttri/TK0W75PKxGeFL1xg5ohb4rnO8n6hcTZ+TjoTv4qPOVRDBI08VwYEdtOw4VRMdaTSqO19p+9gPQef6dBnjFOfGEp0af+RpP6/TNC4CGlH6MZYjMpjTAFK+wi2+AocfN//qX5o6N6EqXSuFQuL5tZYSgGK2Wrlcu4zm9muN/eYqvbbvUyqpSZjMBgSClVolJdFWgrfI3p0pqyV5gP+7bJw9/7WpKNophUZHy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:16:20.1324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a637c4f-b345-454b-6d7c-08dee8abd28b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5778

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
 - Introduce amd_pmf_supports_accumulator_metrics() to check the
   accumulator based metrics support.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c    |  30 ++++
 drivers/platform/x86/amd/pmf/metrics.c | 146 +++++++++++++++-
 drivers/platform/x86/amd/pmf/pmf.h     | 220 +++++++++++++++++++++++++
 include/linux/amd-pmf-io.h             |   2 +
 4 files changed, 397 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index f557d55b51f2..b4eae65e675b 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -11,6 +11,7 @@
 #include <linux/array_size.h>
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
+#include <linux/dev_printk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -67,6 +68,16 @@ static bool smart_pc_support = true;
 module_param(smart_pc_support, bool, 0444);
 MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
 
+static bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev)
+{
+	switch (pdev->cpu_id) {
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
@@ -154,6 +165,12 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
 
 	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
 	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
+	if (amd_pmf_supports_accumulator_metrics(dev)) {
+		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[1]);
+		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT1:%d\n", value);
+		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[2]);
+		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT2:%d\n", value);
+	}
 
 	value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
 	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
@@ -213,6 +230,13 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
 			/* PMFW may take longer time to return back the data */
 			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
 			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
+			if (amd_pmf_supports_accumulator_metrics(dev) &&
+			    message == GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR) {
+				dev->dram_addr.hi = amd_pmf_reg_read(dev,
+								     dev->smu_regs->arg_reg[1]);
+				dev->dram_addr.size = amd_pmf_reg_read(dev,
+								       dev->smu_regs->arg_reg[2]);
+			}
 		}
 		break;
 	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
@@ -516,6 +540,12 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (amd_pmf_supports_accumulator_metrics(dev)) {
+		err = amd_pmf_get_tbl_dram_addr(dev);
+		if (err)
+			return err;
+	}
+
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_dbgfs_register(dev);
diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
index 5635b1a01827..5c0e368ec8df 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -16,8 +16,11 @@
 #include <linux/device/devres.h>
 #include <linux/io.h>
 #include <linux/ktime.h>
+#include <linux/limits.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
 #include <linux/string.h>
-#include <linux/types.h>
+#include <linux/units.h>
 #include <linux/wordpart.h>
 #include <linux/workqueue.h>
 
@@ -25,6 +28,89 @@
 
 static struct device *pmf_device;
 
+static u16 amd_pmf_q10_acc_to_mW(u64 avg_acc)
+{
+	u64 val = DIV_U64_ROUND_CLOSEST(avg_acc, 1024) * MILLIWATT_PER_WATT;
+
+	return min_t(u16, val, U16_MAX);
+}
+
+static u16 amd_pmf_q10_acc_to_int(u64 avg_acc)
+{
+	u64 val = DIV_U64_ROUND_CLOSEST(avg_acc, 1024);
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
+	return DIV_U64_ROUND_CLOSEST(val_diff, counter_diff);
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
@@ -120,12 +206,46 @@ static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
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
@@ -136,6 +256,8 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
 	if (ret)
 		return ret;
 
+	memset(data, 0, sizeof(*data));
+
 	switch (dev->cpu_id) {
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
@@ -162,6 +284,28 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
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
+		/*
+		 * Ignore the first sample, as previous metrics is uninitialized (zero)
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
index 4873685c84ad..07ec00684233 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -14,10 +14,13 @@
 #include <linux/acpi.h>
 #include <linux/amd-pmf-io.h>
 #include <linux/circ_buf.h>
+#include <linux/compiler_attributes.h>
+#include <linux/compiler_types.h>
 #include <linux/input.h>
 #include <linux/mutex_types.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
+#include <linux/types.h>
 
 #define POLICY_BUF_MAX_SZ		0x4b000
 #define POLICY_SIGN_COOKIE		0x31535024
@@ -75,6 +78,10 @@ struct cookie_header {
 #define SET_PMF_PPT            0x25
 #define SET_PMF_PPT_APU_ONLY   0x26
 
+/* Message IDs for 1AH_M80H platform */
+#define GET_1AH_M80H_METRICS_TABLE_LOG_SAMPLE	0x0E
+#define GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR	0x0F
+
 /* OS slider update notification */
 #define DC_BEST_PERF		0
 #define DC_BETTER_PERF		1
@@ -139,6 +146,11 @@ struct cookie_header {
 
 extern int metrics_table_loop_ms;
 
+#define AMD_PMF_METRIC_CORE_TYPE_MAX	4
+#define AMD_PMF_METRIC_CCX_MAX		4
+#define AMD_PMF_NUM_CLK_DPM_LEVELS	8
+#define AMD_PMF_NUM_MAX_CORES		12
+
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
 static const uuid_t amd_pmf_ta_uuid[] __used = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8,
@@ -250,6 +262,199 @@ struct apmf_fan_idx {
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
@@ -406,6 +611,12 @@ struct amd_pmf_smu_regs {
 	u32 arg_reg[3];
 };
 
+struct amd_pmf_arg_data {
+	u32 lo;
+	u32 hi;
+	u32 size;
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -459,6 +670,12 @@ struct amd_pmf_dev {
 	struct mutex metrics_mutex;
 	u32 bios_output[BIOS_OUTPUT_MAX];
 	const struct amd_pmf_smu_regs *smu_regs;
+	void __iomem *metrics_table_virt;	/* Mapped DRAM virtual address for metrics table */
+	phys_addr_t metrics_table_phys;		/* DRAM physical address for metrics table */
+	struct amd_pmf_metrics_v3 mtable_v3;	/* IOD and CCX */
+	struct amd_pmf_arg_data dram_addr;
+	struct amd_pmf_metrics_v3 prev_metrics;	/* Previous metrics for delta calculation */
+	bool npu_metrics_have_prev;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -868,6 +1085,9 @@ u32 fixp_q88_fromint(u32 val);
 int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
 void amd_pmf_set_device(struct device *p_device);
 
+/* Metrics layer */
+int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev);
+
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
 void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
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

