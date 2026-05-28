Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AC93AFCEF;
	Thu, 28 May 2026 09:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961228; cv=fail; b=bg3py+l590GCadAGU/0RfVOK5z6US7kVzUWiIo1ACUMNSX8UUXSBUPJTS350HXFXedvBj6LY/Gq+3owbSH++fBpSox1XjqBFFgVR/yCQJ4pqqzHCsAOzOi0CE0Z6o2X13NFZGYuMMmyvVgYGGckDa865Z7IG3PcEhHgiYTKO5Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961228; c=relaxed/simple;
	bh=QLCoUOeoO4IOfsxpuppmcylEdQUn+rL1J5MIzFs1Irs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pX+2sYWI627dHHQc6cXQX2HF75e3QRNYLCu0PzXH3Z2/UxMtfRu/IQyfeo9ltk2scb/MrOD5GWJBYCTN5PTr8jXkZxCKTPU2qB2c0v+Xads4+zF6XsoV3qmd5CII46nBC1tDnUBY9eT74j3Ka8rkHj9LY53jGEdhV1ftvy9/9dU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QA1u1ysX; arc=fail smtp.client-ip=52.101.52.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QA1u1ysX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWdGL/pSnHuLN+i+osB06MhK37EXVitZ2PIROXY298Gq00HEqZjO2PydKVmwzuWC+//Os6ur1jPss9MCB332KNKijdWuB/BD9BVSCgZsd0ixhbgHlLForzT+SBBuRn7+vt9ut5Y/Qi8Ner9ThYIe1c3N9NmEPpE5B5VTQCmq0RRn0YtSGnT8RY+UhgAuQhNlclpD0PL1aOVYQyKxu/JzHL+gl2TZpzH0sVFFi6TFD2wb3SuH4Dwu1xHmz5Xzz9TP7iE2mNR7iLl/L77Ktwnaz98SXTeyKFzj2hKY/VlGIspv/thxJbgICIhanY4cMp8q7PunXTgssgJkfYJwhXXH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onbJ7V2tHOpfrmP1pdceaQ1tKe3JtGbJuC2RTmRybG0=;
 b=LttcJOieKRYb3/56XmvBMtV9Z5sDCsDnAKN/krZfBL0sGwlx1Nxc9bQKWkKYnVPBmRd3oNaxFJA6gC+HZ0D2XGQD4ZTX7iNjjmxDNV3SLAzQNVtg1gcVsBMnnHO0fVyObsCgcF3COi6jU/c8KI5RVy+dhnkE3NcwuzQmW6w7R+nrbyD+ukr90SLbN/7c8Kig6cKQiS3niQLj4SCz85PYRYHM5tnu4NIspzvMqpcHxM+gCof7wtSrBd9j65Fvm7tT/u/DrNyHAJ56F7ryEkOpoQ4sMQ31kW0K/RTWNLQLV7F/1hsXur6C2k2oIx5ZUz93wjMt8O8H0citEReBcHisYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onbJ7V2tHOpfrmP1pdceaQ1tKe3JtGbJuC2RTmRybG0=;
 b=QA1u1ysXum4ouiuq7PdaFFo1P8pQh+emY3FQSBMFfzjHitItX7EiDpNtsU6DPrZCNMw8TBCEc6svqGoPAmEisctLMdZy9juZA8Pw5FEbZwgPkaDhC1uH0juJOAqucYVbZC4Qt61kPaf0Bw0T9Ol6vVdoPsVCLuK2n4BaYBtyidw=
Received: from CH0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:610:e5::33)
 by DM4PR12MB6253.namprd12.prod.outlook.com (2603:10b6:8:a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 09:40:18 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::94) by CH0PR03CA0268.outlook.office365.com
 (2603:10b6:610:e5::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 09:40:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 09:40:17 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 04:40:15 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Suma Hegde <suma.hegde@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH v4 1/7] platform/x86/amd/hsmp: Add new HSMP messages for Family 1Ah, Model 50h-5Fh
