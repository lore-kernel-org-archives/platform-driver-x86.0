Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A53B1E377E
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509302; cv=fail; b=XW+H4wWkwzb68B+pNEPiRIKVSkOoUejLZgUSSP8ycu0p4N9DB5+SLgZfktlwl8SpDu+GKHsH6f3bRlvrZ2hvS5zr71mGd2zHqYwA2vL/bNpLTEnCeAnzXuy+QqCkuJ705+A0uJGLQo4bMNGEkCzWlxIhVO3IxHfezK8hkvpOrWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509302; c=relaxed/simple;
	bh=KQRqQqIkuSUE9ycY5qUxlw64ZPkZLMhYU2UIckjsms8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lqFAgHCvIsSQAu3AJF8mwQYD/okDxyFx2Al9g3RwaCWkOtgdmve12GFN2qc82v5SplSdCW+V5vauzPSdyHQoOOG+PvhYfNAlxWVoQ9bGG+H3+BELhPPpfLJ+Tzpi9veiW9QBB0D5DHZDOUHBi7hB6Wts/g/6Mc1sroUylWELNkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Dy8tUrLI; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Dy8tUrLI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOOQ8kS1p6TAYmvXExZASmiL/pqjSbj+xC/17m3qlbETpo4w8cRsgV8C5eNVv/pK7KgZQ7L9EVJVi31+vKbU3IhDVEi7CUH7d+AWZ3GaQdC3C1+bJs3gC/btBgZsajOyGgFBis6S7dxWkVx7xY58G7xxvagt5AyAWziudQHdAKhN+6Zf3J6BfOj5BjI4SkhGqChuF3vzdTEOklMJ1RB+7WjqgZ9e6nanlv/1XM6SkSrrHEPC/WZxzdDJ2d2Y/DKrs6lJbnNyU/mugqSeiuTD2mGIyBzsHRv18KBSHkFbPmMCuRXp0biSNuLDnht28KfREqnNtd8lHDVxbXD4vVCKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKeTdaHEWPRT2Gla7efXO5YbupwCzedIFy61cmhs+fU=;
 b=xgj2gv3qRE2ezsiAPXX3/OPdTGb+7FYSeHyPoJqt+E5Ct+J2C6EikZsEq8lPdhxOivW1WEWD79QFZ5EXXga0SnuDQGBn5uSC9ZrlTSsqqe7enF8yM4ZhfQ/Pz7/z3bX5Hc8luYBwd4U4zZyOo44yO8imeodQHpQKzG/MopI/iFxahV4AQqDbTO01ZvX4bQRtSYOPT4LsN+JG+3irnonIwXGDQWHSgr27IwY2EJb6bfH8XL44HvTWLzUTeVmICxMFiyjSHFwfcG/T3ZzavSDDNrfE4dn8itxv3HE6qo7SfOTeprEfqVK/38Ya5vpKvl/RAvric0WeKFyfH88zaZhc2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKeTdaHEWPRT2Gla7efXO5YbupwCzedIFy61cmhs+fU=;
 b=Dy8tUrLIi6bymNJVhum+vzFsR6xrVNTMf6+mZTXUY1s+Xzd/IkqWDb1wQhUjV1JBv49lKvCDAEnSnNc1EWwVgf4OgPL9RjlLTsCDAmhNqmjWfN+Jkr5Sw9ReOe/b95/e9c0kUs2D9a3RqYBYbLuoq79WE7UDf1ExvgTR+KPrdxI=
Received: from BN9PR03CA0461.namprd03.prod.outlook.com (2603:10b6:408:139::16)
 by IA0PR12MB8905.namprd12.prod.outlook.com (2603:10b6:208:484::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 11:14:56 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::52) by BN9PR03CA0461.outlook.office365.com
 (2603:10b6:408:139::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26 via Frontend
 Transport; Mon, 21 Oct 2024 11:14:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 11:14:56 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:14:54 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v10 04/11] platform/x86/amd/hsmp: Move structure and macros to header file
