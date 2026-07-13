Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94873537CD
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968025; cv=fail; b=AlCyBsesMKWgcXU3RZ05ZW73AS6taa+cs6AaOdWQIyDXn4mUOFTwg7/85G+NOl6GGGS6/Vg5PmnR0RM8mRUz2OjRXRaltBqv5Z820fTG92hSsbgZjE0vySy6KOuVvgbztRbcUiGMtHXmT7759OIJ+prIeJas/iSdUmhAQVEdMPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968025; c=relaxed/simple;
	bh=rbCpTqr22kEVJf13NpdW00UexL/ImWn+HbT27mjF9CQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnX+qSP1nlgzi3WkWgB2rfLr6151Rm2e8CWyT/vNawc7AUpzJwRpe+N3HmsqhmKqdkuax/3bu6X332nYmMhYoFqYJNh1/NYCzqKNGsKbE7i+k8nUDZxoR/SnQly+FfKuVjDyZLzhceftHyC0kw289EqYN6ekCxZM4IVHQwQcca0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z5CZIgkH; arc=fail smtp.client-ip=52.101.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z5CZIgkH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlZ4U7NdCK2BejKTg8k0spUnQLds3IVgkNr3ZbXauXPxKRtwlyTx4wMjlw2qtX0qNDp1ZjeaZ4iYN+3CEzrEhMdNOT8R/gre2T82aPn7nb9PU+VuW8+cvQoza2mnysB55fXNG+bm8sQ6gKuXMaROTXTf0xMLT4hR4eBe4Fl6qislPkajO8f6tWHYFvwFrRV2AwwGudu7IK+mlyLgA1bC/Tx4kZREh8KHh+5hl4XYpEH0fa0FDdDpjhJeCrUhndDcl8uoPkUgycP3/Xcy+VObV7X10KyVZdkM9qzhQeuW9x24J9nolAx3qFOkMhUrvPqMzz0fMjKVaeYrJoM2E5GfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4almNcYfxa2Ntzsm8Bm+HnxVv3fAGBRScdBWvLmHOI=;
 b=I+ykRysE5l+GuCF9+LkjQ7obkIcM+8akXMvRhPY5jZYKL64oyB35ZcN2OOVecft/NDD2E8SJOjxOJtRCtHBbYaPEMuLf1GduRqp9+HQGsNw9d917vIQitlW0XWOJL2ExiM/+7ULGRVefNmWJp2M/fDsSbQAHk9YU8sCdb2aoqUv207yQ6zU5rNfCXVys4TMIfvQgIFfNzjqyliegP4fYhqzIrlFfuO2YlX8fS9Kjs8fUboSFtXH2CqPu1ewVDnTY6Yy9dQBN0Apn60GudVbbJSc9L2XQ3k0fSdotDWFV2IrDTOFcccbGkzhjwmBgBCCijYCFiJT9/vT0eKnd6rmOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4almNcYfxa2Ntzsm8Bm+HnxVv3fAGBRScdBWvLmHOI=;
 b=Z5CZIgkHGml5gr5/C5OSt69kvSeT7uFtvN4IgTbF9INROas/8aicW3G4t/u7eL70h45VvJOiO+CYBjJ6Swb9CjEK6T8qlvsFa0Mpw5mwlEf9TZm8yIf8Jpq8kVHmFt9eKSww/XK21SrcXT2X/s+ran9K42EvfpspV0Kg1wADnsc=
Received: from SJ0PR13CA0021.namprd13.prod.outlook.com (2603:10b6:a03:2c0::26)
 by CH1PPFD8936FA16.namprd12.prod.outlook.com (2603:10b6:61f:fc00::624) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 18:40:15 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::1) by SJ0PR13CA0021.outlook.office365.com
 (2603:10b6:a03:2c0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Mon, 13
 Jul 2026 18:40:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 18:40:14 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 13:40:12 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 6/6] platform/x86/amd/pmf: Add 1AH_M80H metrics table and NPU metrics support
