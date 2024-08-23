Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5E213DB88
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724399783; cv=fail; b=fzLS85QRoXnLT6s+8qHJvT2YughabCYmjsZjY3eT7hm9QZuiFNFMit6yCcRb/BNXHiOgYTLKaoLFncPtpcusAixV1MldrN3vx3tgDEVxIi8bdVUhjXJSgGJBWExG3tIOtUJkmvIfS+nXjVij4MAW8RczkHP0niFqXh+0Tr+MtMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724399783; c=relaxed/simple;
	bh=y3CqlUwL4IwleZVeabaoIbWhVJxgteNaz6lUALgW0gw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PrrJ3ajGJiZDhCeU9KkZeMKLSiZcGV29fZf07Jk3FbQrw+n9AOkzqJ6BfZIqtBkZk/8HqNIVDlCyrkytgApG1HeoSIMzJM/7sFNMKQ9FwBJQmF4goZ3NQTKvuM12mroWShZLYCAha8Dvlmvhg1t2ImX6wla0W1AeI7YlwH30n5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BranNvS1; arc=fail smtp.client-ip=40.107.93.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BranNvS1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJeSJenMFWDr4znU+9xvgn+ZOXIIVSr+J5vAFYGts7QhOZg2aVYciaKpfBa1znAd6M0xw6uoMK62rCqI0yprxwFWieop+hc283hV1dRRPZFptpQEWxmuLGq7/TyZISjWeTl36+zG0sS0Q3Rg2AJVla8aMtj/cQDby+kDN4CkMvY1/MXbxQllfRAle786liasYhdF7Cki/loasX4aYTMATqeOWGuxwgq0yt8T8khVBJ4/883yZgilVlBdtR3K/slp/JstsNPS4HMndZJFSybKzsbCzALwSMkjDqZ42BjZXA7OaD6iiMBynOo6isgLBY9hkdeKSXtx7A9zhaaJ79OCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0je3L/N2wl4rn1QvZ8dwhWrJeIwpbN4AD9PMXioBrU=;
 b=B2cVH8cE8JwGRQcxTX/Vcc1JGMmWcGwTPWtk4W6e+q3x/EPd3dVE5u/Z0k5nv7ELmgkbSy4r6fXfgrdGUhJdamhGOuLumACDnfO2Uy7e+0yI6eiA7s/McWD4X4KldF3+b9oS/jEqwpgihDCALsUFVAQ8AN1mplZ07sNp60YEfChjgb6/e5B/kqfburfPYYlsf6FLMc4/LlcAE+BolO3gwWY1Ap+SlUouysZfdDX//xQEsuBrwBlk1xPrasWESAOe9+QuMeMbtw0kIrR4+OnUC5Oz2IQuO+CVTEXalpZyEvUECfj42SMHZ3YKeysGnRkVPw4Eo7uVFT1sbDlDg30T+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0je3L/N2wl4rn1QvZ8dwhWrJeIwpbN4AD9PMXioBrU=;
 b=BranNvS1FR6vew17AInsqcYUUk2Rm1yDaZT9OFNTm98b3auJyGDLB2uaSQgyNkaZUY2/nKU/IKd7bg0VvgJhwIeLab8nB2o1QHLHExo8IPGURIiwxZFP7vnR1BZB5lM/Baio/TlsS07BabmgBTfsf+cEdoffIoPmIMECdD1gyxU=
Received: from SA1P222CA0035.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::10)
 by PH7PR12MB9068.namprd12.prod.outlook.com (2603:10b6:510:1f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 07:56:15 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::d9) by SA1P222CA0035.outlook.office365.com
 (2603:10b6:806:2d0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Fri, 23 Aug 2024 07:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 07:56:14 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 02:56:12 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v5 06/11] platform/x86/amd/hsmp: Move ACPI code to acpi.c
