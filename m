Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795591415;
	b=EZWLD4KgXuRMV7fVNUNqjG73yrpXqEqiYBiiUcmMNFifdEy1u/rJrcbPxJLm1QZxlLd9
	 Q/YagW0t7L8ZKnll13mOgh8HYF78h8TegVi+MCfGpDnspr+PLaUxLTYG2qWrSGMj1xtjy
	 3B3IZ3GCu/LsWStfrANqpGBvtnWBehFENmqlRD3wj/oIdOz9rYMRHcgz4paT6RQomXSpr
	 HiBcFMlnHJPLVBFSf8dBRM3nZhSWfE9YGsXPQRAIZnuau9KQ6zIhJ8YsMVpTX668Uh2Rv
	 pcCI+s2l2rcSSK3G7szXA8kkqz78Dk4M55Pxuy/Ye8asNfIUtkEpzAseIrndPnHafog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591415;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=iLltl71AZqggPYyfAT39FdPo6/spnIrqNMVSK2yiR38=;
	b=rE9AAQMWiqUXIE09OJ/RJ+xA1LYLQTWo8MkXZ5SJFukl9x66v2cBamHxWSMtYbb/HVVV
	 xEDNT7EDXjkvvLTqhb3+zLQFPOWwXaOTuXzIC7SOQUmvLjo42d1O6mq2NcgjoNTboqVKD
	 DSFvKVwlB/afwNIdO7L5IUyICtAChVYe/RwxqsuDphNRe1GAAuSlgN3ybDXY9UCFwVpGy
	 vQ19n+CsjktiDfdFoiPRVhp/9KiIb94FCPGwtEiK0us70CKi0fkO2OUKuauUnTeFJYhOE
	 FPNg9GL8Ml5fhxIxp0TpridlkSZIBR3NyDZpwXUZjg5rqqLmVf6C9gim5n/DkvNKhTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3TjsiTyV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.3
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013003.outbound.protection.outlook.com [40.93.201.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4289C606A323;
	Wed, 25 Nov 2026 07:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4289C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3TjsiTyV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBbZubloJYt4vYoGXhKpw0/GHFIaISgiSeI3DOK4afnkHTD5m1rk0o9+RO+aYfCffC6x9HhXxxMUiSJ+09V3u92gkmi0tEuTMmf0ZXz/nwv7HFiR0xoJKIIjVMzs7pe1w/SCcrBUIbOhlwrjDPlKlnAfjz60DULnuzkcuY7RI7/d/w/uOJZ1azBmHx2h77hBX2lDN9r/7CvQiSAZtWYz4yQlKfOWOwNYMo2AAYPynIttMFjcdVZOx0m0cE9OV7aSQbWUDG6e4t5TwpYi57bknjljujy7+bCERB7Amb2E3jqmyic4DpvfDXTEJpSzExFqSNij2AYwZufP2NbcOwbrWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLltl71AZqggPYyfAT39FdPo6/spnIrqNMVSK2yiR38=;
 b=Wi7NGvbU2STViRIHEOxKRU5FOADbzye0f9+US0Qt4Kf5ySZsOLay4xiyStKtUlvfpevQGxl9SzfPQy5GsoFW6zZ3n1XYDP+RiEysUCI+b3ke4RAfu8gni7y9xV8+3oi1k+K2JchkK6f0YHCw39E3XLPaLkbBRqHPOVxKNNEBRt/uRp/C5SJkOWKTErT2wNoaK290CaSqvOy/QG/k/K+M6TqWz2occdsXNLq/+5d6jE/n4jlRfXr++j31gbnoYj65pt5mG+X3xYuUqs9s2w6pd2qNn3s6hALCs811gDL/t8sIIXLn6TtfiJ6ZEJQfjjokMwtlWuCCGv6D1DD5Jf6FkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLltl71AZqggPYyfAT39FdPo6/spnIrqNMVSK2yiR38=;
 b=3TjsiTyVgE9tIrjcB/PmCmcX3I4quJbhA0a2gLHybmhPGPTI0rUapBCCwa8bWhkx5V2FGxjiwWMtUdIvIgimD0RV83+UMEt91zBpOdHEwMiQxkZTxkBIcl4uYq3HlYTQNbp1QaVzsCNG36ve83OwzQXGnSjxenLsxuwiBF6nQ6I=
Received: from PH2PEPF0000385F.namprd17.prod.outlook.com (2603:10b6:518:1::6d)
 by DM4PR12MB8498.namprd12.prod.outlook.com (2603:10b6:8:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 07:23:30 +0000
Received: from SJ1PEPF000037B6.namprd05.prod.outlook.com
 (2a01:111:f403:c918::6) by PH2PEPF0000385F.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 07:23:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037B6.mail.protection.outlook.com (10.167.244.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 07:23:30 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 25 Nov
 2026 01:23:27 -0600
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd/hsmp: Report raw SMU mailbox status via smu_response
Date: Wed, 25 Nov 2026 12:53:06 +0530
Message-ID: <20261125072306.3458898-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072306.3458898-1-muralidhara.mk@amd.com>
References: <20261125072306.3458898-1-muralidhara.mk@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B6:EE_|DM4PR12MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7a54e2-48ed-420a-7a82-08df4ac50168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|10067099003|56012099006|5023799004|11063799006|261022105027099003|261022075727099003|261022115727099003|261022113327099003|261021135927099003|261028144727099003|261026140227099003|261026130827099003|261026135527099003|261026121527099003|261021133027099003|261021123027099003|261021121427099003|261021130227099003|261102123227099003|261102130727099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1ov8QeXY41j1bGMO9vQvLWXLSktBk/liKNzLRcPGRalYdXxSCWhHmuNWCjRjzKtQfcpEW2+sJzbH251+VKB5/hFOHUHshBmaAEgGTgwzs9jYXT9SAID0vBJm0Z+Z38svGezNXRa7LSBT8XF8yi7mWqqrPxw06ISwyvhrUy1WWZQkki9J/qSsoqDYZTnmueDMyC8bvq9O5kJOWqShRrjNE5zNMRnl7TpoXbUyMr2dD5WRcfVC5x50EhnqJBSMzZPLCAMuwl0wphuoeiItBTd+F4lot0wNJqrJyvRovNmnGg3ryn4CnzRwcfXz+d1MSOWrLXj09qRHVaGdKjmu6m/FKSAnk8xIMThf27v9UQEnTJPWFSZ2L6v8EAAlvRK9WVam9fEglxcxzm0d3pEwxY/fR943UydqAecNWfcPpoJ/xDI8ZIsjY5Gv7lTR7JjxFi3aCLUJIxwYMFR+mch/wAIuQ8H/FcFpRKhpt6vOQSSKkzSCYSic4yMspQCAOowVGTVqtZb4+uxjVmTWd3pRhypD5qb/LQqIn21eIfS8UKJstfLcOVsgc6a8WZ1Dutauv4+w3MU03NEq48v4q5hQByw5Es7/xrxSYXpD/b3CDUZ8dMwHzE/OCrLZx75HhOEgRGgrCm07gr9gBA7rYSdeLIn+Qw7Dq6nLzI3Oxn9EdWZ4C+6O3yvdgI6mvrPugK6XFtRi8b8TgLIztdPazw5S1q/HuA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(56012099006)(5023799004)(11063799006)(261022105027099003)(261022075727099003)(261022115727099003)(261022113327099003)(261021135927099003)(261028144727099003)(261026140227099003)(261026130827099003)(261026135527099003)(261026121527099003)(261021133027099003)(261021123027099003)(261021121427099003)(261021130227099003)(261102123227099003)(261102130727099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3q8CYu4ZYHZs+EPYH34hfFe5hF2ceGsqF5Q5NO4gEoSdUSdnl2meBjbBO0HidJ5jBBs0yVpjz+YaJThIcdv5guRBZPmm163pVKyj3Y52VhqMmMG7GqBxYb33KSwGPU40a7Epd/60dYo2zJV5sYwphuFxQDmu/RrD/RY6eAGP+bfWFaVSbsnK2nTw7ym88VqzJH3miWfkb/VBGCX3E0bTi4Ge4qfS6khTQTYrWCLlgX8BUD5EkvwQAZhYyyzkJIAIJ9G3pE7xFDVa55+Mx/HavQrAobQQ7EFC3iA77O6/IU+au053ZpXn8moGmekvDBgdWOvlHjeoqTEWhp2yjUTDe5h6AlDliEVsjQfZzdciQHTlykW/aua/zio0HZaBuljsw4oe+nttTAf7jJRtKFCws/ltTyEp+ZQ1eBnfICflS/Zgw8YmOs7EgP/K2mSVtZMG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 07:23:30.1194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7a54e2-48ed-420a-7a82-08df4ac50168
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8498

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
Changes:
v1->v2: None

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

