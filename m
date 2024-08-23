Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB3813C9B3
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 07:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399776; cv=fail; b=Y2D0Rtc+CmF8mlNmN2HwNJLzm2+xxEpNBCpw1x4FThGGOMDbiSx1YWTxsYtKd7TOeKOANdVXVQA9JOLHiQodiX5zvQTVc0/MJI8zkmCxTrFCQUM2XExJFRFW6c3M/avRvVHVgTSgn+OEvccFoL1I2wxT9PKONRPkdlgtDjA9DKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399776; c=relaxed/simple;
	bh=wfHJZ3Ghea2SOqAxUwocbf3NHTKlNmTpOTiq7JKWFVk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hi3ZRZrWF0Uf/IN3CVDdqnRzKFXlfdbn2qC0IngQgnG7xeyX44AhSlHO3E9ltn5u/f5taVWX3jThC9mgHyj7tUMPfHNvi0ZPxQ+RtiUDW0YI2ugn/xMTWoOrMFaRPMGD/AewRbid4pESWC+yO5tmwn175LryBxIJRv/FWjR+W4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IPnul39N; arc=fail smtp.client-ip=40.107.94.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IPnul39N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMhvc3PyqEokpWwbm5N69ToaVD4+kTrfCGPVAHHdADT1l1shRIRLlEY+IWw8KSI2o9wcPNyEfAmJsZUPocbgPRgv9A2yWEA6mjvC/KK3xznTNuzv/QhGELZMhFg83RZPjcYKTYphtwVEUwDpHM0euQneAVJ942PYFzkaawdfTfKxe00P8vcl/7Wg7+iXKCoDIxRODE4Di6+xIFeHS7RBdyEGWh4nYYk2hbp0/4FgesBW+/qgRNfQ/P6GV9NYlEE5i/Bwz8v4ZxmgTsj3ZdPIaXpwf1oFc39DzwWslQxnqLmnDlYF2eSXia+fXu6jfXgooSnyF/YVbZ0P6IDEmtuNtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTL3M5VA67a/NtxJTfY9/+5Zy/oMWAybg788/phPags=;
 b=R9MCSW2sm8h9bSIG7I0Y4LFEaKLGspIIbcalJNvQ3yjBPGyb/wuni8mHOFR5Z3qlXWYaTOWL3StWbnw+Q3EdNjHum8j7vp/Y7tiOtWclD/b56kD9Yy7KBAGCQfehO4JjvazDqPTJE4jjZTLxDfAmiN64QCHqSkGKv+Q3QiArPU1otjlVjAro9qvkEp6uQqjcj9J9R7h6upzC4rVdKkDtt/2uQvVPXq++9igEXFVQoMA4iedNQF/p2/h2jJLVOwAnhz1EvVhjWn4mAvLm4v4UJBao8i0fL6XVBVzk10EoAdGmJu/g3cv+EPfPjwR4qiY55T/z4H7HkKbBED8Qie3bQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTL3M5VA67a/NtxJTfY9/+5Zy/oMWAybg788/phPags=;
 b=IPnul39NeEE+aEcn+J81J9C8iR/T+Jvs9DH0PiUnpV0IV7UHvLRltv8GUa/xQC823RXTOiUYgEI8SyEsx3/t0jJNPqeg4nAMhXT2FJip0YxPXFUbOTU+XMNqJgu3+T1JDI3ByDIcRGntOq4PNR39FlqWyGDoRCYAJgNZL8VdgYw=
Received: from SN6PR2101CA0027.namprd21.prod.outlook.com
 (2603:10b6:805:106::37) by SJ2PR12MB7918.namprd12.prod.outlook.com
 (2603:10b6:a03:4cc::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:56:11 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::2a) by SN6PR2101CA0027.outlook.office365.com
 (2603:10b6:805:106::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Fri, 23 Aug 2024 07:56:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 07:56:11 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 02:56:07 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v5 04/11] platform/x86/amd/hsmp: Move structure and macros to header file