Date: Fri, 23 Aug 2024 07:55:38 +0000
Message-ID: <20240823075543.884265-6-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|PH7PR12MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: 08dfbaf0-2340-41e6-c0aa-08dcc3491026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHhvWHNiTTRCZjQwSjRTYzVJNTVkeFhmK0pMeDNpWVdzT1dCMDhLbmdrUjFU?=
 =?utf-8?B?L1loTkJ6YkFSNVpERXBOUWtqVFN6UnFVNTNTQ3VTWXJjRzZhanlnb05vMU9z?=
 =?utf-8?B?Ky9rNWRNSXMxQXBzdXdMckxuZ0lRUyswZGpiM0NwdGxZTjBYNXlWR2hONWRp?=
 =?utf-8?B?MEtRTnhYVi9aVHVWUUwvbWxKeXJ3NGV4Z0dvRHNkVktGV2U1bk1hcUgzNUJB?=
 =?utf-8?B?Vkx6UEVDQVJrZDdoMGFTckQ4a2s5ZThIdzcvQWU4bUJKL0V2ZC9ybzFhZnYz?=
 =?utf-8?B?RWxaQ09UcEVsZWc4UkM3dzYvejlUUHdSQ2laenI0emlmZUp3Qk5ZRTB2bWdG?=
 =?utf-8?B?UVlaaTFpbHo0SGkyakZrRzdHbk9QcVFsZVFWS0NyemdSckNJU2ZsZ1hCRXJi?=
 =?utf-8?B?VnlOeFNNT0FJZnFya1hNd2ZRZDBkbmRCL01OYVhBUmpQMUQ0UGVSNDFaY3Zn?=
 =?utf-8?B?dG1UOUNFdW5kci9IQVVIcmFSZEZQRVk3Y3FpMHo4MUpCVEtuc2dMVHFDVkx0?=
 =?utf-8?B?OXhwUzZMSlA5YUUwNjl4U1BqTXN6M0FvUExjb2krVXg2QzVTN0tXM3hKeElE?=
 =?utf-8?B?MncwK01NdlBkWW1zdGcwL0JKaFJ6cDVrbmlYR1Zvc1VUL2VpSlY5Tnk0cWhE?=
 =?utf-8?B?TDNiNGhZRGVsZzhEeG94SnJOR0RvT1p3MnAxcTNLaHZoRWlMcnVQVHF6VGRr?=
 =?utf-8?B?bXMyR0xWdmhFRGlaQitYdVE3Rnc4d2l1S3Frano1cW5zS0VScjVsUUVrU05T?=
 =?utf-8?B?Z1BiUnZ3ZXcwZGt4aXN1YWNHckVKRkhFZkNQNHFzemw3Nno2OHgxT0IvdU1a?=
 =?utf-8?B?d2t3TmF5Q3FLQy90aEkwK0VYM0dITFkzUWxFOTlNeUhhY05nM1lUOUNtK3JT?=
 =?utf-8?B?L00wRHVTeGllNlFrdVZQU1haQXVRS2NybWVGa2RIdUxqaWszcGYrcWtHQUEr?=
 =?utf-8?B?WXEwazRoYU50cmE2T29MaXh1ZkRXZXpObFdXaWdMcjV5WmYrWWhVV0tyT1RY?=
 =?utf-8?B?WEFIcVNmYU5kYkVoZ21QSkNHYWZaZzdlQmFUTWdWNzNiRzE5ZTk1eWlYT1VQ?=
 =?utf-8?B?UmZRYTJhakFOK0JWWVRsTkpwd0VoUzd0MjNhRUdVM1RvblFJMDdudHV0Y3Fj?=
 =?utf-8?B?ZFNQY0VnckJJaU5sMXNFcFlSMy8zdUdobjJSRTNRRXFlRzVoV1prMVdZeEVF?=
 =?utf-8?B?cWRxS3BmV1V4V1lGNFhnQThQRHpncWxHaVFLNWdFeUZ4cFdIakFVckMvTnV3?=
 =?utf-8?B?dHcyeThZZ01CbysrRjdUOUZEZVBGQ2h4QUVYbi9NK3E5WmFpenVMT0FIOVNY?=
 =?utf-8?B?dEp2dVY4d2MrU2FUdng1MzRMTEcya1NPaWtxdkc4SUUwR0VuYkd5ZkZLNEZ4?=
 =?utf-8?B?WHZDV2pjU0pCUFd1c1owUUh1TkV4a2xPSmtKU1YwRS9RUlZueUhmNmluejhn?=
 =?utf-8?B?WkhZdmVjeWU2K2RYS1B6Q3dSdjI3U1hkcVN0cGZGaFZ1OG9CQloxVVlqQUVt?=
 =?utf-8?B?S29XaGREZ2lYYngwN20vRUhwZXBneDNjTyswWEYyanoxRCs5WU9KYUgrcHpm?=
 =?utf-8?B?bm1XTThCVERyazg3QWUxVVpQY09yUDJ5UTBud1lFd1RNTXdvd2g4N3Q3anc2?=
 =?utf-8?B?aFhROVg2N2VDQytKYlkrUmlQMktRZ05OSUpTZnE2aFpqSStua0dmZDZBVzJv?=
 =?utf-8?B?WmpSMmR3MU5CMTJGTWJLN0FET1NnL3JPOGRXVGxidmptTTcxNk1EOURYc2Y5?=
 =?utf-8?B?SGhUSVg0YkRBYXhkZ3pRa0hIUG5vYUZ0anJjRDc0eFRVSlBoUFpqV1E0eFpC?=
 =?utf-8?B?Y2ZJQVNaWU5wdEZpTUtvVXNzM2tRQmRWclVZOUQ4OVZUQTBLT1Btem11Tm00?=
 =?utf-8?B?aE0ycWJZUGExcmt3ZFpvVzJtcGRDZWZ5ek1tZFVoZXFab3RYSEdtcDcxWXBt?=
 =?utf-8?Q?YrhK/zjm5ySl2uZ0tgcYwOSBpKNZiI90?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:56:14.9990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08dfbaf0-2340-41e6-c0aa-08dcc3491026
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9068

