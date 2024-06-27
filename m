Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B8C200B7
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 05:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466828; cv=fail; b=IbcRrc6Pm+2dnJb6O26E/Puy4g3ENk+gtqvQ31MRDelLeSAti3Wbc2GDlKLE3pSPzGjIatGYAfomkiLS4SF4zZX0p+QYVb7fBVGhkOqWU40o237Syt6km4cFb0Bx3AMsFTD7PktiFFM3l93z1VVf4he/TzkfPsl7p+DIe0JrHkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466828; c=relaxed/simple;
	bh=IW19AZiZUjmkTY4AyQiCXtkbeN7xYYWTUrORqOsSBw4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YUFduQoCEHfJUcSqhE743hKCYZZlXbockC9WOG/nKz8roaBU7m0M+a6/fFTGv+dIapSycRHREpDBstFA6MxgBS2Mj9+JP44aH2cOTVUPs9tZtfkriYehEjQDno7k3gQkl8pYUM+Gf/hlI8uYVNAhN4LLe3JfL1zSq/88k3toPTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vktxVehv; arc=fail smtp.client-ip=40.107.236.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vktxVehv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXvsWZ7GnIqJDS6z0OjJIkOHgbJ1ZyCF/Q08U5k52bBJGZbhys4FEoRtS1OLmufAEn1ABZpqdBUOJaZuKKmr0VeIKzZ+NJAPY350oLjVGIosPWTGaghsj8URRIsI1o267yQe6OBnBpzw0f76DBXQFb2QKOERTc5lGQsYEVKsR1upoYXrE+GwgLbNETh9G3C6uHSe65FsDgTxUt68UColVvlyIZugf99SEe/jd8FEggVe/h5oOxi0HayB4/5HujAlG9SY2oELixpXgaGCq042HIC/o4JRPpKnpqyAulPG47zZewpSl0mv1/2MsVWyNEdQ+HGch1O8+m3uNAqsrVuAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jSthZjZ68swQTWoIUV0VK3CVPaWVxFfUZv6z2BMJRY=;
 b=ksx+uyD9H0Qb2lPSV4Z35LEUfKyEJwejLqHnUOLigEjmRFH2CR6CEjsMlLGK4+fxDvQ/wvoGOvR1m/ntTttcwPCXoOHK1lzxxU0TtLONJz+oh/blR5/Fela1jA6DWcqWMEbSyGoytYaCO1BIGQSARi+1JKiSioQ0HlxVFvZD+oSv+5/g/rk/RmDbXNgrrSVXwCpBcS+IZNjUVA+CacVzJeub55H6cbBOp6TqAwa+4ywEwltDanKXFvUI1Rw2lxB/VStfiPex/ju1xIEQsvH1zYI5Zx6+O0FoqZCutrT2rFf1RlS3xqi+508CUzx8xxkX+G024TK+fLzk6yyHpP9VQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jSthZjZ68swQTWoIUV0VK3CVPaWVxFfUZv6z2BMJRY=;
 b=vktxVehvdfBp+bOhrqhkuIchZ3l3Ez0wdgTiYqhllbEMiv0bqBNQ2fjx/mBTpwrIpCyJ5dkJ1isafMj7/t/cHJImgDctnIy1RrU2K6zdt+mWcfYZcJaz3CwHPMCbVBHT8Y32a2231R7OuDUQKD983TgSD2zeZ0oKrqUcKMNJgV8=
Received: from PH7PR13CA0008.namprd13.prod.outlook.com (2603:10b6:510:174::15)
 by SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 05:40:21 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::fb) by PH7PR13CA0008.outlook.office365.com
 (2603:10b6:510:174::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Thu, 27 Jun 2024 05:40:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 05:40:21 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 00:40:19 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 01/10] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Thu, 27 Jun 2024 05:39:49 +0000
