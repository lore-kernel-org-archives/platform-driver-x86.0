Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3ED220689
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Apr 2025 10:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576676; cv=fail; b=F+G6IqRI2Egvv3/dpzykupt9aJorlsAy9PctiFl3eOtf6zWhGabYIqqfSO4OBaiycnaGHXKKszz7Nt3fzdBuFi3cwDjoQFFBrecSM4bpbxNhhtoIBlJ2dDEBKM8z62AI8uJ1ZI6yzdWPLSYM4yG+x8nD54IMfdnzeo6qOxo91+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576676; c=relaxed/simple;
	bh=OqqR9eHMLdYbNmHSCB/PcOodW9C/HgGSKkrmSP21xIQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aTeExtj3IsRgbJb4av52tepT2gxp79XtH00g2bbEE80WoCBG85O9aQ0XZ02RBJwiyCcRppkPHU/n1K9zyG82AICDBmKJ7uZ7IhPJ4+X+z6yLccBTF7plWfl+bKrqwe0IMFQ5sQsAagw9dOFg3UCOdkW2gfV4QJnT/0ZzhdbRvuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jGMsqX0+; arc=fail smtp.client-ip=40.107.237.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jGMsqX0+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMn9gxXyOBlaAuYnNdJ64JB+meiwYJHFhIAtcRtoABvxg00eeTAbdIZUByubhwoC8UdhNClL5vqV6BcX4kUZC2601EeJiX1D475vr6O/fBx2Xfvd8zZ+MWv1rw2Zwgol/avscufXRhjv1MO9mkUIvWpXeZc1bybvEFd+trJAFT16h+hEOtWlSDnx4UBrI1z9gqtlWSSwzyXhDsiSS/0yS4B4kr1NOVFnkmJhjIDrc3mMh9Lss92onyD6v7d8n5bgTtQmLGGX5gYkjVsJ9+i1onEiHdigzlTfL6yzuKfbot/40MYAp5oZA4UvnDPnfJ1dOnx3i0wskdgkOHvC22suMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJRNrFrp7v7zK8WMIvgL3T3hXYKO0tSYvCdAe07QmUA=;
 b=QZyfHDsVHO9pYzL1U0gaJl8Ov+BPIJQDG0+9X++zg8Hg5JgW8507bWUQEJYR5knj/1zhxQqIBUXzECZAz2jstTWnriOpD5WcLRyg7oytxAtID1wqtNVopWpsY2hW3jyRkO4Xs9j44vA8C31T2ObpjmLmKTPCjKaSxR5WvKMwsr1WYKDxkx4Q29/Znk8rtU0+Hq42W6t8fnpy3ZFVbBLDl5Cbba9PR+cxq1p4HTIenRg3YCFuxY38GvIcjtRmHclnDaTTI2NeTpyccX6jBbsTTaaMpHhG16CrjEQPCVx8yHRvgwO7ebMr4LT9nNuM0alaiSz5E3C9h+B5T0tfm/NsAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJRNrFrp7v7zK8WMIvgL3T3hXYKO0tSYvCdAe07QmUA=;
 b=jGMsqX0+Q/p0q3My8rxAzQrVkBLdjM0rNwWdvIEcYo2Iv4fbw79Ddd15Onb3/q93ymx6Gy4TR6MeZyzQMjo8Zp+d7mFEyyVK5Hu+qUAUrgGA/nVYVGzIVraLVFDGzX+DK8f9576WxjvFVNkVX6FLPD5kzsjMKd50mOpOD45VpSk=
