Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E9B14B978
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683221; cv=fail; b=DqJkxxK2Y2MtTi6SGZOhw9pjq+hSltWKkcfuiEiitUiYmNvyHfdBAXk+oIigeFQTiyih5cXCnf1NOeAWHTsf8Lq7JeVTr8aktF9wbyJqQ/NuvPGDzSttErBuGk+DwcjTGqv+9a/XeXjEm5Pf+D+0Rjb//qxAlGlguywse6uFaz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683221; c=relaxed/simple;
	bh=h+QCMvgAyrZ9+MbPqPKfZ0dhaEnnjAPS3UEmgic3jTM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jKiIzWFI1cWDOMXehdiBljsol+WU+L+PqatSsnrIPYpq3Xf3quNIMA5AzKiM0tEK/plCzwzd7NdI94FUIYFejeRsZ5fz3M6hL7Qrk6xzrVwNdt0K5s1e+ibYunbgbG0LhtsSqqfQJHelhX8t9lMRGO4tx4qJl/2UnGf0miu4aJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uHNciMI9; arc=fail smtp.client-ip=40.107.220.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uHNciMI9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTVFl6xe1G9QkkHJqQuC0RvIjlOYwPz2tbEd2/CZLIHlUZ0aWK6fkekx+Asca+PmyJaQXsTwdGfIZJgoL8o5aqefr/BViJGWIZGhWMfHLpJidEjdqZPTkmf8y4a7XBUWE+UxNIv8s7jP9IRb6PDlZL7rua/E19gAyeGTs9KOOl+xvZvbeVzInbH1IWjNWytRi4wDziMnX+AN+FPVBHo5G08uRLJzCi94Ed98hDNCeuB6LXABBYFfNYegh2rUcIvsJ+xEgN9pu1ge72bOhA1wSc4uXKAawXyvUAk1uMU1h800/bkU2n+hqbaZgkCqANoQ7dCXfsW45NMEF/h2AVirQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjLUmVrql1SGcfqAwELFYnY2A+pDJR1ldEBNlWfqH4Q=;
 b=hkeN25v2KSkIHPgwaAxmhHkV+LCIAAv5BHzkrFmm+NQzz1UHuXTrSMgraEiUhdfzY1FSRRVNmtcSJRusFEtgz6B8AM/AJI1ypwz2R67SN0FajyvokmmH7PFwlAPGxX7mPgLfdJfTtVaOeAQ1JtAZOae/qITdGMfy77k9lCtTV5EhFeFR8OowBM7jd8Grm+ObpMmN45Ki/3P1gQ/D2oEYxSEgqboyfr3bIBAz3uvKRDDHxkcH6VL2I+SB94LNlAhdy8mxxlMLA3U6L+VOKw3QhU5FLk6n+JiWyKMSrFHp4rhLIILnQnyXCvO9g8vIypgccVZ5/F4qBg8bOtecdegEgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjLUmVrql1SGcfqAwELFYnY2A+pDJR1ldEBNlWfqH4Q=;
 b=uHNciMI9AZHMeYKcgwBHWxtO63ha2YMAX9a5fHqNYUqMUZfGgHU9rdvhVTQxoQK+18UqVkxFrWhrqtXFV2tRVYv3231oEZBgYKLKyIhlAm+nqdvNY1ETXmMtvsU16FVd9QGGG/Bk+YxPh/t5bDCGkS3QnJh11ZPY7nN2dEKrh74=
Received: from BL0PR01CA0032.prod.exchangelabs.com (2603:10b6:208:71::45) by
 CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Thu, 11 Jul 2024 07:33:36 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:71:cafe::21) by BL0PR01CA0032.outlook.office365.com
 (2603:10b6:208:71::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20 via Frontend
 Transport; Thu, 11 Jul 2024 07:33:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 07:33:36 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 02:33:34 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 01/11] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Thu, 11 Jul 2024 07:33:04 +0000
