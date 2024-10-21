Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484E739FD6
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509296; cv=fail; b=R10C6wfiWoMPDch/c70n+V50XIi3YhHs9vqG6bIChG7fvJQQySzbw2EWXnenRNNbnp8ACY3L3XvcbTfJ5uAZSfRsHYEx6KZu1JkVvQQjl4NUKhq4IG16wM3tKwdrMpBPzGx+7a5RaSHNxT/wUo+4QUhEdcwH3HMhJI+sgpuDEr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509296; c=relaxed/simple;
	bh=aVIj5GB0nMzm+XwLKjrkYTCFDaiRXvsTOFwizuNJmIA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=odzUJBzgee1Y5Lc3ELNYs35a77/iUz5MP09TpQMkQRVZNwMti9QEF9qbzF0rKqbHSNwsE8M/XQRzhBVGkoJOzd2Y7JOW36KpCDHFVET4wIOZpLhx+dtbP/rEzJIzO7ifPgAJpxln7Ue0QUMd2WnhezmnwvbEQV+P0iX8vrHlgPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sv67LDfN; arc=fail smtp.client-ip=40.107.237.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sv67LDfN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AP80UMuLtzPs6zO2PJg5haPnKEiUImxfpSqcmDyMQsyLZrp0JbDkqKCgMmJB4lcRLoqEKvC0N11JaZZqF5hdicnwgzbyK6jQaQA9NUv+6xpmq8zEWwoATuV+9hNn22VCW1/nWOwLG3JFue5Orrs8Zm2bjviVxf27cVOYAF1BAZcb2/Sv/e9jyeNcUf1ZLlUp3siF+yhn4WmPcnrfBq7lAUT7VUwCL/eUgsfXqAcO3vVYRApZsbgEuoRmwpExRf91fQ3yIz627ybeI0EcRwdAmqon6A5lgdSGgWxpwQC4SevndLF6Qmhx4/3fi6phgdIVLFfF5t441yU++IbbrJwwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0DUcd0CWz7rpzAVovnpxB/2DNYMIzcyM3Y1u8Qp9V8=;
 b=SQLjAjvI9M9EiDgjcaLPK2gTdr53mkUBANmX1Qa203GoSCR/YDe6HxKTG/pMfRGRSLGRWDECZzw5u8I5MFCgsq6VylU4VhjHK8d/5iO9kNXSGam/NeKZKqKMssWVoZ4iUK+MIRTJd5dTOYPAXPxSAfyPb+8F4O6/hsnhxGfTsKDkaFA/xtt3a1indXyfvpsflE9vkG+7BzHKdiWl9MYE8+nxePeOuEWUvt4I0TGjcH5kF8hUI4QP5Ke4DzAsm9LCUzCXlpwpHLT3hopeaDqw56zH5jgKtmXna9Ch2Q9Pq+dXcXS9ouDUEnYdskYF2mOmLeOx8QpKgtQOpyG52pr69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0DUcd0CWz7rpzAVovnpxB/2DNYMIzcyM3Y1u8Qp9V8=;
 b=sv67LDfNZFuEbCkU4pUBk0YAP558MKn5rMWWCBRDtXFmmM2Cn3kwqwhcaJ1nNYDKy4S+2+Aj1KdKr74eUOQebpb9fM/XSJtCr8nCxjLlT17Wvl6q12xUYIIIIqbdXO/cKwwfKMHLkbhaEsJKIJTG68e+KOfarOgmPQCNiKkHOx4=
Received: from BN0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:408:e6::19)
 by PH7PR12MB7965.namprd12.prod.outlook.com (2603:10b6:510:270::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 11:14:50 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::41) by BN0PR03CA0014.outlook.office365.com
 (2603:10b6:408:e6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 11:14:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 11:14:50 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:14:48 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v10 01/11] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Mon, 21 Oct 2024 11:14:18 +0000