Date: Thu, 28 May 2026 15:09:48 +0530
Message-ID: <20260528093954.2461272-2-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|DM4PR12MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 5312a634-3803-4e74-0bb9-08debc9d2086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|22082099003|18002099003|6133799003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	DOUDeFiUo/rA4qDcimJkDmAI0fOGsUQJIsB6/ISbeqO+Du7Yc1WulF6jzMAROHmfZdawhUSEdEGIay5Kp5vrO0Di1pquQ1NuIEQXNa6efeF/Ji0H9Vaa2wP6yJsVzu8uJ822URCYpQC/gYZA7nXr01f5IXfZ5HRZvXfHM+CA7ithVGDmjLRbMEUxkt32fo5MDZJOsyDSuIO3PZnO276ps3nMGzQdmg9kEp9ZYLN0uru6nfQavd9ShfQpzsOGJq38FwLbY5MpfRVvxs9/eVDQmLDhNLr9FfLPvQt+BPWqIFbIPW+HTbvgQ4iXweWyismR9HDzgeXqT7tkIOOGvYL2R5/FsYB0AaauYyB2ZRgdvTdQjjLvN1wZ/bzKoOroFfU8CW/idt7GFifimdPuz7Q2/JN9ud9Dn2qfOR9TOn+CJpearTSH4CO5iTvpRfGYb59nn3GGrmvRIc5OiiUsKY9oPPy0RY7lYd84Tv2KS0AHWSadxWIpmyMZVdsR2NRgwgW71KRvOTAWZyJhRdKFj/KFGEuLgivTqXrc0ewTpaUBJiHlPz2LCh3N6V0tOYpsrX+1gQ+fY0u60YOwnCABoKYGJP7QiYv+c1ux/w52vWZAh+SyeLZ3J+0x9qmL9ri2nZJsBXJZFoigBnLOOELcD3MZgnwkOMSkksPaF777cGqZzeEP6JLLpsYISLIaj4amNYg2KciA/Jr8welWm2kAOXk8A7FvgkZNtnwmY/a06ujUxqo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gxaAXGGJtu856cxeFcWgk5Ug5aoSr3stSWl1eZy04mhGe6tOmxLkpHtbW4WCKE1zWguVANfTAP7bB/pun8AgNNj4999xWDsZpgGFHvJfuXYwTQcWDAvxO6d0I8eWds9U/6uAjetp0BOEszb9NfAVXTiHqSBVcoZv0Ed6NMTyCLqD0BkF+7ucRoPicuqqH4JSamwMOqVZt+u026kHExoT3GQ78Lmk6p4aUeW2cQNTVqerB7XA35mtNRNntm51o/POlJrSO6/OMye0E/sGnsDHaszqhsLtAFD2oWIYcEpVYhQ4DFDysZqz6pVMYQX9jg0GaVDqE51XHjt2o1yWcJIuen53RFjIei2e2ocw2HPCPkNr2nqNVaRv2rG21deE941C1kWTEa9WoLGT/663yrTQ5ql8JsX6ApqrjrEPaMUjuuqO7FFuOuRc0EB/k5hExHe1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 09:40:17.4401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5312a634-3803-4e74-0bb9-08debc9d2086
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6253

From: Suma Hegde <suma.hegde@amd.com>

Family 1Ah Model 50h-5Fh firmware exposes new HSMP messages
(0x29-0x2A, 0x33-0x3A) for PC6/CC6 control, CCD power/thermal
monitoring, DIMM sideband access, floor- and SDPS-limit control,
and command-enable discovery. The driver currently marks those IDs
as HSMP_RSVD and validate_message() rejects them with -ENOMSG, so
userspace has no way to reach the new functionality.

The same firmware also extends three existing SET-only messages
(HSMP_SET_XGMI_LINK_WIDTH 0x0C, HSMP_SET_DF_PSTATE 0x0D,
HSMP_SET_PSTATE_MAX_MIN 0x22) with a read-back path selected by
bit[31] of args[0] (0 = set, 1 = get). Without converting these
entries to HSMP_SET_GET, userspace cannot query the currently
programmed value even though firmware now supports it.

Add the new IDs, convert the three messages to HSMP_SET_GET, and
bump the driver version to 2.6.

Backward compatibility is preserved on prior platforms:

- The new IDs previously occupied HSMP_RSVD slots and were rejected
  with -ENOMSG, so no existing caller could have been issuing them.

- Existing userspace that leaves bit[31] = 0 continues to take a
  pure SET path (is_get_msg() returns false); the lax upper-bound
  validation already used for HSMP_SET_GET accepts the historical
  response_sz = 0 callers unchanged.

- A new-userspace build that issues a GET against older firmware
  fails cleanly with a firmware error, because that firmware rejects
  the non-zero Reserved bit it now sees in bit[31].

