Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB610E6
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Oct 2024 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553401; cv=fail; b=gnJoD8NXXpUUdz+EwRshbGsABYyDRBi3bO6TaLs9haGtnQkNGGSbxjAIeEpKojTIcZCjLXmBVaGCYutiBPXyO+MNXXTT4u0zUF97mOzPzCJo+k1If/HzUQyvqavY0qJJn0MW/6x2OzbsunREexlrLXY6N2mWM14PgbKxOyfj2Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553401; c=relaxed/simple;
	bh=0yI/uQLkQbkKstwTxoitVQ1+R+X5uGNWgUY6t4MXZy4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nB0+qZA+mLgMYVWYcd+Hk4+vyoW4iO2BYNFquE+kA9jwMRKj+p7iuMJ6Pgy+gbN9z0Izv1ju2i3b2NKmKU9wlYAypjqKLkNlwBHUV5rgKGcClcEkT9EbF0VRWfGOXIjVjs1qCfOGeAiiHxj558PR89CTe97wrJEt2dTRKdR4nik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WvTxlrmQ; arc=fail smtp.client-ip=40.107.93.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WvTxlrmQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INmri+Pj6vEGpKrEEQaooIV072iJeIRcjdV+s3UxjRr45ZAa9ZpYeW+zzVct4+yN5bTvf3/hX+H/8wm4dSRW25pL4HIBcIZeCL2kUk2osq3gsCwUPHHedfnBjZiQDrkACoL67xuhBpjQEjUQwAIs+8gqIE6gItblIzFyBTzU4+Wi3BucZ/6Lm4AmIUDIniXg9aYbw9D6u9i0o6NwcQpmUJYAGKmiOnedkyUDIXjWyUt1hvy5CnCyenj19jedgOy9+JAf9cle0TfLr+f15KguBlrxg29TM9KhHKDWgTHPozlCrRw0wcRzUi6Ym6z9k7fjI3X9bPbGHS6K/T0WUfjX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqalXdlnfQT6QrCCEMEjlJhJIh36sCCjKGqQNUetOU8=;
 b=Msv92aVAl7+eWjJIh8Vt7IMI2HuPbLKqDwQhxUC6BeXKUG5c52cAaS32vg63no5RQa0CFdlYEPHL7D6sp7eQszJ4g4g76EZ7aUCwhYahWfLX/YTB2rQwDekTx+eN976onowo6QvL7F5FlPWnPOUpCQgF8SBLMEnoClGln6F+vf8nZ0l5z5SJi0onkCVezDW7A/MeTtRHvQn+YLT1B0dc61qsjlN94Vo4Agqi8sLbbCQevVag4m0dm9q807c6Npk80c0Nr64aqEKfohXrmaf6VAgNEMXfiUrxn/yPM2zolQUR1GM1tHvxjCX9u0DVyEHBSSWTVqbIJBsJXXq/XQ2JaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqalXdlnfQT6QrCCEMEjlJhJIh36sCCjKGqQNUetOU8=;
 b=WvTxlrmQsU8dtoii15vzB0AcavQyUGuxRQjcfpRrTu6f6agwJr4rZLMpg9+Xp3AXvs/uEbFm84nvzgpN8O6R1BuoPNNAhdhVrD+A4SyvicVzRf+oJ1zSZo80aKTeeoL3HmO78XhpXBaEY8PPoOoA58VT5TfwzbZpq8bEiGrpbfA=
