Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFF01C986E
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367144; cv=fail; b=WZgtKzN7wvynq+nmqfWjzDoY7bd+GsNiJdVY4Dwuc1EWUJDm+JgKcV9THBbrihkUGLQLkrlbk4bg+6z6D6Whul9Fnge5HAaRBBfQVy49uJw+vD6mrz5Hogdsxp2yUvZBrguHObGJHIAAYMgYWh9BRA0whc7uoPa8rRUlpV8Ibeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367144; c=relaxed/simple;
	bh=lR7XPT7N57IPPS+U+p24Kx1/h5BUp02uVCSdl0VBoKs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmMCsUYjCDzmApq8j7YB0Fssc2jYJFvaJ7r4oANzZ2LW9guaczOCa/6e92ii4uy4dxvRDxXsCyI//Ir864eJwMhjKoUqZyUodvdK2YG8sb5/jMSWQ1v1NTs3NSVDEa45n1r6vIC3UDwnzIBZ42h1dlpcCsVIuVkbyO8FD8t1vks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gqOMn+Ii; arc=fail smtp.client-ip=40.107.92.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gqOMn+Ii"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4RLAev9d7VoULN4qOrBwJuXZqVPvM5dOjOnuU6n6DSI7VSnfe69YoFU/5ZD+DwCrasu6X7s0WEvy5/rsTUkfakFMs65aLJKfczL/xtTUDivtyCAT7I0n15XNJ3xB/WLldcUo2sH7hwz0PKHLv+5zKDjOD6cWMcZK+Ifx0my/gXed87jHzuXtNHincqtWKJ0e7NK502p4AVDbLCZ8caAVCF/YlJ/Gry5INZEW9itoxYlFxEAAk13MbugHziTH9arPCNba+StmeEkULu4DvrwfVFOE7DlQuk6SQ4SlBJLstJ42qc0oIWMkjplVI/vPnYSxKg7X5u58B7TweZj5Y2gNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ebfy6iU8k/3HRmeVnhf1pRHfN+Od5BeB49yVLcdNOYw=;
 b=VdlVDBD26OGJNaMbaHyk5ebZgiVFp7MlSJJBHnr5qrJNk5yQgO6ND8FkpI507YcVdXpIY1E7F/OfHvGqx51cGuKtZDQod67rDa2AIP2eUZobPgAc+LF+nI1pzl+ZEA9KXDqaWSv2ovuzdPX36SznK5RWng+xMmcrIe6mDZwR9paIohRUFS0S31AQy7JhQhHB8xaloo4KdEbXlSnQqZQiZlpp1cspKlHq0l6za3mTDHpdG1sQH1z53vdK9aPd0XrPIfdChJQp0WuHthTomDoPVtJ2jiP9udTM3XH3/1DjmcSKTwOoW0ndVTEEwl9MTv8MhyImVICLtBeFWoHfsSHGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebfy6iU8k/3HRmeVnhf1pRHfN+Od5BeB49yVLcdNOYw=;
 b=gqOMn+Iiz02p+2VSlELldhcwNKe5C2Ot0zs56ZlrhjLmDbPNAhGd5GNWzSL2W8YutdzJFNY6VEQheD5qfy4WKjtiY2dJ8Nr+aw0pKWHCU+r+aUXZs0PCrA71Zp+LWGEU1b6jtPt1js+HOXmskSxPlT8RAjUlfo9US9DOyiVqz30=
Received: from BLAP220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::7)
 by SJ2PR12MB8874.namprd12.prod.outlook.com (2603:10b6:a03:540::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 12:38:56 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::50) by BLAP220CA0002.outlook.office365.com
 (2603:10b6:208:32c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 12:38:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:38:55 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:38:52 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v7 04/10] platform/x86/amd/hsmp: Move structure and macros to header file
