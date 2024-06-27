Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B781C6B7
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 05:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466831; cv=fail; b=jYymxfbVXj1FCIwo0ocJnFJJ3Lowxs27uLEJY5oOb2vITA6Cgeh+Kv7s7/YZn7NV+DrVRf5UMvrZ7jVOyT14JKmdQuQk3lpVqj1cgstyxdeLJOUMdrMkL0p59D9qaye70CKvxf5PCAHhEEMwGclAC/OavrjCEUMTCfgT/aNtmOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466831; c=relaxed/simple;
	bh=EiYxRk0xtwHMHomF5Fk6ttVIfUUlXEiFPp6QCq2OdCw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSyHoSZEZbrvknbY0zsY9/c705eRdeiw/c3AxrSrYh1Zg7Ah8cKEG6w3QweYng0pVjEa4c8ADPMbflWgZk9quP6z4Xfbc8KcFrjjd9JAUIu1joB2LVp0DX49g7yjjts/PosU548voCbwnzmw9VAr56I85/T+017V1FxoYj/IcXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TPzYZ1Qv; arc=fail smtp.client-ip=40.107.244.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TPzYZ1Qv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJelpWL+4is7XmOgWOgYzGe6pm66yRCZLVErvTXJWn6daxSkNgY4dxouvBjesMltTEYcaaQMq3FfAHdy0j6DoFRpdFjvUR/DIUPTphXXM0DtyqxiFeItGiDAl9g+BowjQfmecW8AVApmpdNfo4umPzH4K+5xWmih8TW5XZAwY1ONQi1rDZwmbNsJeVpPBtBk9g4EEuKeAbmZOKkcRkXOAORt1axO156G+dggnFwYWk24l689v8XFtJ6mxCNBvWXDaFfDPC2WURlw9VRy/eTBh8+ofzsJVWsD/sTKUUJdPpw55PwmSL64n1ow3wnsIebOEwlWcbchdBqkklBys76+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWOhoAsnKaDTePLik1ohT+zdLBBZcXrqaii+AKcEWNE=;
 b=DAoIlAEZGBjm7BG1sZ9wUY8GVqgQwAp52SJVqpwuqndeqsDSP/wWTY+ZoJ0wyhC6g0y/v3kiK4Nf27IpSkcNltzOXE7WGF5922mCZVlcikFE/TL2nnplKhDnjzP/BxpVZqSTLa/OUl7a91ciBtE760lEJvxeBjWMGTT5rk1NBqNO6B3sgFAS3WNHhbWXdFuduj+vqW5u4XIvZhErCc416a5tqiaWpQNGoigYjFEDRwTB/KJDV/DrbO1gXWFbBsV3SXH9eHAaXb1rLOimR/eL0po9TIlSU4ix/SWWyd0ky61MR1aH3LmDc0V5cdeG5hs7blzdMUbJeTcPNENsCyOEhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWOhoAsnKaDTePLik1ohT+zdLBBZcXrqaii+AKcEWNE=;
 b=TPzYZ1QvKFK8cvwPEuclHCWgbyFGahGJdJ936Q48feXzNMTYAothBnJ5loo3NgKFai2DlTeUuc7564yTtoygp7ibARHK8VMUg9DUnI54hlrQkjef5VAr528d6YtFiPn0FM0f3/B+lh/uEq68hdRcTe76ZsVpOy4PlLnoiuURRX4=
