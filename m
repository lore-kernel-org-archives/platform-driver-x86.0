Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD95C17C
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 04:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731473238; cv=fail; b=pbV+vrgsxT8lo4aTvcqiuEQQpU6XWDU39UQAGSoAOzHFSquc3yN3z6onK0X5lKYvBGCLDPfP4hfRiKSXhKo2kB8ir+fbTOAH7ZuVV6iZgfmqdB/9s50TCblKQvgQ62fe+Omaz7ZtmwdGrnt1IuTNLlMgQ9J5F/P3CC7iDH5hY7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731473238; c=relaxed/simple;
	bh=LNTNemVU7CrN7SLD0l27wKhC/9yKCqhSj0NZ67UTCaQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qjayowXu0mAg+iFH8iVsLJqtBGo42ybqv08j7m+tJZpHSlqfk0xTWfulvyPbaK8VCJjmMoyGkm4DwQ8y3CaXXArfr3O2VhZfm5Ouq1UprbRGwt2IxaDAD53Z6bTaOPvkzKYYYjVVbhx6e1XbMq/yZBCGOghJmq61ESjvzPN+Nco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ls8NYua4; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ls8NYua4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uneZRe8SZAq/U96Du+q7j933OC4/bqu8ncYe7HYVdO35Xwp3psVVByzbTTuvubTc8iPpYIxH7OFN7+1H5ljmvvpeSNu72NP9Ge81k3g2o7eh3EI8pqoxw7En0D4IhNAypWr1a+P/uowdxcu8WW2RUzorF2OA1OftrCueTfZ7jRhzNZcndQ3s2NFSidL9M0ZcuKqd7YeCAH5xfWOF0no9rnSrtASNOlub1ZtnQTBQRqYE1+pjJLXQ9++0URsNQ/XDmOOzTxUib/WFTWuDIOc5RdoDDyzWau5s4xAyn2mUuZrEjgONYVHNJ7utHRELj2BPrNnM44QG2ENf45IItEqdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6ZjhTHtQI101eRwCHVFFjAtZIcFjtC1xVj8QgJQklM=;
 b=l/fPXLhAh3E726hrfp80ZOp/ns1Bv73snPaO9qKx4gFl/fTAsXRfA/qyDIjc/a4rcbWkiNpYNAkpcaNNr3THpGIlqIDNkGxJDe+KdFavgePdC3AmX+XQa9hZ8f2FRKkcS8ZH04w5eumVTce1ue6U4I2++nqTT4cnq/3Iiyp7sC9DplzPj6oil9p4XoB17p+bolOjt7RLd+qIh+mvLURaPT6ggAX+jewZVBQefHQAZlxw7Vy78KD9Hj9PWLZ2C6Va6kKnzldPawjO4Iwl2Y6wuiJDkeKn/QQ3Gs6z7caRe7NW9aEY4dNiaRZVpMluAO03CJgyDyg4Bawtnazl4naWKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6ZjhTHtQI101eRwCHVFFjAtZIcFjtC1xVj8QgJQklM=;
 b=ls8NYua4PtLMPxjW1D3oYxVdB9CeRGzaFSBEQbF8uDLYPs1XtdWL+KX9CpVdk4QeIAVAUruTctMmn7gcyK3+UB28WQAdYUMDwZbeXEEe38PexipJ0/ADGuItyVRGByEzE3zJqhK0MwFT1qxzk9B0wo3SawG1dzaEL6GNKd2j3OQ=
