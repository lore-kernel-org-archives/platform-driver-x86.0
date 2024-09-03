Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2073.outbound.protection.outlook.com [40.107.95.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742DC1C986E
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367136; cv=fail; b=YcQYjcodEcCiiGNidrr5lSRrOT04KWeVgaBG9rB9y5s6oZvhtXWiDQYoS94191FU6SjIke2hA7sxe+m6gKHypGk4OXXnyp4Y8qdHp8NtLOlEvnRJSH3IlA1plGiJO5bz+n+wk6GE784S7NwtNy9blfJrA+gBmguP63fdC6QaQbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367136; c=relaxed/simple;
	bh=0zQB0sC41AEeh4pxd44KTM8BSemWdGTV4VcCtFDTggA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j1bigUwch/E0Szl35r/oSoOcm8hveDjXXu8mH29DsVtg8kFfc4tE4QNLkvtJ0UIa6yiXZob5dwOf0V/ddQjlaCR+Jbj5tRVhWZoEhe43/NWUySIG+XKS8JCzipEztUxeqeEbMGy4r2xlfljjRyCnyYgPPrpjSL87nLn/QEbj2JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YSPzi7NX; arc=fail smtp.client-ip=40.107.95.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YSPzi7NX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3ZcHzi8sGrINCtgKxSPDCS8Nev9Dzdc3xrmJ5tDkHsmN00MHKzxe2Age/2/5Dtnbfhx4lfAUcmm8H3aUy46EEAhC6LTehSaxWgqG6dU4iNl84NVLEOxQ2P4oI81S0uLGijuObL16e61xn+c3ZyYeEK0UiarGHS96VBA6f7xq1da2siUvMPr9mj0fThhG5COrBrKCz3YmC89Z3MyY5ryDiCNZz7rMlftJ0af4qRDc0vIq4pMV+n2116Vt5Uaejh6vepxcuq40cGY7cgteUVrHKX48xEFnKoZJLfy21/D5KlzakDMJ9u5kxsxNCLEqEwHQQBwd8eydVQYJjLJuoG3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuZqnnbSx5XLBP3/Dc7T8tawb9PK0S4u/b+Do08Rjpk=;
 b=HbZB99/sg8LXcnTsCKA71067RXuCANF8manISUYPBzyaReQsjKffW6ZI7VQWg5Mj3Hr3TtlErQme2Mt2W2p1/beZBCPKEyQEPcgV1GNfJWaHqSdpSs3H2EO4w+K6gjFhbFOViuDKKd9Lv+HFtjqPygb3pkhsD/KFq7QsuhU+5q6DhnzXgUSBaJppNo0pWiBPIvBubqGao6i1jFtkqoqVfKAnrOjSfF+PiY4qWsg5/GOm2J0ItjyePQf9qxbcskNqIkF4CZSAeYkl5SUYIUNb7I5BsKNI3fw+6zL7RrH6YTSrlPSNNB7X/N4RmdssSdqqKRTmCsC/MpeE3iZKca3SAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuZqnnbSx5XLBP3/Dc7T8tawb9PK0S4u/b+Do08Rjpk=;
 b=YSPzi7NXV31iF97QKBWwI0HKfo6vzvF9VbLdJkG/0yiNVAS0tvPIoTKcr9pQZ8yO2zYgCU7xvl51YImbPeYZDuVj/TttirCmVsY8QVA4y4MTZkG44YPgF+kUZJyK0n0lN3D/uHwZJVWAAtzU/8vj7AzNdm2Hpdnrmg4FYUcKPv4=
Received: from BN9PR03CA0889.namprd03.prod.outlook.com (2603:10b6:408:13c::24)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 12:38:48 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:408:13c:cafe::2) by BN9PR03CA0889.outlook.office365.com
 (2603:10b6:408:13c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Tue, 3 Sep 2024 12:38:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:38:48 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:38:46 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v7 01/10] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Tue, 3 Sep 2024 12:38:21 +0000
