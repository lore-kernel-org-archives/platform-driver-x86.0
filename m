Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79CB13C8FF
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 06:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911644; cv=fail; b=lyyG4RE4UT0DMs5YIMbV1aZKwkuMaKX7SOJPydmlQsV7Yoi8wSfQU+9AZYySWcwVPYE5bKrP2nCndPJdHIW+x4P+13kd5xtDR/Kt6eIB4DEuVZtFcADa9IVC594vF8g+J1faIUWhLrHNgiO39Zh/sWKYVhd1XXT7oLvlWCZ3TKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911644; c=relaxed/simple;
	bh=qJ4Z63UEQsWCW1z5IffqaXoK2eU6BS8WggYaEyUjKDg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DfLAM2rBCTwJFvNTfZthslY8H+qtgp+utODFUOJrYgS7Pu6Ni4yZAk3fpJC1ZOapzQmFzLvIvUa3xyxDb+TOusWY+Wc2JEf9Og8cAmkiCsRFNPgYunj2FYM8dbTXZwluDIusd+RH6ibKFbiwUywGCwbPyd2JfldtPPCn3Zka61w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mR5//a1o; arc=fail smtp.client-ip=40.107.236.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mR5//a1o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhpEsWA+5nWYosB4UK8fcaYHFDAVN9VM8im1AKX+cu/9rdXf1NrwsgLffw+og+hFtvHK90bYsnbs4sJ5HYFeWJMWpR3VYFMcPDIRNfpJhtgqRhdNHB+g/vRFHXEuR8fqXa/Bst6YUTVSZ0rJkFIUXRaE58ELAgn3reICW0wSFN32y9Uo4VepwYX6px+ztyBZaoRLMeo4t+z/RTDRBCfDx9Uvdwa7Lo61BBYkFpnfZei4eq7Dq+RnGyiZl0fcqzHcYciJ1QhZ2bl4unlsnWxI3tEq6KrgTkfBgpDK66R06UTfDTCp/gLJ2BlErqsP/Ree+h3snhav46lnVt1067Vgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVcq8J9keDgdfPMTZgPqvNxP5CuNgWDYi0fKT/APsCE=;
 b=y4pFzVUk+GSq74lG2iw2dUEQDcxHKrjgdUMRzzpcxL5nd1SDlxrPBY8MU0FU8OnQRmqsSCAOoDntslP2eCZod2p9GhJITNs1tQ7kPwS39OEk5fAL1yHW0msIOO0or63OigIKiahrrh6dHhMTqNMd4ojO69fR3LrNz0vpfVTfcp/dbb1qcSv0Okc9GrwJqv+3lHpjeCnespUZrdlfWDqUnYa60bMElO1VIJuqMEHZKAl74JakNb4fNWIfQuGBjhRl9sCa2aACGyH9VW37uqSZikSjGcCB99xOR9pooaQTS9+pziEf2hZd0xtBMNZHeiwg/GqQE0jTtFlTHde72gIZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVcq8J9keDgdfPMTZgPqvNxP5CuNgWDYi0fKT/APsCE=;
 b=mR5//a1oJvl6JqTALfL0MAjzRzPFaQfQc/nQiNlqZ4aGIlcWXUfY5yHpaL4RaEgUDL0lweRF0oXAUeQGLTCHr7+J2wLyh+K7+KNftppI5siaoI3hV6sVbYbN/0rqKzWZ3hPZHsRLWFiTv+SGqUUuiVzGVYHWY4Uh8YZlXeEbZSs=
Received: from SJ0PR05CA0096.namprd05.prod.outlook.com (2603:10b6:a03:334::11)
 by MW3PR12MB4362.namprd12.prod.outlook.com (2603:10b6:303:5d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 06:07:14 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::9e) by SJ0PR05CA0096.outlook.office365.com
 (2603:10b6:a03:334::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19 via Frontend
 Transport; Thu, 29 Aug 2024 06:07:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 06:07:13 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 01:07:09 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v6 06/10] platform/x86/amd/hsmp: Move ACPI code to acpi.c
