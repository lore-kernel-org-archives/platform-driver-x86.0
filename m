Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916A620B20A
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Apr 2025 06:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475975; cv=fail; b=WXAi2kqMab84WlPubsXSHq8Aw5l94Lz4AF6mXETU0waqDAY8YfQkgWPbMysTexy/Q2FIT61pehHVbEPC1DtuvfcBgUdfEJ7YRmh6gR/4msah7WMdAyTPgVNzRt0Di9A9c2BMFVQ4m7iCUDJrr/1G4IrTfK0GD7vHJBQ0LqxsV98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475975; c=relaxed/simple;
	bh=hqll8oRITyLUCl5PtoPclkqpbWupOQ874NciKmgxMKA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tIlSmw9zgAI5zfPjyCdDaeWih/VwMMAfhvmYsccrPUtDHB5ZLL0Uz1IxgrENZlxZfGsQwcVt6g8F/MmvBTZW6gYoeqnc76yEN/E8HkGhX8TyQXziAGfj6pz9EKmEQmBbtGx2eZaG+iBwJ7OHlMy/JQmwvhPJ+yPQ9/lLqrfBnkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o7WVfbdu; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o7WVfbdu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qo/wkxHjIM2Cig2OOfEMi7BTRvNc1kfydACcc4fuPIu1qF+OEZyB5yJJ/yZyflV2fph43lulUWRgj8yDaJG0JFu49fi2xDcns2pqbqS0t9F7LAGZ/3mZ+Ffff9f3ZbyRxu7QuSwcZqMQrCClKd63jH1OjEhxC8E54DqcXXLVvFIqr9PhFy7tDf3dNAt3El07ozuD+ed25RHvLqFk79sElmu7IHFDdMRu+9mu3RceUvAxEOtJ1Co7Rp48TTSHv1k1tEH8e6YOu3lY5gOMufKGtqaj032vcW9KjWsokrodAvwN7L73PF5wt+xayuV6wRKfB7MN+KlJOw0JTINskX153A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7L8lrBzryASFCWquV/PleTU+0wDYrs6+zpGTsw8BPM=;
 b=dqbkWFX7JKbqklE91nXT8u0dqfzewUSf3BP4f+U2lTJJlhvw3lp9QwFo1KqbIMjEhw6yUVmzUwuOLA0EGFJj78aYOmUOQcxcEFu0P4EHVFy3Arn5YdqPuoJhoYqT2uLhlS4aj05jECZLaBL3x77E4X653i/cCn5AR55i9Ad8zrcj0XKco4/Sj7WgWcSbvewY7LdHqeSOpewUWMoRnVu9GqYU2aGPbzHEicm1uB/CqSZx9xUdMMfXE33B6mwUyZ5ttAXnEKjCmmufFdkUEgCyRULjyvKY2h9/GLrZt6n+A8iZyYGqPzdeb9VyTObKdg/ypMj31s84QrbUMVo1A3s8Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7L8lrBzryASFCWquV/PleTU+0wDYrs6+zpGTsw8BPM=;
 b=o7WVfbduCeiD+xD+Vw1O0FWDRRbp1/au0+b3jPf2TzMgwKLQPKobiSSHqrujkGaf349rPfyd4lvyqnyOTztd3Qn/z6Rx3fvrvXUd7acYFbtFpVGqDq1noysfeh74LdzQMTpziaXKTaI9smiTG0trZL2A/iR5d7NCh8lkoDRqb6M=