Message-ID: <20240903123830.2717196-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 41542954-b88a-4e5f-388c-08dccc155bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkFRU0xndGxwcWNadDBaank4SVZIaFgyanB4R1ZPOGVibHAzWkxXaXMyM24y?=
 =?utf-8?B?ejdUQmxQWVFRZ1dKcHZzbHJTNTJOajFtK2doQzFGM1EwZEZwMEREWkVxL05G?=
 =?utf-8?B?RW8wcWJEeXI3dE1MSCtWTWxmMTc3dkxjdTV1RElnakVzL2kwcFNGcWRvOVJ1?=
 =?utf-8?B?clRvRUNuaWZNaHpEQTA3SWtKVXViSVJEZ3FDekUzMjFzTk1TNlU0blEvTWZX?=
 =?utf-8?B?UElPNVFhdVNXVTh4TWZjMkIvK1haU3ZDd2s2S2lKRXdBUmYrMGRwVVBPZmhZ?=
 =?utf-8?B?MzBpZ3pDY09DaWd1WTVyb3FlUFdDanVaSEpjNWlEdE1wK1NQbXdSbHpOODk3?=
 =?utf-8?B?RXBBaE9lSktSbU9pcXpOL1JtUTREeWY1QzlZSlBvdnhralZpU3Y0aEdMcVMy?=
 =?utf-8?B?eWtuY01rNjZFVHdZc2g4SWg3TllYUEVqd1ZPSlUvVEp2S0dGRWxpZVBGKys5?=
 =?utf-8?B?aS9JQWZMZWZ2UE11SDRYKzErcG12Zm11RHIxVTVXYmNDb3F4Z3hTS0xLdjIv?=
 =?utf-8?B?QWd5SU9tL09NSDBwWFU0aEFPSmxKVkRKYit4bTl6enJDTDlGbUV2K0YzL3pn?=
 =?utf-8?B?bk4vMithbEdYdG01Z0orRjllNkpsVSt2MHdFTXZsdksvUjNEZ1pwaTFvaGpP?=
 =?utf-8?B?QmpvMEVjbmZ0Z2dpUDJWeDFIbDA1NFk0bjVwN1VVclNYa2V3ODJic3drVTE4?=
 =?utf-8?B?L0w4VXBxb05Za0M3dkhHaHhLSG94dUlwcE10UEJOV01zalM5QnVEYXhPMVdy?=
 =?utf-8?B?Ylk2RjhIbmZmaExWWU5Rakk5Z1RMaU9rTjBvUzVkTHVoNGVwMkRrM1N4YUk2?=
 =?utf-8?B?NElXUHllbDdrWTJiUCtBRVdzVkJNVTlSOFRvZmsvNElMZjlZQkJHOU1NNTJD?=
 =?utf-8?B?Z2FmR0lQREtEeDVaS2VLNzV6bjVSREJRM212dkpjTG0wcG1uRVJkZ2s2bjBr?=
 =?utf-8?B?S004SFg1T05ITnJiNzgyRkdaM0JmWG5DUWNoYnR1SHJrZFVPcjZnYWc3UWUv?=
 =?utf-8?B?QXZ0RS9DZ3VkMnAwb0dNTVJscVNoYkZWU2s2M09MVGVLaWFpRmVGQjU3Y25O?=
 =?utf-8?B?VGtyQ1FrQkxIc0Z6MWluam16Mkw1QjR1YmhLTkU3eHJsSVF2U1lpY3lMVnU1?=
 =?utf-8?B?T0YyZmdyc2R1MmQvaHhtS3JiczFzZ2tKb2NzQTRURUxkOGRhUVBUdmlsSkdR?=
 =?utf-8?B?WFV0NXJ5bWNMNW5jNGJoWExhd0YvYWNLZDJocXBMUGhQdWVGT2J1bngxK0hE?=
 =?utf-8?B?NG82bGpLSy9lOHJ0UXFxclhMQkM0QTFIa2RuNXdiYVVtbllONkQ0MmNjK05C?=
 =?utf-8?B?cEx4TWpteE5YYUJaaTFlc2JVM0ZEbmdFMmNZdTBWVGx5U0pwaXR6TzEyTUh1?=
 =?utf-8?B?SjlvNXl4SWQwcmpxMWJYVlNRWEdCaXUvNVFxaHRoRFBEeFYwZXZqdXlkbFR3?=
 =?utf-8?B?WmVxTGxvUVBmcnMxcTZkOGJWdXpONlBEanMwa2xGUWE1bG9hbFhhZmhtc1No?=
 =?utf-8?B?R1JyWG40OFVWSEpVZm5HMkxQeDVPVTdUaGt5TmtkU0xPdGRCc2ZGZmcrb3Zo?=
 =?utf-8?B?eENpS2l1RFMySGU3R1JXdDVuamZyU3ZQcDZvWkJoSDJtcFN1ZkdNWXp5cS82?=
 =?utf-8?B?ZC9reXJjeWlFTjJScHd2NFNxbDNtUzZEU1pyVUhpeENiY1kzYjVSU0dIc2tJ?=
 =?utf-8?B?bFgvOVhnUytuWG1LK0FJWlY1ZzZYMXgyU2dXcFN0NGw1c0ZTMlRiempWaDZM?=
 =?utf-8?B?b3ZNbDdKbXRhQlJRbmxQZmRNSzlkbVZjRGF2T3JXY2ZESzBzVHNETUxMTlQx?=
 =?utf-8?B?elYxM3dBeExPSGZGQ2Vpb0hUL0Z5TDBOWlg2R2lDU294eks5T1g3TkJ4Zk1S?=
 =?utf-8?B?VmhoU1c0MXlYN21zbnBqWkk1dHFCZDJFVkJNeDRoVnZ5OFpmMGJXOXB3T3dF?=
 =?utf-8?Q?qLbK8r3P5PrsKsXaYPHjVGQeSywtkrRl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:38:48.6459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41542954-b88a-4e5f-388c-08dccc155bdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943

This is in preparation to splitting ACPI and platform device drivers.
Create and move hsmp specific code into its own directory,
no logical changes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

