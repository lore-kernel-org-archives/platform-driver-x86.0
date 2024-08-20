Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B618CBF9
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 10:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149809; cv=fail; b=XtyMmQx9/EhS8X6MbhajnKR9bYwRJ9pHUcaX0leQ/COuN8RaYN9Sp5ZTSOvMbwZQzF9ti9EJoTE5u9qIFjALqi6vGMLWOD7/sG10BelH0EKSwF/ro7tTKosTxZPK9U/ssodk5AtJtstp+xpMhWQfptaBmMZoIvMZSRpMOwWVk14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149809; c=relaxed/simple;
	bh=2+j3r7yxho4wmMEJp2KkG+5LFB23wxw/303SteLop+U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FAYBOfuzdEUgSt4xznsqeljdv+TTH6zeodFULPe3+X63o+hjllfgaUBq1ehnJBstaYqHl97Lo9zHylIUuTAAeq8D2PBujELPSw/wO7MzRxJnCwx2scJID3GU67FwmrYHTj45kx92hDw7n46Mwi20s55mIhxoNgpfcSJbLVNv810=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d8g9ytM8; arc=fail smtp.client-ip=40.107.243.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d8g9ytM8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HINTmzqVXRa1Xs+DveukM77n+6ixz3NsCf3VbB8dG8v23VaESr5b8xNmngyVC6gKpQfgSXeFYcWcg6DcAebwC0Sy/vvN2MyZBxVay14OFn00ip95I7B7QwTlPPN1So9RMwEqN65XCXCfRECXcxcbO0rYQdg6ZsZv/xvjn8XF1LOECPYBtFdJqiKYgGo/Y9Buvh9S+wRDXqkx+y/jXwSJ+j9pWZ8cz32fLrBuXRKWcLLLcnLVBJuEe6Tkv4Iimr1N0dvKCnFIkpbRwgVJRW3sKejwGDxzp1Qomkl4n6W6Hg6Sb769NwjcGyac8ez2zAzHBYFBEjrYJrHruYGDHApm5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/23c2nE0x/wnwxoJgN1Y7itWqoaS5YIjLjVrPheKGs=;
 b=LpBh7kJhzwz1qP09T5NJkW5efk0mMcL/rITGyzQS9sLzFs/ZJVKZVXs28A6elgpNbPgeE77A3jtquSsK2ZI3qqEgLKIjiwewo6Nhfx2RH/jDThOhD7aMS8yddS7WWIDciyaTCdJDZP/l9gN8qJK9978ts9XBHyxyBHKj67juzqmK0E+AEKiX3aENzRbTYLfxsewmg1NDFUNzJWgEAUZ97eKqFGhkNDc1nG2Tc8Cl4hDbnYAjcjk8o3jVricfmPngb2doUjt2p4VJgJmE1cy1u4mmG7Y5Kw5IZNoNSTS5nyZX6j7JdrxmScwlOLs3po1dG5wplAtW7Y1g3XE21ytb1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/23c2nE0x/wnwxoJgN1Y7itWqoaS5YIjLjVrPheKGs=;
 b=d8g9ytM84UwlX19w0EBIkHvMxUd9tG2CWNPG5PjJ3xbDfdr76eZOobWZSXXg+dDJqGzY8U6a5V1M7BZFlZik8b2QqVVlmWlgAnV66+Z6bmBAvXw3xHdpkWTv+m1Lez8rEREsmQ9Hlo+NpBoyq6Heos2DtHm47RiL4J5gC2E+YXs=
Received: from BY5PR04CA0023.namprd04.prod.outlook.com (2603:10b6:a03:1d0::33)
 by CY5PR12MB6106.namprd12.prod.outlook.com (2603:10b6:930:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 20 Aug
 2024 10:30:04 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::d5) by BY5PR04CA0023.outlook.office365.com
 (2603:10b6:a03:1d0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22 via Frontend
 Transport; Tue, 20 Aug 2024 10:30:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 10:30:04 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 05:30:01 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4 01/11] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Tue, 20 Aug 2024 10:29:31 +0000
