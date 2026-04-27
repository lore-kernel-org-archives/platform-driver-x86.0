Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8398334888F;
	Mon, 27 Apr 2026 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305126; cv=fail; b=dFiBnqkP0HbXJcge1dJE1Gfd1pL8G0rD4SIiIZjNl6Fg+W6RR2WiXBnsoyTqMToZ5nKh6imZJd2YPnpwGCx9gAqFLmMM+/4btJVe/y2vinduLEcLidTfZ8cFDhzLsZhgRKu1ruPp1JJwkRqUtP4EOqVcmy0kXrrfS8qgMf1yZu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305126; c=relaxed/simple;
	bh=dY+GXhGoH+rg/bhLaVOpTPfL7dOBK7IV/fsmpQ0vkhQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jJfi47sZqmtfHnE4s1Sf5IRBYqmZCHuieNrZ4hMdVskHkvmfCLkjD7Xw+VFs5P7fZ1eeHrkavg8EdmgMifn3NVWymdvGmbOLGywFApAEbrZ0gJ1EBODHHar0gkC2BrJ5XPq504sOvynECx/wk8xPIvL7uRDjHhruH9QuGWV0wJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cckp0vwj; arc=fail smtp.client-ip=40.107.200.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cckp0vwj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCVjjj+T0x6zcN+l/WVfqmmbh3K5ffx8Imr76AduEp+9BvnPhcq6yVPoCcEGmg6P4L1MhGs15EOl0RwLcAZ4MVIU4LO1C/WOomRLqJhAeq3R/VxVculumqRAI+aFQrcYSxepl6Ze0DHob0Vi6sQpvSah8T/hHzE2kz+L1/QOARDDZbpiPf+vWlihVYB7+K7fFuV+yIKQavHBGyPqPUrd+mfrIp0CAUXExB5m4QM0KZr0Cd9fATo3vOqFsQz884e71TKCjLJcjY2ZWrV4nSzgaVUes+wfsVrF6z99eKaEdgxiBREUL975xact7NCPho4G3UT9zyQhBRnDb28gwX0q5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StUm7gdVyjLEScdX9FU0QJWUmtkTybtXzUQuMwJW6ow=;
 b=r2h7VW1wz47F2CKkpT8eNFk0ecFUUoO3XsyTFUuJJrPa1gA8iRI5Ix1dWiWN0CdUXMtm/IPoDPZyWBisUaPRKgF5JZY3KJePgXUrr+SCv9lAZiWmxQHrXCS+QkH/5F8MFA2S+0MpYhBe+lQla9JJpMfoCxE+eDNXjpd+T2Ms1zL6DBGOinbaSzgQ8OZ+ImPik7eNF0lAbeVmSV5XxO8ccZGogA0vg4f+L8nL0WZ4i5mm26vMCLddEbiUMQDK4s30moQTI7JHvLYOIf2+5JvztFsIMj07p0i/E96PNEK7VEqo/opWGouv1cAKwpgK0zdRMAhtdjw1TxgR5ujxN5JvOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StUm7gdVyjLEScdX9FU0QJWUmtkTybtXzUQuMwJW6ow=;
 b=cckp0vwjDBytwo0Ro22N9fv3qXSTSfxc4PTHLbK+vdku5jtSVwHvtsG/bpNdMCGpGZhhoL9J5Gmj3OOfIbbJ9OfT1cVMnn0g8FNe1wghYcQgXMnJ2p2K3QQkhu4xkXUDSPGZsPsAK5HcXHLrVaWImEilyL+vGBVfimrtNzv8KJY=
