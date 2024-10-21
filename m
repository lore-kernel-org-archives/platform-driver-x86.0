Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F7F323D
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518444; cv=fail; b=LiJaxzu2n0SjGdWgXDzQrAHg7UW90dyYM2YBEHgcldmnjpmCG68hHrbHBGI8h8mESNIWB+wBvSdQQfuV5u4v6eIiUKEjsqdfNne9vBZCyJJjBtcZbnyKhaHUZ7qeLV6aRuXh58ZxgHblxRmxecu3lU89YCLj8gxZlJP7mR11Xms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518444; c=relaxed/simple;
	bh=OHI0xqHuZbqYECsiKQLHlSZ0FxR4dvgq1e7dRD7a92Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9m6teeyU78opJ5Pj0l/eEGqL0i4Dm/tstD5HX9dbkEiRnpkq704gi7NQVSc4r145IvMAeUFFm7GDENEWywK1Nd2TF74+KD7UdjHbHPgPs6doC9xGjimUBWekWjyTmRIXbO9pOq+dpfiqamyH7ZIu2Q4mW5IGFvklEiEQULqWbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aYrJtCAG; arc=fail smtp.client-ip=40.107.92.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aYrJtCAG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUF8s8pFWNI2+OQ2/r/uGRfX4vzLulS7C44shIQqxBF7mlmO+XMsib0rYRaggxeTbSpCdw/gB3FMeT1EPHyNPt+7E6SQYdV5HUxIfdpSxhl2aEsH2tJ0gJCk/Z3OsOLDxuhnifoXTLCO4rgzK4oRJacy1CiuCpHcPvOgRuOxnFD2rOP4F2dYfKzIMebBQYooyZY7uxIFjsGC+cou//eGXM+qmKzMCLGa51NzN0LHin1RlKowN6aTbb0RJkk+0s7o8hmi86w/PW81MBW5eqSYxg+DQsdPZjhp1/UTI0nmD5K+ZGfdWzYO9aatr0wjBBqizXtzr90UNopPMsSGtlMs4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YP1Qn/38GlZwn15+xxdcFkiucG4+U36iUElTyVh8nn4=;
 b=Av9nON3+yloxPO+REXeF9XqWBgsckt6njAG9CnGuWN1ORUH1jI9CkrCZ3mTQ4MLhi4IPltS+O5xGZavIIaHAn88JXKJl7EMtE4lb+i9UgiUedqwSK2oAWuy95mjAAVlnqhv4PxSzNZHfPF47jKDfHyTdYLMRKaHNz+6RFEq/H3unaIZQixKwZQTjQh2J38T/mOqqlPRElozjfoJN0IlzDU7KPYWwsgNtfiLkaoQVGFSy8uEoB6YJxdgYteng5DlfsaeIOgMSJY/4NtDyG8JWE+DvoztveInmdJp/OCBdQk5HQ3ZNpcjlP1l8uuz73KEzMHa76FCjpbsPt+xTo0kdsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YP1Qn/38GlZwn15+xxdcFkiucG4+U36iUElTyVh8nn4=;
 b=aYrJtCAGj5uXbaj+uuITxl4GnIwHiVMLqpILlQIiuuou9ioefg5Nunlm7iMiAi69td21RLmCUm7ruTxgKdLl0J5rtFHJz/sJw2+HQATrsOvnfJXprgBl+KYJQslOmBx+rvOWgugIloFfzy/B0ryXgCzi/RXKQtr0nO88T7H2wnc=
