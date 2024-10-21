Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7041E8841
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 16:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729529927; cv=fail; b=BpwwC8p+Gb/01n/ywEMjiViOJchZKQud/c5ph8Q1ZO250nIxWa+Ol8Xa3Vmq0KrUsvERsDLiZLYT5TFRDXBqcPbiUkYlwbZChOAVAEQ1FHI6b16zdrhrwn2QHcNUpVR8uPs4AmFP0q/MbFl23XP27JVPI7ffraSqtjhfMZ/AvZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729529927; c=relaxed/simple;
	bh=X0tDh95SjJJ2yRklzx4lqFnvOdlu1LMvg8TwfwRPcYA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TR0wWHGHWwN6zfcyjJ6AnLP/KkM18O1Ji+izzFGol8QGRwGn7XhhJssrKOztEHE1vjbBDIjcTTqPZC3RsRXkCZAPvVTpjdQI4Vf6CHqif5kPXo5TBCwCnomPMjqrDxrln0S4Jdcd5ZJSWpfS7opQmRM4yktAcV0CD92a0eRqkXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QrPpl2j5; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QrPpl2j5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPaDYYiYcsJp0NB8rIzroAfXVGma/dZeZMT5uAxqT1rRwsMwGca4TudeEa5Nxdr+ZAiKSgfFU4+C2LD2dd+N2EvfoSXSdm44Lb1cyVSAFgIjE+6hs36XEWtDO533RFL+jl+jS7tifhYMSJYweqR84Q3QA9VZKeLktC7/JS1WwObFluFS5ery2FkxhfnUzhjHs4rqhw6GKiKWM7bhmf3SeqmMgLbbnJO5mZgbnxodpvAxZsZ1fChvXlj5/u6Z7F6tWZVExiwI5JpBvwCWEJTB2XGcxSv2x4cRftjSPoWd9vchPnVOnbXHmyWMhPyvKANVRW0m8DvnMdtAwhyQ5VdUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJmVYg/XBMWddV2lj51z58IAWCRxOkLXNGo9xn6W2us=;
 b=y/6IoztKZQYMlX2+gib+fH2Wt6r5fuVubRfVEfnZbO3V5L06CWHx5l8pA2Ow/pjGHMZRgydI1do9dy9u/tBWlBM6wnd4a/KnId8AMqC/Z66JvHmpH6Rhs9JsClfpUVQxqq2aVhw7M20Ft80KuaDsuGM1BmUDPlNpjpdUdljPJ3rJQxAuncA+0Q8gBEVpp36t+givDifx6AUCAaapFM1Cg1yrCGVcTam214CczANPNKNupl9lbWsR/39KGwoGxbLIoAaqrKhHd9u/ikeyIoV5EhW2vgbAjdVEZzjiPVi/LjJOqtdDr01JtNVjxAsEpOUU6MjBxYLG1IaM0yqkh7B5aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJmVYg/XBMWddV2lj51z58IAWCRxOkLXNGo9xn6W2us=;
 b=QrPpl2j520am2qZ6PoRhnZ3HjwRz2ziPO6j+bgNaHULuvsQ5xgvZjwn4ne2efYUzjQLTPrfnDXliAIYasRF5CXWHKNID+q/HNdk+3/1PscfQdvYDwo/h/TVHE8F02AXTC/eCsRxt4viouiheu4m6kJfgW8rTvbWY5Zv7Mrq3sM8=
