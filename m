Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272101EB40
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jul 2024 17:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721497589; cv=fail; b=IB0jAeZ8qDE6KeQx02OEwMLFw/jm0budiBbMzCjaUlBY6goMpmDODMLBdD+sXU3CNvP0R1W+DBZCgS3ieHmDelGGhWZo8N+rdRd9cafTjju9C+1mhCwqNKbv/6gEKrPY3wAdFA+YrWKDZqzCVNvG61TtxpMbLnG90FnKemB5/kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721497589; c=relaxed/simple;
	bh=wRGoYZraYYSdUFcKWyKQTz2nqWTygemGTWS++xQzNgs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IY8OHSOLvbKIxcy3fUhyg4nx0NEP/NnkYAQpnYRqA4Ad61QLo2Wp8sUb9AoBFZkfDx6MbsVqlhvMa7rjmZs8MCx//q3UJ0/69wa1P9th+WWmzkhtWQolcCW7ZDcUkGPvMegIygKUccuW9hKvjeKraImww7bMopVWG6EYL+gs6Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jsXnd9xg; arc=fail smtp.client-ip=40.107.223.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jsXnd9xg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcDyAHFfovFcqCKcDDbxcGBbJfhgmI825DymSx93ZV0UvHTFfXbeUenjl1zSRGbXrQCTm/Sl+Od/iFHtBC0NOVxwJlmSXr4hcS4d+P7wLpc5BYa/e2IWEBXOEKxYBY6HXfhSpe3KSY1o3AR22gBWwKIMdxHjfOIILbOx45Z5PuT8h0jcyjZepkI8MOfgUSF3vbtudRLCQyera+2FxJt0mSCYeU8FkznuF6kUFWjl5z/wiEuumaApMQP9yPCjc3KN29aTJLddbZXPKySEEN7xociWw9o+0A3x9SCe5xOh8Yp7DzAkwdtIf2GeJ5wwqzglEXeU6EBStUQZA0c9C2eyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVws/B3GnJ9ASsu2GOgnh8U+NaZKPytyKWjlV2XxKYc=;
 b=NDsAZYMbkZxW4+wRiqJj+Aen+/3a7yKGm/8dUJiLFjf57s2OQTbLGXGQO0y3WzqDBsQT0OYmE9VhE3xWumAgej7Y0dWG56Psh7W+XtnqD12F3+wRTDE08nm5AOtM3ocjv3q/bEHjTu5tE3VL3pFf7LiLpQGgiP0GinOxoSyqbakGL0wLoE7asbQd/1wwzyhxOJF5fYxz1DvJYJksUUPiY35YF0hoK3PswPHMYb1ye5UvE7pRkZLFjat60JRpf6doRAZYQYhCOIuDgRDdAiUuBXwSk7AdQBk2A8fdW//kLVZZsrPSlIp71tGINd8pPp5NLRfbNppZcJjOzsAmipB+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVws/B3GnJ9ASsu2GOgnh8U+NaZKPytyKWjlV2XxKYc=;
 b=jsXnd9xgPW9Nyc5jfjkxMdu0XjBOJaCsKXHMZf1J5XihfCdUMKQv0zB0iSCer83539FaIHM4dLpotva57eM+qs5l/F+6v2boCUxY2QOq5vTseZ3htrY4zKprfXHQc334bw5lTdQUDbHlQatHV7JcPgx3bOTRfMFNr2nwHn1IXLQ=
Received: from DM5PR07CA0051.namprd07.prod.outlook.com (2603:10b6:4:ad::16) by
 PH7PR12MB6635.namprd12.prod.outlook.com (2603:10b6:510:210::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Sat, 20 Jul
 2024 17:46:24 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:4:ad:cafe::53) by DM5PR07CA0051.outlook.office365.com
 (2603:10b6:4:ad::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Sat, 20 Jul 2024 17:46:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Sat, 20 Jul 2024 17:46:24 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 20 Jul
 2024 12:46:22 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 01/11] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Sat, 20 Jul 2024 17:45:42 +0000
