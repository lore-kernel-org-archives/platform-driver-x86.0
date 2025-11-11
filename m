Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7182334C819
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 07:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762845039; cv=fail; b=aWr7lp4juak6XdHtTZJ0r6eaYjHokwkwGpab4ZfeEDn0Mvh38uI9/SfKMKe3ubDmBB2pR0ntrLWs37d2BH4NEg9NcjOlFIPvyp+1G5UWcVyIrtEFTn1A+WPko/tHaAd/fHfNqUcvSDDYBaNQ2q1E9sv+fhRoaS88w917SEqjeTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762845039; c=relaxed/simple;
	bh=fUhaYHGhatEklPfgDO3IzSLWiHYtusORV2dEN/lgpNU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z7bIKpt4qqDcU2/aAYBtEYqqdYsJr0jQMDSsSjNnuw0f1MvdnX/8Kcqvhv4M946zNXRih2aTm/5ydKI6HliEE05lBC82Q1DzutFM7iufp4M1WhCdG3kNEK6vH8KY/H3lYc46+sQ/fylkf5EoXQahMGpZPC9H9l/+463RHb8gXQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AsZDEQVW; arc=fail smtp.client-ip=52.101.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AsZDEQVW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnIuFYSJMgXY0KpUAXbngYfQA03z1h8SGWTr7pOBQkDzR/c9Ny1KGNOxG/zV3/KTBhACcB87Osec7RQTEPGf0a8CoAjb5vN1InkXdVT3auH1tApiZITWaw2TKGCx9ueZwZzQqlfxdRroEwkOLokwjDs3GM7bSXSpOtc6ltlGvLdBLroijPdASNuQhXAs/6LXGdAUVso1eG/BiwtD0TEUlAdhU+mjRD6WSpxp6fFWEBJye3DRcMDxlLE4k6XO+RhgplBegafmvHr8aTyQp6KEGTOR5v/3SqiJCVdRns0dCO4+XrijLiAeSL+x49SdUPSKU4FfigzNViMLQFzbQXyUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiIS3nfrtRHGcyM7B1IbZBRJxqzM2skNvgnH7XUzoOg=;
 b=wVo3PtagiwxBiIGOtoe0Rqk9lHLTZGo/yg0bBLA/hQ5TydEAATW3SNPAMSagSnar6ENGwl4LsZX/2NmlYolXg/OaxpLuAWVCrYLMzEIEVv+qfhqyX3n/uLne0wlVCVFZmBIZOf5iJcW/Ypn21FUIAwEJHdruoeBC2fRLcxeJYKmM27IJDUZYFPugl3sJnkBC9OsyFvQmzsYiOAb+y/TTkbJ7emun4+uuisiRQ0EdSo5QivLWGGpeKY3+xXWpxVjv5xZ966dcj3szKcwb4Yq6m0cVIDT83Mfs6E4epTiHxDeE3hUtqOt75EAehFYztkqaSwiS8qqwXv5cHnn5vzd8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiIS3nfrtRHGcyM7B1IbZBRJxqzM2skNvgnH7XUzoOg=;
 b=AsZDEQVWoiQh/BujFv5Qka2WE3a+3YIqL2MEwI9UuQP0w55XgFtr8ase5pP+KHMePYPVl++EDUPRyXz0Ti/ZKr9PA2dv5Ml6a55mYgvMSRwg+vK9cA+Ol+P18hXh+rI+juAkmjz2i73cLgwRLiVegZR06uAuEmLi5f8uqYHQG9w=
Received: from BL0PR05CA0011.namprd05.prod.outlook.com (2603:10b6:208:91::21)
 by DS0PR12MB7946.namprd12.prod.outlook.com (2603:10b6:8:151::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 07:10:31 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::dc) by BL0PR05CA0011.outlook.office365.com
 (2603:10b6:208:91::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 07:10:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 07:10:30 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 23:10:27 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/5] platform/x86/amd/pmf: add util layer and user-space misc device interface
