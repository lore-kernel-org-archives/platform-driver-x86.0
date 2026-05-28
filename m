Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B2A3B2D17;
	Thu, 28 May 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961236; cv=fail; b=r99ekNPTDvB/AEYVmwiPMrvaJRh8yFcQ9qIlEY75rs686d5KMDK0Xx0ac0LtNU0Yh/mP3SWR9Zd5A3aerEWktixKB2853kn+SOtRyi0Ag3/wv2v8qncl0AX0lgjsOKuWIul+6QwAJll1fqSK8LnL9XpyxV7+cOf8jZ0aNHermaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961236; c=relaxed/simple;
	bh=Ub86zaE0NFGI4NYxmhWE5ex+wj8JaD+cFPqUmCxVW9Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CfRDCkQK18jsKkGr4U2YYZLmvZ4rWMy6q0AC6eqTsYgN17Rup6Wtb2eg465zN6QPT+cgf5Px2xDyrHKiQcEEWVp6NkOM/ma4wlN2OLoiuy98Ze9EVz248Sv4+VV2Mz5WRXJFfImA+syN9bi7rvmul52tCFW3DThSZ8Vs7JKS9uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HB0Hff0D; arc=fail smtp.client-ip=52.101.48.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HB0Hff0D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/bhZhaH5Mj7ieDuHTMTXpdwijYDlQbn7qJPDsE3BxJ1Y5Y0kzkcj6WFZ1Iahv+g6zPCl4HSSraKehqQh8/wfULJWF8WlhULdDMstx6LAVuaKhM2fVjjfD0akIHAeIPJki1/357ElKIGlW0EgcnEOOSolXgz6CVRwn6YFvxPJo5iXKZeSovFcu2yl9wQkzqhCM88EcdkH9DyrkAhTDBO7pT7Sk6z4mLA7mwgRCrxqOSzYlOOuW/9dLxXRBzhe9lE7rmHNTXT0lD2yO6JVHrSIHwIdvv0SwemvJHIRrrTNmiv4YekcPiEx66uyDGAaYkZFfvo6PQijr3k5+6UUsL25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPpJDzYsr7krO3CA6+YSO757xAX4dStPZ+oFQPvPWuI=;
 b=CU8McQy/wD3AN3zgkvcR0+lzxZBBN0fk12A5/Hr40UdZ149f5q+Io19e1rXXXHUoZzwx52jN/hhHLHpBnUKxN7hprQT/atY8gVgf3x8glp8yaVVl2TomzpgDeGj9wJwL0uTmZqEhL56IGZWMa0NbHoQFC8x9xmopRNVCHXFQiBE1yaoa0oqLQG1ZpPg2nws3XVnCoKZ8vDrn8K/F6tiVj5riC7vnbepmnwUn5yf4sZQFue47lGUxNIpLY9lLzpTpoRzntTtKivCGUxRT/KYEzSl9RUxKJs26FvoXznlSx7rd8NuK+3KQdgrghr/xZH4si+K5WB5xSl1wCM/jVDgGug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPpJDzYsr7krO3CA6+YSO757xAX4dStPZ+oFQPvPWuI=;
 b=HB0Hff0DQaC0ThNzSZKE3BjJyigU12SYddiKS+4p2TBacQ2dEVMTXJxBs61hkVcmejAUoAUA2e5mo3XEj01jD72lTRy5gwkk2TUw89/4bQ8XdAO9I1f/r/mlWujbzmx0QduYoZQjjL6/EZm0L6opikG5zRkduSvmlJCnzarCDhk=
Received: from CY5PR22CA0074.namprd22.prod.outlook.com (2603:10b6:930:80::22)
 by SJ5PPFC41ACEE7B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 09:40:26 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:930:80:cafe::80) by CY5PR22CA0074.outlook.office365.com
 (2603:10b6:930:80::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Thu, 28
 May 2026 09:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 09:40:25 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 04:40:23 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v4 5/7] platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table reads
