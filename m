Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2F44DA528;
	Wed, 29 Jul 2026 16:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343269; cv=fail; b=GP97osYsYKo1O9b/nqWHQFxeJN5exTvJksJuVZZaJsQYytJY8+txlBO4lt2iumhuUJ4XDDoSP4kaWh7JJY7YnmN4VsouKG5vS6Z3txQ64mdb+eDrTV0KMSCDTImOtOoPWDwS6FlusQt3oNyJg1jlg7oCwZeW/gQihz5qFh/Zqwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343269; c=relaxed/simple;
	bh=BlaVxC7A1ZKVDNbjztQzmcupa40luQp1jTncM0UMFQ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/1xVMBtjodUM8egS1ipcPrd37Lq8ausDAvirSQfL3LvJFUlJTaiu4wculGqwfIQvgP2wDbzTaxfP9G2TqJljdPwRfmUvRowRYsGBGlkYVpevRnTiCQ83TlckS61uZtl/1zf84l6jl+FwvdjPyNAV36M62L5ErUl1r0lkleUlXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=01lFJPa0; arc=fail smtp.client-ip=52.101.52.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="01lFJPa0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eY1Ckp1Ek5XYeF81y9ie5u+yxQy46/c8II/6cl59CrSUnDG0NgV39D7GnNq5XnM4dW7YRbZs1Y/QBHzj+veVDByOs5lzuOfCleaci0Z9CDWZIiqjrlzFk76ptHzDCccbGAEa1v8FvaTsbgvbPGtz+5s9c/1gJl9AmkAXfFCRiaH/FCec3GnmVLyWJyLNz42GzajTNEKuHbmljCsSEgYj1k3dHj2cdNBFyMeudcD4BMxRYekfkb7Y7QFK5JsgAyzZckfAd3X1xk+tuFqZgeyEuMz8+y2e9lcDeEpmhgKBd3SITQGDXmpX3GL27Xd540uYmyXOKlFvl22OQBHSWiOjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nwl7k8rOr+E1MPMcCEEjc3i8ptDczYVmATBsBuYcmzw=;
 b=bxZ3ZUt3nraqkibBLV7EXFhsdYh/XPe3GDHhj3CTD8LtW6PfT4KQKMp4NnUuECFSCmEDksLZeQfLOAnNhC9X9cEZC8j7SU6GpOtkJJDT/4wP637hwZe7FYT9DKn2w9tqw18dBiYDUhm6e7354gaPR/QZjFNS87lqTBmLPI6+E2owyF0Ni2k2PkQk3ZoPm9MdJoeaiZ2wzjlWS8ZvIqejqTUmPHZHvuXVYwg6zl/kvZ8NKLcgkwzRDOcuCu1b3vwB69EGNUX3OgOZ64zYDUWv1oro/FEqTx5FYTP2zhcSk7FL6Sw5QEJzMoPKUSjpVa82CbPf6XNq1Khfc2kyIi8w7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nwl7k8rOr+E1MPMcCEEjc3i8ptDczYVmATBsBuYcmzw=;
 b=01lFJPa0VTFQ7am4PYWyxpkHLUSc3PvFgN8q5YauaQVY3BbUpe3tCi5E1erRtiKMaJLFpPC2Rpk0h0AA6PJQdOb2KuTrrhIZLluj622SK2zk+b4yJX2ccPOhIY8bN9sSU60jqafMDIZn8riuqLRqcGe/zCdou3iTd1T0Y6/09cA=
Received: from SA9PR10CA0029.namprd10.prod.outlook.com (2603:10b6:806:a7::34)
 by LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:41:02 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::aa) by SA9PR10CA0029.outlook.office365.com
 (2603:10b6:806:a7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 16:41:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 16:41:02 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 11:40:59 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 3/7] platform/x86/amd/hsmp: Add ACPI client support via the SMNR method