Received: from BN9PR03CA0165.namprd03.prod.outlook.com (2603:10b6:408:f4::20)
 by PH7PR12MB8596.namprd12.prod.outlook.com (2603:10b6:510:1b7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 15:51:56 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::71) by BN9PR03CA0165.outlook.office365.com
 (2603:10b6:408:f4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 15:51:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 15:51:55 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 10:51:52 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<driver-core@lists.linux.dev>, Suma Hegde <suma.hegde@amd.com>, "Muralidhara
 M K" <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v2 1/7] platform/x86/amd/hsmp: Add new HSMP messages for Family 1Ah, Model 50h-5Fh
Date: Mon, 27 Apr 2026 21:21:23 +0530
Message-ID: <20260427155129.545327-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427155129.545327-1-muralidhara.mk@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|PH7PR12MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: cf846921-a072-46ef-731b-08dea474e877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	S0fW6yOfIfuVsGPLQ457YB8wphjP8T6JhLu3PhbEfB3dvqYuj+1fjh9IvkNhIFI/pXLJxyg9gpP3pyCSv2IgF9YMvpYvnT5YhYwLBVFOtAzK3vy1Dy/zz6zbT28AosW7C3C0pXCR2QInF2Rnv8dRxTvb4dEBo0eqqDf8fdF8wvGD0UU4zXtHTOEjYu3yNKKFCIC7MoEZ+8B3O2VHbBd7LG/hKFfynVnkwLCcZdeyvV/v+jhS2znA7nV+/E/0eLuOw4YTF4ml5Mpv/VQO6lsofbO9ArlOR2pcSE4s7Z/PFvWO8bV6OARyOPUxU3alzDoC40uh10VYeSSCEL7YYHzSYuWqV6jMmc2XBEbPHiWfCqZaIZ5P2iBNf6YjwcOHV70rY8K/fhtWtx9Yv3wk+Bno9DemlNc4jL58NcDsaZ/EERYZWt/RsoVqX+RxdBQQMJRHpFYcCLCgoAYDle+DfC7KEMgjhZPySz+brNmRotmv9nNyKIqAaR7wFCVutULkL5v8vWJdRrp99bBvaxUuc/7TsoLL1gCPRuuk0yOd97096qZHbdabpTKqntEn0e16fepczInb+0S3H/fi2GOIAYr0Lg1DUg9mGFTC+D6AiXBi38v3bqS0oDkVDW+CG428tblTXA1TO0RkD0t1jsSePdh2eLwLsf8JEJTWbx7PvtO0awUvuXDcDmZMHTxT/6ndpEF/Pg4z1jAEhWwtX0N+rUnBrmA4GcXawlZGQQD6UK/6I96rVK66kJA+SmzYIPFR3Cw0rIbuGV8/LzamvgoihF2E0w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5FSz+HS9Y1u2F1Ii8cbdsrxY6JbYgGf+r9Fqf3CuGhrFEEIpYwTMKScnvPd8l+U6AzGXPffgcCS4a8FeurYdIGtG0JdzTS/1A4sitRFdBu0cVYoXMzi7C1AONhdgvxbbtnzS5mrjaUQgLkOgmxnl+TiZ1VU7d+Cq4iWlyk3jwKlqnr6YR/sRryYTrF31ZBvE/YjZoQdX/O2Qt23yF0YL7XfzSyT35+ROgYGsIKCxos2pZxMdu8/H+tYLZwpb+s1qeZWs5HpcTMR4bUyZAFPDhRufZr8zNcRMdJk+dbe7rcT4KgtfmU7fVDQMz9D9GKb8FVXZc/SBMSwzREoJIb+h99QTB1C94ckdyfJMhthcVENffvDVQK3sqov3A9IPtdlsyqd1154M8VNja2h2deQLCreDTYqgAUO9LxEVTDy1PHv74vqkggSXj2VUWkQdADGX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 15:51:55.6136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf846921-a072-46ef-731b-08dea474e877
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8596

From: Suma Hegde <suma.hegde@amd.com>

The new messages extend the HSMP interface to provide finer control over
power states and system monitoring capabilities.

Power state control:
- Get/Set PC6 and CC6 enable/disable control (0x29, 0x2A)

Power and thermal monitoring:
- Get CCD power consumption reading (0x34)
- Get Thermal delta (Tdelta) reading (0x35)
- Get SVI3 VR controller temperature (0x36)

DIMM sideband operations:
- Get/Set DIMM sideband data(0x33, 0x39)

Power management:
- Get/Set Floor limit control (0x38)
- Get/Set SDPS limit control (0x3A)

System capabilities:
- Get enabled HSMP commands (0x37)

Bump driver version to 2.6.

Reviewed-by: Muralidhara M K <muralidhara.mk@amd.com>
Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Suma Hegde <suma.hegde@amd.com>
---
Changes v1->v2: None

 arch/x86/include/uapi/asm/amd_hsmp.h | 142 +++++++++++++++++++++++----
 drivers/platform/x86/amd/hsmp/hsmp.h |   2 +-
 2 files changed, 126 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 92d8f256d096..603d62f8d4da 100644
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
+	HSMP_DIMM_SB_RD,                /* 33h Get data from a specified device on the DIMM */
+	HSMP_READ_CCD_POWER,		/* 34h Get the average power consumed by CCD */
+	HSMP_READ_TDELTA,		/* 35h Get thermal solution behaviour */
+	HSMP_GET_SVI3_VR_CTRL_TEMP,	/* 36h Get temperature of SVI3 VR controller rails */
+	HSMP_GET_ENABLED_HSMP_CMDS,	/* 37h Get/Set supported HSMP commands */
+	HSMP_SET_GET_FLOOR_LIMIT,       /* 38h Get/Set supported Floor limit commands */
+	HSMP_DIMM_SB_WR,                /* 39h Set data to a specified device on the DIMM */
+	HSMP_SDPS_LIMIT,                /* 3Ah Get/Set SDPS limit */
 	HSMP_MSG_ID_MAX,
 };
 
@@ -170,16 +180,18 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	{0, 1, HSMP_GET},
 
 	/*
-	 * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0
-	 * input: args[0] = min link width[15:8] + max link width[7:0]
+	 * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0/1
+	 * input: args[0] = set/get XGMI Link width[31] + min link width[15:8] + max link width[7:0]
+	 * output: args[0] = current min link width[15:8] + current max link width[7:0]
 	 */
-	{1, 0, HSMP_SET},
+	{1, 1, HSMP_SET_GET},
 
 	/*
-	 * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0
-	 * input: args[0] = df pstate[7:0]
+	 * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0/1
+	 * input: args[0] = set/get df pstate[31] + df pstate[7:0]
+	 * output: args[0] = APB enabled/disabled[8] + current df pstate[7:0]
 	 */
