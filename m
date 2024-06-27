Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AB91CD13
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 05:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466834; cv=fail; b=VfLI9PO+iy4lgP56aPkCgQSAxNo+begAI5xGUHTygPt4TItKd20lPn0mxKOggbgGNlVdoGdSz6d6OFddxejbmPy4LPhUzU66AyvoRrb8128WNFMitvpl2C8Eg8UKKrxPz9qDI5VqhaggIFEtNy7Lzzc0+1UNW0p3MIWAwLF9WvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466834; c=relaxed/simple;
	bh=C/nQ2PFqIZgL/0Jx4Lae8tsteNgTunHKtNi6uNXrKPk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jqSZQu51h8tfYEvXtFg/Yxz6d65vxJgdgIbrLS3sfu0RCWU6SMlWaUUfx1YL/AtQUKyyMZhgT/Y5VH+jF2F1R94U47a7W889jymdVAo+K+3qfY/MExr36GHDfEqUGbz6oaUfPppMGeFXXCYuoddzfpA8Vc4G5KZ3sy9cJ9PNqs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rCSROIj6; arc=fail smtp.client-ip=40.107.220.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rCSROIj6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRAwEUEK92Jjm1zG+SJvq6vJ7oTEdLNrb84WBYfl/DzDEH0V9jycy2TTD+Jk8OQZ1eJmAA5cbzVVwdQkuHfBXOWEIWBp0Ob5Km+KjJqg3vTth8vqiP1N5QjxU7yyN2mvwbYkmKWhjRJgAcwjK/DmVaOR/eMkinUuyE/98NRXaz+VQKByR8vZ33IBvAO0zYhQ7ICqIpKgf+zcTl92TcDQ9D53tDSE4ST1ELMGexKz593rd+XjF+k8HqOLAEy3PwlMaRSkEMa1m2GViz3e2hd2/wsf1NUrmLlLrNqGWtCszfoG6lcmWhoRJKPW10mfR+gWSD+dhEHN1YRuJn+21FD/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RU0ENG+nb7Xm5bz3pj4vLmy6yWUGy/b46FoASJjVONY=;
 b=hDNXyLW8VKb9ZZL2aRD5FBisblwaiz7dKfdW9RQCLL3u4hXdUGZIrAB91HwVpXpeaiNXLq+fLJi6Nuz1g8B+Lsgpa2thmd8GLEtG7Y5HVhMRY+tOpGyK5SocN0a/RjqiwYjikj2cuw5ESJYgkgkXhlTP0fE3FKRb7cxCSab2DkNsQDgxB4+JB+GU/IYrIhRFUDCeQeUB9N5R34cfgrfmRxhFM4CrbQcnxwHr/NxjA6ZIW/cvsBEZZYLnRk6jZRvQDrceEMua/seD7qnhYMW40jiaSUkdEhQmYm/vnOOj+uAoyoM9Lds+GDWeKWxoBUIMjab7mMgvUOx5ebtKtiP/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RU0ENG+nb7Xm5bz3pj4vLmy6yWUGy/b46FoASJjVONY=;
 b=rCSROIj63JcS6GIpw7KreaDbHT8SZCaGdWhBUSdVFxPmAgFBtofbeyUrT2+mizpT7Y1eScZhD/npXwilgeBRPRbTy3EaVuHCI1Gi+JuvelX5DMqNRHMOc09t8IEpEzmI3NH8JU49hEh9eT8DDf1tfBrU4aBhvY0yi9EFVtUz3PQ=
Received: from PH8PR07CA0027.namprd07.prod.outlook.com (2603:10b6:510:2cf::25)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:40:30 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::1b) by PH8PR07CA0027.outlook.office365.com
 (2603:10b6:510:2cf::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.23 via Frontend
 Transport; Thu, 27 Jun 2024 05:40:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 05:40:29 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 00:40:27 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 05/10] platform/x86/amd/hsmp: Move ACPI code to acpi.c
