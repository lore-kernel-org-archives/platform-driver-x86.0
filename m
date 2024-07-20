Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BB31EB40
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jul 2024 17:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721497594; cv=fail; b=bxcyEHof97l35jme4DCvLU9OD0KTI87ix/HEFa2tGl0P078hZDjJinP6EgCcG/kIyuLLB7cli5n5ZpmP5VIH/9K1sWWHChC6cttoaiZqxOEKUvNxPc5Lh6J59bRXpTgQgVVKjMpF83ab0otwBKYvJYi+tZMOhKjwvUVo72kE7cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721497594; c=relaxed/simple;
	bh=QYfIyi/B+2hU3/d2gIGwdu6DXy0t0RMxBR9qs9sBusQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uw5r/ZwZSfu5Lf76Y8hvAnj9xCxaDxh0mpf67Aks50z6pBg9qXiZPX3S3WHZqUDJVooVrVN6pcULvBgdqK6o8s4/4XgTnBilHAweOcU9kN7lsiUJDC4f4qY3cY3G4yH/7UyaURPfo9W9p4A94a97NWMwMjFIv7IAg6klmQHdaKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AFoObK3u; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AFoObK3u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jl9Dh1xsN6ijZ0UXRrpymibhzq+XR1GQdIaePpBmdUweF6GhGABBXttOmhtbu2iG3p2b1niRgZmF3+f3HtycPq6Y8ci02vNPAA0vD77b/xySinv5tTu9bV21lW46J8OEK6hisVPuMkJBpi5cfn20SnXUBFsAQ3MGFEJUlGArEFOYo2vA16fngQ61QntrRS6UBb2J6FyAO18MgTVdYXw6rLSTA45ZZCvhnQ9J2ZjrVaPnicu2nyqeE+c0quytxa/iT2274CqLMTlVxksSgmwZg/T4HKSBdcAEIthKQJQbAl4B/2IZNx6XUBauhvuMTiAEQvzJqHFitDBuKxZ7cz6Pqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgmxpaHx/Qi/fpo5F1g3XDumO4rUhG3gRWaz5Mzmkd4=;
 b=DGVFVtNR3fgVYOR1d8jHCpuORqPwf3Wg+OJrcx2ben/yxeVvmeMPXdsO/3/tzwuCDx6P+c+1aJeyVM75rx45cepfU1EkDOiB+sH3jDeb4HpYTOxR0viPnPOXarSyrTt72u7N7JzCWFc+uUuT0FAMgsbS7CKZ1AEur1zoOsLYYxgeHv/akzB6E/4lRBaosN+DfiadDql70aQxT4IrNlB7T/h1Ncb2nc0LIzJoj5BEqywaVNnUV3ZiIGwm2SCWHGo+O7A1xU0MY0jb78Mr4IqKY2bkXfSGU0LlLxkj2r0/PTc+1b883ZM041VQ5jNPUopXK4qusl+DFbcMW1OJ+p3qrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgmxpaHx/Qi/fpo5F1g3XDumO4rUhG3gRWaz5Mzmkd4=;
 b=AFoObK3ucV60sXGUMAqQ+S+USncjQ587K7dP/jC2ixPovpQ2DnYTfjXgZe5QjiYrBDAVJpjILDEg3wf+nme15IaV5RGxVUbxjR4JhB3h06DUsBF8bqp+HflhWBteFrs/YFcwFU/cCPy9Jn1ZlDyOXF1nYro84lVqmPRsQbZ/vxk=
Received: from DS7PR03CA0302.namprd03.prod.outlook.com (2603:10b6:8:2b::11) by
 SJ0PR12MB6967.namprd12.prod.outlook.com (2603:10b6:a03:44b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Sat, 20 Jul 2024 17:46:28 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:2b:cafe::8a) by DS7PR03CA0302.outlook.office365.com
 (2603:10b6:8:2b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Sat, 20 Jul 2024 17:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Sat, 20 Jul 2024 17:46:28 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 20 Jul
 2024 12:46:26 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v3 03/11] platform/x86/amd/hsmp: Move structure and macros to header file
