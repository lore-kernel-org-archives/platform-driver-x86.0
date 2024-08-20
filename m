Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B076A18C01D
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149818; cv=fail; b=JJXcSb2J80JfBIHTxs7MP+1E0GF866DF15kOqt+1n85EtRSdjXPwe8VGQiIvoOGGvcfex3XXdcFNMuBkrwzLdXKOalYjTce+dk/SZ3DRUt2bAt+K89SziY81bxquNhCZMPyGN6C9LbMqH8JnymDV/IQLxrajSDTMDhW4b9z1ik8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149818; c=relaxed/simple;
	bh=aQTzJ+ZUTodbkV5gHvr0gV6aaoMFLGUAJ+dyRIOTWV4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rc9YMcfXOsUAGm6L2wQaGcT8ZlKS+cwFNelnWXzGS2PaCxir0qRV/QTrtvvzmvnhL7ueuwOYbBiJws/mR9N6o3N1Mp6WWxflqhopX9gQ+R096E6QuthQkg1Nth2apv1EzfoO7Ba/ZfFqD/rkoAJJLzzC+ARQQxRmzo8ZUivLVT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r7g8lQ4p; arc=fail smtp.client-ip=40.107.92.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r7g8lQ4p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltKxRqRT8eNqcwCGbmj2W5D9dkT60S7qU0yDGolLLYeZNLm1V3nFwpz/mC21hnfD7YoCdRww43B32sSdQnvV7yIH1O4QPo7Si9oMCoGHYeij/u7tytahsQtCHUIC/paYB7nG+L91xR06sjKcccxh0xAMb4CNrL2fYnQjEOpi63keV+IClsbMkjU0Z5AlFyXY9kcn4xqhpQNGXIBCOTk1b8p93YcIkBLYktgbHsgPECWP3TE3H4pFiksfM7QifNYA9ZHVyw+4HqjEBLMiJnnYvAFr4wizMtCF1gPrOzjYkybgoJbcSCmUUAl39bbzreD17MK19WK7ZDTS8gBkyqHOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+V3HSiZLBlw8j3KTj1OzDBNwIjovoNaKEzxlUwice0=;
 b=zOd27K7nZJQFIy9t88Cc5fM50Hm27c9ScqZZj7KERW1PrduUfuURWIMTOZgIxv+/C5hKDBG49/LCOalNIqLO9Fg83eS9Z68cRTnBapMPcv5nYoJ+QdQt/ICTyJe0TQJfdlkwlNkPF3oqbPHg130qO7XsSpRdtJVljkYDHGWnPfMLubYb8hXw8Xv5md6C7DIadZ957GBqk5Ee0ljKSyRZyyj42htpoOBov5k+1DeEApA0xtySa7atjHzn7AMN58ZDEW/qwDrCKCsHCKYcRjD30ZtqyyfKIrPi+w325pK2+Crojx37pSBc0bCk5eq5HXVVFElA+NPSJw7w9AyGv+jPBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+V3HSiZLBlw8j3KTj1OzDBNwIjovoNaKEzxlUwice0=;
 b=r7g8lQ4pESCzCY8a9p5OP2Qh7LDfsB22Vu6MNThE+Lc78VpIXGUOlKvH1TDkKhWQw2XwbgcjMUjCTnRHV5TutGQnr/BLT6TD2xOz/Yvn9uQli3Hy6wEUyMwAlc0vBALsqBSbNn9I+8YKt+w5OYRIJ9LoZfgiidezpCgv049Ti4A=
Received: from BY5PR13CA0006.namprd13.prod.outlook.com (2603:10b6:a03:180::19)
 by PH7PR12MB6465.namprd12.prod.outlook.com (2603:10b6:510:1f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 10:30:10 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::d2) by BY5PR13CA0006.outlook.office365.com
 (2603:10b6:a03:180::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Tue, 20 Aug 2024 10:30:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 10:30:10 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 05:30:07 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4 04/11] platform/x86/amd/hsmp: Move structure and macros to header file