Received: from PH7P220CA0078.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::34)
 by DS0PR12MB9276.namprd12.prod.outlook.com (2603:10b6:8:1a0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 10:24:31 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::f) by PH7P220CA0078.outlook.office365.com
 (2603:10b6:510:32c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Fri,
 25 Apr 2025 10:24:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 10:24:30 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 05:24:28 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>, Gregory Price <gourry@gourry.net>
Subject: [v2] platform/x86/amd/hsmp: Make amd_hsmp and hsmp_acpi as mutually exclusive drivers
Date: Fri, 25 Apr 2025 10:23:57 +0000
Message-ID: <20250425102357.266790-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|DS0PR12MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8f9f17-be10-44ce-6fbd-08dd83e35dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LHs5D6VvplAvzkfqcq30+wQaoKCMwzEEo2Qyu3B9OHqoJYVcD6pkUiRxAcXP?=
 =?us-ascii?Q?rymLpnnUDwkDmljpd8DePmN66yOtcQrr2y+8DoRAZlHXDDuPOZscCYupZism?=
 =?us-ascii?Q?8M/1q0r3JhQgIt9JpV3+Air2tKWGJs6X5ye1yksd0vLnaSmjaEDiVTJh7eVe?=
 =?us-ascii?Q?GKh0ygAZJL122mJ0wlvUR8Ox4Czl5wH9WcOpw1Gksq9AKt6AW9vkkKXpr4/j?=
 =?us-ascii?Q?PC5A29kBe2/ZzK1L0bE8bTIu5twkgPRvfKr+7OBpIsbYRrVDZHnuOqUiHjSS?=
 =?us-ascii?Q?lR2375dbulRuJsyHWPI3KUMQ3TWp6q8NemOrCrl+xiHTFL76ad7hfjwfAmLk?=
 =?us-ascii?Q?YHyIwnreOOI6KN+AWB6K+4eD9UirTJ8sVXuXzJ5qT9z3+JUx0ihBAUBS3BJo?=
 =?us-ascii?Q?mtbPaSKP9RyBQBkXt8ra8T0cDPFOoc68n5evLlqXw7wDLtaMRZ8uRjxpgrBh?=
 =?us-ascii?Q?O6Nnppuf2k6PpX+Eu4MsM33v8pYBK3CbDqzGFi+Os7umXNRWTThAHkSDgf6o?=
 =?us-ascii?Q?iRwAoVwMemoTUJ3dZzGkIPak/56SR9fXbXj6c3dBRaSlGOYLrRLrLTJXP7C0?=
 =?us-ascii?Q?DepYJ2xtvyQu3n1aVXHjTiVRpRnGpIE89MtWTgnXf52BLZGJvek6fAa1LFcU?=
 =?us-ascii?Q?Dbmj65tHvZV0dRcx9SEoH0ZtG+9DooyMK2wAP7s+FUR2ssCPwnrZsXsNaxFi?=
 =?us-ascii?Q?KQRFMVOaR+xGRYjdgNeWRiB6NsYTYYFU2E73cECyMCBa0a4w6aMzRn+nf1u5?=
 =?us-ascii?Q?9nDsYQigxjU7uYZl11X76djkJ+KFXZ7GCMGKEarxGGuqcnX7pdqsj2xXYmfw?=
 =?us-ascii?Q?jxB6dYoYWW+CWircNXRBIJIK64Hk0JCxoVBurmurDNqxBDTSyEfkUafOSI/6?=
 =?us-ascii?Q?OmEzDCFwq52PIHKbMmW328ohvoGp9u87IL9s9PRS29pACSvldmUJAuF+6TZz?=
 =?us-ascii?Q?erSYOSXFOxpPT4YTS0XKwUtvPbDNNYtNB5+T6IJsNZZJLy8i5F0Cq5xwwIcD?=
 =?us-ascii?Q?cwrtV68BF1j1EWw4Z62ynAbBzcsuu+d7om66hCTa3wuU2TRhbt0yb0fQW72f?=
 =?us-ascii?Q?stszxstm5GyMz9ZjUZar9Hi+DH0j88OnBgbjezwXD7EqFgAzY3NDMRdGcfg3?=
 =?us-ascii?Q?6XN7cdXyPSA4/LnaAmIg01R2/+Tzw469dUFK4kCAevP3qlUgyLFHH+K+iT4j?=
 =?us-ascii?Q?JCUYRxK5uskRzyAXpNqqTHvFmC6FbA4NYNMKYOX2qGXbm1ojTkGMX5D+98zk?=
 =?us-ascii?Q?0RWipnF/xErgPo9WFhd16UpL/q99Llhxvv6YjLgQL+dY7U9X1WFUu1QFeGvs?=
 =?us-ascii?Q?YyumqL2j+5Z77O2ij6cvFBA+d2wehJptPpXbmvqzPOMo7IsBJpgT7Y5wKouD?=
 =?us-ascii?Q?T1VXnsWCFGqaFQrur/eeXyjna6Y2Qq3EFUOOggWR2cNRY2dGavyo6y0gEaxx?=
 =?us-ascii?Q?EyIcVimziBuujGQsljJdw4N7mrUUcogMdmUxqS3tcLlomciDLYjcOY77iz0h?=
 =?us-ascii?Q?5dB/B1lb+EUNgYMI2zgjAA/9aIUPvu8xsbpN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 10:24:30.8583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8f9f17-be10-44ce-6fbd-08dd83e35dbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9276

amd_hsmp and hsmp_acpi are intended to be mutually exclusive drivers and
amd_hsmp is for legacy platforms. To achieve this, it is essential to
check for the presence of the ACPI device in plat.c. If the hsmp ACPI
device entry is found, allow the hsmp_acpi driver to manage the hsmp
and return an error from plat.c.

Additionally, rename the driver from amd_hsmp to hsmp_acpi to prevent
"Driver 'amd_hsmp' is already registered, aborting..." error in case
both drivers are loaded simultaneously.

Also, support both platform device based and ACPI based probing for
family 0x1A models 0x00 to 0x0F, implement only ACPI based probing
for family 0x1A, models 0x10 to 0x1F. Return false from
legacy_hsmp_support() for this platform.
This aligns with the condition check in is_f1a_m0h().

Link: https://lore.kernel.org/platform-driver-x86/aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F/
Fixes: 7d3135d16356 ("platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers")
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Co-developed-by: Gregory Price <gourry@gourry.net>
Signed-off-by: Gregory Price <gourry@gourry.net>
Signed-off-by: Suma Hegde <suma.hegde@amd.com>
---
Changes since v1:
1. Change commit message and commit description
2. Merge below patch by Gregory Price into this
   https://lore.kernel.org/platform-driver-x86/aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F/

 drivers/platform/x86/amd/hsmp/acpi.c | 3 +--
 drivers/platform/x86/amd/hsmp/hsmp.h | 1 +
 drivers/platform/x86/amd/hsmp/plat.c | 6 +++++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index c1eccb3c80c5..eaae044e4f82 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -27,9 +27,8 @@
 
 #include "hsmp.h"
 
-#define DRIVER_NAME		"amd_hsmp"
+#define DRIVER_NAME		"hsmp_acpi"
 #define DRIVER_VERSION		"2.3"
-#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
 
 /* These are the strings specified in ACPI table */
 #define MSG_IDOFF_STR		"MsgIdOffset"
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index af8b21f821d6..d58d4f0c20d5 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -23,6 +23,7 @@
 
 #define HSMP_CDEV_NAME		"hsmp_cdev"
 #define HSMP_DEVNODE_NAME	"hsmp"
+#define ACPI_HSMP_DEVICE_HID    "AMDI0097"
 
 struct hsmp_mbaddr_info {
 	u32 base_addr;
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index b9782a078dbd..81931e808bbc 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -11,6 +11,7 @@
 
 #include <asm/amd_hsmp.h>
 
+#include <linux/acpi.h>
 #include <linux/build_bug.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -266,7 +267,7 @@ static bool legacy_hsmp_support(void)
 		}
 	case 0x1A:
 		switch (boot_cpu_data.x86_model) {
-		case 0x00 ... 0x1F:
+		case 0x00 ... 0x0F:
 			return true;
 		default:
 			return false;
@@ -288,6 +289,9 @@ static int __init hsmp_plt_init(void)
 		return ret;
 	}
 
+	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1))
+		return -ENODEV;
+
 	hsmp_pdev = get_hsmp_pdev();
 	if (!hsmp_pdev)
 		return -ENOMEM;
-- 
2.25.1

