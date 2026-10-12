Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AEE3F20E3;
	Mon, 12 Oct 2026 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795274; cv=fail; b=BFcujkb+I7pTSJyaEqEpxRbzotVzNgif1Qc9noThKFTA7YV1kTJGPOZbRBCMaxi4IYVkJGhUnhTtAVSaTUQ3OVDC7bV+GwvNVm4e7BSMHD6QKUTAHQkwN8O/60xNqtw8V4jzH0zvyBL4R1KgXhL9AvEG+Ys/A6dlrVaGt8Na5jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795274; c=relaxed/simple;
	bh=sUsiZXs2zYrLXaqMPxP7uZ7XUgG7wjVPPxVajU+jSko=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MNaoynrQtJ5VHnHPshsrvmYVXQETDvL61k1qrs6QfyVHov8ZR0syt6CXXUX9OiWalGniiNzqTQQE2LUTAJgJ9mrSJ/zGR2HuoyD+VlxMUTMC8V6qazYhpt0AaDdZ/aXx1WcpVH5jUuxk2StC/EENGb3suJnf7QBPoFK/ICmQpNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xCkr5TxB; arc=fail smtp.client-ip=52.101.85.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xCkr5TxB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDxhmj2u23axkSEHQkrHX44JQmjpajcjJD5DP4BT4iPFfsHZiATnidfhWZiKgYGMxEfV4mfnn5pWf7QrgKTDlSjR3cn5gGtVjICkSv8quzimEk3cdhnYKiI8Lwb4pwj9XYWIJRnTn7gVMMRoLLw9j8QlBFufZ9ow49FYcFhOxUzBlmKIgcjz107crpUPyogdF9B+n3vymyUoGamhmKAyX3XNv55zNxCeTjvaPlOG84RByoxAhevV7rtG93ZBk0fYPp3hvFUk0GaRgZ8CHR+qQDDdrGqH2x+GSm3Pd+HWUYxvq73WlZixA13T8rU25CH7lUIXtitSDO1OFGB6I6Vs3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhAm6D44uqpxLnyG5idmP2KBQRPu1NKuFXQND6R2l+c=;
 b=ijyhrN0IFopT+isGErGmbMEPXWStiQykeHpxQz1JwnurboRnTWhOTNMmDc9kmCd/v8yY9SK9tp6NYT7mUH4DqtgTyTvT0b0TMTthJfSOkmZJt/xu90ig8zHTcv957Pe91eTTWG77jlVqxcK/yP1kXC1IsYFoewylu6k7jPzppJUaL3rGq1sPpixqcB+g6kDo6EuUeBsT2XoQV+st6xfjOObLDiqBmIGv6PfaMVyIRZtOy7+ffcACnYiV/h+V6BZJx5yzzdacFtRFitVzu6O70Rh4i0J3HTYp4nhE0EomidjEpXoCSZknC1zup+tAZuFr9cVWLcupSr0WTLSRM//X3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhAm6D44uqpxLnyG5idmP2KBQRPu1NKuFXQND6R2l+c=;
 b=xCkr5TxBHSO/QPL5MvBu6znR4hvLVV+RsxYK9ewz9kf8mVFCdGqevtTf2CFOnjknRbPiysw9uGHvNjbU4SrTbmCj+zbljh6NuY/2lVoTooIhyre5Tx4AzI9OGZ9mPYBA8d73P1EVJxdhN7GdYmJJT+UDaSPCHzZ/To7MfW3qZO4=
Received: from SJ0PR05CA0103.namprd05.prod.outlook.com (2603:10b6:a03:334::18)
 by DS6PR12MB257509.namprd12.prod.outlook.com (2603:10b6:8:4d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:54:27 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::8b) by SJ0PR05CA0103.outlook.office365.com
 (2603:10b6:a03:334::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.11 via Frontend Transport; Mon,
 12 Oct 2026 08:54:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:54:27 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 12 Oct
 2026 03:54:19 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v9 2/4] platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