Date: Mon, 21 Oct 2024 11:14:21 +0000
Message-ID: <20241021111428.2676884-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241021111428.2676884-1-suma.hegde@amd.com>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|IA0PR12MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f377841-85f9-4bd1-f14b-08dcf1c1985d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlNpU1loM0F4UGhQamxJZjVjV2FiQkNPeVhnVTJDcXJlL0g5WlJqRkp5SmlW?=
 =?utf-8?B?SGN2MkVPSTgyblBacFZXWDdqQ1hFTlNkaFZuby9WNitZcVhSdkhOeXUzb1Zy?=
 =?utf-8?B?ZWRNajZtR2hQOEIrWFI4d3ZZTEJpL3JJTFJiOEFnTWZ2VWhGQ0dCNk9FVkcw?=
 =?utf-8?B?YWlkMjJ1MXQ0cnJJem9KbGdMa3I4YncwUGE5Z3oycTRXZzNrTmlwUnFpVGla?=
 =?utf-8?B?TzVvbnlOZUVCMytUanFPMmwwVEJhdVl3cGFsSGlVWXdwcTg3UUFwZFhjQmE4?=
 =?utf-8?B?Y1p5VkdLLy9oRzl1amxkTi9SaTFuU2IwWmhFcW1EVWpFcFFBVVdZTzhaZklu?=
 =?utf-8?B?a3ZsR3JYR1BTRVZ4aFZZQ0VtOVAzTlFFbFZWb2lUdVJtcjlXeGJTaUpnNXo3?=
 =?utf-8?B?eXRkaEIwTTBtcEQyTGt6RnRDT0JiRnZZOGhhWVdDbEZJTU5OMlBtMDRWZmFs?=
 =?utf-8?B?Tmphd0FmYmFLVzlJUHo3dGtzdzJ3S3NpOXkzTHBhVnpFbzJMVVRxRndTZGpR?=
 =?utf-8?B?Z3JaSWd1VERnRXowcWY2cXgrMmpOaCtReUtEZTVaM3BnWDcwWk1LcHpKNytX?=
 =?utf-8?B?eGFYQ1Q0akI4TFR3Y1hJTENsQU1zTG9oSitQYjRyZFJzdlVCNnRwbmUvdEdP?=
 =?utf-8?B?MnlUVXEzNkxLbGZnYXJBWmhxdjVrenpBZ1E5V2pJM1hXOC9qT2dOMGNpUmJ3?=
 =?utf-8?B?VTIvYmhMSlVwejhRK1cyNm5lai90ZTE2eEw5SXlsU2FwWWU0RkFzREFaV0Y1?=
 =?utf-8?B?WElBUmdKSVZEV3RmbllPYjBHRlN6UmR6SkpzRHprWjZ3enVRQmUwcEVUT2FJ?=
 =?utf-8?B?WUxYOUtKL0RTVWIyK0U1SUFvQ2NPWEs3SS9xaXhUU2pYbkZLTTBCeDk1V3pL?=
 =?utf-8?B?SWZHVTZXWXNFelhGWEY5TU9INFBMQTRCVjR5TTdzTXYyU0JCNEZ2Zi8ySThn?=
 =?utf-8?B?YVB5UXA1WnVvK2dBeG5YbVVrWkpRU000WHhVbVNrdHFUYUoyb3NPeGtkYmhp?=
 =?utf-8?B?UGlGbytYWWQyK3RlbDZ3T1pYSi9Xc1dURzJCQ3JRcVpsQkc2TXZlNVgzODdE?=
 =?utf-8?B?RVFST2twSjBWY1ZXWkR3eXJtZXlBMDY1YVhNbHpzMHIzd2dKY1dwUjhJSklo?=
 =?utf-8?B?T1lMZ1M0T0ZmakdkVHo2dDlBY2JtY2lCVTlvUHpSdlFPNllFWDlESlZ2R25r?=
 =?utf-8?B?RllDSXBlMWQrSWdJKzc4SHNRZHViNHRJK2FXMUx0ZTJmL2JLN1JrSzBXRjlI?=
 =?utf-8?B?RlZMVHh5YVQ2RmhhM1lyQldSRmt4cVJPQTJNVFNkS0t1ZnRlL2dGMUcrdmRG?=
 =?utf-8?B?VkFwWERRRnh0MFhKS29ZTW9SV1pYd29CSkltSUU5dk1NNVBRSExxUmNET1Fo?=
 =?utf-8?B?TDVYU2ZWYXdWcXQ0THFaWWJweUJNNWYwRTUwMy81ZisrNHc2VGwxbk5XSjNW?=
 =?utf-8?B?eGxQeGJ5SlQxcTFyN1ExejlpZm5ucUFmTktXVjQ5SDNZY1VJb20wM1IrLzNQ?=
 =?utf-8?B?SlRmdm1xMnJRVXZOU3ZMbUJNWjBLQ3ZoOWtwTCs2VGZLN2NWM1N3OVR0d09P?=
 =?utf-8?B?VjEzdFE5Z3BVOVc0SWxEN1F1c0UwS1FNTFJWRGZrZFlldDZwUEgvNWFrS0ky?=
 =?utf-8?B?bTRXcTM2MFVqWTdwMVBoVWI3dnBnbmFFU0U5bzNqWHdvSFVuc1Rhci9aelJw?=
 =?utf-8?B?WE10bFpvTzM0VWk1aERzRThLZHVwaFZlWjRQMmsrTjFPN1RnYzRDK1FZV3VB?=
 =?utf-8?B?R3FWRnlRbUdFcGZvTjZnSW0vcjBqcnJaT3EzWnYwdUZZaWZvM0h1WHNJaHN0?=
 =?utf-8?B?Zm4zM3NjRjZvQkN5RmI2VkpQdlE0VnVXMUUwUnlzVFNDUVFMZSt0eVlqVU9l?=
 =?utf-8?B?NHhxYkcvY0RKeHJRT1RYVmZxUFo5SjEwYkhmN2MvRXkwdnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:14:56.6105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f377841-85f9-4bd1-f14b-08dcf1c1985d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8905

This is in preparation to splitting ACPI and platform device drivers.
No logical change, move common structures, macros to hsmp.h,
add missed header files, remove unwanted header inclusions,
and re-order the header file in hsmp.c file.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v9:
None

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

