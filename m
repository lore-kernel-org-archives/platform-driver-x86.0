Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318611662F4
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911654; cv=fail; b=AVfPG07jUziN6p1EaULmyyFybHfI1dVXJHCM4Xx05Y3HAMjw1GtMdpzIwKTg8Y7rz1IvSR1vUvJ8eU2cgxwfowLn2w0rz0ynfpkWxLHiJ0kjH7MRd86pt+5hVXnksNe7JkIIagyqNpwWYj1jq0SemVClZzspgNXvzs8qkhaJn3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911654; c=relaxed/simple;
	bh=QRg/qz7/lP1Q6Vfl6yTiEYiD7QL7gF0FfXeLbk+FTxk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gKVsWPntWpQFizdLXuUADl54oA8ETHvd5d8BBB7HxmGrLHE39MtfZ/+GrQFCtIziUPq1hKiGC+TxI8/TaKUGIA8AozKlegOZUDXtExBMy9bcSyjsaDw2N7PxUFEHcFRQ4UJVjRrBvENUrFbUuUuyF8/YzrHbKcdTS3UC8ygm194=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Jkxo8hDI; arc=fail smtp.client-ip=40.107.93.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Jkxo8hDI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWrybykI6w2VVw/gx/pqrej1c/0DCr01ukiuo+U0oSozoeMix+nEleRcYt96UW1gtWnH2XBGaXS3wscQcMtiPkpCRXTLDbTnTl4VspS6UyYhHgtES/mXxghCt69JZ14QRds8QNvhkG6uvwZxAD2n19Su4Sx8MngGxUZ17HX/VKoDrMOSacMC0E/AuCy5ncOhuVvGJVgn7/S8grEgk0PJuBqWJPyqizgNDtEjV/D3LoXv4TwMZs1uciERsSvqz9CwAfc7pnsN/7qSTW503ss5dvN0ajIywpcvpspHCuKZ2Pk/u4HXmXlHIJSMK4gFVNxVTMP1j03btPadX3BsDnnBHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWK8/gO0YbhbDAqAbh4nASFg8v+pdwHL9kcFThGkZLo=;
 b=BTprIExZ+YS4mbtQdau8ZnIrN+VQreKRVoJUwC9kxaLp0AMSppY8z1yatM0S6JReAfFUYYQxRcuZEDu5Jdk2DJJgRt2mdnksEOYURY+/HjUeMcG2Mn0wOtrkYTZ8YOtfqxxdY7dbM78nU5ZnUTlUrnK7SBFwWyjBERpV8IzuR+zm0rHZn0dSdpzfoXGl1G2tdM0KcnCoE7R55Ayn5zYmMSmSbGOX5GpcEMG8voz7T6layA+Zj28DLdjWA3z4answrr+Hpsp6jSEhSRgxeJCHAHdWBz81u4+H/v9ci+oIDQP0rl1HSew7Tj/r1saF6ol4+C6NSR1I21wgi0l8MBQwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWK8/gO0YbhbDAqAbh4nASFg8v+pdwHL9kcFThGkZLo=;
 b=Jkxo8hDIsFv5avd5oBgvobd6rqeSJqdxxVKlVa3jDmjYzAuylQ2aNr6RKEypj/lfNup4V90MVqWNVBUvHlx4IOItxo90eAr7EXOnqj1jVFu0tdjqzDP/kZtZZLRdc7Ub8vPLznxBN+H1vidZGiNk6NMtFqy4BUBp+P3TeeZzMYk=
Received: from SJ0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:a03:39e::16)
 by MW4PR12MB7192.namprd12.prod.outlook.com (2603:10b6:303:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 06:07:30 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::15) by SJ0PR03CA0281.outlook.office365.com
 (2603:10b6:a03:39e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:30 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:27 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 04/10] platform/x86/amd/hsmp: Move structure and macros to header file
