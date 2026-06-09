Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013025.outbound.protection.outlook.com [40.93.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944DD3EA97B
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 08:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992712; cv=fail; b=hLMNglh0yAIJea9UHMBLhOVA6es7+DWdSpl1s0gnDCtFSGtGnChgo/8io0JEqbqVSNlAtKTurjDyfnqMciwzn7MgUbEWMbagcJpV4dMyIVhB2rNa1319PvCqRZA9OF3XqP11pJhwDah14oNq0aQ3ufDbNe3RoGpjREkaNoibTu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992712; c=relaxed/simple;
	bh=ryLM01Jhkqs8MNDyIGW48RFT7K/8j1Kn9JaLw3DtMNo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b7bJQ8rLTgz4J7/MfnLYitF8TwSoyENJs7BJMzjStH1hQ8rHXqwgMZ8S8PXJxGxQsyRavv4DtF0vNQgSLI2HulqBUbJQ4cGjlERpthcQEC7M1t24LBYWSOX11jlM1VYUwmxE7okWp5IG08+0VjGNA27wpwb1bfkw56IyBa9qeok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RWOlKj5Q; arc=fail smtp.client-ip=40.93.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RWOlKj5Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GT1aPjbPB2LoeBiaEwz8sELGWshm8X/fj/NBUe/4p36IXxuEZxrCv8JtubASJv6FD10qoPo4T9gxtuF+NSbl4qdQvfNilM7hdFcz+yFDtPqf8Vs0X4LtpbBH+4qnSlf/zp27BtM99VXXkvnA72/ANhrsQmtrE3GNXptXKFKWyAtwgsm7LAuS1PtgBzkOP2fvYSHmMR3LAh2Gb2dTW/Auq1PWU5OnBi3Ug5kiynji2qFHgLEqG33jB3qtkTbPnSF6jiWU9scGiHkLAmM1R3226wpokFvFd5qfUUvfQ4/EyVoe2hRjDG/+FLxLwNW1iFeeAPe0kRL7+zpRqXOHuK8wOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OD+UM/gGguru1ddRkL+zWfWi5APc3hLxCz4BGIW7kNc=;
 b=werZ44aOMIog5rsJVt8XL+5LTq55AQM+KpLEc4yV8oVzQo9UsP0y7T+rr3UFeBeeLIG90sVrLUJcyoTgUsmhXvF1twgURECTz7tLyNcov5SACJKdGg9TIkEhC/ECs3qfTkhEmnt8LK1M2Hg92MyMnV+bKNOBj4qlPxPhKtGI55JJ/I84gVmD4+o/4MBdX6k4gRnpc8OEXIbPznSc+ijvogllETFczAquUPhcqrNWYosnl/vca4WHI57s+7oGJygoe7TVuWmq/hHQxNxs+f+YtdNvermznKC59qWO7nAuUZVEFGQ4f0iXxL58M/idet3MnPHjZV9bxBUhcVElfUs6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OD+UM/gGguru1ddRkL+zWfWi5APc3hLxCz4BGIW7kNc=;
 b=RWOlKj5Qd+XhhWFm64t20f5VelD6T1rNKCqKsdWfGfUmajhzOgBQp/gFJu97bVqGXFm5efoDa7aeqWenxphBHvcvn51dk+5096i4MpwSLpOXdPE09KQkYTpNUGTiWQkw5PosttXAEiZkAK64rAPOLDAmYNB5veS9+hTrgxmd6jw=
Received: from BLAPR05CA0001.namprd05.prod.outlook.com (2603:10b6:208:36e::6)
 by LV3PR12MB9144.namprd12.prod.outlook.com (2603:10b6:408:19d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Tue, 9 Jun 2026
 08:11:43 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:36e:cafe::51) by BLAPR05CA0001.outlook.office365.com
 (2603:10b6:208:36e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 08:11:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Tue, 9 Jun 2026 08:11:43 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 03:11:41 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 1/7] platform/x86/amd/pmf: Add util layer and userspace character device interface
Date: Tue, 9 Jun 2026 13:40:38 +0530
Message-ID: <20260609081044.2416731-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
References: <20260609081044.2416731-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|LV3PR12MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: b65869f6-93d1-424f-017d-08dec5febe58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|11063799006|3023799007|56012099006|6133799003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0KxGFVykpdR87mn7wH34RocNdEepSx/p8kO8RAb3QZoxW3u+hWP6AQws7Z+LTPJMNivg3yYsmWu1FBjkAvPvQllsV3RsGU8oPLz3mmxquHSx5KoGZZJvZevRtXUepbfeCwSez76wpJ7piHiw8eYHn34OJryvo5VvPZ/oS7VviUIAjtQwjwcKyqzoLk5awEiVKxStFj/CnbgWS7/1oFke4chK7woAZYW0a/Yhe9JE6PWxteuWjCQEoZXty1yqHNeoNVo78tdxbRbziYRJBgtWBudH16e3P5/iD2jJzD+mPDQzSObll2DgX3K1BZ3n/GGFUllpm9RGKMe52ge7vhpyabciGN3wZovYdDlbfCjHZWzm/Az8Q5IhdSKiy9rBPTc20DZR7TyD6judX49LlWnl6T0G7y2nOEryEr/Xca61Co4uAoL3QO/6mW+Z9gFMeyOd1Ozor9jtfpcY89zJ8OSbCVLCfedFVArIEuxxEioAeiijJTQSuCV/sF13Wa0mqAp1dJZCf2C5nntkxW6WSjNupMBWjCY9VBMJjhQAyrrae6En1BB/ZTKfrFdFLYnGFir6flfRcC5o2emJuNmCe6r0Xk/mghy7CdM+IJKNVUTTOnbSVk5+xoo/aAdT+FtlgU63VX2AXSROsTLRpp90qnkw1JDgAmpBpeskHvTB/qmowN4V7ibnfUvD//9dN7IBn54n+INiUKH9+qPo6Be6t8eqDTsEW4L/8JRso+8Rw67pG9E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(3023799007)(56012099006)(6133799003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	reKZ6Ow/OSohAIfXU/AabkfRLjoIMP7MTJL74Onx6k79JArfeutD3cntCP7AM0j5WHVx8sEsBpYSx0VAw2EBOKPwzPVWY4unVE7lD/xXq0clCEXRuFX6str9kq/LU9B9TQ5pt/CQ9zjUqZtKzR1lq2FtljcaPjEsDbnPdga9VwQTgCx2SJyHPNgCschGW7hymT8QXHDb0Quu66n+Sa4Yj5asy757VNKQT1Vx1daATzeUzrSWr7TZ24HvDdqVd5JZEYs9YTkoV6uVaTFurO0DiFfPpq2pjFWurfV67SrQF9OokItP59Ypk4JB4EKmcpBeq7JnmCsaDYRdcJnbrSMZsgpcBsIZ1ay7Xo0rcsfylEn4s/+Z/4g/ZbnBwT6bvyn+LyjciAACSb/MizdHkxYT4m5/6ljox/FHzUTNyLxyHZRmyJ0Zl3+b7EKk48azn0nt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:11:43.8589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b65869f6-93d1-424f-017d-08dec5febe58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9144

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
*  Auto Mode: Automatic power profile switching based on system activity
*  Static Power Slider: User-selectable power profiles
*  Policy Builder (Smart PC): Action based policy management
*  Dynamic Power Slider AC: Adaptive power profiles when on AC power
*  Dynamic Power Slider DC: Adaptive power profiles when on battery

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
 drivers/platform/x86/amd/pmf/util.c   | 68 +++++++++++++++++++++++++
 include/uapi/linux/amd-pmf.h          | 71 +++++++++++++++++++++++++++
 6 files changed, 165 insertions(+)
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
index b9e5a2cf3aae..58d86b4c2828 100644
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
@@ -643,6 +647,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
 {
 	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
 
+	amd_pmf_cdev_unregister();
 	amd_pmf_deinit_features(dev);
 	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
 		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_UNLOAD);
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
index 000000000000..f8a283192ffe
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -0,0 +1,68 @@
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
+	if (pmf_dev_handle)
+		misc_deregister(&amd_pmf_util_if);
+	pmf_dev_handle = NULL;
+}
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
new file mode 100644
index 000000000000..bbbd39b2ce15
--- /dev/null
+++ b/include/uapi/linux/amd-pmf.h
@@ -0,0 +1,71 @@
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
+#include <linux/bits.h>
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
+#define IOCTL_AMD_PMF_POPULATE_DATA		_IOWR(AMD_PMF_IOC_MAGIC, 0x00, __u64)
+
+#define AMD_PMF_BIOS_PARAMS_MAX		10
+
+/* AMD PMF feature flags - bitmask indicating supported features */
+#define AMD_PMF_FEAT_AUTO_MODE			BIT(0)
+#define AMD_PMF_FEAT_STATIC_POWER_SLIDER	BIT(1)
+#define AMD_PMF_FEAT_POLICY_BUILDER		BIT(2)
+#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
+#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
+
+struct amd_pmf_info {
+	__u64 size;
+
+	/* Feature info */
+	__u32 features_supported;
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