An upcoming change splits HSMP driver into ACPI and platform device
variants. Prepare for the split by moving ACPI related code
to acpi.c from hsmp.c. Common code is kept in hsmp.c.

No logical/functional change.
We still have one driver at this point,
the driver probe will be split in the next patch.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v4:
1. Update commit description.
2. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"

Changes since v3:
1. File header content is modified.

Changes since v2:
None

Changes since v1:
1. Add following headers in acpi.c
	#include <linux/device.h>
	#include <linux/dev_printk.h>
	#include <linux/ioport.h>
	#include <linux/kstrtox.h>
	#include <linux/uuid.h>
	#include <uapi/asm-generic/errno-base.h>

 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 272 +++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c   | 250 -----------------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |   2 +
 4 files changed, 275 insertions(+), 251 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/acpi.c

diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
index fb8ba04b2f0d..0cc92865c0a2 100644
--- a/drivers/platform/x86/amd/hsmp/Makefile
+++ b/drivers/platform/x86/amd/hsmp/Makefile
@@ -5,4 +5,4 @@
 #
 
 obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
-amd_hsmp-objs			:= hsmp.o plat.o
+amd_hsmp-objs			:= hsmp.o plat.o acpi.o
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
new file mode 100644
index 000000000000..61c072216fb7
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides an ACPI based driver implementation for HSMP interface.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/ioport.h>
+#include <linux/kstrtox.h>
+#include <linux/sysfs.h>
+#include <linux/uuid.h>
+
+#include <uapi/asm-generic/errno-base.h>
+
+#include "hsmp.h"
+
+/* These are the strings specified in ACPI table */
+#define MSG_IDOFF_STR		"MsgIdOffset"
+#define MSG_ARGOFF_STR		"MsgArgOffset"
+#define MSG_RESPOFF_STR		"MsgRspOffset"
+
+static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+			      u32 *value, bool write)
+{
+	if (write)
+		iowrite32(*value, sock->virt_base_addr + offset);
+	else
+		*value = ioread32(sock->virt_base_addr + offset);
+
+	return 0;
+}
+
+/* This is the UUID used for HSMP */
+static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
+						0xa6, 0x9f, 0x4e, 0xa2,
+						0x87, 0x1f, 0xc2, 0xf6);
+
+static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
+{
+	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
+		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
+
+	return false;
+}
+
+static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
+{
+	char *uid;
+
+	/*
+	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
+	 * read it and strip the "ID" part of it and convert the remaining
+	 * bytes to integer.
+	 */
+	uid = acpi_device_uid(ACPI_COMPANION(dev));
+
+	return kstrtou16(uid + 2, 10, sock_ind);
+}
+
+static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
+{
+	struct hsmp_socket *sock = data;
+	struct resource r;
+
+	switch (res->type) {
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		if (!acpi_dev_resource_memory(res, &r))
+			return AE_ERROR;
+		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
+			return AE_ERROR;
+		sock->mbinfo.base_addr = r.start;
+		sock->mbinfo.size = resource_size(&r);
+		break;
+	case ACPI_RESOURCE_TYPE_END_TAG:
+		break;
+	default:
+		return AE_ERROR;
+	}
+
+	return AE_OK;
+}
+
+static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
+{
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *guid, *mailbox_package;
+	union acpi_object *dsd;
+	acpi_status status;
+	int ret = 0;
+	int j;
+
+	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
+					    &buf, ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status)) {
+		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
+			acpi_format_exception(status));
+		return -ENODEV;
+	}
+
+	dsd = buf.pointer;
+
+	/* HSMP _DSD property should contain 2 objects.
+	 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
+	 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
+	 *    This mailbox object contains 3 more acpi objects of type
+	 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
+	 *    these packages inturn contain 2 acpi objects of type
+	 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
+	 */
+	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
+		ret = -EINVAL;
+		goto free_buf;
+	}
+
+	guid = &dsd->package.elements[0];
+	mailbox_package = &dsd->package.elements[1];
+	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
+		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
+		ret = -EINVAL;
+		goto free_buf;
+	}
+
+	for (j = 0; j < mailbox_package->package.count; j++) {
+		union acpi_object *msgobj, *msgstr, *msgint;
+
+		msgobj	= &mailbox_package->package.elements[j];
+		msgstr	= &msgobj->package.elements[0];
+		msgint	= &msgobj->package.elements[1];
+
+		/* package should have 1 string and 1 integer object */
+		if (msgobj->type != ACPI_TYPE_PACKAGE ||
+		    msgstr->type != ACPI_TYPE_STRING ||
+		    msgint->type != ACPI_TYPE_INTEGER) {
+			ret = -EINVAL;
+			goto free_buf;
+		}
+
+		if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
+			     msgstr->string.length)) {
+			sock->mbinfo.msg_id_off = msgint->integer.value;
+		} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
+				    msgstr->string.length)) {
+			sock->mbinfo.msg_resp_off =  msgint->integer.value;
+		} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
+				    msgstr->string.length)) {
+			sock->mbinfo.msg_arg_off = msgint->integer.value;
+		} else {
+			ret = -ENOENT;
+			goto free_buf;
+		}
+	}
+
+	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
+	    !sock->mbinfo.msg_arg_off)
+		ret = -EINVAL;
+
+free_buf:
+	ACPI_FREE(buf.pointer);
+	return ret;
+}
+
+static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
+{
+	acpi_status status;
+
+	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
+				     hsmp_resource, sock);
+	if (ACPI_FAILURE(status)) {
+		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
+			acpi_format_exception(status));
+		return -EINVAL;
+	}
+	if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
+		return -EINVAL;
+
+	/* The mapped region should be un-cached */
+	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
+					       sock->mbinfo.size);
+	if (!sock->virt_base_addr) {
+		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/* Parse the ACPI table to read the data */
+static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
+{
+	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
+	int ret;
+
+	sock->sock_ind		= sock_ind;
+	sock->dev		= dev;
+	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
+	plat_dev.is_acpi_device	= true;
+
+	sema_init(&sock->hsmp_sem, 1);
+
+	/* Read MP1 base address from CRS method */
+	ret = hsmp_read_acpi_crs(sock);
+	if (ret)
+		return ret;
+
+	/* Read mailbox offsets from DSD table */
+	return hsmp_read_acpi_dsd(sock);
+}
+
+int hsmp_create_acpi_sysfs_if(struct device *dev)
+{
+	struct attribute_group *attr_grp;
+	u16 sock_ind;
+	int ret;
+
+	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
+	if (!attr_grp)
+		return -ENOMEM;
+
+	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
+
+	ret = hsmp_get_uid(dev, &sock_ind);
+	if (ret)
+		return ret;
+
+	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
+	if (ret)
+		return ret;
+
+	return devm_device_add_group(dev, attr_grp);
+}
+
+int init_acpi(struct device *dev)
+{
+	u16 sock_ind;
+	int ret;
+
+	ret = hsmp_get_uid(dev, &sock_ind);
+	if (ret)
+		return ret;
+	if (sock_ind >= plat_dev.num_sockets)
+		return -EINVAL;
+
+	ret = hsmp_parse_acpi_table(dev, sock_ind);
+	if (ret) {
+		dev_err(dev, "Failed to parse ACPI table\n");
+		return ret;
+	}
+
+	/* Test the hsmp interface */
+	ret = hsmp_test(sock_ind, 0xDEADBEEF);
+	if (ret) {
+		dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
+			boot_cpu_data.x86, boot_cpu_data.x86_model);
+		dev_err(dev, "Is HSMP disabled in BIOS ?\n");
+		return ret;
+	}
+
+	ret = hsmp_cache_proto_ver(sock_ind);
+	if (ret) {
+		dev_err(dev, "Failed to read HSMP protocol version\n");
+		return ret;
+	}
+
+	return ret;
+}
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 6da7c6189020..573867c17fd5 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -39,24 +39,8 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-/* These are the strings specified in ACPI table */
-#define MSG_IDOFF_STR		"MsgIdOffset"
-#define MSG_ARGOFF_STR		"MsgArgOffset"
-#define MSG_RESPOFF_STR		"MsgRspOffset"
-
 struct hsmp_plat_device plat_dev;
 
