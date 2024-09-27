Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F62118BB9E
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Sep 2024 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438409; cv=fail; b=FWcMfBjcree8JQqP5ySDh/OBwN/m9tNA9/f5pjvsIk6qkQ6qZ2VguSxhGe0f5mqDt7X1h/Shv4lMwRwi77jQN9ZoqsBu0IyvGYT72qqtwV4gIFLQwreNlwhWX13UJCHVREWNrPeLOhaA0A8cyX/aVNokC1tHQ7x+XQIqWVqK2g4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438409; c=relaxed/simple;
	bh=KdN/1WXsgo3Ad098n9kkTJSit8gIabTugQwWQbufJ/I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VHIowfwGnkMOcp1jE5I8u2KX5ghWeaVVuMwMZFra2mk66eCYYpZ/snHM7BxTXCxvLkFFG/HoP5+JcNZTGjjzdqCHwLM7OmYLrrrhZ4vlqEGdcbiJlRj6S//d2FwbSfuJ2PfPRoMl0BF+B8gvhnDw5dOdxMCVyYov1p91lUCCDBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Rlu6S8Qv; arc=fail smtp.client-ip=40.107.237.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Rlu6S8Qv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1nUgb2EFznoQSR3ntpPj4lfzGE0tb9QIsGN7N8WrF6pauZngHmIz/ZzKA1wpDHKV/fZ92vPPPzhLGl5MY+V4S+ikygvCzeUlCmH+zzzl1fpQJNYb5dkD0TfKcWINRLQC030nbL2Bt7AkjcbnYklwczT4ZfVja3sc2zocYY1YH1C0CQZI7ZL4A1OTaEtJDCWFbpB7r5B5t55kAqWAsWoxHyGieFW5PI7+Hnc/2foI9bUEKonIDDuEja+p89Z6eVo2VbWiqcHG5m7R0JeT0OG7zUkQeYg2FpP43veyYztbfZjcrvAhOlqNguUuPjeQyH6nb1WJihCigJKlmP9N3gSYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHgx1vVdjCRlbYqHu8fUu7/dw7rAXYt55lzQC5AQFcw=;
 b=rT1YgSPbVAerE0/wva6+M0qYdLQzFQ4nG0o43EQfjJ3YnO79H5TPuZb7wizHpHVrwPxSbYkf8jV1SlwG4aYO2oc2eb9k0Cm0ueoxSXkZA2VpPufiOP2K6XZl4vH76ofiWK8Y4+qU3SBvRJ9NpItlhb6m1c/dOxzJNLhRp+SAeQ4LosMHfNBGaeAsO77v3xPUF1/sd/NxjfspzfAizrSqqk3pRn0y0pw5lkP38Pqp+JRPypUyw7xcFwdwIe/AfDTYAWA87FuCDep/8J/kJSVJbQECBy8uqSIBwMEy6c92brYTkJMS4KPXz7fNgLsmFQO4Wv52fNsdRJRWYLy/cMMwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHgx1vVdjCRlbYqHu8fUu7/dw7rAXYt55lzQC5AQFcw=;
 b=Rlu6S8QvVkXboySk4KRFvFG6aibNN9B7V/5mrelt7+OeWXgP9UdDBj/qVoVqOVdgQC7UM9utQdOpFGEZFE5EYqN0Vu4ZNdUEqLyhRMzqMmA125Fk/pzSYpJnol5HkkazEclIubTZuc4SJLR6XaYhBQgqXJGSrCxe6ma5Icira44=
Received: from SN7P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::10)
 by SJ0PR12MB7068.namprd12.prod.outlook.com (2603:10b6:a03:4ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Fri, 27 Sep
 2024 12:00:04 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:123:cafe::57) by SN7P220CA0005.outlook.office365.com
 (2603:10b6:806:123::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22 via Frontend
 Transport; Fri, 27 Sep 2024 12:00:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 12:00:04 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 07:00:00 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v8 04/11] platform/x86/amd/hsmp: Move structure and macros to header file
