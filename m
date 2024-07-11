Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4488914B978
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683225; cv=fail; b=FPPuoC8+Ns1K1qJCUfxUl49cGccl0oI7PpxR5ISgumoaY7B7YZVCY3b4IVD3zHRJolP4GKN+4zZk+xOOHunX0bx/AY9wSQyqGmdmDxe96V2K9cOds6LjoNDzvIKnmLZa784vYSDulF7OEkGNKpFOkXJnIV3pdVuPftf//SOR6Lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683225; c=relaxed/simple;
	bh=EAKAHwOx5XIlYCUDxxIjSEhgW3jIqnHfpKTj9t6BymQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W+cgFK586o/UHuzJClh8DvrMhoX9lGj3yolHUAN+LJGJHl/+fvxL2rPDMleOPTt0yJ9XpNvXNiRDZyaLfc5XZwcAU/Xi21LM9vNapGrY+/lM2DLHTDr1vhVt0zg2O0o8P7GyJCda6ObLeVTMsVyoujx0YOgJDNoj0R+4EIxW/D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ervajZHb; arc=fail smtp.client-ip=40.107.93.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ervajZHb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NM+Dk8CZteOMxbhxK8esCsUszm4VJGgWY77nsKXdCI2xzQMMLd/f/q7JuMr4mATrkoNEmSmah2KOxLEH2eejsTaGT6SJxvBXpvj9ip/mFaYnXg7pSf/Gj0zhzm971F0RpRNQrq30eCnkWeg2YQxPZyGSTIwtV1HdhvW+pCfBx/l7Z3qpwKnz2ANf65AdtHXicYQn33hxuUdHWDhcD1E9ZZ76ZL3ogm2MyZJZI1ZCQRGeKrt5GTGVfPPWqWdOgHeC3wfQ8bjo2wUJsti0OB0pK6C/ISPBJ0/74Cnxr7AuXrJ0t09OQG13s08zMwrUoIINwHMk1NOgexhkWAt3K4gTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUfFjNFS977CIWSBjS5ZnDvzIloaD4reze7Nz+/RNFY=;
 b=qTPgsHFIJe4KUMzLFGPtjz/X2sqXZn1vAY4IlR9RFYioKhqcD/zy1kLs5n0u+RPc7xyK+FEQi3ZGD4d/EGu5bkGxEllVnOMmDSBu3w3ZIF+NXJtESW1neps7jIM84VFTMDO/OVwRlkIAKEvAKdO/lWFEGbL0U6eIYJ6/H2+58KxhiPkUT145jfuLgwZVbSkbpI8RfTjYckVJ1v9WdhofRqAud71fKrPl4QkqtuwXx0qf3ICUQKGrBEXbbtKJuENPXbxrCMaloMZ4fSU8X2KuPTuAgtNFg/szLTR6sLPubhTvtcmp3llZ5Sq/WnZaFDHzxDg+nb9UC4pehWss95PGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUfFjNFS977CIWSBjS5ZnDvzIloaD4reze7Nz+/RNFY=;
 b=ervajZHb3ek8VnwBvDx97XijivOCVOvEUhIoP9/CthdKrwnchtedyE/8tyHuU+BhzkCosrVbJYAmV0xZ3WcNDma/HDPXdHKeholrV785FeLtnhSMuuZ7ZMH8dgLSP8VlEDw4q4ZCPJk4dCFYJNPXUf1Ft9oWOw+T1H3JqYhtNcs=
Received: from BL0PR01CA0022.prod.exchangelabs.com (2603:10b6:208:71::35) by
 CYYPR12MB8752.namprd12.prod.outlook.com (2603:10b6:930:b9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.39; Thu, 11 Jul 2024 07:33:40 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:71:cafe::1d) by BL0PR01CA0022.outlook.office365.com
 (2603:10b6:208:71::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Thu, 11 Jul 2024 07:33:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 07:33:40 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 02:33:38 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 03/11] platform/x86/amd/hsmp: Move structure and macros to header file