Date: Mon, 12 Oct 2026 14:24:05 +0530
Message-ID: <20261012085407.1202295-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012085407.1202295-1-muralidhara.mk@amd.com>
References: <20261012085407.1202295-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DS6PR12MB257509:EE_
X-MS-Office365-Filtering-Correlation-Id: b1dcbc85-70f2-4421-eec3-08df283e6c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|6133799003|22082099003|18002099003|10067099003|13003099007|3023799007|5023799004|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	iveGkWRWaBy0pKziC8bcvOVDf8UN4NI7Pkhmqgd9yIGF5L2a9CPjmIPfYsN4k0RfBwGJyOQjTVSaNqLkKEfjQc2miv1uGHc/MMO306vxZOloFnCHKsofNjMtjLTqRYR/0zaifCox1Mxzd+RDIu7Th/L/YwPHNhnl2Dd2ZNgHn77Zs5hlqc+5RJA346zxpqpJmh3MGVUSbsMgiYqEr4uYS/FfRJniJ3iK83i7Ytu3OluXQ8gvwVdfwz91k3bmrH7OB0sd9wG2yLs3P58rJc8625JMgkCWWrj8xGm7a5WC3JAJ5ugkphLrpOf12DvQ5RQ5H7GlZgfoaj2GM7Wpflt+lWL2j5QpYgj1/0nFQ5nNB9v1u0Z6qQXFBdJFN+afNdkqwDm8vauyV6f3cUceeotWdinWJkt2cr2OOU7z1qWJcGeG9Aa+B8WGjw51vLpGD2V5CaqyfJkmnf0udU0rKjLikpA20XeqX5RdTLwmT3UYQFRNPAuYvBNC8460r+e2hvB5NsC3fXLJFBhWJNHG/s/p6FpaGJ562XBWAKoFc86T8p9p224+ChEe6IswvSBQwWXEx6jK2By3Qq93j+TAyPq+cgECCobsFKQ2Bk8OnGBLVxjV7nJzlcW9ZDQ2kL04oErIr0uNAEo6z39s1TRp4Z8+big0r1R/py9miUG96hZVOxxmmjkp6linwezYnM4zE+dEkJ/CMRr3x+dRA5pV+VC0IQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(13003099007)(3023799007)(5023799004)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W0QaEMT8rt/L8CXFPp+AWxV9QNpMmRMV63dP/PfNEadP0wuMoHShjFzTpPKsmbL/1YAH37GOmXE4B6es1ohGn4zPDwLeYxqngnKhs5v88xBpTRppi+CtMXeuuISZTlvTyt7z5AjTHpAnC79Nv/3J75JB2yRnf7MLh6KQ3QcSjDuPkvfznGKLmsBMgbvzTyBk3cmspYOJfT37Dt8iADraw907omHDvQgq97MF5jEC9MmSaXqL97xJstQvL58mD5xKT+Q0h4F/Oyd5D4/47pqvhd0Jrhc5qsEufG8nR4sWJmAEDxnkRE4YZzMrBVtH7q8WhiQFTwaehkmpVWlL/oM/USo2HVb0L0vB/SrAb0PjWaaSK7wT14tVUVfxw0PNrG0f4SygkJvKiiwenC2WTRFKdZA0ungGNw6PvlHvhVi1WL23WZrvTrGIkGxJCEjJ9gjG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:54:27.6789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1dcbc85-70f2-4421-eec3-08df283e6c2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB257509

Add HSMP client support for the Family 1Ah client platforms, Models
80h-8Fh and E0h-E3h, recognized by the previous commit via
is_client_platform(). These parts speak the Ryzen Master SMC (RMSMC)
message set instead of the server HSMP messages, and probe via ACPI
_CRS/_DSD like a server socket.

Add the client message set to the UAPI header. Introduce struct
hsmp_plat_desc to select the test message and protocol-version
message at runtime, based on is_client_platform() rather than a
fixed set of family/model ranges.