Date: Fri, 27 Sep 2024 11:59:14 +0000
Message-ID: <20240927115921.10909-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927115921.10909-1-suma.hegde@amd.com>
References: <20240927115921.10909-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|SJ0PR12MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: 4578ddd6-a3da-418e-7484-08dcdeebec73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDhZWmkzckdJd3ZYdXBUaDlwNkFxUTBBMXFtS0pGMExQcVJUcW1tbVdTTTRH?=
 =?utf-8?B?ekJlTEh5Z2tEeHR0SzVQNlRHTUJlZGlLcE1FWjJ6YVBPUDQrZmhjZUo3SFVo?=
 =?utf-8?B?bDhHMWhhZjVwQWUvRlpQK2dxeDJ0OS9HQUIxRHdQdVF4OW1HZVVGVzV5WThN?=
 =?utf-8?B?ekQ0dzdGcjFubFIyZGtrSnlhNXNKbGRKYjh5d3VPaUlYUnhKWFlHT3RmV2ha?=
 =?utf-8?B?bkdMU1VXQ1RmZFJFMC9jcEh1THNtc1VRQkE0SFBYTldHc1A1WkFHVTYyTkVR?=
 =?utf-8?B?MzVmSVZCK05pc0xydkI2dzlaUEJFOGFYaFVOM1ZNQmxQTUpEdGhrYzN1bzdV?=
 =?utf-8?B?MHo0RGtkWlIyZDNnOHFqSmJ0RjkyMVNacVdSQnF2ci8wVy84NTM0ODYyenlS?=
 =?utf-8?B?WTVDWlFmdlUvNzNYZW0vdlZCNHE2Unl0UC9aVDJGV1lXdUVHRXQyd0prUkNl?=
 =?utf-8?B?TWJnTFI3RFo5OERKakZEaHZkOFRDQzlFM0NkTGM2SXVUT0VGQk5jUEhCeGxr?=
 =?utf-8?B?VGVqVE01Q1B6ai8rNEJpQjJxWXY0R05BT0ZmVHpsYTdlcXA4elM0cUYwS05N?=
 =?utf-8?B?RFBMVkVTL3JuVW9ZY1NKWWk4RnZCTkd1aHRqMG1oUkw0SWFNckhqdjNMc2Vw?=
 =?utf-8?B?ZWJodndjNlhkRStPOERaa1lzM1RZV1hzNG9pbm41cjlCSEV6VVFsWEpSZE9V?=
 =?utf-8?B?TkpJaExMQ0g3RzZsc28xMG9keXZ2NEExbU5RNFhXcm5iQnllcEdxSVgwNkRx?=
 =?utf-8?B?U0dvcTlRaFlSVCtYeTEvSlliTVlKSVNaYmZJdWxHVm1ySUw5VUNTKzJyWU1Y?=
 =?utf-8?B?MXhQWktRQzNHUG5JOC9KZHNLVTBpVjZlZHZobnJuVDQzOHZEQmRxbzAySDky?=
 =?utf-8?B?N0xsS3czbFNxdEpaK056ajgrNm1zbEVYeG1mYlY4ejlreUtvV0RsN04vWnEz?=
 =?utf-8?B?V1hrMUk4Z2RjV1hiOWUyOFdyRnRyTi8xRlBwV3FPc3Z5ZzNsekxSbUVKOFFl?=
 =?utf-8?B?TUpRelhCaVYrNklXWXh4OUovZUpIa3VjL20wMi9qYmFMNG9PNWxuNUo1eTJL?=
 =?utf-8?B?RnNDQU5zaHFmdElmTmdxR2ZIM211ZXhOcnJud3NmUEpGbGsySVQxb0tvRkhE?=
 =?utf-8?B?aWh1U1RiL21rOXpjb04zVEdOUHZqVjNTcGJBbGRjajlLelZIOGp0dzhwclhT?=
 =?utf-8?B?dkp6cisvWGZmME1XOVRJOFMrMHYzU2dSNCtINVFhVHhhejdPZWxEL0hSb1Nm?=
 =?utf-8?B?NVdIZnJ0UkhKTnpzVldyL1VLdkxaUWgxT1c0akdwV0xmYlNDQ3NnQ3FrclQ2?=
 =?utf-8?B?RUxJTXdldi9mME8xcTh4aFNqMHZlNjlFd1JWS3ZxTTMrQU4zR2pINWVIZFlr?=
 =?utf-8?B?WW1VSG9PNCtHNitxNm9DanBQYTk5UFNoMmxndy9UaXBVU2ZnYTJIczVRa1Jy?=
 =?utf-8?B?ak5Rb3pZS05wOWdmMVpkZDVKSS9tblhxMzRqMWNUTUQvYXpEMWtIVEx3WUpj?=
 =?utf-8?B?dnlWWFJabmF3SDgvQlBaRFB5YXl5aUwrUGVYUTNSNi9MblhPUC9mTjM0SHBZ?=
 =?utf-8?B?U3p3MW9sOW1VZmxNSGxzdmU4YlA0eHVhN0RJUUVFeHFmTkJDOUtCUFhpa0VW?=
 =?utf-8?B?VmVnNkpjMTZJWE1weENMWEZvNnFUd29GV2RnenNYZXh4RTFKTUl6cXpDVjhM?=
 =?utf-8?B?U1FBc3pjUXNLNThaRVJJc0w3UVhSV3JTdTgxeUJUZVdocmVsejlQZjF1M3Mr?=
 =?utf-8?B?eDdKQ2oyRlE4TWZMSGtRNXIvdlZmMW9BTVYxWHhIRkZUZEp3bEp0d2p4cEd0?=
 =?utf-8?B?aWFKNk50KzJEZUgxWkxGbHJCODNZVEpqV3JVZ0p2VUxUbG9QQjczYjdocjI0?=
 =?utf-8?B?ME9xd1ZkcmRRYThNSUp4N1RycGc4Sm1mcWRzZmFqY3BGb2Zvd21OL0xPSHd1?=
 =?utf-8?Q?St090OpCMCMfGnaSAV3yE0cBteEGWtei?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 12:00:04.4500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4578ddd6-a3da-418e-7484-08dcdeebec73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7068