Date: Tue, 11 Nov 2025 12:40:06 +0530
Message-ID: <20251111071010.4179492-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|DS0PR12MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: 552b573b-666b-477e-9e90-08de20f16602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WQmlLLvVsnTB2tWb/TMvJnViTH5Z6MnNKEIO/AclWMJrVyyX3q85/MZgqMLo?=
 =?us-ascii?Q?ZMjbyxRLSd4IW6k44/Krdo1GkA6CyxC1IvZsramWpmVD9uw5yPFw5FpJCkM6?=
 =?us-ascii?Q?S9FEwzg6yBsIrFh/sbLxI0k1ZAUTn8lh//HCEF1g5xIYFCabwIdCmnglf0nL?=
 =?us-ascii?Q?NWNgWuh8TYhLww4ahhICCix7nwR9f2u/0i3/vzsifbuepuJudjNupTImWNLB?=
 =?us-ascii?Q?ueEUdnbq9ZE3kCzKITc+ozgBzc8WUL3a4mmoc0hfER/npEmsYdzTtZdWRSKL?=
 =?us-ascii?Q?620D5MVX/Oo7vRYP6k7Ahd/dU/Y8xOnlkv2AyAlwsg0cK3yZUGhylefWNCBR?=
 =?us-ascii?Q?4t9S/sV2th0/uW9KE59sF4mF45OQ1/ctUQxWoCz+JCDkwFQI/NsjCcnBpdiD?=
 =?us-ascii?Q?9ty37RP/FBQjKOOHC4Ix/G4Z6czsGV6uXGkvzXIGnOQ+yonFYxe4G4JrWHJM?=
 =?us-ascii?Q?8/TrHi6Nm43sOn4G8ADwk/uGH+CvJ1A79NxN7TiUy2sPYxa18SNTaWEFXI1R?=
 =?us-ascii?Q?AqDuda5QbcF1eDez43BquKRrzOcjy3PeohQNK9sjVKiF8WgyHZam8GbrjSW+?=
 =?us-ascii?Q?kSGtkIfY0T3cAlpxDN5BvfaivZmo6ilV33K8uex35SLFwxZF8+lDuGWyvS1V?=
 =?us-ascii?Q?cLc1zSDhagcPk0d+nVicwxVs4KrqLZpGuPK76T5U4zeJndsQMvB21rYxebdt?=
 =?us-ascii?Q?WtFWe92VE48fP6LoJkiWKyaZUTZjgEVWXv9L5OltvOw28mbrbhtoCIN+zfwY?=
 =?us-ascii?Q?GvNVfbwaAUcwCdzoVHyc5eWHecyQUTu9V77DVf8N1sc86AtOt7bEId3QSe/5?=
 =?us-ascii?Q?+EiyJtIlVtVCGhZgQjlD31CjZKT5ozKx4aMWinMj7meOdl/tykkf+7ZoQ3NO?=
 =?us-ascii?Q?f71f7eYpwEn+C6ETjK+OQN+gXDQCK+PUhHapLKKNKyNvoySlaABaQiJH+j8T?=
 =?us-ascii?Q?FoyxTOibHq/F1l8VI3Ffu7iXojJhZ/9WAZCIi5EQjbKOpgVhBLqxSwzlQTHe?=
 =?us-ascii?Q?UGDRJoX1fGvr/jmnQSjmpc+cF0cVQfH7/YFhWQb/LJKIPvIxQvi2DWICxqQa?=
 =?us-ascii?Q?256bcp3j9wECUH9u3qfRAiVno+Zv03M3CE5NJVgaFDMsf411T2gjAsg5a28/?=
 =?us-ascii?Q?26xGw/b6+cpi2Ytqtn01o2BcjMYdS3FZnaiIPTx09gYJ7dTAFLeTrNzDsrnr?=
 =?us-ascii?Q?Q+ELZo7TTvm6eMbs3KimKmb0O3ZgcZFn0bJj64RiR7Imo0G5q+/q4cpvCL7E?=
 =?us-ascii?Q?G14xrdX9OUrWoR43oOC949TRg6Cqcorkz9ohypE2RR6vfM8vu/diGGH60hFv?=
 =?us-ascii?Q?oju+ZCXUkjzxWzshQQ/NEAy+Xj6s0x5sboBUWNcj2Pd+iqMQRmlMBqHMW+/f?=
 =?us-ascii?Q?TzUndpN2w61PaQWi/+EaHnRVYisseeS+opnpaCHLmKtEF2KV9BO+zCOaW9Np?=
 =?us-ascii?Q?25sPDBbxLwJvtp8a73Zn9RUVwxISi2zGItQxus2Z/w9IvJc826olh0z/QC8p?=
 =?us-ascii?Q?gBcyhzDxBgV9IeDCdZQjJ/5jvHabIrZiK1M0gYJWFNtyDVVHD41DpsZmJOrh?=
 =?us-ascii?Q?OQ7Rgdy2xlqejDxVLN4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 07:10:30.3421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 552b573b-666b-477e-9e90-08de20f16602
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7946

