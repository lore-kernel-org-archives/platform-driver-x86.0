Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF7713C81B
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Nov 2024 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731322025; cv=fail; b=DeGTMAhZhP5xQf2v8iElxrqWQA3+qqJ2OMDYkLUFgSZK6OQFgmMNChlIbgrRvEMwu8O8BWEtbkA4Nbs9d6anyt1r2w9FWV6QYVqCT5kJO9BaZb0qstfxPbTfvn0z8u5peFE68L7gl3SQS0Bsz9O27umm1NFsZL9wPTn1hprm5aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731322025; c=relaxed/simple;
	bh=RWAVqKEAcOGd9DqjgpNUlMdyMxprHQRmXHSD41sk87E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GnTnevaBrYHb3cwZv92NTf6MxxSH95sSI29n+zOtwYPseVZwzvzKzW06nIWA5sITNC0L88kbVUqduyR25dHXwnJDYV9hKBi3cDn/8wqOf6u6HCOP0MBqWsG8ynejaXHOa2htl3IiAQuZyyfSq+yTs0TzZbnzFzpWW6rAKL5WTbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wlFbHMU+; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wlFbHMU+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvpQLpBL8MJ9BLjDEehfPgRBcRt0MuEl92GOTQOpVJYN24YyX1BOpWrWQ6DqZHadl0aV3ZK5VQnaGune3MVliJndmUJJjtHXWB1b1wRBb5N5rTLyJLeoX2ouWIT3R7GX/7JmHtaWv9gseKHVf8yzBqoUFeHLi0Z61MJ3kiXZboV8N72+75lpHSItHhJxpPxMo4hPW3Q9sS4nWIYGB09Ez5I5TAkX+OmMgJSLGZxQDPXaqFu1GXePWDWcaEI96JoHr1BUqQdscwf0ZqfV9A/3JEJhx9lUfXoi+FHxv+OUY5CXmwT3OvxrxWHhYOLplNTznRHGkbp/y7Q3HI44nvo55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfODnvwigNJOhbd/fxjuhB7+51uQdFrKqG94Uzo5jEc=;
 b=hV/QMXf1YVMjQDO+YKXLA7LI+XKTtTC4eu9CDvC+YzBZCF2Buy8uQIuRb7a0vYyyVIOuWyvuGzFST0iAiItFShusx0GEZJBIcxvzEtzwas7lGocBEYREd0aOkD8AId1aq4RezSJEYTIgnTn/PnPMQE33SSPgMK8jznN0S1YFrosLwO4EQ/zXrBetSMeQ2khCr5UgYrIcYSFpKgZIGa+ZMcyoMKQQL/Ph1chPvavzC3ln+HbNV6LHBdvWdkSwr5fuqYQfbUyo/cBTrlHQUwoeDtoTu+SPU6BggR7ngJ6bdZL0g+0NawnnuE1gt4AotJYPa1Q8a5pmGfpk6d1Iti8q7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tfODnvwigNJOhbd/fxjuhB7+51uQdFrKqG94Uzo5jEc=;
 b=wlFbHMU+OAdmxJK9vj1segaLU0erXFvPIPdLe6Kl/MkDM5FdcsPief2IZZumGPmOaLUdgvTOrdwRvq3c7Y7DDqamvMCTQc0bOtPikqYWqpyRL5Vp2RIG9yq50BEXj3O/TjrcJ8iZVsHn4Var/QXqNi/xIYhP6owvYGehVfcfQUI=