Date: Tue, 14 Jul 2026 00:09:36 +0530
Message-ID: <20260713183936.690228-7-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CH1PPFD8936FA16:EE_
X-MS-Office365-Filtering-Correlation-Id: 771fb372-07c9-4a0a-ece3-08dee10e2dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|3023799007|22082099003|18002099003|56012099006|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	fVkurUgP2UuuWf3GSMSdt3sfPUOTVMI7BDO04RiVPj+QThqmb/Smjfb/aPGDrgqPW0pKCXCYT/Trr6wxx8pC4IPNx/o57PK2rdhqE/neRoZYiwSQ26AlN+D184sezRAddDjd6O/o8ihiK0NAalaIFFdwRJkUoyfX76uFCZvO+jXd3iqPNKP/whbS9smIvecKdw6bZBH5sv3nNtYwSorOIUf76NHNY9b6b/7VI0z0RSd39dcbNNdp2jO38pH1Bqej1uVSwplRlxeO5W2uiimRNyr5fQ0VizwUA1JAOeYbWEFtu3rN4KTS2l3zqz1yfWKLXB+NPZdDn4lVFELMnmrqfoaUP3FYLeAvqwqvvXm5Nc5mOcEMwX16xZlKJ0LaVV1OzwU2dIUIaAJ10RzDKPpSKqJFURnmxP6ooYeuLrhFObHxfUWGg98HZRYxpFOlsFzOY92XwSl7vKHdGAHlybRTJyX0vHEBLqGs1YBnq6Zsx6/qKlw7OZY3QV2OGOpJAB031fjeVzpO6hsDX2mBxmbOcSbDSL8Jvr4nKCigMVEFS0OPyyFi7ya3nId7KVkORAAUJNReTucTF+p1Ob0xkeIXD5FyzQOq4lNFkh9We2PcRADKX/Hu1P6ee46vDaDr3fexIscKS8+HQbknZMaMzGi2bnO/D4Fjj9sU5qLMuZ+25xQ1AFdidtAHpqg+GZXordzuNK0KDdZfWg7D27uOCgslow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(3023799007)(22082099003)(18002099003)(56012099006)(6133799003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f+TtW+eDIekt8Z614ciWSHZVAwpzsXuz4ZY7n0ZpqT48VewGv7TCsm3M9bbJAjpVshRHJx3USIaCsQ6+szKZvtWi3RgKg7eZmg9QN7c3r+aLNBVr7DCvLk99XyyJRGmKLziFpZJCuMN2J4Qklk03hNEmmMxSAPlO18d4r3tQ/H+JWZt7XWs16ERZwIlhBwpyT1ki9KvI9bYGJi5ZjOqhUBhKJP0MCT1KwD9Malm+l27xkcyJseVhf4+vFaCM01HGGU4YqUWLPhQUSWqhwsogPM09tqaSXiLksUVMEvvl7TB8M2/HQiP/BFVOi+C5FOaiiiXlDrLDAOaw7oQtnzL5e8NJRbyKuYdNs4dgtUV6QRYQKgY4EBAbtH9ziUMxrYu9izP1rggFcE7YqqbQ+vtgST9QAYiDcPEs4yzk6gPXm79EwPq8DjPJeZS0UZ0wg80S
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:40:14.6238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 771fb372-07c9-4a0a-ece3-08dee10e2dca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFD8936FA16

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

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c    |  29 ++++
 drivers/platform/x86/amd/pmf/metrics.c | 144 ++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h     | 217 +++++++++++++++++++++++++
 include/linux/amd-pmf-io.h             |   2 +
 4 files changed, 392 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 600992f0e2c7..303cf3c45712 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -68,6 +68,16 @@ static bool smart_pc_support = true;
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
@@ -155,6 +165,12 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
 
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
@@ -214,6 +230,13 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
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
@@ -517,6 +540,12 @@ static int amd_pmf_probe(struct platform_device *pdev)
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
index c4f5f4d36bd6..ceff4f139043 100644
--- a/drivers/platform/x86/amd/pmf/metrics.c
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -16,8 +16,12 @@
 #include <linux/device/devres.h>
 #include <linux/io.h>
 #include <linux/ktime.h>
+#include <linux/limits.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/units.h>
 #include <linux/wordpart.h>
 #include <linux/workqueue.h>
 
@@ -25,6 +29,89 @@
 
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
@@ -120,12 +207,46 @@ static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
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
@@ -136,6 +257,8 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
 	if (ret)
 		return ret;
 
+	memset(data, 0, sizeof(*data));
+
 	switch (dev->cpu_id) {
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
@@ -162,6 +285,27 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
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
index 4873685c84ad..0f8e6cc9a453 100644
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
 
+struct amd_pmf_arg_data {
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
+	struct amd_pmf_arg_data dram_addr;
+	struct amd_pmf_metrics_v3 prev_metrics;	/* Previous metrics for delta calculation */
+	bool npu_metrics_have_prev;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -868,6 +1082,9 @@ u32 fixp_q88_fromint(u32 val);
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

