Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010060.outbound.protection.outlook.com [40.93.198.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B68B23394A;
	Sat, 19 Sep 2026 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804135; cv=fail; b=SsYAKV1J2rKHiv7O+H3hkZE9XlCgL4S4o3B3FbxxsvK9aIb5ha/LtbL0DF3IMWMrwsAeU57ET5uFeUs79WmXKuDdevOY54p1KmhX7mYUp+vqqzliKnpZFvD9u9UgYd7pgthqM7M9cLPFU4hVQbsNNHA7gdSGOtvZCngXL5myG2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804135; c=relaxed/simple;
	bh=8W7yBFV7lug3OUrkBcxfj16Ax0TmEpZnyy7slqCzL2s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Amr8rU5pX5dlCNQlE222KQKOq8n8qct1IVzCt3N39ljTWdKChPJ5YuyRiZdgZ75R/CNXqxEPGhnZ2I6R4hGTl4OGHLaEh612HSmRJeTWYa7PEf6Gp/v1Ztx3LC/w3BflG/rynhHWM62sVdcciFTouklIOtC19UcE6s9v/OOQ8M0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UJKjFE2k; arc=fail smtp.client-ip=40.93.198.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UJKjFE2k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xP/tcqSBie2PBtTsScfjwZWtlWCLHWwHaJdtnwdC1gLtyFJgFm2YHa6tpE/Oe2YR4sFPYPMEqPCAc4J/YT+cbGOZUnsugzRA0TUTf/BX4YevaysjNYCdn/3WgI1Y4snbW7gdSXut6HxBm9txlFdRyOgMepMueRDlun/QmpmNy2mpiHxzzTgPcvsGj5gKWw4WGk66gV5osPsNRT3CvjV07mh46FqmcYgXFCW2e6NEk1hvfmiKEWVTpZLJfADCmT1hu+nTANhAljxA2YfHv8oHP5EpPkdYvnOU2MgrpXMM9hb65cPrFQ2YaN084wmQ3rAxq0MV79zZUAhILrBXeuSR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zcNYMPXvsPfz967ppppu6sp/Zph19ziT4akQJFwjPw=;
 b=Y0b5anXjGq2jj4Yj4dQP0b1jokUoiY5B4bcvZvlgXaPSgHS5QYsE5DgIh6n53LRXuM3QrsGMRWvAnM0SGRocMSd6UsqwV0HYDNTvHNKT0W9CMahZvcjFceKXRqmHLh87Q7r8iIyP6TT5YPFtLZ5dCyYMuGO6ncrS7vO6eBJ+7/3f5gPUJIsUtjed/mxDsrFSPu1PW2d42ZDA5j2FS7CYaEcRV+TklZOr+G1Sd1usYDFKoAAB6ViVbRGpNe5K1UXGXNfRiVMPHjNH3jccMgJW6hcksGB8jjYTimHlCU7Us7Uaa59euy9hD+UiahrobUmDCZoji9wsem+mhaenWi6BFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zcNYMPXvsPfz967ppppu6sp/Zph19ziT4akQJFwjPw=;
 b=UJKjFE2kuxxTquLrJL+dgqynNBurjTrrhaegeFCJ89PcIDnpjnm7zsjees8CmrJQMDxfvAIj9AgyJ+OFjI2LZE/6HB6VNmZ/brTlviHKdhzcZAV5YGZJNu8sGLAhjevHyj3iiRSpkTgw3xQEP49HZpu9ZL6qj02NWL5QOTMLliQ=
Received: from PH7P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::26)
 by DS6PR12MB159332.namprd12.prod.outlook.com (2603:10b6:8:4a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Sat, 19 Sep
 2026 07:48:47 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:510:33a:cafe::15) by PH7P222CA0006.outlook.office365.com
 (2603:10b6:510:33a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Sat,
 19 Sep 2026 07:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sat, 19 Sep 2026 07:48:46 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sat, 19 Sep
 2026 02:48:44 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Mario Limonciello
	<superm1@kernel.org>
Subject: [PATCH v6 1/3] platform/x86/amd/hsmp: Add HSMP client support for Family 1Ah
Date: Sat, 19 Sep 2026 13:18:16 +0530
Message-ID: <20260919074818.2541775-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919074818.2541775-1-muralidhara.mk@amd.com>
References: <20260919074818.2541775-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|DS6PR12MB159332:EE_
X-MS-Office365-Filtering-Correlation-Id: 211785e0-5c3d-40d9-5f6c-08df16226fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|10067099003|3023799007|6133799003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jNVBa6XEoyx8BI7KkUlnY0/Vmh93udiX1Sev5OZbqNJ+oJ/ZzxMyA/h4BddMY6ZZv6jg6g+9JFm8esXa+Nh/QomyI8Z9GKpLa6Ots6eVEIP4IB0u0OqYQ1//SjxINju/To33vDlwqqAaQz3UmPRg21ZRBI2FEQE9I1eDpPOPVJwPUmbximcWBlpVGW0q9Bc9gIB9q9AxeCP4+TH8LghDzZvHHEN15bHfqdoWgaYi/lA7GMF1R+/X2j/hEMOWkLTyHffMD73QJWqyGkbXxqZOiBgUQx9i0ywiYrKTir788x47H26R7uqaX+uzJJ+JereqNXmFZAw3rZr9BEEkNMp6CyKRrtktdZxNJ7v2WCKJ9Qw6bVF/Mm1eJV/c0BuVFrk1zhhQs6egwnOwcM6Ul4p5tdRJlfQVTY05ZmPoWvGy9izMCYxb54C8YqMciLTx3kHvybOWBkaoM2q57qyXEH4ckYGwpOLLQEf3/wK3/C2Hk5W5zrjgeiEqohEfKj4auFbWWZ/pKa8fLfI1/4y083qVBWtDHfkC/VQwB3im+S23GiehC08Pyz1jqUseVc+2JKHp6GJ29cAf02rPw+lHp2MOyVk0aoUqkYMiffuuupuwV97fCFjpAax6D4psG1cQ+a7JzIL63rgUMeY+CBfeoCmUi9LGnXU81woYymHhyRQg19xPXNSsEroG8otxX+Dxg1u0GF1WIguRry/G8mCvR+n16Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(10067099003)(3023799007)(6133799003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E4Lh8j3R1Zhj5PjERobeCpaTpDt5JqAsm4mY+h+78l6fKSxAXCbO582V1LmFw5298AI7pCo3iEAsFzwNkmzcQkUvb7E6+sPfMcp8xqpH/QC13kCjZuHiL+fdtuzT674LcEMFBIqcyYDW/1vqLKS1aKLE4t6qORyj2NDP/HaXmnJ1RkAU/n6hTr6s4y9WnQTdkBf9z//B7bX2DD5cKvQYuwUORdJdF04pqFXL2te1CLsc3tRabD8R/XxWrWdvqunSyOOhsNJL1PtsS1gcocgiQsvdtK5wi3uvCemOUnFqRKtrnCtEuVg9+yYgBPjlVG52W9+fzAAxfOmQVM6wSDOwT2DELdF8tO9YQ5Z/U0hNO9VA+AKgOMGvJ5430Wjh4FpRoAVzafwKWFYVp3g2YU1m/su8ymaPyUxx/B9vi+uDE+j6uajcLN1dI9+t2eO9HYQr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 07:48:46.8993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 211785e0-5c3d-40d9-5f6c-08df16226fc2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB159332

Add HSMP client support for the Family 1Ah client platforms, Models
80h-8Fh and E0h-E3h. These parts speak the Ryzen Master SMC (RMSMC)
message set instead of the server HSMP messages, and probe via ACPI
_CRS/_DSD like a server socket.

Add the client message set to the UAPI header and its descriptor
table to the driver. Introduce struct hsmp_plat_desc to select the
message table, test message, and protocol-version message at
runtime, based on the ACPI-reported PM profile (is_client_platform())
rather than a fixed set of family/model ranges. Document the client
models in amd_hsmp.rst.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 Documentation/arch/x86/amd_hsmp.rst  |  10 +-
 arch/x86/include/uapi/asm/amd_hsmp.h | 143 +++++++++++++++
 drivers/platform/x86/amd/hsmp/hsmp.c | 251 +++++++++++++++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.h |  23 +++
 4 files changed, 397 insertions(+), 30 deletions(-)

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
index eda336bfd3e9..56317e9298b8 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -664,4 +664,147 @@ struct hsmp_telemetry_data {
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
index 5e123a4ecea9..3e27287c0517 100644
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
@@ -45,8 +48,191 @@
  */
 #define CHECK_GET_BIT		BIT(31)
 
+/* Indexed by enum hsmp_client_message_ids; see there for per-message details */
+static const struct hsmp_msg_desc hsmp_client_msg_desc_table[] = {
+	/* RESERVED */
+	{0, 0, HSMP_RSVD},
+
+	/* HSMP_CLIENT_TEST */
+	{1, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_SMU_VER */
+	{0, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_INTERFACE_VER */
+	{0, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_METRICS_TABLE_VER */
+	{0, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_METRICS_TABLE */
+	{0, 0, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR */
+	{0, 3, HSMP_GET},
+
+	/* HSMP_CLIENT_SET_CORE_PSM_MARGIN */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_FAST_PPT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_TJ_MAX */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_FIT_LIMIT_SCALAR */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_ENABLE_OVERCLOCKING */
+	{0, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_DISABLE_OVERCLOCKING */
+	{0, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_OVERCLOCK_VID */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SPARE_0X13 */
+	{0, 0, HSMP_RSVD},
+
+	/* HSMP_CLIENT_GET_CORE_PERF_ORDER */
+	{1, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_SLOW_PPT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_FAST_SPM_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_SLOW_SPM_LIMIT */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_GET_CORE_PSM_MARGIN */
+	{1, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_GET_GFX_PSM_MARGIN */
+	{0, 1, HSMP_GET},
+
+	/* HSMP_CLIENT_SPARE_0X1D */
+	{0, 0, HSMP_RSVD},
+
+	/* HSMP_CLIENT_SPARE_0X1E */
+	{0, 0, HSMP_RSVD},
+
+	/* HSMP_CLIENT_SPARE_0X1F */
+	{0, 0, HSMP_RSVD},
+
+	/* HSMP_CLIENT_SPARE_0X20 */
+	{0, 0, HSMP_RSVD},
+
+	/* HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE */
+	{0, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_GFX_PSM_MARGIN */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_CCLK_FMAX_OFFSET */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX */
+	{1, 0, HSMP_SET},
+
+	/* HSMP_CLIENT_SET_GFXCLK_FMAX */
+	{1, 0, HSMP_SET},
+};
+
+/* Catch a table left out of sync with its enum at build time */
+static_assert(ARRAY_SIZE(hsmp_msg_desc_table) == HSMP_MSG_ID_MAX);
+static_assert(ARRAY_SIZE(hsmp_client_msg_desc_table) == HSMP_CLIENT_MSG_ID_MAX);
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
+/* The client drives a different mailbox with the Ryzen Master SMC message set */
+static const struct hsmp_plat_desc hsmp_desc_client = {
+	.msg_desc		= hsmp_client_msg_desc_table,
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
+/* Returns NULL if msg_id is out of range or reserved for this platform */
+static const struct hsmp_msg_desc *get_msg_desc(u32 msg_id)
+{
+	const struct hsmp_plat_desc *desc = hsmp_desc();
+
+	if (msg_id >= desc->num_msgs)
+		return NULL;
+
+	if (desc->msg_desc[msg_id].type == HSMP_RSVD)
+		return NULL;
+
+	return &desc->msg_desc[msg_id];
+}
+
 /*
  * Gates the AMD HSMP data plane against socket bring-up and teardown.
  *
@@ -184,30 +370,29 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
 static int validate_message(struct hsmp_message *msg)
 {
-	/* msg_id against valid range of message IDs */
-	if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
-		return -ENOMSG;
+	const struct hsmp_msg_desc *desc;
 
-	/* msg_id is a reserved message ID */
-	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
+	/* Unknown or reserved message ID for this platform */
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
@@ -316,7 +501,7 @@ int hsmp_test(u16 sock_ind, u32 value)
 	 * Test the hsmp port by performing TEST command. The test message
 	 * takes one argument and returns the value of that argument + 1.
 	 */
-	msg.msg_id	= HSMP_TEST;
+	msg.msg_id	= hsmp_desc()->test_msg;
 	msg.num_args	= 1;
 	msg.response_sz	= 1;
 	msg.args[0]	= value;
@@ -338,13 +523,12 @@ int hsmp_test(u16 sock_ind, u32 value)
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
@@ -354,6 +538,8 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
 	struct hsmp_message msg = { 0 };
+	const struct hsmp_plat_desc *plat_desc = hsmp_desc();
+	const struct hsmp_msg_desc *desc;
 	int ret;
 
 	if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
@@ -361,23 +547,25 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 
 	/*
 	 * Check msg_id is within the range of supported msg ids
-	 * i.e within the array bounds of hsmp_msg_desc_table
+	 * i.e within the array bounds of the platform's descriptor table
 	 */
-	if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
+	if (msg.msg_id < plat_desc->test_msg || msg.msg_id >= plat_desc->num_msgs)
 		return -ENOMSG;
 
 	/*
 	 * Sanitize the user-controlled msg_id against speculative
 	 * execution.  The bounds check above retires the out-of-range
 	 * case with -ENOMSG, but a mispredicted branch can still let the
-	 * CPU speculatively use msg_id as an index into
-	 * hsmp_msg_desc_table[] (here and in validate_message() /
-	 * is_get_msg() called downstream via hsmp_send_message()), and
-	 * pull arbitrary kernel memory into the cache (Spectre v1,
-	 * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
-	 * dereference sees the sanitized value.
+	 * CPU speculatively use msg_id as an index into the message
+	 * descriptor table, here and again in validate_message() called
+	 * downstream via hsmp_send_message().
 	 */
-	msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
+	msg.msg_id = array_index_nospec(msg.msg_id, plat_desc->num_msgs);
+
+	/* Rejects the reserved IDs the table describes as such */
+	desc = get_msg_desc(msg.msg_id);
+	if (!desc)
+		return -ENOMSG;
 
 	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
 	case FMODE_WRITE:
@@ -385,7 +573,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 		 * Device is opened in O_WRONLY mode
 		 * Execute only set/configure commands
 		 */
-		if (is_get_msg(&msg))
+		if (is_get_msg(desc, &msg))
 			return -EPERM;
 		break;
 	case FMODE_READ:
@@ -393,7 +581,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 		 * Device is opened in O_RDONLY mode
 		 * Execute only get/monitor commands
 		 */
-		if (!is_get_msg(&msg))
+		if (!is_get_msg(desc, &msg))
 			return -EPERM;
 		break;
 	case FMODE_READ | FMODE_WRITE:
@@ -410,7 +598,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
+	if (desc->response_sz > 0) {
 		/* Copy results back to user for get/monitor commands */
 		if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
 			return -EFAULT;
@@ -685,11 +873,16 @@ EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
 int hsmp_cache_proto_ver(u16 sock_ind)
 {
 	struct hsmp_message msg = { 0 };
+	const struct hsmp_msg_desc *desc;
 	int ret;
 
-	msg.msg_id	= HSMP_GET_PROTO_VER;
+	msg.msg_id	= hsmp_desc()->proto_ver_msg;
+	desc = get_msg_desc(msg.msg_id);
+	if (WARN_ON(!desc))
+		return -ENOMSG;
+
 	msg.sock_ind	= sock_ind;
-	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
+	msg.response_sz	= desc->response_sz;
 
 	ret = hsmp_send_message_locked(&msg);
 	if (!ret)
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

