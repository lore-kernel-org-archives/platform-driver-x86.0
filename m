Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE9CEAD7
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954141; cv=fail; b=TNA5oYnh1H2TTrkcb22qJgjj6eNzumFQka/Q0W3PqnMKhyQ0q7QWxzQx16bcyabdd3L0wcPcNLHe5gRtBhb/p5+RL5T9PId7jOJ/eIbtvvnF43sVX6ZW0xC2TGxqJ3d6hl8GPzqNmQ+808T77vijT8AShekZVMZgIDIRWM87wAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954141; c=relaxed/simple;
	bh=M1GCixXvNgR9q0LnR/pqifm9j2/cYvplTzZONEI617M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OIdGB73hwssMZWuJWN+6+lZs8bmAPBCbCYSyIGen2O9zXuJZKxpg6dWinC1/K/jciyLOzovObyRdg2BtzvnefPGQSzxOzqXge8egeKzJtriygy4MeGm3HuM0WNmKpbGL2y7c6fi9LGIKM1DshLfeeX3p62Cy7xLS0Y2S7mb3HWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n320+HIr; arc=fail smtp.client-ip=40.107.94.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n320+HIr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yh+bzqrKe+sVgy4mFDMfjew7trYdDuhxe/SR7xrHWZ6A67w+wvwTXtyi6WpvN/n+HdSZkzyMHYx4W4T/vBiUlS11CdR39EGq38Ljs5oVkgyP+wusLJIg+J+OFYI1qKzF/cqUwsqvFPMPPWkS/xrCHg7pQSqTOiTEpzBAj3RkhjS9kFSVTBmUAKwosiCSbTPPvv1BHSWqYdaqOBRH7rTrrYkyWuI3XpH+CQk958v+34o8XcvfTJ6AeVAkh8iF8OaZkmt2vKrrlhPp91Z1iZHpxNM8klcR/+4AAXCvhMoH3zqxzD+crUOOYmKBfI2Ppa5A6/dcph06h87cFIotDioPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbGK8OjEYcY/ufwL1YrpBv3aNuwuvTLq7lZ0n7VJKs8=;
 b=wG+WSpiqO5MTXTOz5rABXvdVwiStoWECcqKO54+2Xc25cnr6KjHrTwfz0bs5TAH3FctKXRCPRqOBNbNby3vZIsoV6xEmxJxKjkYnFxMYT8kgaYio+J4z2E4ax49cH8ymS9rx83Oh58kSLUFqZbjlcQKgh1gPKUgpgXB3BWCm+qwddIYxeRJy+ymm9xVuORBzIs14MpzgyixYw9FYN7pIZxPsBjXTUL9XgrbqmG/HGM8sHX3nqOd1/ZxHFWX6G60cqVNLYnZlgajsX6M/BRH0ovBUPm4p8Fk+8IVu2onzW92o1kA95SYd7ys1QVQ9eoL/cfCCIh0/wPULyl8j4tkbNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbGK8OjEYcY/ufwL1YrpBv3aNuwuvTLq7lZ0n7VJKs8=;
 b=n320+HIr28Elc74GF68Ni1dNgs/se4ierh1P7uJmCmd0gW1Cpsf7IbF2zeGdgd9MljVOtrOz1jwbwW+tdiEYoI/sDcc6DLCSi1twzEbI2SEPwIqBQdk7ThdTeeFSlonRQPGv/EAIe4XrglQlvo1J+VLzAa+xhSpIN4t2T9h54QA=
Received: from CH2PR16CA0002.namprd16.prod.outlook.com (2603:10b6:610:50::12)
 by CY5PR12MB6130.namprd12.prod.outlook.com (2603:10b6:930:26::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Thu, 3 Oct
 2024 11:15:35 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::10) by CH2PR16CA0002.outlook.office365.com
 (2603:10b6:610:50::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.29 via Frontend
 Transport; Thu, 3 Oct 2024 11:15:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 11:15:35 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 06:15:33 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v9 01/11] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Thu, 3 Oct 2024 11:15:05 +0000
