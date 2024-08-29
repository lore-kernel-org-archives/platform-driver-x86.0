Received: from outbound.mail.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E4413C8FF
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911639; cv=fail; b=ectKRmFlqTLqXvLruJ0h/rMwl05EbL0jYocsI2Vht9LdWHeztEB8c/tvRRBpCuTfYY4/CsTHqVskdNSKkU71n6pwdw9dqR7r4mLYA0OLHOUO5KB33WFIPrEtujH7snt1/2ce/7Nkj4FnCxzLsNIFBQxnKKBObpSwK47fQDwv6nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911639; c=relaxed/simple;
	bh=QRg/qz7/lP1Q6Vfl6yTiEYiD7QL7gF0FfXeLbk+FTxk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npG5vhIGSCVUHPtyY/VG5CSaUgK1a11TdKsF3h7dMw5n6LYOZ3Hopso1cW5rmdnbWnwvKpbg/T0EiLqbWo1HZWRtBrMOWWuhBmUqEIf95oRRU8xETEZ3H1hb3RwZGYOtM8QOoSy32ekuAADgajZoYuFmudT630cXnDeb7GGJFK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UneRYJWu; arc=fail smtp.client-ip=40.107.236.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UneRYJWu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0TuWbwefSniHwxvZDBBgFMYd98qRPwUlGy886F+O5GpEAg6lSc3UcEcZl0JYcQl0H/gJqE5Mk1UXMafS3z3iNXDerk3yRXZYbSHpvSVca8apufoQmwRksSUlE+MduNon+kP4pIJEqUTyZ7bjshG2bPttjAjvr5aIg7nARryj4wQVkywOlcmNtlQdpBbFJfxS2mpFbn8tK1MM4MYcqqvDrZiNEc86TJJILgmM7Zop0rC7EhNQOjezHtBGYoLGLC5wUkWWOXgzdt9ftGuT858XeYtKdKeO+2McFawZn9WwmcoIrcV9xzDmtcLJUhZgGEKb7C9a2PevSrVsqxqbueqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWK8/gO0YbhbDAqAbh4nASFg8v+pdwHL9kcFThGkZLo=;
 b=YXDtYYat2/ZYPCjZ19CcXIU6GXss5lYWF3716A0lUNxMW9ZjhnybG8lHaXsevZGiDog97QZDPsNrxjoKa42S5GcZJT3zZSBhQBpgYvVgDgBTTJsX1p1b2PdqtX4aXa464ZDlPNwOdt4XCoBqH8zTkfgxOBtAVmvXrTDE9VqfLgZ/QNun6DG18BpcH5zqh18BSvPvVbvZdeaPa0AbwG4rgiu/oY/2NABiqyUFVM0vU5XCZ3w2ayXOAIVnKS+Q+8wI+W56w2Lmaxi/TJAhGf9tK00QDFEo7LlPfjtsFHdXi86ts2p41trVMrrwYgST0gkJDjtKQltdCaWhSJJH4LZijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWK8/gO0YbhbDAqAbh4nASFg8v+pdwHL9kcFThGkZLo=;
 b=UneRYJWujJSxJPxVRnd2hVi3orQtx/0uTxtm07qlnv4E3MNJkhxDr8oVH/NhAitizJEa/ilpsQkMDz6c3s/bxd5smo+BT1ozizMErOMX16XdesQbYrQWkwuV+cz3fG9KjGI5/FQz0qai2QtFeVOeV2WlvrIeQgPKqJcKc4mETOw=
Received: from SJ0PR05CA0111.namprd05.prod.outlook.com (2603:10b6:a03:334::26)
 by PH7PR12MB7332.namprd12.prod.outlook.com (2603:10b6:510:20f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 06:07:13 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::1d) by SJ0PR05CA0111.outlook.office365.com
 (2603:10b6:a03:334::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.16 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:13 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:05 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 04/10] platform/x86/amd/hsmp: Move structure and macros to header file