Date: Thu, 11 Jul 2024 07:33:06 +0000
Message-ID: <20240711073314.2704871-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711073314.2704871-1-suma.hegde@amd.com>
References: <20240711073314.2704871-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|CYYPR12MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: ddbf4aa3-f1a5-46d3-b11a-08dca17bc8d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUlCTE1SdHdoZHlKZDRCZ21OZ25jeGIwS3ByaldEaC9maGRVeXZGSHAwUnkx?=
 =?utf-8?B?L2ZjUUZyc0hGOGtHdDB1RkszOVliNUdjYzNOQnlnMkdydWxJLzBFbTdjTlpB?=
 =?utf-8?B?QkJqakwvYkFjZkdIazQwNjEvdm5rWC9pSi9QQ2JRcDlXakMyQVhuZUdoV0Fa?=
 =?utf-8?B?VUJHRE0ydXE0eWRQMEY4N2NvZzRzcUJKNUc3aTB1d3ZjRmQ0TWpjd2sxeDEz?=
 =?utf-8?B?NGV5ZFViaEo5ZVIzMVNKU0hnLzN2K2VQb0RkVHROLy9iNVpNK0dWeW1pUzIr?=
 =?utf-8?B?YWRqRHBxRVRyOHczbUQ0Y1dyTUJFdlptdHV4UGQwOEhlSzB1NzNUVFFYVVFx?=
 =?utf-8?B?NTNPRWN0aWhrK1N2bU9rVlVqZmFDdllzaFpra1JsS3NFWm1sMUp1RUsxdEw5?=
 =?utf-8?B?R0JqTEc4cEdodTBFSmNiaitHbTlGZ21BK21KdGg4ZFdzcW51YzJJRnFZUm9o?=
 =?utf-8?B?cVdlYjlhT0FsVStieWdPNzllM3Q4ZUFLNjFleC83YUxjazFHNkk1TTNicE9k?=
 =?utf-8?B?OHRub0JtRUExMjBiN1Vkb1UzYkp2ZDQ3Umc4dzExelUvYmcrb0pzTXg5SzFC?=
 =?utf-8?B?alMwUkRlUm9sVDBkcmN3UC93YlNwenRpTzZXQmF4UUdGSUdDbVYvWmdER3k1?=
 =?utf-8?B?bFlBTmNYZGQ3RmpvRjZKamROU0xTRG9sZjNxWFhPNDNTK3RmT002b2pwWEJ5?=
 =?utf-8?B?alNGV3gveFVrVmlHTmRuL1BLelB4WGlxK09MOEduMXpGalBaVllPSjVZKy9q?=
 =?utf-8?B?ZWVtVXZYZzdxa0lTQVdUcjlhK0VaVm1vV0dmL21lTVJmNVBVckduUHFQL3Bx?=
 =?utf-8?B?SUZJekZaMXp4bDdJaTZyZEM0SnNsV3ZJcVVmNkxwN2tPU1dybjJiM3JCckZ2?=
 =?utf-8?B?c2hnaUUrWVRzZzBySUhEcDNFWUhuZ0plSFlQd2hyU2t1aVNjNUJsdHZLUXdP?=
 =?utf-8?B?MXBKdUduZHRuRkVKQXBwV3NIM1FkbWp2R0RSRm56ckRuelZuWUJ0NmlCQ3pF?=
 =?utf-8?B?SDY4UjlGM0xuUGFaVnNRUytjSk5QNnFuenlCZzBiVWdPTUUrVnZkMDhPWFdt?=
 =?utf-8?B?SHhLSUNGZ29ZNlBWNW5iRTQwbklHRnFxbmVYUWUvOTU3TWNKaHRXNVpPQXds?=
 =?utf-8?B?dEJnR3Zma3dDampEbkdZeUZGMlNYOXpBRGg1dHQ3MFFaY2NzNGU4b2RabklF?=
 =?utf-8?B?RncxMHlIeFkvREhJR0E3eHpybFBLcjJBUVNMSE90blRCMTQzS0tabmNFNHdM?=
 =?utf-8?B?eTNNbFRDMXhiUkQ0K1hacDJIOFZsRnpYNzd6YTBIVHViUE12Qjk5TGZEQW1v?=
 =?utf-8?B?N25kK0tjQVJNSjU3ekU2UWZ2eE95UnkxMmdScnRLbmFlSkdraTdYWmpLYTdZ?=
 =?utf-8?B?MnNub1dUTU9XT3kwS3Fyb2x3dElWT005dTFzTlpqUG1BdndaNHc0dTVzeGdk?=
 =?utf-8?B?aFlHQ1pJMEhOTVdMSXc2MlZzL293ZDNldzhRRktxaHpIK296UEZVbU81cmpk?=
 =?utf-8?B?U1ZKU3dTU1p3UG1meVowZWFPMnh3ZDBLL2Y3b0xKVFNpSHlVdTQvTUIxbldT?=
 =?utf-8?B?bzllUjBJWEpqVGZJOUpxeTl3aEtuZ0dZL1Q4aThCNGRLWXQzN1lhUEhWOXo5?=
 =?utf-8?B?VVNRWEtZMDNBUXFoTUVNbDIyMEgycCs5dUl6RmhXaGczL3krS3hZUmM3N3pz?=
 =?utf-8?B?M0hHQkxZNjhGeEFoL0x3SStqOE83b2gwZVpxYkdpYjZuS1BETGV6ZGhhYU83?=
 =?utf-8?B?ZUc2d2dHMk5sMzZtNnJPNVQyV3MxdWozTUVBTDFVMFF4NkVEVW9tYTBjUi9u?=
 =?utf-8?B?VnI2a1lnM2w4OGJDMEZXL2VkSzliT3FaME1kdUl3elVJdnErSTJqZHZ4L1Fq?=
 =?utf-8?B?Y3hJT1Z1V1oyZ1pyRFdWN1J6dVRGQlJxSjZIMjBkemFzdWFHQWVITjI0RHJQ?=
 =?utf-8?Q?4LlBCY/sEbAj0gsreIRuLuxAAcpPlBGP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:33:40.1286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbf4aa3-f1a5-46d3-b11a-08dca17bc8d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8752

This is in preparation to splitting ACPI and platform device drivers.
No logical change, move common structures and macros to hsmp.h

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v1:
1. Correct typo mistake in commit message
2. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"
3. Arrange header files in alphabetical order for hsmp.h

 drivers/platform/x86/amd/hsmp/hsmp.c | 42 ++--------------------
 drivers/platform/x86/amd/hsmp/hsmp.h | 54 ++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 40 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 10ab9b2437f1..2c9ba51b9614 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -9,15 +9,14 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include "hsmp.h"
+
 #include <asm/amd_hsmp.h>
 #include <asm/amd_nb.h>
 #include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
-#include <linux/semaphore.h>
 #include <linux/acpi.h>
 
 #define DRIVER_NAME		"amd_hsmp"
@@ -51,48 +50,11 @@
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
index 000000000000..5afc7167fac1
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -0,0 +1,54 @@
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
+#include <linux/io.h>
+#include <linux/miscdevice.h>
+#include <linux/semaphore.h>
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

