Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B8B2DECD3;
	Sun, 17 May 2026 15:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030767; cv=fail; b=F8vGq93C8suZOlJcZX22NsXYPlK9RZYcmyZYU1WZ7fyLS7rOJJBa5nCgNUsFxA7UOUKJGBTBCz7FyC3ODs+lSY3yDzUV2kAZFu71yfHUu+SkwQBNHmlFe/4IqgGsvR1ICDUFRbgNJ1Kn0xVKwksIMOeocS1cN8cY2wlxOs//dRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030767; c=relaxed/simple;
	bh=Ga6mCKtPXANjkTNXGwr408UF3GVoauPzAJ779o7bPG0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DGjCIVn19weS3/cBqBw697KXRu7xhNFGYOlS2okPV7R6GWvgcBYyFtkDWyDO6haqiQCZJEwEcnrrr9X0czaRzAlXjQiQ2lhXxJAXu9XI0s2kXRHeufQTX9cuu0ZA13AISw5Uak4bGYlOi0NnmfPDHl93/DDmol9ehN13riVrtB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n/ob/Iiw; arc=fail smtp.client-ip=40.93.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n/ob/Iiw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbIDDg5kynvb7x37iKe8inwvGlhVpqKrB4332KAlSOu8ioswoaFR7ZSQ7K8TLnRVxbwJy9qFzuU1hoL3UEjOG9gcNy9f75mIX3sOOb3X1GIPqTI6EH3AiR/G0x+QaEEUMz2g/x0uDvCV1CkvsXLIShbEF0gSWR2dra22PwN3/e+He3NsKaRdapAt5xGgEZe/aRuYhnuZAcGDhU3nqZu7R3n/uQMeXUQUnXh2z4wllrvKBFmMgI5E5wXXGj27i8UMI+rvtstSz9rvr9oC5ZxYYrYEj8S82IDUfDXsMg/DammEyaBTttjTj9UqfFibFJrdT9CfjT2muJXf3+LH4Ml9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXo1B0jJb2XVJz/1NnZd7NeHXHRTAQuQQ+lUrPIv1Vk=;
 b=XAAQAnJkoaVLas7TsJwsy4wReX+dppxxBeCCIFaTfQ5cS1SUEMho2B3Te/2h4LTrhC/2yhr5VbJB8oIIu5wtOmdtToOaXNxIRYVpzjmknn5cJVeTBQ6aAhksDW8X6yGfdv3GHlepVdZ5ekSvQBebhl5O5V7croSnM4oGhSkLdvX2r4/QGaRqjksIhCFMu+fGOLm+IfwHwCMba5JRj9MAF/j75U1ibcej/V+R5B57CL6iL/r7Iiu1InBlazjaj+wsW+liPV7cETVNzLXMEvEZqSNlvhhqY+9TggFGC5aFBjPXn9SsLRPy6pAMp56TfgpYIt8XiequkjVfqa6byeCYNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXo1B0jJb2XVJz/1NnZd7NeHXHRTAQuQQ+lUrPIv1Vk=;
 b=n/ob/Iiw2sPon9Fc5OcXQ+2qO7rq32KIbbO8iZpLPshLd+9b5+vLxd2ga7uexsi/HVtS+dL/q+F7wrBUbzKVJWv6V4U5w9IvvABtuVStKJWPpypKXK6Zk/EswQIv+r/KtRsYI2iGowo73bmE2vJrYn6b6oiv+crD83vieCsgxAA=
Received: from MW4PR03CA0244.namprd03.prod.outlook.com (2603:10b6:303:b4::9)
 by IA0PR12MB9048.namprd12.prod.outlook.com (2603:10b6:208:408::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Sun, 17 May
 2026 15:12:40 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::83) by MW4PR03CA0244.outlook.office365.com
 (2603:10b6:303:b4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.21 via Frontend Transport; Sun, 17
 May 2026 15:12:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Sun, 17 May 2026 15:12:39 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 17 May
 2026 10:12:36 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Suma Hegde <suma.hegde@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v3 1/7] platform/x86/amd/hsmp: Add new HSMP messages for Family 1Ah, Model 50h-5Fh
Date: Sun, 17 May 2026 20:42:05 +0530
Message-ID: <20260517151211.415627-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260517151211.415627-1-muralidhara.mk@amd.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|IA0PR12MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: 7707fda2-4f7d-44e4-4b9b-08deb426bc72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|11063799003|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	Xtf0E1cs1RAGCLTaoGugdA+Q3rcVJat9b/GFvM96cldhT3Eqp1fLloo04AOUKeTVtR15vSTk+I1f8abfFsxl0q9yrghN0pEkmzprF/xcu6dH7DyzPU/3lmx0xl2NA8aWDHJybgmfZerMBNf9gjvWU1xhQ1+3LK5SGLfQlW53z7mNBcZFuEhfAVk3lD9S7lw7+wDQXkcSek5A+RA+zTVaHBSmBRZ80mj0bH2yX3k3X0ZZ2SqT38daBNnWgLYcCuypLU1/3EtijII969y5P9VJzGnd7umO/DqmgR2G7qb/oPoCBK7uM12S+aS5WLWzL5KGaFCI6d+acsSy/6kD68OyxvvC8yPidPTq0IxVOdqj1wBzDPsv7RRX5XgxUHdNf3AxAT3wXzz+AG6981ZN3EAg3TMviONXYnozcw9EmPJIahheiDedttmAIaSnjlM8wzX6o/9DXfrwDLSwI/9oEb/AZiLbCiHMxdRVW93KZdVjNNTu1z4iZN9rhrZ3ktT1ATwuQnApmFmDCSaUpCJMvcU4/vChVpNr+P3F8KiuCYlAJ3/L1nX04SpscF9mIkKn3KXoDobQGk1NZ6jv3QKns5ho1rmYB0FHbuPWwSrF8qxtqswQJK9eDyMJmnYmgIqjs3FGseOVWpFjGO8O9xAYJhuKaIeGe2QcQEeAXBHMEbZv0E5SUNeFsFytNcGG16Z+anc2u0EuMSY+8b0M0F7mdbMqnMjXccPKF0P6CPsoDVxVmqA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(11063799003)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZzydO8lrzfpzq7UbNaJBr0weRbAtUz3Vzn6Fe7UeLFK2DJToIJzbpeVJkKLtRM1Fiz+lrzACQm1XtyxUbOX+7aqY7ap1IRx5tgAgfDx/I1NM9wKsYsLteSZKyRC3SARuTXdzJfM//RSoNJvlGQnHU5azwkTRm5iMXyKMRFy0xWp1j29MgMVmzZdGjEhnZeS1iBLFQhF7IoJlfSwO3/CrztllDVLY8Cn3v7qdBkJ66WQdUMZ2xfN+P4aifLI+/OJZC/vFfbFa09wk3B6AooPG3O5qldSPd3hiv1IEseG5lgxMuuTNg6BqiLgcArZG2462sMYk4H4cfYTz11gncVQxveEvZvd5ZGAY3PGUjxgKMfEAi0eTPQVP3BqZKDnkUoKsRXd3U+KwIoHq9y7GCSbCQDhQXHRjyhbji3tPftEaKvvyV5yE3jAECE7n+2TJ/6bU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 15:12:39.5197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7707fda2-4f7d-44e4-4b9b-08deb426bc72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9048

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
Changes v1->v3: None

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

