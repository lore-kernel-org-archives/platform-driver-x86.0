Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCF9213ED1
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731431020; cv=fail; b=SDaHGllVQhMJTs1xvb06YvT3OJ4m+KxmkSdEUfr9EZiy+/F3SLI1ptXyVSqPhGZIIQoUMG2ye2+QuNNa8bSLX2V3ZYBAw7nVMcKHphv2BkZgcJ22UrMEVNfkRVLp9szaDld1lVMfix9k+SAKQW/Go2NrIdzSj+0ZsFfkPFUXePk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731431020; c=relaxed/simple;
	bh=SwBYiCM5EXgtEYypKi2gNNAYd/mbzXEsjrbmUAizUQ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3zsE/+oOMMF7ltiWZH04YspoIdSyBJVsTXawmk58XEC2RdaxZKdAbcXJIQzjhTfvLw6yq4HCFfUmNj6Y9JYraKrJvkKj/lebhV5Ur9ARUgjSFn1KIBlZC7/kwrwrkebXKYcCCJLxz9B+lK02yZkeZY22NWOFuCmrQ5N+8FhJqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ogq2apIj; arc=fail smtp.client-ip=40.107.236.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ogq2apIj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwFYSi5s+OnxWm3QhrB+FnOuDRjQz41F1hOtoFXF7aXJdAXFdm8eCTgsr5PJy9leT2l2hMACXDeCJdX49WlPnGQK96ZsjrdF3UDUoNVWBj3c1inf0YYhk257bVNo6dkJ4fPyXmwcwl0mMoqhKSgAvscRQM6pVcnEDgLP5VoftYNuJvM9Jr8yBGByO2zxOPvXpTuGVyG1GjOcDyaOGs4sIHPZqoLyQnmNf/xznaYjBzGVOvtafiCy+h6zmSPnXRIZlizlrGf0b0i1Ord0iteToKh21rtZBrxsgbSlvPfE3vQ3B78BMp2ywPq0i5ylmHruqlc0VYlSLG7zozKykruC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29yLqLsjae75YWUi+9VtSZEdWBMcF+HTguprzyOw534=;
 b=wbOBRiktlEHw4mUO+9RwY0N9VGJQBMbx/PhPMWVLYuysKBBNyTMYUDeCmAXZUEaqtBGjLSCsVW+O50O9WBvLm0oa+mD2XaThfIa75lR+oXYozR201zz1q9c2r13wgY6RjPj75Y2mZ9u/FI1dZ6ytVYVAyv9IVS3mfGj4kURjiEIh4xnu6ycPYG4I6a9aRx9HXgHjwgdIshP77azugGN0dU/vdVNagB8wqgyyb0pnLnqeEgIcSfgvIZDKHIy7Fd/3/RHSi8TKESrKl7LYH4tHL382IK22Mb+mZp/zXPncz5I7zTohDhuMpjcGmm5OF4HB6PYRaEVwmqnNYhwQCd96Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29yLqLsjae75YWUi+9VtSZEdWBMcF+HTguprzyOw534=;
 b=ogq2apIjWQO8niIPjQyuOyCOfGOsPh5gxj/hv+UqAqF+uJlaKxY7bCN/1G0GpzXYhq5d6qtWhO/Cf2FQfZbX+KFKv2mWXySnq4rwso3pZFby6UK8UcX/vs5OO9hYXCPdwnsq7KViHjvBbdKSk3bmzkm8qXuKhAiCRChol+razow=