Date: Thu, 28 May 2026 15:09:52 +0530
Message-ID: <20260528093954.2461272-6-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528093954.2461272-1-muralidhara.mk@amd.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|SJ5PPFC41ACEE7B:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b588e6-1d52-4f2b-d43b-08debc9d2590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|22082099003|18002099003|3023799007|5023799004|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	OD5i5g4VS+owa800wZLNA4NyVI+jDn850UWRSsD3K14/3o5mOk12H5XcuzjDHZBVT7AJKsjVl4Muyn7lLUy/cztdOVqPBvsmSDqAIMMk1/0DjNX80w+wJIpS226+OXWtYWeN5PzmhF3OjwT13DBpL7fVTo0G8k1zuF6+OSn1yeeVP2c8czIl5CMa9CO5SDMkoT33nFx8C2Bw9xtyKRpQxt0eQB+Pbn8uO3SdfYM7Z0EeVER7P1uf1QmEn8xuu4fkpBdyycL9ATvPB742/XLiEHR8tMzBuXkxWFgUwnlkr3lsPMv0VApejy2Hir8nskAwU2NUqhpmFxI9Zj1PMZ11KFaGmSJ8vUApXs2KzulPNUpECapZVekZLIHXsBOYqabK6348BhPFtM5jjDYqAj98fSpN/YeG9k+lGmvmPlNvKtlSX3GGCyN5UEvfXBVo+YugAliBmcK5kMch8OGvtOsEZj4LTG35+HUm8YP6ghJBmH6NCRsZhgQ39Ehk0CXSM/Cg8EaaSn6R+T/8s3IGHl3ikc6F984oVK6PcpzzMjjYqArHDzUSmxjdasnJMT0EgA/doL30ASr4aypFiPb+brNja9UTTc12r+NGziaVh+reC2uBnJiGrpWa9AbIGwa1mOrLtEDalSAjq8jyVEOoGd3FOCxhpPoEhAE3p1eFLUSXM+24W8EEQCunHo7XqM/f9cOd45uxrLR3iYCh8mgvo75ouumPOPvo0H3mO85NbZoW7Eg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(5023799004)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2bHeBq+3kWpVuri0B7OoWxFzzGl+QBPPQOR2nEwcvyEQ3d8N3AJAFvE0G/FSbjr9S0LpUJcM+lonGcJ6Ql7PvVI4KIWCAMpF5OMvSqt0gr2OnQMm3/sRFJhwqXp+UTlgjqNfetqmwb8bgIEIoXKQeXadi9pClXv9U691ghLomlI1gY9vIXkkCKU4zcQk6t02gtvXy9B7EknTA4MAa6Olk8R3JHRnaE1VxvhFzskiD1oMIgCk+gLNpcHpUetgkgH2AVT/ZoIyeiwFBhSA9vACNvWdnYYu4l2Iyo5h+ZKHVaVJLtYSUFWtich5RdIhweby188rVUdJYieiyILqB/3AtW10ks2qQU0LScnhFIL5ywpppULRbATbHl2cWtY5cHrcmSk4d7mdq4tXPpajCUqAaz7t3yzHmDmQJHeYBSdlJQxlNgxcUcclxL5uQ2CwizsJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:40:25.8780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b588e6-1d52-4f2b-d43b-08debc9d2590
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC41ACEE7B

The metric table needs to be delivered to userspace as a single
atomic snapshot, but the current sysfs metrics_bin path is a file
read: userspace can read it in chunks and observe a torn snapshot
if an SMU refresh happens between read() calls. The same path is
also bounded by PAGE_SIZE, so the ~13 KB hsmp_metric_table_zen6
used on Family 1Ah Model 50h-5Fh cannot be returned at all,
regardless of how userspace reads it. Rather than extend sysfs to
lift both restrictions, expose the metric table through the
existing HSMP character device using a new ioctl that always copies
the full table in one shot.

