Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BEC30E0D5;
	Thu, 24 Sep 2026 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265021; cv=fail; b=apXgzp7agvY0ORhV4o42DW/cnY3N0lzPlEDJewlrTQHdiOwe44s/z24RpOO64slQ6YEiEODBFeEpwJTY+fKojsee3K62ZDWO1A2CMEkV3q1Xueo0jXhjvWdlbmKiam3uGq4pbK87rlpHGuyQs71QgUHtKY5WV1HK8wWJlR14klI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265021; c=relaxed/simple;
	bh=D/ZGR/mDRkLshh/WTOWmClAUi44+i/XybAEXE5X6Lsw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VgOk+iw5iIdhWc/9WG3lJIKtiLaz5YAGmI/NVGyyRZGCh0reKLy2W4qL6BlYS/ZE33zL6d5OITdJrPyZhtEwWwKEOsoLPuG5J3HZcnIjjHXSx6aiCZHamK3LKbyIwgZYCkXIk06vgeAZFltwaH3sW9oNAQgAnfb9JLkQwvjOmXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LJC4g6wJ; arc=fail smtp.client-ip=52.101.57.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LJC4g6wJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5hbdQPmjlJ10jB6VgxP0Xcmols/d1sLY++RHuAiGWXSQATCmxLO8IkXKeAo2SH2G8tKQsf3tS+2svCjyG54acC6HKNSzZoyUpSKZewa7TIyJFEw4kg+6pL0Wvh1O/cH9zWOzhxGiVFwVxD2olb3L9nMmDfevUPJGpCFNmRqppVryFy1LCQI24XeI9iRYNXbKIjdbsl4eYJBbScbBPRLjLlBGxGCg7BOQcGzCw0gWFwx1BlxRbGgbA62D2T4ZPHWFvfjvluuseHYfS/HZx2lu8iPPDY9dIXYY/oG3fa7yPaYpEfvM5Vc9CRV81WP9sloKJVdvHqVilZA2XFmaekWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5w4Q6hHttfOkMWjbhlO2GPOxosAgAgmwZciApB2l0M=;
 b=MCAzNVzPSmLzEUAgqF4Bd5eHrqGDZuLP4sb6V6usJ43YCYyBq8YDbieHlhB4BB+lXUrIYODfI8WWGXvMegvWrFV2mM/uhbi6UwstegNJylvH6OfO/NELFdmlE3gBIPObfetnzN4mjRRzVmySb4Zts1ZE9dARNkHH4+lZx+cCrCLfYwCRPJ3uPV7X/Ji5K/HfUWi7MgR1SbolaX5uX/HYgM17TGSEItVgRTH1615FluK5q5EHl6inlqk/wVRrqWt3G/1CL4jonkxy4PKYCFdtEyHEl6AlNnV8GWZCiu0jsRy+Fut/uibv3mtVBikZkXFNF4CPerlD3GS515SAlVbwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5w4Q6hHttfOkMWjbhlO2GPOxosAgAgmwZciApB2l0M=;
 b=LJC4g6wJr6DhOD1Y+ZMgPsPWAE1kHGQOhAqiCcS1wVMKc3I4+QN5u1jMyzXDRoDa2UzB/BN0bqyx7q0IPuftQseir03W/16o/NgRACsLzWegpdg5Hj3vzGT1wLtkhecLTtlHOathVE6gBvYabtMzt2I+fGfv32j5gZhqwjJNcms=