The client set has no per-message descriptor table. validate_message()
and hsmp_ioctl_msg() therefore skip msg_id range validation and the
/dev/hsmp GET/SET fd-mode gate for client messages, leaving msg_id
validity to firmware's response status; validate_message() still
bounds client num_args and response_sz to HSMP_CLIENT_MAX_MSG_LEN.
Server platforms keep every check, and get_msg_desc() now also
enforces a lower msg_id bound there. get_msg_desc() sanitizes msg_id
with array_index_nospec() against its own num_msgs bound before
indexing the descriptor table, rather than depending on a caller-side
clamp. Add hsmp_msg_response_sz(), returning the descriptor table
entry on server and the client protocol max otherwise, used by
hsmp_cache_proto_ver() since firmware returns only args[0] for
client. validate_message() and hsmp_ioctl_msg() distinguish the two
sets via the already-resolved hsmp_plat_desc/hsmp_msg_desc pointers,
not a second is_client_platform() call.

The /dev/hsmp 0600 restriction and every sysfs/hwmon attribute hidden
on client platforms stay from the previous commit: hsmp_ioctl_msg()
still has no GET/SET gate for client messages, so an unprivileged
opener could otherwise issue destructive SET messages, and the
hidden attributes still resolve against unrelated client commands.
Lifting either restriction is deferred to the commits that make the
corresponding client functionality safe to expose.

Document the client models in amd_hsmp.rst.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 Documentation/arch/x86/amd_hsmp.rst  |  10 +-
 arch/x86/include/uapi/asm/amd_hsmp.h | 154 ++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 226 ++++++++++++++++++++-------
 3 files changed, 329 insertions(+), 61 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index fa1fc240e212..b95f09945193 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -8,6 +8,13 @@ Newer Fam19h(model 0x00-0x1f, 0x30-0x3f, 0x90-0x9f, 0xa0-0xaf),
 Fam1Ah(model 0x00-0x1f) EPYC server line of processors from AMD support
 system management functionality via HSMP (Host System Management Port).
 
+The Fam1Ah(model 0x80-0x8f, 0xe0-0xe3) client line of processors is
+supported as well. Those models share one mailbox and speak the Ryzen
+Master SMC message set instead of the server HSMP message set, so the
+message IDs accepted on them are the HSMP_CLIENT_* ones listed in
+arch/x86/include/uapi/asm/amd_hsmp.h. The character device and ioctl
+interface described below are the same.
+
 The Host System Management Port (HSMP) is an interface to provide
 OS-level software with access to system management functions via a
 set of mailbox registers.
@@ -17,7 +24,8 @@ More details on the interface can be found in chapter
 Eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
 
 
-HSMP interface is supported on EPYC line of server CPUs and MI300A (APU).
+HSMP interface is supported on EPYC line of server CPUs, MI300A (APU) and
+the Fam1Ah client models listed above.
 
 
 HSMP device
diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index eda336bfd3e9..7274cf040a66 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -9,6 +9,12 @@
 
 #define HSMP_MAX_MSG_LEN 8
 
+/*
+ * HSMP client platforms (Ryzen Master SMC) accept at most four input
+ * argument words and four output/response words per message.
+ */
+#define HSMP_CLIENT_MAX_MSG_LEN 4
+
 /*
  * HSMP Messages supported
  */
@@ -71,6 +77,11 @@ enum hsmp_message_ids {
 	HSMP_MSG_ID_MAX,
 };
 
