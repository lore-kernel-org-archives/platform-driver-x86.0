Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BF933469C
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760696779; cv=fail; b=KRY1pyfenx7hj1mAsk2IXwTejdYvU80FpJ+2Z4FWK5+Rxyq5q54GwztdDOTELvCRUlJCwrrCbJsFemD6va31p1UGTa9al718xrk1uhBRURV7SgQC+zkd1KSoD/y1s9UH5Xx6Bbcy2jsccNU9sL7kaxccI9Wo0MGiRRz9EQs+i5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760696779; c=relaxed/simple;
	bh=yTNretyBcUq/bZwdJSG1ceM7aJ7kui5376BRTgye1f8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ef7p+y2MMJ1TIWgKpMaTtj/EeMwa2NzPjPG8Urt2EJtgSbkE8QFaJntxoNyrfRtzUOm/Wfd2gailqx3ANkjQH5AUx6CsKVxODbM23rT0LEyg0ylceTk1U/6zldK01hSq+8PEI9bcHBTuYSQpKmh/EESgzZpZSa8JrxluhbHY7qo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Vvc7nH1v; arc=fail smtp.client-ip=52.101.46.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Vvc7nH1v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8WXulun8EuuaOfZNjzEcrqHN6VKhOY7QtGon8DONQ0jvFwShxVvEf6nw76KNfq24LSg8E55WDmRRhbS5D8dtNwfNmDVqgHjV41cn+6QTJffesgnSonYlnnaz1EUyMYq4SZNxG42rJ6rfV/3HB2mPrfUtM7eT1uZjAc27hwRN8hjwWdPdkRC9R72PDwWHwXFY/mAw2ujf+JnvpgB3eFFixhUBP3j7ZSNIoBYTficghL1+kK1Ewo9AzOEThno8Rt4r0nE8G/SEm08rykRvsgVew1bVmGurRC4A4ifJKKQV2Z1fdcVgzOwWSlltoDJrZZvu3Rpwyi9Y+PPEhVlnMHbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=178zLNcW9p4TzKKrC06+TjRw8ZC5iJTE5rUXC6OlRw8=;
 b=WeIeuVWoeqDeWs8Y6xlopHVe6pYEkwpajCHS/QW2/H1FoWSttmmULnSW74tIZnnbR32wBZU4oE0WLBiZThKZnS6JFBzxEU+jDRtacbG3WRJs0ssvXlpOuBZnaSxnGX5D4BCwzHmaezpBduLO7r95dkYYuSxooOwgXLtCSi7YEm7Rpi68yARouWuzI8p6pgawDyiMYPlg9FFs68P4OOxOjOqRkGp2yJb3uLBqXBBv8XsYk2qnz4UgT9Vf/qgaQ/D/00i27eQoqYzGhESnohZmHdoby6FANFcdhTXyXu0nRv0L6pw7UVxndNXo3FPnn0qwRrvd2qTp/Wk35m+2S/yMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=178zLNcW9p4TzKKrC06+TjRw8ZC5iJTE5rUXC6OlRw8=;
 b=Vvc7nH1vWm7IGRNNqD7vE0/vLZ9Lx6xWsHuTxCLgXgYkO23P5beD/DotzUcgvlXHdZYhydEzpfhekg6mCo3eNlkS9anXuHVamzWqY8KlG3veHPAbuitcfGX0lrJQPPLKj+miWXGcngPNu6QKD0NfqGPsowdyCbQ/snRwW84NRJ0=
Received: from SN6PR01CA0033.prod.exchangelabs.com (2603:10b6:805:b6::46) by
 DS7PR12MB6261.namprd12.prod.outlook.com (2603:10b6:8:97::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.13; Fri, 17 Oct 2025 10:26:14 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com (2603:10b6:805:b6::4)
 by SN6PR01CA0033.outlook.office365.com (2603:10b6:805:b6::46) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13
 via Frontend Transport; Fri, 17 Oct 2025 10:26:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 10:26:13 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Oct
 2025 03:26:11 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/3] platform/x86/amd/pmf: add util layer and user-space misc device interface
