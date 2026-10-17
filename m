Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012044.outbound.protection.outlook.com [52.101.53.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621F018787A;
	Sat, 17 Oct 2026 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255946; cv=fail; b=nX/L4j/oBUFiLHjEVcC/dgjsd8YQTO8uJF1DpmSJbRAE/yq4nit7n6bjTpBZGP1VMUUA3O0Nasxgp8SLVnv/YuagYSctQYl2rNencRGCLF5hIy1093Lx8/G8VSLuxyXVucOHvyw1GVk5BAdpIP0NS8b4NUjgaqxBI0Qpq9VuV90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255946; c=relaxed/simple;
	bh=pERa9x3W9XqbKVLUqgWzjjwyl6DVWM47tNKDTUonR7I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQ2tWWnnGtWWswW3fx+c8L9XLf5Jv1SmoB0bpJojsVbZ3Hpb7CGyvGNK3BCw/ayBMhhjfHkdYOZVF/Yam8MYf0LOdE6rVMkEd4JJoNHJEBXC45XmyXQlSG04QIhAY+5XBpfRkd3hwa2YtRNE+8jrgMOeabtoDwwwMbjNMNOSxr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yfMn/0cX; arc=fail smtp.client-ip=52.101.53.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yfMn/0cX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpDV0sPNXK57BzZGMnwed2zOQrPHMw6XZvQdlreCJgMLswvR8DboZECCe6TgS2l49OIHEV3ltFM8QiClgIUC9MTHL4zJ1mC/aD4wmwjH6KL8VrEI2pb7W6Zog0wflbkq6Kj0WfulyXlr7WXzSt9XJYO7FX8jc7/LfxHqPW/V6apW7J4/k/O1TENLapXBgxsRkHP80U2tKBmNf0TJB+7MsU30pGKEToee4xo1+Oc8WDk4gfqafVgdzHEcAch4K48XDrekRkpOSwlJIhore3MmjxJr9N/ixKVZbcIJKft3aZ+lVvB5O76D/T8GPKJd39WH48SB88v8A6vjDFVOm/kc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qLGmGUZGUdQ7Kpk1m81mghlFmbiMMbK7oLDB4fo8yI=;
 b=Nm58h2t9vtM3ojWTTmPq6ULnjFotoo9SAe83vXMOhsqfWwf4960skd9e6XN2silbUUl9ZxRcHLuFzsnClHhwEtXCkG6X4ZWLsQlP/tjon9fC0mY6LF3nS9GgVbyeL0ufNLp9WmS0xIuPIsctV3w/9iobILKM23AACwtCCfanRUJRjCzSorXWwUeHzyGgYjMZIocR3WFNlkvDoYR0xMynXRDmm5kTVNjLMCOOiHJ5GlDosoNQQl865AV5PG5SLVxMOw5Fjm8lhvl3d6WD2p4Wk3DTo2lRv4WCXTQb49se9I5lbh/lLpLUiQWZI5rux7SW/Xh4KwERQOjRg2WTwSQFlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qLGmGUZGUdQ7Kpk1m81mghlFmbiMMbK7oLDB4fo8yI=;
 b=yfMn/0cXl4TD6pUgpUI9ZME7aTJNerHfYi+QDvIuzQFX1DwrfPydccb/3G0vaiSb5Fha4HQZ5OitHtV56vCGIX2Nm9IEA9AcOcHD8QtFCozKM0Bpf/3XEah+5Z11drBKtZucEXCsjsJA3OvUJCteQ7xKWtOQ6mEWJHfhqLcjhXI=
Received: from SJ0PR05CA0099.namprd05.prod.outlook.com (2603:10b6:a03:334::14)
 by MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Sat, 17 Oct
 2026 16:52:18 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:a03:334:cafe::8b) by SJ0PR05CA0099.outlook.office365.com
 (2603:10b6:a03:334::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Sat, 17
 Oct 2026 16:52:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 16:52:17 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 17 Oct
 2026 11:52:05 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/hsmp: Report raw SMU mailbox status via smu_response
Date: Sat, 17 Oct 2026 22:21:53 +0530
Message-ID: <20261017165153.3748458-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017165153.3748458-1-muralidhara.mk@amd.com>
References: <20261017165153.3748458-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|MN2PR12MB4096:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc286b0-c99c-45b5-d73f-08df2c6f00ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|56012099006|11063799006|5023799004|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	stX96ezAHZ0sDXBcB/4PXU+oQc/RsaSBRgSKiDB3evSL16eMpY/5OZ5VQ+P0W0qyp4s/K9YlsQjX5TNyjiZX0tx9idvry9LQozToNEHIzWKR3VuAbcNpFpVgzHOkrn6UCPaJ+u7MotAoZNRh7Opxx3BIortBuANH1mv05hIG0yJ9+o4i35kD0HXmEvKXvRJGDfxFvncUPK51VIs4T4nCuAJw0/qYy40+7kyXNz/EyZdmGNr7IP6wC5+rNRbaSaEM1C03K9D+HjFyMHfXsJKioGR4K4v0Hi4s5iD5v9YGYkz2vHjriBjczg9u/uNmRbQcg5Y4CpuV6qsZQ65OiHRXay70ZMJpQBTFuod33OmrU06JnePbi1TdQgaVYBB1632NRC3lLOUtw3geCWmoQ0zbVOLCekO3NJqcEG9lCyOF/Sk0fY/RM1tISKvU0RyKKgnAcmauifApvS9KxBWAZmu2nALQ5/IhFlkqdbLPQtwNMmGJuqBd7uLIrBoBUo49lFLJAET7AVB7EqW2zpoNJ6nk4RvY0O2S+w4qN/YW4snnW9tylSG97eglHsXSaRdvGaSEVAZRk72YM0VNgZoKCNab+s7gX9mwjhPIAYnK98/kpiSmAnCY2njf9TnRyaltiZjPyuWiB7sUfbq7DmjH8hEarL+qpQkovXcSCicEBSIpu08H57EpsitnFU9swVeU2w8fffS/Bxa0lDghTDZY1tvBjg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JLmqgacXCGmP4o5P90goy2xUx87sHK+gxxGNoFvHE47PJ93OpXvAda3wY28BjNfYzSNAb+TzRYazb8urBriBrnjqQJY7brpxt+JecZ0slgm5VEetawffRMOpVHSHDgPX3+8UdH+gBcA0dCswMd02dkiq1wxcyc5wYotBLu19ihw6BZvrjj1kj5A/sO02NYyGLR8UaX47zpzOaoYUXo60BHvdRsfMnTOCLzW6RYbiY+1TXAffAnCQmi0vNaW6dqqsCFC4eeZVFOPYHuWubkVZu/Ih4jPLJAfmOE5YI7NdrfQpzfFol3U+6tpTeUv09LkT359zrbtYidgv5rDbBHKUo/ucXO2dOwI+fqJkyNmwbDjsZPdoN9uKJkMBbe7yc8RJFjlEC6aTBSc228rRb4umtEGUKY308TYcgWA2Mm6iajUR9eIIoN9Od3I/dhnKFmE7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 16:52:17.5038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc286b0-c99c-45b5-d73f-08df2c6f00ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096

Add a __u32 smu_response field to struct hsmp_message, set by
__hsmp_send_message() from the polled SMU mailbox status register.
hsmp_ioctl_msg() now always copies the message struct back to
userspace, even on failure, so smu_response is visible on every call.
Initialize it to HSMP_STATUS_NOT_READY before dispatch, so a request
rejected before reaching the SMU reports a defined value instead of
echoing back the caller's input.

Replace the reserved field in struct hsmp_telemetry_data with a __u32
smu_response, threaded through hsmp_metric_tbl_read_locked() as a new
optional out-parameter and surfaced by hsmp_ioctl_get_telemetry().
Change HSMP_IOCTL_GET_TELEMETRY_DATA from _IOW to _IOWR, since the
request struct is now written back to.

Both structs grow under #pragma pack(4) (44->48 and 16->20 bytes),
changing the encoded command number of both HSMP_IOCTL_CMD and
HSMP_IOCTL_GET_TELEMETRY_DATA; existing callers of either ioctl need
to rebuild against this header.

Fix hsmp_ioctl_get_telemetry()'s copy_to_user() error check to compare
ret >= 0 instead of !ret: hsmp_metric_tbl_read_locked() returns a byte
count on success, never exactly 0, so the old check never actually
fired and a failed copy of the smu_response-bearing req struct went
unreported.

Update Documentation/arch/x86/amd_hsmp.rst to match.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst  |  28 +++++---
 arch/x86/include/uapi/asm/amd_hsmp.h |  35 +++++++---
 drivers/platform/x86/amd/hsmp/hsmp.c | 101 ++++++++++++++++++---------
 3 files changed, 113 insertions(+), 51 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index c483c68dcfad..9d4aaa8936f4 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -188,13 +188,21 @@ The following IOCTLs are defined:
   The argument is a pointer to a::
 
     struct hsmp_message {
-    	__u32	msg_id;				/* Message ID */
-    	__u16	num_args;			/* Number of input argument words in message */
-    	__u16	response_sz;			/* Number of expected output/response words */
-    	__u32	args[HSMP_MAX_MSG_LEN];		/* argument/response buffer */
-    	__u16	sock_ind;			/* socket number */
+        __u32 msg_id;                      /* Message ID */
+        __u16 num_args;                    /* Number of input argument words in message */
+        __u16 response_sz;                 /* Number of expected output/response words */
+        __u32 args[HSMP_MAX_MSG_LEN];       /* argument/response buffer */
+        __u16 sock_ind;                    /* socket number */
+        __u32 smu_response;                /* Output: raw SMU mailbox status */
     };
 
+  ``msg`` is copied back to userspace after every call, regardless of
+  whether the ioctl succeeds or fails, so ``smu_response`` is always
+  visible: 0 means the message was never sent to the SMU (rejected
+  before dispatch, e.g. an invalid msg_id or argument count), 1 means
+  the SMU accepted it, and any other value is an SMU-specific error
+  code.
+
 ``ioctl(file, HSMP_IOCTL_GET_TELEMETRY_DATA, struct hsmp_telemetry_data *req)``
   Atomically fetch the firmware metric (telemetry) table for a socket.
   The ioctl copies the table in one shot, so unlike the metrics_bin
@@ -206,14 +214,18 @@ The following IOCTLs are defined:
         __u64 buf; /* User pointer to destination buffer */
         __u32 size; /* Size of @buf in bytes */
         __u16 sock_ind; /* Socket index */
-        __u16 reserved; /* Reserved, must be zero */
+        __u32 smu_response; /* Output: raw SMU mailbox status */
     };
 
   ``size`` must be non-zero and no larger than the table size firmware
   reports for that socket; a larger value is rejected with ``-EINVAL``
   rather than short-written, and a smaller one returns the leading