This is in preparation to splitting ACPI and platform device drivers.
No logical change, move common structures, macros to hsmp.h,
add missed header files, remove unwanted header inclusions,
and re-order the header file in hsmp.c file.

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
1. linux/sysfs.h, linux/device.h are included newly in hsmp.c file.
2. Header file inclusion order is changed in hsmp.c.
3. linux/compiler_types.h, linux/sysfs.h are newly included in hsmp.h.
4. io.h and device.h removed from hsmp.h.
5. commit description is changed to reflect the new changes.

Changes since v2:
None

Changes since v1:
1. Correct typo mistake in commit message
2. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"
3. Arrange header files in alphabetical order for hsmp.h


 drivers/platform/x86/amd/hsmp/hsmp.c | 47 +++-------------------
 drivers/platform/x86/amd/hsmp/hsmp.h | 58 ++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 41 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 6d0c58c6a82f..9ed1fc0aeb00 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -11,14 +11,17 @@
 
 #include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
+
+#include <linux/acpi.h>
 #include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/miscdevice.h>
+#include <linux/device.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/semaphore.h>
-#include <linux/acpi.h>
+#include <linux/sysfs.h>
+
+#include "hsmp.h"
 
 #define DRIVER_NAME		"amd_hsmp"
 #define DRIVER_VERSION		"2.2"
@@ -51,49 +54,11 @@
 #define HSMP_INDEX_REG		0xc4
 #define HSMP_DATA_REG		0xc8
 
-#define HSMP_CDEV_NAME		"hsmp_cdev"
-#define HSMP_DEVNODE_NAME	"hsmp"
-#define HSMP_METRICS_TABLE_NAME	"metrics_bin"
-
-#define HSMP_ATTR_GRP_NAME_SIZE	10
-
 /* These are the strings specified in ACPI table */
 #define MSG_IDOFF_STR		"MsgIdOffset"
 #define MSG_ARGOFF_STR		"MsgArgOffset"
 #define MSG_RESPOFF_STR		"MsgRspOffset"
 
-#define MAX_AMD_SOCKETS 8
-
-struct hsmp_mbaddr_info {
-	u32 base_addr;
-	u32 msg_id_off;
-	u32 msg_resp_off;
-	u32 msg_arg_off;
-	u32 size;
-};
-
-struct hsmp_socket {
-	struct bin_attribute hsmp_attr;
-	struct hsmp_mbaddr_info mbinfo;
-	void __iomem *metric_tbl_addr;
-	void __iomem *virt_base_addr;
-	struct semaphore hsmp_sem;
-	char name[HSMP_ATTR_GRP_NAME_SIZE];
-	struct pci_dev *root;
-	struct device *dev;
-	u16 sock_ind;
-	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
-};
-
-struct hsmp_plat_device {
-	struct miscdevice hsmp_device;
-	struct hsmp_socket *sock;
-	u32 proto_ver;
-	u16 num_sockets;
-	bool is_acpi_device;
-	bool is_probed;
-};
-
 static struct hsmp_plat_device plat_dev;
 
 static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
new file mode 100644
index 000000000000..d54b9681d514
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * Header file for HSMP driver
+ */
+
+#ifndef HSMP_H
+#define HSMP_H
+
+#include <linux/compiler_types.h>
+#include <linux/device.h>
+#include <linux/miscdevice.h>
+#include <linux/pci.h>
+#include <linux/semaphore.h>
+#include <linux/sysfs.h>
+
+#define HSMP_METRICS_TABLE_NAME	"metrics_bin"
+
+#define HSMP_ATTR_GRP_NAME_SIZE	10
+
+#define MAX_AMD_SOCKETS 8
+
+#define HSMP_CDEV_NAME		"hsmp_cdev"
+#define HSMP_DEVNODE_NAME	"hsmp"
+
+struct hsmp_mbaddr_info {
+	u32 base_addr;
+	u32 msg_id_off;
+	u32 msg_resp_off;
+	u32 msg_arg_off;
+	u32 size;
+};
+
+struct hsmp_socket {
+	struct bin_attribute hsmp_attr;
+	struct hsmp_mbaddr_info mbinfo;
+	void __iomem *metric_tbl_addr;
+	void __iomem *virt_base_addr;
+	struct semaphore hsmp_sem;
+	char name[HSMP_ATTR_GRP_NAME_SIZE];
+	struct pci_dev *root;
+	struct device *dev;
+	u16 sock_ind;
+	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
+};
+
+struct hsmp_plat_device {
+	struct miscdevice hsmp_device;
+	struct hsmp_socket *sock;
+	u32 proto_ver;
+	u16 num_sockets;
+	bool is_acpi_device;
+	bool is_probed;
+};
+#endif /* HSMP_H */
-- 
2.25.1

