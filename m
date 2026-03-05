Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013007.outbound.protection.outlook.com [40.93.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399322C11E2;
	Thu,  5 Mar 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707878; cv=fail; b=IQVuBENndfPhqp80qtL62F5vZk2tSCU42ezcx42JNByyMKI6ABZLMuO1UinnwZwweDdho9hheDi48rMfZbBMw5gIcwU/CbWYHoseqNkkmxnERqoZofJsT3SnddSbq6HilcXaHRd70Vl3ZEj4RGWDhzVLiwHmO5JgbbWc2g2CrdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707878; c=relaxed/simple;
	bh=A3p6Lbe5AHN/gKgooYNmXauoYPH/WcrYjNEHfetzLZc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U2+gW7PYsxZkokXXnQrxtg3G5zMuhhG2HYFDD80QWaO8KjEHeIALkkHRnrb80k9lApps+u3Fm/xlMug39fY0e54qMGtLoEhha7PMweEADVGD4pxAAf9sLMCOOEp4Wf/RuNg5LP2P5SPreURLHat4vHS81uLoaxXrNYZAmZ0sEP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4mo4kiKP; arc=fail smtp.client-ip=40.93.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4mo4kiKP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTa25HD1CVBHF/oAhmuPt6GE9ez/cr2frSibtnlByB3QCj2oO1a1xLWiUxW0lhh2LUx4P2xPkvptCJQD7LvHlNbqCePOAtdSG56uC8XPzO2OBVIOnv+nQaQYfIzo0VWbVJix9xHW4UCNapGENXHJoeUmip6Pdyo4VnyKhLg28s3W/qyvtsDN+VgiES+dAxG/Ny+P8Ssw8Xa1Cqi59dmDqHdYl8RB6BNGU83YjBbIl8GBOPdbV2T37hb5BtXV6AKHNom0r9dMgSDnDMAgc0SOL8dQMycJPnV8lH9TtxBSg/au7DQ+Lg7aPd8oH80e9Wos1j3dnPTcA8rD4ltzo4fj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJMjUYFgYCKAFEuMa5IeBuTHN0eSnze9vf0OkenN+Vo=;
 b=EaNHF1QYeg/C612MCSmqDXx9Q4rwS3DccW7HPd5PyYaWRTHrAKs2HPU/9pQyAqhz9/BgJbEmschvCK4HGILgvv9C/S0/qG5mCjrrA6ToqjhepFNQs/YyS9Q7ddL0M0xAhErLin4o4gk4SUjpwwrePpcWw7SIGRpPIS2kMu2H6Jbn4W0gfhDgagNy0fjOHSv3UZEiQIz4PaZQTWTnLBUruh+zoochGw5+Q59sMsGg+waR3+DxCGn1/06izChZNn/DzX9UznZ9q8DPyqWQStEFfIUx3juSeVvgLcLcrvANAZ6WOEQz39W90fJyCu9XuXRvpDs7RExsuJuxEFjetOLdoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJMjUYFgYCKAFEuMa5IeBuTHN0eSnze9vf0OkenN+Vo=;
 b=4mo4kiKPlnh9bX+0CXgtzelEf/VsxpnAOBoI7UBuYpBIlWW8IAzrNykphZL9RSHsvB1m42GftAoyAck4zwaNC30nrrJ/aUka+5G4llgG6g4O+zq4GNz09I+56DmqQRFv03zIqAGnsU3YaZbddA5jej5Grx3ooP+KPFjj2cmtlz4=
Received: from SJ0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:a03:33a::9)
 by SJ5PPF816B88375.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 10:51:12 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::4b) by SJ0PR03CA0004.outlook.office365.com
 (2603:10b6:a03:33a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Thu,
 5 Mar 2026 10:51:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 10:51:12 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 04:51:10 -0600
From: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hansg@kernel.org>,
	<platform-driver-x86@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Suma Hegde <suma.hegde@amd.com>,
	"Muthusamy Ramalingam" <muthusamy.ramalingam@amd.com>
Subject: [PATCH 1/2] platform/x86/amd/hsmp: Add new HSMP messages for Family 1Ah, Model 50h-5Fh
Date: Thu, 5 Mar 2026 16:20:49 +0530
Message-ID: <20260305105050.2940904-2-muthusamy.ramalingam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305105050.2940904-1-muthusamy.ramalingam@amd.com>
References: <20260305105050.2940904-1-muthusamy.ramalingam@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|SJ5PPF816B88375:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ada70ba-5465-4ba5-42a6-08de7aa51e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016;
X-Microsoft-Antispam-Message-Info:
	b0Z2vrZ2qnsBxxbons/rGX4SnDO8hCLZqJz5F259uam4kuaiyLMf+X6uuEiMfXtAB16GqrjgF4+LMxs1IN5aA9kocPEbBOZcbyKw+w3enEYqBIvRwCEwNjHaQ9+1SKL7klG0oOsaWU2MXTOKgbPaD3Db6AxiUsr94b2lZ8awbeGwA/JEhgVd4YKS8k7SY8R0drVTVTNmtDExAh4Hh6Nx0vGYGZzVFAGjjpwhk4Dncgz2qWUFhObnQpYFCCp4kYpBydOj5miOMPHS/D2kwTg+WLHMgUB251wrefNJkJBzjETCxOLqlYwXEPm5CoO7P2popl/CrzVRql9yzB1omPfdsTdmW6g4ikLk6T4WikWX5NbfjOE+mckCYS5GiMDpPkQtem1SWaCN5wesImepGR/PVBQiXGlCDulMVRIVsDMiiOgmry1kwDTcMQnTzJkEazQTwYbEDzX83tPCwMJqFDBLhb96iAz1HHzPyxcgDHpEzQtO2U2BqCRCfMBqxJVsEyNeBPtBTA1W6xUaMfGpLTcROEo41hI5FVoJBAAeXI9u8CRltZKN858D89q4CO2G0+l+eaM3XuT3uuMqtl4C2T38ks4uru0qvvnR/tPiITvrVS2JvrxUBnMd6R0goyzquHpE/Fkex6qhGEYihv1NRIcGligpVqb1hVXPw+ZNdY5QqIH0BATafk0qAeO7t3vL+pJar73wd+vi5xSflzW54eBqMduhYlQbnhTInfONrVoMarv2cXz5PcGgKb0MWLhetnLXAe+0Hw5HpNK1D7TSN8c4oQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0ib4FS7ua14MC14gTh5zWi8Aocq0HQz4E06xzg6v2sG0RDUEme+/et1b3qnSFuH1gf0eyVD7NN1VQClgEqX151/7K5EFmHr0vUOLP45hzlLgjXBG+x4F6hSclSE/WbCYduOzf33CjY/2Sg9Vv9krkAjrriOfnEW5PLuFlg+bg1hzxboCFJFkCGEoa0lNw2Tl80tvBC+AlhGf9iT7QKFgQtRnj90Shn6WAIF8ztVOok3Xv05nies+7FTXO2YjuwQpAtk/PpgTonlymyXMow+5Uy+7ZDhX810R3gxGcazIbgqV5ptL/38/FYJKhQExBTjPpYil7LHF1kA+UibnCr/3NIt0TYUMZ41V75NGxlUPTXocqofJkKbCVQiJt+waeuQIk7zEXEQvBxxQ3OLlYS9wk93/lOvfO/bB/zP5N1kWze1y/E2MyY3IM4qj2on113it
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:51:12.6858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ada70ba-5465-4ba5-42a6-08de7aa51e2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF816B88375

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

Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Suma Hegde <suma.hegde@amd.com>
---
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