Message-ID: <20241021111428.2676884-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|PH7PR12MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: 107ce563-74d8-4cc5-093b-08dcf1c194c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uno3UHc5WDJXTHkvQ2tRcTlOVnljWGJsTWpVM3FoaFROMmR5MGx3djdJV0hW?=
 =?utf-8?B?ZTVoRFB5STQwT2RzYmJLUWx2ZkxsZ1JlUGtDd0cyMnVQNCt2bmFNRi80akd0?=
 =?utf-8?B?d0RseHF3YWtmYmJoNVAzWW9ESkkxUUhHcHYvNTRIYUtGaEwwU1lOTm01NmM1?=
 =?utf-8?B?dy9naTBEZjBhNStla2NOQzBXc2dCN2d5UnBNVnFseW9sa1I1aXBwSi93UUFi?=
 =?utf-8?B?VFdzRUYxeXYyWlVMa2F6WTlLaEl4dVVRQVd5ODdBRmloSW1WR0QzdkNQUE5U?=
 =?utf-8?B?N1duSWlMUFZ2RnhHYWZHbXpjYmIwNk51bFpXRDRzK1BMUlNiMktEc1k5QXpi?=
 =?utf-8?B?RFRjZWtXR3lYci9tL2dhMTNNYy9ucUtwUHhmaVBaaEZUUkUzQTlUSVZQeXhJ?=
 =?utf-8?B?OEpGNnl3cllwV2g3M2Y5My9oTnA4Z0pOVTVkbGJ6TFcyVWtRdWdLMDFuM0FR?=
 =?utf-8?B?V1Y4SVBjY1ZJTWsxdkdxakdheFM5Q04rdjE2VEhGUUxEcERvdm5FMUVHenMz?=
 =?utf-8?B?NlNQa3BMZTg1Q0tvT3RIdUIzenhKREVDYWc4VGlkVTFGSXRERzJGUUZ1dmlT?=
 =?utf-8?B?TldjT1ZtVWJWVVZ4Zlh0a2dla0RnOXI2Mm8wdk5oR0FNRmVjVlhLR2QyTjQ2?=
 =?utf-8?B?Y3N2U3QyT3lDSnRaOXhpSVpSSTdjMGxUbHZBdld3aHViQXlCTnE1dEZpaFRG?=
 =?utf-8?B?OTdOU09INTEzZFpSVUlFWmRmVWhWNGlwY0E3eDkyR3Fodm0zR0ZuUUJUand3?=
 =?utf-8?B?UVI2ZGcwd1BKUmpkZCtBVzhTQ2U2UW9tR3gzQ1lSVDk4N3N1bUZQbEFROUhx?=
 =?utf-8?B?T0ZsSWhWVWE2WVVkM0VsTm42clJNdDhOOFlYelFyejNraVVmUk9pS09hMVRP?=
 =?utf-8?B?VkVJSUNDZXB2NitJMG9FeTc3d3Y3c1V3NkF5UDZBL29sUzI4SE1iK0tjR1Nx?=
 =?utf-8?B?QjhMdCtVa0NiNlFHVml2N1RFQW0rRU9DWm5WYUtvM3VkSzJ0YXhHMFBtL2F1?=
 =?utf-8?B?UVhoc3ZvMFcrZzBFemlXYUlKdzlxSSsxblpONWk5ZkNLbmN3Rk1WYjhwMnRF?=
 =?utf-8?B?MzUwbm1lVWxZR2dwUEhBdHFBbjE5QUdZWmtEM2gzVENNM3ZER2sySVZYR1k3?=
 =?utf-8?B?ZzB0OWluU2llOE4rNnJ3cStqWkNZZjF0L2E2Q2pBbTNRcTd3a0VzdFZJbUxR?=
 =?utf-8?B?azB2eWtSSnZvNnhlSGQ4czUzSmRkeFY5NzlHcHBjZGx1cURlc0RvZ3A2TUp3?=
 =?utf-8?B?WFpFK2Z0UlhXRE5jWjJxbWxyOHdWTkJ6WWdtU1hTRmFsWm4xYXUzUnZDaVd5?=
 =?utf-8?B?aEQ1Uko3SjhySFBYOFJjUE0vOVJIUWxVMnlFdk9oemRoaENwc0VHQWVrdXpM?=
 =?utf-8?B?QkN2WXhVSTI4U3BBR0QxdzNBQ29zVkJIdGxVeFFRUmdPYk5tYUxuM09JNCts?=
 =?utf-8?B?SFVKQ1R4SWt0eG51aEFvQk43S0g5clJIbGlIeWpoWHVOQk1CQjZyZklCaVhs?=
 =?utf-8?B?ZDNETCtzY0hZbVJGTXc1cFlBeTNOTWhwSXlpeDRQYmJ0Ukk4VXhndHkycFh5?=
 =?utf-8?B?ZjE2NDhEYlgzZ3RXaDRqdU1pTFJ2RGY5RVlVaTFiRlp4ai8yTDk0WERDZDkx?=
 =?utf-8?B?MDUvbUlsT09sNWdPZldFZVJ0bk5pNU1XakpzTTNTNjQydWE3eUpla2dJNjJs?=
 =?utf-8?B?RzhFZFpKTG4ycWppRlBjT1Yvb0VEZzhFcDIvV0lmcHk5T2hVZm0xdDVCekV3?=
 =?utf-8?B?SWtTQkRMTFYrQndvdWNRWHJ5ejFGYkhKTGRJZ0EvMWVaUmRxUXpmZ1drQUZs?=
 =?utf-8?B?RnU2cXVPa29QaUhHRkNsbk5yQWFMZENUVW9KVUdlalpwaW1GNGJyaDJlWUE4?=
 =?utf-8?B?SE00ZzdPcFZ5cHNnK3ZSdEl2RlNZb28wanNRWWxEaldhcnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:14:50.6106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 107ce563-74d8-4cc5-093b-08dcf1c194c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7965

This is in preparation to splitting ACPI and platform device drivers.
Create and move hsmp specific code into its own directory,
no logical changes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v9:
None

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