Received: from CH2PR14CA0009.namprd14.prod.outlook.com (2603:10b6:610:60::19)
 by MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 17:03:28 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::6f) by CH2PR14CA0009.outlook.office365.com
 (2603:10b6:610:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Tue, 12 Nov 2024 17:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 17:03:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 11:03:25 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v6 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache optimizer driver
Date: Tue, 12 Nov 2024 22:33:06 +0530
Message-ID: <20241112170307.3745777-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241112170307.3745777-1-Basavaraj.Natikar@amd.com>
References: <20241112170307.3745777-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a0dfec-9c23-4969-7bb1-08dd033bedaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+scLbTnCitqdpUYoObcKOZFF1l/rKo6vBm+rRunSVb4GKOjdQWISEt27sV4Y?=
 =?us-ascii?Q?fLaF9SKS6ZGNI0jjsFKC22p9A9+6VaMhRY6lmCYQJkZ/FE4+UcVmveW4UxQR?=
 =?us-ascii?Q?Ei9G94kkJGD3TM0RWrWgANzV/YiS6yvsshGs5PMfjvjeTS1G6k8/Ua/R/yuG?=
 =?us-ascii?Q?vbNI5C2t4SEWmPhaj382La/UUik3yxc0CmLWEZ/Oc8SDXxC5iN83wpCM9WHG?=
 =?us-ascii?Q?z9l1k58QWA3PmPDlKTE0cuvOxz+hdddQiv3oZ+Vlska8fhxqwXxNh3id7E0r?=
 =?us-ascii?Q?sbmLH2ILFHywEeshW9h9eWT363lk2hp3CXKFsz8v0N0OuDhsZ14eSK3ShNQ+?=
 =?us-ascii?Q?o/GfwDkd7yoK3QrNR9f4AR/7xo+/B1cCipjuMt6JG8JeFCThK9G+qjlo/UaD?=
 =?us-ascii?Q?hQta05veFP6j4cDqMBUg0m9NdtuoczEBzGGPByVWrm4WFaW1yRAImm8/zpF9?=
 =?us-ascii?Q?29VrsPhGAyGi0WK4nin2vNVIw/ho0S4FXzijTbEKmFTN+IzTwTTUsNoxqK/R?=
 =?us-ascii?Q?GuC8/zzBG6wa0yrD0ZFBgb7wWKCeD920sN9wOKv+gwft5Qyxb31CV9KBPalt?=
 =?us-ascii?Q?ugAVc29ZoYJfxvTRZMVHCJ5fkvDtloKV85QcmSieoF4BTXRBGpvBLR/tBFwb?=
 =?us-ascii?Q?ZeQxGcxd0OptZWMG1J34Ao0/XYTckAB95vB426dWLuSRUESkizHo4xVdFSYg?=
 =?us-ascii?Q?EyEWtomDITkvOcJbz/Bq4gbOUYrhDB+kqcE5zHNVQ+7ndU4nHFXKnFpOypgq?=
 =?us-ascii?Q?xMUBd/Gb0woXkP0jLBoLBRhlmWoA4AngMqTYY2m8hoZY8+7HyeaL5J1huCQ/?=
 =?us-ascii?Q?wfLPcLK4c057nNjE/Q6cvHYKes+LR0cuaFBB45Z8uanACCeEnrQ0l+jXNS7X?=
 =?us-ascii?Q?OaQgGlH4HzQYQPCvOGDa33GJaCU+PrrTVuV2KABEtFeWn1R2jhoalFdIaT+b?=
 =?us-ascii?Q?PHJyvk776mEzSuaDRUbs4UZfpsPpYWvEOO9xrvw8gQucK9ImrJ9Vumzqan8H?=
 =?us-ascii?Q?+oRFHoi2QLTHsXJn+ain0EyP0qsXWQB07jgBMx7XjhLRVNKu1L3fDrhwlyJw?=
 =?us-ascii?Q?0GEwLLseoiX9n9e1zuYHMSEiA7GfHYK0Z3dbpDzVbTZGvvExt3DYqDhTd6mZ?=
 =?us-ascii?Q?3lg6JL7CqsgKpP4wUSS4Y8+s2x/2cvrNqby9hdhg/xcRSsamv/NRI4iQlHOG?=
 =?us-ascii?Q?NM8oJ1E+hLjdTl65fppxUghuGG7Ew0LRhYUkfDxnc95/cqucN5jiFzkFmMM6?=
 =?us-ascii?Q?04sXS+eYVvWfJHG5Rzwew75jjaHabTmsZR2ZrWHbVhT/od/KPDThtfytCDpO?=
 =?us-ascii?Q?b8tOpjjhZ+BL7SFr4JrOHgfqHkt56ANO0zQYRL0UPnH7sZJLXbwfAdgCjWIM?=
 =?us-ascii?Q?QLNzC+Lz8jTYB9IqOI3QdZR4jDRDkXmSdd0yk/m3E1BjvNLsAQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 17:03:28.0867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a0dfec-9c23-4969-7bb1-08dd033bedaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125

AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
switching between Frequency and Cache modes. To optimize performance,
implement the AMD 3D V-Cache Optimizer, which allows selecting either:

Frequency mode: cores within the faster CCD are prioritized before
those in the slower CCD.

Cache mode: cores within the larger L3 CCD are prioritized before
those in the smaller L3 CCD.

Co-developed-by: Perry Yuan <perry.yuan@amd.com>
Signed-off-by: Perry Yuan <perry.yuan@amd.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 MAINTAINERS                           |   7 +
 drivers/platform/x86/amd/Kconfig      |  12 ++
 drivers/platform/x86/amd/Makefile     |   2 +
 drivers/platform/x86/amd/x3d_vcache.c | 176 ++++++++++++++++++++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4803908768e8..087d76c1f6bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -966,6 +966,13 @@ Q:	https://patchwork.kernel.org/project/linux-rdma/list/
 F:	drivers/infiniband/hw/efa/
 F:	include/uapi/rdma/efa-abi.h
 
+AMD 3D V-CACHE PERFORMANCE OPTIMIZER DRIVER
+M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+R:	Mario Limonciello <mario.limonciello@amd.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	drivers/platform/x86/amd/x3d_vcache.c
+
 AMD ADDRESS TRANSLATION LIBRARY (ATL)
 M:	Yazen Ghannam <Yazen.Ghannam@amd.com>
 L:	linux-edac@vger.kernel.org
diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index 2c671cc17d63..c3e086ea64fc 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -7,6 +7,18 @@ source "drivers/platform/x86/amd/hsmp/Kconfig"
 source "drivers/platform/x86/amd/pmf/Kconfig"
 source "drivers/platform/x86/amd/pmc/Kconfig"
 
+config AMD_3D_VCACHE
+	tristate "AMD 3D V-Cache Performance Optimizer Driver"
+	depends on X86_64 && ACPI
+	help
+	  The driver provides a sysfs interface, enabling the setting of a bias
+	  that alters CPU core reordering. This bias prefers cores with higher
+	  frequencies or larger L3 caches on processors supporting AMD 3D V-Cache
+	  technology.
+
+	  If you choose to compile this driver as a module the module will be
+	  called amd_3d_vcache.
+
 config AMD_WBRF
 	bool "AMD Wifi RF Band mitigations (WBRF)"
 	depends on ACPI
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index f0b2fe81c685..56f62fc9c97b 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -4,6 +4,8 @@
 # AMD x86 Platform-Specific Drivers
 #
 
+obj-$(CONFIG_AMD_3D_VCACHE)	+= amd_3d_vcache.o
+amd_3d_vcache-objs		:= x3d_vcache.o
 obj-$(CONFIG_AMD_PMC)		+= pmc/
 obj-$(CONFIG_AMD_HSMP)		+= hsmp/
 obj-$(CONFIG_AMD_PMF)		+= pmf/
diff --git a/drivers/platform/x86/amd/x3d_vcache.c b/drivers/platform/x86/amd/x3d_vcache.c
new file mode 100644
index 000000000000..0f6d3c54d879
--- /dev/null
+++ b/drivers/platform/x86/amd/x3d_vcache.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD 3D V-Cache Performance Optimizer Driver
+ *
+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ *          Perry Yuan <perry.yuan@amd.com>
+ *          Mario Limonciello <mario.limonciello@amd.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/sysfs.h>
+#include <linux/uuid.h>
+
+static char *x3d_mode = "frequency";
+module_param(x3d_mode, charp, 0);
+MODULE_PARM_DESC(x3d_mode, "Initial 3D-VCache mode; 'frequency' (default) or 'cache'");
+
+#define DSM_REVISION_ID			0
+#define DSM_SET_X3D_MODE		1
+
+static guid_t x3d_guid = GUID_INIT(0xdff8e55f, 0xbcfd, 0x46fb, 0xba, 0x0a,
+				   0xef, 0xd0, 0x45, 0x0f, 0x34, 0xee);
+
+enum amd_x3d_mode_type {
+	MODE_INDEX_FREQ,
+	MODE_INDEX_CACHE,
+};
+
+static const char * const amd_x3d_mode_strings[] = {
+	[MODE_INDEX_FREQ] = "frequency",
+	[MODE_INDEX_CACHE] = "cache",
+};
+
+struct amd_x3d_dev {
+	struct device *dev;
+	acpi_handle ahandle;
+	/* To protect x3d mode setting */
+	struct mutex lock;
+	enum amd_x3d_mode_type curr_mode;
+};
+
+static int amd_x3d_get_mode(struct amd_x3d_dev *data)
+{
+	guard(mutex)(&data->lock);
+
+	return data->curr_mode;
+}
+
+static int amd_x3d_mode_switch(struct amd_x3d_dev *data, int new_state)
+{
+	union acpi_object *out, argv;
+
+	guard(mutex)(&data->lock);
+	argv.type = ACPI_TYPE_INTEGER;
+	argv.integer.value = new_state;
+
+	out = acpi_evaluate_dsm(data->ahandle, &x3d_guid, DSM_REVISION_ID,
+				DSM_SET_X3D_MODE, &argv);
+	if (!out) {
+		dev_err(data->dev, "failed to evaluate _DSM\n");
+		return -EINVAL;
+	}
+
+	data->curr_mode = new_state;
+
+	kfree(out);
+
+	return 0;
+}
+
+static ssize_t amd_x3d_mode_store(struct device *dev, struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct amd_x3d_dev *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = sysfs_match_string(amd_x3d_mode_strings, buf);
+	if (ret < 0)
+		return ret;
+
+	ret = amd_x3d_mode_switch(data, ret);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t amd_x3d_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct amd_x3d_dev *data = dev_get_drvdata(dev);
+	int mode = amd_x3d_get_mode(data);
+
+	return sysfs_emit(buf, "%s\n", amd_x3d_mode_strings[mode]);
+}
+static DEVICE_ATTR_RW(amd_x3d_mode);
+
+static struct attribute *amd_x3d_attrs[] = {
+	&dev_attr_amd_x3d_mode.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(amd_x3d);
+
+static int amd_x3d_resume_handler(struct device *dev)
+{
+	struct amd_x3d_dev *data = dev_get_drvdata(dev);
+	int ret = amd_x3d_get_mode(data);
+
+	return amd_x3d_mode_switch(data, ret);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(amd_x3d_pm, NULL, amd_x3d_resume_handler);
+
+static const struct acpi_device_id amd_x3d_acpi_ids[] = {
+	{"AMDI0101"},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, amd_x3d_acpi_ids);
+
+static int amd_x3d_probe(struct platform_device *pdev)
+{
+	struct amd_x3d_dev *data;
+	acpi_handle handle;
+	int ret;
+
+	handle = ACPI_HANDLE(&pdev->dev);
+	if (!handle)
+		return -ENODEV;
+
+	if (!acpi_check_dsm(handle, &x3d_guid, DSM_REVISION_ID, BIT(DSM_SET_X3D_MODE)))
+		return -ENODEV;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = &pdev->dev;
+
+	ret = devm_mutex_init(data->dev, &data->lock);
+	if (ret)
+		return ret;
+
+	data->ahandle = handle;
+	platform_set_drvdata(pdev, data);
+
+	ret = match_string(amd_x3d_mode_strings, ARRAY_SIZE(amd_x3d_mode_strings), x3d_mode);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode %s\n", x3d_mode);
+
+	return amd_x3d_mode_switch(data, ret);
+}
+
+static struct platform_driver amd_3d_vcache_driver = {
+	.driver = {
+		.name = "amd_x3d_vcache",
+		.dev_groups = amd_x3d_groups,
+		.acpi_match_table = amd_x3d_acpi_ids,
+		.pm = pm_sleep_ptr(&amd_x3d_pm),
+	},
+	.probe = amd_x3d_probe,
+};
+module_platform_driver(amd_3d_vcache_driver);
+
+MODULE_DESCRIPTION("AMD 3D V-Cache Performance Optimizer Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