Message-ID: <20240820102941.1813163-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|CY5PR12MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 2293c99b-1d34-4dc6-20d7-08dcc1030e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWpKM0RDU1RKSEYyYko3Uzk3VVB1Ymh3VWo0ZkE5NlZheWYramhMZTJ1dkJQ?=
 =?utf-8?B?cHZvU202VXFpdW9XcDJISjNKN0daL0piQm1kcS93ejM0NjdoMXRnL3VKYVBE?=
 =?utf-8?B?NUhGeXZjQ3hXSEloMmFETVZweHhDNFFtUHRKWTBzeTd0UG16RXdUaStSRmNH?=
 =?utf-8?B?TDJ0dXA5Z0RmUHFFQVArS1h3eXAycUE2OFV3TTd0Vm0rZlY5YUNhZ1VMRnl1?=
 =?utf-8?B?SjlPMEt4c2lMVzNPQlhORlZEa2E5UGV1dzN3RTIrQUJ4ak1rTEJ5SzFCTml5?=
 =?utf-8?B?eCtIdzh6SjNYYzlFekFOR0tpQXE0N0UwOHB3WkhMbXVNM1RKWU1PbHVXZ1E3?=
 =?utf-8?B?Umh2bENUWXNqZzd5QUc2RlU1ckkrU09DL2ZuNnJWczVGQXRWbEtKeFFyMktU?=
 =?utf-8?B?VVJOdm1pRlBIbXpiVWNzS0lUeUtGS2RYSHhWR2dpSngvRkFyZ1Q5NEdSYjdU?=
 =?utf-8?B?VmN3c3lWc0NGTkp2bGtjTWRxUDNQbVl4elgrR2tPZ1RFczBVRklSRXlqbURj?=
 =?utf-8?B?MjNmbGYwTlZrekxaVHlxZmVuUUhvRWo4YXZNVkxrTmxDS2c5SS9WSTRNbnpx?=
 =?utf-8?B?OCtVRHB0N1ZGOTNrakVPRDNQK3lRZCtYVjFnYW5HMmhKODRIRUNSOW9aYUdX?=
 =?utf-8?B?TTB0V1dQcTFyTWtiUUxoUW4zVWxnK2d1a0VDckJvREpRd2FaQ3REbnhMbFBu?=
 =?utf-8?B?TGFqc2grb2d4aDBkVjlmUml4eWMyKzhlZ0NraGM2ZmtWb2c0U1dodWZUQ3ZS?=
 =?utf-8?B?dDFVTllmYXZHMkQ5MzJqRmZoS1o0dk5BbTFvQVgzdFVFU2ErUlFtNUZzMlV6?=
 =?utf-8?B?elFWUW9JSFBiV3VtcC9DOGdMQ1VDdUsxQVlKYUJrT3l1aEovVlJpa3hmSVMv?=
 =?utf-8?B?V1V3R1dwRUZreklOcjM1MWFHTVlaRFM5MjhETUE5bTNHbkRoM2t3SjlCNkxZ?=
 =?utf-8?B?cjdrbjBrVjY5emJIaVJOYkh6bE01MDlJSDllZmQ4VkJwbmk5bndOaU5FSEF0?=
 =?utf-8?B?VytDSk9mZk11dzBSd1l1WjMvSFlUZE4rSG1Bd0JuVDBIZTVBRHBiV2xYbmtz?=
 =?utf-8?B?L0l3d2FTZm5yaG8yVW1kak8zTCtHYktFNnFQZmwxTTIybmNwSnpPWURUbURo?=
 =?utf-8?B?Z3h6UnVVeW5wc3RFNFFzb2tFNmhXRUxDaVN4VzVLeWJ4R3p5RGpyK3NKdndp?=
 =?utf-8?B?M3dINjUyN1dFa011Qy92cG1EeVQ0Z2FyYm14NXdnRndRTExlNjdCNTZoRWNZ?=
 =?utf-8?B?em16QU0rRHJBRlRXYkNrcGZ6QkM3SDVtaUp6WkJxbnFQOFpPZi9OUFNnWE8y?=
 =?utf-8?B?cm9WL2tKbHVUOVF5UFlUckwrNFloblNKcXZpKzNjQW5XZmlNNGVXZnhOa2p6?=
 =?utf-8?B?bEpvTm9lQnhEVFMyUFVnejA2c3BPMVMvYmpWMkxaY1JRbEFRZStEZ281NThz?=
 =?utf-8?B?MEtYYXFPTUtJcWxYOVhXbDJRUFJlSVBIMlhQaDVsZE0wWk9vMDRwT0lRcDlW?=
 =?utf-8?B?blZidndIcHVDODdwWUdQMGhYQkN4K1BvaWxlOWZTL0kwMXFNUFZwOTFIMzRK?=
 =?utf-8?B?clBSeGRqMUI2RnhzOHhpVVlwbG8yMmNNcEUrUEU1NERyZFFYQlVtcG1JT1kz?=
 =?utf-8?B?bWZCbE1OSnNUQm5GNGRBb0lhUTUrN0ptcDF2L2dKM3BwMGs5TnVHaGhVL2dP?=
 =?utf-8?B?bzI1QU05MUMxVEFrVldkQW9JSFhVNzl1SGRERG5QMXdpRzN4Wkw3VlNSb0hn?=
 =?utf-8?B?ZldNd3RBaWRHY3Vtdk5hNjhpdXZoVUxFQUV5K3U2TldJZm4vUVJ4K0VQaHlt?=
 =?utf-8?B?VTBNWFZHNlg1ZW5TcE8zWVpRU1ZKWHVUOEt2bEZrTFRLSENndkhoc243bFdn?=
 =?utf-8?B?dFE3Ymk5QjZRNzRxdUZXRTA3ZUtlV0tzanRhc1ByRWdnWkREd0QwMDJvMHFJ?=
 =?utf-8?Q?vWX7ZK7c7OuZ9eqP9yGrl4E5gkY4+UyU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:30:04.4345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2293c99b-1d34-4dc6-20d7-08dcc1030e1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6106

This is in preparation to splitting ACPI and platform device drivers.
Create and move hsmp specific code into its own directory,
no logical changes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v3:
Added "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"

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