Date: Fri, 17 Oct 2025 15:55:42 +0530
Message-ID: <20251017102544.1470934-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251017102544.1470934-1-Shyam-sundar.S-k@amd.com>
References: <20251017102544.1470934-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DS7PR12MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d50e467-1690-46a5-b4ee-08de0d67996c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vfzA+Np+gLncnZzsU/IEn9GBets9A43HNEr2reVcKP21TAdq0Dcp+Rr7pr3K?=
 =?us-ascii?Q?uZMonGLgBJqd18MrtHwgJ8S+QJZsvta2XiJt6ing/U5sbAuUOB9+VS+4hOyf?=
 =?us-ascii?Q?wXDwXsj53ogWIwkQ5ooOvYRFQJXDpcCbUq/UcF3yO1XYCps91x14P3qagUKn?=
 =?us-ascii?Q?orX5k34hTXO7W0pGrJdifR0JPK0FzA5phSfPdruna1GeAqvUyzv2WfSyE6d6?=
 =?us-ascii?Q?c1EF6zF9H6MjFA7nql7tAlxAc1qQ3IrNHv/b4C+D8F7y22wX3K9F04YjHRz8?=
 =?us-ascii?Q?9Vog6TFKWq6AjVLcm4uIvgoSaR2rMyzUc2U6kvPH+gegTKnJIngHPnFbvoYK?=
 =?us-ascii?Q?C8Lvmhz/Yh06DnPV3hpg4+Fwstv4c9pvttKkDuPEIFNLY3YuDKf36n4LDxaz?=
 =?us-ascii?Q?9vaNNPIYw8D1ydhv5hpYzPbEuELlPmSJYd3q5uHyxC6RWtyJz7NnQ+7JJqiJ?=
 =?us-ascii?Q?ez0sIw886G3ghftO0K5HBdCISZ5/xR00bLef/VwEf+uSidMtH1eSnIOGvt2v?=
 =?us-ascii?Q?GNI1eNGIRjOemLajwtELYSrWjox/5rXxk1FP34GnM26Ds8UsWbGgBC1u6fEu?=
 =?us-ascii?Q?V52WJ9TED5wvMYmvDJSGW9fWjnP4/QoFxJh8W1bdnxFjj9Z1vqmkAiPNLAw9?=
 =?us-ascii?Q?oOLfHucuReiCfkDfom4Vn9JHPAI5VRq4fMgj3qwbE1p81sOR9zL2f3Y8t+AX?=
 =?us-ascii?Q?n/8fNp9POOt7Gry+70YCTlFvg+FlvR3f5cmgW/6UjfR7chXs8aZ+G2hvqQdl?=
 =?us-ascii?Q?xGC+1dubkf2gvxai0UlHnv428dXtkqFq71xSIMteG63z/lg+kICpoAYLC+1Q?=
 =?us-ascii?Q?cmP0KKYPUNfzJLarin5O3hjMW1bhkmzhNQk6illgpkYE/D46jkZDrNBs6BT2?=
 =?us-ascii?Q?tRitBtihjRG6E96yTJbx2Ejy36T2I3NtsQadBR2aDiBAwycUfqROm08VsBB9?=
 =?us-ascii?Q?nb6/RmHznQ5C4zez5eShb/ClAqmx9BFGAH6P8ITVBG8a72r3w4E2zlHEPAAQ?=
 =?us-ascii?Q?qVWwpgjNLEjvhRL7wJUEcj6LSIPQ7fRLejDD+hreWe7fc1q7U2e2bspgefDY?=
 =?us-ascii?Q?wdEV1fad7uXkqSqK4SnZ1qeCWWm5rfZ7ORSP3Qz5kIq+1aLd0myijnK+fnD6?=
 =?us-ascii?Q?Gyo8vHyyAaA7/JuOqxoPj6SrxVoZbdt1xAYAyAKulR9kfDqtClDzoAunBwjX?=
 =?us-ascii?Q?2le5/qEMYU7VFjBst3Jg0xNPhRnVlVgfIChwIW7kW1eu2ku0ibBH0XsjoaX5?=
 =?us-ascii?Q?XHiE50bwJLbAlqboIJ1D/Hnu2r1T0orvzSj15ZzygfkOlWq56Q87ajQ57HsV?=
 =?us-ascii?Q?RzuR7yjAqPjfcRXAyeAj6OipXVoUkcUu532PVq9VdMXmOkHL2kHiylSPxpg+?=
 =?us-ascii?Q?EIFyBrtdUPxwsNtqvKPzGzOnRqhwcnjOoJJW1OObIDfp7PTzHn3m6spE0qiT?=
 =?us-ascii?Q?YnLvcNutLBe+e7hv1qffq0Ak8piVDvTHMw+NGqO/HrnESkYhX0InlXQrHKdx?=
 =?us-ascii?Q?qG2y2xq3bfZKUrMwbXNV5uu517L8RH55YM6R+JS+3EjzJMAdtcJkkpD9ulDC?=
 =?us-ascii?Q?DxQqKOtZexmbSB4aKk0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 10:26:13.9368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d50e467-1690-46a5-b4ee-08de0d67996c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6261

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

[1] https://docs.amd.com/v/u/en-US/68773_0.50

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig  |  10 +++
 drivers/platform/x86/amd/pmf/Makefile |   2 +
 drivers/platform/x86/amd/pmf/core.c   |  19 +++++
 drivers/platform/x86/amd/pmf/pmf.h    |  10 +++
 drivers/platform/x86/amd/pmf/util.c   | 115 ++++++++++++++++++++++++++
 5 files changed, 156 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmf/util.c

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 25b8f7ae3abd..81ea4934e199 100644
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
+	Enabling this option permits the driver to interface with user
+	space for capturing AMD PMF metrics and updating them to the
+	user space tool for smooth monitoring.
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
index 000000000000..483e4531535e
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -0,0 +1,115 @@
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
+#include <linux/miscdevice.h>
+#include <linux/uaccess.h>
+
+#include "pmf.h"
+
+#define IOCTL_PMF_QUERY_FEATURE_SUPPORT		0
+
+/* AMD PMF Feature IDs */
+#define PMF_FEATURE_AUTO_MODE		0
+#define PMF_FEATURE_STATIC_POWER_SLIDER		2
+#define PMF_FEATURE_POLICY_BUILDER		4
+#define PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC	5
+#define PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC	6
+
+#define AMD_PMF_FEATURE_VERSION         0x02
+
+struct amd_pmf_feature_support {
+	bool feature_supported;
+	unsigned long feature_version;
+	unsigned long feature_id;
+};
+
+static int amd_pmf_get_feature_status(void __user *argp, unsigned long feat_id)
+{
+	struct amd_pmf_feature_support info;
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
+	int ret = -ENOTTY;
+
+	ret = copy_from_user(&output, argp, sizeof(output));
+	if (ret)
+		return -EFAULT;
+
+	switch (cmd) {
+	case IOCTL_PMF_QUERY_FEATURE_SUPPORT:
+		ret = amd_pmf_get_feature_status(argp, output.feature_id);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
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
-- 
2.34.1