+/*
+ * The driver validates num_args and response_sz before sending a message.
+ * HSMP client platforms are bound to HSMP_CLIENT_MAX_MSG_LEN in each
+ * direction; server platforms are bound per-message by hsmp_msg_desc_table[].
+ */
 struct hsmp_message {
 	__u32	msg_id;			/* Message ID */
 	__u16	num_args;		/* Number of input argument words in message */
@@ -664,4 +675,147 @@ struct hsmp_telemetry_data {
 #define HSMP_IOCTL_GET_TELEMETRY_DATA \
 	_IOW(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
 
+/**
+ * enum hsmp_client_message_ids - Ryzen Master SMC (RMSMC) message IDs
+ * @HSMP_CLIENT_TEST: 01h. Test message. input: args[0] = xx. output:
+ *	args[0] = xx + 1.
+ * @HSMP_CLIENT_GET_SMU_VER: 02h. Get MP1 firmware version. output:
+ *	args[0] = MP1 firmware version.
+ * @HSMP_CLIENT_GET_INTERFACE_VER: 03h. Get interface version. output:
+ *	args[0] = interface version.
+ * @HSMP_CLIENT_GET_METRICS_TABLE_VER: 04h. Get metrics table version.
+ *	output: args[0] = metrics table version.
+ * @HSMP_CLIENT_GET_METRICS_TABLE: 05h. Get metrics table. No arguments.
+ *	Success means firmware has written the metrics table to the DRAM
+ *	address reported by @HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR.
+ * @HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR: 06h. Get metrics table DRAM
+ *	address. output: args[0] = address[31:0], args[1] = address[63:32],
+ *	args[2] = table size in bytes.
+ * @HSMP_CLIENT_SET_CORE_PSM_MARGIN: 07h. Set core voltage margin. input:
+ *	args[0] = ccx number[31:28] + core number[27:20] + reserved[19:16] +
+ *	margin in mV[15:0].
+ * @HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN: 08h. Set voltage margin for all
+ *	cores. input: args[0] = margin in mV[15:0].
+ * @HSMP_CLIENT_SET_FAST_PPT_LIMIT: 09h. Set APU fast PPT limit. input:
+ *	args[0] = limit in mW.
+ * @HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT: 0Ah. Set VDDCR_VDD TDC. input:
+ *	args[0] = limit in mA.
+ * @HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT: 0Bh. Set VDDCR_VDD EDC.
+ *	input: args[0] = limit in mA.
+ * @HSMP_CLIENT_SET_TJ_MAX: 0Ch. Set maximum junction temperature. input:
+ *	args[0] = temperature in degrees C.
+ * @HSMP_CLIENT_SET_FIT_LIMIT_SCALAR: 0Dh. Set failures-in-time limit
+ *	scalar. input: args[0] = scalar (0 to 100).
+ * @HSMP_CLIENT_ENABLE_OVERCLOCKING: 0Eh. Enable overclocking. No
+ *	arguments.
+ * @HSMP_CLIENT_DISABLE_OVERCLOCKING: 0Fh. Disable overclocking. No
+ *	arguments.
+ * @HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES: 10h. Set all-core overclock
+ *	frequency. input: args[0] = frequency in MHz[15:0].
+ * @HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE: 11h. Set per-core overclock
+ *	frequency. input: args[0] = ccd number[31:28] + ccx number[27:24] +
+ *	core number[23:20] + frequency in MHz[19:0].
+ * @HSMP_CLIENT_SET_OVERCLOCK_VID: 12h. Set overclock VID. input:
+ *	args[0] = reserved[31:17] + vid[16:8] + pstate[7:0].
+ * @HSMP_CLIENT_SPARE_0X13: 13h. Reserved.
+ * @HSMP_CLIENT_GET_CORE_PERF_ORDER: 14h. Get core performance order.
+ *	input: args[0] = core performance rank index[31:0] (0 to Enabled
+ *	cores-1). output: args[0] = voltage in mV[31:21] + frequency in
+ *	MHz[20:9] + fll[8:6] + core number[5:2] + ccx number[1:0].
+ * @HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT: 15h. Set SOC sustained power
+ *	limit. input: args[0] = limit in mW.
+ * @HSMP_CLIENT_SET_SLOW_PPT_LIMIT: 16h. Set APU slow PPT limit. input:
+ *	args[0] = limit in mW.
+ * @HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT: 17h. Set VDDCR_GFX EDC.
+ *	input: args[0] = limit in mA.
+ * @HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT: 18h. Set VDDCR_SOC TDC. input:
+ *	args[0] = limit in mA.
+ * @HSMP_CLIENT_SET_FAST_SPM_LIMIT: 19h. Set fast SPM limit. input:
+ *	args[0] = limit in mW.
+ * @HSMP_CLIENT_SET_SLOW_SPM_LIMIT: 1Ah. Set slow SPM limit. input:
+ *	args[0] = limit in mW.
+ * @HSMP_CLIENT_GET_CORE_PSM_MARGIN: 1Bh. Get core voltage margin. input:
+ *	args[0] = ccx number[31:28] + core number[27:20] + reserved[19:0].
+ *	output: args[0] = ccx number[31:28] + core number[27:20] +
+ *	reserved[19:16] + margin in mV[15:0].
+ * @HSMP_CLIENT_GET_GFX_PSM_MARGIN: 1Ch. Get graphics voltage margin.
+ *	output: args[0] = margin in mV[15:0].
+ * @HSMP_CLIENT_SPARE_0X1D: 1Dh. Reserved.
+ * @HSMP_CLIENT_SPARE_0X1E: 1Eh. Reserved.
+ * @HSMP_CLIENT_SPARE_0X1F: 1Fh. Reserved.
+ * @HSMP_CLIENT_SPARE_0X20: 20h. Reserved.
+ * @HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID: 21h. Set GfxClk
+ *	overdrive by frequency/VID. input: args[0] = reserved[31:25] +
+ *	vid[24:16] + frequency in MHz[15:0].
+ * @HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE: 22h. Disable GfxClk overdrive.
+ *	No arguments.
+ * @HSMP_CLIENT_SET_GFX_PSM_MARGIN: 23h. Set graphics voltage margin.
+ *	input: args[0] = margin in mV[15:0].
+ * @HSMP_CLIENT_SET_CCLK_FMAX_OFFSET: 24h. Set CCLK Fmax offset. input:
+ *	args[0] = maximum frequency in MHz[15:0].
+ * @HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET: 25h. Set core power limit
+ *	offset. input: args[0] = limit in mW.
+ * @HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND: 26h. Add extra core PSM
+ *	guardband. input: args[0] = PsmGuardband[2][31:24] +
+ *	PsmGuardband[1][23:16] + PsmGuardband[0][15:8] + TriggerUpdate[7] +
+ *	AvfsType[6:4] + frequency index[3:0].
+ * @HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX: 27h. Add extra graphics PSM
+ *	guardband. input: args[0] = PsmGuardband[2][31:24] +
+ *	PsmGuardband[1][23:16] + PsmGuardband[0][15:8] + TriggerUpdate[7] +
+ *	frequency index[6:0].
+ * @HSMP_CLIENT_SET_GFXCLK_FMAX: 28h. Set GfxClk Fmax. input: args[0] =
+ *	maximum frequency in MHz[15:0].
+ * @HSMP_CLIENT_MSG_ID_MAX: Number of message IDs, not a valid ID itself.
+ *
+ * Message IDs accepted on the Family 1Ah client platforms, Models 80h-8Fh
+ * and E0h-E3h. These parts drive one mailbox and speak the Ryzen Master
+ * SMC message set instead of the server HSMP message set enumerated in
+ * &enum hsmp_message_ids. Not all platforms support all messages; consult
+ * the supported list of messages in the HSMP chapter of the respective
+ * family/model PPR. Unsupported messages return -ENOMSG.
+ */
+enum hsmp_client_message_ids {
+	HSMP_CLIENT_TEST = 1,
+	HSMP_CLIENT_GET_SMU_VER,
+	HSMP_CLIENT_GET_INTERFACE_VER,
+	HSMP_CLIENT_GET_METRICS_TABLE_VER,
+	HSMP_CLIENT_GET_METRICS_TABLE,
+	HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
+	HSMP_CLIENT_SET_CORE_PSM_MARGIN,
+	HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN,
+	HSMP_CLIENT_SET_FAST_PPT_LIMIT,
+	HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT,
+	HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT,
+	HSMP_CLIENT_SET_TJ_MAX,
+	HSMP_CLIENT_SET_FIT_LIMIT_SCALAR,
+	HSMP_CLIENT_ENABLE_OVERCLOCKING,
+	HSMP_CLIENT_DISABLE_OVERCLOCKING,
+	HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES,
+	HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE,
+	HSMP_CLIENT_SET_OVERCLOCK_VID,
+	HSMP_CLIENT_SPARE_0X13,
+	HSMP_CLIENT_GET_CORE_PERF_ORDER,
+	HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT,
+	HSMP_CLIENT_SET_SLOW_PPT_LIMIT,
+	HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT,
+	HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT,
+	HSMP_CLIENT_SET_FAST_SPM_LIMIT,
+	HSMP_CLIENT_SET_SLOW_SPM_LIMIT,
+	HSMP_CLIENT_GET_CORE_PSM_MARGIN,
+	HSMP_CLIENT_GET_GFX_PSM_MARGIN,
+	HSMP_CLIENT_SPARE_0X1D,
+	HSMP_CLIENT_SPARE_0X1E,
+	HSMP_CLIENT_SPARE_0X1F,
+	HSMP_CLIENT_SPARE_0X20,
+	HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID,
+	HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE,
+	HSMP_CLIENT_SET_GFX_PSM_MARGIN,
+	HSMP_CLIENT_SET_CCLK_FMAX_OFFSET,
+	HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET,
+	HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND,
+	HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX,
+	HSMP_CLIENT_SET_GFXCLK_FMAX,
+	HSMP_CLIENT_MSG_ID_MAX,
+};
+
 #endif /*_ASM_X86_AMD_HSMP_H_*/
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index d32d5a907aae..08e00a7c329a 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -10,7 +10,10 @@
 #include <asm/amd/hsmp.h>
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
+#include <linux/build_bug.h>
 #include <linux/cleanup.h>
+#include <linux/compiler.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -45,8 +48,94 @@
  */
 #define CHECK_GET_BIT		BIT(31)
 
+/* Catch a table left out of sync with its enum at build time */
+static_assert(ARRAY_SIZE(hsmp_msg_desc_table) == HSMP_MSG_ID_MAX);
+
+/* Per-platform message set: which table to use, and driver-issued msg IDs */
+struct hsmp_plat_desc {
+	const struct hsmp_msg_desc	*msg_desc;
+	u32				num_msgs;
+	u32				test_msg;
+	u32				proto_ver_msg;
+};
+
+static const struct hsmp_plat_desc hsmp_desc_server = {
+	.msg_desc		= hsmp_msg_desc_table,
+	.num_msgs		= HSMP_MSG_ID_MAX,
+	.test_msg		= HSMP_TEST,
+	.proto_ver_msg		= HSMP_GET_PROTO_VER,
+};
+
+/*
+ * The client drives a different mailbox with the Ryzen Master SMC message
+ * set. It has no per-message descriptor table: num_args/response_sz are
+ * bounded generically instead (see validate_message()), and an unsupported
+ * or malformed msg_id is rejected by firmware with its own SMU status code.
+ */
+static const struct hsmp_plat_desc hsmp_desc_client = {
+	.msg_desc		= NULL,
+	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
+	.test_msg		= HSMP_CLIENT_TEST,
+	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
+};
+
 static struct hsmp_plat_device hsmp_pdev;
 
+/* Cached on first use; READ_ONCE()/WRITE_ONCE() avoid a torn access */
+static const struct hsmp_plat_desc *hsmp_desc_cache;
+
+static const struct hsmp_plat_desc *hsmp_desc(void)
+{
+	const struct hsmp_plat_desc *desc = READ_ONCE(hsmp_desc_cache);
+
+	if (likely(desc))
+		return desc;
+
+	desc = is_client_platform() ? &hsmp_desc_client : &hsmp_desc_server;
+	WRITE_ONCE(hsmp_desc_cache, desc);
+
+	return desc;
+}
+
+/* Returns NULL if the platform has no descriptor table, or msg_id is out of range or reserved */
+static const struct hsmp_msg_desc *get_msg_desc(u32 msg_id)
+{
+	const struct hsmp_plat_desc *desc = hsmp_desc();
+
+	if (!desc->msg_desc)
+		return NULL;
+
+	if (msg_id < desc->test_msg || msg_id >= desc->num_msgs)
+		return NULL;
+
+	/*
+	 * Sanitize msg_id here rather than trusting a caller-side clamp: a
+	 * mispredicted branch upstream can still reach this function with
+	 * an unclamped msg_id (Spectre v1, CVE-2017-5753).
+	 */
+	msg_id = array_index_nospec(msg_id, desc->num_msgs);
+
+	if (desc->msg_desc[msg_id].type == HSMP_RSVD)
+		return NULL;
+
+	return &desc->msg_desc[msg_id];
+}
+
+/*
+ * Response size for a message the driver issues directly, such as the
+ * probe-time test, protocol-version and metric-table messages: the
+ * descriptor table entry for server, since these fixed, well-known message
+ * IDs always have one; the client protocol max otherwise, since the client
+ * set has no descriptor table and firmware reports no response length.
+ * Callers only consume the response words they expect.
+ */
+static u32 hsmp_msg_response_sz(u32 msg_id)
+{
+	const struct hsmp_msg_desc *desc = get_msg_desc(msg_id);
+
+	return desc ? desc->response_sz : HSMP_CLIENT_MAX_MSG_LEN;
+}
+
 /*
  * Gates the AMD HSMP data plane against socket bring-up and teardown.
  *
@@ -184,30 +273,46 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
 static int validate_message(struct hsmp_message *msg)
 {
-	/* msg_id against valid range of message IDs */
-	if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
-		return -ENOMSG;
+	const struct hsmp_plat_desc *plat_desc = hsmp_desc();
+	const struct hsmp_msg_desc *desc;
+
+	if (!plat_desc->msg_desc) {
+		/*
+		 * The client message set has no per-message descriptor
+		 * table and no msg_id range to validate against; cap
+		 * num_args/response_sz to what the Ryzen Master mailbox
+		 * supports in each direction and leave msg_id correctness,
+		 * such as an unsupported or out-of-range value, to the SMU
+		 * status code __hsmp_send_message() already translates.
+		 */
+		if (msg->num_args > HSMP_CLIENT_MAX_MSG_LEN ||
+		    msg->response_sz > HSMP_CLIENT_MAX_MSG_LEN)
+			return -EINVAL;
 
-	/* msg_id is a reserved message ID */
-	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
+		return 0;
+	}
+
+	/* Out-of-range or reserved message ID for this platform */
+	desc = get_msg_desc(msg->msg_id);
+	if (!desc)
 		return -ENOMSG;
 
 	/*
 	 * num_args passed by user should match the num_args specified in
 	 * message description table.
 	 */
-	if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args)
+	if (msg->num_args != desc->num_args)
 		return -EINVAL;
 
 	/*
 	 * As the HSMP protocol evolves, newer platforms may define more
 	 * response arguments for existing messages.  Use an upper-bound
 	 * check so that older userspace callers requesting fewer response
-	 * words than what the current hsmp_msg_desc_table[] defines are
-	 * still accepted, while rejecting requests that exceed the
-	 * hardware capability.
+	 * words than what the current descriptor table defines are still
+	 * accepted, while rejecting requests that exceed the hardware
+	 * capability.
 	 */
-	if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
+	if (msg->response_sz > desc->response_sz)
 		return -EINVAL;
 
 	return 0;
@@ -316,7 +421,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 	 * Test the hsmp port by performing TEST command. The test message
 	 * takes one argument and returns the value of that argument + 1.
 	 */
-	msg.msg_id	= HSMP_TEST;
+	msg.msg_id	= hsmp_desc()->test_msg;
 	msg.num_args	= 1;
 	msg.response_sz	= 1;
 	msg.args[0]	= value;
@@ -338,13 +443,12 @@ int hsmp_test(u16 sock_ind, u32 value)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_test, "AMD_HSMP");
 
-static bool is_get_msg(struct hsmp_message *msg)
+static bool is_get_msg(const struct hsmp_msg_desc *desc, struct hsmp_message *msg)
 {
-	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_GET)
+	if (desc->type == HSMP_GET)
 		return true;
 
-	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET &&
-	    (msg->args[0] & CHECK_GET_BIT))
+	if (desc->type == HSMP_SET_GET && (msg->args[0] & CHECK_GET_BIT))
 		return true;
 
 	return false;