-	{1, 0, HSMP_SET},
+	{1, 1, HSMP_SET_GET},
 
 	/* HSMP_SET_AUTO_DF_PSTATE, num_args = 0, response_sz = 0 */
 	{0, 0, HSMP_SET},
@@ -305,16 +317,18 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	{1, 1, HSMP_SET},
 
 	/*
-	 * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0
-	 * input: args[0] = power efficiency mode[2:0]
+	 * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0/1
+	 * input: args[0] = set/get power mode[31] + power efficiency mode[2:0]
+	 * output: args[0] = current power efficiency mode[2:0]
 	 */
 	{1, 1, HSMP_SET_GET},
 
 	/*
-	 * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0
-	 * input: args[0] = min df pstate[15:8] + max df pstate[7:0]
+	 * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0/1
+	 * input: args[0] = set/get DF P-state range[31] + min df pstate[15:8] + max df pstate[7:0]
+	 * output: args[0] = min df pstate[15:8] + max df pstate[7:0]
 	 */
-	{1, 0, HSMP_SET},
+	{1, 1, HSMP_SET_GET},
 
 	/*
 	 * HSMP_GET_METRIC_TABLE_VER, num_args = 0, response_sz = 1
@@ -335,10 +349,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	{0, 2, HSMP_GET},
 
 	/*
-	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
-	 * input: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
+	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0/1
+	 * input: args[0] = set/get XGMI pstate range[31] + min xGMI p-state[15:8] +
+	 *                  max xGMI p-state[7:0]
+	 * output: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
 	 */
-	{1, 0, HSMP_SET},
+	{1, 1, HSMP_SET_GET},
 
 	/*
 	 * HSMP_CPU_RAIL_ISO_FREQ_POLICY, num_args = 1, response_sz = 1
@@ -355,9 +371,21 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	 */
 	{1, 1, HSMP_SET_GET},
 
-	/* RESERVED(0x29-0x2f) */
-	{0, 0, HSMP_RSVD},
-	{0, 0, HSMP_RSVD},
+	/*
+	 * HSMP_PC6_ENABLE, num_args = 1, response_sz = 0/1
+	 * input: args[0] = set/get PC6 control[31] + disable/enable PC6[0]
+	 * output: args[0] = current PC6 control status[0]
+	 */
+	{1, 1, HSMP_SET_GET},
+
+	/*
+	 * HSMP_CC6_ENABLE, num_args = 1, response_sz = 0/1
+	 * input: args[0] = set/get CC6 control[31] + disable/enable CC6[0]
+	 * output: args[0] = current CC6 control status[0]
+	 */
+	{1, 1, HSMP_SET_GET},
+
+	/* RESERVED(0x2B-0x2F) */
 	{0, 0, HSMP_RSVD},
 	{0, 0, HSMP_RSVD},
 	{0, 0, HSMP_RSVD},
@@ -385,6 +413,86 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
 	 */
 	{0, 2, HSMP_GET},
 
+	/*
+	 * HSMP_DIMM_SB_RD, num_args = 1, response_sz = 1
+	 * input: args[0] =
+	 *	Register space[23]
+	 *	Register offset in given reg space[22:12]
+	 *	LID of device[11:8]
+	 *	DIMM address[7:0]
+	 * output: args[0] = [3:0] Read data byte
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
+	 * input: None
+	 * output: args[0] = thermal behaviour[31:0]
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_SVI3_VR_CTRL_TEMP, num_args = 1, response_sz = 1
+	 * input: args[0] = SVI3 rail index[3:1] + Read SVI3 temperature data[0]
+	 * output: args[0] = SVI3 rail index[30:28] + SVI3 rail temperature(degree C)[27:0]
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
+	 * input: args[0] =
+	 *	Set or Get[31:30]
+	 *		Set the Floor frequency per core = 00
+	 *		Set the Floor frequency for all cores = 01
+	 *		Get the Floor frequency of a core = 10
+	 *		Get the Effective Floor frequency per core = 11
+	 *	Reserved[29:28]
+	 *	Apic id / Reserved[27:16]
+	 *		args[27:16] is reserved if args[31:30] = 01
+	 *	Floor frequency limit / Reserved[15:0]
+	 *		if args[31] = 0, Floor frequency limit, else reserved
+	 *
+	 * output: args[0] =
+	 *	Effective Floor frequency limit(MHz) / None / Floor frequency limit[15:0]
+	 *		Effective Floor frequency if input args[31:30] = 11
+	 *		None if input args[31] = 0
+	 *		Floor frequency limit (MHz)[15:0] if args[31:30] = 10
+	 */
+	{1, 1, HSMP_SET_GET},
+
+	/*
+	 * HSMP_DIMM_SB_WR, num_args = 1, response_sz = 0
+	 * input: args[0] =
+	 *	Write Data[31:24]
+	 *	Register space[23]
+	 *	Register offset in given reg space[22:12]
+	 *	LID of device[11:8]
+	 *	DIMM address[7:0]
+	 * output: None
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

