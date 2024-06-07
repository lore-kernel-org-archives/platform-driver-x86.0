Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D14E194A7F
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Jun 2024 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767274; cv=fail; b=nFuMOAOwNjeLdHV86rUj0Q6KsONwR1xuSbVLSYqbyU2ABM1waP1tnYfceFm+ZDqyO6AyyLKKg2u6Uiuid8q6Kiiyj23lWatYCdVbrhNveYKlYRck1/Q2h7edcvC4rYZPVmig6XGIwBvYJaIIWcX8odcKz8j1QIuwrDpUlH3Rwb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767274; c=relaxed/simple;
	bh=A7IQJfJgOgRNOs5TexnAMGsbRaZvJFeP3cksRmZeYMM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/xK8e9QbgQ2lsxTA5dX9rX+ZFVKFW5wMTIzal+4Gyc+3QQRHQZLe2k3PfZEC+l5CD6skgHGg8zKQOkpY36AmIwRaHhWpnbnRsDatFAWiOnchi5FEMIULPzpbF4GmtVV68/Kdd4sBl2QrH6SDjOqkTesMlAddpMq214H/bFvhbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1zI912ri; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1zI912ri"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtAbblNPcw9bE/uLDgKyYdqfY+n+09nrP3PtR/XfcVxbf1yjW9L8ZPiUizIDPctUvqi2xsnOSH/nNFrbsH4B4k4L/H5hQHRARTjghN4LkWGzDVBwLSdEwi66oZNYcxbwALMYqLFsJhV8414p++3fvopxd2E9GCfKgY/CL11qsowzXkJ+x20Rd/jn21TwAFNsHY9KFgMOO5qnNXozf5LIOG/jKvMxixHo7yJcBS7nSuyi+ylmp+R6y7f//mtAC0aP6+1mpPzS/E05ApN6D/aNTPIDYQnHEW4Zoy+0thc7wx98px6dzXLwRMWn7dW8gbfjvOfu0yfVxKxAVeuF/wPcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQK9qBMOT4akpgeZJyOm5IzqBAaiFFAEuc0DbqNQsMc=;
 b=F+3p8wQu/BdUri+5ZqaTYV5d+36LsfT/Eliv1wzGWPXOjT/cwWPP8YO8b1u8fZPPY+XrYvoTm2aUynbWDY6bYe/0y0YP51xuUm1yGw1Pga9gESTYv2XAzD95n37d7kB08ZJJGwBy6XBrJ/3KIv2UBG8cWHIUwWn+UAekDVcObpxruKno95G+ygmG8L4ZI37ht/1S2qu10Hf6zIIS7UkjyTHm9wv8PAYG8I5dCmQsfqbgbKQ1+CYQVc16ALcDIQva0VqYwfYX7vboI/htg2JCdmYjbmAN3FdwcZqr5CooRWXMZfuz098GuERShUM0Nmue0UZIJ7T5fJqJ3P9RMwIibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQK9qBMOT4akpgeZJyOm5IzqBAaiFFAEuc0DbqNQsMc=;
 b=1zI912riMlAu/+90+G2jURShKf3e8kpFZoUhe4sVqT8eXK3pzV9RyCeOX9gRQ8VsSMlYZIRyA3V1drXRuU9A1R65ZQLa2DTrWWkjOCvG7L8zs45HKyrur1u2XHQmfd9DrvJDRUMe4gaE+iwgYx+JJhIOHdrlk0hAfIkij/dXdWc=