Date: Thu, 29 Aug 2024 06:06:03 +0000
Message-ID: <20240829060617.1548658-6-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829060617.1548658-1-suma.hegde@amd.com>
References: <20240829060617.1548658-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|MW3PR12MB4362:EE_
X-MS-Office365-Filtering-Correlation-Id: abb18508-53ca-4dee-28b1-08dcc7f0d3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVVPSGpqMXJBTlFUU2FzVXgvOEgxNG9IUjB6ZlFmNnBGVjhaTW1BeUk5NFFY?=
 =?utf-8?B?RWRqSmJSK0g2Vml6N2QxQ2NUbUdQM2kxcHR1ejd4WlcvbEtmRHQvajQvOVp5?=
 =?utf-8?B?QUpxNVQwWGk5d2dUb3VDSDBlc090VEdnMUxyL1ZoYThaTWROdXFZWXZ3KzFI?=
 =?utf-8?B?UFNnRlNaZ2FnMUFPZGhvMGJyLzZzdkdxVXd2cUtVb0NnaE1jQjBTT0p5N3NT?=
 =?utf-8?B?WUExeFAwVGFneWJhdHp3THJnQWxRckcxS0tiR1pJeVZ1d2xPNDVoNUhZMG5v?=
 =?utf-8?B?NE05M21iMHUyWDJTTFZRemFXeDBrQjZLL0VjZUZDN1hOQ1pWemZmOEhqRXlx?=
 =?utf-8?B?dWxNcGV5d3dlWlUxNVpNL3ZpMWk4ZjhDWWU1UWhacUswRXBEUko5QnZJTm5a?=
 =?utf-8?B?MTVkRnNaUU9BaW9xZG9UTlA0L3puYnNhME1EZDVwK3pGUExQU0R5QWZFMHpt?=
 =?utf-8?B?TkVTdlFhaVFYdUhvbUpWT21pV2RxbUhZZEV2VjVQQkREc1N6YlNGWXVYNGtR?=
 =?utf-8?B?aGNZOS9VYVBqdjA3Qm9ZTTk2THpBRmFUeU9jUzBudEdpWERQSE4zSHIycEpI?=
 =?utf-8?B?L3dTeXNWekkzd3VFQ1RLa0xtY2EwYStTVUpyYUJWSzZZS0M5ZTEzWWk1aGtP?=
 =?utf-8?B?WmU1cVNKYlgza0JSOHBPb2M2NlU0RlJoZ0tUdzdkeWJyNEtHdVlEaUdPYm5D?=
 =?utf-8?B?UEZRVGd5NG16TjJNRW1qWEYwa3UycUVvYlVla2xpYi9GcFU1cGlsWUtNdnZX?=
 =?utf-8?B?YkU5ZTRtbjVrZXAyZEZncjg3ZUNSNFdMTmM2QWp6K1p2K2xnbDdST1hEZ1hD?=
 =?utf-8?B?UFpuMEZCSU5ZcUtDVks2TW4rRzU0UHV1OWl6akMvcnlQQWZGZ3RDbWppMVJo?=
 =?utf-8?B?TWlKV0s1NnlOOEpRUE05R1VwMnNhUjdRT2FjQlBwaWFEb0doZUhuRFMyOXBS?=
 =?utf-8?B?YXpkWklESmRrWWpoV2pnOUhVaXhqTUtsTXoyK1NhL2ZuMjRPUUVBWWFROEVo?=
 =?utf-8?B?YWlKWW9PV0UzZ1hLS0VxQ0owMG5WYmdPR1RTTEJqVXVCby85NU85V2N1WWxG?=
 =?utf-8?B?cWtlTUdIT3R5R3dGZTBZa1RjdEx6NWRkMU1pampZSHBxUlp4Q20wekxXMzJs?=
 =?utf-8?B?SmVPbzNoSTh5V3MxeDJZVmVBd1lJQ3ZNbFcvYTlVSzZDTkFFaWxqT1QzSUpl?=
 =?utf-8?B?Yi9qQlFhS2FmMDVFZ0JGdlpWVVZubGRPWnF1RHF0Y3VyWUlQaVpXY3FWQi94?=
 =?utf-8?B?UjZWTENRNWRHSTFnTU0yekNvSXNJVjVaUG9QOHRUTHllc0Q1a3lIaEQ3c1V1?=
 =?utf-8?B?cENvWmx5NG1KMVN3dHBBY3dyeWVpWVNYS2ZPNGVDUnk0NElJQ0piNTk5TzhI?=
 =?utf-8?B?ZWlzRk44N3FQdjI3YXJub25YWmNrQkd5djJrUjlER1U4UUJqaGNVMS9SUlRT?=
 =?utf-8?B?Zk9QTkZRcWVFRGRFWTJBMlUvT3lLYWZwTklmMlR1UWdyNFUwcy9yeE8zR3Bk?=
 =?utf-8?B?Z2F4VEZtQjh3RVhINFBVR3k1eWRSQnpjc1d4Y0QrNG1jczFtNHV2M2xUelBP?=
 =?utf-8?B?S0ZLVjNFSVZublVkYXRBSlV5Z3VEK2kzV1hDR0YwZzZlSldGbW5NZGFrRnlW?=
 =?utf-8?B?K0o2cXQ4cnVhNVM2b1RZRU9qbDBYS015bTJSalE4QWovRXowbjM1MkhQQ1U1?=
 =?utf-8?B?YmUrMitaUU9QQU9zeFdRYXVXYlpTaVlpeHMySXFwYk94QzJnOXpYQmZxT3hG?=
 =?utf-8?B?MEVBcDNGemovMHJoUmZsSFFIdGVhb0pSdWdBbHBsOWo4elpqN0JuN0MvWlB1?=
 =?utf-8?B?dDE3V2xhVXhtN1p2RkttRjlUdnh5UVNON1lmTDh5V1VkdzdidlU1YllLakZ4?=
 =?utf-8?B?a1BBRkJkcWQ5THlMME5ZQVlMaFRyWWZSSTZ5UUdzUkVYNlJGSmpuc1cxNUJ5?=
 =?utf-8?Q?5ZUytoS7GDEJKv6NM8oYp3vFP/bIMIbf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 06:07:13.9929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb18508-53ca-4dee-28b1-08dcc7f0d3fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4362

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