Add a util layer to AMD PMF that exposes a minimal user-space interface
via a misc character device for metrics monitoring and feature discovery.
This creates /dev/amdpmf_interface with a basic ioctl to report support
for PMF features (Smart PC Builder, Auto Mode, Static Power Slider,
Dynamic Power Slider AC/DC), enabling smoother integration with
user-space tools such as AMD SystemDeck[1].

AMD SystemDeck is a widely used user-space tool for monitoring and
controlling power and thermal behavior. It helps designers keep major
components within their thermal limits to ensure proper operation.
Maintaining temperatures within specification enhances overall system
stability and reliability.

Link: https://docs.amd.com/v/u/en-US/68773_0.50 [1]

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig  | 10 +++
 drivers/platform/x86/amd/pmf/Makefile |  2 +
 drivers/platform/x86/amd/pmf/core.c   | 19 ++++++
 drivers/platform/x86/amd/pmf/pmf.h    | 10 +++
 drivers/platform/x86/amd/pmf/util.c   | 96 +++++++++++++++++++++++++++
 include/uapi/linux/amd-pmf.h          | 26 ++++++++
 6 files changed, 163 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmf/util.c
 create mode 100644 include/uapi/linux/amd-pmf.h

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 25b8f7ae3abd..1e1a76de52b6 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -30,3 +30,13 @@ config AMD_PMF_DEBUG
 	 in the PMF config store.
 
 	 Say Y here to enable more debug logs and Say N here if you are not sure.
+
+config AMD_PMF_UTIL_SUPPORT
+	bool "AMD PMF Util layer support"
+	depends on AMD_PMF
+	help
+	Enabling this option provides a character device for userspace to capture
+	PMF features (Smart PC Builder, Auto Mode, Static Power Slider, Dynamic
+	Power Slider AC/DC) and PMF metrics from the AMD PMF driver.
+
+	Say Y here to enable it and Say N here if you are not sure.
diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index 5978464e0eb7..bf7aad80b9e9 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -8,3 +8,5 @@ obj-$(CONFIG_AMD_PMF)		+= amd-pmf.o
 amd-pmf-y 			:= core.o acpi.o sps.o \
 				   auto-mode.o cnqf.o \
 				   tee-if.o spc.o
+# Build util.c only when AMD_PMF_UTIL_SUPPORT is enabled
+amd-pmf-$(CONFIG_AMD_PMF_UTIL_SUPPORT) += util.o
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index bc544a4a5266..ac2b80db019e 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -53,6 +53,19 @@ static bool force_load;
 module_param(force_load, bool, 0444);
 MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
 
+#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
+struct amd_pmf_dev *pmf_handle;
+
+struct amd_pmf_dev *amd_pmf_get_handle(void)
+{
+	struct amd_pmf_dev *pmf = pmf_handle;
+
+	return pmf;
+}
+#else
+struct amd_pmf_dev *amd_pmf_get_handle(void) { return NULL; }
+#endif
+
 static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
 {
 	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
@@ -465,6 +478,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (!dev->regbase)
 		return -ENOMEM;
 
+#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
+	pmf_handle = dev;
+#endif
+
 	mutex_init(&dev->lock);
 	mutex_init(&dev->update_mutex);
 	mutex_init(&dev->cb_mutex);
@@ -477,6 +494,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
 
+	amd_pmf_cdev_register();
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
 	return 0;
@@ -489,6 +507,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	amd_pmf_deinit_features(dev);
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
+	amd_pmf_cdev_unregister();
 	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
 	mutex_destroy(&dev->lock);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index bd19f2a6bc78..3b1aae8a60a5 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -823,6 +823,7 @@ struct ta_pmf_shared_memory {
 };
 
 /* Core Layer */
+struct amd_pmf_dev *amd_pmf_get_handle(void);
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
 int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
@@ -888,4 +889,13 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev);
 