Received: from SN7P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::26)
 by MW4PR12MB7439.namprd12.prod.outlook.com (2603:10b6:303:22b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:40:25 +0000
Received: from SN1PEPF000397B2.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::ff) by SN7P222CA0012.outlook.office365.com
 (2603:10b6:806:124::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.25 via Frontend
 Transport; Thu, 27 Jun 2024 05:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B2.mail.protection.outlook.com (10.167.248.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 05:40:25 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 00:40:23 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 03/10] platform/x86/amd/hsmp: Move strcuture and macros to header file
Date: Thu, 27 Jun 2024 05:39:51 +0000
Message-ID: <20240627053958.2533860-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627053958.2533860-1-suma.hegde@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B2:EE_|MW4PR12MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: d1290ff1-ee49-4ac5-336e-08dc966ba507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HS4cjNWP8YupPbk+dgE4clMnuI3CK9H8SLlgezitgX7D8+vN/xOW0CldlREP?=
 =?us-ascii?Q?8ly5kLm5kGuu0hD5wUD7BK0uVm41oJ0+CYxkoSleYG4wCyONcd/6TgxLmK38?=
 =?us-ascii?Q?8heCOfcKzaXIjbs+U5AEcHMBS8Re9oSImuuz7Zog8XHD/jhFqiPnI9VvONUX?=
 =?us-ascii?Q?lRcfzRI2okITqbwZGR9MX8CUyf7oV94fd4UjcYDwN7dJA29BuFZihUnLjHpa?=
 =?us-ascii?Q?zJnbkWu5jlxeAjTjQS0776wVlh88Yh5wedlWhkP/9n84huONm+XLJtVBB/3Z?=
 =?us-ascii?Q?JYlm798iLD7dewuGF2HvE713fyznZ0iRYS5WWlf4pLRA4YgR0qpknhup5waO?=
 =?us-ascii?Q?2asTxs9hxn6IksivOZBQULaKZa8FQaxIRxkgr1QsI2NN+YejTNYEoxKVvEyf?=
 =?us-ascii?Q?YKsO1wsa308WvxZ5lsEb89CrQLw5smTmlLjlb1tvWazF0WZnN92i4zkjXNIm?=
 =?us-ascii?Q?a2sOoKZEkI9xUhbytlyQ+0yw29Bb+3bwkJGlpU7N5cBBnHEoVXCzjAGUpS1l?=
 =?us-ascii?Q?k+aZUwU4kTQV61UqnAzfhWCmCaiAVmITlhFFSCTHrHn+dbEu0hkkY0Td/UbQ?=
 =?us-ascii?Q?0ldK1muOplII7qQWYlAO/E+ODtpNDXryJelD91ap/WyBdyd1X/SApgy6yJuo?=
 =?us-ascii?Q?+iotWOBjQWNcp3dOM1DDHsd2EBQz5rO4jmPz8++IwdMEkbiFsWWhoNlyxva4?=
 =?us-ascii?Q?NM7uziHu4ggJjzpid60EpyJHsRVgQqZdahh0ahvwsTXRUjQp58101zcU78Vq?=
 =?us-ascii?Q?QXqA0P6A2Wc+fNb16OjG64brgQCcSad3Pt0UXDvegEfPA9YOEOgwU7TfFNe9?=
 =?us-ascii?Q?qyrwmXuGWyNaXlFc6KxAPEWuOTjhbQrl41liKfRIFA20qVa2QmtK7dzlyuKo?=
 =?us-ascii?Q?19I0DLqsvMXgHJKZwtPguPEg4rz/otUtq/z5vko1cGcR4LHkPE2Fq8rO6qDi?=
 =?us-ascii?Q?UzbHVcOGf+YoLNsvLDAw9FPl8C/PPM5gjpAI3OfHe69bGHnRVETEv2k0VyTf?=
 =?us-ascii?Q?swq3hpyX+18oATifePZNZJ0G8l+/xMjZJHGAyXI2fcnOPNBasmvhVwoRX5Pr?=
 =?us-ascii?Q?u0QPXVmtFZrj4weDhQ/7196ilQrRjuDhUhvx11u95fEtYU4pADOAzXck4Iub?=
 =?us-ascii?Q?oyRW/IMC8Wkj89EKHQ6cGf8d5vSSKgwUo1EafZFwO1Qw03vIlQYJ25HtL812?=
 =?us-ascii?Q?hkOGRv9qOOYnK1abKWQHgofWbSPCOioELoZa9vRAXeCzKzzMzCB+mEJ74tj9?=
 =?us-ascii?Q?mP+jTtSXRqj1Z+5CTTwt785ec3/+BncyU+ocmpXpN59akwh34BqNPVcNf6wk?=
 =?us-ascii?Q?QlZ8aMpzfkkQGE4RMOpIcpR/vMBBMlOJPRKsjheYSbbnHJYYGRl0StVcxG9r?=
 =?us-ascii?Q?PK24m5YCBzmSefO7SjVYZ83Oi9/x7+Zw043H7zrfSW43kDgeWxz55VzjNeOR?=
 =?us-ascii?Q?G9ZZOS+qHIiqsC7QPeHhs6jZsUoBskyh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:40:25.3366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1290ff1-ee49-4ac5-336e-08dc966ba507
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7439

This is in preparation to splitting ACPI and platform device drivers.
No logical change, move common structures and macros to hsmp.h

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
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
index 000000000000..cc11e9303a83
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
+#include <linux/semaphore.h>
+#include <linux/miscdevice.h>
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