Date: Tue, 20 Aug 2024 10:29:34 +0000
Message-ID: <20240820102941.1813163-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240820102941.1813163-1-suma.hegde@amd.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|PH7PR12MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 0850c25e-ca73-4b0c-a104-08dcc103119f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RThBd1d3YkQ5SkpyejQ3NWd6cm5JR0JxdC9xMFd1Rldaak0wS1NacEFCbE1z?=
 =?utf-8?B?LytCSXR0UXF3UGlJOHNEaWNjaTNxeFV2a2JyME5VT1I1S3ZKRGdqTm1WWG1u?=
 =?utf-8?B?TjF3MWtlc2xnN3I0WFBBcm5sSUNGR29Db2JiYTlObjcvRW15dnpHUmJRTkI2?=
 =?utf-8?B?dEo2OVNjZ0laYmRiY3hpOWVJSUtTNTEyMWNBZlFONkJTVDhHZDJ1SU44emZx?=
 =?utf-8?B?eFNtTnd2VU5aYWdXdkcxUkMvNkNNbU5ibTB3VGFCWjVha3l6VlY5L3FBZU4z?=
 =?utf-8?B?UjlveHpPb1B4eHpTYy9ZTlNOSmRYR2lGWUZ4YzJGeXZxTzlmcmlQTDdZUnZp?=
 =?utf-8?B?STVBWnVJYVdFejBCRHpaOTlWWFdKaW15aUp1dzNaQ3Vvb0FDNnJVcjYrTlNQ?=
 =?utf-8?B?MjR1UThiQnJ3Ujdpb3NSd0hJL1lmVXNJNkhHZnNiZUpid1puUE9oK1B1K3Rp?=
 =?utf-8?B?U243ZE1zTXkyQ1gxM0dqb0JiSFljRGNiYlNHRHAvWE01bHpWemZ3RmVDWXFy?=
 =?utf-8?B?RkVoRUFXaVVwK1Z0N3cxVk9BODh4SEpoVHQxQnljMkhVQ0c2dHlyaGRkK2pX?=
 =?utf-8?B?dnFOdkYrY3dZOGJabU5CMmRkM3ZFZDk3YXJxbzlHS1o4Q1FPMk1oa2NzQTMx?=
 =?utf-8?B?ZXFMZ3B0dXFIaWRUZjRwcTZPREM5aUNuREpIUU1JaWtXZXpqMDNWelRhYmVD?=
 =?utf-8?B?aWZ6TllzRys1MkplQlNWbi9kL0dCYWRTSnhWZDZ1ZnlLa2d1Q054WWthUjRq?=
 =?utf-8?B?ZDcwOGZzRjhtQ2xKSzBFLzRHMnBMWndqOElZUm9MUHQ2NlJmc2dCYkhmVlFI?=
 =?utf-8?B?VE5qSHFydGVJY28yd1VjZWh2SEg0RFNSSEE0TzRUaTNISHh2V2JlcGVDa2JR?=
 =?utf-8?B?MVkzckpSNXh3end4aGl5aStZc3BjanFRYXJlUFFHN3lzYjBUbHlVTDNqM1dK?=
 =?utf-8?B?WmJzVHZuV2tEakFFTGhrQVlJdU91MzFFejhjNFcrUGxpQlBPSmZEaXZjUzEw?=
 =?utf-8?B?cFVYWk1qaWhFUXVOdnh6RXNaRWVhWC9Rb1FmWlhFVnlYZ01SOFpIWDRBbXha?=
 =?utf-8?B?c2N1Q2E3cFRyYjQ4bzQyWmdXNkpYYkY5SDZac0FCUDd5MTVHamNONjlJa25V?=
 =?utf-8?B?cFZERGRleUt1QW5BUkxYYWZrd3FkcnA3OVZjVlgzNGlVNjlrN0RwWlRzd2xF?=
 =?utf-8?B?L1lVS1I4RHUzaXF4d0hGRGNHMHhnTnl2bnpPeDgyRzhDV1ZLU2JZbS9CT0NS?=
 =?utf-8?B?ZmRSbW5IZVBjZFJ6SVFWamx0RC9ONEV5Q0pjeXpsbVQ4cTNVZEs2ZWNHaTBp?=
 =?utf-8?B?dzZuVk1scFBUOU9EWmQ4eUl0RUpwRUV3Q0JTT2VSVVNTS25PYUVuRE9NaDFw?=
 =?utf-8?B?K2x6TmZWcG1LcG5XSDJXbHh0Y1JsMGZHRnZtV0V2WkUwWFJJdHZFYkpDUkxZ?=
 =?utf-8?B?LzRPUlRlR0sxbXJuTDBTa3B0L1NaQ3ZoOWJqNmsyODh2b3E1SDEzRGE0Y0hH?=
 =?utf-8?B?WUE4VWlvTTIwS1hUUnZscDE4UEJJZjBmLzhtbTZiU3BTcXVnQXF0OUlxaDlh?=
 =?utf-8?B?MjVkUUIvZTl2WDhJVGx0T2JoSHBDZDVtcWtRaGF3SURuc3NGMVJXRTgrSnFs?=
 =?utf-8?B?aHFiUFZhSFV1ai9iRTU2eGlkTHByOVNuR09QNEtrQkRXM1oyZzJ4cVBVSmEx?=
 =?utf-8?B?dVNONHFtMXloUHY4WmpydmtRU0ZGb2cxMTh6QmJQM3lDT2JVRS92NEtMU0t1?=
 =?utf-8?B?TFVHcXN5MXRZK21TdGd3clJyL1lYSjNsZ3F3Q1ZpdWZCZk9SWWsyV1J3cDdl?=
 =?utf-8?B?SlFzeXJrTDFZZTIwSlVnKytuMURPYXMzM1VGbmpsalVEUGRVb1J3Q09hM3V6?=
 =?utf-8?B?UXNVZkZ5SlhNblVNNUVERnhLemxkUTBvVHNmUkQ3NU13ejJTcHdueWFFSnh1?=
 =?utf-8?Q?OKqZxmw8vXTUqKwWKXmizyKXfT89YWg5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:30:10.3567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0850c25e-ca73-4b0c-a104-08dcc103119f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6465

This is in preparation to splitting ACPI and platform device drivers.
No logical change, move common structures, macros to hsmp.h,
add missed header files, remove unwanted header inclusions,
and re-order the header file in hsmp.c file.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

