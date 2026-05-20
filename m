Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA70E3FCB1E
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779303356; cv=fail; b=OdypH59FR8fN2gNHs0CufLu3kjwdyud4UNq1WBltpGTcKKPNmZx1iBFzfPz0hu3h6rFCZWHCmC9HhKXp3wzezGMajr0ygPv2FXKu+wttJPVw7f8EMpFSVGR5l/EJx6p3eqTixG30VHOkIrsNaHcaKOZaIVUd1hk+GMPPKz9UuIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779303356; c=relaxed/simple;
	bh=mbgoZbP61ppsT4JnAodSQqcafALfblcscFQ5nrb4kiA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNuWJSWzB7wR0shpx9d+oMcYViyzKwxCTah38lBiEC7FJvzPruRIwjcTJ+tGsAu80HFh/3ELMWrq0jBSPJ/0fkd9CTgkIeYp4L9F1HtsZqYJQ68X6m5Zugvy3fTS7PvXH3lJetCLJplt/mJgwTMTGMC0bmLirUW0UDmt8QplFis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jutemOoy; arc=fail smtp.client-ip=52.101.53.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jutemOoy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z02/QPR0KfmyJTvVNuIjXn7QjLFnaZY997caT0tYkj23w50xxcVoH5BV3ZvMgwZwvCleZ766oKWncaZEjMYlhVoBvHUYFrsrJISVZG0Ty9u/pxrdMFwwt/+1YRaQPwZW6MrbxUot7tWDs1KuCC9qYyDq69RJ3ht/w7Bd9jogyiRab+y/K292Cj3bYYkZe9552SlshVYo8qzbp7FE4I1deBiCtBixA/C0z7l2LgJ+EuIycVInt6YPlomkekfp7o3r2HrpSOSPYE9g2M851RHtQLSD246/dNdoMS2GpUOmeP5kJQgB6bufZmdlIar/qV0Qyn0gXJkim3RbLckthY1qOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vL6Nr/tMdP8bf8b+rcZ/IHCiHKTUsGW2SvclFDg4xME=;
 b=E/Jnw99zFeLnvLhngcvNskajPawanRf94bZm0hak1IMdHQlfjLkjCCf9e3ibuu1NTP7uXLQb1cMdYQ/2Zz5rY6wOBW6vK0gPowaSm9wvMql5RQL39CajDulG8jhtRPOk2jXw80Qrl3VEeABBrWje5oLNbOFmkV0nLMU8TNDi+W3T6xKj7rxxzTgfYj2r2fN2uZVh4ALtCV7YcsoInmcd3hJAcrpybAXxVmEKdtqOmPI76RAvGJGZuQ7TsjUxp3jLXmK4/stkOII5SCud2JvXSHH5OOlrHbgOM1ONoaFnBOuyKKaFA7A1hM3W0MLLYLroZYliIEpNcb6URlqBH/SzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vL6Nr/tMdP8bf8b+rcZ/IHCiHKTUsGW2SvclFDg4xME=;
 b=jutemOoyl3V+gDMGDmYgcr2CMWrjwodDR1Vo+AklS9GCwJsVbTyKZxTAKrSuovLp9MqYcZPseelAlnGv9jWQ3Mo7QrV+VdYGQNc0OBwGDlb7bEDbWOUkgkvdSon/R5LBHj+OOYpDIgllQBHspx5kjNt++K3BUnBJo3nTSibTfxs=
Received: from PH7P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::21)
 by DM3PR12MB9286.namprd12.prod.outlook.com (2603:10b6:8:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 18:55:50 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::6a) by PH7P223CA0023.outlook.office365.com
 (2603:10b6:510:338::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 18:55:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 18:55:47 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 13:55:44 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 1/8] platform/x86/amd/pmf: Add util layer and userspace character device interface