Add struct hsmp_telemetry_data and HSMP_IOCTL_GET_TELEMETRY_DATA
to the UAPI header. Under the surrounding #pragma pack(4), placing
the __u64 user pointer first gives a tight 16-byte layout that is
identical for 32- and 64-bit callers, and the trailing __u16
reserved field is rejected with -EINVAL if non-zero so future
kernels can repurpose it without breaking already-deployed
userspace. Userspace sizes its buffer using the matching UAPI
metric-table struct for the running platform; sizes that disagree
with the firmware-reported table size are rejected so a short copy
can never silently truncate the snapshot.

Dispatch hsmp_ioctl() on the ioctl command: the existing message
handler is factored out as hsmp_ioctl_msg() for HSMP_IOCTL_CMD, and
HSMP_IOCTL_GET_TELEMETRY_DATA goes to a new
hsmp_ioctl_get_telemetry() helper.

The user-controlled indices reaching kernel arrays via these ioctl
paths are clamped with array_index_nospec() to mitigate Spectre v1
(CVE-2017-5753): req.sock_ind before indexing hsmp_pdev.sock[], and
msg.msg_id once at the entry to hsmp_ioctl_msg() so all six
downstream hsmp_msg_desc_table[] dereferences inherit the clamp
from a single mask.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst  |  30 ++++++-
 arch/x86/include/uapi/asm/amd_hsmp.h |  43 ++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 117 ++++++++++++++++++++++++++-
 3 files changed, 188 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 8bb411f0d70d..74c259507888 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -68,6 +68,14 @@ under per socket sysfs directory created at
 
 Note: lseek() is not supported as entire metrics table is read.
 
+The sysfs metrics_bin path supports only HSMP protocol version 6 and,
+because it is a file read, can return a torn snapshot if userspace
+reads in pieces.  Protocol version 7 metric tables
+(``struct hsmp_metric_table_zen6``, ~13 KB) also exceed PAGE_SIZE, so
+a read returns ``-EOPNOTSUPP``.  For atomic reads on any protocol
+version, use the ``HSMP_IOCTL_GET_TELEMETRY_DATA`` ioctl on /dev/hsmp
+(see below).
+
 Metrics table definitions will be documented as part of Public PPR.
 The same is defined in the amd_hsmp.h header.
 
@@ -167,7 +175,7 @@ Next thing, open the device file, as follows::
     exit(1);
   }
 
-The following IOCTL is defined:
+The following IOCTLs are defined:
 
 ``ioctl(file, HSMP_IOCTL_CMD, struct hsmp_message *msg)``
   The argument is a pointer to a::
@@ -180,6 +188,26 @@ The following IOCTL is defined:
     	__u16	sock_ind;			/* socket number */
     };
 
+``ioctl(file, HSMP_IOCTL_GET_TELEMETRY_DATA, struct hsmp_telemetry_data *req)``
+  Atomically fetch the firmware metric (telemetry) table for a socket.
+  The ioctl copies the table in one shot, so unlike the metrics_bin
+  sysfs path it cannot return a torn snapshot and is not bounded by
+  PAGE_SIZE.  Required for HSMP protocol version 7+ (e.g. Family 1Ah
+  Model 50h-5Fh, ~13 KB ``struct hsmp_metric_table_zen6``).  Argument::
+
+    struct hsmp_telemetry_data {
+    	__u64 buf; /* User pointer to destination buffer */
+    	__u32 size; /* Size of @buf, must equal firmware-reported table size */
+    	__u16 sock_ind; /* Socket index */
+    	__u16 reserved; /* Reserved, must be zero */
+    };
+
+  Userspace picks the layout matching the running protocol version
+  (``struct hsmp_metric_table`` for v6, ``struct hsmp_metric_table_zen6``
+  for v7, queried via the ``protocol_version`` sysfs attribute) and
+  uses ``sizeof()`` of that struct for ``size``.  The kernel rejects
+  a mismatched ``size`` or non-zero ``reserved`` with ``-EINVAL``.
+
 The ioctl would return a non-zero on failure; you can read errno to see
 what happened. The transaction returns 0 on success.
 
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 438ac38d0dc8..50b28ccc7597 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -686,6 +686,40 @@ struct hsmp_metric_table_zen6 {
 	struct hsmp_metric_table_zen6_ccd ccd[HSMP_F1A_M50_M5F_MAX_CCDS];
 };
 
