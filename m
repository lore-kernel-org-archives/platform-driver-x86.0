Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7341E5731
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729509308; cv=fail; b=CgfD8lg9QaNVxhZQmxwjj1XJIZXPRo9UdaEQHBux2h9BlVuSI60+u9wXQC4IbkPP/2a0hQOuQ2JC0kaQlX0qlREdzuf23o46wfROJPIt24FTmse/0UamNhvV3zMGkWcs0RovyzJ5o2lRdB2j8Fl/zuQZxWiuhWlz1VmCL+wJIX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729509308; c=relaxed/simple;
	bh=w8eIhX7q8aB1AP6XugwKYvlBOCgGJRpBG3Xhm7sI8ko=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=guWf0obGZTWspuvofgAK+TcCnBnxHiyh0lPJ16L3N5hQNH1zkgLHRverrAEhLlmUSdN/97s+xs11UIKL10/7VxuilJk4G4IoU5nojyRWRERcRWzjE+ns+46JgA/N+iaQxmh/cUzNjTLQ2B3NYriqET8MzwfMe0Dpwg+SFTOFMOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4pG+BVAh; arc=fail smtp.client-ip=40.107.93.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4pG+BVAh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRHx4mz5nHqy038/TLmIHCyyH3beg10rps6O13OZXkltlCXg8XH3gA/0oYQG6N4wNdqgecURZPnF9hO6k3od/rLyEcs/eEQtnZwBOhJAi2PU4XX90L6QoUc5HkR4ye7aXZE8XJRR+gB9yKHNVVRxfChRX09Neq50rIP+R+8BCZleZkMF1Vh0HhmBhMozeAd0ptbEDJHa8OkCTEu6vTEV9KeQGCzLf+28mLB3NJuwqyIq097Ii/DFwI9RyPfqcFFyRHfioawqNK9XFCkMcvi6Az9snyfSUfAdZ/sw7UXprUl+OyMdcmlNfV4JviI1UVYBnX81WE6RGrUbRpAUo8fzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tdGOf2/Sp1WRbQo9tog+SVZOqz86an92iw7dBVfZ6Q=;
 b=sY7e1cAzA5t8F8q7lUQNcTiGLyEJYe8T2hGu+fwjzsjHWiFMkyTDenNGD7xyGtCfHmZH7xQxOW58RUP8dCrAibIB1R3YbSNFsmd5GiGPtDJSLFkxwVF0u1YvsYOdna8h8LvbW4OJWrw97fm0cke2dPwgk3O2y1ZgIR4H7BwBLhajdgxqs8kRWXWUhPcSb53b2U9Gv/FWAQYg3fxV79c5Jt6G9JB9MOt7i37KApPmdblZ52K1mnJOdbZXBYxYn7lzSQGIy5YbUWlE/8n/X8Jn7QzoKK+gd4W1MLqtwteRaIf1WFWuiu5syU0cPRe5f+ENaVO3J+McyXL1wvQL3ALFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tdGOf2/Sp1WRbQo9tog+SVZOqz86an92iw7dBVfZ6Q=;
 b=4pG+BVAhY+qZ0v8eof2n4LjF0XzN6lsKyQenkOyx4PQLBJ1Puvytzgb9lWFDv+5nqC7Kvs1zyYcqB3R/0fLuDap61CCC1xmfBi2At/TG5xPgM58qha7NC3afURZTwpinySbtbPTB/XTlP5+fX1yOhKQK4Y+UXsWubljf2+aikDs=
Received: from BN0PR03CA0012.namprd03.prod.outlook.com (2603:10b6:408:e6::17)
 by MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Mon, 21 Oct
 2024 11:15:01 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::b9) by BN0PR03CA0012.outlook.office365.com
 (2603:10b6:408:e6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28 via Frontend
 Transport; Mon, 21 Oct 2024 11:15:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 11:15:00 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 06:14:58 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v10 06/11] platform/x86/amd/hsmp: Move ACPI code to acpi.c
