Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012021.outbound.protection.outlook.com [40.93.195.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EBF42E427;
	Fri,  9 Oct 2026 06:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526466; cv=fail; b=pteSc/68lp1CkhuMNgmqFX475iKytiAUih/xOQ8ExNfGQDHsM616dk7DrEUFsyyPwFE7Eeqgdwu32+esQt70cp5rObnR4wuAcvHYXbH1ynSK5T3ZjyI4CTTrG1Dw2xt3lYoApF5qhVWuNNCpTMoDxUOPgZ1R0hzr3qz33CLE5MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526466; c=relaxed/simple;
	bh=egRYUcfZfwz3ZVJfYfW4zdH12miQG5QZQ8cWIn3qZFI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lMrBGj+P3n7JxfPpjTsz9CosHjyl0KGprokOMebbvwWGVHM62kgL/8d+qpP83bKysLAJGeTwUzVERe/9C4p2Y86VIEF7tfui7jhXTdS+SEnINaExtU/E6vcaFg9RvIK5D0xXU6pOCmq9UoWYiAkpP/HDT8Db//Ro2EKM9wZGEP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=h4SNltYd; arc=fail smtp.client-ip=40.93.195.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h4SNltYd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MczzBAbq27QaWgATPYr5YaaV0o9A7jssCPJAREX4D3LYztNaEmVZ66nxkCTVDMVgKR6MQezKXQccmU/iJCcsC4DDiYo8WKeEOE9BfQm0OCmQmpRVl/hu11wtTD3ukLmeK0HpAO+Yz362iYebMA/WDnxolFKEAAXwiUF8/tlvpmhW93gCCUE7MxIqpaLGUKpYy2mzWmHmO1vAy275WAwn7IgVRqfI45HRMJ23n7Uw+PJx6Ai5kkhoDfcoqVOClFAka3E76rtrauaIIJIkiR0mOxOrHnlDpLaEO+pO+QtUsu7EIzEUTGp4g+qjZZgp0bWjKAWZc8NT9j6lg2G6BBJ5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZCHZTH2Sxdrtxl9ETJCPFgpBwxBRITiKyBzflVqtSc=;
 b=ukauM00x8T5XBYXVI7jTN7oCPSte01fYr6on08+0CfaNGykth/5Q5sO7G4mWR9SwIHTWfoFtj67534SJSssfINaxDesm8fikOLyZwkO3cC+IDwgPevT/5tNeuxK43Rozo1HG4+AgCb5331anNRTcS73+dSlzISFwLcR/kC14Z5HksbNg5Cb31P/dUOzrl6EldzZf1GixRDGV2bW7+8gGh0gTiM11HLRmgpvgRYI9fpnyUwHeVZJHhzLkGF9wsLHNYh+zC1INjVW6PmYVhtXsaMgufNvu3MsGW3LHnxhwydU2v1gIlxEnCBx6fU1bWIdehVi1Zb5gKNED3ugTmgzZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZCHZTH2Sxdrtxl9ETJCPFgpBwxBRITiKyBzflVqtSc=;
 b=h4SNltYdhzalllatTi7B/7RVqm/Hl9Osy4Nl4mdldpbbqUdWXQHM21q5H6bSIQq7IkG7nhfhA0zVtaAXX1UYg8W3MCtT/H+xNdVsN2NnDJCZmgA7VGhhSMdoHHIPCjAGXpcjTn3TxF2njF368UeC6UeFrR38EJeb7lV482W3RLA=
Received: from BY3PR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:217::29)
 by PH8PR12MB8605.namprd12.prod.outlook.com (2603:10b6:510:1cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:14:15 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::91) by BY3PR04CA0024.outlook.office365.com
 (2603:10b6:a03:217::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 06:14:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 06:14:15 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 9 Oct
 2026 01:14:08 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v8 2/4] platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
