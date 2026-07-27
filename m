Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013054.outbound.protection.outlook.com [40.93.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CCD367280;
	Mon, 27 Jul 2026 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161781; cv=fail; b=W43iOPHY99P4D5Z/kjXn+snCnEirK9cETNx2/VD6z/xDxVh/0lqJoG5vHwn331MvCfWLliwBLQKS90hu89uja0qiuyxRuou7dTh645lFxiSm1YNuqPH5SopxfX0iD36poO/uO6STrU1z00V7zaxUVzT5jMy+Yw0FnAHw6RCi+oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161781; c=relaxed/simple;
	bh=oBiPMi687UEFr0syBWqRV6AQIqHtgoU7KIU3Zg3A4KE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g5UjqKf+++byXYyfh6lofEzbD3DMhfvghUi1pN8rvU//7fLXAqN1W46EOX9YBBa3Qa/YgGxWvhWAiqB0Prt9XN/onb66a3ID12q3s7mvvMsRYGf9MrLMSVCnaVpiSCUwXap2z/BxUSnPJsRGkWuh1ol98x634LZ680JjmeXYgkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kWpP+/0B; arc=fail smtp.client-ip=40.93.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kWpP+/0B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMfDBb3/sqHfkrLUexa3kKiBkIAU2v36OW6RkCbZkiWRncqUQ9zi9tBsFgQd+0U6QlRjLq59u0Zzn50YX5bV6JYHoEY8trN4WhBVa9n5Rr3tRVmergfcp5K2SfZUoUiQPAt1yK18AetZd3N/69aYtVno305O3UJRkXqDNIyc3ag8XLCHloJZNpWVmE3Q2y5G+A2OTVEtY7zVwHktQp2TI9HBS4kH946IjfpNOZgCkQL6VEE6clG+NtHlOIF1Wbg124HnXoBWYUOSWJyDFe87HCsQHYJWBGdAUdbYuNYHopM2/iCccbYzxQSUK9s8B7pO6pfTVP0dDupEzrznE/4zkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vtGsW2uNzfSsc4PgsNp6fFYwZ8sh8qVKM1X1+XknuY=;
 b=zCdTpn5XmDApX42I65kT/W8E5wqQv+eYKSJnUsHHrKdh9LKWXkqftnMT4Ay2MRS+KxvSYPf9DkpMsVEPe0/16BccBn+GN+k9xWj7uzRRF7fvFtqVDor6DlhXuggfIMfVfdpBB/AwxY+XrBWV+CaDEC6mXVhZRMFaykALfnzlae7Zyn1TKJYjBkLYOzoBDzvIeEDZ+0jjXyZc5ovnfSkTq78gcgATBYtWjyJ0cbJ9rIfLuPej5U4mm/hYL7UlM5TMsEOX1uURkA5E69im858ol7RhzvUeaXTICa8L4gz0d2wU2rDVruvqBrYnASu9Rf8qgOJ7JBdxIOek4o30mXrScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vtGsW2uNzfSsc4PgsNp6fFYwZ8sh8qVKM1X1+XknuY=;
 b=kWpP+/0BKs+0aXof51MKRGcN4CHR2FxR7RaLeagnbBrhB4CMVncLNp0SW4nfAnKYiXkaFIoPPiJ6/NqB0rJnczgHEcihrSGC/3ASNTCycIqQ4CRlHKJlAqkr381labNxY47DMTJ2hzhD0Pv2hCui6p42Dd94NlKA35jaxB9Xn1o=
Received: from SJ0PR05CA0188.namprd05.prod.outlook.com (2603:10b6:a03:330::13)
 by DM4PR12MB6302.namprd12.prod.outlook.com (2603:10b6:8:a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:16:11 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::1f) by SJ0PR05CA0188.outlook.office365.com
 (2603:10b6:a03:330::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.8 via Frontend Transport; Mon, 27
 Jul 2026 14:16:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:16:10 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 09:16:05 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v7 4/5] platform/x86/amd/hsmp: Add IOCTL_GET_TELEMETRY_DATA for metric table reads
Date: Mon, 27 Jul 2026 19:45:41 +0530
Message-ID: <20260727141542.3370108-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727141542.3370108-1-muralidhara.mk@amd.com>
References: <20260727141542.3370108-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|DM4PR12MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e36b53-314c-49d4-7885-08deebe99bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|22082099003|18002099003|56012099006|5023799004|11063799006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	bfIn3Sza9HdS/IpwFZ8yqPrZIFYS2jEXyk+FIXdIiYZLnJNnjIqibEc1PBqC6rkOz87ehoIftxXZ3VJFddcCzfMAVQp6uY/GDVlj1Kxol8hwnI6d+772ZzEypGoEIUaRNwr8WdbicBZSGTbP7Fc8TTDdlLIwAn+IiPNuq7IFqztOtBLOmFcFS5pBHuEh+r22dE+WMf2DY0DgnMUhYtNwbrJytBFz9ddi7Z60a08a9O7vmxBDmnX+czi+cOLUXYsKheIrHEWmz6CEpAyz8TLVk9uF1P89s8ig4EoLBwkgd+GsDVLxuFUzUMrcm1jG6EXfBp1DHJcbdXZR/mjQGIdvhS2Aqae/xNXM4PYfQk34UnnGqshhI3hLcbMmeuiZfBrqiNP3AFI1sGbHji0R5wLpBO8ZkvQCTCEeDQyX8Va/micYwXqjQLOnzZlvqYl9JtnozX0snxPPQMRHaOEROslX7FVydHLM5tJYmvVN+S/67v2gZKT2991mHXWFLu964Nsbqo0g/6+bAp8yidmdpspCY/93b2ahhGc37y2q84ovKe7qssS35rUPnAMv7nGy48MSgTHmyIQGc9w+JOILc8oSxx1cL130xDNwCediFEwt1OmwVaqwx/ANYiVD3+CGH4jzqlzbe5XfENA5W/JV6xiGCczRjJqfQOVE27WSliTlkGWnkiQJZ1LLjtuGm55GT9dnctTtBRLPoUCP15EpXpPtVg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IxsLxFqdKQwWB4HymMVdZ7zzwRYiRtaCvNguwqXhOemuDJOtYgqdeZ4jwlWwgWor+SlrysP8iLdFapyTqC9MQLToF+YHlJ6cY92qIlfAc9XenZR2axnbemTylC0wfcipLOLw46PIxYe+2CyxtRdwA9/Try36IwGSiGczKK01paT8F7L7qCN1qXNPY4mrx+ZlKO5aOk3ETUasPuqdG/Ydms2mWRIcL849FQpTkKqy9XaRHqsJNU0lXjqex58HpLnpxMAYWzutAOUDjGVbhKp2W10KMzQefU/bUAUDF48D0FvenVZHvZ9YSGyQ25uP3cLa07M6BA/nIiaB3sVA2wz6oP5fN2x2VqccLrpP6A+Ejo568RDOXhCwsO6JJOzWRTSlx23n8C0eU/nBS55ZWOdwxZOrEck6m4AjFwakp6txe/IU9SUGWKdrIXh0KERu6vEH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:16:10.6011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e36b53-314c-49d4-7885-08deebe99bca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6302

The metric table needs to be delivered to userspace as a single
atomic snapshot, but the current sysfs metrics_bin path is a file
read: userspace can read it in chunks and observe a torn snapshot
if an SMU refresh happens between read() calls. The same path is
also bounded by PAGE_SIZE, so the ~13 KB table used by HSMP protocol
version 7 on Family 1Ah Model 50h-5Fh cannot be returned at all,
regardless of how userspace reads it. Rather than extend sysfs to
lift both restrictions, expose the metric table through the
existing HSMP character device using a new ioctl that always copies
the table in one shot.

Add struct hsmp_telemetry_data and HSMP_IOCTL_GET_TELEMETRY_DATA
to the UAPI header. Under the surrounding #pragma pack(4), placing
the __u64 user pointer first gives a tight 16-byte layout that is
identical for 32- and 64-bit callers, and the trailing __u16
reserved field is rejected with -EINVAL if non-zero so future
kernels can repurpose it without breaking already-deployed
userspace. The command is encoded with _IOW because the kernel only
reads the request struct; the snapshot travels through the user
pointer it carries.

The requested size may be anything from one byte up to the size
firmware reported for that socket's table. A short request returns
the leading bytes of the snapshot, so userspace built against an
older table layout keeps working on firmware that grew the table,
mirroring the relaxed response_sz rule applied to HSMP messages
earlier in this series. A request larger than the firmware table is
rejected with -EINVAL rather than short-written, so a caller can
never mistake a partial copy for a full one.

Dispatch hsmp_ioctl() on the ioctl command: the existing message
handler is factored out as hsmp_ioctl_msg() for HSMP_IOCTL_CMD, and
HSMP_IOCTL_GET_TELEMETRY_DATA goes to a new
hsmp_ioctl_get_telemetry() helper.

/dev/hsmp is a singleton character device that outlives an
individual socket unbind, so an ioctl issued on an already-open fd
can run concurrently with socket teardown. hsmp_sock_rwsem is the
driver's contract for that: the data plane takes it for read, and
probe and remove take it for write to drain the data plane before
freeing the socket array, unmapping the metric tables and
destroying the per-socket mutexes. hsmp_ioctl_get_telemetry() takes
it for read across the socket lookup, the checks on that socket's
metric-table state and the table read itself, so none of that state
can be torn down underneath it. Without this the handler would
sleep in its kvmalloc() holding no lock at all, and could resume
with a freed socket, locking a destroyed mutex and reading from an
unmapped iomem region.

The lock is dropped before the copy_to_user(), because faulting in
the destination can block indefinitely on a userfaultfd-backed
buffer and would otherwise leave a socket unbind waiting for the
write lock.

Since hsmp_metric_tbl_read() reached the mailbox through
hsmp_send_message(), which takes hsmp_sock_rwsem itself, calling it
with the lock already held would recursively take the read side and
can deadlock against a queued writer. Split out
hsmp_metric_tbl_read_locked(), which asserts the lock and uses
hsmp_send_message_locked(), and leave hsmp_metric_tbl_read() as a
wrapper that takes the read lock for the sysfs callers. This also
brings the whole fill-and-copy under the rwsem for those callers,
where the memcpy_fromio() previously ran outside it, and makes the
lock order uniformly hsmp_sock_rwsem -> metric_read_lock ->
hsmp_sem.

The user-controlled socket index in HSMP_IOCTL_GET_TELEMETRY_DATA is
clamped with array_index_nospec() before indexing hsmp_pdev.sock[],
mitigating Spectre v1 (CVE-2017-5753). Include linux/nospec.h, which
the file relied on getting transitively.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst  |  35 ++++++-
 arch/x86/include/uapi/asm/amd_hsmp.h |  45 +++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 144 ++++++++++++++++++++++++++-
 3 files changed, 220 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 8bb411f0d70d..fa1fc240e212 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -68,6 +68,13 @@ under per socket sysfs directory created at
 
 Note: lseek() is not supported as entire metrics table is read.
 
+The sysfs metrics_bin path supports only HSMP protocol version 6 and,
+because it is a file read, can return a torn snapshot if userspace
+reads in pieces.  The protocol version 7 metric table (~13 KB) also
+exceeds PAGE_SIZE, so a read returns ``-EOPNOTSUPP`` there.  For
+atomic reads on any protocol version, use the
+``HSMP_IOCTL_GET_TELEMETRY_DATA`` ioctl on /dev/hsmp (see below).
+
 Metrics table definitions will be documented as part of Public PPR.
 The same is defined in the amd_hsmp.h header.
 
@@ -167,7 +174,7 @@ Next thing, open the device file, as follows::
     exit(1);
   }
 
