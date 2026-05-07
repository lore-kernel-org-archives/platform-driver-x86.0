Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012039.outbound.protection.outlook.com [40.107.200.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283403FB7FF
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165169; cv=fail; b=NYWCgUFcJ3w7DkU82zD9jhu+yHSgA1nhq2izx7vJ6W3agHdwMvaiizm0KZRDkRw8vfZvgfOVy+ij3Uz/2zuF8elBUyOPGYooObuDXfrPSFOsRJ7UnhhsjR7PuXy86avjClMEkc5XDT/qREmr2ygpQm9Gr3P33EHOrC6J8IHkPQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165169; c=relaxed/simple;
	bh=116bNDsCSFVmyoTF3WJ2AZIH6DFe79JeGJMaV7hg01A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bhBKZiDJKJnJ7Q4rvOzGqwWnAILXnF2Xl+XWDxZLpBwma3D51cz5UTWB/e4iuccxX5G0ac/SB+/aOLB6CV5Y5FlIC020S6H4x8d1TGiqYe+1p0KVuEz6rEpygHYo4uM09DGXZbGcyMFyRJ6iMjPpYwZlIwI950mrDuBmkrV7tjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yu62E0Tu; arc=fail smtp.client-ip=40.107.200.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yu62E0Tu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqO76yHF+l8W4y3rCNiuKcxlbvNcMvOpZsjMQqfBd54qSIZp9YSgLabxFfYFjy9iaQ8ib/bPWiMuG0q7V950exjNFUrGg9nrSMRxJq/6RVlru0QRRgR1akFL0BipH2nsH1vE+scvl2JTPgnXSdjKjgb5V3AhVnX+tQnhm6+i5CI3vk4E77EykpdYRk5M8EPELWIDUN7HAZU1+bsfqNjt7rRBZE7fcgwlQJgBSTDDsTnbHuzIAIBGizXilJ0nfGPNo2QG19amRAXXjgPbEftKqAxakYOtgwf4LAPYK6wl8EamUxZN30yX5V2YIx/YVROL6OTeRA2N0gDh18FxVAO81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0Nw5nNQUbJQCrB/ib5QnsLb9YF9g6XpyJ4dGf3Gg94=;
 b=pGstfbVnkt22TGq1qnxuh6VAHmjuojGlhLdstn0CGruTXvTlAbe9TzDC2nu3ENtEEZ4GVh37GTTz1hnKGmaDaGHFJkueikKvPrC/zKhI47yvLMs+IL+yYtReqI1jiPnwgsjbKBiQUb8RIt2Evgz/YNg150kbZK6VUDD6hGBH4+BTitkb3aJspSKwddRhAcbxQXip30HVmlaUAClJhGW99vtW7D9ZkY3mkXd4zstOqiH6D3EAqmuvxdCVI6yesMA/0DU/KDPUBZhyeKODdicOUrs+I9eU6cXXQUJ8MAYLjSw4FyTe/kNfkzmQpG7PQFsey4qoETQO/MZYf6bGMfSSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0Nw5nNQUbJQCrB/ib5QnsLb9YF9g6XpyJ4dGf3Gg94=;
 b=yu62E0TumU2aEUNti1paDV83w1ojm4GmgxGJWmh/e8KVuGOybTZ2cCMG0ORd/Rcjel5iDj9LwVxerBHgGCyTuq8WFaoO5ExjcGn4gxi3V3Lruce1PT0eH5KKIBCrBP+wurfnl1lL6Tm2hUi16w03A6jMY9HRFTaQRUo/OJpDwhQ=
Received: from BN9PR03CA0590.namprd03.prod.outlook.com (2603:10b6:408:10d::25)
 by DM4PR12MB7526.namprd12.prod.outlook.com (2603:10b6:8:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 14:45:46 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::c7) by BN9PR03CA0590.outlook.office365.com
 (2603:10b6:408:10d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 14:45:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 14:45:45 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 7 May
 2026 09:45:41 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 1/7] platform/x86/amd/pmf: Add util layer and userspace character device interface
Date: Thu, 7 May 2026 20:15:18 +0530
Message-ID: <20260507144524.664001-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
References: <20260507144524.664001-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|DM4PR12MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6d29c0-fbce-443f-34e8-08deac475201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|3023799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dwcYdhDPjrQ3gjT6G3qZAZVc1mfh88O/t7oNg6baMI5n0dLkso1EGLCAUt1DU6i1CZlyRsQY7JqJ8AA3hTKyT6xCBWREraveMNR0mINQT9WY3MjIQ73x9bFQl9SrnVnstpwAGHOuWoH8o2fW0UHtS74bwNizN3D5WGzSdiRTbu6tlm1JIukNtqifm5nPBSiDJen4R5T5/6Sx0j4DhaQBLNPd15a30pRn9DbkzUg8y/tWl4ZWoIgX4f3Cke5egjBb5IuIYwtRfGi4HzoApGhSEccqA9VkYYSv0vzPV6sjDgh/ejY1K0ttZevgiDuRB/WIK7Ntpqw436xGaIuD1M/Z5W7sjEG7Bo7FKzKO1CiQoUUU1raB40Bt+p7CB77VggtqyF0iHanZ0ICiYOUeeGIkOEK6QLXetQUSSofou5ZIIACFxJZFjGtGn98Yi/Ewgb5pZ1Z63o5wl2dJ3CPWRaQsI6U77ocXRUQSJGiE8WHH0u2e1iM3BVAcHgLO5IKzkABFosZA1CTytY6PziVvkDDm9n+pQUiY3iiABIdRPdNZSDuYJeAx2iA0bE7VG0RtcYNiWOW+f+ENZ4oAook5adGaEtV2AJtPteMosU6OQ+R+ZZcaCzLc2N3CtEkMy0so3Tv8TX3U0VNaGZshVE3KqhKl2GcKxKF8FX6BmtIknASzA6RfuFfFx/tS4EatQ+JHnfqSqZKdg8SOasUW4/OugfOf1kLiPPKAQg/tV/lqUVFZU5k=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(3023799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ME5hGUrNbvwsHezd2wdXtaEnBjcsvSB3hoBgoDhpGCqy574dACXhJYrwupZXY4AY1MNw2g8oP3jlw43oo2uG7gqJmPleJXvBQdbHvPEKuCcMu9sTW9nZ7umgnYQ1ieStoYdUxm9JcYFbTGmEodzOfHwNc6sOHsc5yeAqwyFdPHYbDr+SUWSWCL1yCH/+16bR/XVX054ft5XVfRUHQjir0J8v0WH5awVa3NgEgjBEqU0gPtbyZEf0YDcwpR82lzLAI0opzkAK0uK66T9MO35iOWssQ9uKHP6QQe4Uv94unp56Tb2sPbKGUIEeXNI56J9JOIQqBchdWBSN4b1jl/+0BeIkNNHOuTiPgFyXIJHy7hYDvVsx898pkw24ogtkrTeImu9V0g+Qc38atqrcv/EqMMdh1QzrHiQBFdnmiEo7DV5UPI7kSkWfDsAsjLI9QJCK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 14:45:45.1326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6d29c0-fbce-443f-34e8-08deac475201
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7526

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
 drivers/platform/x86/amd/pmf/Kconfig  |  10 ++
 drivers/platform/x86/amd/pmf/Makefile |   2 +
 drivers/platform/x86/amd/pmf/core.c   |   5 +
 drivers/platform/x86/amd/pmf/pmf.h    |   9 ++
 drivers/platform/x86/amd/pmf/util.c   | 139 ++++++++++++++++++++++++++
 include/uapi/linux/amd-pmf.h          |  63 ++++++++++++
 6 files changed, 228 insertions(+)
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
index 000000000000..6682aadfea2c
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -0,0 +1,139 @@
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
+static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
+{
+	struct ta_pmf_shared_memory *ta_sm = NULL;
+	struct ta_pmf_enact_table *in = NULL;
+	int idx;
+
+	if (!pdev || !info)
+		return -EINVAL;
+
+	ta_sm = pdev->shbuf;
+	in = &ta_sm->pmf_input.enact_table;
+
+	/* Set size and version */
+	info->size = sizeof(struct amd_pmf_info);
+
+	/* Device States */
+	info->platform_type = in->ev_info.platform_type;
+	info->laptop_placement = in->ev_info.device_state;
+	info->lid_state = in->ev_info.lid_state;
+	info->user_presence = in->ev_info.user_present;
+	info->slider_position = in->ev_info.power_slider;
+
+	/* Thermal and Power Metrics */
+	info->power_source = in->ev_info.power_source;
+	info->skin_temp = in->ev_info.skin_temperature;
+	info->gfx_busy = in->ev_info.gfx_busy;
+	info->ambient_light = in->ev_info.ambient_light;
+	info->avg_c0_residency = in->ev_info.avg_c0residency;
+	info->max_c0_residency = in->ev_info.max_c0residency;
+	info->socket_power = in->ev_info.socket_power;
+
+	/* Custom BIOS input parameters */
+	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++) {
+		if (idx < 2)
+			info->bios_input[idx] = in->ev_info.bios_input_1[idx];
+		else
+			info->bios_input[idx] = in->ev_info.bios_input_2[idx - 2];
+	}
+
+	return 0;
+}
+
+static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct amd_pmf_dev *pdev = filp->private_data;
+	void __user *argp = (void __user *)arg;
+	struct amd_pmf_info info = {};
+	size_t copy_size;
+	__u64 user_size;
+	int ret;
+
+	if (cmd != IOCTL_AMD_PMF_POPULATE_DATA)
+		return -ENOTTY;
+
+	/* First read just the size field from userspace */
+	if (copy_from_user(&user_size, argp, sizeof(user_size)))
+		return -EFAULT;
+
+	if (user_size < sizeof(__u64))
+		return -EINVAL;
+
+	guard(mutex)(&pmf_util_lock);
+	ret = amd_pmf_populate_data(pdev, &info);
+	if (ret)
+		return ret;
+
+	copy_size = min_t(size_t, user_size, sizeof(struct amd_pmf_info));
+
+	/* Set actual size being copied */
+	info.size = copy_size;
+
+	if (copy_to_user(argp, &info, copy_size))
+		return -EFAULT;
+
+	return 0;
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
index 000000000000..fa6aeea38c22
--- /dev/null
+++ b/include/uapi/linux/amd-pmf.h
@@ -0,0 +1,63 @@
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
+
+	/* Reserved for future expansion */
+	__u32 rsvd[8];
+};
+
+#endif /* _UAPI_LINUX_AMD_PMF_H */
-- 
2.34.1