Message-ID: <20240711073314.2704871-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|CY8PR12MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 1427f65d-13e3-4ac8-0610-08dca17bc6a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RsKnJozq4X6omCB2eaAXcuPo5xDpaD81/LUTimz+YMTJAMveVKDVDuBo76Lu?=
 =?us-ascii?Q?FUSZNJsx12CBxsO+amdJ5aUGvIPOFpZIVas8jyUBDVCbPtiPFhRZ+doi/10t?=
 =?us-ascii?Q?4ZcMV6uH6EY6YEa9Tl9L9+NUxlI7hjuqP/cDG6LX65bRINIOP77Gmq3dp//M?=
 =?us-ascii?Q?IvzpRNclvtOynQhD0A5u+JP5rnAFDIB35/J6n3LJRUZ0XU4ZDcnB5AUd1xER?=
 =?us-ascii?Q?YrdLFtyp06EhTTzoROxVi6L/zY7Eh3y80itshQnF7ESjRncCUxhzpzmt6+SN?=
 =?us-ascii?Q?vm6uBRT9B1Nb6xvtMya/5f0W0/LajaDPtPqi2G2/3vE1S408y2wFJVfZMXVJ?=
 =?us-ascii?Q?KUCrvxjULs/2PuoN/u7TELxyOnPPXahYDg7Wh7iqQsjk+a5ZebbSTUR666ax?=
 =?us-ascii?Q?poW+NebKxB2hq50pUEA+FDMvoomAUI3H5cPHB7yvI5rF5D9P3D+6dgkkgGut?=
 =?us-ascii?Q?2k3J264G8S7LeYape7yDlhrt71yeLmrkqRd355nSX2mR/7j+kQEHiswOv2q1?=
 =?us-ascii?Q?ER5vIp7divyiKQs5NTljagzbC4rSvFTfOXG6IDmRAv5tUqrj0Td5gghTtH2K?=
 =?us-ascii?Q?TnpH7vKZsGMvLNRSxS0U0ijV2zLyTqhyvKxQdJp/RoBbKEdJVAQS5hN70vEc?=
 =?us-ascii?Q?6FZw625zJS+/kHD9CcYNFIwe59VyEQE+i2mYD6LBMX8Wng+QNX2WlDKzFF+m?=
 =?us-ascii?Q?4GcgBYcxfDwk+t0G945Nd71R9i0OgnqD3noFnlZMzp8HsGcegidJAaYijPRA?=
 =?us-ascii?Q?3oTxYx/E/QDQv4rMGjUZFhnvJh/SHgmBIW2hcM0phr0Ov3bB9aOXOyd0mnlV?=
 =?us-ascii?Q?IBVl19yZfocD37TZVrJbXZnUkmJs2qcSdttNp6M2NLOrMay1bz2yW8etRd8s?=
 =?us-ascii?Q?lX2XtyB4RUf99W1+OUvSsg3+7ockaWBUY+EJWdS5nB04lK7b/tG/uj8B27M3?=
 =?us-ascii?Q?N+p2V1Upjrq5J2jqKDaXQYpEyE0jhEs+uUstOuR/IFYfPecJYarFbnN1s1uV?=
 =?us-ascii?Q?eGKvKIzhPD6e0lZQskeO+zchVg9Ox36rMFW24/GAq5U+GdvJzbm4S4r1IRFr?=
 =?us-ascii?Q?qNxFtx+Hk/LLWXipvO9n9XNrWqe1uQMnVUdQDwwAS77f8kyDZpVJYPIE0NYz?=
 =?us-ascii?Q?Xnnw7vPjpO2jmg9zNbf9Vu44LVsKi36diTYq11SSApH7o+H64odU8IQ1OVSB?=
 =?us-ascii?Q?R73wYp/R3kpxqwv8q8Dv3UA+24AcExoNW7I3frQgomrR6rVvfa6lNc6yoe9y?=
 =?us-ascii?Q?QGEMZFMIay6/jOalXDD0O4PQtu7j7eYaAocvXAxu4q76zN0gVFVWW9yG0wrl?=
 =?us-ascii?Q?W3vJwWbs5mcigH0rJA09jTMM5EPusKY7Fb0pNffXUmmixPzmJ7XslEunxPT9?=
 =?us-ascii?Q?l4h0bMRaFpuUsx7vo51YX8uwfi2Mdio82GSRdlNzVthP4xKq0PVVZanqi7FQ?=
 =?us-ascii?Q?K3au9FJQi9cxTRCaaGosmcajNjbnnZ3H?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:33:36.4411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1427f65d-13e3-4ac8-0610-08dca17bc6a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7705

This is in preparation to splitting ACPI and platform device drivers.
Create and move hsmp specific code into its own directory,
no logical changes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
None

 MAINTAINERS                                |  2 +-
 drivers/platform/x86/amd/Kconfig           | 14 +-------------
 drivers/platform/x86/amd/Makefile          |  3 +--
 drivers/platform/x86/amd/hsmp/Kconfig      | 17 +++++++++++++++++
 drivers/platform/x86/amd/hsmp/Makefile     |  8 ++++++++
 drivers/platform/x86/amd/{ => hsmp}/hsmp.c |  0
 6 files changed, 28 insertions(+), 16 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/Kconfig
 create mode 100644 drivers/platform/x86/amd/hsmp/Makefile
 rename drivers/platform/x86/amd/{ => hsmp}/hsmp.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..a7d79d1f7ec1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1037,7 +1037,7 @@ S:	Maintained
 F:	Documentation/arch/x86/amd_hsmp.rst
 F:	arch/x86/include/asm/amd_hsmp.h
 F:	arch/x86/include/uapi/asm/amd_hsmp.h
-F:	drivers/platform/x86/amd/hsmp.c
+F:	drivers/platform/x86/amd/hsmp/
 
 AMD IOMMU (AMD-VI)
 M:	Joerg Roedel <joro@8bytes.org>
diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index f88682d36447..2c671cc17d63 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -3,22 +3,10 @@
 # AMD x86 Platform Specific Drivers
 #
 
+source "drivers/platform/x86/amd/hsmp/Kconfig"
 source "drivers/platform/x86/amd/pmf/Kconfig"
 source "drivers/platform/x86/amd/pmc/Kconfig"
 
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
-
 config AMD_WBRF
 	bool "AMD Wifi RF Band mitigations (WBRF)"
 	depends on ACPI
diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
index dcec0a46f8af..96ec24c8701b 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -5,7 +5,6 @@
 #
 
 obj-$(CONFIG_AMD_PMC)		+= pmc/
-amd_hsmp-y			:= hsmp.o
-obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
+obj-y				+= hsmp/
 obj-$(CONFIG_AMD_PMF)		+= pmf/
 obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
new file mode 100644
index 000000000000..b55d4ed9bceb
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# AMD HSMP Driver
+#
+
+config AMD_HSMP
+	tristate "AMD HSMP Driver"
+	depends on AMD_NB && X86_64 && ACPI
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
index 000000000000..fda64906a5e8
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for drivers/platform/x86/amd/hsmp
+# AMD HSMP Driver
+#
+
+obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
+amd_hsmp-objs			:= hsmp.o
diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
similarity index 100%
rename from drivers/platform/x86/amd/hsmp.c
rename to drivers/platform/x86/amd/hsmp/hsmp.c
-- 
2.25.1