Date: Thu, 27 Jun 2024 05:39:53 +0000
Message-ID: <20240627053958.2533860-6-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4f2f25-b383-4b01-a05d-08dc966ba7af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EpvrY1eHJdN5rHZrDSgPuknC4akNSC1hTOZKmnTwkll7H+MnnHKkrWpd4e6v?=
 =?us-ascii?Q?AZ16T/t1croO/AaWazUVYDmRvxgtgsgvO8AP7P3xce3EX0TLSaPqUL+e6WK2?=
 =?us-ascii?Q?4v8EX1w8/G6DF+Pn/oBCmUIYvxYZRKHovIp6mzHnJV/OPkJE3olpdAf0y1Zk?=
 =?us-ascii?Q?O9mFVzOMrFMmf/NNHnym8nDC2XBjEvphT5NPw4JkCxV2g4nzdE0OEPWvQH0x?=
 =?us-ascii?Q?B/tw/nkxgct2luBGF4tKSoso4Cu5ixpnDYAPO+7m7Fo+N9d56B9GO5Ql1vzr?=
 =?us-ascii?Q?4r9zzxPfFAzlp2Gs4RBXNAEKJ7+zSYgtpmKV3RcoBUC7GLPDT5er5deANn6S?=
 =?us-ascii?Q?+nq4fiwOaAqxb3Rc9dXAjKJhN1tHiAA/DAB/bLXDpa/MSgp13oamIvA3rsub?=
 =?us-ascii?Q?NF6FZwWUKH8EPWfmNe+u4VqLYX5U3RTjCHq4heY/k2eFKmMLKXYDF70MOLHe?=
 =?us-ascii?Q?uWquW1JHezsQmC65Iz8Uff9gALkNIToFkdYuYbtqePCSgyi9sQ8+RAzeTUJa?=
 =?us-ascii?Q?CFzwD8IR6zzr2xMc5yIIA3+INpo4brLfxNGi0FZMnmkkDCg/ZoeMUTUmAkp8?=
 =?us-ascii?Q?416/LXW+Pphhqz3F1LNTe5jT9Z7Gv6pCxFRADa3uIveoyYHIkaAffThdGRyW?=
 =?us-ascii?Q?nwGsP7mdZeUwW6b+5/tUA+H287uO3DCkjrDlKRqAbaH1SPKlPiXb6r2cKKek?=
 =?us-ascii?Q?ZMkuZKQ99hlQQMoAl8d5Pm+W2JhG+tOx4d+xgxIlDCfnqb1IHTXZyqYZdBJj?=
 =?us-ascii?Q?1lcPpEr57O9SHrY0LsW0Qe10wgX8Y0mnhYmY6GetIGsKYnhv9iM/d02WIFCa?=
 =?us-ascii?Q?ssJDCl4NSuSaNcjoa5nhH/soQoOfAxcp1UyiZkABMz+SNi3FXbUplR/mi1ur?=
 =?us-ascii?Q?REBo4pgLLC4x+ENdpW2qSVkL6VbsArpGyjeGNls1jAFXnp9IaWz9+Ii47cTP?=
 =?us-ascii?Q?iu0nnaolpkNDDlCMaMZVZonR1/0hZ8NrGHZ8+ZcEdao3rqd6h20Ax5AcaY7n?=
 =?us-ascii?Q?EPiSWKt0W3oRM/PdOgLOMDnGctIBLEaYmuAgs56iLcyioH/VwO3Xe+AWSbke?=
 =?us-ascii?Q?5hXGp3kioYwotJVfws6k60Uz1wkk8Pnt+crbTIlCANUlz7P+0CzEkPD5miIC?=
 =?us-ascii?Q?0yCcP9iu+5z5Fm5O9x9/C6UKXBtAZb69L2HxM4mbI75CHlDy2Sess2i7Mnb6?=
 =?us-ascii?Q?7A0RayVcHm16eBhlWksF4s0oqvMA8SRafrWs9nZJiuzI/F2L1pf1J9dN8pmC?=
 =?us-ascii?Q?13zHC1IWeGVv5vuCqwNiz17hhMbvecxlFEpITiMEBrEPbqFGdVzpNpTrVVLW?=
 =?us-ascii?Q?lYDF2xuhG5+gAj6YQSP47hoQDquohXjVEmRy4zRESriPzwQ0bMDAxmlRs64V?=
 =?us-ascii?Q?qIUxyVC15NErQECwwqvbuQD+wqNZxHO/9x1KD1nh/G/Ks3S1k+b4wFH5v+M0?=
 =?us-ascii?Q?J6c3912WTwnZvN5r4OjrHB8MkXM4Had+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:40:29.7802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4f2f25-b383-4b01-a05d-08dc966ba7af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879

Move ACPI related code to acpi.c from hsmp.c.
We still have one driver, the driver probe will be split in the next patch.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 261 +++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c   | 247 -----------------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |   2 +
 4 files changed, 264 insertions(+), 248 deletions(-)
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
index 000000000000..90bfa1ddadbf
--- /dev/null
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD HSMP Platform Driver
+ * Copyright (c) 2024, AMD.
+ * All Rights Reserved.
+ *
+ * This file provides a device implementation for HSMP interface
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include "hsmp.h"
+
+#include <linux/acpi.h>
+
+/* These are the strings specified in ACPI table */
+#define MSG_IDOFF_STR		"MsgIdOffset"
+#define MSG_ARGOFF_STR		"MsgArgOffset"
+#define MSG_RESPOFF_STR		"MsgRspOffset"
+
+void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+			u32 *value, bool write)
+{
+	if (write)
+		iowrite32(*value, sock->virt_base_addr + offset);
+	else
+		*value = ioread32(sock->virt_base_addr + offset);
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
+	/* The mapped region should be un cached */
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
index cd4de107a470..d3f0f08cebf7 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -28,22 +28,8 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-/* These are the strings specified in ACPI table */
-#define MSG_IDOFF_STR		"MsgIdOffset"
-#define MSG_ARGOFF_STR		"MsgArgOffset"
-#define MSG_RESPOFF_STR		"MsgRspOffset"
-
 struct hsmp_plat_device plat_dev;
 
-static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
-			       u32 *value, bool write)
-{
-	if (write)
-		iowrite32(*value, sock->virt_base_addr + offset);
-	else
-		*value = ioread32(sock->virt_base_addr + offset);
-}
-
 static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
 			 u32 *value, bool write)
 {
@@ -298,181 +284,6 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
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
@@ -581,29 +392,6 @@ int hsmp_create_attr_list(struct attribute_group *attr_grp,
 	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
 }
 
-int hsmp_create_acpi_sysfs_if(struct device *dev)
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
@@ -619,38 +407,3 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 
 	return ret;
 }
-
-int init_acpi(struct device *dev)
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
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index d65ff2acdf3d..2baeef57ca54 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -68,4 +68,6 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 int hsmp_create_attr_list(struct attribute_group *attr_grp,
 			  struct device *dev, u16 sock_ind);
 int hsmp_test(u16 sock_ind, u32 value);
+void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+			u32 *value, bool write);
 #endif /* HSMP_H */
-- 
2.25.1