-The following IOCTL is defined:
+The following IOCTLs are defined:
 
 ``ioctl(file, HSMP_IOCTL_CMD, struct hsmp_message *msg)``
   The argument is a pointer to a::
@@ -180,6 +187,32 @@ The following IOCTL is defined:
     	__u16	sock_ind;			/* socket number */
     };
 
+``ioctl(file, HSMP_IOCTL_GET_TELEMETRY_DATA, struct hsmp_telemetry_data *req)``
+  Atomically fetch the firmware metric (telemetry) table for a socket.
+  The ioctl copies the table in one shot, so unlike the metrics_bin
+  sysfs path it cannot return a torn snapshot and is not bounded by
+  PAGE_SIZE.  Required for HSMP protocol version 7+ (e.g. Family 1Ah
+  Model 50h-5Fh, whose table is ~13 KB).  Argument::
+
+    struct hsmp_telemetry_data {
+        __u64 buf; /* User pointer to destination buffer */
+        __u32 size; /* Size of @buf in bytes */
+        __u16 sock_ind; /* Socket index */
+        __u16 reserved; /* Reserved, must be zero */
+    };
+
+  ``size`` must be non-zero and no larger than the table size firmware
+  reports for that socket; a larger value is rejected with ``-EINVAL``
+  rather than short-written, and a smaller one returns the leading
+  ``size`` bytes of the snapshot.  A non-zero ``reserved`` is also
+  rejected with ``-EINVAL``.
+
+  The table layout depends on the protocol version, which userspace
+  reads from the ``protocol_version`` sysfs attribute.  On version 6
+  the table is ``struct hsmp_metric_table``, so callers pass
+  ``sizeof(struct hsmp_metric_table)``.  Later version metrics table
+  layout is documented in the Public PPR.
+
 The ioctl would return a non-zero on failure; you can read errno to see
 what happened. The transaction returns 0 on success.
 
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index d1d3bc60cffc..eda336bfd3e9 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -612,6 +612,39 @@ struct hsmp_metric_table {
 	__u32 gfxclk_frequency[8];
 };
 