Date: Sat, 20 Jul 2024 17:45:44 +0000
Message-ID: <20240720174552.946255-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720174552.946255-1-suma.hegde@amd.com>
References: <20240720174552.946255-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|SJ0PR12MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: 3746a8e5-7410-4121-3026-08dca8e3e22f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zjd6VVhOcitmZGxyOW1IVks2eHlVdU40aHhRaUdWOHltM1d1SWFNMzNZK1pC?=
 =?utf-8?B?bVZPelM0ODhQL3dmZXZZUHMyNHlMbTZVak1la3V0OGxkZUdhSFdBSFhXLzM1?=
 =?utf-8?B?c3dkR1ZOeGpmQ0dybmxvZ3lEZDRXRHRZMjQ3Zm5tZEovRDkvRlUwMkVQN0Zj?=
 =?utf-8?B?Uzk4Ym9hNkpmUVhGL1FWUFRVeitmZ0IrSFE3MmZhL3UyMXpudVZTeFhHc3Qw?=
 =?utf-8?B?TXZVRFl4aTAwSlJrSEhrRUZ3TjVhNDAyMnBPZksyYnRkOXhtNHNDL2hMYmty?=
 =?utf-8?B?RURDODQrdkRlRXpXU1BrUlV3eThLQUdGandPeUhPNWloL0FWRVV5Y3BVTGtw?=
 =?utf-8?B?NjVvSFN0c3BEVW91THVaTVlzNTg5VnA3RElMMUl0TS9zWmJQM2hoaUtOQXJB?=
 =?utf-8?B?a1Z0UndWNHMySHdYemEzeGU5Zi96akVsSCtkRzhVdGV4M1R1cEJmMkRXZk5O?=
 =?utf-8?B?NGZscTNGczV3Z3dmU2N5eGlqWEdzUklhZVVNNUZWWGtaUHExUXdSSDNOenZR?=
 =?utf-8?B?bUxtZmh2RytGSVlzSjROZGkxR0xXcjFmV2xDOUVvMURsRjlEWXBjaE95ZEVj?=
 =?utf-8?B?b2RyblRocUVkNTdod2wwTlNQUDg3aFNldCs2RjlmMXVIaHJlSGo0cEo2MHor?=
 =?utf-8?B?NGNoMk1uUENuczJGNXo1eFY5OFJqdUF4WHVnbTlPc1RFSmVickwvTCtsNlB0?=
 =?utf-8?B?Q0pVMzRwdXBycENLTjVWbDh2UGVwZkF1OWJrZUZ0bXkxYVVVQm5QVzFDWXJk?=
 =?utf-8?B?MVpIdUFIS1N1dWJTcGpra3NCSVV3Nkp1WTkzcDBwa04yRjhhYlpHbkRSQ0NV?=
 =?utf-8?B?eXJlbFhmYmMzRXhjdDlGbXBsU20wSEN2c2pRWHFSKzRua1RveUxWT1h4Zmhl?=
 =?utf-8?B?bnd0NXUrRXQ4RHFhaytnZGk3YzVqcGU0K0NRcXl4OVFUeFJvM2tjM1ZoQnlF?=
 =?utf-8?B?MVFscTE5YWlZcUQ3aEFKTytCaVdqaEF5WmpHb2pBQ2hIckgzTW1CcW8zZmJI?=
 =?utf-8?B?VDhNUTB2bEgrNHkwV0VmQk9RNTRPV3NabSs0WUhaK0lLdGRoa2dNOThYZ2E2?=
 =?utf-8?B?Y05WWEZOaTlPMTB1cVd4UGtjK2duS1llaWN0MjMwY2c5RnpiMEpTTnNPYVBK?=
 =?utf-8?B?QktrVVZlTXA3MDBINTltTkVPbEx4Mml3dGFkdVJpNkFVaGZvb3luYWg1NWgy?=
 =?utf-8?B?eEpOQTQrQUNTOUZ6OTQzcE1NZWUrcHZaNHVEMy9zNmNRM2l1ZElTWE5uM1hF?=
 =?utf-8?B?YXB2SGI2SlQrekFhYTlNT3lTNWx5KytiUVFUd0tkTzg5d0VBb0xVaWp4NTBx?=
 =?utf-8?B?N0VocXljVFJrQVhYYVllQThHcXZOK29iRTRtVWh6aHFHQS9iKzBoMldwNTlR?=
 =?utf-8?B?Z0xqcHVKYWhUbjJxODlYT0p3ci8rQVNyblk5Nm5HM1ppQUFxdFVyWk14RmdJ?=
 =?utf-8?B?TE5IUXl2aFQ0a25RNzJOMVhPTWNKYkpQeW1Id0tSNElia3F0bm9TR1JuMmdX?=
 =?utf-8?B?UmZNU2pGM0h3YlRkVDVoL2VEeXpoTE5vVzNheldtbHVzSllDNEdqdmVvZ2FR?=
 =?utf-8?B?NFFVRStrWFNGMG5kT0lRNkx4OGNYKzkyeE80dXZKRkFYb0w4TDhmb01oNjJ4?=
 =?utf-8?B?R2tFbE1kcjYxS1lGVWFIODQwUzNHN3pwa1F6TGpXT0Uyb1lkMFkwUnd2TzMz?=
 =?utf-8?B?R1hDRFFQYUhEeTdrODlvYjV0R250cFgyMnJJYWRJb0oxdVorR2lEVGNiMmhM?=
 =?utf-8?B?b3NVUXlob0VRNHdWR3JjdG5lVk5rckprZHhHQWoyamVsUnJTQ2tXQWVVU2w5?=
 =?utf-8?B?T09rajAxS2k4UnRnUnMwYVVSS0pqODdEMzBBQXdrUHViVzJCaHdDMEpQekpP?=
 =?utf-8?B?L0N3OHV5RDRNRGhuRmtXd2lTNDYwWUhJTy9TdWk0bzE5YVdpV3d0WnAvN3pP?=
 =?utf-8?Q?0/b0T8PimvIvvpqSyFotivSMtL83evRb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 17:46:28.4459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3746a8e5-7410-4121-3026-08dca8e3e22f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6967

This is in preparation to splitting ACPI and platform device drivers.
No logical change, move common structures and macros to hsmp.h

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v2:
None
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

