Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2068.outbound.protection.outlook.com [40.107.95.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EEE15382E
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 11:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727954147; cv=fail; b=USrFChrTQmePleJf4qlMBtveebd9Y5Tz+O1U77tINCyh24yochF+MVaXUVVZSj1a8ohkJKKkaLPoVTyUm6Ounun17Gd+nNE1I7GzZPM0N0aJQo9fsU2FiG2ijUvQF5V5E4rvytJ03MMBje/NDq2OOOt+rs5qcHOwwgBTBg5CA8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727954147; c=relaxed/simple;
	bh=WfJodWPJUA5aWEPTRj6HOQki60c60mVMpYzSk9DLMdQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6xlALajD+Pc0YzCymgt140N/jmJKXqV0lN9Xx1L4aB+h6Qp7gvbMU6/f8kbC/kB/stC7sPVr0uLmiIsf63xO4zHGtXLpg3i6OGq1SUWld2ap2+OFNRBrUV/4QauK+cC4kKUkYw4gedIsB/KBWgwKUQlnWbGBogFqaLSShg0TgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=clIdKkPB; arc=fail smtp.client-ip=40.107.95.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="clIdKkPB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNZyDrXD8QzM9MxwvBwXAlGuYJibnFOacXY7KdF55yrfNfRVK3uSP1/vg/i0wEDrM6592wKBtEXeQKiYP64gSbgk1ZPSfCgGVySLf/kk2SjPBuWQw/Rw/F9YIoL+EPlNGr1+WIDuuPxhTExVCGlfj0d/iJmTwPl/1XX4gmRAbaOfwWJzdiznCZ6FHVXV180QXJ9oqChuOn5pqPckZ/fwX8xha1UKECJa8oUnhPyJStOQrUQFAEONbuaS71tIG2VYrWFKiG5pm+hHTL8h3pVsvINHPGkpL0NHc8AxYxDtAX7Fp0s8IU6jETMPArS1imlGwpjaNgD1tN8+Gx8Aa/wU3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7qRF7sKwCsfAerdA1aPBSzmlYbD6cCyOALMvqjHT+A=;
 b=hL/B7o11eJ2MLwk28DelEiEeL3XJRz/BGTO+6mt0QcSIjWYPm+oeVLISG0Md79Gh07U8VnFptfshaLriIow5w2WGgrYZr/hppW14ia8+eNlUJF2z7rtE10i31Hn8ul4zX6HPPeJgUhjNhArGXhkp0ZeWpAyLCNXPZ0JkMH9uOzo6oZn8rVnzs8YyYzVj3PQ/qY09NX2QYZK0WTnI0SIOB1VO5MsWBrdv4umY2LhHYX1eHS7Je7Rr2de3mcaZJW9Omybju0uie8ftpAvokHcAZ8XNWaET5ZuZK0U0Fuqrm1EXxsOqKC8GYJ1NoRpTrXWdI6imlUMVT33hxubOlnCFQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7qRF7sKwCsfAerdA1aPBSzmlYbD6cCyOALMvqjHT+A=;
 b=clIdKkPBGTP5OdKOJopj5gzbr5wD+IwzgGhQW27Ea4hBrdzu/Lhm8lU1WMvlqRMqLFG+BzE6nMy2pr0w8p5TYqAn1Gaz1dg/bjGfw20aYFulV8lTQlnXyxCiXME5cbNsmIPJsDItDCGWKIXDbyXuRyR9q5hVJs7FLFXSXWLOGqM=
Received: from CH2PR20CA0017.namprd20.prod.outlook.com (2603:10b6:610:58::27)
 by SA1PR12MB9246.namprd12.prod.outlook.com (2603:10b6:806:3ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 11:15:42 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::58) by CH2PR20CA0017.outlook.office365.com
 (2603:10b6:610:58::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 11:15:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 11:15:41 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 06:15:39 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v9 04/11] platform/x86/amd/hsmp: Move structure and macros to header file
Date: Thu, 3 Oct 2024 11:15:08 +0000
Message-ID: <20241003111515.2955700-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241003111515.2955700-1-suma.hegde@amd.com>
References: <20241003111515.2955700-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|SA1PR12MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5572a8-dd31-45cb-f388-08dce39cb7d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVBiNzZsSUlHdzIxdVRrTjh4UWdIeERqVVQxdnU1UUQzbzhiSUh0TmhwVTVw?=
 =?utf-8?B?U0tkdjZzd2JjUHdOR2I1S0RxYmxnczQrY3ZTdlY1UWE1T2hqeG5HWnFVN2or?=
 =?utf-8?B?eHZ0YmFtUHI4bldFcjQyYjc4SjJBZ2g4WUZJZUV1Tm5JQ1ZnZVVvYkJmMkpM?=
 =?utf-8?B?WFBJUlJ1d0lUaURaSy9aU2FUY2p6b1pvazlEM01Nd25GM2d1QUFkakw1SjJY?=
 =?utf-8?B?d284ZmJNTzMxSE5wRFdnR25KMzArTlFBeTlQSFV1bVR0VVlKVXI3Z3ViWmtG?=
 =?utf-8?B?ajhtZml4NmxIcmM5RUQvbHlUbVBucEc2RWdSWWJzQVU0TFdDd1Z5TnVWMzBX?=
 =?utf-8?B?OU5Id1luUnpXTTE5amx4R0tUdlgyNTZnMzRCclp0a2xqeHFEOUxCWFNBQmdV?=
 =?utf-8?B?c2hDTXFYYW1Tc1pZS1FMQ21iR2E0UHM2bGJ0ZTF2OHJrZGJweWlUZzQ3Y0VC?=
 =?utf-8?B?SG4wSlc1bWJnZWtScVFGUldwWWVvOS9xcmh6TkQ1aW9yWi9vZnJKQTAxZ0sy?=
 =?utf-8?B?WmhJRGJNM0RBemRsSkxNZS9FQk1rTHlLUWhnVFArY1diNG9RSm5DTnZzYks2?=
 =?utf-8?B?cTVVaStGaGFWSjdwQysvL1Mwc01QSmphenVpL2k5ckxxczJjbUg5ZTRCTHRa?=
 =?utf-8?B?akgzbldBYzJRSVAvZkQvUmJDbUswdlJRdHhKbHFJNFBLeGJkcmNZaER1YW56?=
 =?utf-8?B?ZUFIZ1FIYUxYckZ2NllsV2c0aytzUG0vYU1DaWZOQjdOMUxIVGJDemVlNTdY?=
 =?utf-8?B?NGNKOVJEaVdoUGVTV1NYMS9yY3Y3VkFwNE5zTFA3aUQxamJiR3RiRnVtWVNh?=
 =?utf-8?B?V3lXQksreEhSQ2ZJWGpiVG4zYzJWWkVPL1krOTBiZ3c0eVFVZ3UvMlgzQWdT?=
 =?utf-8?B?NTQzRGFKZllXZ01rK1hGc04rS3gyU1RhcWh2bTRUZ1pnVkpmN3Mwc3JxTlhs?=
 =?utf-8?B?WnlKOHlPVW1xZ01jOFBMdXJFUjQrQk1BSFZUdkZYbDRZTy9xbEthU0lhWDlm?=
 =?utf-8?B?UkV5cjY1SS9TT09PZWxncytTMllPYmo3anpuZTZXUE5PVlFSV0xheStJSWtQ?=
 =?utf-8?B?bk5ENmZUK3NKdno0SXpqdHRUYU91S0htRHVEZGdiSkR1cEJIa1JSblk5NFgy?=
 =?utf-8?B?UExKa214RzRLS0pabE9ZdjJlTUJ5cE1NdUVLdEQ2SkpOdEh4a0MxR2pNS0Nr?=
 =?utf-8?B?cUJRWVFvdEpUbnc4WmJzRlJhZVVOalluK3IyMGVjT0V2bWhoQkxYUkNwQlY5?=
 =?utf-8?B?N3BRYk5GWmduRjdTTndoTkNVOXBXQ1FGWThZZUtBSVJ5MTJYZEpHdkEyU0pR?=
 =?utf-8?B?eXNRY1BmNFJsTlk4Rk80VkhndlI3TmtJQ2Z6K2hJeWlFOWcxcU9yT3ZZNWsw?=
 =?utf-8?B?c0lOOXd2aUlBL2VTSWk5V2xFdlFvZFBmSDdlQTN1REJPUGhYc05BbVVQaUo5?=
 =?utf-8?B?Y3ZVVlFsUVFEZDZvNFREbnJ3ZUdEc2lqSHhjbzhqcng0eTJod280Y2NEOW91?=
 =?utf-8?B?aGc1U0FOcnIzNHNrZ283QVFQQ3BZcDY1dkE0UCtFMGU0Y0RIUjJSWXpFTnVL?=
 =?utf-8?B?TGR6UjJZcC9OOFE4V3ovbDlOeG1mZGg3WElNMXFNNXp2eXpadkhDbk9XZFk2?=
 =?utf-8?B?TzFna3ZWOVkrQm9VWFpNYUVSOEZMRmNwdjJuZGNmOTZTc1Z6cnJCWkdKQmh4?=
 =?utf-8?B?MUtsQjgxanBjN3liYXJXZDhLNVE3NEJtL1kxWmtNbitKNmxoU3ZxdGJOa1hQ?=
 =?utf-8?B?NFVRaGx3dlVJdE1hcUhLeWoyZnFnbGhuc3p2NDVZSGJzQ2Vvc3VPU01qTUFZ?=
 =?utf-8?B?STdIa1FRRU10dTNlMlRNbUpBbUM4ek8xMlBPbjJZaXNPb080Q2ExRHQ5V1o0?=
 =?utf-8?Q?WSKSa2GJ0uD5R?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 11:15:41.7460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5572a8-dd31-45cb-f388-08dce39cb7d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9246

This is in preparation to splitting ACPI and platform device drivers.
No logical change, move common structures, macros to hsmp.h,
add missed header files, remove unwanted header inclusions,
and re-order the header file in hsmp.c file.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