Date: Thu, 21 May 2026 00:24:17 +0530
Message-ID: <20260520185424.770772-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|DM3PR12MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb5b06e-d6ad-4ab8-5fee-08deb6a1675f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|13003099007|22082099003|56012099003|18002099003|6133799003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	q2Xi7hDMtb9n6n/xgF1S7AvIdoYc3BDd2AG984ZBFFQt7cBg9k6IOjVHQwwLP/fOQxMZiqI2LjHMEAC7CrVjA/JpU3fmzYwBMyn6B0qM2zIKWmov8/Km+OMmy4c6vmfNJiRkVnGQGGBEbeHRVzoPPwnzp62RSt2W6FRP5nfVqNDdXxKWZ0I/WytWsiYd+QUDeDC6dxukzBjYE+JN9o/LjS9UeQ+X82clVCldw+Xm+CsrXp9lsgyGvB2JPO7GFCCv4Wog0k69OAkfsopUX9m6xIeTxz9lXAx/wB4BwXALSiZJ3aYQYU072nvBIy+ZEEKQM0ew5XsUL3gu5Q112xthREw4VjUtFLh3ulvERWFUNWG4lQXvs4gAf5JGvU+j9YaZ2AdyKfktXi9tVb45epgjCyK/X/AR7inw7WOYQ8ZIugEYJoec0GZ7yiaxApMLBNIZkWAsuufnm0iFH0iN7/rggOLxcAPu9GdZCn+gm2u4dk+jymvpffzXnoRc0bhPE7+rc37CESayHwBCxq7r9nxycoMledrEfbwalpZCaNJRd0ML3TEFMaW+J+pzulMh3KK9AMP9RI/m4mzRuoP2s4Qkn1jB1kV6zF+EdF8SsTNE1lYS6o3TUMkGkp83EShxuE0y0HM4RCvk2MZCocctcjUgDwUACodYsKrcVKK+39B8qsHaqVW1qiqSy52K5Pmdw392ddY78TIB3VumbBbIQRXJVgSNxdEw+2UD+GBAjDewPsw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(22082099003)(56012099003)(18002099003)(6133799003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tBy0bQRZ8EaSz8yM+ZUli84/BOstRAgShbFn3zZFWnMspFMmlV8NPV1nfZRKBW6FcGJLynkTI5ct/KwA/GxV22K71oyCrSQbo7RjvR7z2TH4ngtWHE/BUFmsSF2lR33EPyYRba7B86VpvDn7fLELYsusj8boSfxbqDBnzilnvjJdLszTTeHNnLsrU9voVhKzHkJvj88hDYfxaZoMn85k9hbKz8imBcDdts8jTShLhd9p2EKpEbrrAVnuY1nWBmUDQhqBzKMABOTLCrw4TON4FjBQcZK1/yxG9aolhoLm5T0/YE2taSsJSs4yFk69kdvqTZvUIiY+2qDPNgf8YfAHfYbISb7qsoNMw6OUU653cjo8RkFNt+Afgd4XyGwZWrQ+M91uPR4uSxzy+VGXR6UuSvKTPmdhajsBzzNMX54EwIEkKDKguCM43yUA3yxetxTP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 18:55:47.2616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb5b06e-d6ad-4ab8-5fee-08deb6a1675f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9286

Add a util layer to AMD PMF that exposes a minimal userspace interface
via a character device for metrics monitoring and feature discovery.

This creates /dev/amdpmf_interface with basic ioctl support to retrieve
PMF metrics such as:
*  Power source and power slider position
*  Platform type, lid state, and user presence
*  Skin temperature and ambient light
*  BIOS input parameters (1-10)
*  Graphics workload metrics
*  CPU C-state residency (average and maximum)
*  Socket power consumption

The interface enables smoother integration with userspace tools such as
AMD SystemDeck [1], which is widely used for monitoring and controlling
power and thermal behavior on AMD platforms. These tools help designers
keep major components within thermal limits to ensure proper operation
and enhance overall system stability and reliability.

The feature is gated behind the CONFIG_AMD_PMF_UTIL_SUPPORT Kconfig
option, allowing it to be disabled if not needed. The implementation
uses existing PMF infrastructure to populate data from the TA (Trusted
Application) shared memory buffer.

Link: https://docs.amd.com/v/u/en-US/68773_0.50 [1]

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig  | 10 ++++
 drivers/platform/x86/amd/pmf/Makefile |  2 +
 drivers/platform/x86/amd/pmf/core.c   |  5 ++
 drivers/platform/x86/amd/pmf/pmf.h    |  9 ++++
 drivers/platform/x86/amd/pmf/util.c   | 67 +++++++++++++++++++++++++++
 include/uapi/linux/amd-pmf.h          | 60 ++++++++++++++++++++++++
 6 files changed, 153 insertions(+)
 create mode 100644 drivers/platform/x86/amd/pmf/util.c
 create mode 100644 include/uapi/linux/amd-pmf.h

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 25b8f7ae3abd..ad4faf18de47 100644
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
+	  Enabling this option provides a character device for userspace to capture
+	  PMF features (Smart PC Builder, Auto Mode, Static Power Slider, Dynamic
+	  Power Slider AC/DC) along with PMF metrics from the AMD PMF driver.
+
+	  Say Y here to enable it and Say N here if you are not sure.
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
index b9e5a2cf3aae..919d02f30aae 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -634,6 +634,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	pmf_device = dev->dev;
 
+	err = amd_pmf_cdev_register(dev);
+	if (err)
+		dev_warn(dev->dev, "failed to register util interface: %d\n", err);
+
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
 	return 0;
@@ -646,6 +650,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	amd_pmf_deinit_features(dev);
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
+	amd_pmf_cdev_unregister();
 	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
 }
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 69fef7448744..6f61076a9386 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -928,4 +928,13 @@ int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid);
 void amd_pmf_tee_deinit(struct amd_pmf_dev *dev);
 int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev);
 
