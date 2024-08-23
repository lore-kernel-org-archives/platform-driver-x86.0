Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66313C80A
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 07:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399770; cv=fail; b=sqciGcnCCb5TaxdDjuXrAbUEuQieRqRChHTQCrBJGkVsSDLb2ZRYq+d80b2c4HK+KXJbOxJTGsjW1gNkywZysor+9KoEhmPbpZhbDNq46FUex3qBmPWVcFkuej0r23HSt96vrPVxSlhko0Yw0zEeTB37JFCe574lY3vixZInp1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399770; c=relaxed/simple;
	bh=5ncR3NATvIIsLzvieQHERKQwzIGD2SnI/BhHXDUuESs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PwelggFKaJ35qiNJGwU++m8zUPM2Vzw5TSdnkNfppjo2vOz2m4Adsftr+Nzh5SVnmgvg8LXrKFKCYYpwJ0jZEqo7M/bOF/k43L5Mnsi6LXXunBCRKnObAorZ2B4CKfozcb4zxzQ2lvhmslJTlfWQsGZ9Cp0o8nJpPiD87nMegaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OgpNfn2C; arc=fail smtp.client-ip=40.107.94.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OgpNfn2C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edOHkEaVJVWUVfKqN1FYmhmVTCzWixe5yvgDa05oG/Y1Iihp1wQ4dm8ppIXAWAM1pvAEEWWwj5lsnkuzRvPaHtvEsG+WfXRmvpUAEymF5sgwA+s9pA94n+QRzw+0xjCvPvmBtge+FqkkgqSLwDULWIRHW2wcD7KWamvO1xoaqZCA1Yq0X7Z0OobWn/P1tu6KGmDxYQ5jGWlZ0UZiawWxNoJaCb6rVBkQ7E5m4KkExQJ+H+biJuUUzQ52mn1TTduR3qVkmeX6I28fHhgWoBgDQDjHDbC44rR+BFBBXH8TPto5zLGPVn9vFRGD6xlcipqiZrwdpKn0qHxmtF+itQGASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcTEiHPxyQL/ghIBjUNQnWUQ501pgs59m52tCirS7sM=;
 b=ncnGwMSReuqTVTvi6dhtNjyDqUfiROgA7hZU5dPFuzMNYC8MkiGWUYfojXtpzNz70VFK412Pw/l9BV5FX1jnb8LsIUEIAqcJrT8Gkxe49Vjh5PvGE6c3s2dUPA95cKE+jJTEQuXcPagMrUG0DqTmH07kJ2fhQb4VLNN7i51DEFH73TkTxZMElgk0D53sGuCwtfGBL+3iv8hcJ9rR4dH5m3qehbZnNShAJcSw1aqPpyvVXIoxcqTdf/1791pP7Ajz23PLY1HWHHC5oLk9aIl3BAnYO9E2w6J/Es7lfgudOWARl4YQqdB7Md2Q6NqMWJpIAJ9/rXhm1ZchjkHvbsqRAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcTEiHPxyQL/ghIBjUNQnWUQ501pgs59m52tCirS7sM=;
 b=OgpNfn2CE6JS29wy+hIJDLeHvaRshcAGvamItS+/vPYrC1+bkXoy1YY8bRfPlMk/tzjpP9njChO5oQa8rFgUAiuKOui/+EH/kXHOrReNEkBKYZaMBRXQ0wmrkgFE4oCT5EgsrwYGkV9/KXilEeKeB7gl5QffvTTuYalyWGALeRg=
Received: from PH3PEPF000040AA.namprd05.prod.outlook.com (2603:10b6:518:1::4c)
 by CH0PR12MB8532.namprd12.prod.outlook.com (2603:10b6:610:191::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:56:04 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2a01:111:f403:f90d::1) by PH3PEPF000040AA.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.13 via Frontend
 Transport; Fri, 23 Aug 2024 07:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 07:56:04 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 02:56:01 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v5 01/11] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Fri, 23 Aug 2024 07:55:33 +0000