Message-ID: <20241003111515.2955700-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|CY5PR12MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7807f3-7bfd-4edb-fa21-08dce39cb44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFVuR010SG1hNjE4OUtYQ3pBYWRZZzV3VmlaUG0xS1RYc2NZVUtJT09VOEY5?=
 =?utf-8?B?YlFYb21QYUx5VWEzWVhTVDBxTkFiYm56YXl5OHd3WHY5OUREUDVGL1I4VU1Y?=
 =?utf-8?B?Y3JRWk8vVU5laHdBMHE3TjRhZHE0Q2ZVK2orVG1nVWFzU0RsR09CVE05SVBM?=
 =?utf-8?B?MklMcXc1bjBzRjNBMXpMYVkwbXZLWjVrTGVCRUpSNVNZY3ZaQjlKbkVRaHhD?=
 =?utf-8?B?ZEkzRG5IdldPOG1icXhQZjVFYnk0OTRRdWw5VEdXVzYxeFMrM2dwbmNYQzZS?=
 =?utf-8?B?YTlodU8zTE53VXg3dUdGcnhHb1hMbnZzUW5JVWRiVGFqYXEzOHJvRzBlUjJl?=
 =?utf-8?B?SjV5MWU1KzRvK21LQUZsVlkzTmF0YnJVNFJkNTAxY09QMFFGM05EZEUySFNS?=
 =?utf-8?B?WmtJcUs4NXhqWlBmWEZXdTBNejQweDdVTTRQMFdVSU9PNUM1a3dwM0c0d3B5?=
 =?utf-8?B?S1hFSEJqdUNjeWlGcmx1eU1rZi84VjYrUEpESS82djJucy9KRG1PUk1wNUlJ?=
 =?utf-8?B?TUVFT04rdzJvbS9RRHp6WVZCRkE0SVJBUVVqOU94R1RTVTAvQWluNVpDOEQy?=
 =?utf-8?B?QjVMWnpPaXBXaENYR3ljdENaaVhZdjZ5MnhEUjJGRlVMaldWN2d6L3l3UmpM?=
 =?utf-8?B?VTZ3M2MzT1VhcXRQR1VXeHVlZ2Nkd0x6RElWcWUwL3pYUklqcThiL2NSWlN1?=
 =?utf-8?B?U0FLdjhqQUFWQ0IyU2swZkJzTWs4MkdKbjZjVHZHT3pKSlJIMVdXY1VrU0k3?=
 =?utf-8?B?bjIrNmI5bHJSVks0WDkwV1NaQ3JkMGZZYmoySVAxVjdDY25FdDlkU3NKZ0NR?=
 =?utf-8?B?MFp6NmtFYXVtd1ZRM281UmhpdkJ1OVVyenZ4cnNSTDR4dDhNajB3R3VDKzVj?=
 =?utf-8?B?Q3EzcVo3SmtNejU3WUZZdXFnY2p4RHBydm5HM0Z3bDRZNWJXbnM0eDIzdERG?=
 =?utf-8?B?Z1UvL2xPSDBQVUhXaXo0MTdBMkh3ZWtidmxiQ1lpRy9ITnpRb3BEL2I4eVhT?=
 =?utf-8?B?WGdubCtlQmFwdjNCYU02UlpCc3lwcDN5VHZrVFY4UkhtVFAxRkJoejRVVGh2?=
 =?utf-8?B?VHphN240MmZ2Z2dSczF4MXJPRFBnWm4xY05RaGo5OEgwVDk0TUpaL25GUlZs?=
 =?utf-8?B?WnFkZU85bGlIcTVYYWxuRk1ZT0dqaFdsSllVb0VueGtyVXpJeGxlUU5BaExR?=
 =?utf-8?B?ZW0xRWpGZjd5QUxEM3IwNjRjVlR1dEwweUdudzNINng3bGxYTmI5bkFxQ3ND?=
 =?utf-8?B?MFFpMVEwOG5VeS9vMnJJNlA2Vm5QUEFXck1PMG9ubFBkTTkrZ2pIYml3dWQy?=
 =?utf-8?B?M1V5enc4THBNOHRVWlh4akNrK3ZvaFVFV3AvUUpWUGdibXRMdDhVRHFPZ3VD?=
 =?utf-8?B?YVNaUmFJbTgrMDl6NVY3eUxNU1lDSkRHblphaEQ4RlFWRWVSSGJORTU5YmZZ?=
 =?utf-8?B?WnFKUVBOQ2xLYmtxcDlTOXB5VVl2ZkN6REI5RGFycy93NXNQbms1amZSMzBu?=
 =?utf-8?B?RDQwb2djOWwrVkFzdXkycDhuZDEraDdGQ0xBMGxMUFVPblBFNmtPbXBlT2Ru?=
 =?utf-8?B?YkdIRWxVUk1VYWJqdzFLaUUrUGhuV251TXFKS2hlcWFud1NVYVE3TFgzRG1u?=
 =?utf-8?B?Ym9BMGFsTnBDVmNHdGcrcVorNlA0bXUzYkRUa1Z5cEFjdlNtWC9rK0ZDd3Nq?=
 =?utf-8?B?K1lOV2ltbi94bVZTT3BUaEhxKzFxcTZtSlAvUkpQbWhsS3NRMmxuWUFHU1VW?=
 =?utf-8?B?R25UeE8wakw1NXFUK21iRFErMTVxNS9mVVc4Qlk4dFM3SkRHVm1peXIyUXlL?=
 =?utf-8?B?OE16b1NKWjZtNWcyeXVOUis0Y0tsWHNJNE9lMEpsRmI3K0tQdlZXdU5lWG9E?=
 =?utf-8?Q?81cFIk3l5v/QA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:15:35.7889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7807f3-7bfd-4edb-fa21-08dce39cb44a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6130

This is in preparation to splitting ACPI and platform device drivers.
Create and move hsmp specific code into its own directory,
no logical changes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v8:
None

Changes since v7:
None

Changes since v6:
None

Changes since v5:
None

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