Date: Wed, 29 Jul 2026 22:10:30 +0530
Message-ID: <20260729164034.1331375-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729164034.1331375-1-muralidhara.mk@amd.com>
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|LV8PR12MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: ddafda3b-d8a0-46ab-de12-08deed902d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Fvx0fzbrZ8YIryUSwdrMHapr/lqTFor4gpJKTlZ2N/WjGZJz7qP1eGPrxfu5NG5DJMunkCX3tag82fyeVKTaazbAgKJcCNS8VAXwAZTnWGMQMqKRhgiOP+4zLMdI8sSoFlyczXOP+XQmbxmS+lXl4j+UVDnNtBJ5hFctIGup5RNnfXBLKzD9ILoSVVve3m1igI+H7jWA9CCCtA5geru0tSqQ85n27FgIh3eiB3y7z02yDAF/QKOms8bw/0Oe5ku4rm7jukAUHShylphZm597rtofcq8jiIGshennQWOmj7/t/ojCG1MmGSm6yqKUndyf126MSj3jSBbSgZzR3Kgwdow/CfOkLkXEWtrY9CxUyKZyxCb3axvbaRvNUS5uHBSCviHivDtV77w3RHREscgRoBDPRZ6fGr6eGbMaBogi4ACVhzP2l4JBIm3b8WeuUdQu/kil3bvKYyapqwdJq5bVjEOnHGA9yrpi5RMC94/bE+MSqIISdDctEUe3R+HWqH8cD29tQCFiVGHtQVLCSs1vc+XQM/Y5wGZAzLnmw0kSbLqlk8/Vw19BJ/6UoMarWSaKXV9qvxZ1dcxkhXsYld4U/pIh0VblCvQGe8jgidlWgyV2o+eX6lW5H0l1nygP8rhKpPuW90Ge7CRtFXlh/0f/Gqm/meMTNrnL7XLOYIOYQLpwnbRx95cwKIPCL4hNofor/tJmUSHs0Z+JXXb8UCTYxA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iFfB5OrPQ8C0Qr9BqUA3yEJLuRl7HLly7wkBZfBCukjXGEpRxUZd+Iff05U8iupoR1FtloaoI5QZPWO+eSSKVbCvxcQvFSroejregQNy1DhWnurNprVCxWY2BVTsX38OUaFz065WWVig8Gsg1qtovxRq97EAPgFsgzAukLoM1qZIJUjwTkWXzzMG3m2I0Q+0x/lm2mDvh8ho/Ln2fmF1Im30PHgNNKAk29oePy0mvS8WZbWwuczmJONH5u0bP1JikNaUcN7dgyglze5KyBLO67dtUobo57kYdMZ9os6uE8lNL8GMzHUzwsaXyNgoXC9YGQATpxIaMf1Y8jIs1w2R6moPwQUTL2NpoC6OgxdArFX+oegANhxxLCLdgRPYGsDkjTdkNuVbHVXN0wBI43D2hrTfygq6PjzxY+vKBh95uowTM3UEtFvAHOpY8r6+o8oX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:41:02.1164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddafda3b-d8a0-46ab-de12-08deed902d26
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9407

On the Family 1Ah client platforms (Models 80h-8Fh and E0h-E3h) the ACPI
HSMP device (HID AMDI0097, ACPI path \_SB_.TELD) is present but, unlike
server platforms, exposes neither a _CRS memory window nor a _DSD
mailbox-offset package, and names its socket differently. The probe
therefore failed in three places:

  - hsmp_get_uid() requires the server "IDXX" _UID form and rejects
    anything shorter than three characters. The client device carries a
    bare socket number ("0"), so the probe aborted with -EINVAL before
    it reached any of the code below, and without logging a reason.
  - hsmp_read_acpi_crs()/_dsd() found no _CRS/_DSD and bailed out.
  - hsmp_cache_proto_ver() issued HSMP_CLIENT_GET_INTERFACE_VER
    (msg 0x3), which this client SMU rejects with "invalid message"
    (0xFE) even though the mailbox is otherwise functional.