Received: from IA1P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::13)
 by PH7PR12MB5829.namprd12.prod.outlook.com (2603:10b6:510:1d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Thu, 10 Oct
 2024 09:43:15 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:208:461:cafe::6a) by IA1P220CA0005.outlook.office365.com
 (2603:10b6:208:461::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.19 via Frontend
 Transport; Thu, 10 Oct 2024 09:43:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 09:43:15 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 04:43:11 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache optimizer driver
Date: Thu, 10 Oct 2024 15:12:51 +0530
Message-ID: <20241010094252.3892406-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010094252.3892406-1-Basavaraj.Natikar@amd.com>
References: <20241010094252.3892406-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|PH7PR12MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 4292b0a9-0016-42d2-ff66-08dce90ff6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W9kwQGJrrdnkPuY9DQRZ4cOq9Ckd6mretVO+JPlPsYwd8Dhdhlq2WNsxwLmt?=
 =?us-ascii?Q?Ehe87ywAKSWB6oW3Dm4EovbBSuwn64o9nlqBiIAVZNK//pcdh8U7WTQ0d4qD?=
 =?us-ascii?Q?VWQk5HRb7XSaBtahFjM2jaSkXa7is3kU972RxcCwiow4tsxAgJC9+xAVBErt?=
 =?us-ascii?Q?RJHK9FkVSSjBNP0Qb1ec3uhBtQTGHlXeL6NpdrifEL2YKPHmIGKWPV8ZVscD?=
 =?us-ascii?Q?SiZjWdjsBjZ+Wv6yVtcmlHrY+8Ojb5O12eNokVwJ0/yKwaBMHLhi8iCOYeWq?=
 =?us-ascii?Q?3otbU9dVLd2Pr/EqjQNPejpJX1Od6l4cBEM4XiHdgnbjDYJhESwBGFfWYX5p?=
 =?us-ascii?Q?iIl3XLBYaFn26c+2oxo0Oeb3bLxpDxx8Mc3npIAl5HepITtNDOJI4FI5TLyG?=
 =?us-ascii?Q?svAag17c6vzhMMKvWBXRqXngdPBR03nJPuOeQq6zUSLG6vXpARoPCqv4LR22?=
 =?us-ascii?Q?a3ny9ikxJC5IQVimpB+L1Kg7586m/4qq6JNhpTGjl51sfaftwWTD186hInWu?=
 =?us-ascii?Q?okOFHFhhUhu8F4MtrvBe6EDe1+8UmiSUREW6iKf48p2h+9yIZnNHslfFa1Zw?=
 =?us-ascii?Q?z0tJTmK60yssDbmodlbV/CsWj0C71QTHzSaCv/gC7ab5tyGP5DfZIn+hg/z8?=
 =?us-ascii?Q?6jDwNaa27fwhNZ/dBlEiZm4PxeAt9gyB8mpWxb45wjyDyN1t0dYNtCb4rzSl?=
 =?us-ascii?Q?+2r0bl9Bu9h8znQxScxjU2Adw0wljGWUrbqduzJrVWJUPKnccyLCdgy6MZe6?=
 =?us-ascii?Q?boVp5Po9hIPjaGg2unZO3GZJ1CxHRqft7Efl2BJjNwGkPDCvT74PYp7N5Jlb?=
 =?us-ascii?Q?SJ83K/3wxKe13VVe1w3nkt69iC9/KgSIfxdzp1Ls8aXV+czvnwVH/AtL2nUB?=
 =?us-ascii?Q?V8EaVq+1udTv+EDOUUcEdtjEXQNJWEhAUVvtoOww5zkk7ArDy+8uY5IoxCtA?=
 =?us-ascii?Q?u9Z9mCESziwAPIKRRKl1toqMIUrvytRqk5r1LEZbWbuapRcpw/W4v9wKj/o0?=
 =?us-ascii?Q?a0T/m5iyo3dVh9sF/MrG1CXLl9FC4PCmIMOQiI7gPB0EmePcxUcJhy6tjvSL?=
 =?us-ascii?Q?1BikLGfpt+1Ef6FdtW+5aG/pr1H91Dx6imN/VWddCUAzwiFdFBFilYOmrJYD?=
 =?us-ascii?Q?iEO6iT0ZNrPF1Y9zFCexG71dXChT3NamcCY2p2vJ7fGpiwFqtqPskYNAODhH?=
 =?us-ascii?Q?dS1NbgpO8A3kciVE5VL6KbSfEFet3XXJu5mSFhtzwygaVNCsYmjy+clzsfHr?=
 =?us-ascii?Q?hFvUFW0qRj3TOFWBB7yMBP3NRunX3yJ8+saXoYo8LwwSBQoK9NZdXm2N3gXC?=
 =?us-ascii?Q?5PseLcAG6b91TuTlakbYYnFtSoB/rIzD7tEHDmA2ErEy3T4H+f5xmh3EPUt3?=
 =?us-ascii?Q?kFmVax4eMl6wEX/ETmjJWHYdm1/I?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 09:43:15.1169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4292b0a9-0016-42d2-ff66-08dce90ff6aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5829

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
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 MAINTAINERS                           |   7 +
 drivers/platform/x86/amd/Kconfig      |  12 ++
 drivers/platform/x86/amd/Makefile     |   2 +
 drivers/platform/x86/amd/x3d_vcache.c | 193 ++++++++++++++++++++++++++
 4 files changed, 214 insertions(+)
 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a097afd76ded..61cb6a294f4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -972,6 +972,13 @@ Q:	https://patchwork.kernel.org/project/linux-rdma/list/
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
index f88682d36447..d73f691020d0 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -6,6 +6,18 @@
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
 config AMD_HSMP
 	tristate "AMD HSMP Driver"
 	depends on AMD_NB && X86_64 && ACPI
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index dcec0a46f8af..16e4cce02242 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -4,6 +4,8 @@
 # AMD x86 Platform-Specific Drivers
 #
 
+obj-$(CONFIG_AMD_3D_VCACHE)     += amd_3d_vcache.o
+amd_3d_vcache-objs              := x3d_vcache.o
 obj-$(CONFIG_AMD_PMC)		+= pmc/
 amd_hsmp-y			:= hsmp.o
 obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
diff --git a/drivers/platform/x86/amd/x3d_vcache.c b/drivers/platform/x86/amd/x3d_vcache.c
new file mode 100644
index 000000000000..679613d02b9a
--- /dev/null
+++ b/drivers/platform/x86/amd/x3d_vcache.c
@@ -0,0 +1,193 @@
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
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+
+static char *x3d_mode = "frequency";
+module_param(x3d_mode, charp, 0444);
+MODULE_PARM_DESC(x3d_mode, "Initial 3D-VCache mode; 'frequency' (default) or 'cache'");
+
+#define DSM_REVISION_ID			0
+#define DSM_GET_FUNCS_SUPPORTED		0
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
+static int amd_x3d_mode_switch(struct amd_x3d_dev *data, int new_state)
+{
+	union acpi_object *out, argv;
+
+	guard(mutex)(&data->lock);
+	argv.type = ACPI_TYPE_INTEGER;
+	argv.integer.value = new_state;
+
+	out = acpi_evaluate_dsm(data->ahandle, &x3d_guid, DSM_REVISION_ID, DSM_SET_X3D_MODE,
+				&argv);
+	if (!out) {
+		dev_err(data->dev, "failed to evaluate _DSM\n");
+		return -EINVAL;
+	}
+
+	data->curr_mode = new_state;
+
+	ACPI_FREE(out);
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
+	if (ret < 0) {
+		dev_err(dev, "no matching mode to set %s\n", buf);
+		return ret;
+	}
+
+	ret = amd_x3d_mode_switch(data, ret);
+
+	return ret ? ret : count;
+}
+
+static ssize_t amd_x3d_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct amd_x3d_dev *data = dev_get_drvdata(dev);
+
+	if (data->curr_mode > MODE_INDEX_CACHE || data->curr_mode < MODE_INDEX_FREQ)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", amd_x3d_mode_strings[data->curr_mode]);
+}
+static DEVICE_ATTR_RW(amd_x3d_mode);
+
+static struct attribute *amd_x3d_attrs[] = {
+	&dev_attr_amd_x3d_mode.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(amd_x3d);
+
+static int amd_x3d_supported(struct amd_x3d_dev *data)
+{
+	union acpi_object *out;
+
+	out = acpi_evaluate_dsm(data->ahandle, &x3d_guid, DSM_REVISION_ID,
+				DSM_GET_FUNCS_SUPPORTED, NULL);
+	if (!out) {
+		dev_err(data->dev, "failed to evaluate _DSM\n");
+		return -ENODEV;
+	}
+
+	if (out->type != ACPI_TYPE_BUFFER) {
+		dev_err(data->dev, "invalid type %d\n", out->type);
+		ACPI_FREE(out);
+		return -EINVAL;
+	}
+
+	ACPI_FREE(out);
+	return 0;
+}
+
+static const struct acpi_device_id amd_x3d_acpi_ids[] = {
+	{"AMDI0101"},
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, amd_x3d_acpi_ids);
+
+static void amd_x3d_remove(void *context)
+{
+	struct amd_x3d_dev *data = context;
+
+	mutex_destroy(&data->lock);
+}
+
+static int amd_x3d_probe(struct platform_device *pdev)
+{
+	const struct acpi_device_id *id;
+	struct amd_x3d_dev *data;
+	acpi_handle handle;
+	int ret;
+
+	handle = ACPI_HANDLE(&pdev->dev);
+	if (!handle)
+		return -ENODEV;
+
+	id = acpi_match_device(amd_x3d_acpi_ids, &pdev->dev);
+	if (!id)
+		dev_err_probe(&pdev->dev, -ENODEV, "unable to match ACPI ID and data\n");
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = &pdev->dev;
+	data->ahandle = handle;
+	platform_set_drvdata(pdev, data);
+
+	ret = amd_x3d_supported(data);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "not supported on this platform\n");
+
+	ret = match_string(amd_x3d_mode_strings, ARRAY_SIZE(amd_x3d_mode_strings), x3d_mode);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode %s\n", x3d_mode);
+
+	mutex_init(&data->lock);
+
+	ret = amd_x3d_mode_switch(data, ret);
+	if (ret < 0)
+		return ret;
+
+	return devm_add_action_or_reset(&pdev->dev, amd_x3d_remove, data);
+}
+
+static struct platform_driver amd_3d_vcache_driver = {
+	.driver = {
+		.name = "amd_x3d_vcache",
+		.dev_groups = amd_x3d_groups,
+		.acpi_match_table = amd_x3d_acpi_ids,
+	},
+	.probe = amd_x3d_probe,
+};
+module_platform_driver(amd_3d_vcache_driver);
+
+MODULE_DESCRIPTION("AMD 3D V-Cache Performance Optimizer Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