Message-ID: <20240720174552.946255-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|PH7PR12MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8da700-be4f-4671-0c8a-08dca8e3dfe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SH0I/cNi4U/2Slm96ezWNbri99Reg4jvjB1yAaWmoaD8EDCiInCWLjfTJhNV?=
 =?us-ascii?Q?dBerT7hreWfeqfVQtjW3D31KCOxtktxOZjF5ffCMi2pwVQuNtiidxa/c+tp6?=
 =?us-ascii?Q?C8BWpQCC/IcqiPEL6wXpUfzCmz4qB5a+MgcdRFEg4MrYB0pQM+cEyjGKseoZ?=
 =?us-ascii?Q?hyzBccvHyvCirhAwGtqlK1+K9exnMYfJsATQildyCFGt3rdWTYv7l/zGaqeU?=
 =?us-ascii?Q?gEbI85Td4fT8jbRXqLVJS6vSHGcCvD2AAZXQ+JO2H8yfgvde+LI1ofyr9ocs?=
 =?us-ascii?Q?d78sGwl/RHIuJ6Ea9tpdFu+MKmv6LSeJA7DMph6Twu5rH7itT5Tf5dxL7s2c?=
 =?us-ascii?Q?prBAJF72urrGsNAFXSo0bb2jjPFlCuax26FjiviDYjDPfWnlgwQD+XgGzznm?=
 =?us-ascii?Q?sdvYa+bhMo9bLFITbri+C9juYm80+6FfXKVXU9e5xAB3e2/iEl8G+a2fd4Fk?=
 =?us-ascii?Q?RDWisBrIIvL7M99HVwzDATEQOFxYFwuCKPJEaZx1ZWuuGmEJJCi40H474OSQ?=
 =?us-ascii?Q?9aUg1t8bD3ERRc0tIyhr017YjF25NPAQD36HxDAyiUG652RQ/B/qxMdWF3WK?=
 =?us-ascii?Q?Lvia8yxIKQb+Ri6Hx6dMgTG/AOrVQap1co7o89la2Ei8pXCGd3NjToaSXtTl?=
 =?us-ascii?Q?3XPwqOLQ4sm5+X610NaDmFAQk3Ko1owvG3FIycdYZ748VJ8I7KlyVeRrW07b?=
 =?us-ascii?Q?y3vKSlyG1v8ChAy8SbiMdPkzpH7ABvXynGH8XBEX+eBD5qlGvCTkys/xSLoq?=
 =?us-ascii?Q?fypwAW1r6BkV1TJHgplXDxnpoVYhCEiODtxIE/rbjJtJlr4Z+grl4REWOnTG?=
 =?us-ascii?Q?ARIVYwsvm3kpcionNLiU58ToZolIusu9cGegYcxchNZMmLAA7b8BHTNY0i3F?=
 =?us-ascii?Q?1R2ZQX45m+frasqv9+jDs9Jl4G0noy0mgiBP+UpBBxxnbI4GJIiBI8d8lgkj?=
 =?us-ascii?Q?f9X2ERmkcpriuLSdRNETScm6ZJPVY+gMXCby/5OB++DuC2LnC6/4hsuYrsUF?=
 =?us-ascii?Q?hbchQnx/Xa45ach5hEJA5B1+atuPROIsWqfWbNNMJBmP3QS4v5dn4VCpEjKP?=
 =?us-ascii?Q?r4q8UvNuAxYDMgY13F2o1qOkGAdR5FTqEVaR0O9OxzLUIrYhHg8B8XVEUX3k?=
 =?us-ascii?Q?4FZaodmHula9DxhrEmaBOx/QITRPjTeDdpm0X0WzVTFshLouw3C6NkiWl9x2?=
 =?us-ascii?Q?NXEpm5V/PzDDLVOVJ1sxmWCh9OXz9XChETha9Ge/JPcl4lnmcLMlvSahYTc4?=
 =?us-ascii?Q?viA93sHpmsGYu9/D+4WB4c0TJiyTYSVsnY59boWonbDdu6eWGQfsm7LkkLPe?=
 =?us-ascii?Q?9c7zqGQ4P9j9eCFhEs0yYJ8bVBFEXrjY0ImpkVzU1WmAYvlHhK1aY2Dr1Wig?=
 =?us-ascii?Q?NsLa8bSj+pYnq0LorG4vkMVMdhGl9GGTvfT1VS+INDhlow44ld4WT+s7Q3xm?=
 =?us-ascii?Q?JS9OvErRu33gHpaNKp5GWS7WD+MVtCUL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 17:46:24.5784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8da700-be4f-4671-0c8a-08dca8e3dfe1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6635

This is in preparation to splitting ACPI and platform device drivers.
Create and move hsmp specific code into its own directory,
no logical changes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v2:
None
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

