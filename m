Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013029.outbound.protection.outlook.com [40.93.196.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6063E2F0C79;
	Thu, 11 Jun 2026 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781155790; cv=fail; b=APyGx4y/+XHefg6oGcdQrbS6zh8nObwoBvwAivAnGVZFUpFXmD+e2dv97hY518exZPqnYSvDSmN+xEfOAndzT8iWB2nS4AUWUdM+4aJNEoAlvxjqCWjqBo4gSptqtWFEjGSlqF7EKs3EgNshIi7sWdYQRE3c4oPqChdaRJyhOX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781155790; c=relaxed/simple;
	bh=dLBC/eEUasjMWwT66lHp03J+Fn45udImbpD03hmTAKw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RwXrBTeABz4sXumDMjfmPK3wwZQH1zo3uHIKVusChDn8FUzBzeX0Ch3lwOY5uRl7fsNytpzOu6RiIclSpEKWHq5jw7UnSdyQpjMFHxDOCDfx76oNS90/ugOWBXkK3RBvmbJup7zV1HU4TbfEJ6vcu/Ad28bBXcV5uhF87O2FULc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lgbWLsoD; arc=fail smtp.client-ip=40.93.196.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lgbWLsoD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKSCGs/YV6eyEskmfA+5FDtXt5PuFkAnhrRPBqiPEA/OYR9YP8YaxNmRomXHgLQHvfYx44wghziRlXQLFmFGDOzzRdjJYUL4+8j8hlTOvgXBjNqf4eAqOujiVkDs9Y+9LYzl65r7KTp9CUPghya+Vuv1APrtj+vfbdldHfOpc3ceib3ysuFG+5PDsCqYI95D5pryRm53NK9kLn7ylMkEag90/pUfGqYhExfvvKfJ9YdYIS4KuiqImEnRKWs6kliHYaPwExnpjD72ktL54f0baH74W8zNi9qHvO+00iaZHZ8hmI6RvVUbenD8WLbGVHm6fS3WlulLBhYeDbcsnfh/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nb3zgh6eZnJZEhyq5t2SLCjbU+BC4CteFCIXevTb9+A=;
 b=NF/M2/+jWruTx0vX1p17KtQ7tcJBOrEZVtaFtDiFHQNATsEdRB+GJor9T7yi6cU/1CmnmJ5XTnyPVO4nRkWKgR9ET0D1zp50rNuVgcDcNAh9blxLRUAok7JYO90+jbPkQHqxKNxZ9wZDGDjRMB+ggwxR/qGcS1UC+px+ZgQuXQLLArr+F+n1GGt/FoRwOX2J2MQa//wDZyXLa3YIITE28JvMDYPtz+pzM8nuc+5dhCwSlWYBswFtjwCLi9nN1o4knPEsijJDlPGP/+Iq1X9NvHTzIE7Mymk6xiSv+XPX11fQdGJOR+utIeMop/XkkIDq3pFSpq0yJ7GKAqSE4Zeglg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb3zgh6eZnJZEhyq5t2SLCjbU+BC4CteFCIXevTb9+A=;
 b=lgbWLsoDdSerXRLORNMAaHf/PuyARYiH0JRZg26mQQACKYDd+o4IwR56X8VxmlgpewEU2yuk6oxf2LqlCxc6cYeul7yvQEl/ldjNJfyu53TV7C9TDCYqBcQn9VIQtDYFi3GIG1nCaPMCZ54QWXQeTU/rkw7JR19gPuhOBO9j9g0=
Received: from CH0PR13CA0031.namprd13.prod.outlook.com (2603:10b6:610:b2::6)
 by IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 05:29:41 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::72) by CH0PR13CA0031.outlook.office365.com
 (2603:10b6:610:b2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 05:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 05:29:40 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 00:29:38 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v5 1/8] platform/x86/amd/hsmp: Add HSMP messages for Family 1Ah, Model 50h-5Fh