Received: from DS7PR03CA0143.namprd03.prod.outlook.com (2603:10b6:5:3b4::28)
 by CH3PR12MB8258.namprd12.prod.outlook.com (2603:10b6:610:128::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 13:34:28 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:3b4:cafe::4f) by DS7PR03CA0143.outlook.office365.com
 (2603:10b6:5:3b4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.21 via Frontend
 Transport; Fri, 7 Jun 2024 13:34:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Fri, 7 Jun 2024 13:34:28 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 08:34:26 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/hsmp: Create hsmp/ directory
Date: Fri, 7 Jun 2024 13:34:04 +0000
Message-ID: <20240607133405.1211929-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607133405.1211929-1-suma.hegde@amd.com>
References: <20240607133405.1211929-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|CH3PR12MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 3420f568-8f9e-454c-a8a1-08dc86f68e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hKfCOduxuRz9PdacEGgzOjMNbVIZhRHgjYbc3gmhK8tNsmGqwHOoA7VMpZBc?=
 =?us-ascii?Q?2PP9S/+4LKr5MYC1NAOl8b05H0n45maEFDYoDHmAHW1z/OeR480cxtEnEyyz?=
 =?us-ascii?Q?aIUWwEZ/dC4uAzvRzNn+Kph4t51x92MGz1lx97v8bMpACx3mxjDOMEZQUFCe?=
 =?us-ascii?Q?dtEqj8xUSv9FMMoJ3Y21vYHXQ/e7scznBWY4IYrTQdJ/1wICbttOWoR38c6y?=
 =?us-ascii?Q?9dXxfLfH/C3K6KAyRR1Zjluq7SMtujL+MLanK04Q6SSFA4NWVJ0z/HIQ/AjN?=
 =?us-ascii?Q?AbiF4XrRosGA6zzN0DX52aUqQeYVn2dTxpmj2OsNcRZMCL1ERfCPW6TR2Mo0?=
 =?us-ascii?Q?FxtPCWQnxoxfICDTg+4ml8n7+KozcQN28BcyTodnVhna3OEukiiDgFej+K4S?=
 =?us-ascii?Q?VWM9mIIAR3RTnHveEAMMJac/CUnIBtuuBtb8BUtq5x8NjSFzRrZkV93uepvP?=
 =?us-ascii?Q?wKkOEpnj9vb6XRESnPrT6l2+fIb3ODXjW9IyoCf4SJx9Lj5XuN0AEgGn3lHc?=
 =?us-ascii?Q?5f1Iag7/IuRYubEIyrtSopnhWZzfgBpwbsm7LsgQPj1DTm8a8kk1LaIrUTrQ?=
 =?us-ascii?Q?EKcuKGAy2tZ/lP2v2ATRFtqvy1JLzlL4cAUY0pUNTGiMY3ZKfzdRx5QDJB0o?=
 =?us-ascii?Q?/lvTNlTBWZCweZl0TdsINClXD4e8SllAjsJs2xcUfhTiPH3V04qUuhLtdWL9?=
 =?us-ascii?Q?JJmubHcRocFxI3tgPQIXCBKF9EwhrSrCSsIouRvsxyDkGv2sGQL20irIcDJ7?=
 =?us-ascii?Q?nPTbk1Ee21fXGOE4a1EkaJgSy/js8+UzSArZkfikG6CeVWJo8StCA4vlVMyO?=
 =?us-ascii?Q?cF9TxfKREi//VPWT/u2/0lQXGoz72j6UHL5Oiaeowyq+TXMDFI1VXim52rrT?=
 =?us-ascii?Q?3nBO/nYng6ObTXMT3GYJPowfhnehFDJQ/7bXOOXi7GovAW8JOJmsXuDbm8K8?=
 =?us-ascii?Q?1CBVDfuoZbGVDaywGG+ARA7dkfB5GNDarStfcJCazNJuTf8Uk7IqjsmSW3Vc?=
 =?us-ascii?Q?Hbc6W5l1YPQ5B50E2hl87+UnWCGf8gvu9DO31mvpBNJ29ly6V77Yc2aDfARA?=
 =?us-ascii?Q?Un7faNhgKok7C2UawBa7ledgfbIEQPk9g2Vz46NMfPh0vETg0aiQUhxC9aN2?=
 =?us-ascii?Q?5sx1WZ202WgFegUsRV8DsxQ33pFRq8Fhb3p4ToAsLWg1mtTxZty7MoizGi0J?=
 =?us-ascii?Q?iW0B/YtHo4eATs8Va6ckf1j2ow9FN2tn4AyCmanEBsDbRrW9Yth8u/pz8LE/?=
 =?us-ascii?Q?E3FQklscpna+qKi7g4Ab/IGkYiCkb7nQErO1Q2JKSgTRjabkO6oMwSgMK12G?=
 =?us-ascii?Q?sMT/SynMNAYT8IT7jC51acjt+A3hmUE8gEU6b92+Lr8hPGw5hW0JDNMsN0IU?=
 =?us-ascii?Q?t0Jd7tkjYIKiam9WxsWh+rj2qBtGF9XEtyNzc7Q02uVpTrTpEQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 13:34:28.6598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3420f568-8f9e-454c-a8a1-08dc86f68e53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8258

This is in preparation for the ACPI and non-ACPI code split.
Move hsmp specific code into its own directory, no logical changes.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/Kconfig           | 14 +-------------
 drivers/platform/x86/amd/Makefile          |  3 +--
 drivers/platform/x86/amd/hsmp/Kconfig      | 17 +++++++++++++++++
 drivers/platform/x86/amd/hsmp/Makefile     |  8 ++++++++
 drivers/platform/x86/amd/{ => hsmp}/hsmp.c |  0
 5 files changed, 27 insertions(+), 15 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/Kconfig
 create mode 100644 drivers/platform/x86/amd/hsmp/Makefile
 rename drivers/platform/x86/amd/{ => hsmp}/hsmp.c (100%)

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
index dcec0a46f8af..f0b2fe81c685 100644
--- a/drivers/platform/x86/amd/Makefile
+++ b/drivers/platform/x86/amd/Makefile
@@ -5,7 +5,6 @@
 #
 
 obj-$(CONFIG_AMD_PMC)		+= pmc/
-amd_hsmp-y			:= hsmp.o
-obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
+obj-$(CONFIG_AMD_HSMP)		+= hsmp/
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

