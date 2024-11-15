Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2078.outbound.protection.outlook.com [40.107.212.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431DF2AE77
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 Nov 2024 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731672084; cv=fail; b=dcD3vln57ohx1rcweb5NeK+fsB3HfNaRTUnQTZ7reL0v0e+4F7pL/uXfMB+mld6dFSRnEsdzt7U6efK9U24pOH3FXaocYTGxnyzYH1gFwpgiODo4kF45Vd/aYlsx7Ez1cGIqPB35QKM0CMeDwBGpmyfX4Qi3dZdp+9ZcmXP1+LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731672084; c=relaxed/simple;
	bh=umaLWjULZAfRvU5/mjTi+W7MJvccaC/ghPBGX3QCJlQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XyJzz4V/N7Ko3EkR+p8LXAXKNrXI/p74Gl5DThGkhMGrPrzrUVLhIb0uXNDmybkirYwVG5uGCTxUkfzbCuSaRdyr2egJZdFNU2cxA5yFXxYZdzcx74OohRGzXMmhrKrKH1bFxxJin4oCeAogZLOjOnEQeFq0dAPKmCWaqRj90IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eQES93zH; arc=fail smtp.client-ip=40.107.212.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eQES93zH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIwidG581EPF0aO9v/HhyL1Lc7MMyhRumJp6QXVHaBRpNJCZ7N0MlMl+3x52irD+U8QLjIaNAUg2Rl3tLXckjaCPSXKGSkXf530nRPAw4ukHbzc7gLZaDJ8GXc3BKL8C4xXMxvbBfLDfJpQDtYE/c/7wF9RuGBkol1/n6UklBCtUThu253QolOa1QIQqLcFv4OtuqPVXgMWL+qYvlQMMlBXUz1HMzgB9WgXGnpulQ44IDmIbqNQMTJ44uaqG52AVvJ1X9eGzHbav9QBeSvjUOX0d6ArxaUWc89daBWVTHLlJLLZtg9e2fbTfb4HPeNIZdR7R46zF4RbJqYNRg3zXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HwnPSI2u+LISogFC5HDo/zISbIKq3IUecEpju9ZwXk=;
 b=vS+TpFzr8o+gkeHgC2w0Ba3PSRY8LnN9kw0mG9gBcN9MpfedhcU0PF1wsmMHNLx0MIrAeB2fa3LKEimz6yHfgeaMJyIlVPsptGv4TM5xUQW7HRuoRmHULop0BqgVaAtvW7v0XzzcS5vwGbzKCkbDpHGuK1IgC4jXHj7uB7kv0aEv3jueGdjB/uyH7nCc5b0dp7Y6vSup121Xgo4Tj3pXUbAGR/L0m9e0+yk0twSGCnCQmAORC+q3kncPC6MHJTKrlBOrwUdo0l+CFUoedpU+44Qt524I8nZZQiwLBz64MLSSpVXlWF1D9Jxp5N0L7nnO5V18Og/AcgLoahRmdkhsfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HwnPSI2u+LISogFC5HDo/zISbIKq3IUecEpju9ZwXk=;
 b=eQES93zHu8rXuPsYkzMPUGofUkVmf1R8POZHaCiTgAJlYE4TJ1wdELq03fgBpTDjPPODysF2hlMKVLJXn3SeawIRNo2rWrrcPX0veTH4KdJJYTC9OknI31yPPAN542tV8mqd6wdumv31ntLWaRCbLf95ygoFogALbOccbrLEeA4=
Received: from BN0PR04CA0024.namprd04.prod.outlook.com (2603:10b6:408:ee::29)
 by IA1PR12MB6482.namprd12.prod.outlook.com (2603:10b6:208:3a9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 12:01:15 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:408:ee:cafe::65) by BN0PR04CA0024.outlook.office365.com
 (2603:10b6:408:ee::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18 via Frontend
 Transport; Fri, 15 Nov 2024 12:01:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Fri, 15 Nov 2024 12:01:14 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Nov
 2024 06:01:12 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2] platform/x86/amd/hsmp: Add support for HSMP protocol version 7 messages
Date: Fri, 15 Nov 2024 12:00:54 +0000
Message-ID: <20241115120054.463325-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|IA1PR12MB6482:EE_
X-MS-Office365-Filtering-Correlation-Id: 7846e818-d0c8-421d-1ce9-08dd056d34b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P9QbzJRxjD3WuYjneWlkVRhu3yBstiBaoSc21kmbmwDecisOxu9GL3kor/MG?=
 =?us-ascii?Q?VzkuYLyXe9lzz2J4krxEQvK2+RTscn6BKy9gbkduzIPtFHtHrYxJuNQa4wUN?=
 =?us-ascii?Q?9ROk8qDufJz4miMQkVwOFmaBiUk0d+0Z1GH1GVYbgkxzwvlibt81MOze1SUH?=
 =?us-ascii?Q?bFrfsetB7P9llfKDdaHXG1VzcrJHQkDrTdjn/S2YTTK1PugIvP/OGvV/HvTQ?=
 =?us-ascii?Q?AeJLaZ1zkg+rPdkdgGF7ZFugLmP7CVDZkzWmU7KdriDa89uV+fKTN3vzy0UC?=
 =?us-ascii?Q?ajhOQ1nDCUUvsqURn+/EWQDC2oHl4qIXt8neV6OUrV+KNpBmdrrdnNNbFF2d?=
 =?us-ascii?Q?/tXJRfAP/G5NcB4qo+Cjk4N9SyR5Odcnfz6TazFncsdC9uSOUdICbpQgbiHO?=
 =?us-ascii?Q?hO5ilUdyTCQNXV2PqkKhw7WQIwDLXaL/8C0ZE2zmvS5Fw+/RDQ3aI1yOFBdJ?=
 =?us-ascii?Q?HeH+3Ykh0Gq1SS9NxKArjQtUU1vFSAPYjWkUkD1iFrOSuXkCrcTBnCxQK8ih?=
 =?us-ascii?Q?cJpGJkEyd9iWUnwjOdLbVK5nWI9Rtvt2bg+m6rEoaIbcazX9ZyDez92b/qRq?=
 =?us-ascii?Q?6AeBGci7W0SZ9vSqAkh5q02InN+Y7YP/ruYsWNHURSPNH0G8+9vwOt1fSrRP?=
 =?us-ascii?Q?he5IqkhP8iiBqA9gpVVK113ttvUzEqanT1DjCnl69LOo6c5RSC1yCowBKnOu?=
 =?us-ascii?Q?hBns91mFidRVEKncbHTGridDmHKqtRF1zz0LQkmJ/X1vfclCwAbjTPTT8zcW?=
 =?us-ascii?Q?+tqDeaiUpXRLAINsRGqyrSuxBBQfpBIMDLBKmpdJb1rSSwC38HQvWy/OOQxY?=
 =?us-ascii?Q?pNn7SCfa8g1BiYcx3wp8GGZo6ZISAoRnpTkl+Ii/yNiKFW53ZQTiK2LYOJk9?=
 =?us-ascii?Q?Oobq5r4zGtUthMejjO5daeOB7kX5HzlU/RcbbW2p+MkhDWY0e9vo6pXzWO+f?=
 =?us-ascii?Q?YC1El4esbkD3SK0hhGzAfsBu0fxzPKm6gFHTQTliOzv2++sxSho7nPk2TyzT?=
 =?us-ascii?Q?rT47vMxhL0OTlXUI5cK780Wghppw9p6lp2ryNe1S+ZFKMDKxKbj1bvn2olqL?=
 =?us-ascii?Q?g/sT+4pB9Do5Qb0Un9iZ5ZjwHUfvxMABGef1TIY9QLWqEyUkdONqI98bazjj?=
 =?us-ascii?Q?YJtQ26fpiDYa7z050VL/shhe8gLiAatUC+3qxrILc38JP9mX2rNYDCCZl/TY?=
 =?us-ascii?Q?Z9U76iN7rDrA9TgugkM3M69L/YfBwLT/VadLGbWrG9KUilq7vtHpIOJ5PcI0?=
 =?us-ascii?Q?TEXB5tpeVMz4YxyfvwfqYefFn7wEN8zIpsiyTT9R9sFqX/2ATtXO/VNZR6n1?=
 =?us-ascii?Q?NsdCs1zI2Lj5ejWMwWZuLTZ6zA9zyfPb3/6H3RopQsoyWj0FDMtf6jkawxWZ?=
 =?us-ascii?Q?Ys2l11XddQaYjzJBMNJp5Wjljx3WMVF2cLXa9P2QhCmpufjsaQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 12:01:14.9450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7846e818-d0c8-421d-1ce9-08dd056d34b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6482

Following new HSMP messages are available on family 0x1A, model 0x00-0x1F
platforms with protocol version 7. Add support for them in the driver.
- SetXgmiPstateRange(26h)
- CpuRailIsoFreqPolicy(27h)
- DfcEnable(28h)
- GetRaplUnit(30h)
- GetRaplCoreCounter(31h)
- GetRaplPackageCounter(32h)

Also update HSMP message PwrEfficiencyModeSelection-21h. This message is
updated to include GET option in recent firmware.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
This patch is rebased on "review-ilpo" branch.

Changes since v1:
1. Common check is moved out of if else ladder in validate_message().
2. Code comments are modified in validate_message().

 arch/x86/include/uapi/asm/amd_hsmp.h | 64 +++++++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.c | 46 +++++++++++++++++---
 2 files changed, 102 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
index e5d182c7373c..c83a5a7103b5 100644
--- a/arch/x86/include/uapi/asm/amd_hsmp.h
+++ b/arch/x86/include/uapi/asm/amd_hsmp.h
@@ -50,6 +50,12 @@ enum hsmp_message_ids {
 	HSMP_GET_METRIC_TABLE_VER,	/* 23h Get metrics table version */
 	HSMP_GET_METRIC_TABLE,		/* 24h Get metrics table */
 	HSMP_GET_METRIC_TABLE_DRAM_ADDR,/* 25h Get metrics table dram address */
+	HSMP_SET_XGMI_PSTATE_RANGE,	/* 26h Set xGMI P-state range */
+	HSMP_CPU_RAIL_ISO_FREQ_POLICY,	/* 27h Get/Set Cpu Iso frequency policy */
+	HSMP_DFC_ENABLE_CTRL,		/* 28h Enable/Disable DF C-state */
+	HSMP_GET_RAPL_UNITS = 0x30,	/* 30h Get scaling factor for energy */
+	HSMP_GET_RAPL_CORE_COUNTER,	/* 31h Get core energy counter value */
+	HSMP_GET_RAPL_PACKAGE_COUNTER,	/* 32h Get package energy counter value */
 	HSMP_MSG_ID_MAX,
 };
 
@@ -65,6 +71,7 @@ enum hsmp_msg_type {
 	HSMP_RSVD = -1,
 	HSMP_SET  = 0,
 	HSMP_GET  = 1,
+	HSMP_SET_GET	= 2,
 };
 
 enum hsmp_proto_versions {
@@ -72,7 +79,8 @@ enum hsmp_proto_versions {
 	HSMP_PROTO_VER3,
 	HSMP_PROTO_VER4,
 	HSMP_PROTO_VER5,
-	HSMP_PROTO_VER6
+	HSMP_PROTO_VER6,
+	HSMP_PROTO_VER7
 };
 
 struct hsmp_msg_desc {
@@ -299,7 +307,7 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
 	 * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0
 	 * input: args[0] = power efficiency mode[2:0]
 	 */
-	{1, 0, HSMP_SET},
+	{1, 1, HSMP_SET_GET},
 
 	/*
 	 * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0
@@ -324,6 +332,58 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
 	 * output: args[1] = upper 32 bits of the address
 	 */
 	{0, 2, HSMP_GET},
+
+	/*
+	 * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
+	 * input: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
+	 */
+	{1, 0, HSMP_SET},
+
+	/*
+	 * HSMP_CPU_RAIL_ISO_FREQ_POLICY, num_args = 1, response_sz = 1
+	 * input: args[0] = set/get policy[31] +
+	 * disable/enable independent control[0]
+	 * output: args[0] = current policy[0]
+	 */
+	{1, 1, HSMP_SET_GET},
+
+	/*
+	 * HSMP_DFC_ENABLE_CTRL, num_args = 1, response_sz = 1
+	 * input: args[0] = set/get policy[31] + enable/disable DFC[0]
+	 * output: args[0] = current policy[0]
+	 */
+	{1, 1, HSMP_SET_GET},
+
+	/* RESERVED(0x29-0x2f) */
+	{0, 0, HSMP_RSVD},
+	{0, 0, HSMP_RSVD},
+	{0, 0, HSMP_RSVD},
+	{0, 0, HSMP_RSVD},
+	{0, 0, HSMP_RSVD},
+	{0, 0, HSMP_RSVD},
+	{0, 0, HSMP_RSVD},
+
+	/*
+	 * HSMP_GET_RAPL_UNITS, response_sz = 1
+	 * output: args[0] = tu value[19:16] + esu value[12:8]
+	 */
+	{0, 1, HSMP_GET},
+
+	/*
+	 * HSMP_GET_RAPL_CORE_COUNTER, num_args = 1, response_sz = 1
+	 * input: args[0] = apic id[15:0]
+	 * output: args[0] = lower 32 bits of energy
+	 * output: args[1] = upper 32 bits of energy
+	 */
+	{1, 2, HSMP_GET},
+
+	/*
+	 * HSMP_GET_RAPL_PACKAGE_COUNTER, num_args = 0, response_sz = 1
+	 * output: args[0] = lower 32 bits of energy
+	 * output: args[1] = upper 32 bits of energy
+	 */
+	{0, 2, HSMP_GET},
+
 };
 
 /* Metrics table (supported only with proto version 6) */
diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index f29dd93fbf0b..f28b881db8e8 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -33,7 +33,7 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-#define DRIVER_VERSION		"2.3"
+#define DRIVER_VERSION		"2.4"
 
 static struct hsmp_plat_device hsmp_pdev;
 
@@ -167,11 +167,28 @@ static int validate_message(struct hsmp_message *msg)
 	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
 		return -ENOMSG;
 
-	/* num_args and response_sz against the HSMP spec */
-	if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args ||
-	    msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
+	/*
+	 * num_args passed by user should match the num_args specified in
+	 * message description table.
+	 */
+	if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args)
 		return -EINVAL;
 
+	/*
+	 * Some older HSMP SET messages are updated to add GET in the same message.
+	 * In these messages, GET returns the current value and SET also returns
+	 * the successfully set value. To support this GET and SET in same message
+	 * while maintaining backward compatibility for the HSMP users,
+	 * hsmp_msg_desc_table[] indicates only maximum allowed response_sz.
+	 */
+	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET) {
+		if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
+			return -EINVAL;
+	} else {
+		/* only HSMP_SET or HSMP_GET messages go through this strict check */
+		if (msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
+			return -EINVAL;
+	}
 	return 0;
 }
 
@@ -239,6 +256,23 @@ int hsmp_test(u16 sock_ind, u32 value)
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_test, AMD_HSMP);
 
+static bool is_get_msg(struct hsmp_message *msg)
+{
+	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_GET)
+		return true;
+
+	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET) {
+		/*
+		 * When same message numbers are used for both GET and SET operation,
+		 * bit:31 indicates whether its SET or GET operation.
+		 */
+		if (msg->args[0] & BIT(31))
+			return true;
+	}
+
+	return false;
+}
+
 long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 {
 	int __user *arguser = (int  __user *)arg;
@@ -261,7 +295,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		 * Device is opened in O_WRONLY mode
 		 * Execute only set/configure commands
 		 */
-		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_SET)
+		if (is_get_msg(&msg))
 			return -EPERM;
 		break;
 	case FMODE_READ:
@@ -269,7 +303,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		 * Device is opened in O_RDONLY mode
 		 * Execute only get/monitor commands
 		 */
-		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_GET)
+		if (!is_get_msg(&msg))
 			return -EPERM;
 		break;
 	case FMODE_READ | FMODE_WRITE:
-- 
2.25.1