Handle the client explicitly:

  - hsmp_get_uid(): strip the "ID" prefix only when it is present, so
    both the server "IDXX" form and a bare socket number are accepted.
    A _UID that is neither still fails, as kstrtou16() rejects it.
  - hsmp_parse_acpi_table(): for is_client_platform(), skip _CRS/_DSD
    and take the fixed client SMN mailbox addresses from the platform
    descriptor, accessed through firmware. Reads go via the read-only
    SMNR ACPI method
    (TELD.SMNR -> CpmReadSmnRegister, the same accessor used by the
    AMDHSMP Windows driver's amdtelemetry_Acpi_SMNR / 'RNMS'); writes
    go via the kernel SMN helper (amd_smn_hsmp_rdwr), as this device
    has no ACPI SMN write method.
  - init_acpi(): treat the interface-version query as non-fatal on the
    client, and call hsmp_get_tbl_dram_base() whatever version was
    reported so the metric table is fetched with
    HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR, mirroring plat.c.

As on the server path, the client branch publishes sock->dev last with
smp_store_release(). sock->dev is the readiness gate the data plane
tests with smp_load_acquire(), so it must not become visible before
the accessor and mailbox offsets that this socket's mailbox access
depends on.

is_client_platform() covers every Family 1Ah client platform (Medusa1,
Olympic Ridge and Medusa2), which all share the same client SMN
mailbox, so one branch handles them. Server behaviour (pure
_DSD/_CRS/MMIO) is unchanged: the _UID handling still strips the "ID"
prefix those platforms use.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 125 +++++++++++++++++++++++++--
 1 file changed, 116 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 8257cd1da48e..bbf2b9a8a408 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <asm/amd/hsmp.h>
+#include <asm/amd/node.h>
 
 #include <linux/acpi.h>
 #include <linux/array_size.h>
@@ -71,6 +72,68 @@ static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
 	return 0;
 }
 
+/*
+ * Family 1Ah client platforms (Models 80h-8Fh and E0h-E3h) expose the HSMP
+ * ACPI device (HID AMDI0097, ACPI path \_SB_.TELD) but, unlike server
+ * platforms, the device provides neither a _CRS memory window nor a _DSD
+ * mailbox-offset package.  The mailbox lives in SMN register space and is
+ * reached through firmware:
+ *
+ *   - Reads  : the read-only ACPI method SMNR(addr) returns the 32-bit
+ *              value of the SMN register at absolute SMN address 'addr'
+ *              (TELD.SMNR -> CpmReadSmnRegister).  This is the ACPI BIOS
+ *              telemetry accessor referenced by the AMDHSMP Windows driver
+ *              (amdtelemetry_Acpi_SMNR, method 'RNMS').
+ *   - Writes : there is no corresponding ACPI write method, so SMN writes
+ *              are issued through the kernel SMN helper (amd_smn_hsmp_rdwr).
+ *
+ * The SMN mailbox addresses themselves cannot be discovered from firmware
+ * on the client (no _DSD), so they are fixed; the SMN_HSMP_*_RM
+ * addresses are defined in hsmp.h and shared with the platform driver
+ * (plat.c).
+ */
+
+/* ACPI method on \_SB_.TELD that reads one SMN register: SMNR(addr) */
+#define HSMP_ACPI_SMNR_METHOD		"SMNR"
+
+static int hsmp_acpi_smnr_read(struct hsmp_socket *sock, u32 smn_addr, u32 *value)
+{
+	struct acpi_object_list arg_list;
+	union acpi_object arg;
+	unsigned long long out;
+	acpi_status status;
+
+	arg.type		= ACPI_TYPE_INTEGER;
+	arg.integer.value	= smn_addr;
+	arg_list.count		= 1;
+	arg_list.pointer	= &arg;
+
+	status = acpi_evaluate_integer(ACPI_HANDLE(sock->dev),
+				       HSMP_ACPI_SMNR_METHOD, &arg_list, &out);
+	if (ACPI_FAILURE(status)) {
+		dev_err_ratelimited(sock->dev,
+				    "SMNR(0x%08x) ACPI method failed: %s\n",
+				    smn_addr, acpi_format_exception(status));
+		return -EIO;
+	}
+
+	*value = (u32)out;
+	return 0;
+}
+
+static int amd_hsmp_acpi_smn_rdwr(struct hsmp_socket *sock, u32 offset,
+				  u32 *value, bool write)
+{
+	u32 smn_addr = sock->mbinfo.base_addr + offset;
+
+	/* Read path uses the firmware SMNR ACPI BIOS method. */
+	if (!write)
+		return hsmp_acpi_smnr_read(sock, smn_addr, value);
+
+	/* No ACPI write method exists; drive SMN writes through the kernel. */
+	return amd_smn_hsmp_rdwr(sock->sock_ind, smn_addr, value, true);
+}
+
 /* This is the UUID used for HSMP */
 static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
 						0xa6, 0x9f, 0x4e, 0xa2,