Received: from MW4PR04CA0056.namprd04.prod.outlook.com (2603:10b6:303:6a::31)
 by SJ2PR12MB7962.namprd12.prod.outlook.com (2603:10b6:a03:4c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Thu, 24 Sep
 2026 15:50:10 +0000
Received: from SJ1PEPF000037A1.namprd04.prod.outlook.com
 (2603:10b6:303:6a:cafe::31) by MW4PR04CA0056.outlook.office365.com
 (2603:10b6:303:6a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 15:50:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A1.mail.protection.outlook.com (10.167.244.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 15:50:09 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 10:50:03 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v7 1/4] platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
Date: Thu, 24 Sep 2026 21:19:44 +0530
Message-ID: <20260924154947.1706669-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924154947.1706669-1-muralidhara.mk@amd.com>
References: <20260924154947.1706669-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A1:EE_|SJ2PR12MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 733e0b4d-05f0-4ff1-3423-08df1a538382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|56012099006|3023799007|6133799003|10067099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	O1ZSiKWx1GhiEbF/sCsDeF2fqpUVzLjvB4DgflGFCcYEgPPfCJqrpCaDhMWzhJgTSPN2GCjaMVZ9Iq+dMpFsNQmrPyqJOEQZzs4tsuaQ4GNgbhcrk4b14DPpjzh1tJpEsW/uN290acHXu3gVYtR3/lWi+aYKqfLfuUwbL3lJhnGyJZ3UFhx45t9HEedv96uRFs/0NbxALc8Tn01MFHiM2Tv7jWfzXKeHDM472ZENgEyMMOmpmWLyeq1/GdjXNigXGjXGzczu/TS6NrMz6My6QVrhjVG3+14ghMjdxz1a32BMKdffCufcKevNiEW0KxGXo3gA/gWf5HyoRp4M/CnefKpktHHA8lzTqioD0p3xY+Tfh10XiLSjEMT1o1JanBgxhHT9qtytPbDQeoW6wcRT/g4DiMPglBxIptx4L9uZF3qVfzrsHaQsvSJl/cTAFZhFJuQdhozqqJXhz8RXPAY3LX/Q2IrZi2MvapAON3n0XcrIwzqndxfDJ0A6qJ0DbKjA9zn8uI+j9t+uLx33qgl74YIYtjfyVYjjbjYxRjE4hZd33zk5renf2tjq2rbWIy/05HkrTCeCfLF17NaojBZ5S7TyUS4xZwHoyzeswC3Ro8cXdTOL/JY2tofRIXW70yQsf/Eva4kF0bLpXbq3QpvSrOIwErFB4aZfBl1rTT1Yu3sW/bfg/vfXAMP31aTIhpH322TrlyKf71iapI6IkxDaKg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(56012099006)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	djqGf/0F77gg/sttPqRCT9RoxsUM8nnmihxCs+FXHab7QvTHpPrL7H4YT3B6hKCskMkpih8+nE5BQaPbpBDdx2udM6koSJfobTzgL2VG+V4LznorWRL9rqkkYGqoB/PBykCb+A6s0T6KFuHfweJGHwCoVpECaF7laFSVia+TwOgl0m66Ok2F16lccZGB9xmMMnsOo/u4dOZxxXWqX3EyzisGb3iw50fxy1viyZ0NDeDcubYDj5CJYTLhOq9Blqoe+0bUtSP2Wc1bMDnOjASXRb5MAxIDPGhoekbrTlc8aA2g9ti+ICwLBCytaWHYfSEWkB/lbXizGG0IuG6eUxsxMoWwDRWFdR0L6jaFRrZd3R0z4Np89ysALseDJmVh+UbG3KFKWM+O8TYZWuSligPMVe+54aG2HmCPbyCyVUJ2GJzZ/e0AvHCOlZ/ASEtctnDE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:50:09.9610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 733e0b4d-05f0-4ff1-3423-08df1a538382
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7962

Add HSMP client support for the Family 1Ah client platforms, Models
80h-8Fh and E0h-E3h. These parts speak the Ryzen Master SMC (RMSMC)
message set instead of the server HSMP messages, and probe via ACPI
_CRS/_DSD like a server socket.

Add the client message set to the UAPI header. Introduce struct
hsmp_plat_desc to select the test message and protocol-version
message at runtime, based on the ACPI-reported PM profile
(is_client_platform()) rather than a fixed set of family/model
ranges.

The client set has no per-message descriptor table. validate_message()
and hsmp_ioctl_msg() therefore skip msg_id range validation,
array_index_nospec() sanitization, and the /dev/hsmp GET/SET fd-mode
gate for client messages, leaving msg_id validity to firmware's
response status; validate_message() still bounds client num_args and
response_sz to HSMP_CLIENT_MAX_MSG_LEN. Server platforms keep every
check, and get_msg_desc() now also enforces a lower msg_id bound
there. Register /dev/hsmp at 0600 on client platforms, since
hsmp_ioctl_msg() has no GET/SET gate there and any opener could
otherwise issue destructive SET messages; server platforms keep 0644
because that gate still applies. Add hsmp_msg_response_sz(), returning
the descriptor table entry on server and the client protocol max
otherwise, used by hsmp_cache_proto_ver() since firmware returns only
args[0] for client. validate_message() and hsmp_ioctl_msg()
distinguish the two sets via the already-resolved hsmp_plat_desc/
hsmp_msg_desc pointers, not a second is_client_platform() call.
Document the client models in amd_hsmp.rst.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 Documentation/arch/x86/amd_hsmp.rst  |  10 +-
 arch/x86/include/uapi/asm/amd_hsmp.h | 154 ++++++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 235 ++++++++++++++++++++-------
 drivers/platform/x86/amd/hsmp/hsmp.h |  23 +++
 4 files changed, 364 insertions(+), 58 deletions(-)

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
index 5e123a4ecea9..cf33c874096b 100644
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
@@ -45,8 +48,87 @@
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
@@ -184,30 +266,46 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
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
+
+		return 0;
+	}
 
-	/* msg_id is a reserved message ID */
-	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
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
@@ -316,7 +414,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 	 * Test the hsmp port by performing TEST command. The test message
 	 * takes one argument and returns the value of that argument + 1.
 	 */
-	msg.msg_id	= HSMP_TEST;
+	msg.msg_id	= hsmp_desc()->test_msg;
 	msg.num_args	= 1;
 	msg.response_sz	= 1;
 	msg.args[0]	= value;
@@ -338,13 +436,12 @@ int hsmp_test(u16 sock_ind, u32 value)
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
@@ -354,63 +451,82 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
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
+	if (plat_desc->msg_desc) {
 		/*
-		 * Device is opened in O_WRONLY mode
-		 * Execute only set/configure commands
+		 * Check msg_id is within the range of supported msg ids
+		 * i.e within the array bounds of the platform's descriptor table
 		 */
-		if (is_get_msg(&msg))
-			return -EPERM;
-		break;
-	case FMODE_READ:
+		if (msg.msg_id < plat_desc->test_msg || msg.msg_id >= plat_desc->num_msgs)
+			return -ENOMSG;
+
 		/*
-		 * Device is opened in O_RDONLY mode
-		 * Execute only get/monitor commands
+		 * Sanitize the user-controlled msg_id against speculative
+		 * execution.  The bounds check above retires the out-of-range
+		 * case with -ENOMSG, but a mispredicted branch can still let the
+		 * CPU speculatively use msg_id as an index into the message
+		 * descriptor table, here and again in validate_message() called
+		 * downstream via hsmp_send_message().
 		 */
-		if (!is_get_msg(&msg))
+		msg.msg_id = array_index_nospec(msg.msg_id, plat_desc->num_msgs);
+
+		/* Rejects the reserved IDs the table describes as such */
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
@@ -687,9 +803,9 @@ int hsmp_cache_proto_ver(u16 sock_ind)
 	struct hsmp_message msg = { 0 };
 	int ret;
 
-	msg.msg_id	= HSMP_GET_PROTO_VER;
+	msg.msg_id	= hsmp_desc()->proto_ver_msg;
+	msg.response_sz	= hsmp_msg_response_sz(msg.msg_id);
 	msg.sock_ind	= sock_ind;
-	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
 
 	ret = hsmp_send_message_locked(&msg);
 	if (!ret)
@@ -720,7 +836,12 @@ int hsmp_misc_register(struct device *dev)
 	 */
 	hsmp_pdev.mdev.parent	= dev;
 	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
-	hsmp_pdev.mdev.mode	= 0644;
+	/*
+	 * hsmp_ioctl_msg() gates a server fd's mode against the message's
+	 * GET/SET type; the client set has no per-message type to gate on.
+	 * Restrict /dev/hsmp to root on client platforms.
+	 */
+	hsmp_pdev.mdev.mode	= is_client_platform() ? 0600 : 0644;
 
 	return misc_register(&hsmp_pdev.mdev);
 }
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 8dbff16a87b1..62ba795dc8c5 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -10,6 +10,9 @@
 #ifndef HSMP_H
 #define HSMP_H
 
+#include <asm/amd/hsmp.h>
+
+#include <linux/acpi.h>
 #include <linux/compiler_types.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
@@ -17,6 +20,7 @@
 #include <linux/miscdevice.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/processor.h>
 #include <linux/rwsem.h>
 #include <linux/semaphore.h>
 #include <linux/sysfs.h>
@@ -32,6 +36,25 @@
 
 #define DRIVER_VERSION		"2.6"
 
+/* True when the ACPI-reported PM profile indicates a client platform */
+static inline bool is_client_platform(void)
+{
+	if (!IS_ENABLED(CONFIG_ACPI))
+		return false;
+
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return false;
+
+	switch (acpi_gbl_FADT.preferred_profile) {
+	case PM_DESKTOP:
+	case PM_MOBILE:
+	case PM_TABLET:
+		return true;
+	default:
+		return false;
+	}
+}
+
 struct hsmp_mbaddr_info {
 	u32 base_addr;
 	u32 msg_id_off;
-- 
2.34.1

