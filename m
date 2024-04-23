Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2078.outbound.protection.outlook.com [40.107.96.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAD721345
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713863709; cv=fail; b=EGqzS96PONE51gfoswvZZfiCX91TOKHukmmi2YsIqan6ZR4F6tktU6xBe2W5HwjUhMCtTd7irhr/xFj/MlPV/Fr4jG5eTPAeITtwD1TfWiH0Ll99cNytwGJYm9M4Bo6uqvPB08Gdx55MYqBxXLpVEzZUssn+WKXLC/ZD83O1qZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713863709; c=relaxed/simple;
	bh=VRW+nV/XVjH3I/c5E1Yc59QZY0DKD2yX3+/bwLwCTg8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DBHfRXsRE/LjFlucH7op1wisYP0yWDuISW3zluYPoF6BaP0le5+91uFYRsQO/PjdALo7zjEiKXjXr5j7hM61JT8LoHEwt/MqyHsY2NJjvdCzPjlnEt6x/86x/TNh+aww8dzk0wAWRLmw0/G+sejO+BAC5ZM3s1H3h166TItOPC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YxxP0aL2; arc=fail smtp.client-ip=40.107.96.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YxxP0aL2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFXTCYiu80WF1HlDA4o0RaywIPzf3JNE6eO2j3RHDmRWIEUf4bzTeG/8ENImH4ZFjXdwbx9KDojnD0k2sTkpByZNDDa0m8WFb0Z6ZugldtFbRNLhyfujm5XD6OFbAvKBKh6tUbEtY6qTXMR/mZv+/QrADSjuA5C/zdRjnNNAf4n1ixA3GQb1phzfdeRzqRVxBNu9XC527btlPce5cMKpZ1T64aDU7ESw+T5nbxjB0hDWqw9FrqiEc2DTonA5+X1VeBpdNNJttKCzlm34UAH/J8ZgxXTazp7LEeh60o+07M16lOYrPKER6i9WkrFq51mrkuJHrohBt3XsiNF0cs7rXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rx2nXWnZHHGC2fTokCRXFK7t40Z27OD+GN9rLSZqlA=;
 b=QnHFG7b9/KmNde+5rQgox+/AYaNmQLRa4yNEyouIReJac3npk3AJqM6mXConDhmmNktA98W+/jAPXO+pHR9wVdZntNH/4B+rKZYNxVXUk7jf4UtLJXe49P/xyUE6pK4VbP4Tp1ZUpSw2km9gGQ/Xb6lBSQchUlGo9hFbHAKIyKRotH1jdvybsTxCABfoZxO9kIEJii56Bsc2FbGgViAALU1lMhlGYw9z8GNiSmVPVcN9uf3vUHjEdGkNjur9N+0yRdual4sdt3uKaBsb8APx1uBJBQk4qBS31wDMECfI3+MplyBdMCN55S+jAeqZHTl4x8Dr6SvKCGrHffF10F52sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rx2nXWnZHHGC2fTokCRXFK7t40Z27OD+GN9rLSZqlA=;
 b=YxxP0aL2r0Au6XXBKMeojJzrmQMqBtjM4GRkCiqYz15pl4m73MDkgczBeHRFWSvNsxYnwYEhP+IOSPlvAGXr99/e++1h6WxmpvAXbdfWw3Q/q5izfNCspKKPTbYcfgevoI3O0FeAxv86U2AhrJ7hS/a9eCbol8x5AY3AVKX/L7w=
Received: from SA1P222CA0182.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::20)
 by CY8PR12MB7170.namprd12.prod.outlook.com (2603:10b6:930:5a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 09:15:03 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::3b) by SA1P222CA0182.outlook.office365.com
 (2603:10b6:806:3c4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Tue, 23 Apr 2024 09:15:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Tue, 23 Apr 2024 09:15:03 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 04:15:01 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 2/3] platform/x86/amd/hsmp: Split the ACPI and non-ACPI code