@@ -89,15 +152,19 @@ static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
 	char *uid;
 
 	/*
-	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
-	 * read it and strip the "ID" part of it and convert the remaining
-	 * bytes to integer.
+	 * Server firmware differentiates the sockets with "ID00", "ID01"..
+	 * "IDXX", so strip the "ID" before converting the rest.  The client
+	 * device carries a bare socket number with no prefix to strip, so
+	 * only skip one when it is actually there.
 	 */
 	uid = acpi_device_uid(ACPI_COMPANION(dev));
-	if (!uid || strlen(uid) < 3)
+	if (!uid)
 		return -EINVAL;
 
-	return kstrtou16(uid + 2, 10, sock_ind);
+	if (!strncmp(uid, "ID", 2))
+		uid += 2;
+
+	return kstrtou16(uid, 10, sock_ind);
 }
 
 static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
@@ -240,12 +307,35 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 	int ret;
 
 	sock->sock_ind		= sock_ind;
-	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
 
 	sema_init(&sock->hsmp_sem, 1);
 
 	dev_set_drvdata(dev, sock);
 
+	/*
+	 * On the Family 1Ah client platforms the bound ACPI device
+	 * (\_SB_.TELD) has no _CRS/_DSD, so use the fixed client SMN mailbox
+	 * addresses and access them via firmware - reads through the SMNR
+	 * ACPI BIOS method, writes through the kernel SMN helper.
+	 */
+	if (is_client_platform()) {
+		sock->amd_hsmp_rdwr		= amd_hsmp_acpi_smn_rdwr;
+		sock->mbinfo			= *hsmp_pdev->desc->mbinfo;
+		dev_info(dev,
+			 "Client platform: SMN mailbox via SMNR ACPI method (reads) + kernel SMN (writes)\n");
+		/*
+		 * Publish sock->dev last, for the same reason as the server
+		 * path below: it is the readiness gate for the data plane, so
+		 * it must not become visible before the accessor and the
+		 * mailbox offsets this socket needs.
+		 */
+		smp_store_release(&sock->dev, dev);
+
+		return 0;
+	}
+
+	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
+
 	/* Read MP1 base address from CRS method */
 	ret = hsmp_read_acpi_crs(dev, sock);
 	if (ret)
@@ -553,11 +643,28 @@ static int init_acpi(struct device *dev)
 
 	ret = hsmp_cache_proto_ver(sock_ind);
 	if (ret) {
-		dev_err(dev, "Failed to read HSMP protocol version\n");
-		return ret;
+		/*
+		 * Some client SMU builds reject the interface-version query
+		 * with "invalid message" even though the mailbox is functional
+		 * (the preceding test message succeeds).  The client does not
+		 * need the version to reach its metric table, so treat this as
+		 * non-fatal there, matching the platform driver.
+		 */
+		if (is_client_platform()) {
+			dev_warn(dev,
+				 "Interface version query unsupported on client SMU; continuing\n");
+		} else {
+			dev_err(dev, "Failed to read HSMP protocol version\n");
+			return ret;
+		}
 	}
 
-	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
+	/*
+	 * On client parts the metric table is fetched via
+	 * HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR whatever interface version
+	 * was reported, since that query may be unsupported, mirroring plat.c.
+	 */
+	if (is_client_platform() || hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
-- 
2.34.1

