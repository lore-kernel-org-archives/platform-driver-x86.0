Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18B046AF03
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 11:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805380; cv=fail; b=YT9jRP6iItTjdmw+8r1uC9tMsdLdAGH+/1Rj1tVeDbnWXJ2fTso7xHmdkNTu1oUMLG4/j+Dv3gNt67W0aB37ptmbDjafYpARn94MbmSMLSjrrM9gtzL+WukxmmEsvDL9dRbpO6TL4KS3k4CoMO++GQNi5OaduaNcMwSgHimbBKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805380; c=relaxed/simple;
	bh=s+g5QkL6KkYamMG+KL1+W/Jkp9ZZtFbFB7ji9bcnEg0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DXSXsrMASqilh0g81Gw2rckPNGrfQoyq0/xIk5h1Y5mrVY9FG4DoiqKkBVw9AHqGfIBBVhGff+ln7ZAXCq+Ia63G6o5mudBqXOy3Z7j9AX7bC6EGYi+KAGxypTnaxXvF6SgZlMurE0g9zc5NHk82SNjbjQRZHaYSDp4H5+Lf9Ic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x4PxxTAG; arc=fail smtp.client-ip=52.101.43.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x4PxxTAG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dO8jpwmDsoqQ9EQ731pNBFfiV9V5eJ4gYKP7lR7FPj0RPu7swNCXsbQpwZi5ulJe6mBj6FqvsSPw5yN7WaNTDj3mHZdh1YNHLlX1l7Iy8TvKUlYmf02YOPTS0q8oy9VpOQ778dFoFC1K/GIPlvheeF2nSsLBuVgGe1gYXLTx58cJOpnVtCHAsmGiVrTm18rGwUOKqcM77Xly6uPIVK+Q1tUwI9/ZT/XoSXVeiyqvcGtge6pMxzdCDqeMoUicU6+xIbdz1UsynlM+UOtkid2v6bjElnF8Ims8WZYeCkrvnTUOoU8oJZ9Gw52K0nAlzmYhzx6fNBvBkN2oR2kZvUTF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4Rd/I1JyfnAI/m8mHRkvHa0Z3prAkPhSAP6bFoKZV8=;
 b=hXEqloNUlRE67Esg8Z7xJOhLd6cAzNQeDTL76f5nZrmZjXkaCz/5zqClFS2tiQp6RpSMSXswN2URsjdjg9nbwnlwXPvcnMX+p47xABVopDKo+hfhN4rcaALUPSFQK+6MT7QB5j5R9sgKuIqx8GGFM2lNM6Eqel/Cv6w9NPCWWlVCMYzCUOUUN2dfuLz15pcQgaT3QlZOkWmN6KupVXA1ZZmdZOnxh7suRoXsEdr/O24KY+3Dk1yAbo7Sw3AfqonC8z+LS9zB28Wc09lggHQ6lAU8uqZx+59OjExkssSVS6cKm4fEEAHA7hRkIEd6PNZ6KHkdMmbMRyOgvQuGpI2TaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4Rd/I1JyfnAI/m8mHRkvHa0Z3prAkPhSAP6bFoKZV8=;
 b=x4PxxTAGboRefT/scM3myGc0xHaJruaU9I/hopWellAd7ilQo74lpO6wdI9/yCCxTqppB89uAq0fICcfiKRytbVTQ1H58pvKrmC37XR8EMmxOWfYiH2BoVYKSiMVp4BVN0RlgLirQ7ZUrxVQaN+F8H6J0IzQQT/nl17ryAF6/M4=
Received: from BY3PR10CA0028.namprd10.prod.outlook.com (2603:10b6:a03:255::33)
 by DM4PR12MB6472.namprd12.prod.outlook.com (2603:10b6:8:bc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Thu, 23 Jul 2026 11:16:11 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::81) by BY3PR10CA0028.outlook.office365.com
 (2603:10b6:a03:255::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 23 Jul 2026 11:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 11:16:10 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 06:16:07 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 3/7] platform/x86/amd/pmf: Move metrics code to dedicated file