Date: Tue, 23 Apr 2024 09:14:33 +0000
Message-ID: <20240423091434.2063246-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423091434.2063246-1-suma.hegde@amd.com>
References: <20240423091434.2063246-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|CY8PR12MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c43586-cc8f-4f3e-3cfd-08dc6375dc32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5KLyih9DubX7GFgugiiBhZbxBPPwd3ASnWuBdDMZZZ3y+FdpsPdIsldcT5Ex?=
 =?us-ascii?Q?03aO87WJNH2dADb4i5yrX4xxVupp8MW6+1PiQQ+zx31QRbQAbuF0uqudLioO?=
 =?us-ascii?Q?mrjQRV5wk+aP/m1l6+k3wPkmCKZkfvu4rd83XkbliVVL2hOjw/MBnLq92mVW?=
 =?us-ascii?Q?KfGJwRJuXVjZoVFjiSg5E+WzdlZ4T55RpEJsihvSM4yqVLV1dS/kOYTQArmc?=
 =?us-ascii?Q?qtbowNvMh5gA0msmzlcxBPsywAddwz3lEXfAnmSqHm2lwuiAjI+Zc09BpKqQ?=
 =?us-ascii?Q?fhUcKJXXrgwFsMsIOEqK4KxjZehrLGFWIqYBFMY5haJxCVxGb7cdOM3fNT8B?=
 =?us-ascii?Q?YqJRPeXuuULQRGKs+jmX22c2PFit0+4BsK3VfWshx+KoFE18uEVRaylH8F4y?=
 =?us-ascii?Q?VIx1P4yTHTqX5JeEkFfKREjsIzPDzsmvcY/bq6qr8sqsTHgeNZh9YBbZUA+Y?=
 =?us-ascii?Q?3qMLTNY99lHruRBxdwnZnieBmZ0IRZTtn0cMvb56KTqEorRuWg0AAgtBlMYT?=
 =?us-ascii?Q?v0nI+wO8L1suHX/dNmDzEpYqIsP/vXTBHPsQTNGONLfh09jdQSPRQcx3ZMKu?=
 =?us-ascii?Q?srm4Dd1k4F2akT7Jl0l31FFxm1Sx9IIjJTfwpeSl3Fve1sFtCnI8YdZsmFgS?=
 =?us-ascii?Q?Gt4WVzYXqFw/Z3DcTJCF9TXPirvho5qO4TQWkads4+/d018gvhoLCxb8x7t/?=
 =?us-ascii?Q?MBVXDnhsV+A8M4px8DAYTTNeUjb1dbKsXJZ9zzUmQAL/PbtTpyITpinP0C+1?=
 =?us-ascii?Q?Jn65BGOkWGHQN5XEzIq8LgZeggMLa/e4YF4GJ6syuQc5ESpjt6LzXk5GvBnH?=
 =?us-ascii?Q?hRxvvL92HceddgdjypcACUBJLURejDN3hFTIFhKQFx+N+d11cIKixvYmfMKO?=
 =?us-ascii?Q?Qfka8CSLM78XowX6qvmNflawQSo7i4ePGbYGUEnvqKoV2mAvZASt9+ReGHkF?=
 =?us-ascii?Q?m8l+oJkIzsjPURjZwQordOQ3NyFBFARcCx6arxGsFdvQamOpBkf/km920yW+?=
 =?us-ascii?Q?qFGcqn0GMrj31sYrgfiKlgVN7UX+h6D+PHV9RHdmPAD1HK40ynJPaMEiH3VC?=
 =?us-ascii?Q?eeW3eknKC0MZu49A6pVKhEaO3KLq3MjNhLflkCw4ictr7aWwlgZmSROxaMZB?=
 =?us-ascii?Q?wzGUPTtOGKEAW7VCDGeyiQbbRsWCDJjKDHQBa7ZwNUwAvuOm78wpbMDCbhbz?=
 =?us-ascii?Q?y0qtZ9SfANgZY5Tf+43i8DfeaEoEjL3YuFcbqfqz3Eq35zj0Z9IqwukJMxgZ?=
 =?us-ascii?Q?YZhTfz601b8nxsJBi9NDC0Py8brEA8iE4KZdrLR7psreJWy1Q1wJIf9ShzEM?=
 =?us-ascii?Q?Jn/6mPPee+oGiCCll+yc6j/T/YnUGc9nP3Mn7Q0ElhaJzYT1l+V712G9r/Th?=
 =?us-ascii?Q?chdTKwY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 09:15:03.5746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c43586-cc8f-4f3e-3cfd-08dc6375dc32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7170

