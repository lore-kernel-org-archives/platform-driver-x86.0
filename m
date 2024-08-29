Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FCC161914
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911650; cv=fail; b=HynTTBhcrQRlr7frdJ3f7EOkElOck3dRfFFDW26IGFpXL7YK67VvykkRjCaajAUqbdQwxtdupJcxAS6TfH+vLlBduQo8ZsTgh4jvwM+t4s9+XtBd+vYebxF2LdJQ4DU9+UASUp3IJPqrM/KOXbM/wCa8ncllCT2yZw6qeaz/GdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911650; c=relaxed/simple;
	bh=7GAiY8HcAzhK7N8IYdZgeSB03atIk/Egzsjc9rTZ2Ow=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N3Y/JvHjMDRjl4kAJEjH5c0372O0KEnthW9+GOpJ9z+nMNfXNrzVvumzxqb6/0ekI57R/bAzqdLBdE6MfJSq12savpK/NHv6XqDZguvEZcVac99k99iwJwPGNx7iH9hTHNPPHkyHbgPuyFocaSjg243bGdDyAjYuTTSWy2N6yDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s2rrNFxS; arc=fail smtp.client-ip=40.107.236.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s2rrNFxS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkC+fBwAcSm0zchjiOmHlNb0NINyRezbBnfybj13tGr06MegjKwor8w5VNUMaUbkagZ09I8Ap93ScbG4ztyy823jNfc/tlX3VeLRXRrrQf5I51ntCIOZ4I64dSjUpLiUrfZIw/QESHWPcEmo9wW19sakj/NBCoQBxqSME1yVhu1gnXaAfe5mPX1+5jWDlhBgXKvOaP07eb7juMovx1gqrdCzgKLfZ8zmMaaHLwk/bDn+jXuRACWCHZcR/Fu2yOdJY2USH49saKw19boSn5zAI4c2cwu1B+NWlxmbsFbtFUMLudJgEFgPsZeFAdZA4x+kLsLRHFY6Il9dQvEVGBzxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrhsEZxugqBKiOm4IQu4hpTVtrP8BqcQ3gurlm+PD6Q=;
 b=t7ModpoIW3KzmSRIOqulLTXf8ukt0RYQInZQEglwgyr7WvjkkC6CbwPmEWYjR22PdlJ82N+e23mBX8aqoQL37YHuHbpgH3jim3mBy9QjT6xc1/cDFOzj+WXLjEpPzcJcolrkUO8Jva2Jws7PNHITDnZ4UlpxUKbgQLV0xS/XkatAx3HdgEtsoopm+s/ym4jh9IRTxBC3TNv8eCxYTPypwQpy0k72xwbPDmvHef8L67lH3x96tmzV6GRoQPR4iZ9Id41gZRpCsgMoCeaFxb85vQM34gOCFYM5HKqV+5C9L1IZosZC4oRbLDDdOOz1/P8OkEUsTMr+hkG2XbhXYsLcoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrhsEZxugqBKiOm4IQu4hpTVtrP8BqcQ3gurlm+PD6Q=;
 b=s2rrNFxS+CHUBhn+hR1WFZFStVvAw0DSkCODq5qZNxiJoJQZP384aqPq+RV1sEIQyo6S7Eu0Dj3UOdbQa/TsH13SDOXPTjsB+t361SsqL9nueFNfmVnT+P0UyIi1yOjz6abfQZULojeRTgkZh2Xu+6FrkBzj8+UJN9LtBMEdTC4=
Received: from SJ0PR03CA0290.namprd03.prod.outlook.com (2603:10b6:a03:39e::25)
 by SJ0PR12MB5663.namprd12.prod.outlook.com (2603:10b6:a03:42a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 06:07:24 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::92) by SJ0PR03CA0290.outlook.office365.com
 (2603:10b6:a03:39e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:24 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:20 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 01/10] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Thu, 29 Aug 2024 06:06:08 +0000