Date: Thu, 29 Aug 2024 06:06:01 +0000
Message-ID: <20240829060617.1548658-4-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|PH7PR12MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: f4942def-de01-466d-2e4b-08dcc7f0d381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajdPd1JJTStHcXBrWlN1UFFWSVdZOVpHbVloZUVmOTV1U29rNWZyNFl5cnRj?=
 =?utf-8?B?Q0ozUDMvL0ErYlV5NHdBNk1xTDZMVjF0M1QyeDZJdXF0ZHJiUmxXY0xPQmVW?=
 =?utf-8?B?YzVkejc1SkMvWXczSk5yTUh6MTdMeXRJTWdCK0tHVFZWUUthOVVwVlZnZ2w3?=
 =?utf-8?B?S3dHNHovNVZma2x5Nzl4MEt1Y2pjM1RGdVgxcGhjVDMvRUh4cTkyd3crdFNU?=
 =?utf-8?B?VCsvRVI2TDFsQXpxamRja1pucllpaVk4aEZLKzFEQkhFODFZaHVqY0xDbVlZ?=
 =?utf-8?B?ZU1PTnpSQkFlSUJhQnlmbitNVHJ6aGVmdlJtOElnNm5pRnVKVHBHQjA5dzZM?=
 =?utf-8?B?WURLK0VVZHZxa1lCeStFbTBsMXNDZ1lyeDdrSHAvWFQ3d1VhcFoveWRyQmto?=
 =?utf-8?B?cGhjaGxWRzZWMWQ1Yko3aVJ5TktEcDY5RnNwcWU4Wk5VcXRuY1VqL29qWEZF?=
 =?utf-8?B?eWhmdzhYM3o0RDRQZ3BGM3N5QWRWRWowMUI2UkRHeUtQZGNCcTF2bVBpbDlI?=
 =?utf-8?B?d2hoMWdCaEg2T0R2MS9xbmlrUHRHNEZPQ0RjdnQzT2VjWnRrbHEvY3U5MmFr?=
 =?utf-8?B?ckJSdTBlZnRDSFFpZVYrVnVscUlXa29aOUFJbjdRa3V3RzhGOW1GRnd1N0xm?=
 =?utf-8?B?elMxSTJCTE9NS0xHdzFNcmJiR1M1T1hLR2NqNFZLcVlDdGxhZk9JTlBnYkFk?=
 =?utf-8?B?Y0x2SHMvd0VSRnhIeVI2cHRVUkFpODRxN2RKS1pybnMrWURKK1dzWEFROEgz?=
 =?utf-8?B?dm4yTHpmWk44dkhjZmphNHJqWGhZR0ZjQmphN1AyQit4ZFcySkdDM1BqSFE0?=
 =?utf-8?B?Y25CYzF2UGdodWtUNkZnR3h6dWdCZUVpVzNnS0Z2WUp5ZG1TNW8xa2hyanhS?=
 =?utf-8?B?MXJFdWdFZ1duejV3dVc4SXk3cHYzTXloT25Oa2QrVEttWTJlZDU3WEViUnJi?=
 =?utf-8?B?VkpyM2NMalcyUm5hbGZWN0JnT0xEMHFTS0dlcTVzVDZXejBpZ2NGWTNJZDRz?=
 =?utf-8?B?ak1peTM5WDJrc2l5WHVWUVJ3V3ZtcW9hMVMzTktMTG1UUC9BVlhzcG9kOUlY?=
 =?utf-8?B?MTltR3VEYzdDai85SkxFMWlXZ2tOY0t0OE9PeWgrU25MUW9oalNIeXkrZFdq?=
 =?utf-8?B?YThNSnJWd1VxRys4MHVGUDJlUmdKa3pvYVZHZWNxbm1ZRm9MaXduZ3F6cjJU?=
 =?utf-8?B?eG5tc2szbWozaFJQTXVjZDdISG1CZ3BxTVN3MFM5SjQxYVlNNlppK0ZGU1Qy?=
 =?utf-8?B?S1VyWkxYU1JQV3M2UUI0VmtDdVh4QzJxWVE3UGxFRm9hYS8yUmkvY2c4Q0FM?=
 =?utf-8?B?QlVIZDNPVUlRdzFnZk9qWEhZMzJ6U0psUFJwR3NjN2NQSFFIZTVHZkpUSDdX?=
 =?utf-8?B?WklqOEJjbzRzSVpVZWVER3FwWG5iY1RxRk4wbG8zWDk4WkZiTDZiUTdtNkpU?=
 =?utf-8?B?akhNcDRXSk15YUJNdUNZbDE2NnhoNFUrRXQ1akZMYkRlUEp4YWxSRU8wYVFl?=
 =?utf-8?B?dDN1NW54d2piYTJNUGIyZUYrTjBOSHg3UklncFA4emFIZThwQ1Rrd2hGc0F4?=
 =?utf-8?B?algwQzgvQzZ0VTNWNWdTaEZtcXRGazV2RzdzQldzVHdScktLYW5ZM1czbks2?=
 =?utf-8?B?NUFkbjA0QnRPaE5KRU55MHUyQ1VtSjhtTmVkVmJpUDRpR2txdFkvRHc2RURz?=
 =?utf-8?B?MXlrZlFaWmluNzYzaVFMWFQ4MlRvNXhIS01wbTZQeHRLTWo0ZnJtK2l1Y0Yw?=
 =?utf-8?B?Z2dmSDNyMy93YkM1RUEybUhndnZpa1c1TkEvUEdJM2pwZjVQMDhlRy9RR0t3?=
 =?utf-8?B?eWs2dEpPSUowYWFiMjRKcWN6VDNiWlp1THhmOVVHaEUvcys4dS8veHYrYmwz?=
 =?utf-8?B?M25YV3MyamwxNithSG10SUEvTWh6bzFrcGVSSUdyM1hJN0RRQ3JkRU8yMERC?=
 =?utf-8?Q?hI8blwcUagGvT+hygVNZvDctLzGJA5cI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:13.1804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4942def-de01-466d-2e4b-08dcc7f0d381
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7332

This is in preparation to splitting ACPI and platform device drivers.
No logical change, move common structures, macros to hsmp.h,
add missed header files, remove unwanted header inclusions,
and re-order the header file in hsmp.c file.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