HSMP driver is supported on ACPI as well as non-ACPI based platforms.
Making it dependent on ACPI in Kconfig, causes it to be compiled only on
systems which have ACPI enabled.
Remove this dependency by seggregating acpi specific code into
hsmp-acpi.c file.
This ensures that HSMP can be compiled with or without
ACPI enabled.

Also create hsmp/ directory with Kconfig and Makefile
to keep hsmp related files.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 MAINTAINERS                                |   2 +-
 drivers/platform/x86/amd/Kconfig           |  14 +-
 drivers/platform/x86/amd/Makefile          |   3 +-
 drivers/platform/x86/amd/hsmp/Kconfig      |  17 ++
 drivers/platform/x86/amd/hsmp/Makefile     |   9 +
 drivers/platform/x86/amd/hsmp/hsmp-acpi.c  | 219 ++++++++++++++
 drivers/platform/x86/amd/{ => hsmp}/hsmp.c | 324 +++------------------
 drivers/platform/x86/amd/hsmp/hsmp.h       |  82 ++++++
 8 files changed, 377 insertions(+), 293 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/Kconfig
 create mode 100644 drivers/platform/x86/amd/hsmp/Makefile
 create mode 100644 drivers/platform/x86/amd/hsmp/hsmp-acpi.c
 rename drivers/platform/x86/amd/{ => hsmp}/hsmp.c (72%)
 create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ebf03f5f0619..bdc390ddcc4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -999,7 +999,7 @@ S:	Maintained
 F:	Documentation/arch/x86/amd_hsmp.rst
 F:	arch/x86/include/asm/amd_hsmp.h
 F:	arch/x86/include/uapi/asm/amd_hsmp.h
-F:	drivers/platform/x86/amd/hsmp.c
+F:	drivers/platform/x86/amd/hsmp/
 
 AMD IOMMU (AMD-VI)
 M:	Joerg Roedel <joro@8bytes.org>
diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index f88682d36447..c2f16ccebec4 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -5,19 +5,7 @@
 
 source "drivers/platform/x86/amd/pmf/Kconfig"
 source "drivers/platform/x86/amd/pmc/Kconfig"
-
-config AMD_HSMP
-	tristate "AMD HSMP Driver"
-	depends on AMD_NB && X86_64 && ACPI
-	help
-	  The driver provides a way for user space tools to monitor and manage
-	  system management functionality on EPYC server CPUs from AMD.
-
-	  Host System Management Port (HSMP) interface is a mailbox interface
-	  between the x86 core and the System Management Unit (SMU) firmware.
-
-	  If you choose to compile this driver as a module the module will be
-	  called amd_hsmp.
+source "drivers/platform/x86/amd/hsmp/Kconfig"
 
 config AMD_WBRF
 	bool "AMD Wifi RF Band mitigations (WBRF)"
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index dcec0a46f8af..f0b2fe81c685 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -5,7 +5,6 @@
 #
 
 obj-$(CONFIG_AMD_PMC)		+= pmc/
-amd_hsmp-y			:= hsmp.o
-obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
+obj-$(CONFIG_AMD_HSMP)		+= hsmp/
 obj-$(CONFIG_AMD_PMF)		+= pmf/
 obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
