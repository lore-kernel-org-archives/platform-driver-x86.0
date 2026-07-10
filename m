Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011011.outbound.protection.outlook.com [52.101.52.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995E2376466
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705378; cv=fail; b=fFNr53O/Og4+7xM76aCAwSFlLjTTM/CxoWN1gR8fZ6TM0SDfnVBAIyRSN4UIA3xyh+lIxu+kTAMbqf3BA3XHX5ihRQ+RyW8qQe4xatE0tIfhvpTd774b9bU8FZu0OvxqbxkKjNFQTk/V3+OvpVI3rRJVj6DxdclWx/0fR28FhQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705378; c=relaxed/simple;
	bh=GcsibWfIZVX7XQJfh08XCKsuen1cY8XcdLvR0QAkQ3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YY9ENiDr7DDrzVT0gLQg15HmmPUImxLh3BEaVVEXEzXLAXYqtgYP9vibpU0+DHQDpSnB25tWD7XSOqRKLhMmhOsaGRkWjBrX6inMzKZCm8gcEr7hfr+uPxGf7SBofWJbV9UiJtREZrK94yWnYdI7E5GSWc74oOzCZdU3gJVjZ1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vxNm4Mqr; arc=fail smtp.client-ip=52.101.52.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vxNm4Mqr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+lhDDpgmG4UMgZuVIudGji378TnO1SWvbflBDK/w/bIFEw51dyikt9z1uLAaxO2c0US6ZsFnr9sXbKFHZZKoQ+sKXUjCDkpUiLCaRSJwkPP4hAcQC3m+R9N4HOM5DCTqBejoqF6jE0F71BcNRzVQAUYl2flaIdK4U499A0DrousPz7PTIxwNgRmewG0coH9YDWn9OGLh466iFX2q1yXAcC0XBBh24xbdlXNOqrh/xThe823kWNTdLx1dnhxtktn3+qesQpc+JUWaCiYNrE2ZDkU0NcqJyw7RFSfk9DeB1ylcHEQEGLLpSyEklKcPx101beNgbNYBiJymcmr6zOq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVDMfxV//yx6PxOZi3SX1o/9eB/r9vjOBtRfg/TVAuo=;
 b=YT9WlPbDHns6MmvK0AmE95qD/Md/mhcnKIDSKYim/cnZkcX4Vzp1WxDrFQoAYixs7UMAw5ScRRflJQ5ncTLPrfkPRu+KQmOWEj+kJYM8vNKBxqBroQChXGM98Loi+EboRS7Cfo2h5bNMGmWWQ90SSWUDkUBHQAAvWPY02zAkQcWCgSnDe5LGBF4w70rZ9lBFhsLpoCF0BT3y1ISBYvpOAVvSnTBWHlsqURFkOuj4rWQMn+r+khqniDvO+WqthQUXnFibsk4caznsBQdIq5BpMPLT3Uqvz8cnLz11sBNFa9zvW/SjU4Kf3Wp7PezWHL+PWOsuDwi3IsqpwPFn+Adaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVDMfxV//yx6PxOZi3SX1o/9eB/r9vjOBtRfg/TVAuo=;
 b=vxNm4MqrNqUtzA3KPkZv0tQHLrFIh2fm5/vfqM7Ybp4jZGP7x0tYRG8+rutKAh45gvMaCM9VLsSiib/mGaFBhMXhpX0saKiD6ksee/Irhv+RDlkha/44xQuw8V3V5Vu5J36WbQ+oPA2QGlNygkWzeBBf40twOd4TjBEddbyXDWg=
Received: from SJ0PR03CA0107.namprd03.prod.outlook.com (2603:10b6:a03:333::22)
 by SJ2PR12MB8944.namprd12.prod.outlook.com (2603:10b6:a03:53e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 17:42:45 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::7b) by SJ0PR03CA0107.outlook.office365.com
 (2603:10b6:a03:333::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Fri,
 10 Jul 2026 17:42:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 17:42:45 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 12:42:42 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/5] platform/x86/amd/pmf: Move metrics code to dedicated file
Date: Fri, 10 Jul 2026 23:12:17 +0530
Message-ID: <20260710174219.2522269-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|SJ2PR12MB8944:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a78a04f-ed92-48ee-a5fe-08dedeaaa6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ndQ57NFdH4u+drhI7a6/0gtEE0g2tPIvA7bstGZ8zrLdtMj6oQAqvwDk21wVMscXB3E6KSkqzwGQwJ4p/CkyV5AeZpE/1JRPcOw93oSwFATRYMCWDmmowqJCWcm6y71EBKIWu7C+/Qelc2pZoOALVnnXEIPA+NlpFJEFozIgiIcS/Q9Jl75DvWZI2Kj09uQZwv2U/yLuFS+DDM80tHOK1WBPT1LY6cx5CW4tK+Vpc8jhAfdMcI3SQt9lRak9m9scISJ4PBA0FU3CVVGlwMflxutMvBJjkcSfU3PrEryPRfARb5pVgj1zu0qvCSBADM+pIBduyGjBmc1JjQh144FOSQ/EEAtMBXlz9ubFJJukRK3uOvj+vUO50e1J4eyjI75KwPlyLiZGoVoumuQI6faMVoyhZ3n3sJQw93QF1QJCG1KQ99Dqy/XIT7TLfFvOTMMRV3kW7tQbz0mqVg6RHAh5PTT+rxHsqW7poGLICsVcRnuyHfEijgovHEwe7MKbdKmB+6Q/FMYYOEisTTVPiz4YH3tkLy0V7oDsQd7U9CmkNZL9JTBYjMnoxsTgJBOnUa4rDc/jSghUSQho3DKzoQuETm52QbjRDjkyY/M3hodBSLmz+zKLtv+hJr7U7WpHXOCIivpATuyAbu2RozpYRS6xcQmJ4NKePeQ2qpvm/WNq4JoXMZ2QDTWqSsdIoF8PeF0DQubi2J1wHJCvPobWIsaq7A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DV12T1qSu9WX6+iByzuHHf3MvmxvlJAMcCA16afByzNiU9GWKXAfCo/8oVDp38pQJEk2Pin9qjJkJFkppj0BN792Zeip5PUQtn95snxiXOvn//J5f0F/lxxZ35FMDj4VgusoJNgldBZ+g19Lct0IWrWKNIf19JrMLr/ngQuL8fxc/9h4k3DA4ztY5VjpREAh9ZQNlUW86rSbG6E1w37ulgQFMNOjSFaGD+bKGjBhZJQxjl5ScYhUZpW04745Q6fyMZ1+4EDoSHN95JhKPXkDpwpZWfMwtufcrYqI6LveV8BnXom2m8oVnn0bD5bF5MvAyjQHpoenQhSpm6RfKGH9fplW9tyDdCS9l5o5QP6B/CyTgpnC1W1D/8Tx0IYWWFaQBqUS9rhiqW1GQA2iJexOKZBY8e/63+VxHPvgIB/RErOpFF2Tt9M1NOzaGGuGToh7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 17:42:45.3860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a78a04f-ed92-48ee-a5fe-08dedeaaa6a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8944

Refactor metrics related code from core.c into a new metrics.c file
to improve code organization and maintainability. The metrics
functionality is evolving with new platform support, warranting a
separate file.

No functional changes.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile  |   2 +-
 drivers/platform/x86/amd/pmf/core.c    | 156 +--------------------
 drivers/platform/x86/amd/pmf/metrics.c | 179 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h     |   3 +
 4 files changed, 185 insertions(+), 155 deletions(-)
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
index 7c5a1ec3d7fc..c0a21808b867 100644
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
@@ -297,125 +264,6 @@ static const struct pci_device_id pmf_pci_ids[] = {
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
@@ -678,7 +526,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
 
-	pmf_device = dev->dev;
+	amd_pmf_set_device(dev->dev);
 
 	err = amd_pmf_cdev_register(dev);
 	if (err)
diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
new file mode 100644
index 000000000000..bb4f9127c655
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/metrics.c
@@ -0,0 +1,179 @@
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