+/**
+ * struct hsmp_telemetry_data - Request descriptor for HSMP telemetry IOCTL
+ * @buf:       Input. Userspace pointer (encoded as __u64 to keep the layout
+ *             stable between 32-bit and 64-bit callers) to the destination
+ *             buffer that receives the metric table.
+ * @size:      Input. Size in bytes of the buffer pointed to by @buf, and the
+ *             number of bytes copied out on success.  Must be non-zero and no
+ *             larger than the metric table size firmware reports for this
+ *             socket; a larger value is rejected with -EINVAL rather than
+ *             short-written.  A smaller value returns the leading @size bytes
+ *             of the snapshot.  The kernel does not write this field back.
+ * @sock_ind:  Input. Socket index from which the metric table is read.
+ * @reserved:  Reserved for future use.  Callers should set this to zero;
+ *             future kernels may begin interpreting the field, so passing
+ *             a non-zero value today is not forwards compatible.
+ *
+ * Placing @buf first lets all fields fall on their natural alignment under
+ * the surrounding #pragma pack(4), so the struct is a tight 16 bytes with
+ * the same wire layout on 32-bit and 64-bit userspace.
+ *
+ * The metric table layout depends on the HSMP protocol version reported by
+ * firmware, which userspace can read from the protocol_version sysfs
+ * attribute.  Protocol version 6 uses struct hsmp_metric_table, so callers on
+ * that version pass sizeof(struct hsmp_metric_table).  Later version metrics
+ * table layout is documented in the Public PPR.
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
 
@@ -619,4 +652,16 @@ struct hsmp_metric_table {
 #define HSMP_BASE_IOCTL_NR	0xF8
 #define HSMP_IOCTL_CMD		_IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
 
+/*
+ * Fetch the firmware metric (telemetry) table for a given socket via the
+ * HSMP character device.  This avoids the PAGE_SIZE limitation of the
+ * sysfs binary attribute path for tables larger than one page (such as the
+ * ~13 KB table used by HSMP protocol version 7).
+ *
+ * The direction is _IOW because the kernel only reads the request struct;
+ * the table itself is written to the buffer that @buf points at.
+ */
+#define HSMP_IOCTL_GET_TELEMETRY_DATA \
+	_IOW(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
+
 #endif /*_ASM_X86_AMD_HSMP_H_*/
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 3e9bdbcd9ea9..5e123a4ecea9 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -15,9 +15,12 @@
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/mutex.h>
+#include <linux/nospec.h>
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
+#include <linux/uaccess.h>
 
 #include "hsmp.h"
 
@@ -347,7 +350,7 @@ static bool is_get_msg(struct hsmp_message *msg)
 	return false;
 }
 