new file mode 100644
index 000000000000..26096f901c22
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# AMD HSMP driver
+#
+
+config AMD_HSMP
+	tristate "AMD HSMP Driver"
+	depends on AMD_NB && X86_64
+	help
+	  The driver provides a way for user space tools to monitor and manage
+	  system management functionality on EPYC server CPUs from AMD.
+
+	  Host System Management Port (HSMP) interface is a mailbox interface
+	  between the x86 core and the System Management Unit (SMU) firmware.
+
+	  If you choose to compile this driver as a module the module will be
+	  called amd_hsmp.
diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
new file mode 100644
index 000000000000..0e5e4cc68145
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/x86/amd/hsmp
+# AMD Host System Management Port
+#
+
+amd_hsmp-y			:= hsmp.o
+amd_hsmp-$(CONFIG_ACPI)		+= hsmp-acpi.o
+obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
diff --git a/drivers/platform/x86/amd/hsmp/hsmp-acpi.c b/drivers/platform/x86/amd/hsmp/hsmp-acpi.c
new file mode 100644
index 000000000000..90aa1bdbf7f1
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/hsmp-acpi.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides ACPI parsing implementation for HSMP interface
+ */
+
+#include "hsmp.h"
+
+/* These are the strings specified in ACPI table */
+#define MSG_IDOFF_STR           "MsgIdOffset"
+#define MSG_ARGOFF_STR          "MsgArgOffset"
+#define MSG_RESPOFF_STR         "MsgRspOffset"
+
+/* This is the UUID used for HSMP */
+static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
+						0xa6, 0x9f, 0x4e, 0xa2,
+						0x87, 0x1f, 0xc2, 0xf6);
+
+static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
+{
+	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
+		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
+
+	return false;
+}
+
+static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
+{
+	struct hsmp_socket *sock = data;
+	struct resource r;
+
+	switch (res->type) {
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		if (!acpi_dev_resource_memory(res, &r))
+			return AE_ERROR;
+		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
+			return AE_ERROR;
+		sock->mbinfo.base_addr = r.start;
+		sock->mbinfo.size = resource_size(&r);
+		break;
+	case ACPI_RESOURCE_TYPE_END_TAG:
+		break;
+	default:
+		return AE_ERROR;
+	}
+
+	return AE_OK;
+}
+
+static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
+{
+	acpi_status status;
+
+	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
+				     hsmp_resource, sock);
+	if (ACPI_FAILURE(status)) {
+		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
+			acpi_format_exception(status));
+		return -EINVAL;
+	}
+	if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
+		return -EINVAL;
+
+	/* The mapped region should be un cached */
+	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
+					       sock->mbinfo.size);
+	if (!sock->virt_base_addr) {
+		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
+{
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *guid, *mailbox_package;
+	union acpi_object *dsd;
+	acpi_status status;
+	int ret = 0;
+	int j;
+
+	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
+					    &buf, ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status)) {
+		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
+			acpi_format_exception(status));
+		return -ENODEV;
+	}
+
+	dsd = buf.pointer;
+
+	/* HSMP _DSD property should contain 2 objects.
+	 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
+	 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
+	 *    This mailbox object contains 3 more acpi objects of type
+	 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
+	 *    these packages inturn contain 2 acpi objects of type
+	 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
+	 */
+	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
+		ret = -EINVAL;
+		goto free_buf;
+	}
+
+	guid = &dsd->package.elements[0];
+	mailbox_package = &dsd->package.elements[1];
+	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
+		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
+		ret = -EINVAL;
+		goto free_buf;
+	}
+
+	for (j = 0; j < mailbox_package->package.count; j++) {
+		union acpi_object *msgobj, *msgstr, *msgint;
+
+		msgobj	= &mailbox_package->package.elements[j];
+		msgstr	= &msgobj->package.elements[0];
+		msgint	= &msgobj->package.elements[1];
+
+		/* package should have 1 string and 1 integer object */
+		if (msgobj->type != ACPI_TYPE_PACKAGE ||
+		    msgstr->type != ACPI_TYPE_STRING ||
+		    msgint->type != ACPI_TYPE_INTEGER) {
+			ret = -EINVAL;
+			goto free_buf;
+		}
+
+		if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
+			     msgstr->string.length)) {
+			sock->mbinfo.msg_id_off = msgint->integer.value;
+		} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
+				    msgstr->string.length)) {
+			sock->mbinfo.msg_resp_off =  msgint->integer.value;
+		} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
+				    msgstr->string.length)) {
+			sock->mbinfo.msg_arg_off = msgint->integer.value;
+		} else {
+			ret = -ENOENT;
+			goto free_buf;
+		}
+	}
+
+	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
+	    !sock->mbinfo.msg_arg_off)
+		ret = -EINVAL;
+
+free_buf:
+	ACPI_FREE(buf.pointer);
+	return ret;
+}
+
+int init_acpi(struct hsmp_plat_device *plat_dev, struct device *dev)
+{
+	struct hsmp_socket *sock;
+	u16 sock_ind;
+	int ret;
+
+	plat_dev->is_acpi_device = true;
+
+	ret = hsmp_get_uid(dev, &sock_ind);
+	if (ret)
+		return ret;
+	if (sock_ind >= plat_dev->num_sockets)
+		return -EINVAL;
+
+	sock = &plat_dev->sock[sock_ind];
+
+	sock->sock_ind		= sock_ind;
+	sock->dev		= dev;
+
+	sema_init(&sock->hsmp_sem, 1);
+
+	/* Read MP1 base address from CRS method */
+	ret = hsmp_read_acpi_crs(sock);
+	if (ret)
+		return ret;
+
+	/* Read mailbox offsets from DSD table */
+	return hsmp_read_acpi_dsd(sock);
+}
+
+int check_acpi_support(struct device *dev, const struct acpi_device_id *amd_hsmp_acpi_ids)
+{
+	struct acpi_device *adev;
+
+	adev = ACPI_COMPANION(dev);
+	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
+		return 0;
+
+	return -ENODEV;
+}
+
+int hsmp_get_uid(struct device *dev, u16 *sock_ind)
+{
+	char *uid;
+
+	/*
+	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
+	 * read it and strip the "ID" part of it and convert the remaining
+	 * bytes to integer.
+	 */
+	uid = acpi_device_uid(ACPI_COMPANION(dev));
+
+	return kstrtou16(uid + 2, 10, sock_ind);
+}
+
+void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+			u32 *value, bool write)
+{
+	if (write)
+		iowrite32(*value, sock->virt_base_addr + offset);
+	else
+		*value = ioread32(sock->virt_base_addr + offset);
+}
diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
similarity index 72%
rename from drivers/platform/x86/amd/hsmp.c
rename to drivers/platform/x86/amd/hsmp/hsmp.c
index 807a5066dacc..1df2b34ddbbd 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -10,18 +10,10 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <asm/amd_hsmp.h>
-#include <asm/amd_nb.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/miscdevice.h>
-#include <linux/module.h>
-#include <linux/pci.h>
-#include <linux/platform_device.h>
-#include <linux/semaphore.h>
-#include <linux/acpi.h>
+#include "hsmp.h"
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.2"
+#define DRIVER_VERSION		"2.3"
 #define ACPI_HSMP_DEVICE_HID	"AMDI0097"
 
 /* HSMP Status / Error codes */