Date: Fri, 23 Aug 2024 07:55:36 +0000
Message-ID: <20240823075543.884265-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823075543.884265-1-suma.hegde@amd.com>
References: <20240823075543.884265-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|SJ2PR12MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: a7352fb2-8071-4b1c-d131-08dcc3490e13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHlGZGRUbGFJM0Zsb2lERFVaRi9OaitBYi9VaHhNZUV0dDlIZ2VQOElQVENI?=
 =?utf-8?B?N3FLRmk4R3hGUmUvcG9vLzdtTEo2MFo5TCszT2NodG1lZzhzNEJHekdoWnRM?=
 =?utf-8?B?Szl0T08rRkEvUXZGaURJYWRSWTd2YnFEN1o1UHhtYUxHa3UxcjNHNnE0OUN2?=
 =?utf-8?B?SS9wQUVycklJaGlWUGZFd283K0l3KzUzY2NGdXFmK2tmOWdNZHVGWnRtYXJv?=
 =?utf-8?B?UGxIdHdPYVM2WlJ2WlNpOVpZejJ4dGJzOGp1bVl1M1JUUlByc3FRbFBZSUg5?=
 =?utf-8?B?VzF3OVdlaWtRM0Y5UzJIbmxYbzNqV3ZUeExqSEtsYm02SlBSSWNaSHdJV1dV?=
 =?utf-8?B?VCsraFY0YUhRdm5Qei9DNE5uV3Z6d1k0ekRkMjhOOGhqdHJob244MDBtVW9M?=
 =?utf-8?B?TmpZMVJZbVhRT1J6T1k2MzdsQkdnRDhTajBLem9vWjl5YXZsQ0tKVzhjRElv?=
 =?utf-8?B?Z0xWdGc4c1JlLzZxWTd1dTllZGdxaURRd3Bud2xWeGh1dDhQWGNBOU9pMkcw?=
 =?utf-8?B?UGRlMnd0OWlRY3A2a3BBblVVbmk5eStUYVJMSkRPQm42V1R2WS84cTZ1S3Z2?=
 =?utf-8?B?ck9HUEhPc1VhMVNzUysxUjFobVQ0SlpUUXBqNFJvODV2bnhDN2p6NE9FaCtG?=
 =?utf-8?B?SDAwN0V1aVUybmM1TU9nSTFnSkk3NzVPSFZiWFRLTG5LTW9LR1pVejZSK2hX?=
 =?utf-8?B?MVZFQjdNMzd4U3ZGTVZENVFVWWlUMDRiSHdQVFYzRVNqY1dTVWZvczBrdnFK?=
 =?utf-8?B?Sm8wZmthTlBlTHB6YWVrNzNOUUZqV3ltUnU3YXdaSFpjQjhYNjdDalRTbWJV?=
 =?utf-8?B?YUhCTllPT3A2YmVMcEcxTVNWcCs3S2ZkdXJBZlFwRy9SRncycHEwU01xeG9C?=
 =?utf-8?B?eEtsQWxEZFZqZGxkU1ZUbmRFU1Y1OFdza0ZBOFZJS1YzNjY3ZndUYlJWbU96?=
 =?utf-8?B?L25odmpjR21oM0pVWTRodVdLL0cvNy80WW1FeEFFUGFTMURLWldiU1JOd3hS?=
 =?utf-8?B?Z2RzMk9EWGJvaXVUbE1qbmRSbk5XV1F5SnlCYm1lbEpqc0t4R21RNkVBaHpY?=
 =?utf-8?B?WStqdDV5OFYzeDNHZk5haWw2UWVzdzExRzRFZmdVREpLNXNFL0oycndLUDhw?=
 =?utf-8?B?RUZuN0o4cFJLWEVyOFJCOGp4dUNtc0NPOWNISzBoK2FWUm9udmZ4aStVMDVG?=
 =?utf-8?B?dW5XZ2RMREtIMTQwTTZlZkZvdEF1RjdUTTkxNjgyUG04K0pDZEdiWm91Wnpv?=
 =?utf-8?B?WUhPMHV0Zkp2dG9HR0FNMmtsQU94MnZDOXAycml4RzlyS212bXFKaUIyV2k4?=
 =?utf-8?B?eDZTMnhQczFlL042Rys1bXk5RE9UTGFTRkhoMnJGcjVDcTJsMnlDczVxZE1l?=
 =?utf-8?B?KzN1N2lhZ1dpSVJXeTdzMEV2VkhjOENuTUpuRXM5ZmlQSW1tb2hpTDFycHZF?=
 =?utf-8?B?YVFMeXpwYVBneGVNbndhbFRvRm0yZzdJNE0yRmVWd0R2MlcyYWtCa0hidUJl?=
 =?utf-8?B?MnlrcHB4ZFNGR214Tk9QM0lyaTF4eGRkaXREakw5TllPdEJtazZnZ1p0eUV4?=
 =?utf-8?B?RE96R2hKUkxOYkltVGtkOHhOTE1iS0dLS0tJdHN2eEpabUppN3RzcVhiY0ho?=
 =?utf-8?B?Q3p3UFlWU3gxSGJBUDA5MmRLUHlvQ3N6T3dPZTZHVjZMQmtFUzJ4b0M4YmVG?=
 =?utf-8?B?cW0yenpTd0VJVm8rVXY4Vnp0Uy9yVGJsTTR0MmduejJHcFFJcTNaNG1za1JP?=
 =?utf-8?B?b2VhUXB5TXV4dTZHaHFFTlFuZGdhVFJuMzNsZHpPSmZLT2I1K0Y1SFFHalht?=
 =?utf-8?B?Uk9NYnNFVGZ2RGI3WVYvOVdudGkzM0o4anNpR3NIRmVKbUdlZnZoQTVLTWpY?=
 =?utf-8?B?cUNWNU9ZaDNTRGhBajgwVmRrOS9GSG5tTVo5cWUrSmZlTkJuNmFRTUFJNGVk?=
 =?utf-8?Q?gkzjq9DvWnH1IpJw05lEokBndDZC3Sf7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:56:11.5038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7352fb2-8071-4b1c-d131-08dcc3490e13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7918

This is in preparation to splitting ACPI and platform device drivers.
No logical change, move common structures, macros to hsmp.h,
add missed header files, remove unwanted header inclusions,
and re-order the header file in hsmp.c file.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