Message-ID: <20240627053958.2533860-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627053958.2533860-1-suma.hegde@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|SN7PR12MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 66bf12ff-b495-4dce-5608-08dc966ba2ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SEwDgSvASQvLGQTtA0gAoqKUJuNBB3TNLGuaxwyW2nbcCaOPHltcJ0SYik7V?=
 =?us-ascii?Q?L4SMMRFKQgi3Pbewm4mRzKFgX5LEU4lkaf5i0u3h8hAZwsWyUiPxPZLnUF7p?=
 =?us-ascii?Q?PWx2ToP0NUC9MO7xI+qLAQHlnV1VhHK9DTFm8LBylffFRePuHGX7jRY/rpm8?=
 =?us-ascii?Q?5McjB6zc9tYI6Fg0jh7TsRTCtt6oOX+SQUg6dsvG8I0GRK8j4HEokZriBMEU?=
 =?us-ascii?Q?SahsVzmZl3QvplGVnmqyYhfqow5sb5qrto+I1Jo6Gb2OjLF1k1ozqwBX2dGi?=
 =?us-ascii?Q?Iwqi8GmvJy2CxMjE+8crlsR4KDghzHs02CO1p6C3YaGG6sbHTwkgz9iyFmbo?=
 =?us-ascii?Q?/4ruNdUExG/+uVtDxYixLwjWNgNc26igDGVjF3Ylt9CYVpf39NeaYGnIYO6q?=
 =?us-ascii?Q?woSZTtqNBFZGsRvnj3uZwU4fMQinYfokNbXFjbQVklfdG3/AMESbavfmYeuH?=
 =?us-ascii?Q?E9v2YqFQXUzqAag2B+MkMfXHavgcdoesHMUmErsBq9nfxx7DHfEYW5WL4Hd3?=
 =?us-ascii?Q?4DJMR+PyzGxBQ87RF0gG1NuzwuIjwWEobyXqDk92YEWJhXqGWGHJFduTWQGx?=
 =?us-ascii?Q?PrAyq7wW4EUr8i4XpKzLsHhbX2/mxzcVw0PG/8mdA+/pNwvXLH7e8ANS92TP?=
 =?us-ascii?Q?7OKq//jwD6oOJd+b33T/JO+QrBUnbDf6E6lLVez+3hjCA6RBMVl/giGjN9Ty?=
 =?us-ascii?Q?SuSyrzJsQknZWuD94L1VgTuqxohVAbLJOJcn8WTKDPNaZGva5p61sGvEihJZ?=
 =?us-ascii?Q?O7NBCPshckbdQowFRMLijOzU2MdSw3+BsHDLg4/BXa8FNTzoLYRf6UcDS2++?=
 =?us-ascii?Q?t87BpPwDM6pQmtJZYkcG7KnBHPEl2hl7owBmLv28MXBC25GpUQWISVrkR2+Y?=
 =?us-ascii?Q?QPKmnQHQa5tAbXsFRh0nmPFrBXKbJmj22aPyA3fb+uttgdSNrSIvdd3nFQnF?=
 =?us-ascii?Q?fP0I/+QhSCt5aJU/6Kz+wWgAjO3oGnOakK+JNxrwm8+ubc5shsJjoX0l1iSM?=
 =?us-ascii?Q?tti7HLrOKZg009THPwqDpZffrZ36daya4qnl6LkEF9VINCjct4yQXpTi6Mzo?=
 =?us-ascii?Q?zW4Du90a4mOUHdLScDuKz6koZr58q0u7rp1RZbTuBbxr/5HrddIFAAA6zCsW?=
 =?us-ascii?Q?FvSfLoB+RVSu7UBXpAgvc2c8lABiMDsFPzYWwUv016D5JyprcR1jRIHqdERF?=
 =?us-ascii?Q?/0X29Twdwh0HAN0AL7F1tRX9mMT3RyKkUdXj0GN1ta/lpX5LdQeyhFbV8n2H?=
 =?us-ascii?Q?rvvL+akWw3sMeHmyTVv/unLGX/NV07j5NlvL/RUJstqnZqbWhx/EHdeP1654?=
 =?us-ascii?Q?8szpzIkMOh7T1rfHuYYYQJuG9kIxhyQVveEVj7/+Ds1szR1tjY0/vl0Fetz/?=
 =?us-ascii?Q?7F7ydUcOwHgfXWYwa1wnSS6S8tN1Q0ITY6BRac+IxRr2EEIu3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:40:21.3700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66bf12ff-b495-4dce-5608-08dc966ba2ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958

This is in preparation to splitting ACPI and platform device drivers.
Create and move hsmp specific code into its own directory,
no logical changes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
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