@@ -55,44 +47,8 @@
 #define HSMP_DEVNODE_NAME	"hsmp"
 #define HSMP_METRICS_TABLE_NAME	"metrics_bin"
 
-#define HSMP_ATTR_GRP_NAME_SIZE	10
-
-/* These are the strings specified in ACPI table */
-#define MSG_IDOFF_STR		"MsgIdOffset"
-#define MSG_ARGOFF_STR		"MsgArgOffset"
-#define MSG_RESPOFF_STR		"MsgRspOffset"
-
 #define MAX_AMD_SOCKETS 8
 
-struct hsmp_mbaddr_info {
-	u32 base_addr;
-	u32 msg_id_off;
-	u32 msg_resp_off;
-	u32 msg_arg_off;
-	u32 size;
-};
-
-struct hsmp_socket {
-	struct bin_attribute hsmp_attr;
-	struct hsmp_mbaddr_info mbinfo;
-	void __iomem *metric_tbl_addr;
-	void __iomem *virt_base_addr;
-	struct semaphore hsmp_sem;
-	char name[HSMP_ATTR_GRP_NAME_SIZE];
-	struct pci_dev *root;
-	struct device *dev;
-	u16 sock_ind;
-};
-
-struct hsmp_plat_device {
-	struct miscdevice hsmp_device;
-	struct hsmp_socket *sock;
-	u32 proto_ver;
-	u16 num_sockets;
-	bool is_acpi_device;
-	bool is_probed;
-};
-
 static struct hsmp_plat_device plat_dev;
 
 static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