Reviewed-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 arch/x86/include/uapi/asm/amd_hsmp.h | 153 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |   2 +-
 2 files changed, 140 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 92d8f256d096..52e53ec5877f 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -53,9 +53,19 @@ enum hsmp_message_ids {
 	HSMP_SET_XGMI_PSTATE_RANGE,	/* 26h Set xGMI P-state range */
 	HSMP_CPU_RAIL_ISO_FREQ_POLICY,	/* 27h Get/Set Cpu Iso frequency policy */
 	HSMP_DFC_ENABLE_CTRL,		/* 28h Enable/Disable DF C-state */
+	HSMP_PC6_ENABLE,		/* 29h Get/Set PC6 enable/disable status */
+	HSMP_CC6_ENABLE,		/* 2Ah Get/Set CC6 enable/disable status */
 	HSMP_GET_RAPL_UNITS = 0x30,	/* 30h Get scaling factor for energy */
 	HSMP_GET_RAPL_CORE_COUNTER,	/* 31h Get core energy counter value */
 	HSMP_GET_RAPL_PACKAGE_COUNTER,	/* 32h Get package energy counter value */
+	HSMP_DIMM_SB_RD,		/* 33h Get DIMM sideband data */
+	HSMP_READ_CCD_POWER,		/* 34h Get average CCD power */
+	HSMP_READ_TDELTA,		/* 35h Get thermal behaviour */
+	HSMP_GET_SVI3_VR_CTRL_TEMP,	/* 36h Get SVI3 VR controller rail temp */
+	HSMP_GET_ENABLED_HSMP_CMDS,	/* 37h Get supported HSMP commands */
+	HSMP_SET_GET_FLOOR_LIMIT,	/* 38h Get/Set core floor frequency limit */
+	HSMP_DIMM_SB_WR,		/* 39h Set DIMM sideband data */
+	HSMP_SDPS_LIMIT,		/* 3Ah Get/Set SDPS limit */
 	HSMP_MSG_ID_MAX,
 };
 
@@ -170,16 +180,27 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	{0, 1, HSMP_GET},
 
 	/*
-	 * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0
-	 * input: args[0] = min link width[15:8] + max link width[7:0]
+	 * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0/1
+	 * input: args[0] = set/get XGMI Link width[31] (0 = set, 1 = get) +
+	 *                  min link width[15:8] + max link width[7:0]
+	 *        Link width encoding: 0 = x4, 1 = x8, 2 = x16.
+	 *        On SET, max must be >= min.  On GET, [15:0] are reserved.
+	 * output: args[0] = reserved[31:16] + min link width[15:8] +
+	 *                   max link width[7:0]
 	 */
-	{1, 0, HSMP_SET},
+	{1, 1, HSMP_SET_GET},
 
 	/*
-	 * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0
-	 * input: args[0] = df pstate[7:0]
+	 * HSMP_SET_DF_PSTATE (APBDisable), num_args = 1, response_sz = 0/1
+	 * input: args[0] = set APB_DISABLE / get APB state[31]
+	 *                  (0 = set & lock DF P-state, 1 = get) +
+	 *                  reserved[30:8] +
+	 *                  DF P-state[7:0] (0..2; reserved on GET)
+	 * output: args[0] = reserved[31:9] +
+	 *                   APB state[8] (1 = disabled, 0 = enabled) +
+	 *                   locked DF P-state[7:0] if [8] = 1, else reserved
 	 */
-	{1, 0, HSMP_SET},
+	{1, 1, HSMP_SET_GET},
 
 	/* HSMP_SET_AUTO_DF_PSTATE, num_args = 0, response_sz = 0 */
 	{0, 0, HSMP_SET},
@@ -305,16 +326,32 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	{1, 1, HSMP_SET},
 
 	/*
-	 * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0
-	 * input: args[0] = power efficiency mode[2:0]
+	 * HSMP_SET_POWER_MODE (PwrEfficiencyModeSelection),
+	 *	num_args = 1, response_sz = 1
+	 * input: args[0] = set/get policy[31] (0 = set, 1 = get) +
+	 *                  high util point[30:24] +
+	 *                  low util point[23:17] +
+	 *                  PPT limit[16:5] +
+	 *                  reserved[4:3] + mode selection[2:0]
+	 *        [30:5] are valid only when [2:0] is a balanced core mode
+	 *        (4 or 5). [2:0] is reserved when getting (bit[31] = 1).
+	 * output: args[0] same layout, [31] reserved, [2:0] = arbitrated
+	 *         current efficiency mode.
 	 */
 	{1, 1, HSMP_SET_GET},
 
 	/*
-	 * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0
-	 * input: args[0] = min df pstate[15:8] + max df pstate[7:0]
+	 * HSMP_SET_PSTATE_MAX_MIN (DfPstateRange), num_args = 1, response_sz = 0/1
+	 * input: args[0] = set/get DF P-state range[31] (0 = set, 1 = get) +
+	 *                  reserved[30:16] +
+	 *                  min DF P-state[15:8] + max DF P-state[7:0]
+	 *        DF P-state encoding: 0 = DFP0 (high performance),
+	 *                             1 = DFP1, 2 = DFP2 (low performance).
+	 *        [15:0] are reserved when getting (args[0] bit[31] = 1).
+	 * output: args[0] = reserved[31:16] + min DF P-state[15:8] +
+	 *                   max DF P-state[7:0]
 	 */
-	{1, 0, HSMP_SET},
+	{1, 1, HSMP_SET_GET},
 
 	/*
 	 * HSMP_GET_METRIC_TABLE_VER, num_args = 0, response_sz = 1
@@ -355,9 +392,31 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	 */
 	{1, 1, HSMP_SET_GET},
 
