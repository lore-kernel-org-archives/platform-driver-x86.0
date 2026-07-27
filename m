Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B6928150F;
	Mon, 27 Jul 2026 14:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161769; cv=fail; b=Mk/Jwx0Qgdtcj9cT3hCB+5M8zezkC8VZSzkE3jluPO564x4gqeXmUVDXvX5ZrNXYVUX9nHRbHDy62GIBR58WvCWKJkS6h/2owstUaL5akBBrYnWhCdxRw/6X/d7OiIEpwg6jEzEdMNzNMB1pqU8uwXAiKbF8os6SgYW/oBhgWJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161769; c=relaxed/simple;
	bh=HZKrFpWctQy+OuN/QnYpzbAftzXHPBTE/8XaUxhtoHo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KK3gbhH72dPC+LOV+Ns9NtTz/f/XMvJWlr85C9LrxXQ8e1NrAEUQqZccHzuFTCVJgZxhseSX5/xyxIL1b1fa/gtJGC4RRKsXZRGa0HmDiv+Kc5sTTYJJhIHx9DekTj47B1deuAFmGfEUo+y9lGouhsP5zyOk1g7D0YjPWdSlP6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VHYQc4Wu; arc=fail smtp.client-ip=52.101.53.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VHYQc4Wu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbHg+W6XBqQnRKN51fb5Lpx/1Ukjdy53ZqNy/pIbLhb9ClRqFABZ7zgWgZBd6KArij05B66J0jqUuVWRvAuYkTQXWe/ox4tl6u/D/lFlGLAaHSfMI2ZpjIcLzbvq3n4XApdFgDGgT+kqgsB9ofFc09dqcZjmZuwfUkogxfvkEGaBcWIQ6T/zUspXO5yHuY5CEilqueWCo1NYJHSibnF7WxSxx9wDVir//kjlb/PpR8X4/IJ20i7sFeAWMc+tNnMQBg7wHaQo0EVrpMSXwrT0upxB5Jy5fAKYH8Yx8qa5A3bnCuQr3hm3PT79xUU5/8SnOA6okKaZjJI9TweiwZ5XTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx58G/KPn1zSB9oBivkS3RgF0k+fsKuxmUneilggBKU=;
 b=QsToSNpwmOKUKyt0ZctR0NOGN+J+zUTYA/pyazy5ppSgH9KlJ8yucqR/vICImQPyJdZaxQcbNDJ/4N+k5va3xP564L+e60xqf8Yf2hqOMGDayJ8qTCrQp/ys+tabv85bicEMpi66/VVSB69mJJhHIHb3SHFADTtcElzQk2nk0rpLKpeLRS7hs+cQycE6ccjX+oUFAeBYnwNFT+i+m0n3JCmebvE+fDja0IpPdqaG/K68D++uguGIt7pQLoy3vT7R3hQIPluWQNJ3FMduludlimdXqoS50J4tARnexKWoWN+dvUzZ7gFnHlKVraOOOFbmSYRlnDchj2+pa+Im9yl38g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx58G/KPn1zSB9oBivkS3RgF0k+fsKuxmUneilggBKU=;
 b=VHYQc4Wukk8wNPy6y2vRFgZzjdP4Op5p0is/IIMMpKmMO69qSIcw2pWORtsW1wgVLYthabSIDg5HzuWGMvC4wme0JGg76n9s+WOIFNhfz9C/2fY2gjuDlMW32tfgFYLwlWZUISEnm171Qpb6ZAVAFXQmA3B0mL5jGA2DcqvZ6Qk=
Received: from MW4PR03CA0235.namprd03.prod.outlook.com (2603:10b6:303:b9::30)
 by MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 27 Jul
 2026 14:16:02 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:b9:cafe::87) by MW4PR03CA0235.outlook.office365.com
 (2603:10b6:303:b9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 14:16:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:16:01 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 09:15:59 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v7 1/5] platform/x86/amd/hsmp: Add HSMP messages for Family 1Ah, Model 50h-5Fh