@@ -114,15 +70,6 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 	return ret;
 }
 
-static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
-			       u32 *value, bool write)
-{
-	if (write)
-		iowrite32(*value, sock->virt_base_addr + offset);
-	else
-		*value = ioread32(sock->virt_base_addr + offset);
-}
-
 static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
 			 u32 *value, bool write)
 {
@@ -321,6 +268,22 @@ static int hsmp_test(u16 sock_ind, u32 value)
 	return ret;
 }
 
+static int hsmp_cache_proto_ver(u16 sock_ind)
+{
+	struct hsmp_message msg = { 0 };
+	int ret;
+
+	msg.msg_id	= HSMP_GET_PROTO_VER;
+	msg.sock_ind	= sock_ind;
+	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
+
+	ret = hsmp_send_message(&msg);
+	if (!ret)
+		plat_dev.proto_ver = msg.args[0];
+
+	return ret;
+}
+
 static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
@@ -383,181 +346,6 @@ static const struct file_operations hsmp_fops = {
 	.compat_ioctl	= hsmp_ioctl,
 };
 
-/* This is the UUID used for HSMP */
-static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
-						0xa6, 0x9f, 0x4e, 0xa2,
-						0x87, 0x1f, 0xc2, 0xf6);
-
-static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
-{
-	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
-		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
-
-	return false;
-}
-
-static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
-{
-	char *uid;
-
-	/*
-	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
-	 * read it and strip the "ID" part of it and convert the remaining
-	 * bytes to integer.
-	 */
-	uid = acpi_device_uid(ACPI_COMPANION(dev));
-
-	return kstrtou16(uid + 2, 10, sock_ind);
-}
-
-static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
-{
-	struct hsmp_socket *sock = data;
-	struct resource r;
-
-	switch (res->type) {
-	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
-		if (!acpi_dev_resource_memory(res, &r))
-			return AE_ERROR;
-		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
-			return AE_ERROR;
-		sock->mbinfo.base_addr = r.start;
-		sock->mbinfo.size = resource_size(&r);
-		break;
-	case ACPI_RESOURCE_TYPE_END_TAG:
-		break;
-	default:
-		return AE_ERROR;
-	}
-
-	return AE_OK;
-}
-
-static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
-{
-	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *guid, *mailbox_package;
-	union acpi_object *dsd;
-	acpi_status status;
-	int ret = 0;
-	int j;
-
-	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
-					    &buf, ACPI_TYPE_PACKAGE);
-	if (ACPI_FAILURE(status)) {
-		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
-			acpi_format_exception(status));
-		return -ENODEV;
-	}
-
-	dsd = buf.pointer;
-
-	/* HSMP _DSD property should contain 2 objects.
-	 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
-	 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
-	 *    This mailbox object contains 3 more acpi objects of type
-	 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
-	 *    these packages inturn contain 2 acpi objects of type
-	 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
-	 */
-	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
-		ret = -EINVAL;
-		goto free_buf;
-	}
-
-	guid = &dsd->package.elements[0];
-	mailbox_package = &dsd->package.elements[1];
-	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
-		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
-		ret = -EINVAL;
-		goto free_buf;
-	}
-
-	for (j = 0; j < mailbox_package->package.count; j++) {
-		union acpi_object *msgobj, *msgstr, *msgint;
-
-		msgobj	= &mailbox_package->package.elements[j];
-		msgstr	= &msgobj->package.elements[0];
-		msgint	= &msgobj->package.elements[1];
-
-		/* package should have 1 string and 1 integer object */
-		if (msgobj->type != ACPI_TYPE_PACKAGE ||
-		    msgstr->type != ACPI_TYPE_STRING ||
-		    msgint->type != ACPI_TYPE_INTEGER) {
-			ret = -EINVAL;
-			goto free_buf;
-		}
-
-		if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
-			     msgstr->string.length)) {
-			sock->mbinfo.msg_id_off = msgint->integer.value;
-		} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
-				    msgstr->string.length)) {
-			sock->mbinfo.msg_resp_off =  msgint->integer.value;
-		} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
-				    msgstr->string.length)) {
-			sock->mbinfo.msg_arg_off = msgint->integer.value;
-		} else {
-			ret = -ENOENT;
-			goto free_buf;
-		}
-	}
-
-	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
-	    !sock->mbinfo.msg_arg_off)
-		ret = -EINVAL;
-
-free_buf:
-	ACPI_FREE(buf.pointer);
-	return ret;
-}
-
-static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
-{
-	acpi_status status;
-
-	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
-				     hsmp_resource, sock);
-	if (ACPI_FAILURE(status)) {
-		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
-			acpi_format_exception(status));
-		return -EINVAL;
-	}
-	if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
-		return -EINVAL;
-
-	/* The mapped region should be un cached */
-	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
-					       sock->mbinfo.size);
-	if (!sock->virt_base_addr) {
-		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
-/* Parse the ACPI table to read the data */
-static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
-{
-	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
-	int ret;
-
-	sock->sock_ind		= sock_ind;
-	sock->dev		= dev;
-	plat_dev.is_acpi_device	= true;
-
-	sema_init(&sock->hsmp_sem, 1);
-
-	/* Read MP1 base address from CRS method */
-	ret = hsmp_read_acpi_crs(sock);
-	if (ret)
-		return ret;
-
-	/* Read mailbox offsets from DSD table */
-	return hsmp_read_acpi_dsd(sock);
-}
-
 static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 				    struct bin_attribute *bin_attr, char *buf,
 				    loff_t off, size_t count)