-long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
 	struct hsmp_message msg = { 0 };
@@ -416,11 +419,139 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 	return 0;
 }
 
-ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
+static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
+					   size_t size);
+
+/*
+ * Fetch the firmware metric (telemetry) table for the requested socket and
+ * copy it to the userspace buffer described by the request.
+ *
+ * The metric table size is variable across HSMP protocol versions and on
+ * Family 1Ah Model 50h-5Fh exceeds PAGE_SIZE.  The request carries the buffer
+ * size, which may be anything up to the size firmware reported for this
+ * socket's table.
+ */
+static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
+{
+	void *kbuf __free(kvfree) = NULL;
+	void __user *arguser = (void __user *)arg;
+	struct hsmp_telemetry_data req;
+	struct hsmp_socket *sock;
+	void __user *user_buf;
+	size_t tbl_size;
+	unsigned int sock_ind;
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
+	user_buf = u64_to_user_ptr(req.buf);
+
+	/*
+	 * /dev/hsmp is a singleton character device that outlives an individual
+	 * socket unbind, so an ioctl on an already-open fd can run concurrently
+	 * with socket teardown.  Hold hsmp_sock_rwsem for read across the socket
+	 * lookup, the checks on its metric-table state and the read itself:
+	 * probe and remove take the same lock for write, so they cannot free the
+	 * socket array, unmap the table or destroy the per-socket mutex while
+	 * this runs.
+	 *
+	 * The lock is dropped before the copy_to_user() below.  Faulting in the
+	 * destination can block indefinitely on a userfaultfd-backed buffer,
+	 * which would leave a socket unbind waiting for the write lock.
+	 */
+	scoped_guard(rwsem_read, &hsmp_sock_rwsem) {
+		if (!hsmp_pdev.sock || req.sock_ind >= hsmp_pdev.num_sockets)
+			return -ENODEV;
+
+		/*
+		 * Sanitize the user-controlled socket index against speculative
+		 * execution.  The bounds check above retires the out-of-range
+		 * case with -ENODEV, but a mispredicted branch can still let the
+		 * CPU speculatively use sock_ind as an index into
+		 * hsmp_pdev.sock[] and pull arbitrary kernel memory into the
+		 * cache (Spectre v1, CVE-2017-5753).  array_index_nospec() turns
+		 * the bounds check into a data-flow clamp so the speculative
+		 * load is in-range too.
+		 */
+		sock_ind = array_index_nospec(req.sock_ind, hsmp_pdev.num_sockets);
+		sock = &hsmp_pdev.sock[sock_ind];
+		if (!sock->metric_tbl_addr)
+			return -ENODEV;
+
+		tbl_size = sock->metric_tbl_size;
+		if (!tbl_size)
+			return -ENODEV;
+
+		/*
+		 * A request shorter than the firmware table is served with the
+		 * leading @size bytes of the snapshot, so userspace built
+		 * against an older table layout keeps working on firmware that
+		 * grew the table.  Asking for more than firmware provides is
+		 * rejected rather than short-written, so a caller can never
+		 * mistake a partial copy for a full one.
+		 */
+		if (!req.size || req.size > tbl_size)
+			return -EINVAL;
+
+		/*
+		 * The bounce buffer is overwritten in full by memcpy_fromio()
+		 * inside hsmp_metric_tbl_read_locked(); use kvmalloc() to avoid
+		 * the zeroing cost of kvzalloc() on the ~13 KB allocation done
+		 * on every ioctl call.
+		 */
+		kbuf = kvmalloc(tbl_size, GFP_KERNEL);
+		if (!kbuf)
+			return -ENOMEM;
+
+		ret = hsmp_metric_tbl_read_locked(sock, kbuf, tbl_size);
+	}
+
+	if (ret < 0)
+		return ret;
+
+	if (copy_to_user(user_buf, kbuf, req.size))
+		return -EFAULT;
+
+	return 0;
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
+/*
+ * Caller must hold hsmp_sock_rwsem. It keeps @sock, its metric-table mapping
+ * and its metric_read_lock alive: probe and remove take the same lock for
+ * write while they bring sockets up and tear them down.
+ */
+static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
+					   size_t size)
 {
 	struct hsmp_message msg = { 0 };
 	int ret;
 
+	lockdep_assert_held(&hsmp_sock_rwsem);
+
 	if (!sock || !buf)
 		return -EINVAL;
 
@@ -445,13 +576,20 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 	 */
 	guard(mutex)(&sock->metric_read_lock);
 
-	ret = hsmp_send_message(&msg);
+	ret = hsmp_send_message_locked(&msg);
 	if (ret)
 		return ret;
 	memcpy_fromio(buf, sock->metric_tbl_addr, size);
 
 	return size;
 }
+
+ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
+{
+	guard(rwsem_read)(&hsmp_sock_rwsem);
+
+	return hsmp_metric_tbl_read_locked(sock, buf, size);
+}
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
 
 void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev)
-- 
2.34.1

