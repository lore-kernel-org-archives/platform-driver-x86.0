Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF6530C15E
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890555; cv=fail; b=I409Oz/4px9LkUtwqOvsx4inq9bK4WRQR2DzLnupHh48agRK3W2i+wRTgR7coGTrv6q284e5lgGk+QS54xyvFSMmBMPndSI37ew8rh9fWRh9vKnW3NMmlbn5vOraBfhmok52xx0zbeaWBxpWmzgyan99ZnD2HzZ7A9RBxaRQKv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890555; c=relaxed/simple;
	bh=yWAlT2/5G6blwMyj8C+wx4C6KqEbLB8mjfSTHSHn3zQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pLMzgkE+eDWMnLNOydxUd9KQr5UDA+L49qpcFyeHEoHamDcFGUa2EbylFtYPUDNbrtL0E6923leWHErsl1WwZa4d6GlrdNdu2YSQTHD3FpqLk2bCPlhIRlU9zXYpG+Wu7k/5uA4jmKZ55w6xiGRlKA+HMf3wqwaP/5Uh4lPtja0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MkXvLrdv; arc=fail smtp.client-ip=52.101.46.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MkXvLrdv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nk1bAIUkwoKgfYqWgVe8dPwje0GGZQJdPaON5D6WktCmbIzC5qgXt4Rzy7cSBnQ0YqsZPui6s3GlPADaFDnsu2AolWwC8SgNKP9SKD5T7yPg7fF6QCsi0vDcvLism/SKzf5JFZiaBzRJuJVlyw1iRwHJTJeED9UkcI2M6rq7DSV/WsMR5KN4/XSLNne8nVcqnxliO4NK4TOeToZfNIgRRuhE8UtpSv0KvOeWD2xKPlo1fhY9Y1eFjfwn2i7KQbR40Jn75TRiWSTa3cezKF/GEvIdC7j7Jn/yNswEorRWBhP6e7i9gk+wL56nYruduoPEE7Z3z2WQPcQIl3PxXQYerg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3k83fBxUhf4+n92/3kHnmwe9vwzcKPGLPzOnGV3UjY=;
 b=mbRx2jwD2o7JvGSl9QjL3j/fNxzgVzxMPgMCHoixKd2vidvOs5xTBVfdFnyI3FkkzXqbE4AiQGWv8611E5dmL/14ViBddmbkqH0BphNeXrWMfXGs2pA/sl9ZVCgi1evPa4aDOXB2f4Z/T/e4nn3puBhqYuIkK2LMXa+D6oX5cmFffO1nuNOMpCE+voBWWNwjNOavmnKQ8HIwE2Jxy9Ba6pUPDnaMERWPsyQ0G0dqDtFv0Q1GAS3rVxcHpSoBULNbiGyVCtN+RPZAbUhc9EnQa5Ty2iKucSS4wB8qCyDbRqg+mVA/+D6JmFxn9WoEZlSvWz4xi5c1trDrMhUkWG3IZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3k83fBxUhf4+n92/3kHnmwe9vwzcKPGLPzOnGV3UjY=;
 b=MkXvLrdvbJn+eG7B7oDITlsTbqPlvO1nwvM7pJFJFlIUbMZPKxKOew6QWHRdt893BvGmsCYSp9t9n29o3ghwa5umjdDwasa2D0bMfjoDh4jgKW1PLttpFBDqucTMONw730qUWJkybzDsQwOCAXPdSHYH685iDSd6F77YNTP1N4c=
Received: from DS7PR05CA0100.namprd05.prod.outlook.com (2603:10b6:8:56::23) by
 IA1PR12MB9498.namprd12.prod.outlook.com (2603:10b6:208:594::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 14:02:27 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:56:cafe::77) by DS7PR05CA0100.outlook.office365.com
 (2603:10b6:8:56::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.4 via Frontend Transport; Wed, 27
 May 2026 14:02:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:02:27 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 09:02:26 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 07:02:24 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Sanket.Goswami@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 1/8] platform/x86/amd/pmf: Add util layer and userspace character device interface
Date: Wed, 27 May 2026 19:31:58 +0530
Message-ID: <20260527140205.4073335-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|IA1PR12MB9498:EE_
X-MS-Office365-Filtering-Correlation-Id: 007a7b43-df17-4308-a817-08debbf895bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|22082099003|56012099006|6133799003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	aWHmyo9wqfdOxsVXYgR2lXQG0NkJgSJj7FNt18eWYAqhp0s4ABcoV6hoTjBHuLzFrXn5y5Z4mHKFAGXWWL/HKRIpUMI5ul3yAJjX0KxaV41nCFtTDgzMME6G7iVO7qiAAEs5fgwstczur0Jwub4Jt4EuhPUxXdh9BWe8kmRkeEaxSViFvq82xYfUzlSjqHOuaeN6OxYXgTqgU8Pgsp28pAxCqhJAvcasbBpPo3d+DXoZZmO6vsuA9Jv3djpjrr55WAukjpA27p3TbQfqwCEp1AJUAa0DNxZrAKUKSYMvLh68bG0RBYlKHkzYFI+RbR1kW+fwTy936+TBGBeed/pX9riH0qnfqf9TsYWwnMbJZSLCmDL/yC7SpFSxRwy6FO5giocVOjNQ6LFze1akmSj8XcozEMi2ssQGJRzogc1PgepWmtFOUZqzW+SoqPd12pVGzqo+4JHOG2j+AqYeneynwe8s6tQknSaicayll1DgbRU1JBjK+geaWwjbzmaZ184HhIvAjkIxdO0NLwCJ+673quZlZsH+lO+8NJideorVy16LxNCxlXk7VcSmSirsM7+NaiTZmwfB89oiQ+eFZpcR2uio6789+qnwfRoun6CFrwu9SxdG6LTv9bmRehiPRxgCwAF8wCfJhOPRbOpiDhEJyJWLpcndRfCqlxcQX3cyp9j0KvOFER9piIL2TmdiUbPns3zRkmAQJ3E4vBvM7nifoP8PrVaWLRgKsQpYVjBcDag=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(22082099003)(56012099006)(6133799003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SnShjMSnINvDTzXdMlPBSyg+37UrrG1HxAobxZmIJ8ASH0lPN0pRNCE1BJNW/+K4anjMs9dQbuXBqJBokNyb/O1wiCDaWrJZsaJNTNfXsAs+4tNRUuuIbpTZpuQBWrnPt7bzDOfVl17hqRNNlfx3vzVyi4VJgra5R3RMVXteZAOUw/Yct4GEY2dceh380pWPSgN9biV+kgmIgdNOMG17Q+pnE4LKra9Tujev/KQ6e4gxGYR8Kjd6iNW1rFg86KU0zGTUlbOrbsLKLOsRMdJ6c9vFBNaJV4fNY2BfADajsxfIXzSd8JY8WESCBucFqMsnbrKVS9v4eca+t2FM9wy9GKtAFFGsehYMyMmhu/Mz2Mc23BKlQdEe1TlWLgb4o0nsKuU76jEd8QXX7oUFVBgSrbFUuKNSnld0RsP8BWZdP9IVEU4OsTg/emR2484IsXad
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:02:27.1484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 007a7b43-df17-4308-a817-08debbf895bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9498

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
 drivers/platform/x86/amd/pmf/util.c   | 68 +++++++++++++++++++++++++++
 include/uapi/linux/amd-pmf.h          | 60 +++++++++++++++++++++++
 6 files changed, 154 insertions(+)
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

