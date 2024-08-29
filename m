Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F7A14B96F
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911630; cv=fail; b=fB1VULMwZxKEhcATP2IPE/tOve8C6L0mk3ioZkGXnYfh5gr6J8cYc6L4pLgaPWaR02acIzkIXe+FfwQ0073dFNFuQ1WjUe/h4+ZUHOrouDNDlnw6SuQNTOVyrWLxbPd5ZRC3bloRW+lFndpfIueua/TEr+xZcd/QoYZjo4uUgfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911630; c=relaxed/simple;
	bh=7GAiY8HcAzhK7N8IYdZgeSB03atIk/Egzsjc9rTZ2Ow=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NWSZGOKks92vrt+9meGSpillHf3i2IU8hQm4KRRmfnAiODfyelQ+IbXyUEt0HORbvo6p+3C4lQlTc+CS2ONxeLtpvSAs14AhLemkyCR8HZcfFgTf8pe45jLcvYmh2lF7hzGY7mU0hdQb2cXQKMuoBAOj0uGY1z/CKE7B9hQo4HQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n8/t7ZSe; arc=fail smtp.client-ip=40.107.96.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n8/t7ZSe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSzvndwjAtteSuC0LPB0UP7F+nihdAX+BELOS7gWCjfhCjRIvGxNULgHDifbkT2x4JCcSnLbbr2HGm5APUdSk6avtxw+1rDkC1qBsfZLBPaBktHWslu1lBwuyr2UK2x8d7HhUwNwzbIvHNK1rbaSB8YwjXCdRyjzBlY/Zz/TKUnsOVj0JnUC2XfbuFzEfOEwHzxPmtDjxokyq9k/74twVej/TY1IXvlD6tEXaTe91Hru3F5lYAsWMlgXvONB5PUwPfD6sCmyrK2cc6iTs5rve3+5FkabddI+8HHFhcC7lmAJIkhS/FIdDd/rEZw3wX1uXfFurUlmF3Y2JS7inEnSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrhsEZxugqBKiOm4IQu4hpTVtrP8BqcQ3gurlm+PD6Q=;
 b=MiPPVBm6hdDd6rKTEdEZGNXKZ67jbymoXtej+N4sA9xYlmQk7yqKEwqILt68jGTNS2A8nmr07G6EUTYSm3MES1L0wAyrDe7M9LdQHRrbQvuM/rUwsJmT5ftyIPxGpGW4KvvGOgVL3HH4AjgXJn0WO0wDuPtvMf3++ibrFmNUCcKa6WG6i1mZCW2lHDZydrwX2aMTyyHF/BkZQua5NLM6/3l2iL3tG8GcT6OQbhf8OyJn0cXywlWXz+0H4C64XESNzmJrC3sAWDkTem62NDgrNf5j4QyDWABeFq9R8OAEFl2f1CyluvCeu7SHeBeImvaj/0zEV7IT/OJpgJOR7jo1pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrhsEZxugqBKiOm4IQu4hpTVtrP8BqcQ3gurlm+PD6Q=;
 b=n8/t7ZSe8mqI+mdcUFwecMET4jyjeeCn0fFy9r9adGy2GLqrXzMT/Lz6LNHjh3cll1mZIIe8vk+vLv0d0fSh9I/KnvcqM/BZ8Yb6FgigL8VG+oeJnfbDOXoVNT07jSFLzHVctCJsCrpiQxCrldzVSnDTftKeszT+a97W7hj/79w=
Received: from BYAPR07CA0090.namprd07.prod.outlook.com (2603:10b6:a03:12b::31)
 by CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 06:07:05 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::c3) by BYAPR07CA0090.outlook.office365.com
 (2603:10b6:a03:12b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:05 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:06:59 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 01/10] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Thu, 29 Aug 2024 06:05:58 +0000
