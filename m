Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107CE188CBE
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Sep 2024 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438407; cv=fail; b=LbuRQm7sdrOjzOuaLiqp0I5uDBX8u9I1IympfzzRq69LVjnIxQMMabVCW5yzxU0CUL/W2HXxCPfplazA4EcMMxpRxjVFg6d3vKEMyxTcqwEATWF83FZQJieSw9vlOXw3mqhl3ZjLYejzEji7GbaAAg/E2WHggChPEY/yr9VVK10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438407; c=relaxed/simple;
	bh=OC5Q59uorKx1lD4buZ9b2PitZBO6N+cXD3bK3hk/BfU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=seGsifewl4qcxZnHmp91hxka5LxQz6Ut+cZ/TNDHjXbI0p/3/DlC33ohI6C6Qdu3R9hSA0laqaGpWMHE5UBUeGeUgJ7HbdHd+hXF6gAj9ilbjp5aneTp9LndWIfnPpVKRHd4wAzyIG6eKBEI0d4i6xFdLWmyc5jIExFK2ZGJI9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wT3wW/Cg; arc=fail smtp.client-ip=40.107.223.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wT3wW/Cg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrKgmur7dNKB2twfwJLeQ5lkXyQNU2bBMFesasaOyDNAk9qAA+k5BCKsR3yzhkG5vXGqxNcwY5Gtqro/vw992p3oSikczcG3WRHsUFHluWLxVTtxf7yaDtkF7xDZpHpLp5ikiMsA9+KPfoZ8mQ1E67K1mOZMnbJwza7zuHGCRHdKRsAaFi7F0Qz96OSEY5P9oBMIfXJ9uUgxS51XHom1uvBMJIpQEXKB66lU8Wmka7l3hDJD5Ipq8y3MUZ5qlDBWJK3TG0wXINf/MktgSSM0nqcnvqdimB8CuENuc627IhwQ+JCUEj0bomOWq317ml3YADBF6G4+zrH3yGglJN+IfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFUzUJjIHuyRNou7WPVm4t1vjJwPUYuu//+rcdrSLZs=;
 b=OtBzLcNYF/b1cnN8avnU4+nkcnX2lA9ALV0zK0fdCYoGYy46qVvWkaPN9bLouVfa3SUoZYUcI9R1hEsrJeHSnoQRu1mhxL4JKYtL4OcRjzTI4W6YaSraj+FwRwJ0V6L9O6HcO+ADVJg1tUcqD9SwrWTRdAZ8WEnzZEby6x0yLnev1km+iPUyOHHWyhdxoAIhaILrOYH8XKp22RrNVVaF2bAsLff+fpqWTEu5L/ZggsyNtFi6a7vJ9N7Z4Ly5pqCgAs+0RKvnXYJ9ooU0e9w5uIM0oYL83AEAE0m2r1eC8BE08ZufrfyLe5SR7f2e0f0KSMsYmwJRd7KbL2CXWDihTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFUzUJjIHuyRNou7WPVm4t1vjJwPUYuu//+rcdrSLZs=;
 b=wT3wW/CgwhLYXZAXMMoyY4DfpV7oqqicOi0zSNu0zS9dzg9ZRqThE9mVqbp1IVR2ZBRrYZSim4Yg263rZc3DkJw44j1hbD1t1dDPYIb0+6L3QyU5RZiv5vROgV8b6nTEbmzeMRAbLmPbn3gOxAshTfqkTXQI0QLsIWttDABe+cI=
Received: from SN7PR04CA0044.namprd04.prod.outlook.com (2603:10b6:806:120::19)
 by LV2PR12MB5896.namprd12.prod.outlook.com (2603:10b6:408:172::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 11:59:57 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:120:cafe::85) by SN7PR04CA0044.outlook.office365.com
 (2603:10b6:806:120::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22 via Frontend
 Transport; Fri, 27 Sep 2024 11:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 11:59:57 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 06:59:55 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v8 01/11] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Fri, 27 Sep 2024 11:59:11 +0000