Date: Tue, 3 Sep 2024 12:38:24 +0000
Message-ID: <20240903123830.2717196-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903123830.2717196-1-suma.hegde@amd.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|SJ2PR12MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c9fc19-8bf1-41b4-989f-08dccc156028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUMvOHRNV1hHM3VYQ2dWRjJKNkZrbGJDRllRYkZKL1JxL1RIVEoyUXZJSkFD?=
 =?utf-8?B?SWxqb3RKWlVWcW1FMVVXdy9iSHVJUUg5dTVnMyttM1pPM2pmYVhicWtISDhk?=
 =?utf-8?B?RStjY0I2NFFpQXZzQXh3U2dDZHpmZ3VNdnpRbmduVmhHNm9NN2FvdUlIV3pC?=
 =?utf-8?B?VVhVMmpOS2hFS01TTlg1UDRoVmxVM0ZZZDVlaVNzYS9oTG9TNldlYkhzcjRU?=
 =?utf-8?B?QSs4ZkY5SzVWYzkvQitsZHZ5UnhQTUkyTS9Fa09Ec3lialNxNE82aSt6dW5E?=
 =?utf-8?B?M3JmWThnbXBnaG1LeW9iSXVtQlR2WjErOTczTTZMOXdNRGRCcHV0UzE4bWwz?=
 =?utf-8?B?NGl2WXNSa3NkWmJNVmhERHN4bXBWTkUwTHE2b09RL2pRZVkwcXpjQ3A5Y1Rz?=
 =?utf-8?B?UklxanVGN0NsVmF0VmwvTEZ6L2RjT2l4MnZlek94eE9UQUZ3czZWM2dQY3lu?=
 =?utf-8?B?eitPZ3U2c0dUa0RQbWNLZDBIcHJ5MUhNd2QrcElmc1IwN3FVcU9udGNzL1JJ?=
 =?utf-8?B?dnV6T2xwVlUrRXJxYmpSaUpqdnFrY3A5MU5XT2dzZFFrTm54VWt0YlJCT1BQ?=
 =?utf-8?B?d2Nod05Fd0t6T2NIK3ArQnNKOWJtdHFUNVRodHNhanlja1NQbVFkMGJRYVp5?=
 =?utf-8?B?Y0JjY2ZadTVEWUI3bjdBTVQ0QzdhaGgyNDRhN2E5akc1ODZCVi8yZFR1ZTZn?=
 =?utf-8?B?cnRGL2R3YzQyRWxqWjEzbmZacXZaR0lLVDc5WkFiQWloL0N3Z29rV1FEREFs?=
 =?utf-8?B?M09tdEQ4OVpYaGxmT0c5S0QwbXRRVXFNRC9MZTRnWUV3ajBzZTAvSk9pNG1N?=
 =?utf-8?B?YjdpeE11Ym9TMzRyN1NtbXdFenozVkFNSis4RzdpNVVxNDk3a25ScG8vQ2pW?=
 =?utf-8?B?dU4vRGJTVnFMSzFQODRMT2xudVZYMmZvUHNzY2x6UlpvVVJ4RHkrTjZqcnFq?=
 =?utf-8?B?NW0xam9VRGR6SjFJRU1XTnFsNGFyMU1XT0VyQkV3aCszZlRseHZxS2Y3M1BW?=
 =?utf-8?B?aDJZTXNqL0JieERSWUFxTnBFZHdKckdCY0FZd1phSnBDQyttK2RIbXNVMVdo?=
 =?utf-8?B?clNSdmZoQXFQeWpJZkQrMUdrZ1kyV0srbVk2bTVWVlMrVWc1MzBQdHVqKzEz?=
 =?utf-8?B?OVRoZTg4NTQyRzl0ZkJrN2NFUzdwZldPcUt4TTBCMys4RFA3TDFWZjltWGJI?=
 =?utf-8?B?Nm1hMHRkdEIxd3JaRDJVV3I4cTlLWnd6ZjlWcFUwQkdLUC9iNk11WDgrZmh5?=
 =?utf-8?B?TmIwUDNOcWIzMlhQQzRCVVdtdFBjZ0x2ZmIwU244bm5wYW5yYklZb0ViUzhC?=
 =?utf-8?B?WEEraWpGd0FiY2lUc05sMmpVeWZteFQxb3Y0N0haRFpEV092ZDJjaE1EMGVW?=
 =?utf-8?B?QkFZcmhyZzQ3Z2dxaGpDQkJ3d2RPK2doRU9ReUJIRjZpajljTUJYNi9TMjJD?=
 =?utf-8?B?UDNwcFZaQkpGUlBhUjdHMGpQaFM0ZmlNUDZ4WEsybENlbHZScDJ2YTVBOXZU?=
 =?utf-8?B?ZnFCQXQ5ZXhtSkVQaHQxcGhySis3MCtsTVJaaGZXU1hXbmdHVHBlaDBZVFg4?=
 =?utf-8?B?SzFRejRnUTV0aUNCZTlDdnJTVzdUQjlkcm1LbmoxdGxoTS9ENnlLNGZFV202?=
 =?utf-8?B?dUx4czQ1TUpoUnNlWHR5MDYxWktDanU5dU5SZVgxV1BVc203MkxwWHBGMFJ5?=
 =?utf-8?B?b1p2UitFVnNjU20rNVpwV1RpUm9nZGRScDJNRU1ja1B2TjlJTk1aQmlyd3Y5?=
 =?utf-8?B?MlRqU3ZqS3FxZTZYR1loQWEwRDRIVGN1SG0vbDlKR3prc0QzbWVtcWttMkF1?=
 =?utf-8?B?eWdTV0hJYlk1ZjVXcGc3MHBia1Mxa2hCSWlDcmZrTFJpemV5V1NaWG1UWjFC?=
 =?utf-8?B?dmFHQ2tOVXRXV05rQmg4UUUrNnVNUEFTbDh3MnZOc0J1VFBRdFladHp2cmlM?=
 =?utf-8?Q?0yk2vMikpFwLLZBWZZzhLFJbm+r0DPY9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:38:55.8483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c9fc19-8bf1-41b4-989f-08dccc156028
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8874

This is in preparation to splitting ACPI and platform device drivers.
No logical change, move common structures, macros to hsmp.h,
add missed header files, remove unwanted header inclusions,
and re-order the header file in hsmp.c file.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