Received: from BN9PR03CA0848.namprd03.prod.outlook.com (2603:10b6:408:13d::13)
 by CY5PR12MB6407.namprd12.prod.outlook.com (2603:10b6:930:3c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Mon, 21 Oct
 2024 13:47:16 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::e9) by BN9PR03CA0848.outlook.office365.com
 (2603:10b6:408:13d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26 via Frontend
 Transport; Mon, 21 Oct 2024 13:47:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 13:47:16 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 08:47:12 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache optimizer driver
Date: Mon, 21 Oct 2024 19:16:53 +0530
Message-ID: <20241021134654.337368-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021134654.337368-1-Basavaraj.Natikar@amd.com>
References: <20241021134654.337368-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|CY5PR12MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4d7ac8-e389-4444-4c09-08dcf1d6e03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+benxfsUlTfBDvSWpgVf5xBhninJAkrhBIiyskqu6lDhljdi3XMp27uaYq6I?=
 =?us-ascii?Q?aNxTGCllQQWY17j0quJoCunHfYYI05yGnBKkWTv8Ou7FSDRcB2bUhUoC6FPH?=
 =?us-ascii?Q?R0xJe2e/eOkkOJ4rHIumGAAqw4oJYZbL6ZnHCoMudSQlsKyfbQTJzEP2SWe+?=
 =?us-ascii?Q?Us8ACqBorKuzlHL67RxmWrnu6L567dPAXY3uOXGlh265Utx/9Fgl+/8oUPI8?=
 =?us-ascii?Q?D5HGJF2FZ1ByD3IQr9WnvUMRHpw8CHu7U7NYWAFZx24t/Lay3fxGdRw8G4Ro?=
 =?us-ascii?Q?VQFkc6rFHwUVpPVSs9i6zIJNDOjVeJbEVTriMcchc7zXv6d8fgvHTthZL2KJ?=
 =?us-ascii?Q?L9frnZBPBIGG6Zy+FJOht9ANVl8vDml6Lcfl3qqDu0BPssC6uPSHJdgWZ+g0?=
 =?us-ascii?Q?fhD/mpAW5Rw50+qnXxoySlKsF4DCynWpHEn1tW50LJ9JZycaUYxv3Hs7IjPK?=
 =?us-ascii?Q?UwtF1GVXNIPokFd6g29OS+nKn6n/rOtn659238Oig3PlJ8g/XAyXBPuDWKSA?=
 =?us-ascii?Q?seWCfqKxIm4olPEiAzqdX/dPEK2YIb5D2s1NBVQvZhjnMNS9FN7MwgzczKmn?=
 =?us-ascii?Q?Cot7bxNsCUPZXD3H6N7LKmhgVL0iI2NPLZ0H8XklEilymH6OjyHGh+YOMDME?=
 =?us-ascii?Q?e6vjzWL8FhJk+AQODxc4Nh/3ufnfGd6VWh15hX7Y3SGcbv+m3HOdsiO1pWsG?=
 =?us-ascii?Q?i/6MNxinBJsJi0Znpb7P+Ag0+fUtr1jaAZ/AB5PaMrJDctHOszkJ6lXo8LSR?=
 =?us-ascii?Q?RqavuFHsvpfrou1WEWP/4uWx3dOTZbyxSywB1Uh0d35eKNkxaAh4VOJUialR?=
 =?us-ascii?Q?QH738leGYU8hIeu1zyPoGGtFQ5ztItQte/kFSB1gu2joY3iQ7RhbgBvPkkGB?=
 =?us-ascii?Q?KMxpo3eXbtaklkRTJGJTGd8IWjXmVQgHWi9n+ztFeeSL7zXnXKN7JVAF7XYZ?=
 =?us-ascii?Q?0Fl1NMYc534LOd/v2gdn2BvteBDy4g44yq5jJgP0mLkbV2RTyzmmzzC/AFQL?=
 =?us-ascii?Q?fC7CQr0Z8np5TNFujdMrOWEG9RQ2sBxtg1jsqUfBPUTlXMKIwtcWCEskhn92?=
 =?us-ascii?Q?YxoMF/njORD3sRAGmIGGSyjJAHH8Gi11k8F8ZddE0HyEwd/jWy9Kecv5lP6L?=
 =?us-ascii?Q?Ef58n5d3ZYtmoPEy9GuNM0XqwGgHjHCmHXNKsY+7rGflSo7bQPFyZBLVFB2h?=
 =?us-ascii?Q?xBiYU6huqedgsnuv0AUN8OZzGCVCH8vyh6MLlWtxQevW/svh9lyNsu93OShj?=
 =?us-ascii?Q?CYfhdU5ILhM+DZ8hB2jT/9Q9xOXoEU7TEPoaDoGC7E03XR6QoBSmAM7SCR0L?=
 =?us-ascii?Q?UYThJslDAuNabZAea/nzXGskpjfBy2xnBlO21BtyWbtC79RJA2LCLegm1pkH?=
 =?us-ascii?Q?sn6iZ/hBzQkfHv9nVVcU4I2JrqD7HOmZOaJbIGasDXHg64Wvhg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 13:47:16.6617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4d7ac8-e389-4444-4c09-08dcf1d6e03e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6407

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
 MAINTAINERS                           |   7 ++
 drivers/platform/x86/amd/Kconfig      |  12 ++
 drivers/platform/x86/amd/Makefile     |   2 +
 drivers/platform/x86/amd/x3d_vcache.c | 160 ++++++++++++++++++++++++++
 4 files changed, 181 insertions(+)
 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e9659a5a7fb3..11b829956499 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -965,6 +965,13 @@ Q:	https://patchwork.kernel.org/project/linux-rdma/list/
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
index 000000000000..ec861e7b5e1e
--- /dev/null
+++ b/drivers/platform/x86/amd/x3d_vcache.c
@@ -0,0 +1,160 @@
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
+	if (ret < 0) {
+		dev_err(dev, "no matching mode to set %s\n", buf);
+		return ret;
+	}
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
+
+	if (!(data->curr_mode == MODE_INDEX_CACHE || data->curr_mode == MODE_INDEX_FREQ))
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
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = &pdev->dev;
+	data->ahandle = handle;
+	platform_set_drvdata(pdev, data);
+
+	if (!acpi_check_dsm(handle, &x3d_guid, DSM_REVISION_ID, BIT(DSM_SET_X3D_MODE)))
+		return dev_err_probe(&pdev->dev, -ENODEV, "not supported on this platform\n");
+
+	ret = match_string(amd_x3d_mode_strings, ARRAY_SIZE(amd_x3d_mode_strings), x3d_mode);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode %s\n", x3d_mode);
+
+	devm_mutex_init(data->dev, &data->lock);
+
+	ret = amd_x3d_mode_switch(data, ret);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "mode switch failed\n");
+
+	return 0;
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