+/* Util Layer */
+#if IS_ENABLED(CONFIG_AMD_PMF_UTIL_SUPPORT)
+int amd_pmf_cdev_register(struct amd_pmf_dev *dev);
+void amd_pmf_cdev_unregister(void);
+#else
+static inline int amd_pmf_cdev_register(struct amd_pmf_dev *dev) { return 0; }
+static inline void amd_pmf_cdev_unregister(void) {}
+#endif
+
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
new file mode 100644
index 000000000000..0052f0b6a7a5
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Platform Management Framework Util Layer
+ *
+ * Copyright (c) 2026, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *	    Sanket Goswami <Sanket.Goswami@amd.com>
+ */
+
+#include <linux/amd-pmf.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
+#include <linux/uaccess.h>
+
+#include "pmf.h"
+
+static struct amd_pmf_dev *pmf_dev_handle;
+static DEFINE_MUTEX(pmf_util_lock);
+
+static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	return -ENOTTY;
+}
+
+static int amd_pmf_open(struct inode *inode, struct file *filp)
+{
+	guard(mutex)(&pmf_util_lock);
+	if (!pmf_dev_handle)
+		return -ENODEV;
+
+	filp->private_data = pmf_dev_handle;
+	return 0;
+}
+
+static const struct file_operations pmf_if_ops = {
+	.owner          = THIS_MODULE,
+	.open           = amd_pmf_open,
+	.unlocked_ioctl = amd_pmf_set_ioctl,
+};
+
+static struct miscdevice amd_pmf_util_if = {
+	.minor		= MISC_DYNAMIC_MINOR,
+	.name		= "amdpmf_interface",
+	.fops		= &pmf_if_ops,
+};
+
+int amd_pmf_cdev_register(struct amd_pmf_dev *dev)
+{
+	int ret;
+
+	guard(mutex)(&pmf_util_lock);
+	pmf_dev_handle = dev;
+	ret = misc_register(&amd_pmf_util_if);
+	if (ret)
+		pmf_dev_handle = NULL;
+
+	return ret;
+}
+
+void amd_pmf_cdev_unregister(void)
+{
+	guard(mutex)(&pmf_util_lock);
+	misc_deregister(&amd_pmf_util_if);
+	pmf_dev_handle = NULL;
+}
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
new file mode 100644
index 000000000000..c7099e7f463f
--- /dev/null
+++ b/include/uapi/linux/amd-pmf.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
+/*
+ * AMD Platform Management Framework (PMF) UAPI Header
+ *
+ * Copyright (c) 2026, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * This file defines the user-space API for interacting with the AMD PMF
+ * driver. It provides ioctl interfaces to query platform-specific metrics
+ * such as power source, slider position, platform type, laptop placement,
+ * and various BIOS input/output parameters.
+ */
+
+#ifndef _UAPI_LINUX_AMD_PMF_H
+#define _UAPI_LINUX_AMD_PMF_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+/**
+ * AMD_PMF_IOC_MAGIC - Magic number for AMD PMF ioctl commands
+ *
+ * This magic number uniquely identifies AMD PMF ioctl operations.
+ */
+#define AMD_PMF_IOC_MAGIC	'p'
+
+/**
+ * IOCTL_AMD_PMF_POPULATE_DATA - ioctl command to retrieve PMF metrics data
+ *
+ * This ioctl command is used to populate the amd_pmf_info structure
+ * with the requested PMF metrics information.
+ */
+#define IOCTL_AMD_PMF_POPULATE_DATA		_IOWR(AMD_PMF_IOC_MAGIC, 0x00, struct amd_pmf_info)
+
+#define AMD_PMF_BIOS_PARAMS_MAX		10
+
+struct amd_pmf_info {
+	__u64 size;
+
+	/* Power and state info */
+	__u32 platform_type;
+	__u32 power_source;
+	__u32 laptop_placement;
+	__u32 lid_state;
+	__u32 user_presence;
+	__u32 slider_position;
+
+	/* Thermal and power metrics */
+	__s32 skin_temp;
+	__u32 gfx_busy;
+	__s32 ambient_light;
+	__u32 avg_c0_residency;
+	__u32 max_c0_residency;
+	__u32 socket_power;
+
+	/* BIOS parameters */
+	__u32 bios_input[AMD_PMF_BIOS_PARAMS_MAX];
+};
+
+#endif /* _UAPI_LINUX_AMD_PMF_H */
-- 
2.34.1