-	/* RESERVED(0x29-0x2f) */
-	{0, 0, HSMP_RSVD},
-	{0, 0, HSMP_RSVD},
+	/*
+	 * HSMP_PC6_ENABLE (Pc6Enable), num_args = 1, response_sz = 0/1
+	 * input: args[0] = set/get PC6 control[31] (0 = set, 1 = get) +
+	 *                  reserved[30:1] +
+	 *                  enable PC6[0] (0 = disable, 1 = enable;
+	 *                  reserved on GET)
+	 * output: args[0] = reserved[31:1] + current PC6 control[0]
+	 *                   (last value configured via HSMP or APML)
+	 */
+	{1, 1, HSMP_SET_GET},
+
+	/*
+	 * HSMP_CC6_ENABLE (CC6Enable), num_args = 1, response_sz = 0/1
+	 * Configures CC6 enable for all cores; changing the setting does
+	 * not by itself transition cores in or out of CC6.
+	 * input: args[0] = set/get CC6 control[31] (0 = set, 1 = get) +
+	 *                  reserved[30:1] +
+	 *                  enable CC6[0] (0 = disable, 1 = enable;
+	 *                  reserved on GET)
+	 * output: args[0] = reserved[31:1] + current CC6 control[0]
+	 *                   (last value configured via HSMP or APML)
+	 */
+	{1, 1, HSMP_SET_GET},
+
+	/* RESERVED(0x2B-0x2F) */
 	{0, 0, HSMP_RSVD},
 	{0, 0, HSMP_RSVD},
 	{0, 0, HSMP_RSVD},
@@ -385,6 +444,72 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	 */
 	{0, 2, HSMP_GET},
 
+	/*
+	 * HSMP_DIMM_SB_RD, num_args = 1, response_sz = 1
+	 * input: args[0] = reg space[23] + reg offset[22:12] +
+	 *                  device LID[11:8] + DIMM address[7:0]
+	 * output: args[0] = read data byte[3:0]
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_READ_CCD_POWER, num_args = 1, response_sz = 1
+	 * input: args[0]  = apic id of core[15:0]
+	 * output: args[0] = CCD power(mWatts)[31:0]
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_READ_TDELTA, num_args = 0, response_sz = 1
+	 * output: args[0] = thermal behaviour[31:0]
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_SVI3_VR_CTRL_TEMP, num_args = 1, response_sz = 1
+	 * input: args[0] = SVI3 rail index[3:1] + read temperature[0]
+	 * output: args[0] = SVI3 rail index[30:28] +
+	 *                   rail temperature in degree C[27:0]
+	 */
+	{1, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_ENABLED_HSMP_CMDS, num_args = 1, response_sz = 3
+	 * input: args[0] = HSMP command mask[0]
+	 * output: status of HSMP command = args[0], args[1], args[2]
+	 */
+	{1, 3, HSMP_GET},
+
+	/*
+	 * HSMP_SET_GET_FLOOR_LIMIT, num_args = 1, response_sz = 1
+	 * input: args[0] = op[31:30] + reserved[29:28] +
+	 *                  apic id[27:16] + floor frequency MHz[15:0]
+	 *        op encoding: 00 = set per-core floor,
+	 *                     01 = set all-cores floor (apic id reserved),
+	 *                     10 = get per-core floor,
+	 *                     11 = get per-core effective floor.
+	 *        Floor frequency field is reserved on GET (bit[31] = 1).
+	 * output: args[0] = floor frequency MHz[15:0]
+	 *                   (effective for op 11, configured for op 10;
+	 *                   reserved on SET)
+	 */
+	{1, 1, HSMP_SET_GET},
+
+	/*
+	 * HSMP_DIMM_SB_WR, num_args = 1, response_sz = 0
+	 * input: args[0] = write data[31:24] + reg space[23] +
+	 *                  reg offset[22:12] + device LID[11:8] +
+	 *                  DIMM address[7:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_SDPS_LIMIT, num_args = 1, response_sz = 1
+	 * input: args[0] = Set/Get[31] + SDPS Limit[30:0]
+	 * output: args[0] = SDPS Limit[30:0]
+	 */
+	{1, 1, HSMP_SET_GET},
+
 };
 
 /* Metrics table (supported only with proto version 6) */
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
index 0509a442eaae..b153527e0a0d 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.h
+++ b/drivers/platform/x86/amd/hsmp/hsmp.h
@@ -27,7 +27,7 @@
 #define HSMP_DEVNODE_NAME	"hsmp"
 #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
 
-#define DRIVER_VERSION		"2.5"
+#define DRIVER_VERSION		"2.6"
 
 struct hsmp_mbaddr_info {
 	u32 base_addr;
-- 
2.34.1