Date: Fri, 9 Oct 2026 11:43:54 +0530
Message-ID: <20261009061356.3234513-3-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009061356.3234513-1-muralidhara.mk@amd.com>
References: <20261009061356.3234513-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|PH8PR12MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab6d4fe-8e7f-44e4-f63b-08df25cc8bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|5023799004|56012099006|11063799006|10067099003|22082099003|3023799007|6133799003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	MwflBy2R2w8VwG1HOmXJOfsiDm5/SmNTkq4h7t7+LTjhQns0OIR5tZl4XrJZqpzCDeAxoTHRwi11Zf+Z7sQdo1Asijk5O4JDMFGeb4s1hwYOtVnbMRbeJhJpCe2QWZaetbWBPZCdDMuYzYsoOme/eV9PQ4E4CzEsflxQAwjKmFBaqVmdj2m9f7o8eemDR6YUL27/j0MAZhgAFk6cCpfokEbLTrasPf9dvs/DeKx+UmqtcSDxc8ffsZatHb1lUYlizmpsq8CD4FSWUJWmBV4ApF3BkrcnNXB+yZmiNzKJr6gmEaRXeY0zVZdAtBoVMesxPiUBaF2pPzR+oRULmzyfKFXFmsiHlVDDEy9WE5AYzaqsi/ylxazZ/rm0uUqSdtPkMAYg6gUX7lfQwrR80gK1aLS25Yg6W/WmjhOE7eg2K+fH+UDVNWDu7+BYYZBuIBc+xWnJViSFD+AhIBBc9STWR3Zn0jLniM9sU77l6GVp6857ktXmBwZSKz5e2mzmnpe2fatfNbxWnAZ6xFvq7VQrDh8oXpCRWuGTrlpINgpqfp3XtiwD0dk+1BVLAHfRwjwk8K2+M8NuHlyD8828EWxbeb01O5Vfnwl1C49uH5VfOHd3zkCakd4S3MJrPeP5u4AD6RfTkgoavhUbwjj9RqCXzpcYchW1Kmir808+kwvEgGH/4hkZ6W6kHSY7Ub/GpXU3julXeGuFZFJwEPNkbdEWew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(5023799004)(56012099006)(11063799006)(10067099003)(22082099003)(3023799007)(6133799003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jvkAVbk7pig8wHm7+Q87AVUQzk9jN2w81uORTy5OA1PuvD/gQ12lXxZC++x22vzyNC2gFGGGxRbjtJHg5Hi9gyMqbOGajgROPYhOqJcKcM9w9bfTCC3JDFJagZixMyPmtNmOspwAKvB+lrdtHlJVKKE/8cWyG2znCwZmGxPgvN2I4Dg2MlpVHJm54SuEj2RJwcMmd8Mt5llss32Wr+VNJcwH6hD8hxZ92h7yPX5TintQxzueQ0OEvaCr4PtwWY8EQ/Ad7GIe+lJuar4jMgt3A/6W7hn3lLuHtcXDca3qa8lTya+gaNHF0JRzf2TcMFdo1t6W8DBh0rRg2jpvWVpKGbF/WwHlwYbpZGyPlK3tf10nDj8jatsyUCyPtXINJNE1PcWsTWvQqMah/KEj6A6OOsgjAjQRTFLYkxOihvNtdeCbGFcP6Y8MEUkFUWMVV77V
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:14:15.6843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab6d4fe-8e7f-44e4-f63b-08df25cc8bbc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8605

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
and hsmp_ioctl_msg() therefore skip msg_id range validation,
array_index_nospec() sanitization, and the /dev/hsmp GET/SET fd-mode
gate for client messages, leaving msg_id validity to firmware's
response status; validate_message() still bounds client num_args and
response_sz to HSMP_CLIENT_MAX_MSG_LEN. Server platforms keep every
check, and get_msg_desc() now also enforces a lower msg_id bound
there. Add hsmp_msg_response_sz(), returning the descriptor table
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
 drivers/platform/x86/amd/hsmp/hsmp.c | 228 ++++++++++++++++++++-------
 3 files changed, 335 insertions(+), 57 deletions(-)

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
index d32d5a907aae..87765116952a 100644
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
-- 
2.34.1