Date: Mon, 21 Oct 2024 11:14:23 +0000
Message-ID: <20241021111428.2676884-6-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|MW4PR12MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a800211-343d-4cc7-003c-08dcf1c19ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2FLdU41eWZXeUxMTUdFUkliNW5rcmt0WU5QY1E3OE1kTWwxR3J1QStYWGZo?=
 =?utf-8?B?N2dheFpTUjZnc3hXRm5tRXlZcGtaSHcveXU4bTV2S3FXc2QrVzVwWTJNVkhC?=
 =?utf-8?B?ZmkxWFg1K2Q4NFhpR3BlbHpGQTFzRUZlMVlXdUhtN25MS29vMHV6d2EwOHdi?=
 =?utf-8?B?N05JbWNyTEJISERQKzN4TW4yanBXcDYwY0FrN09EbHgxZDJHbkI0RTQvVFV4?=
 =?utf-8?B?R1ZaVU42WmM1bUhQZ01TMVAyRUVyc3pUV1hvRmRFOC9FYkFMTy9CWklXMk9s?=
 =?utf-8?B?d1czak9va3BLeXppMHRESE91VVFHN3hROVFsb1ZoeXNRalpNNWJzd0s4NHE2?=
 =?utf-8?B?alBKU205MlNJZFJLSGRqTktaTU42aUsvVWNqaXNnQ3FEWk51NEgweEMvQmo5?=
 =?utf-8?B?N2FzVUQ0d0VtY2Rrd21nSU8rZm96dGordXhaWExZZFdTRStNQmw2amIzQzg1?=
 =?utf-8?B?cFBPYlZoUC9EUHpORzFGdm8rMDN1eWUvQUVhSWMra004T3YrR0hpMUNBWWlv?=
 =?utf-8?B?WkpXci96bFRQekJpWUJ2TWhCSW5QRHg1Q0NCQ21JOC9TanV1VDI3NlREQkZQ?=
 =?utf-8?B?dkg3WjZLNzRvV05hL0FwdnBoeXR2OFZtU3pQaG13N3dKVHB6Zncyd3Z4eVhU?=
 =?utf-8?B?UUJ5UWFBeXhOSm9xcDZYRlZPRTN5K2FiVCttTlhsSU1nY0VzTjQ0SE93SVht?=
 =?utf-8?B?WStDblFYWXZxbWc3cjlmT0NSUzJSVUVSc21BV0NHNWdwbVNFR2JsQ2VubC9G?=
 =?utf-8?B?S2RYZ05iSHJiR0ZTZmdkRTR2SDhJU2hhcnE4eVlJNXJNeWx6Njl5WlBaR0JJ?=
 =?utf-8?B?b1ZZYkN0V2xHWkhOcFVkUmtEc25uYnFEUENCVUN5VEhXYVBpc3huTUNUbVoz?=
 =?utf-8?B?ZjhnMWlEQ1FyUVc4TmhSUzRDSmV6R3hjN3lRZGZyazd0aWpveG5oazZBWVRO?=
 =?utf-8?B?L0hJWlhrdENncE1jUWNNOXVFMjgxQmc0RUJBUVQwaytVYklOQmx6VlJEN0d1?=
 =?utf-8?B?ajBvVHJrNmovNUhhK1hFbHk1dmt1OUtWZU5LZm9jajBIcWNOdUl1a3Y5OFpx?=
 =?utf-8?B?WUdvaDN2Yi9QdHRGVnd6NzU5ZWpmMngxZnRycTdnWXh4V2hQMEJ5b3JqZXZh?=
 =?utf-8?B?YXZkL1BaY3gxRVF5em53clg4UmxKaW9YVm91amRnUEFYNmgzTk1XUWI1cDg5?=
 =?utf-8?B?N1hiMktZd0FzRlpwTUF6dzFBQjdOR0FjYXFpcmo2dGFJRGpWT1h4T3o3a2d6?=
 =?utf-8?B?dTRVR2tNcUJoTFpUSjFXN1AvZXhWaHgzdS9HWVJlUGpwLzJpS01CdUJxVVNi?=
 =?utf-8?B?ZVZWUktKblQxNFpzaFNhRDNCWkxYSWo4ekhPaVBYZTB5UG5UUkJFTy9nMTc2?=
 =?utf-8?B?bGRmSThEM2JEdXNXWWdoU2J0TnhrL2ZDekVxRWd4Wm93cjlGR0R0VWJrSVM2?=
 =?utf-8?B?dmRvOFJPZXRmUFptRVFNYzBtb1VPeU1DOWJUL2V1Z2Q0cFpZU1NrTnJIemc2?=
 =?utf-8?B?K01abzBhZThWb1pMY3JwKzFJSXFROHFhOWxLQStlSGhKQUk0V2d6dms4bG1v?=
 =?utf-8?B?UkhWYlhyUXFLVGlCaGd6Q2dlMEJEVjA2WjFHcWcyNDlCNlBHNnl0QjVpRnh1?=
 =?utf-8?B?SnFwYm1xaGhxbkVxTHo2bDM0RDA4NVBEdFlmckorS2hVMGVpdHN5K0NFRVB6?=
 =?utf-8?B?ZFUrTmRoYnFxUFRXaG4xVEZYd29LQThYY1ovdUdXYytqTE9UbEdSWHB4amVv?=
 =?utf-8?B?NDc5blVGWGhTVXRDaDJ0R0M4SjlqaSt5U2hqUldRVDhwdG96VUpNVXd1eDFK?=
 =?utf-8?B?cGFlYVlNOVpnWTJndnFRUU1MT0w0c2J1aHlld1RjU0lzdFd6QnJOWU0wR2dQ?=
 =?utf-8?B?U2N6STNlc2ljTlhvT1lYUUJ6Q3Z1ejFhTHEvVWVCSElmNUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 11:15:00.7356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a800211-343d-4cc7-003c-08dcf1c19ad1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120

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