Date: Thu, 29 Aug 2024 06:06:11 +0000
Message-ID: <20240829060617.1548658-14-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|MW4PR12MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: b7074f21-93a4-40f3-c234-08dcc7f0dda0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1RWMm9jRi84ampkN3VuUElmRmdjaVJLMU5VWTV4N3A0cGNkODNVRDFOSnFL?=
 =?utf-8?B?TG5yMktoNzBNQVJBRjFIUXZkYVdpeVVSaGthY3lBbW5qNVBybUhvWHpjaDV0?=
 =?utf-8?B?dDZWSWkwS0FJc2xVNkZxWjlneXBia1lSNzkwOWpjZ0FTdnVySVRLRFdzVmtk?=
 =?utf-8?B?L2dpNlNnOTB0U0xzVmZEb3RhS29tRU1wK01DcjhHdTFpTzc4L2Jwajk0Y0or?=
 =?utf-8?B?WTNmeC9QczFlZHRUVHZmS3R1YkpXY0E4UDFrbFZyZFZqSEZsU0ZtN2lKZ2pC?=
 =?utf-8?B?aXVEdkFHQ0gxT0cveE1FS29zWjBoV3ZabkZlczdOY0tkMWRmM0RnUzFyQUJt?=
 =?utf-8?B?ck95RDQ0c2Y4M2doNzd6NFNqNkdwSlI2RTNpR0JZUjljYmo4N0wwQTRxWDc1?=
 =?utf-8?B?WFloTXYzL3ZvSE5oczNocng3VWhpTDZWN202RWNJcENZZXFnL3g1aXl5K083?=
 =?utf-8?B?WmtZbExmL2R1M3duZHd3R0duaG5vYWpHT0VHL0FnajJZTHJ5UUtwZEhqWFUz?=
 =?utf-8?B?R1NFeVJ1VjlDNmJ2WTF1QTlEb3V4SVZWNUlGRTJuU0JaRG5BOHRydytwZ3kw?=
 =?utf-8?B?ejZzWW1BNXZ4Q1FiZU85akpTaU1ZVExvdFZhRklMSHEyZ1doOHhzc25wSktB?=
 =?utf-8?B?V0FFK0M1K1FFSUNoYkVMUHJ5RkVwN2szOVg2Rm9wb1pJNzkwQ0NBSS83RTB4?=
 =?utf-8?B?UUpMazlKZ2J5b1Fnclp5QXp0c0RuM2lhbnBaUVAzZVlSUDZMeWkwa1IzNW1E?=
 =?utf-8?B?Nll4K3l5czduY1QwQXZ1U0ZVUFhnQk4xcE9mRW1EcU1QbENva3cydnQ0d1pG?=
 =?utf-8?B?ZDBVUXFkblRHc3BiQzFSWlpjQmIvK1hUYkIrUS9mdGV1ZTNjRFI2cnBiNGZv?=
 =?utf-8?B?d1NvRXo5MjdIc25mK3BqTXFKVUxZc1lacXZkamdaWkNGQ3NCTVhJNU1nMmZM?=
 =?utf-8?B?ZUZKa2laWmZNb2VMMHl1K0JEYVpucm1KelhPejdiYTRoUEJERUNyOGw0Vm5m?=
 =?utf-8?B?VVc0MzQyVis4aTJ4VEQwbjRYcGNqRENPbTBOc2Y0dHhrSkhTdlNuS1o1aDB6?=
 =?utf-8?B?djhyanZSVlhZUWNIVXlodHA3dndTTXNVSEdoOUpmMTRlZTI5dk5EYXY0dFVG?=
 =?utf-8?B?YzZMcnRIbFJUTUliM2g3eWFFamszTVVFVU55U05zdXB5RjNnZUlFdnN5Mno3?=
 =?utf-8?B?VFVUNGEwRFpYYnNoSHZQK0huaDBOcGduUncvOUZqRjNBeWRwUmlYSjRta3FG?=
 =?utf-8?B?Q0lHTDVtQVNTc2tqaUxmcWFxdXhBRlBEMTEwejVGeXdHTWNkL3c1Q0tibENa?=
 =?utf-8?B?RitsYzloaElZZ3NEdHFmZXU3UjZzL0pQTXFtK01yUWVLZ1ovYnpZai9wUnIv?=
 =?utf-8?B?RFczd0NOa1Zuc0kxUjV5ZmxVS0t1VUllTnNoVjlyc01rMHYyYXcvbWM1RnBK?=
 =?utf-8?B?TFQzVnpSYTZvRlQ4bXh4VW9nMUVvRS9VRkU4WGZzd1R6NXllMmVId1JWYUo5?=
 =?utf-8?B?czkzYXVLclNjalNPZjExVUxCV3BET3QrSXpsUkxtaEowZFJreGZkYTBuUXRv?=
 =?utf-8?B?UzB6MVQ0OHdLVkFuZUZidDZNeHRzalMrZ0Z3dTZsQTF1OEhSMENNb2ZJTlE5?=
 =?utf-8?B?Y3I4WUdkaGZFNXVTc0JwZlN2OHpzKzZCMGJFYjRTM005bG9xZ0FiNzVDL1ZW?=
 =?utf-8?B?aHhlNW5ETXh6Zlk5OWdscExZME1LV1ovRzdITU1xblBQaUVMUXNjVC9KZzBD?=
 =?utf-8?B?WXRrZk1nYld3akxXYTdEY1FxdytFMVRZTEloWlhvSmFPS1V2VVpaK1V2QnE5?=
 =?utf-8?B?QjA4dVNlZGhzclRsMU1paEpGUkFBVWRmMC9KN3o2MXVxQUZIbHdzRjVzaUc2?=
 =?utf-8?B?RVl4OWsvL0ozTkpxeHpCZkJ3RlZUQlV4WmdFTGVSQ05nOHFpU3FPMEtxV25u?=
 =?utf-8?Q?8uS0f8Mr/aPWZ1CYQYiS5IFb732qBvn5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:30.1333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7074f21-93a4-40f3-c234-08dcc7f0dda0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7192

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