Date: Thu, 11 Jun 2026 10:59:12 +0530
Message-ID: <20260611052919.1095549-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611052919.1095549-1-muralidhara.mk@amd.com>
References: <20260611052919.1095549-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|IA0PR12MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0cd80f-3278-43c8-761a-08dec77a6f87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|11063799006|56012099006|18002099003|6133799003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+5j1twMZwEsJ+kq2tpTZh/jfHUnDnM0uA0iAaHLzJ28ipdp2N2yXdbFuxD5sDarAj4+JB8vumjM7frwMB0k9X+nClnjrSMK0PfP5hl7vHS1rvuzu50AQFEvuqbHos7MOXj+64XkZUz5DCyggCXfX9nRD7+NOuFm8Yce6WHgLlxsgcFUegDA7p1QDxfeLJ4WKh36xMv220WkZxySfamY9V6EV4LMKGoxLxc3Gi2n33KJKeXh4xdUZW6T/FdmE1GhWZiGW1+WoRWfrIOX12tdYu45YK5N5ZRczDUE21nrmaXFOqmvB/p08GH5wsdi1rTX8e3OPiMoARPmygu9aHiKey68or4gOtQGmVKTFCzsmJxscXi9g17YbjU7LpW0ewZ1kBzbwdSt+JNVSixQm/+8yNB1qfTKfsbSdZcPHh3pKZQ2Y0h1m5Xfce6TF2mIgPexPAVf0YKW12DeeCR5+95yoY3Ik/jBqL1rNAGodqk0Fn2BgWhos8cv75abA8pOucwTYvJyrHY76EpHmKR4Nhu02/jP8uE0kfIW7ntezszFIHYhZ+TXQspDyz13zdoaDnn8Y/1oyxNU8pAHtJogl0Rz58Me4BAmd7M0PFYMEruKzt8qxNX+cEG/9r+aLJSrtehRogLdf9larqcW3X+SVw6ZnNlAI5C0F0j/vfZ9690VfCd9NP3zvNfy7Dea7fkOKXyoGYsH4XXB1R5Wcbp9mcyl72HsbxZNZVgepbZsiNQ0xxcs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003)(6133799003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	anHDI3w1J9wAWaNb5z6k1NcaBLV46KNmwoejK2ymEPV0HPUqwTbYpMQR23tx62OGApOak39VPTPolN1gacfgB/hbkaXVe/gQQScuXFKRp1SfTTltwR/gClrKoGPVeQ5jJ1NfDNdSZpvzCUIUGDlw/Gr35yegj9qXaMBD5LfcwNUV/SsSGUD9teK6lE/SvOEkCg1Cu4zXYaonovdBVw1KfmRXEYaAcnEiVHQvPTy6ZtRX3BMYwMyF/MgNSm4dx+Rp387AtEoNTU5sYSb9J1f81Z7oo9yHLf3IhwDGarqxMrjJ8n/NIIPxbrCQ20x2vKCz33CYSu3T+XhpaennwwEVFP1+h5aNfzQq1BnU6PElHRrCTBkVU0c6JdxyEbKNeNr0on/bW/rT7CTYHaegRi6AIW9gW9xzIhOoP+mB4ournK+A2ewZdNgjKPD5h9CVDNOu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 05:29:40.3946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0cd80f-3278-43c8-761a-08dec77a6f87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652

Family 1Ah Model 50h-5Fh firmware exposes new HSMP messages (0x29-0x2A,
0x33-0x3A) for PC6/CC6 control, CCD power/thermal monitoring, DIMM
sideband access, floor- and SDPS-limit control, and command-enable
discovery. The same firmware extends three existing SET-only messages
(HSMP_SET_XGMI_LINK_WIDTH 0x0C, HSMP_SET_DF_PSTATE 0x0D,
HSMP_SET_PSTATE_MAX_MIN 0x22) with a read-back path selected by bit[31]
of args[0] (0 = set, 1 = get). Add the new IDs, convert the three
messages to HSMP_SET_GET, and bump the driver version to 2.6.

Also add PQoS-related HSMP messages HSMP_PQOS_TRAFFIC_PRIORITY (0x3B)
and HSMP_PQOS_FLOATING_BW (0x3C) with matching hsmp_msg_desc_table[]
descriptors so userspace can reach the new functionality.

Backward compatibility is preserved on prior platforms: new IDs
previously occupied HSMP_RSVD slots, and existing userspace that leaves
bit[31] = 0 continues to take a pure SET path.

Reviewed-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 arch/x86/include/uapi/asm/amd_hsmp.h | 169 ++++++++++++++++++++++++---
 drivers/platform/x86/amd/hsmp/hsmp.h |   2 +-
 2 files changed, 156 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index 92d8f256d096..ff8b6defec1d 100644
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
@@ -385,6 +446,86 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
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
+	/*
+	 * HSMP_PQOS_TRAFFIC_PRIORITY, num_args = 1, response_sz = 1
+	 * input:  args[0] = Op[31:30] + Priority sel[27:26] + Priority val[21:20] + Input[19:0]
+	 * output: args[0] = Supported priorities or Priority val[1:0]
+	 */
+	{1, 1, HSMP_SET_GET},
+
+	/*
+	 * HSMP_PQOS_FLOATING_BW, num_args = 1, response_sz = 2
+	 * input:  args[0] = Op[31] + Sub-op[30:29] + params[28:0]
+	 * output: args[0] = Discovery bits or Floating/Global memory BW (Gbps)
+	 * output: args[1] = Reserved or config (drop adj, sampling delay, hysteresis)
+	 */
+	{1, 2, HSMP_SET_GET},
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