Message-ID: <20240927115921.10909-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|LV2PR12MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: e30f005e-d890-4bfe-7531-08dcdeebe826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFdXVU81VWUyQlFNTDdIUGN6QkpkVWcrb1NVZWtlaXlFUEE0TTFCamVNMnFv?=
 =?utf-8?B?QzRWNWVPR2ZHanFKWEFHZWVwNDRCQ1lYRkpLeE5ROHZDbHdyK2hneGo0QVlD?=
 =?utf-8?B?elczaVJ6U3pGYTk1eFoyQkhsWVZZZEVsZ0lUb3dFNGo4STlFVjcvM1djaUpT?=
 =?utf-8?B?VXVrRGhZZXdNa2traWlOeituaG1uOFlKYmxXRjlRNWVkakF4QlFxdmpRSjFT?=
 =?utf-8?B?b2NoS1dIbWd4Z2VQUVV4ZTFzbys3OGpaK25RWnQrNENUL2dTTUtaZ1VUUWhw?=
 =?utf-8?B?bFRkUFg1OHZ6OUkzZzFuSSt0RDJIZndaZW1jbHpPRjRSUWFsMkFEUGR4TTFL?=
 =?utf-8?B?OXF1eitIcE9UZDFhQS9mbEJ5dGRUOFdyVHVWcHdIUExYR2F4VHhVVDVZcjdu?=
 =?utf-8?B?NHNMdEU2UVczUDUzL3cya21wVnR5Q2w0RThhK3h0dEFNYVlEekFpTXR6bzYv?=
 =?utf-8?B?L2ZwZXo1SVlab0JDRnc4ek9TYVUzWFF0ZVdqMXhQL1AwSDZ2RmhzcW5KaXN6?=
 =?utf-8?B?Z3dFZzZOcWM5eWtIN1JvYW5jOGFMVUh1b3EwK0FEbFJCZ2V4dEtZVjd3RmJu?=
 =?utf-8?B?RGRhc01oNHN6RFF4L09mMFRhMHhZNDI1OFl2MFdsa1lTeEtWbTdGQ2o1QmpL?=
 =?utf-8?B?VUpOakRPNXcrNVhNalQ4T1JxQ1R1dVNMbis0c0NoWWxUeWNQMkN4c3Era2JS?=
 =?utf-8?B?R1BwZklJV3ZQMFZ2UEQ3bkpFZ2RVTjhjQVQ5ZzFqV1NLZzNhdmFuMWJNdXlk?=
 =?utf-8?B?emRkNDREZ1hhdjVwbnVaVGdDS2dpNy9SSWpVYm5vS3dkZ0N0S25wUlF3b29W?=
 =?utf-8?B?N1NjM3pjbzVzcTVUcW8zeWVTNVdLR1FjWERvWWV3RFV1bWVyUGpEOEJJVW1J?=
 =?utf-8?B?NFBUUFRWQ201TC9QN21DaitwNGs5U2V3WnNoV0V1TGdyWHFqVDFRVEVWc2ww?=
 =?utf-8?B?ZllVQWtnTlhHNDFhTTFBUzZHbFVYQVlkOUtFcDBub25INnN5L29aallpQ3B0?=
 =?utf-8?B?Tml5aUNydzZtVVQ4VEZZZzBqd2RUeUVnaDdadG90UTRJUU5kQmZDTjhocnlE?=
 =?utf-8?B?cVNGN1dxR3FqSGZnVHo2ZXZvWVJHRzRaNGtsUmpreStZbm1DQm9DSFBwSGdG?=
 =?utf-8?B?MytSRTArVEdTSlYvQUlsdUhObVQwOUVha0lZMERkY3BTMVNPVnAzTGlQd05x?=
 =?utf-8?B?cHY1SmVSaVcyUDFGdUZaSUtwUFhrUWI2bnZzdlV0K2RGaUZsTjFZbFJaTzBm?=
 =?utf-8?B?UCtNcnVOUkZXYkx1dENmMURzR0o2TUh5cG0zbU1HUHdLV2hTVWFUQVlmOGNH?=
 =?utf-8?B?eVc1c1JRbGlPejU4UklpREkzOEtyOVJHdGxwV1Q1elhFQ2lYT0tzd1gzMldE?=
 =?utf-8?B?RXY4KzVYK1A3dzVac3FFY1dXUnFUakQvK1M4enl0R3h2bWZMRGEvdW4vcUsy?=
 =?utf-8?B?ZU5iQUQ2Y3Vxd1NmVUlwV21xR21DdFF3MmhPOE5MaGNNaDlSSlJqY1pzQlZO?=
 =?utf-8?B?ODQ1S25EY0ZIanE2ZkZhby82VU9XN3FJUW95MmNqSlFNaHZoREs5Y25tMnNF?=
 =?utf-8?B?MFdWYS9vMHY3Q2pqVVZzb0EyOG5oUlpVUU1MdkJUZDJpS2plY3Vha2hwTXY2?=
 =?utf-8?B?VGJwMHFkVUU4RitoNFRmSFNOOHBzeUFmaE9QdytoZTBDMUh0SjJLVVNYaGZP?=
 =?utf-8?B?WnNlVjdkcmJ6VFVPS3F0S3UwcU5pMmRRbUhlU0VPb2hQdUk0anBhUElNbGh0?=
 =?utf-8?B?T3dHQTdmQUhvaExUNnpkQkQveEl5Z1dzSDNFYkpUbzJDb1ZmWEtOMTVVSTFG?=
 =?utf-8?B?UzNUVGtDWFN5OU95ZGR3VXlscFBJdWNnSjg0QThDS1pOSUxsVS9PRFpKNits?=
 =?utf-8?B?a3dIaGNGdU5HTC9JKzBNVnFhbW1JRDRwVC85TG04b1NoeXhVcW5xTlFORU1L?=
 =?utf-8?Q?67m3aS0XMmlfmqowoqbDyNSDCFZ3Tvj6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 11:59:57.2345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e30f005e-d890-4bfe-7531-08dcdeebe826
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5896

This is in preparation to splitting ACPI and platform device drivers.
Create and move hsmp specific code into its own directory,
no logical changes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