Received: from DM5PR08CA0047.namprd08.prod.outlook.com (2603:10b6:4:60::36) by
 CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.20; Mon, 11 Nov 2024 10:47:00 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:4:60:cafe::52) by DM5PR08CA0047.outlook.office365.com
 (2603:10b6:4:60::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Mon, 11 Nov 2024 10:47:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 10:46:57 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 04:46:54 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <perry.yuan@amd.com>, <mario.limonciello@amd.com>,
	<Shyam-sundar.S-k@amd.com>, <W_Armin@gmx.de>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH v5 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache optimizer driver
Date: Mon, 11 Nov 2024 16:16:31 +0530
Message-ID: <20241111104632.2213773-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241111104632.2213773-1-Basavaraj.Natikar@amd.com>
References: <20241111104632.2213773-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|CY8PR12MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a37cc21-ea13-4b47-2151-08dd023e2c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y14k+QKNYitqxRP6TLWT8SUaIKJ2UOx31pfUDQd9uVZbSDyYQ4kbfG8T87z0?=
 =?us-ascii?Q?CBe3FjB77BePLkNk0Ro0BAk/IKD9S5bAiuSKsPIoF3Bm2AQMaB9rAU3m5uSs?=
 =?us-ascii?Q?CET7kF479nILsrzv5lO//M2nAU4K3HhHXSRDz8DaN6jZZjQ/sLSz90LoOyRu?=
 =?us-ascii?Q?4KXIboA1rEu1lyRo4WELBroaSJVRCDstNOOZJRfEWATYgAI2xpFUeNmcXHsY?=
 =?us-ascii?Q?5XjX2P94TdDe7RwHAXrEYrc2GpF0ZEJy+ZdEtL8QGG+/gl39QbAechI769fC?=
 =?us-ascii?Q?Q7MvwaB+nicsF52sOtmEvJNRxdBEJ99EfMO1CxqoE+nb+rGUQizVu0qVNfOD?=
 =?us-ascii?Q?oLortyfY7v+cQmuo9T5Q0xs+PMMY3nk3nAP2697yHDzYjgnolQoQRdctNEqk?=
 =?us-ascii?Q?DXgyG+mP6NqXKdlzcdx3Ew66IWPnNkqQcvdSog3rJlCXX8sAEHBcC76m/n9T?=
 =?us-ascii?Q?QwK5Z3/xiDv0lgwnW+8mxF6C4I4YVAArZ7sZ97mAXljFVEPIcRchkEAnglC1?=
 =?us-ascii?Q?KBj/DFCwh0NlWe3ofcmLZ8rvtE0CRJvTLi5epzX/CpZ0vsmssi1mKabqF9Ho?=
 =?us-ascii?Q?WWg4creD9jkz378yY9/nfRW1AoT67A26hYgn2O1VJm+qPCMnI1ExRyYtb3Y8?=
 =?us-ascii?Q?QmV03Dk6RI/jyCVUNO9x+xD7ZUvgnlHNiN0gZ7Kb1BC+U2iCMYh7p2MwvCR/?=
 =?us-ascii?Q?d8xJRBSu6UGZztjFeIMxb0puswMjbflvz/3mO8wR5jj/JgpzIxdIRPIQZg3B?=
 =?us-ascii?Q?z80CkD86evWqOFp6OUOAO66s4XA4XTdblz5mF50Kg8dodgjwwTq37HreNSIg?=
 =?us-ascii?Q?1119+JIR2GftyQQF1XBh28fBuyHk6x+9naf9IyBTxUWwGtB9DSDE/gfM4OII?=
 =?us-ascii?Q?0qnu+UDBuTBFHXLpibXcNAA8zHZnIeVfOlB8YUECWRVqKG61Ix8TeLsAV0Yg?=
 =?us-ascii?Q?MR63pwFe1y/Rq1PmbSmVkD7gRjKxAk2GndzRgC/bXYKpj0lhWMciBKHM7Zkn?=
 =?us-ascii?Q?jGbBsVKoHHmL+4Oc0sMyZzJjDO6URqubFfrPE5gcAO/LeI3ZAszdNzd1JEdn?=
 =?us-ascii?Q?t2LpbvLiAIvmcre+gHaSLE2qvTuQO6sk02h009L+v+fj7VfpWbNyiaX5zlD7?=
 =?us-ascii?Q?u49GIb5jUt7KEf73JoCNcP2cZPNJJ1gGA39Lttjn16zAbhJksHvJohuecKxC?=
 =?us-ascii?Q?+rIAM0u3IFaq6LwU1TedapwefdOJxfEdyTWR2X74m580ePBcNAWaxsdvq+wi?=
 =?us-ascii?Q?BIgUO3suEpg7vsPq4Bd7yTUk6J06H5xtfxDOFDQ09TNMGqePimGz16PO1BJt?=
 =?us-ascii?Q?5GTB1hzoAF16spWmD36aDBmr4eIaTe+v58R2kLVH981EWGcQCh7GLlyJlkNo?=
 =?us-ascii?Q?7EDCm4kRv8vkSusI1SuiNaTWL4p5zGpXHujul89x61XP6V5Qeg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 10:46:57.8528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a37cc21-ea13-4b47-2151-08dd023e2c1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7195

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
 MAINTAINERS                           |   7 ++
 drivers/platform/x86/amd/Kconfig      |  12 ++
 drivers/platform/x86/amd/Makefile     |   2 +
 drivers/platform/x86/amd/x3d_vcache.c | 173 ++++++++++++++++++++++++++
 4 files changed, 194 insertions(+)
 create mode 100644 drivers/platform/x86/amd/x3d_vcache.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 21fdaa19229a..429ac6496f42 100644
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
index 000000000000..a1a147277814
--- /dev/null
+++ b/drivers/platform/x86/amd/x3d_vcache.c
@@ -0,0 +1,173 @@
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