+/**
+ * struct hsmp_telemetry_data - Request descriptor for HSMP telemetry IOCTL
+ * @buf:       Input. Userspace pointer (encoded as __u64 to keep the layout
+ *             stable between 32-bit and 64-bit callers) to the destination
+ *             buffer that receives the metric table.
+ * @size:      Input. Size in bytes of the buffer pointed to by @buf.  Must
+ *             match the firmware-reported metric table size for the running
+ *             HSMP protocol version (see below); any other value results in
+ *             -EINVAL.  The kernel does not write this field back.
+ * @sock_ind:  Input. Socket index from which the metric table is read.
+ * @reserved:  Reserved for future use.  Callers should set this to zero;
+ *             future kernels may begin interpreting the field, so passing
+ *             a non-zero value today is not forwards compatible.
+ *
+ * Placing @buf first lets all fields fall on their natural alignment under
+ * the surrounding #pragma pack(4), so the struct is a tight 16 bytes with
+ * the same wire layout on 32-bit and 64-bit userspace.
+ *
+ * The exact metric table layout depends on the HSMP protocol version reported
+ * by the firmware:
+ *   - Protocol version 6 -> struct hsmp_metric_table
+ *   - Protocol version 7 -> struct hsmp_metric_table_zen6
+ *
+ * Userspace queries the protocol version (e.g. via the protocol_version sysfs
+ * attribute) and uses sizeof() on the matching UAPI structure for both @size
+ * and the allocation backing @buf.
+ */
+struct hsmp_telemetry_data {
+	__u64	buf;
+	__u32	size;
+	__u16	sock_ind;
+	__u16	reserved;
+};
+
 /* Reset to default packing */
 #pragma pack()
 