Received: from SN7P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::9)
 by CY5PR12MB6598.namprd12.prod.outlook.com (2603:10b6:930:42::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Wed, 13 Nov
 2024 04:47:14 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::4a) by SN7P220CA0004.outlook.office365.com
 (2603:10b6:806:123::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Wed, 13 Nov 2024 04:47:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 04:47:13 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 22:47:10 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Add support for HSMP protocol version 7 messages
Date: Wed, 13 Nov 2024 04:46:54 +0000
Message-ID: <20241113044654.2925058-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|CY5PR12MB6598:EE_
X-MS-Office365-Filtering-Correlation-Id: 8965051d-f8f9-4c10-5d6b-08dd039e3e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SfUFJiXNsJ3cPC1wNxYSwi5Sk1Hafn0IPj3shT1DnqDHTWo21vBg2egGgNMZ?=
 =?us-ascii?Q?b2g537y9ZWF5bnpUJsDQu0/abV1JMvv6GOUvCnmul8Ypz0+nYfnFMt+8n8af?=
 =?us-ascii?Q?romMnqap7lSdKj1EWZrWbWyccrBFrnuqDZoxQhcGtAvdpfG6+i0j+mj0ND4m?=
 =?us-ascii?Q?0xeB/rbBqWTBl/i+GE/eWloNL14RF15JSqhIIlvW8En3u6+2/PDTR4cS+vEo?=
 =?us-ascii?Q?8AVs9MMacGX3+QvPm43hwMTKd1BbrWnmdsNxhrw6J+gJOUdD/CePyQJHalki?=
 =?us-ascii?Q?AgCxIQ63EHsMhwpnBXW1MgIEz6+ZX3/Yj8qnqxA0++pr5xTdSNyCqiQaLyMK?=
 =?us-ascii?Q?JesJrbc1k64Mmhbamw1g39MoX7e3L8jmdZO+2v3XXgTXyBq1eTfpFsb80p3H?=
 =?us-ascii?Q?5Y2uRnDoFDeHcnqyblR690u4MDgPYnMYkIREqAYTUMlu2eI15Ev6RorPrD7X?=
 =?us-ascii?Q?QMHyYzBmSOE6Aw2S8IhPcyQIJr0+q7BgZy+jqUdUtCmiqK5S/EdUsTeO2cS7?=
 =?us-ascii?Q?tADndIY/V+ma1ZpMa/kRqU8s79Xic4gBz8bSVuyHK78FMF1mS5ZSQtrH0/6G?=
 =?us-ascii?Q?sYdNlne/Zbp57o0OmzFqbmsbRFWFcL8l6D6YVEDCg9ihDj8iiR/KknJEo+0w?=
 =?us-ascii?Q?Riz/0+48BYJSnJk1Dp1AFHBnArydTykPoB9qQ4gZ0YTOytglIgb59r4ccOti?=
 =?us-ascii?Q?UA9FGnAgsCmsKBO/mPTrkj2bgkffnsGfipWnY+3t1miE/MdjCf13BccaSNer?=
 =?us-ascii?Q?GFi+brZJvdpn1TNpFoGvSd3vLuUJXr9YF03gQtfnJd+Y8VXeW1laK4Oqa44E?=
 =?us-ascii?Q?Z1G5B1+gyp5wxNmjAQkKByJWEIiG0tXloUjO+fw+xvabpK8e4BpNbWMn4yq6?=
 =?us-ascii?Q?E8tuRWqgpFN01sxBZc0qIPWxdVKfUBbvDflanclYgpPteqykFsKSKLKO7ock?=
 =?us-ascii?Q?xmHTIS1hsMv/XUNFFlSS9BRRTAiiSHAVzp02+mFd3zD2uYcEXQLuqzxUdNm9?=
 =?us-ascii?Q?g8cPwZ3vL5so6donydK9fduu+R9+7lEZO6b8rGFyhlfl4nIGZ5Oft+o/P8Ax?=
 =?us-ascii?Q?sJEmRQOElwAZBvwy8hViQRSuN+z68FrLGuIZ/9lo+932QMh8WqrERdC9XYah?=
 =?us-ascii?Q?ilfFiQXiWJS1DH1+JZxbp8yE/WB6q1NpF2U/pwJvTvlF4p/DSOkPNxv7GTly?=
 =?us-ascii?Q?HxVnTrvI8EzfnEbIM9CSc0GmM09Ap6GYGqyGyBt3j3fJ7Y9JPPZyJcNaAt7S?=
 =?us-ascii?Q?J9/ZmaEbYTBf+T1jMAyOVSCV9nfURyIuQ0FNur6gvMMyzJPKPd9ZJU0xq27j?=
 =?us-ascii?Q?giLeuWcY6RYf1hNWaE7c/tAXlJMri5+N+FD5AH6U5lBcbaD82+yY/tXw65yx?=
 =?us-ascii?Q?Os34m0Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 04:47:13.9466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8965051d-f8f9-4c10-5d6b-08dd039e3e3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6598

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
This patch is rebased on 
https://lore.kernel.org/platform-driver-x86/20241112120450.2407125-1-suma.hegde@amd.com/T/#t

 arch/x86/include/uapi/asm/amd_hsmp.h | 64 +++++++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/hsmp.c | 46 ++++++++++++++++----
 2 files changed, 99 insertions(+), 11 deletions(-)

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
index f29dd93fbf0b..3108eaec61ec 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -33,7 +33,7 @@
 #define HSMP_WR			true
 #define HSMP_RD			false
 
-#define DRIVER_VERSION		"2.3"
+#define DRIVER_VERSION		"2.4"
 
 static struct hsmp_plat_device hsmp_pdev;
 
@@ -166,12 +166,23 @@ static int validate_message(struct hsmp_message *msg)
 	/* msg_id is a reserved message ID */
 	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
 		return -ENOMSG;
-
-	/* num_args and response_sz against the HSMP spec */
-	if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args ||
-	    msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
-		return -EINVAL;
-
+	/*
+	 * Some older HSMP SET messages are updated to add GET in the same message.
+	 * In these messages, GET returns the current value and SET also returns
+	 * the successfully set value. To support this GET and SET in same message
+	 * while maintaining backward compatibility for the HSMP users,
+	 * hsmp_msg_desc_table indicates only maximum allowed response_sz.
+	 */
+	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET) {
+		if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args ||
+		    msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
+			return -EINVAL;
+	} else {
+		/* only SET or GET messages go through this strict check */
+		if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args ||
+		    msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
+			return -EINVAL;
+	}
 	return 0;
 }
 
@@ -239,6 +250,23 @@ int hsmp_test(u16 sock_ind, u32 value)
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
@@ -261,7 +289,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		 * Device is opened in O_WRONLY mode
 		 * Execute only set/configure commands
 		 */
-		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_SET)
+		if (is_get_msg(&msg))
 			return -EPERM;
 		break;
 	case FMODE_READ:
@@ -269,7 +297,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
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