Message-ID: <20240829060617.1548658-11-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829060617.1548658-1-suma.hegde@amd.com>
References: <20240829060617.1548658-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SJ0PR12MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9cb5c8-7807-4d37-7254-08dcc7f0da46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDFsZytDaVFWMGhNN0dqOUh5SmE3ZDVoZk5iQVphamlHaGc2a0pnWEJ3STZy?=
 =?utf-8?B?RjJRNjVmSk8xWkVTaTB0THdZaFNSR3llRzU4cEpSNkFaQXFUbmdCcVlQdUd5?=
 =?utf-8?B?U3pGYXd4V0UxdU9hbDJwTy9zeElqK1NEa1VtKzZtZlJEb2kzQjdpREFsSVBT?=
 =?utf-8?B?b0lTaG5NYWN4eWQ2RmMxdU12N2dsVGFQK2tQNmpPdjcybFBiR1J6TzVhSUdr?=
 =?utf-8?B?TzdBUGh5YUROTnRJL0xOaGk0UmZia1dkci81QjVKaWhWNyszK2ZxWldkTnJ5?=
 =?utf-8?B?c29RQXVWSFpuK3plYVlUSGFEMEJLbzRnSml4ZFVLWlhYbEIyd3FENDl4NkV6?=
 =?utf-8?B?dmJHTGpPekRxVmMvR2ZmRkJZUGZPNWhuWEtoRXkzNjE3RzNJV1lnZXFtbmZn?=
 =?utf-8?B?SHo3OWR0aHhxYjF6Wk5ncmIrN2NsVVBac0RkR0lxVFNqM2FEbXVXaU1ldlRM?=
 =?utf-8?B?WEc0d3hDREE5MjhpUjdCRzhuaWlFK2V4WTFUMWtkdDBaL21SWHY3NERQWWdw?=
 =?utf-8?B?Z3JISFN2bVVDdjZCSWllME5nUXpmOThEL1NSSDJlRnFTWk1kZ1dxR08xUnkv?=
 =?utf-8?B?Um5yT3BRTDRmam1wM0gzcW5haVJiYUwyc1FlOUFMUTloNGRkMXlVdFROZ0N2?=
 =?utf-8?B?NW9XNlpQT1kyczFuaVNha0xtOHBGbkF6VDAxbDZZc2E1RFVKemw3OWNiVDNF?=
 =?utf-8?B?ZmttK3NITFJxa0k1bUJBWHBYaTVlaEowNTA4NWh3NTJ2U282UmhhZWphZTE2?=
 =?utf-8?B?QzU5V3NOQUhXZ2JrSlZjRGRHUGpGMnZyUUlWOFBDU1lDZ0FGUnBUcVgxVmU0?=
 =?utf-8?B?SyttTytuaE5uazJQMFZ5YzBJZHJlMHlYd1pkZ2xPVHM3TWVPYXFrUENXTTZq?=
 =?utf-8?B?SGFtUHRHTFFSRnFHUTJ2Sm5SeXFSOG1WQlV4WXdaUUZtd2RPT3VlYzdvRmZw?=
 =?utf-8?B?Y05FWVZuZG5idDQvdnVOU0gvTHZqaEdVbk0vUTdNeFl4dlRVZU9IM2FlMWlU?=
 =?utf-8?B?dWt2bGJzem1CcW5lOEVzMW9LbnpaNFhSdUxpd1lMLzlIY0h0MHVmb052SHVV?=
 =?utf-8?B?S2U3bm1GRWV5K0k5U0pZaXgxSS81dHZNZTdxVmpOZ25DYzJmaEpYSDhMMHNj?=
 =?utf-8?B?cVdzNnk5TDVCWVhESUJoOTlBTUhsNVJPRHpHS2xxLzJsWlBoUDdiM1pnMmo2?=
 =?utf-8?B?ekVGVXlMM291ZnNzdW8rQjY5UC8zTldpMHV1R0ltVnZXdEIvdW51MjJERkdl?=
 =?utf-8?B?cXRXYjB0aTBuK2lKNnlET05SUDl3YlltYU5vb1J5clVMTmJWQTJVbk1IaHZr?=
 =?utf-8?B?QlNrMzFOOHBQQk9Ecjc2Vnc1U2VZQmZ2dCtnMjZCM0pSanhSL2xGRmhrWXov?=
 =?utf-8?B?K3dxOVFVVTlkVko3RGFPTmZwRGZCL05ZRVNpWVdZb3JOeU1MeVh4T0ZVMXB3?=
 =?utf-8?B?MVFGb2Qvc0RIc2lMbHErRXZLdWVRcHk4T0NiQlBTN0JvWTZ0blBzb21kb205?=
 =?utf-8?B?ek1NRVdReDNYMGpkaWlLU2Q4Ukc3TCtDdjRscG80VXZoZGdGUC82aFVJUkRW?=
 =?utf-8?B?RmVsRHpNdmx1Tk1Hd2xSZGoyS0RIZE5MekZzMzFOZlFXeTZ1amE4bEJBdnU3?=
 =?utf-8?B?ZWh0MHkrbkVLNGFNN25tc051ZVJVK0ltMlBhMXFORHQvQUVtd3FYcVFYSTFq?=
 =?utf-8?B?dnZGRWlHbFdGL0E5V1dVQVhPa0hNc0ZoWUd4bmFFK202MUN4c21kWDNmWHRI?=
 =?utf-8?B?MDdDQ1Yvc0NQLzRtaUl6UlUrVENzQ1o1cnBvQWw0VzNvbmF3bG5CMmhET1FY?=
 =?utf-8?B?ZVNNTlRmb2xyT2JCZlN6MlRlOXhSVTBMYWw3bmg2QmhSak83YzUvalFFSG5L?=
 =?utf-8?B?MWVOT0J0akpwYm56R2MvWFZqZXF0eTVuTWVLUDdDeXFGMzNrZnJmUzdVRWxl?=
 =?utf-8?Q?79vnO0OsTVeXZcmPo6RkJWtdI+0jWJwm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:24.4771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9cb5c8-7807-4d37-7254-08dcc7f0da46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5663

This is in preparation to splitting ACPI and platform device drivers.
Create and move hsmp specific code into its own directory,
no logical changes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

