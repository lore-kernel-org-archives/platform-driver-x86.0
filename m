Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8FF2517BF
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2025 06:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742882726; cv=fail; b=mv3hJWxWJrJ8sfpkbELkILFTdTs5EYZpPj/PGpg8msdgPmTz2YG1ImHQAHkAXHaVGhb52ucsvBGJvQhpWuIWmHiHhMVW5iEG9DoxnqKyGc/sKgVx2frQ+k4Nmjj3kgEbx62br/Vwh1YkvpzgvQe+P0erNFAOK2Btg2SUBz97uAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742882726; c=relaxed/simple;
	bh=RuvYitWhPz4jqfh3yO2JdOLjpcrLI8Enc8LR1uqqqus=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xo6iMTrPTnevUq3SDfgqmaNgZ3XKYnK1LHfc4GTSi6H/NYyvkhQtFks5r+TlNLebkRzCApRS3Q4YB2hTF54pGrHVzoRvEeY+6d/r9T8Fzb8DDDWhaA17+VkB2MpYJDHQ0WQ+95IDCuO8RmyMFus4jcfRKfWzJahpg8xcb/rLUo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H0crze2U; arc=fail smtp.client-ip=40.107.237.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H0crze2U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iF55eU0TUMVKIIdC9UtWrJ0CanzVIRBj8x0G7lCgVecHfMjFYzxxqUJ6EGlsSESLLQR4moa5YSFVuJvMbUYzIiKak0C5RcyDbyZ6sIF1X8+PmtKzD9nRhqPZJ65osenFvHbhM3j0/09Al9JaTNBMkv5xU1NbTMEUFEIrDsuVm/SbunAsxCsZlKlr9S1v/mJ1OEX1xWhYCXfp25mN7pZSRrO1s7AFtdBaXdSaFH82AZtYBo/gRC2zqjCtpFqZQJ/s+AyFhExszq5unBxOkxEkL/bqJZtACQYQwzqrD8yr29uW4PHsKlOkT3nR40vXF8CfJTVIA/uG6mhhGDz0giqnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDBix0so8wM4XbhGhP8FoEidx+3Vj0vAMQyV1zzt6b0=;
 b=afe9Rw5o8TH9GdCPLR07mrihtIf6kTp2y6KsXlhe0gARtBHNjNustf0uOvc3CPwsNWZx/EvzdIztgCvsED7WeIraTyesybNATX4nOGVbr0CvMoF1isjfgd99QZvpoMc1Quu/MFgdKJjfWFvCqik5JJePH9cSuVnr2Vt/rknXSO1y2ZxVNQZu8+Lc5Iun49aOz1wy6pcLeto1z4FnKxJR5Xap+ANyxpdnWXVu4uCm3nUg4oAQgGbNgJmouLiR2ItolHbbQ75yxESJglubQS7YpdDJWBwaVsfcbcXNRcsUGkt+rUZ5BAQCjILWLUSTfUrXoAc0JA19viyzTX8S670lJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDBix0so8wM4XbhGhP8FoEidx+3Vj0vAMQyV1zzt6b0=;
 b=H0crze2UFHO6QD15Z2ut4/LwIaPJVq7oAr1lSZfV9zjCFo8QFq0un1OsCoEzosDzwIQW3FmLVF5xColl3MbrfDN1xsPnbBvUUeUblrKa6Ex7Q6GydbXwlFdyMExpzNRgp0RBS8eaNPjqZgTM+KybxkkRqcAEaqzZc7JajPA+Is0=
Received: from BN0PR02CA0029.namprd02.prod.outlook.com (2603:10b6:408:e4::34)
 by SA1PR12MB6775.namprd12.prod.outlook.com (2603:10b6:806:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 06:05:21 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::40) by BN0PR02CA0029.outlook.office365.com
 (2603:10b6:408:e4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 06:05:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 06:05:21 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 01:05:18 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 1/3] platform/x86/amd/hsmp: Use one DRIVER_VERSION