Message-ID: <20240823075543.884265-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|CH0PR12MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 617882d9-97c0-43a1-4809-08dcc34909ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmtTdVJTaGFvaFpGL3ZOK1QxVStVbUJVODNYakh3c0JGcEdpWFkzVkl1NHBM?=
 =?utf-8?B?aGVkZERRRm82Z1BSbTZNWSs2RWh3UWlqaU81V3diSU13b3dVbFd3QjAvVUlx?=
 =?utf-8?B?eDdIWWYxb2R3dkZKU0pLUTlsbDl6aTRTdkRITDllRlBQUGxBVTg4QkR3T2Qz?=
 =?utf-8?B?d1YrcmVCR00zVjUxNTV2eWZaOG10YUIvSHJDU0Z6aTc0VWd1d0ptSjB4WnF4?=
 =?utf-8?B?aHIyM1BSMDd5RGU2TWtrcWlyaXFIUVBKQnlxR0pmcnRtU0ZFOGtKT0J0RS9o?=
 =?utf-8?B?cDAvOTNkbEc5Nk9XSUNKNTgxaklHYmRXbTQ4dkxrZVp6V0crUmRPTkw0bk1M?=
 =?utf-8?B?dUxVL1crM09oWUNTR015T21YSGt1UnFVdGRlaldWdDgwc3NId0lJWEJZV1Bi?=
 =?utf-8?B?NnBkRWhZampQaTBkRmo3NGk5VXdiTVJDSTVMT1hkTnNMdGVHNEZRMUlpTHN3?=
 =?utf-8?B?eE14VXgraTg4MTVieWYvTFJlQmo3YUVtbzFYMGZmUW9rRjBXaTV4Rk1OZkVh?=
 =?utf-8?B?Y1ZwbHI5S2FCZ0dkSXhFeXAzdlRiRFZXRnZ2L1N2YjRxb2ViQ2JhVFRuM1hP?=
 =?utf-8?B?YmovM1Vmcjh2dWFROGFiNUdzMWM2ZTZPL2hmV1BPMXVuNUlBb29lM2pxUnFV?=
 =?utf-8?B?RHltME1MTitnM1NBNC9zcklqSnUzYSsrUVd5YVFaUjNtUGhaaVBlOGhYM1g3?=
 =?utf-8?B?K1d3ZGlXcVJYTHljQWxycGRnNkZ2WTJVVDdBcXhzYUliVkc2Tjg1SFgrT0F2?=
 =?utf-8?B?UXNUaVdTaW1KOVBVVEhwS3N0aWJKMG1yVmJuYktUSUpTdDcvNlpMNE1LMnhZ?=
 =?utf-8?B?VFMwQjZFTmRMc3lQWGdTOHpkRWdmUVh5K1c4U2RZOXFhL3dBWWVwNmI5MDVm?=
 =?utf-8?B?ZjdvdVhZSTIwQStOKzA1aWZlZVNZOUt0eE5TTjQzc3BZV1hqOW45RHNxNjFU?=
 =?utf-8?B?Tk9QenlubWloNUZ5UFlXN29ST21lVStvVUovS0JtREh1dk8wUnNveGFhVktW?=
 =?utf-8?B?QU1vZVdRcnI2Vyt2RXduQ0NpdmdQOXF3dVF3MEhlTHJOTk0ySlh3UGU1TmRr?=
 =?utf-8?B?OXFlQ0wyeGgwNlZtQWVla1ZpM2lYVFNOMXNrSFlKYWlPQUo2OEk3MW15djJ3?=
 =?utf-8?B?Y29OeDdyME9pY25KRy81VlRLeUY1QXZnUVJLbVMyUVk0M0YyUjNiZ0N1S1c4?=
 =?utf-8?B?YUk3SEJUeSs3Y3gzR3FNUEJXYk9HRW94THhHbllXbGNMcmtJbEZFUEF1UCtQ?=
 =?utf-8?B?U0NHZ3l4MWJpRndMUlY5TDlob0RPcGJYanhQeFkydjBURSs5dW5RdmRtOXZn?=
 =?utf-8?B?UUpVV2I3RVlOMklCREY0c1NINTVRWGNzMmt5NGJtdEJPejMzREtJdG45MEht?=
 =?utf-8?B?OXFKeDNwT0EydzNQR25BVnJXdVJobmtZZi9QMGtRYjh1Yk1oa1NBUTdTZ1NJ?=
 =?utf-8?B?cFUwZG1takF3eWR4bExoRS9Zb1d5ZHhCSksyUnN4VHYreTJzNXNtSHZVaGtn?=
 =?utf-8?B?Vi9iRmRiZWgwaGVuMit3M2UySGpaMWtZN3QzVll0Z0drMzRDK2ZEb3IwbXhQ?=
 =?utf-8?B?MWFvSzgxMDhQand5bWJHMzVtTXJNZko4SnB3N0Q0UHdVUEpFMVcvMk1SazJa?=
 =?utf-8?B?K21OWWdvNHA3WlNOR2JhekpCc0JTZUlIWGg3dmhBVWJWdFZkVVcrYlZwTGxm?=
 =?utf-8?B?VGp4U21jRTh6Z0VQdTJ6YzlyWTAvTXIyYXk1TWhMNkxlTDY4dFU3NUwzVEZN?=
 =?utf-8?B?MVYvZXBrYzRtZEZpb00vTVg2V1V0WHNOdXgwdytNa09zSnZvTVhsd1FabnQ1?=
 =?utf-8?B?Y29Zc0YvbFB1WCtyc0pYV2V6N0lGdkNIOHFhSlJIWDU1bVA2d1B5M3dDb3ZP?=
 =?utf-8?B?eDlMeGZ2UlRITm5tVGkzLys2TkdPVXNESER1S0VqdW5RbGQxOXVlZUU3cGta?=
 =?utf-8?Q?TJM1zqhNRmKQJLc4WAMdD423pJ/Bh9Ow?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:56:04.1275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 617882d9-97c0-43a1-4809-08dcc34909ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8532

This is in preparation to splitting ACPI and platform device drivers.
Create and move hsmp specific code into its own directory,
no logical changes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v4:
None

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