@@ -354,63 +458,65 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
 	struct hsmp_message msg = { 0 };
+	const struct hsmp_plat_desc *plat_desc = hsmp_desc();
+	const struct hsmp_msg_desc *desc = NULL;
 	int ret;
 
 	if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
 		return -EFAULT;
 
 	/*
-	 * Check msg_id is within the range of supported msg ids
-	 * i.e within the array bounds of hsmp_msg_desc_table
+	 * The client message set has no per-message descriptor table to
+	 * bounds-check msg_id against or index into, and no per-message
+	 * type to gate fd mode on, so none of that applies here.
+	 * validate_message() (called via hsmp_send_message() below) still
+	 * bounds num_args/response_sz generically, and firmware is the
+	 * final arbiter of msg_id validity via its own response status.
 	 */
-	if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
-		return -ENOMSG;
-
-	/*
-	 * Sanitize the user-controlled msg_id against speculative
-	 * execution.  The bounds check above retires the out-of-range
-	 * case with -ENOMSG, but a mispredicted branch can still let the
-	 * CPU speculatively use msg_id as an index into
-	 * hsmp_msg_desc_table[] (here and in validate_message() /
-	 * is_get_msg() called downstream via hsmp_send_message()), and
-	 * pull arbitrary kernel memory into the cache (Spectre v1,
-	 * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
-	 * dereference sees the sanitized value.
-	 */
-	msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
-
-	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
-	case FMODE_WRITE:
-		/*
-		 * Device is opened in O_WRONLY mode
-		 * Execute only set/configure commands
-		 */
-		if (is_get_msg(&msg))
-			return -EPERM;
-		break;
-	case FMODE_READ:
-		/*
-		 * Device is opened in O_RDONLY mode
-		 * Execute only get/monitor commands
-		 */
-		if (!is_get_msg(&msg))
+	if (plat_desc->msg_desc) {
+		/* Rejects out-of-range and reserved msg_ids */
+		desc = get_msg_desc(msg.msg_id);
+		if (!desc)
+			return -ENOMSG;
+
+		switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
+		case FMODE_WRITE:
+			/*
+			 * Device is opened in O_WRONLY mode
+			 * Execute only set/configure commands.
+			 */
+			if (is_get_msg(desc, &msg))
+				return -EPERM;
+			break;
+		case FMODE_READ:
+			/*
+			 * Device is opened in O_RDONLY mode
+			 * Execute only get/monitor commands.
+			 */
+			if (!is_get_msg(desc, &msg))
+				return -EPERM;
+			break;
+		case FMODE_READ | FMODE_WRITE:
+			/*
+			 * Device is opened in O_RDWR mode
+			 * Execute both get/monitor and set/configure commands
+			 */
+			break;
+		default:
 			return -EPERM;
-		break;
-	case FMODE_READ | FMODE_WRITE:
-		/*
-		 * Device is opened in O_RDWR mode
-		 * Execute both get/monitor and set/configure commands
-		 */
-		break;
-	default:
-		return -EPERM;
+		}
 	}
 
 	ret = hsmp_send_message(&msg);
 	if (ret)
 		return ret;
 
-	if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
+	/*
+	 * The client message set has no per-message response_sz to check
+	 * here (desc is NULL); validate_message() already bounded
+	 * msg.response_sz.
+	 */
+	if ((desc ? desc->response_sz : msg.response_sz) > 0) {
 		/* Copy results back to user for get/monitor commands */
 		if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
 			return -EFAULT;
@@ -687,9 +793,9 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 	struct hsmp_message msg = { 0 };
 	int ret;
 
-	msg.msg_id	= HSMP_GET_PROTO_VER;
+	msg.msg_id	= hsmp_desc()->proto_ver_msg;
+	msg.response_sz	= hsmp_msg_response_sz(msg.msg_id);
 	msg.sock_ind	= sock_ind;
-	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
 
 	ret = hsmp_send_message_locked(&msg);
 	if (!ret)
-- 
2.34.1