Received: from MN2PR17CA0023.namprd17.prod.outlook.com (2603:10b6:208:15e::36)
 by MW6PR12MB8835.namprd12.prod.outlook.com (2603:10b6:303:240::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Mon, 21 Oct
 2024 16:58:41 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:15e:cafe::24) by MN2PR17CA0023.outlook.office365.com
 (2603:10b6:208:15e::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 16:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 16:58:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 11:58:38 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v3 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache optimizer driver
Date: Mon, 21 Oct 2024 22:28:19 +0530
Message-ID: <20241021165820.339567-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021165820.339567-1-Basavaraj.Natikar@amd.com>
References: <20241021165820.339567-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|MW6PR12MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f89ccd-f4ee-4a46-806a-08dcf1f19d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wP4bl+iVHl3A/15tFq/kC+wMs3iOJPbYzKg0JufrjdXssubfaDIen1mhxJlT?=
 =?us-ascii?Q?/XP4lIK3FPHNOkFGAue0aSx+oOtFMcjqNCzxCqtuRkzRIvcfaNMw3ZGZsZiE?=
 =?us-ascii?Q?q4YjJvu/9ERmtZTMQif08TCseGRVUaN+Hhnmi4+hubOyNwUhRvm99OzqhvVK?=
 =?us-ascii?Q?8k3dKC2Dd3KiSFz+1Gv+O/P5/yNz2dOhOq3x5NEpROvGbwRrWbEsRXx8dT8f?=
 =?us-ascii?Q?fFGMovngnQsQI8vYdT3q/XkrYeI2r5t4zAuRT/pX9ueuenPiuPk8L2L/Nhim?=
 =?us-ascii?Q?FM30H/RETAu9KNFftqKkmjRpvfaQoRCmXvcRXM6XzJPHJmPXWNmZHGuVKw1z?=
 =?us-ascii?Q?1xZQ5i2fjt2HgcYMEw15BH0gm3Wi2NaCPffZ1ZxjS1Hddj5DFns9ERvhBPI0?=
 =?us-ascii?Q?RDedNKJrrV4qnCZHksajdHmJx7LYWpbo8UdhlTTsewZqM5ZcAWGvuCiwzrmX?=
 =?us-ascii?Q?05dpCF9cCNr6M4OiFXO8Ld44TYxP5cI/yXAFlRjK4J5I9apqfcmZElLjJ7b3?=
 =?us-ascii?Q?lIdHy4OJ/yDkbx4wslXx8291WaLXuiMHTwfoPx5Ujz7xfBWlmGE8GMgK8KAF?=
 =?us-ascii?Q?CU9gEHqJZo1ptVtBsFBq1fmwU2Ki1gaN4wgGaNV6AvfSC0yl0KiMWTDjJsoO?=
 =?us-ascii?Q?xkGK2a0ds2BnyNbn6uK6tbBJz3FLISH78SBSdiq20w3g5Z9iGDAZnsFGxPRS?=
 =?us-ascii?Q?bqPVjxcOBuAwepjywHfdw+1IOjsTvmZanWnzIyiL7yRjyXIUHktjx4kahE48?=
 =?us-ascii?Q?Fw5En5VRhM8Edgoz5U1HcZ44LypJqJcc+j0AobfAalr/JjTWD0LnT6A4+E/0?=
 =?us-ascii?Q?5DxNVM5Hl5aCS+UOys82Q8G+3nvP2jNT+bpHkxCdoK58hYrBm0waDf9lUAIz?=
 =?us-ascii?Q?M8P9BDEPBrreHhYy6PJGUmZCX4l1MqNz5L/sJc075ArFS3mfeBQrapwllKld?=
 =?us-ascii?Q?CLLaw26rtjjc9VWzq+VlDa8O+PUzk3LhkgZpDpG4TjueZ38T6bnMyZts6cFb?=
 =?us-ascii?Q?JO8naJFCX5nyCez6Sw46PAaqIZA1QpJ1dggxPH2OgfIrkfkHOToD+EFpihh2?=
 =?us-ascii?Q?+FvewWorilxv8M2cg5fSBZwCTZxu+Yzo/jWn6e1n9oAOZcSo0JFULAlZkeZV?=
 =?us-ascii?Q?k5ElOwfbaWvsM9oeg0QlfQhu0P9SNNvJEHJICcWFBC0UBHxiIM+tJOsFMXKe?=
 =?us-ascii?Q?zu5S0X22k4gXn7NZxqB3tKpFYq2jHFYMOezbs6LPAoddA6iQw24Ciopp0HZI?=
 =?us-ascii?Q?0tk95qGYnBQMvb02/t4Vewz3nivJ/vkIe6RJp89Yij4CfNScqs3dR3qPgJ5z?=
 =?us-ascii?Q?4w/LGPxiKz/PldD9umEGM4dBLJFkmLg/gPwD8mJYBU5wk3jfm6KgMpgMqtlc?=
 =?us-ascii?Q?rnEtlqXGTKiOMCupaMAN7s9hFz8pTaTRESaiHkpIDA+DBBQK+Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 16:58:40.9467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f89ccd-f4ee-4a46-806a-08dcf1f19d6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8835

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
 drivers/platform/x86/amd/x3d_vcache.c | 174 ++++++++++++++++++++++++++
 4 files changed, 195 insertions(+)
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
index 000000000000..833e7704e6f9
--- /dev/null
+++ b/drivers/platform/x86/amd/x3d_vcache.c
@@ -0,0 +1,174 @@
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
+	ret = amd_x3d_mode_switch(data, ret);
+	if (ret < 0)
+		return ret;
+
+	return 0;
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
+	data->ahandle = handle;
+	platform_set_drvdata(pdev, data);
+
+	ret = match_string(amd_x3d_mode_strings, ARRAY_SIZE(amd_x3d_mode_strings), x3d_mode);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode %s\n", x3d_mode);
+
+	devm_mutex_init(data->dev, &data->lock);
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