Received: from MW4PR04CA0138.namprd04.prod.outlook.com (2603:10b6:303:84::23)
 by DS7PR12MB8251.namprd12.prod.outlook.com (2603:10b6:8:e3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.23; Thu, 24 Apr 2025 06:26:08 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:303:84:cafe::b0) by MW4PR04CA0138.outlook.office365.com
 (2603:10b6:303:84::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 24 Apr 2025 06:26:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 06:26:07 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 01:26:04 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Check for hsmp ACPI device
Date: Thu, 24 Apr 2025 06:25:44 +0000
Message-ID: <20250424062544.4122901-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|DS7PR12MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 5082e2fd-5b49-41b2-a1df-08dd82f8e60a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ld86cuKUh3jix5bN4AOMVsl/edCBbwnFCJhruwXDgFlcDThmoj/y1vlHahUr?=
 =?us-ascii?Q?U67IGHfz+Hxlu43fZeyUFj8wpJpdGuPQsebiehYV+QjiC4oGvirLwpI+PJJr?=
 =?us-ascii?Q?ncwBu7hIspMeCYGamoz9YfcWdIC5GGi+0tyFdZurp6SGM3oVJOs47jpPy0N2?=
 =?us-ascii?Q?AXNliUy6HHbH6j/m2xHlpIcENzggTzrKv4+Lrj081yiB9xpAeI0Gsf8jRksC?=
 =?us-ascii?Q?Ob0GamuZtQ9j/VBtCO6cR7N3YO/OAGsjw1ZWhTdSZorhUt/HW4EcRn6IcEQ4?=
 =?us-ascii?Q?/KTjTkTX51jU945ezBiAmyWwXRUVlTsMJr4ydpUpN935SBZG812jKzbGlELB?=
 =?us-ascii?Q?FBulYBLjVOY2DGrUqoTmPUAVbP0hTn8D+U9QLy/YGzGujZIBGpFPzPgrPVgU?=
 =?us-ascii?Q?TllAygYgsH+cxKZOJYNKSRwDxDzywERYIo1BWVjej6VKXziooCm5ZqiM4Mgn?=
 =?us-ascii?Q?ncEfL74Uc1moiBwNR8OVJ+KM3AWchLRA3YeaE3q6u/gW4ieSHPs87ND65Y62?=
 =?us-ascii?Q?ESkk5xsQ/jb/ZPFQrG0rlbr4zc1UqeeqyKCUtHEDU5yWXKj16Z0NSBFTO0Q3?=
 =?us-ascii?Q?mDwbHtTmMDbS7FKZO/JPwTnshO2YL0TBCfh/Y7cZCrEAk5dgV2S5MzRPekGG?=
 =?us-ascii?Q?MK4jEbwdNDNTODwqvoH4tpgWaOfHrltC8nZVBsCfkPOivlJtcMoUQ8VTLmnb?=
 =?us-ascii?Q?sTC//HHbq6FPzM0oGOVS1tG1kegsrA6xwhi08nQKq/jRb6DnLsd8CPrJKpbt?=
 =?us-ascii?Q?PQOt5a/2M2l6yZfm4pcc7S8o6H0NjdXmUDlao5oRnGHr4DQZy/lGintuSLDs?=
 =?us-ascii?Q?UKLpdlUuuu1dMVdwC8bBgWpFiJoGTqEhttcXi1ss/JmnQkZ35mQZMbDt7+aj?=
 =?us-ascii?Q?nS8pg/vHfAAtJ6+XRW4JKZWqHCikgymput7cP3xiHatqWIYRMzImwhODiy4t?=
 =?us-ascii?Q?heDxJQRvK6z7LZdNzVlly+kopLHdhYhOd24rNOaVRAw4ij3L/zGuyh8+F9HX?=
 =?us-ascii?Q?hTpA4Su0HCrzAgdgjCRbeONfeSm2zPvDiUv1GwH9JPXBhuvRdJbGxD1s/rhB?=
 =?us-ascii?Q?0/ajjheG3wzMbmI6mqa4FEB+p4QHzeZFi3rEUtxlMQ6l2rc4FVWSwoGIR9QC?=
 =?us-ascii?Q?HqG+sgmFh1QIlLXp94F5V5np/W50s4xHU6DEr88bkL33Y6zc4gtg11PAmyiz?=
 =?us-ascii?Q?A8nBob7Us/G1DrCTFgjMXFswzZqlr3GQKj1+ITlnKv5h+2URiTFCK7UQCJHp?=
 =?us-ascii?Q?TGtDuQuuefesUhtbEzlItG2jwx6QghdbqTn+SSsnIBFEZ0VdXqbyzfmIiLfb?=
 =?us-ascii?Q?tLtFAsZ7HOL5NzQ6RZAiERSf6nznNHSEpblRLfzgNwQzdYa/AZ1e8rQ+mCNj?=
 =?us-ascii?Q?KnVDdgTm0POG9a7pJOGYR6qIF+ECG3WEj+ZofJXmi4yVMvLYrBXSj562S1fg?=
 =?us-ascii?Q?7dz4eVMkWBsg/FWRHGSrEplkT3ejTmgo4zkhEypdEbrRIH8XRcFkeOuR983W?=
 =?us-ascii?Q?K9brLJ/jP6r3mTVDBYRD84PYHMjb9R1zhtY0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 06:26:07.8058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5082e2fd-5b49-41b2-a1df-08dd82f8e60a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8251

If the hsmp ACPI device entry exists, allow the hsmp_acpi driver to manage
the hsmp and return error from plat.c.

amd_hsmp and hsmp_acpi are intended to be mutually exclusive drivers and
this check for availability of hsmp ACPI device is necessary to ensure
this.

Also, support both platform device-based and ACPI-based probing for
family 0x1A models 0x00 to 0x0F, implement only ACPI-based probing
for family 0x1A, models 0x10 to 0x1F. Return false from
legacy_hsmp_support() for this platform.
This aligns with the condition check in is_f1a_m0h().

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
This patch should be rebased on below patch by Gregory Price.
https://lore.kernel.org/platform-driver-x86/60715d85-48b4-4066-8a9a-c8d2b62ebb45@redhat.com/T/#t

 drivers/platform/x86/amd/hsmp/acpi.c | 1 -
 drivers/platform/x86/amd/hsmp/hsmp.h | 1 +
 drivers/platform/x86/amd/hsmp/plat.c | 6 +++++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 088cb2416d7e..eaae044e4f82 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -29,7 +29,6 @@
 
 #define DRIVER_NAME		"hsmp_acpi"
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