Date: Thu, 23 Jul 2026 16:45:30 +0530
Message-ID: <20260723111534.1940925-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|DM4PR12MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c8da32-d5d0-45ae-3356-08dee8abccda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|3023799007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ug31DfQrWL65SounyAYIO7pm51M4NI3Rlh4UWyHKWljH4MdcY4AO/zdpysYHIDn0+gHI1B49UN9N/g8dP7XlxX2PTV9uJImZJ0633888+4K0DDiOtWiTjYfyAO8X5+HezGy8E1Vk8mOesZ9FeKfSxdw9/4bA5jnjCZ+oWm07w8w38qle3hHsPBThndydhyJ61I5sCj1HU1jlbkM93O9IOCbW0rfF7A3GkrUkQRkUjdLgf8A3Ip+tGbUqBfkwDzPW+hR6LN4x+jsS0fssFXW3YLk9yWupz4dshR8hndP63WN563IPIDQHjmJfRWs+mhLDmLHYC0GxFLkMBDQkRKvZJtPlmjBpHY5c0mJlkFhx1hUEiH0W19xRnKUvotxgH7eQa7JBvgu8PYdLXPI3RJ54AGA9Ec2uu3qnBHkzclFH/6hOrvIyC28Oxp16bQ6NIN4OKB7CTG2FhsxJlnyM7OCKzrIFOhXuLR3Cve/03shNv91E0OqVNWG6gfluMYkBlUAxRcOefPa+4Wmax8VKk2o2+tbqRzdte4/gsmrDtViofYya4SBXmOqb3/892QyKiIOsio6xSdQnQaJ9E50f1gsKH+uB/UktRn8B5/NQpNlZfiuNptapods28UuaBGNNcHmtxK0L69At2a2d94WUKl/sEzZ8BY5o8YE40MIIUD0sLpIaHEr3F5CUMzAQoWMinNxIL2KV6kBiE1SbrinDQAsmNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(3023799007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NjyXVkpWO1mcG5FWcQdAS6+X9/I1DXCcnXIUfUu4/mcxQ1F96n5HN/1mghGCPs+Wnc5WuGbfs1esT/LLfvrdV0KwMoJyHoC8/XJWNcNpD+e+RKZl9BwNuU9d8e17F0X6jT4NLxi549soCo+OGmPRYIe+sTRr57SupIlBkxappch1oEU8vmNXv+on3CzDM+/DBD/k+28mOHSQyWeqCsD8aieBrwsixnVel2r4FSfSEeIAJQPVQr9l3AjMOKLKQ0gCtYcxbqmXkoO2y27M2B5exxJO4nw53HVHOOJBW2R7fs17JDf38CpWy+e92zULfHPrLQ1E9doCY+FgRnpkx+44k8K3/J0SsNExufhsqHte59qM8syAmGJgQFNftavsOZ76aCU412yCrdA9TZQLVSShbyNCaz/xPDCTN2W6zKh2mSyYGVdaJMfKcGTuuhOai+Sy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:16:10.5812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c8da32-d5d0-45ae-3356-08dee8abccda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6472

Refactor metrics related code from core.c into a new metrics.c file
to improve code organization and maintainability. The metrics
functionality is evolving with new platform support, warranting a
separate file.

No functional changes.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile  |   2 +-
 drivers/platform/x86/amd/pmf/core.c    | 157 +--------------------
 drivers/platform/x86/amd/pmf/metrics.c | 181 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h     |   3 +
 4 files changed, 187 insertions(+), 156 deletions(-)
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
index 0f85ac0ba803..f557d55b51f2 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -17,7 +17,6 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
-#include <linux/string.h>
 #include <asm/amd/node.h>
 #include "pmf.h"
 
@@ -55,7 +54,7 @@
 #define DELAY_MAX_US	3000
 
 /* override Metrics Table sample size time (in ms) */
-static int metrics_table_loop_ms = 1000;
+int metrics_table_loop_ms = 1000;
 module_param(metrics_table_loop_ms, int, 0644);
 MODULE_PARM_DESC(metrics_table_loop_ms, "Metrics Table sample size time (default = 1000ms)");
 
@@ -68,8 +67,6 @@ static bool smart_pc_support = true;
 module_param(smart_pc_support, bool, 0444);
 MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
 
-static struct device *pmf_device;
-
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
@@ -138,37 +135,6 @@ int amd_pmf_get_power_source(void)
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
@@ -296,125 +262,6 @@ static const struct pci_device_id pmf_pci_ids[] = {
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
@@ -677,7 +524,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
 
-	pmf_device = dev->dev;
+	amd_pmf_set_device(dev->dev);
 
 	err = amd_pmf_cdev_register(dev);
 	if (err)
diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
new file mode 100644
index 000000000000..e457bcf490b6
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -0,0 +1,181 @@
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
+#include <linux/array_size.h>
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