Date: Mon, 27 Jul 2026 19:45:38 +0530
Message-ID: <20260727141542.3370108-2-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|MW4PR12MB7120:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9c3ea2-be91-4a46-72e3-08deebe996a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|3023799007|11063799006|10067099003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	5gvx8jx4jgdYP/nDtNnx/EApzy7DCgL65VarwLKhC94wqFtlQvS8WgS/P31COdOIjOjhR/WyY8GdWt2ICyrfsovsuXEDW9zK//NLcARroXSKIf9g/yZSlG0pCMJr7Js+EXS8pr6a4hv6lLnnx3L2nc+QLPHMI2qvZCttOzd2cdiwa200vJefBYNXad5gyEDcRprjoCDYy1PjNf1U2uAhMc7uWUeJRel4SPRPJwVHlXE5YlRaQagEwFnK6BKlaoS1munUHNNSn56eZ5SD1SEYds62EonkiEXPEd2NiT9ZfuDWr0DIN7l+u1/6nGSyN4XKKIEr+8LdI5VOhdyv7Zn8uFHFlGFwyn1XofXZ79V5+7HDYgNmxyKgKmDjfd9g5nC8btpfq6DXEsK1EYJibZsnZcQiyE3eXsEW7NqcA0De3Z74ql/PDDRH2C2VxQG7ol6AXZRpW9lHFQbCf6GHM9eBuRwni6FodJ/hiJSqHt+OyO3AD3zYMSpSQ9RyO2mnspjAPiAY0+Hz3Gqm6D4R/lvcA1yuXI8lc9Ydkbj9CpqIOnW6qNoLeGHh/849R6lfe6Naulf3YgUiifRK8xMnyzIRv30PG2992rKlEyvpJnilQUNJ6YrClUu83vzwPZWEFWCL1yoY3Hh/cqCa0gY7kw7u/XKRMIHk+qDEbvFbbm5kQ1/wEwcOCTI4X6sJxkfQqPV/s7gHQD1+8ocissvl9zAJAg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(3023799007)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	soTOrTze2ULci1KahF1Aa08mydRFMc/wG4CM0pB54OGts/xg/4zow2IZR9LvZ9KH1cxiPS6o4bzLAsvlTIDAdMZNWvyVcbuxO4UtUWd5NUs19NMl4CUHJ/3EjrZVCAIQUFnCdbXLkDF7NCrCXYF6clmicM8wN7QQHeCATsKA3UsKoXlMTu/kR+UH4AUXN2+pfXoewsQemydDjh7ClXnbgpL456K4SysBDMfuFyTlZ2wbhwRmV2ZbYZEqRl0Su4UpmyV2UisjORWdQimbbbzktJLkQtuEO1F5ZIEfFtGIswMJyU91CurVOizMoSSJAMeyReBv2QLrU110HdWWkkTLHO7tvUFNjFN+6wBe/ZbMKxwfEtvVcvTF60ueoNcT0uPZFB01GJYbpUW4i7YYbsu7R40rjKqXmPmzjF2PRBOjZom26o3rDIpJQSAa6Yy0txR3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:16:01.9122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9c3ea2-be91-4a46-72e3-08deebe996a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120

Family 1Ah Model 50h-5Fh firmware exposes new HSMP messages (0x29-0x2A,
0x33-0x3A) for PC6/CC6 control, CCD power/thermal monitoring, DIMM
sideband access, floor- and SDPS-limit control, and command-enable
discovery. The same firmware extends three existing SET-only messages
(HSMP_SET_XGMI_LINK_WIDTH 0x0C, HSMP_SET_DF_PSTATE 0x0D,
HSMP_SET_PSTATE_MAX_MIN 0x22) with a read-back path selected by bit[31]
of args[0] (0 = set, 1 = get). Add the new IDs and convert the three
messages to HSMP_SET_GET.

Also add PQoS-related HSMP messages HSMP_PQOS_TRAFFIC_PRIORITY (0x3B)
and HSMP_PQOS_FLOATING_BW (0x3C) with matching hsmp_msg_desc_table[]
descriptors so userspace can reach the new functionality.

Backward compatibility is preserved on prior platforms: new IDs
previously occupied HSMP_RSVD slots, and existing userspace that leaves
bit[31] = 0 continues to take a pure SET path. Converting the three
SET messages to HSMP_SET_GET also keeps them accepted by
validate_message(), which already applies a relaxed upper-bound check
on response_sz for that type.

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 arch/x86/include/uapi/asm/amd_hsmp.h | 172 ++++++++++++++++++++++++---
 1 file changed, 158 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 92d8f256d096..eff35c3c6ce0 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -53,9 +53,21 @@ enum hsmp_message_ids {
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
+	HSMP_PQOS_TRAFFIC_PRIORITY,	/* 3Bh Get/Set traffic priority */
+	HSMP_PQOS_FLOATING_BW,		/* 3Ch Get/Set max floating bandwidth */
 	HSMP_MSG_ID_MAX,
 };
 
@@ -170,16 +182,27 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
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
@@ -305,16 +328,32 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
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
@@ -355,9 +394,31 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
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
@@ -385,6 +446,89 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
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
+	 * input: args[0] = set/get SDPS limit[31] (0 = set, 1 = get) +
+	 *                  SDPS limit[30:0]
+	 * output: args[0] = SDPS limit[30:0]
+	 */
+	{1, 1, HSMP_SET_GET},
+
+	/*
+	 * HSMP_PQOS_TRAFFIC_PRIORITY, num_args = 1, response_sz = 1
+	 * input: args[0] = op[31:30] + priority sel[27:26] +
+	 *                  priority val[21:20] + input[19:0]
+	 * output: args[0] = supported priorities or priority val[1:0]
+	 */
+	{1, 1, HSMP_SET_GET},
+
+	/*
+	 * HSMP_PQOS_FLOATING_BW, num_args = 1, response_sz = 2
+	 * input: args[0] = op[31] + sub-op[30:29] + params[28:0]
+	 * output: args[0] = discovery bits or floating/global memory BW (Gbps)
+	 * output: args[1] = reserved or config (drop adj, sampling delay,
+	 *                   hysteresis)
+	 */
+	{1, 2, HSMP_SET_GET},
 };
 
 /* Metrics table (supported only with proto version 6) */
-- 
2.34.1