@@ -670,8 +458,15 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
 {
 	const struct attribute_group **hsmp_attr_grps;
 	struct attribute_group *attr_grp;
+	int ret;
 	u16 i;
 
+	ret = hsmp_cache_proto_ver(0);
+	if (ret) {
+		dev_err(dev, "Failed to read HSMP protocol version\n");
+		return ret;
+	}
+
 	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
 				      sizeof(*hsmp_attr_grps),
 				      GFP_KERNEL);
@@ -706,12 +501,18 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
 	if (!attr_grp)
 		return -ENOMEM;
 
-	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
-
 	ret = hsmp_get_uid(dev, &sock_ind);
 	if (ret)
 		return ret;
 
+	ret = hsmp_cache_proto_ver(sock_ind);
+	if (ret) {
+		dev_err(dev, "Failed to read HSMP protocol version\n");
+		return ret;
+	}
+
+	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
+
 	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
 	if (ret)
 		return ret;
@@ -719,22 +520,6 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
 	return devm_device_add_group(dev, attr_grp);
 }
 
-static int hsmp_cache_proto_ver(u16 sock_ind)
-{
-	struct hsmp_message msg = { 0 };
-	int ret;
-
-	msg.msg_id	= HSMP_GET_PROTO_VER;
-	msg.sock_ind	= sock_ind;
-	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
-
-	ret = hsmp_send_message(&msg);
-	if (!ret)
-		plat_dev.proto_ver = msg.args[0];
-
-	return ret;
-}
-
 static inline bool is_f1a_m0h(void)
 {
 	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
@@ -791,8 +576,6 @@ MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
 
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
-	struct acpi_device *adev;
-	u16 sock_ind = 0;
 	int ret;
 
 	/*
@@ -809,46 +592,33 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		if (!plat_dev.sock)
 			return -ENOMEM;
 	}
-	adev = ACPI_COMPANION(&pdev->dev);
-	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids)) {
-		ret = hsmp_get_uid(&pdev->dev, &sock_ind);
-		if (ret)
-			return ret;
-		if (sock_ind >= plat_dev.num_sockets)
-			return -EINVAL;
-		ret = hsmp_parse_acpi_table(&pdev->dev, sock_ind);
+
+	ret = check_acpi_support(&pdev->dev, amd_hsmp_acpi_ids);
+	if (!ret) {
+		ret = init_acpi(&plat_dev, &pdev->dev);
 		if (ret) {
-			dev_err(&pdev->dev, "Failed to parse ACPI table\n");
+			dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
 			return ret;
 		}
-		/* Test the hsmp interface */
-		ret = hsmp_test(sock_ind, 0xDEADBEEF);
+
+		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
 		if (ret) {
-			dev_err(&pdev->dev, "HSMP test message failed on Fam:%x model:%x\n",
-				boot_cpu_data.x86, boot_cpu_data.x86_model);
-			dev_err(&pdev->dev, "Is HSMP disabled in BIOS ?\n");
+			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
 			return ret;
 		}
 	} else {
 		ret = init_platform_device(&pdev->dev);
 		if (ret) {
-			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
+			dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
 			return ret;
 		}
-	}
-
-	ret = hsmp_cache_proto_ver(sock_ind);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to read HSMP protocol version\n");
-		return ret;
-	}
 