Date: Tue, 25 Mar 2025 06:04:55 +0000
Message-ID: <20250325060457.3643613-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SA1PR12MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8b0cd3-b679-4c78-c71f-08dd6b63067d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5NTZ6syLR7UNrr02lupytXBlcoMB7elHs+ucwtXpaFZwUBCwYiBoK3aCdffU?=
 =?us-ascii?Q?7na9hpId46JE0yQ9X+ejwNwN+TPV/xn37Mu4CEMJtKodq+1aF4EDTWHHFJK1?=
 =?us-ascii?Q?uSxApfhWqc+Nie+nVnqH7/bjRJPgyJirUs9p5CACGSBSCUlkwMjmBHRvx5xQ?=
 =?us-ascii?Q?nVUn1V/JtOzToCYc4/xxy8kYSAaxyXrLZNDodGLgZojgHVcaWXXqKKjr/d6w?=
 =?us-ascii?Q?nESCN6ThhDmoYkYoilRU61I30g0cfKQsGp/ZykfPhdAjk4a6YwyW320sLsHj?=
 =?us-ascii?Q?k51rtmIT+EeSomcOyLGm3HwqRnSBIRqj4lJKshrK0ikoUne3lNLVglXI18r/?=
 =?us-ascii?Q?8XwAfLqCtiG3YS88pyykCNjAumAEzT8tlZfr5D7VUi78yB5ev/FxojBWeJDs?=
 =?us-ascii?Q?844OWkBabnxrtIfyIdkhAEv2nDpzQg6mqd3cSXMfaHrNwppPap3pjw9zqK93?=
 =?us-ascii?Q?BgJdl930MPxstxNmTvcof7YcTOsTDRdEyaKcqDMKAZBEPGxQ8YgdC/hLgg8S?=
 =?us-ascii?Q?+duxDJdDUxhDPF7yPYsoNhmSh1YI78DKmvmTKB4ccau9GeQFGKDXjjdO3Pmd?=
 =?us-ascii?Q?Z1wKQ6XiBhNdYOfp0FMLzzKkRqYhMCfSvxtI6qGc48jJcKs32e6OPNSi++8A?=
 =?us-ascii?Q?W3YTFVs+hk/Gm/LiJMnjwervo4SvaNBnlHXDANLYh9/tRPj2ID5V6mdIRjKz?=
 =?us-ascii?Q?U3jI6iCJCTQ9DCyPpwnY1XuyBopB5kz5mYGjHE5gbabreX8jObs60LWlpYDp?=
 =?us-ascii?Q?SFAA71N0xbZ+byvSMHftkwmsnZot3oBDZXLyAC7oQiYzQvnrNHu7v3iQa4Ky?=
 =?us-ascii?Q?76TtHxD47t3/fDZLkjNiMoP9gCz6iyW1zdTa1J6MN+VmB1PK0hC8HgHxU8Ly?=
 =?us-ascii?Q?SC30KvcYYgy3OgymzsxazV/YBca5E1YwR+dDKCROT9yX+OWBLnAnFYYSAV/8?=
 =?us-ascii?Q?XapXdHT/JKxmxcPAkVLzM9S74AWRfRkUGBV39rtYuyOpwrNTfJe16T5kTUU8?=
 =?us-ascii?Q?FXcs2aa9wAGWWCD/5jlIhnB5hmwSTzf6c8Y+kYZyLPOkXM5PePas1DbCcEzL?=
 =?us-ascii?Q?nP2DWh8nhdjZLFp6aDM4PBaOfzkkWOh9ZQyZRFcIPNXAUiTvoS2gAmp4P5ei?=
 =?us-ascii?Q?FUQiH9cu9I2NlzieZd6+NWN6wxTbU/4FoJXlN0eaczqhqEYCSHRC3s5BwasY?=
 =?us-ascii?Q?4E1X8SUdVZU2ktfcA+S9Vmr2GmYODj2bln6L6litEfYVpaoRUrqdiZLe1OBV?=
 =?us-ascii?Q?E38YXAiWB1uoB5Dmm2syDWPuOQQMV6qqzWOClOYBaMZ2sQmDmO/H8WGVqjNP?=
 =?us-ascii?Q?kHZFAYYVViSlKjvfHKVIEw0Ti/o4nVf78S2jZVhZBy4GDjH1liqpsb2CUTK2?=
 =?us-ascii?Q?BKBqxD8dJSFe0XyiWuf0yqdau4B+eVFW3awfs1axWVo7ZoXApSv0rjenS7J3?=
 =?us-ascii?Q?x8XZBHg83YqErgxTUYaHCwddeOlLwAMIhvJyKppqd14Uoibwkq0v5PWKwS9r?=
 =?us-ascii?Q?O9d0hSNTjMiEyFI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 06:05:21.0850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8b0cd3-b679-4c78-c71f-08dd6b63067d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6775

Use one DRIVER_VERSION for plat, hsmp and acpi modules. This simplifies
userspace applications to support features based on available driver
version.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
None
(Rebased on review-ilpo-next)

 drivers/platform/x86/amd/hsmp/acpi.c | 1 -
 drivers/platform/x86/amd/hsmp/hsmp.c | 2 --
 drivers/platform/x86/amd/hsmp/hsmp.h | 2 ++
 drivers/platform/x86/amd/hsmp/plat.c | 1 -
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 444b43be35a2..0c54c91b5f1a 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -27,7 +27,6 @@
 #include "hsmp.h"
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.3"
 #define ACPI_HSMP_DEVICE_HID	"AMDI0097"
 
 /* These are the strings specified in ACPI table */
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 03164e30b3a5..8c05e1415820 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -33,8 +33,6 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-#define DRIVER_VERSION		"2.4"
-
 /*
  * When same message numbers are used for both GET and SET operation,
  * bit:31 indicates whether its SET or GET operation.
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index e852f0a947e4..3dee0bb684c7 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -26,6 +26,8 @@
 #define HSMP_CDEV_NAME		"hsmp_cdev"
 #define HSMP_DEVNODE_NAME	"hsmp"
 
+#define DRIVER_VERSION		"2.4"
+
 struct hsmp_mbaddr_info {
 	u32 base_addr;
 	u32 msg_id_off;
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index 02ca85762b68..63034408985c 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -21,7 +21,6 @@
 #include "hsmp.h"
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.3"
 
 /*
  * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
-- 
2.25.1