@@ -693,4 +727,13 @@ struct hsmp_metric_table_zen6 {
 #define HSMP_BASE_IOCTL_NR	0xF8
 #define HSMP_IOCTL_CMD		_IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
 
+/*
+ * Fetch the firmware metric (telemetry) table for a given socket via the
+ * HSMP character device.  This avoids the PAGE_SIZE limitation of the
+ * sysfs binary attribute path for tables larger than one page (such as the
+ * ~13 KB hsmp_metric_table_zen6 used on Family 1Ah Model 50h-5Fh).
+ */
+#define HSMP_IOCTL_GET_TELEMETRY_DATA \
+	_IOWR(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
+
 #endif /*_ASM_X86_AMD_HSMP_H_*/
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index cf9392f99298..67f0074bb532 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -12,8 +12,11 @@
 #include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/nospec.h>
 #include <linux/semaphore.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
+#include <linux/uaccess.h>
 
 #include "hsmp.h"
 
@@ -287,7 +290,7 @@ static bool is_get_msg(struct hsmp_message *msg)
 	return false;
 }
 
-long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
 	struct hsmp_message msg = { 0 };
@@ -303,6 +306,19 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
 		return -ENOMSG;
 
+	/*
+	 * Sanitize the user-controlled msg_id against speculative
+	 * execution.  The bounds check above retires the out-of-range
+	 * case with -ENOMSG, but a mispredicted branch can still let the
+	 * CPU speculatively use msg_id as an index into
+	 * hsmp_msg_desc_table[] (here and in validate_message() /
+	 * is_get_msg() called downstream via hsmp_send_message()), and
+	 * pull arbitrary kernel memory into the cache (Spectre v1,
+	 * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
+	 * dereference sees the sanitized value.
+	 */
+	msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
+
 	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
 	case FMODE_WRITE:
 		/*
@@ -343,6 +359,105 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
+/*
+ * Fetch the firmware metric (telemetry) table for the requested socket and
+ * copy it to the userspace buffer described by the request.
+ *
+ * The metric table size is variable across HSMP protocol versions and on
+ * Family 1Ah Model 50h-5Fh exceeds PAGE_SIZE.  Userspace must therefore
+ * supply a buffer at least the firmware-reported size in bytes.
+ */
+static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
+{
+	void __user *arguser = (void __user *)arg;
+	struct hsmp_telemetry_data req;
+	struct hsmp_socket *sock;
+	void __user *user_buf;
+	size_t tbl_size;
+	unsigned int sock_ind;
+	void *kbuf;
+	int ret;
+
+	/* Telemetry data is read-only; require read access on the fd. */
+	if (!(fp->f_mode & FMODE_READ))
+		return -EPERM;
+
+	if (copy_from_user(&req, arguser, sizeof(req)))
+		return -EFAULT;
+
+	/*
+	 * Reserved fields must be zero so future kernels can safely
+	 * repurpose them without breaking already-deployed userspace.
+	 */
+	if (req.reserved)
+		return -EINVAL;
+
+	if (!hsmp_pdev.sock || req.sock_ind >= hsmp_pdev.num_sockets)
+		return -ENODEV;
+
+	tbl_size = hsmp_pdev.hsmp_table_size;
+	if (!tbl_size)
+		return -ENODEV;
+
+	/*
+	 * Userspace must size its buffer using the appropriate UAPI metric
+	 * table struct for the running protocol version.  Reject mismatched
+	 * sizes so we never silently truncate or short-write.
+	 */
+	if (req.size != tbl_size)
+		return -EINVAL;
+
+	/*
+	 * Sanitize the user-controlled socket index against speculative
+	 * execution.  The bounds check above retires the out-of-range case
+	 * with -ENODEV, but a mispredicted branch can still let the CPU
+	 * speculatively use sock_ind as an index into hsmp_pdev.sock[] and
+	 * pull arbitrary kernel memory into the cache (Spectre v1, CVE-2017-
+	 * 5753).  array_index_nospec() turns the bounds check into a
+	 * data-flow clamp so the speculative load is in-range too.
+	 */
+	sock_ind = array_index_nospec(req.sock_ind, hsmp_pdev.num_sockets);
+	sock = &hsmp_pdev.sock[sock_ind];
+	if (!sock->metric_tbl_addr)
+		return -ENODEV;
+
+	user_buf = u64_to_user_ptr(req.buf);
+
+	/*
+	 * The bounce buffer is overwritten in full by memcpy_fromio() inside
+	 * hsmp_metric_tbl_read(); use kvmalloc() to avoid the zeroing cost of
+	 * kvzalloc() on the ~13 KB allocation done on every ioctl call.
+	 */
+	kbuf = kvmalloc(tbl_size, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	ret = hsmp_metric_tbl_read(sock, kbuf, tbl_size);
+	if (ret < 0)
+		goto out;
+
+	if (copy_to_user(user_buf, kbuf, tbl_size))
+		ret = -EFAULT;
+	else
+		ret = 0;
+
+out:
+	kvfree(kbuf);
+	return ret;
+}
+
+long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	switch (cmd) {
+	case HSMP_IOCTL_CMD:
+		return hsmp_ioctl_msg(fp, arg);
+	case HSMP_IOCTL_GET_TELEMETRY_DATA:
+		return hsmp_ioctl_get_telemetry(fp, arg);
+	default:
+		return -ENOTTY;
+	}
+}
+
 ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 {
 	struct hsmp_message msg = { 0 };
-- 
2.34.1