-	if (plat_dev.is_acpi_device)
-		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
-	else
 		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
+			return ret;
+		}
+	}
 
 	if (!plat_dev.is_probed) {
 		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
new file mode 100644
index 000000000000..23629ccb1fb0
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides a header implementation for HSMP interface
+ */
+
+#ifndef _HSMP_H
+#define _HSMP_H
+
+#include <asm/amd_nb.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/semaphore.h>
+#include <linux/acpi.h>
+#include <linux/miscdevice.h>
+
+#define HSMP_ATTR_GRP_NAME_SIZE 10
+
+struct hsmp_mbaddr_info {
+	u32 base_addr;
+	u32 msg_id_off;
+	u32 msg_resp_off;
+	u32 msg_arg_off;
+	u32 size;
+};
+
+struct hsmp_socket {
+	struct bin_attribute hsmp_attr;
+	struct hsmp_mbaddr_info mbinfo;
+	void __iomem *metric_tbl_addr;
+	void __iomem *virt_base_addr;
+	struct semaphore hsmp_sem;
+	char name[HSMP_ATTR_GRP_NAME_SIZE];
+	struct pci_dev *root;
+	struct device *dev;
+	u16 sock_ind;
+};
+
+struct hsmp_plat_device {
+	struct miscdevice hsmp_device;
+	struct hsmp_socket *sock;
+	u32 proto_ver;
+	u16 num_sockets;
+	bool is_acpi_device;
+	bool is_probed;
+};
+
+#ifdef CONFIG_ACPI
+int hsmp_get_uid(struct device *dev, u16 *sock_ind);
+void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+			u32 *value, bool write);
+int check_acpi_support(struct device *dev, const struct acpi_device_id *amd_hsmp_acpi_ids);
+int init_acpi(struct hsmp_plat_device *plat_dev, struct device *dev);
+#else
+static inline void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+				      u32 *value, bool write)
+{
+}
+
+static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
+{
+	return -ENODEV;
+}
+
+static inline int check_acpi_support(struct device *dev,
+				     const struct acpi_device_id *amd_hsmp_acpi_ids)
+{
+	return -ENODEV;
+}
+
+static inline int init_acpi(struct hsmp_plat_device *plat_dev, struct device *dev)
+{
+	return -ENODEV;
+}
+#endif
+#endif
-- 
2.25.1