-  ``size`` bytes of the snapshot.  A non-zero ``reserved`` is also
-  rejected with ``-EINVAL``.
+  ``size`` bytes of the snapshot.  ``req`` is copied back to userspace
+  with ``smu_response`` filled in on every call, including failures:
+  1 means the HSMP_GET_METRIC_TABLE message that refilled the table
+  succeeded, 0 means it was never attempted (a request rejected before
+  dispatch, e.g. an invalid socket index or size), and any other value
+  is an SMU-specific error code.
 
   The table layout depends on the protocol version, which userspace
   reads from the ``protocol_version`` sysfs attribute.  On version 6
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index dcbe89dc4d2b..1ac385996a4e 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -88,6 +88,7 @@ struct hsmp_message {
 	__u16	response_sz;		/* Number of expected output/response words */
 	__u32	args[HSMP_MAX_MSG_LEN];	/* argument/response buffer */
 	__u16	sock_ind;		/* socket number */
+	__u32	smu_response;		/* Output: raw SMU mailbox status */
 };
 
 enum hsmp_msg_type {
@@ -644,13 +645,17 @@ struct hsmp_metric_table {
  *             short-written.  A smaller value returns the leading @size bytes
  *             of the snapshot.  The kernel does not write this field back.
  * @sock_ind:  Input. Socket index from which the metric table is read.
- * @reserved:  Reserved for future use.  Callers should set this to zero;
- *             future kernels may begin interpreting the field, so passing
- *             a non-zero value today is not forwards compatible.
+ * @smu_response: Output. Raw SMU mailbox status from the HSMP_GET_METRIC_TABLE
+ *             message that refilled the table (0 = not attempted/not ready,
+ *             1 = success, other values are command-specific SMU error
+ *             codes). Callers should set this to zero on input; the kernel
+ *             always overwrites it before returning.
  *
- * Placing @buf first lets all fields fall on their natural alignment under
- * the surrounding #pragma pack(4), so the struct is a tight 16 bytes with
- * the same wire layout on 32-bit and 64-bit userspace.
+ * Placing @buf first and @smu_response last lets all fields fall on their
+ * natural alignment under the surrounding #pragma pack(4); the compiler
+ * inserts 2 bytes of padding after @sock_ind so @smu_response lands on a
+ * 4-byte boundary, giving the struct the same 20-byte wire layout on 32-bit
+ * and 64-bit userspace.
  *
  * The metric table layout depends on the HSMP protocol version reported by
  * firmware, which userspace can read from the protocol_version sysfs
@@ -662,13 +667,20 @@ struct hsmp_telemetry_data {
 	__u64	buf;
 	__u32	size;
 	__u16	sock_ind;
-	__u16	reserved;
+	__u32	smu_response;
 };
 
 /* Reset to default packing */
 #pragma pack()
 
-/* Define unique ioctl command for hsmp msgs using generic _IOWR */
+/*
+ * Define unique ioctl command for hsmp msgs using generic _IOWR.
+ *
+ * The encoded command number embeds sizeof(struct hsmp_message), so it
+ * changes whenever that struct's size changes (as it just did when the
+ * __u32 smu_response field was added); existing callers need to rebuild
+ * against this header.
+ */
 #define HSMP_BASE_IOCTL_NR	0xF8
 #define HSMP_IOCTL_CMD		_IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
 
@@ -678,11 +690,12 @@ struct hsmp_telemetry_data {
  * sysfs binary attribute path for tables larger than one page (such as the
  * ~13 KB table used by HSMP protocol version 7).
  *
- * The direction is _IOW because the kernel only reads the request struct;
- * the table itself is written to the buffer that @buf points at.
+ * The direction is _IOWR: the kernel reads the request struct (buf, size,
+ * sock_ind) and also writes back into it (smu_response), in addition to
+ * writing the table itself to the buffer that @buf points at.
  */
 #define HSMP_IOCTL_GET_TELEMETRY_DATA \
-	_IOW(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
+	_IOWR(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
 
 /**
  * enum hsmp_client_message_ids - Ryzen Master SMC (RMSMC) message IDs
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 635e6d5723ac..6a56a908912c 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -173,6 +173,14 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
 	mbinfo = &sock->mbinfo;
 
+	/*
+	 * Initialize this to HSMP_STATUS_NOT_READY up front so every return
+	 * path, including the raw register access failures below (before
+	 * the mailbox status is ever polled), reports a defined value
+	 * instead of echoing back whatever the caller happened to pass in.
+	 */
+	msg->smu_response = HSMP_STATUS_NOT_READY;
+
 	/* Clear the status register */
 	mbox_status = HSMP_STATUS_NOT_READY;
 	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
@@ -229,6 +237,14 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 			usleep_range(1000, 2000);
 	}
 
+	/*
+	 * Surface the raw SMU mailbox status to the caller regardless of
+	 * outcome via msg->smu_response, so userspace can inspect the exact
+	 * hardware status without decoding it from the translated errno
+	 * below.
+	 */
+	msg->smu_response = mbox_status;
+
 	if (unlikely(mbox_status == HSMP_STATUS_NOT_READY)) {
 		dev_err(sock->dev, "Message ID 0x%X failure : SMU timeout (status = 0x%X)\n",
 			msg->msg_id, mbox_status);
@@ -471,6 +487,15 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 	if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
 		return -EFAULT;
 
+	/*
+	 * Initialize this to HSMP_STATUS_NOT_READY regardless of what the
+	 * caller passed in: it must only ever reflect a real SMU mailbox
+	 * status set by __hsmp_send_message(), never a stale value echoed
+	 * back on a failure (invalid/reserved msg_id, arg count mismatch,
+	 * bad socket, etc.) that is caught before the message is ever sent.
+	 */
+	msg.smu_response = HSMP_STATUS_NOT_READY;
+
 	/*
 	 * The client message set has no per-message descriptor table to
 	 * bounds-check msg_id against or index into, and no per-message
@@ -524,25 +549,20 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 	}
 
 	ret = hsmp_send_message(&msg);
-	if (ret)
-		return ret;
 
 	/*
-	 * The client message set has no per-message response_sz to check
-	 * here (desc is NULL); validate_message() already bounded
-	 * msg.response_sz.
+	 * Always copy the message struct back to userspace, even on
+	 * failure, so the raw SMU mailbox status in msg.smu_response is
+	 * always visible to the caller regardless of outcome.
 	 */
-	if ((desc ? desc->response_sz : msg.response_sz) > 0) {
-		/* Copy results back to user for get/monitor commands */
-		if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
-			return -EFAULT;
-	}
+	if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
+		return -EFAULT;
 
-	return 0;
+	return ret;
 }
 
 static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
-					   size_t size);
+					   size_t size, u32 *smu_response);
 
 /*
  * Fetch the firmware metric (telemetry) table for the requested socket and
@@ -558,6 +578,7 @@ static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
 	void *kbuf __free(kvfree) = NULL;
 	void __user *arguser = (void __user *)arg;
 	struct hsmp_telemetry_data req;
+	u32 smu_response = HSMP_STATUS_NOT_READY;
 	struct hsmp_socket *sock;
 	void __user *user_buf;
 	size_t tbl_size;
@@ -571,13 +592,6 @@ static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
 	if (copy_from_user(&req, arguser, sizeof(req)))
 		return -EFAULT;
 
-	/*
-	 * Reserved fields must be zero so future kernels can safely
-	 * repurpose them without breaking already-deployed userspace.
-	 */
-	if (req.reserved)
-		return -EINVAL;
-
 	user_buf = u64_to_user_ptr(req.buf);
 
 	/*
@@ -594,8 +608,10 @@ static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
 	 * which would leave a socket unbind waiting for the write lock.
 	 */
 	scoped_guard(rwsem_read, &hsmp_sock_rwsem) {
-		if (!hsmp_pdev.sock || req.sock_ind >= hsmp_pdev.num_sockets)
-			return -ENODEV;
+		if (!hsmp_pdev.sock || req.sock_ind >= hsmp_pdev.num_sockets) {
+			ret = -ENODEV;
+			break;
+		}
 
 		/*
 		 * Sanitize the user-controlled socket index against speculative
@@ -609,12 +625,16 @@ static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
 		 */
 		sock_ind = array_index_nospec(req.sock_ind, hsmp_pdev.num_sockets);
 		sock = &hsmp_pdev.sock[sock_ind];
-		if (!sock->metric_tbl_addr)
-			return -ENODEV;
+		if (!sock->metric_tbl_addr) {
+			ret = -ENODEV;
+			break;
+		}
 
 		tbl_size = sock->metric_tbl_size;
-		if (!tbl_size)
-			return -ENODEV;
+		if (!tbl_size) {
+			ret = -ENODEV;
+			break;
+		}
 
 		/*
 		 * A request shorter than the firmware table is served with the
@@ -624,8 +644,10 @@ static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
 		 * rejected rather than short-written, so a caller can never
 		 * mistake a partial copy for a full one.
 		 */
-		if (!req.size || req.size > tbl_size)
-			return -EINVAL;
+		if (!req.size || req.size > tbl_size) {
+			ret = -EINVAL;
+			break;
+		}
 
 		/*
 		 * The bounce buffer is overwritten in full by memcpy_fromio()
@@ -634,12 +656,25 @@ static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
 		 * on every ioctl call.
 		 */
 		kbuf = kvmalloc(tbl_size, GFP_KERNEL);
-		if (!kbuf)
-			return -ENOMEM;
+		if (!kbuf) {
+			ret = -ENOMEM;
+			break;
+		}
 
-		ret = hsmp_metric_tbl_read_locked(sock, kbuf, tbl_size);
+		ret = hsmp_metric_tbl_read_locked(sock, kbuf, tbl_size, &smu_response);
 	}
 
+	/*
+	 * Report the raw SMU mailbox status back to userspace whenever the
+	 * HSMP_GET_METRIC_TABLE message was actually attempted. smu_response
+	 * stays HSMP_STATUS_NOT_READY (its initialized value) for failures
+	 * caught before the message was ever sent, e.g. an invalid socket
+	 * index or buffer size.
+	 */
+	req.smu_response = smu_response;
+	if (copy_to_user(arguser, &req, sizeof(req)) && ret >= 0)
+		ret = -EFAULT;
+
 	if (ret < 0)
 		return ret;
 
@@ -667,7 +702,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
  * write while they bring sockets up and tear them down.
  */
 static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
-					   size_t size)
+					   size_t size, u32 *smu_response)
 {
 	struct hsmp_message msg = { 0 };
 	int ret;
@@ -699,6 +734,8 @@ static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
 	guard(mutex)(&sock->metric_read_lock);
 
 	ret = hsmp_send_message_locked(&msg);
+	if (smu_response)
+		*smu_response = msg.smu_response;
 	if (ret)
 		return ret;
 	memcpy_fromio(buf, sock->metric_tbl_addr, size);
@@ -710,7 +747,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
 {
 	guard(rwsem_read)(&hsmp_sock_rwsem);
 
-	return hsmp_metric_tbl_read_locked(sock, buf, size);
+	return hsmp_metric_tbl_read_locked(sock, buf, size, NULL);
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
 
-- 
2.34.1