Message-ID: <20240829060617.1548658-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|CY8PR12MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 7802c343-c3e0-4671-9487-08dcc7f0cee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHJqcFZiSGozcE5PVHpYREt6MUZvaTk1TThrUmNZcEhkYlNzZlBDYjgzd2V4?=
 =?utf-8?B?V2hPV1hkclc1V0M3eWpkdlNSNkQwMVZURnpHRnhIVi83L0tPQkYvcEUzTWR5?=
 =?utf-8?B?VUJKQTZXNnhuaDBWSmdBYkExeU9KOTZ2Y292MDN2SnkvdVVKc01SR2RzMWkx?=
 =?utf-8?B?VTR4ZzlHTm9yNlFyQUIvYzV6WnBFUVdDa1dmRk8wbmw4cHBMU1M1dm5LVUdn?=
 =?utf-8?B?YzlzZVZXejhrbzJmNnNTNEFBc3Rwekk1YzNDNnQvdkx3ajBnNEN5cVIzdXFT?=
 =?utf-8?B?a3Jmb2RaYXc2dGxZSHVJTS9EeFg2blg5QXpXa3N3WU0vQy95WEdUVHp5QitC?=
 =?utf-8?B?elExbG5KZ0dsdDhFclQ4cjRmM0dpYVU1cUFpY2RoVnc4K0dabldyWk1qM09r?=
 =?utf-8?B?K1NhYmhEZ09YL2xTalR6d2hoZEpEclZueXBpY0NxMU8wV2xCYWt2cXNrMjg3?=
 =?utf-8?B?bEhOaU93NzdqempOa2VKcWpwdmJmcUJQTzVLTE5JMzdxSDBZd09FT282a0Z3?=
 =?utf-8?B?ZTY1eDIxcU5RcGFxZUVSTXZhQy9FSlp3MzYzb3J0NEtxVG5BOFZoNTMzd0hX?=
 =?utf-8?B?S2RCMHowR3ZGMFZtOVlKWjBONzQ0TnJEVGdGLzJUb25nYTJCTFRpb3JnT2lZ?=
 =?utf-8?B?S1VNTzVMcnZrR0VzdWZDcWZUeFdGS1FhdjFsYXZFRy94ZjRrMGtQUk16Y1dX?=
 =?utf-8?B?UFhvTEVlS3dSdmRDSGdQRmFOMk01WWxvQm1QOHpUeW1EOTRXVUhmVVZsZk5x?=
 =?utf-8?B?ZkUvRnYwcFZqbG1Wc2cyck9IM2htZHB3dytPb2NEM3pPVkpLTDVQTE1CN0g3?=
 =?utf-8?B?czVWVVNiU1h1M0RlVHpjUU1IUis3SndPWnZMRDlEZ2I3SDFMeThXSDhKWXBN?=
 =?utf-8?B?SzJnOXluYm1DZk5WWmlUNzJvRDhXV29xOEE1cjJ6RTlQSFY4VEIrVWZSRkJp?=
 =?utf-8?B?Qk9VaVlYeUhLdGZYK2RwZm55cnJUVXo3U1RGZ2JyQll3dndaZ1oyK28zcjhJ?=
 =?utf-8?B?WTNPNjhkVWQ0TmFuWG9iQS9zSVZwZG9Vb1Y5NlR0akIvd0x1WWtMcElGTk8w?=
 =?utf-8?B?d1lYekZ6QWlQZW1DbVI2N09vclRuOVUwZ1RIVUZ4eG5TcVNLRkVEVFVpMXJt?=
 =?utf-8?B?ZzVaMGFOWEFSNWJBcVVYTnVrTFJtakxVOTZ3N1dxR1RRNC9iQzVqZ05kcXJ2?=
 =?utf-8?B?eUJnZHd3Z3lkREt0aVFuMTJuY1NEc0NKM1diNUdYTUJIMkxzQXdlb3A0bHNW?=
 =?utf-8?B?RlU4THRCTVhQQnZvWC9wRkFYeXZCdG1DYzNkS3U1MERNVkRqMzZFWE5XQlZy?=
 =?utf-8?B?UndhVnVQS2NiT2xxVDFxY3dsSEpIWFVQbU1kdkZlNWFGU1JmVVl0eG9HbVJs?=
 =?utf-8?B?MkZyV1FnTnd0TWpHWlhkajdma24rT1RHQ0F6SmlQSE1IMEd1Z1NKRWpCaVVT?=
 =?utf-8?B?eE4zdWw2WThMY2RRU3owU2RaTUdNZitVN09pRVZ2MWtoME5iL0RKNkdpZWtC?=
 =?utf-8?B?cWpUVTJ5cFI0bW9ua0NUdENhZVQyL0tkeTMyaDF6Q3hGMUkzbkk2ditKQUJB?=
 =?utf-8?B?RkJsTmxJL0VHWUxFRzB6OXRoViswM0grY25nZVlXaGF2bVlmVm8zMkFoUjdG?=
 =?utf-8?B?dVZ4eGg5RU8rbnFoaTgyWUtkdVpac1hlQlJXT214Wmx0T1ViSk12UDNWOEVV?=
 =?utf-8?B?NGx2WUtSVHhoWXVYeUp3a1pWd0NyWmR6ZHVvZjNGckVlQi9NYitFeWNHOUpS?=
 =?utf-8?B?RG5tOG5TcjZrT3NUT2xYaUVwWkFwYVV0dE9BcXBjSklzR0NzS0tTY3MzVVhZ?=
 =?utf-8?B?ZkNpRnV3TFVxUDlXRFJQT2w1N0FJT0N0MkNnODVnWWdlM2s2ZWUyYzJ2dTIx?=
 =?utf-8?B?bVF1MWpXS3BwUHZuZDlqV0U1N3NrTHNRbXk3NU5pdUlwbXVMRjVheWh0RGlB?=
 =?utf-8?Q?ecURCwNdmQ8cZsEG+oipeO9fbVReiKHK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:05.2154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7802c343-c3e0-4671-9487-08dcc7f0cee5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193

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