-static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
-			      u32 *value, bool write)
-{
-	if (write)
-		iowrite32(*value, sock->virt_base_addr + offset);
-	else
-		*value = ioread32(sock->virt_base_addr + offset);
-
-	return 0;
-}
-
 /*
  * Send a message to the HSMP port via PCI-e config space registers
  * or by writing to MMIO space.
@@ -306,182 +290,6 @@ static const struct file_operations hsmp_fops = {
 	.compat_ioctl	= hsmp_ioctl,
 };
 
-/* This is the UUID used for HSMP */
-static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
-						0xa6, 0x9f, 0x4e, 0xa2,
-						0x87, 0x1f, 0xc2, 0xf6);
-
-static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
-{
-	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
-		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
-
-	return false;
-}
-
-static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
-{
-	char *uid;
-
-	/*
-	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
-	 * read it and strip the "ID" part of it and convert the remaining
-	 * bytes to integer.
-	 */
-	uid = acpi_device_uid(ACPI_COMPANION(dev));
-
-	return kstrtou16(uid + 2, 10, sock_ind);
-}
-
-static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
-{
-	struct hsmp_socket *sock = data;
-	struct resource r;
-
-	switch (res->type) {
-	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
-		if (!acpi_dev_resource_memory(res, &r))
-			return AE_ERROR;
-		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
-			return AE_ERROR;
-		sock->mbinfo.base_addr = r.start;
-		sock->mbinfo.size = resource_size(&r);
-		break;
-	case ACPI_RESOURCE_TYPE_END_TAG:
-		break;
-	default:
-		return AE_ERROR;
-	}
-
-	return AE_OK;
-}
-
-static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
-{
-	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *guid, *mailbox_package;
-	union acpi_object *dsd;
-	acpi_status status;
-	int ret = 0;
-	int j;
-
-	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
-					    &buf, ACPI_TYPE_PACKAGE);
-	if (ACPI_FAILURE(status)) {
-		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
-			acpi_format_exception(status));
-		return -ENODEV;
-	}
-
-	dsd = buf.pointer;
-
-	/* HSMP _DSD property should contain 2 objects.
-	 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
-	 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
-	 *    This mailbox object contains 3 more acpi objects of type
-	 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
-	 *    these packages inturn contain 2 acpi objects of type
-	 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
-	 */
-	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
-		ret = -EINVAL;
-		goto free_buf;
-	}
-
-	guid = &dsd->package.elements[0];
-	mailbox_package = &dsd->package.elements[1];
-	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
-		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
-		ret = -EINVAL;
-		goto free_buf;
-	}
-
-	for (j = 0; j < mailbox_package->package.count; j++) {
-		union acpi_object *msgobj, *msgstr, *msgint;
-
-		msgobj	= &mailbox_package->package.elements[j];
-		msgstr	= &msgobj->package.elements[0];
-		msgint	= &msgobj->package.elements[1];
-
-		/* package should have 1 string and 1 integer object */
-		if (msgobj->type != ACPI_TYPE_PACKAGE ||
-		    msgstr->type != ACPI_TYPE_STRING ||
-		    msgint->type != ACPI_TYPE_INTEGER) {
-			ret = -EINVAL;
-			goto free_buf;
-		}
-
-		if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
-			     msgstr->string.length)) {
-			sock->mbinfo.msg_id_off = msgint->integer.value;
-		} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
-				    msgstr->string.length)) {
-			sock->mbinfo.msg_resp_off =  msgint->integer.value;
-		} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
-				    msgstr->string.length)) {
-			sock->mbinfo.msg_arg_off = msgint->integer.value;
-		} else {
-			ret = -ENOENT;
-			goto free_buf;
-		}
-	}
-
-	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
-	    !sock->mbinfo.msg_arg_off)
-		ret = -EINVAL;
-
-free_buf:
-	ACPI_FREE(buf.pointer);
-	return ret;
-}
-
-static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
-{
-	acpi_status status;
-
-	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
-				     hsmp_resource, sock);
-	if (ACPI_FAILURE(status)) {
-		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
-			acpi_format_exception(status));
-		return -EINVAL;
-	}
-	if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
-		return -EINVAL;
-
-	/* The mapped region should be un cached */
-	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
-					       sock->mbinfo.size);
-	if (!sock->virt_base_addr) {
-		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
-		return -ENOMEM;
-	}
-
-	return 0;
-}
-
-/* Parse the ACPI table to read the data */
-static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
-{
-	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
-	int ret;
-
-	sock->sock_ind		= sock_ind;
-	sock->dev		= dev;
-	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
-	plat_dev.is_acpi_device	= true;
-
-	sema_init(&sock->hsmp_sem, 1);
-
-	/* Read MP1 base address from CRS method */
-	ret = hsmp_read_acpi_crs(sock);
-	if (ret)
-		return ret;
-
-	/* Read mailbox offsets from DSD table */
-	return hsmp_read_acpi_dsd(sock);
-}
-
 ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 			     struct bin_attribute *bin_attr, char *buf,
 			     loff_t off, size_t count)