+/* Util Layer */
+#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
+int amd_pmf_cdev_register(void);
+void amd_pmf_cdev_unregister(void);
+#else
+static inline int amd_pmf_cdev_register(void) { return 0; }
+static inline void amd_pmf_cdev_unregister(void) {}
+#endif
+
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
new file mode 100644
index 000000000000..97a626bac034
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Platform Management Framework Util Layer
+ *
+ * Copyright (c) 2025, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *	    Sanket Goswami <Sanket.Goswami@amd.com>
+ */
+
+#include <linux/amd-pmf.h>
+#include <linux/miscdevice.h>
+#include <linux/uaccess.h>
+
+#include "pmf.h"
+
+#define AMD_PMF_FEATURE_VERSION         0x02
+
+static int amd_pmf_get_feature_status(void __user *argp, unsigned long feat_id)
+{
+	struct amd_pmf_feature_support info = {0};
+	struct amd_pmf_dev *pdev;
+
+	pdev = amd_pmf_get_handle();
+	if (!pdev)
+		return -EINVAL;
+
+	switch (feat_id) {
+	case PMF_FEATURE_AUTO_MODE:
+		info.feature_supported = is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE);
+		break;
+	case PMF_FEATURE_STATIC_POWER_SLIDER:
+		info.feature_supported = is_apmf_func_supported(pdev,
+								APMF_FUNC_STATIC_SLIDER_GRANULAR);
+		break;
+	case PMF_FEATURE_POLICY_BUILDER:
+		info.feature_supported = pdev->smart_pc_enabled;
+		break;
+	case PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC:
+		info.feature_supported = is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC);
+		break;
+	case PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC:
+		info.feature_supported = is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	info.feature_version = AMD_PMF_FEATURE_VERSION;
+	if (copy_to_user(argp, &info, sizeof(info)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	void __user *argp = (void __user *)arg;
+	struct amd_pmf_feature_support output;
+
+	if (copy_from_user(&output, argp, sizeof(output)))
+		return -EFAULT;
+
+	switch (cmd) {
+	case IOCTL_PMF_QUERY_FEATURE_SUPPORT:
+		return amd_pmf_get_feature_status(argp, output.feature_id);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct file_operations pmf_if_ops = {
+	.unlocked_ioctl = amd_pmf_set_ioctl,
+};
+
+#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
+static struct miscdevice amd_pmf_util_if = {
+	.minor		= MISC_DYNAMIC_MINOR,
+	.name		= "amdpmf_interface",
+	.fops		= &pmf_if_ops,
+};
+
+int amd_pmf_cdev_register(void)
+{
+	return misc_register(&amd_pmf_util_if);
+}
+
+void amd_pmf_cdev_unregister(void)
+{
+	misc_deregister(&amd_pmf_util_if);
+}
+#else
+int amd_pmf_cdev_register(void) { return 0; }
+void amd_pmf_cdev_unregister(void) {}
+#endif
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
new file mode 100644
index 000000000000..2147240c2bb1
--- /dev/null
+++ b/include/uapi/linux/amd-pmf.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
+
+#ifndef _UAPI_LINUX_AMD_PMF_H
+#define _UAPI_LINUX_AMD_PMF_H
+
+#include <linux/types.h>
+
+#define AMD_PMF_IOC_MAGIC	'p'
+
+#define IOCTL_PMF_QUERY_FEATURE_SUPPORT  _IOWR(AMD_PMF_IOC_MAGIC, 0x00, \
+					       struct amd_pmf_feature_support)
+
+/* AMD PMF Feature IDs */
+#define PMF_FEATURE_AUTO_MODE			0
+#define PMF_FEATURE_STATIC_POWER_SLIDER		2
+#define PMF_FEATURE_POLICY_BUILDER		4
+#define PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC	5
+#define PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC	6
+
+struct amd_pmf_feature_support {
+	bool feature_supported; /* Out */
+	unsigned long feature_version; /* Out */
+	unsigned long feature_id; /* In */
+};
+
+#endif /* _UAPI_LINUX_AMD_PMF_H */
-- 
2.34.1

