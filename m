Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010056.outbound.protection.outlook.com [40.93.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C835AC00;
	Fri, 12 Jun 2026 04:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238412; cv=fail; b=rwVWYYfAo+F8+d+doSo6L0PLob8AeDewqG5DJtr9hOrVEiqE+RFfmshT6KxtW8Atvh6GqA+1lhjQmxbZg6OmxAS9z04nMC9y3gYv1bvXQgbK6K3GyuygxTgIGuZHPCYWOfq387lNVNrk15jl32izTO9o/dVheVzAqOhcN9wnlY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238412; c=relaxed/simple;
	bh=JpKj3RSKA5qqZhFzgqdxiKfTTA+g6zpgmWBnKf0p+74=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2u+M2uKeIkdUlb4wbMcROIF5ROIW2JqJFhd3JprMRScVB+K0l85HCAfGKrWDqE0yKa4TmU+MUnW/Pmp65pIWiIcrd6TYNBhJTShND2fUMqMkgCi9xzMwf6S1F/DVGGztrxeSFTfsTxw0hX3c0e/jbKWjagiy2/ykzk1VCDmzfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YIRvckXQ; arc=fail smtp.client-ip=40.93.198.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YIRvckXQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3UWF28RI+9oLqJvyKo0bfg04TV7QNbTZlswLammNwWIhhunWhLR+geuX8fReVGTEGr/GNhsLWEm7E+1BwUXsVSntyerpiwofusLRGS2ZUMDC2uZKVmmWvW+OWWI/IrL6fyuTeai51hpvERnk0vrUcGgZRAB5HUEK0iLGRteK7MDJvM7Jh+Og3QqgF2H0V+S5ZvCRTmO2ojTMWcAx1aZA+WZEgRLJQJXr37A5/P+iUl6z4P70ryC9pbcV3FwnthD/MiyoaDWOkHi1QcBAf3YiSQ73ZKWQRZi6MdmT3rQ7hxEas+9W3uMHQThSMEH5vuX6jtOCJCF0AD7xvwoJjmzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BiCFEdgR6Y9PpImQYcd/Www2YkpINQB3LbTWKEoRSJs=;
 b=P9xv2oy4+qTXRbpCAqLHmmgXJCUvMwuKJ+r9BaU4PH1iyAj/dFg4+gYZBahZWXzDc/Sg4hLEFOzEuoCd10wykVXfiwlQ084Q0BDgjObJrdaesaaEjIjuVil/XQ9GcR/ZB2VW82cdcpET6cuNfEuv/hjm1pzBzz1+Zcfctu4fvbFyyBur/Xk/plv0R38uwnPtemDeiEqkEXBLdPhSu6mu7pFThnO86s8dwZ9wgGZXh1uyuEoOEska6aJb3uZowRTrmGSOoW0ZRWX2QEDGTGQ3hOoMR4JlhjWfAAnTtlEt8G79d0iSNHdeQqZsAJDYL6VDtXVbsRzx8PIHp3CXLCE7yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BiCFEdgR6Y9PpImQYcd/Www2YkpINQB3LbTWKEoRSJs=;
 b=YIRvckXQl+oxv+Xsy3utuwQzv/XjVK+1C+rY+qMzW3dL5DFQQEEDFvhrwhkDdj+1v//1zf65st8g3mBNhhmExxiifVV+7oGaHEzPF/FzbyR4Dcyme0mFymTI1FBOAP2gzIlI4yC2Nu14ltVN0HaqSYaglMPrhX2Iy/PO9wdml24=
Received: from SJ0PR03CA0238.namprd03.prod.outlook.com (2603:10b6:a03:39f::33)
 by CH3PR12MB9220.namprd12.prod.outlook.com (2603:10b6:610:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 04:26:44 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::40) by SJ0PR03CA0238.outlook.office365.com
 (2603:10b6:a03:39f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Fri,
 12 Jun 2026 04:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 04:26:44 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 23:26:39 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v6 5/8] platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table reads
Date: Fri, 12 Jun 2026 09:56:07 +0530
Message-ID: <20260612042610.1629037-6-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612042610.1629037-1-muralidhara.mk@amd.com>
References: <20260612042610.1629037-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|CH3PR12MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: 660ffd2f-d73d-476f-5e93-08dec83acf6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|11063799006|5023799004|3023799007|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eMLDKo+dCaLJvAcTbQS0mj7AYElnF0nzjQ4VTcjlLx6acyqWoMOmU+WhmF9ECR7aW0z7okqPR05ZEd4Pwoklu5d3qJ+cB2oUU2cWP+N2VgRTotubODQzkCWzhPJDs4aQd2Sm6cRaKUmwewTCWz55IsDLyVVzumF1R0ey2ev2ow2kNNReHWb0dwZE6lKy44UQEHNU/39ilEdOvYPt1s++aVyI+5/TkctTSgOBcMQgXoAvMNWTiuAfjA/bKLjDbsk/yAnLXkBUSXZZbUjXN6+xPUSYbFdLxR/Y8GVlFwcn18YVV6XNudcw8QSAlFJt1VphMhR7Am74ovGMW+1rFvdjYpvstYUa7OK+T0xDeTeTujNx12b8c1M4NbFMtU30SC49vtVSD5tru9tdCfT3aEhnCjasmiKdXbCOfX2U0cmAunMkZAw40zpdRjX8F6/VLjg55AVHCnwm5NngVExjEhMPtuVKHgtI6cw6Umvyqizc+G664hKaYG0lDS/hh42mgHRgFaxC5j5yDhRaAEo/JknEixLKE4KvF+MOBGO9jYC1WFiHxAguwe4aIFgYmwD+6dMhPkOZe/1TGcE9ghkKjHeCNpI8+OCNU3PiZIdPAl52q5sdsMIF4oHOqx79sR8WXPz85aLkesJNe3P/YCkLRoLi2CcaPq1O1PIcMej1WM29xEr4s3ys7VVYAqjmSVsz5sowJ2LMyeEnbTP/dx1+JMxhCzER6nC0T+5Ig6/uS7rU9hE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(11063799006)(5023799004)(3023799007)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wNHdzWcbeXzqHgOBAdiqyVViulok7wbK7zuPZoWjErvuoXWGxJHNU6tcpopn7V2JZ2rM/nDb1dsWv5bwN6riDHmuWmAojJP2g8iYLJHcb2SWt5ZwJX0ePf+S24p/rbfI6H8ibPDB1fXVbrt7ry04Mkw1JPLnpu/lhmlgfvR++nr/n8exVJXLrGoS0X7wEFH442sw1CUssT84yBZyCwLjZfP8gWgVF/PxwD+C/aTTQcRkiWUup76PEKFK0KddkB6lRfc85o+AQx8vucyldPMfBtRLL+GmIxlQAe8LyaHgTY2YzuJkoYOzE22eP8yEZ8d97hVY8QAiehTpT5NIsYS/ngHWNxUJNGSGQ8qCuyvEbdAYVv++wV9tNQIzPZ9u+zx62xIdrSYnFXARW9tzdA/1Z0LeHZpp5r4Vjr4bNLASwPX3BIPiZpNocPBCg7PZljFn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:26:44.5892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 660ffd2f-d73d-476f-5e93-08dec83acf6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9220

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

The user-controlled socket index in HSMP_IOCTL_GET_TELEMETRY_DATA is
clamped with array_index_nospec() before indexing hsmp_pdev.sock[],
mitigating Spectre v1 (CVE-2017-5753).

Reviewed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst  |  30 +++++++-
 arch/x86/include/uapi/asm/amd_hsmp.h |  43 +++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 104 ++++++++++++++++++++++++++-
 3 files changed, 175 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 8bb411f0d70d..301c0091f5bf 100644
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
+        __u64 buf; /* User pointer to destination buffer */
+        __u32 size; /* Size of @buf, must equal firmware-reported table size */
+        __u16 sock_ind; /* Socket index */
+        __u16 reserved; /* Reserved, must be zero */
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
index 77bea5ab7ade..9b246fd724ef 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -702,6 +702,40 @@ struct hsmp_metric_table_zen6 {
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
 
@@ -709,4 +743,13 @@ struct hsmp_metric_table_zen6 {
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
index cf9392f99298..36ff83744684 100644
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
@@ -343,6 +346,105 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
+/*
+ * Fetch the firmware metric (telemetry) table for the requested socket and
+ * copy it to the userspace buffer described by the request.
+ *
+ * The metric table size is variable across HSMP protocol versions and on
+ * Family 1Ah Model 50h-5Fh exceeds PAGE_SIZE.  Userspace must therefore
+ * supply a buffer equal to the firmware-reported size in bytes.
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