@@ -590,29 +398,6 @@ int hsmp_create_attr_list(struct attribute_group *attr_grp,
 	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
 }
 
-static int hsmp_create_acpi_sysfs_if(struct device *dev)
-{
-	struct attribute_group *attr_grp;
-	u16 sock_ind;
-	int ret;
-
-	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
-	if (!attr_grp)
-		return -ENOMEM;
-
-	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
-
-	ret = hsmp_get_uid(dev, &sock_ind);
-	if (ret)
-		return ret;
-
-	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
-	if (ret)
-		return ret;
-
-	return devm_device_add_group(dev, attr_grp);
-}
-
 int hsmp_cache_proto_ver(u16 sock_ind)
 {
 	struct hsmp_message msg = { 0 };
@@ -645,41 +430,6 @@ static bool check_acpi_support(struct device *dev)
 	return false;
 }
 
-static int init_acpi(struct device *dev)
-{
-	u16 sock_ind;
-	int ret;
-
-	ret = hsmp_get_uid(dev, &sock_ind);
-	if (ret)
-		return ret;
-	if (sock_ind >= plat_dev.num_sockets)
-		return -EINVAL;
-
-	ret = hsmp_parse_acpi_table(dev, sock_ind);
-	if (ret) {
-		dev_err(dev, "Failed to parse ACPI table\n");
-		return ret;
-	}
-
-	/* Test the hsmp interface */
-	ret = hsmp_test(sock_ind, 0xDEADBEEF);
-	if (ret) {
-		dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
-			boot_cpu_data.x86, boot_cpu_data.x86_model);
-		dev_err(dev, "Is HSMP disabled in BIOS ?\n");
-		return ret;
-	}
-
-	ret = hsmp_cache_proto_ver(sock_ind);
-	if (ret) {
-		dev_err(dev, "Failed to read HSMP protocol version\n");
-		return ret;
-	}
-
-	return ret;
-}
-
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int ret;
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index d59a9efb4799..f465600cb843 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -62,6 +62,7 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 			     struct bin_attribute *bin_attr, char *buf,
 			     loff_t off, size_t count);
 int hsmp_create_non_acpi_sysfs_if(struct device *dev);
+int hsmp_create_acpi_sysfs_if(struct device *dev);
 int hsmp_cache_proto_ver(u16 sock_ind);
 umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 				  struct bin_attribute *battr, int id);
@@ -69,4 +70,5 @@ int hsmp_create_attr_list(struct attribute_group *attr_grp,
 			  struct device *dev, u16 sock_ind);
 int hsmp_test(u16 sock_ind, u32 value);
 int init_platform_device(struct device *dev);
+int init_acpi(struct device *dev);
 #endif /* HSMP_H */
-- 
2.25.1

