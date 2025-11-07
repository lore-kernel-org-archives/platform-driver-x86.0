Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012038.outbound.protection.outlook.com [52.101.43.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C282D239A
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Nov 2025 11:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762513299; cv=fail; b=e8QhsJzeLRuqaj5mp79aGdJZo45jf4sbeYCka6y66c5EK7GR06Zp7GLSIOYFqS2ug7shreGA1Q/+tb+xNGFf2kj2vb2OsRiuiya9L0iBbYIn3emy8eH14yr1PgrVUNNaBMfmkOi9+RSB/OPHgsL0L2l43IGlMH6NVPwxKk5VcxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762513299; c=relaxed/simple;
	bh=JTHkUGwstnl24JreRUEY6JA5XjqbJLrB1CqPlqAt3/w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L5frIhTcQ5VdE2EDglqIWDkwLoBjbEXbKqVEtuKD88YA/QAPMSHOHx/oaOSJcZtgHz46qjSkTYSEX0VVFVi+xLlU2JrvUvMO4rKQI+dhnA2olxgYoEWRR6ixUwaQhcNbRfV9Q81cutR5pzQbZXJ+YGMhHcxwv+NtQUe2FbFn2rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=brRGjIJc; arc=fail smtp.client-ip=52.101.43.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="brRGjIJc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wk8uJRD1//ftPcpbaQNtLhXdzDqRweCrtDDJHhngwRU4sP4ScvfwIbsXi9exmXmlGqOWbDxr6M4mv1q7AtvK3c7/GLUITRHsQUajy9tBy/lr26Qzfo9DGzIizJ9Zthz6bIhvBfCsSmoAHb61MIz/x17gon/YF27C3LrqLAe7DgiRTXHZVbqcXNVeXZGU1rQQIqrdGiMRDmvq9RDnlhQnRIpas8aTPs0UQY4Xwpy7LLrGvB5filqrNymktFykoISATlF7XO16BEke6vB9Hj3Ld+748PamG9zoLbbqWA04cgLOiGRDszR2jFMvBbyoBXsTI3OnvLWhK9FQndYOvOEdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nS3EGa1DKGwkH5WtknX73Wno0w8PLVIsvtaSA4VEBIM=;
 b=HSh54BwkMHbWhqwOPTR06pgS4qLOnorF3eiW7CkLPkgwpV+NCc4G4GE8Sc+rXK5hTOsTPzfFUQCSYDLoIIND6Lma4czNgFUjbxf621Ty/c3KVu1Mzb7MtX4pCbFppqo7WZZOdRLlYT5njWZrwmFcUy2/MwMWaC+FqX0MeFQ6gt77ctoubEsautd02YQC5/AF3ZDrwZ6oDF4vPFNlwatYTUgVAs6VniZe6e4fEQoA7N+LPftWWno1TGRhVJL+pvSxdzMXrY6oACHA88ql3aIiw3S8KcOT8bVE4BsiFuNs0p+sroQd214OGcCFzVFUq4YAllAu4R+xacNOL6+5oR8kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nS3EGa1DKGwkH5WtknX73Wno0w8PLVIsvtaSA4VEBIM=;
 b=brRGjIJc4/jf7c5cYfC9oKnV7JUM1fDjPcJBAPcmVj8oURr41WDWRpKb3V0AY4T1dIdMfkpoeXLd3FdmZsd6pDobGxewb7l/ZiLiolyBtHExlJGODf67M9sgj+cYWB4DnhcPmv+2TNqFjrHv3S66nW4gFhWoZGYrRzfoDgg82uE=
Received: from BN0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:408:e7::11)
 by DS7PR12MB8419.namprd12.prod.outlook.com (2603:10b6:8:e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 11:01:32 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::2d) by BN0PR03CA0036.outlook.office365.com
 (2603:10b6:408:e7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.13 via Frontend Transport; Fri,
 7 Nov 2025 11:01:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 11:01:32 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 7 Nov
 2025 03:01:30 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<superm1@kernel.org>, "Yijun Shen" <Yijun.Shen@Dell.com>
Subject: [PATCH v3 1/2] platform/x86/amd/pmf: Add BIOS_INPUTS_MAX macro to replace hardcoded array size
Date: Fri, 7 Nov 2025 16:31:04 +0530
Message-ID: <20251107110105.4010694-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|DS7PR12MB8419:EE_
X-MS-Office365-Filtering-Correlation-Id: a6214173-1b16-4dfc-3ead-08de1ded02b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rFdBikJpKbfbrwytzVaZ1tp+IVs5V0uvwxx/B/CroprZoSyNM9qg0OOOOw7Y?=
 =?us-ascii?Q?+HcCU/FJjpz16SO9jkh/h938wzWlwhkq2fgrKxQrvTSuet4c4zIggAiinrZD?=
 =?us-ascii?Q?FI0EVkwXDmEkkSLOu0qn9sx6oHgKUYzmUI+LiNhuPr4Log/ZgrLclxevyCXE?=
 =?us-ascii?Q?GWF7JZKsP9gaiJmmKQjI76eXdqdYCDv6UCPUgzibLAIwIsOaTB3DkXMFFekr?=
 =?us-ascii?Q?9GrLKOz7oJsjPyKXhylPgQa4y3hg+WRzfDtuEvj6YLm/vZY746Uh+ltsFKd8?=
 =?us-ascii?Q?MkvHiiG5IGthRLgw5AicmG+mXZ5n97BvOKaMU4wmh6v0NYUwwnpKtIXJ/zfa?=
 =?us-ascii?Q?lt+Zm2V0oJmb44XM8pBe/C2eresOqZCDvyPDoettBeLa9evshjLmRLEuIcKJ?=
 =?us-ascii?Q?9toP0rCPGvQ8iDyg3FMLLfW9l6OAxuJhPYBmLLAZuq7u/5U3Lj2VbrhjD/HO?=
 =?us-ascii?Q?jrqYynAO+fb6cPw6wrw8s77F6c5H+HdRJZ7BuX7tnGoQJWur4uiEUCCX1nlM?=
 =?us-ascii?Q?Ag0JwKOz9eLRlPfPthcQxhDYua+ul7htxneBOljmYrdYYKacOm0IQLQ414cv?=
 =?us-ascii?Q?MVhy0WCyrAPTDoNsjYi8p8O9KXeGJAEHfvW8j/Izsl6qMPB3m/txNROBQQZy?=
 =?us-ascii?Q?mydZ7/E+d+e/JBNtFk0ZHViKF0O4Q1AyvaZU6hriHVUCH0wg2ZqazJDYlVcw?=
 =?us-ascii?Q?DXOO87Bdsgth1eQb2EKKAskrb2taY9rwTRTS554A32cby5B6OD5WtqRqO1u6?=
 =?us-ascii?Q?FbJhsCIYPKPpKGU5+Q8MukCW4EahygpVhgC8xlXZuwa5aGPNNnlJPvr6O7iL?=
 =?us-ascii?Q?L+7G58ZfwsSpfhgBVfaKOE84p9pTaAEN0nleKS7wYnZhclhPBHTQQk0a1+TS?=
 =?us-ascii?Q?1Skk8WgubG6zJZ+Xol2KtcLnlJ5rvvy6IBoiJPT6aZvqKjFoREHvLf/iZORV?=
 =?us-ascii?Q?ZUipqzyjvX+SBvAlV541odFvLp3E6B/nKuEzVgrFAmkr+s8mP3WguvElzxPO?=
 =?us-ascii?Q?+bOIOrTI5BwEUcAO3eth+wO/34hCfrMKek/4yxA0wYan7VBkak36I/rKkwxf?=
 =?us-ascii?Q?hhbiXnrrE0IQK/iRojiTT2VZkXO+CsLH2ZH0pT1R/a7d6+deLMf74t4RJj/x?=
 =?us-ascii?Q?FdyGc7GJ+BdiHu8sEtbK+NoVCOdvuOtbEnpMC0Vjj5Edd3PLFinrWWo835UI?=
 =?us-ascii?Q?M3GYk3A+MvsrTVsDDo1fD9NOfs05V9+rOXq/JER7CikiK7wcT6U5o7Rfjvdb?=
 =?us-ascii?Q?eTuODPDLwVE595RKu8WgbykPFeHgUKMXk0f/5Rf+4KtqPFDBBstm2SfXn91V?=
 =?us-ascii?Q?e0L30vLQ5oJtOTjfFL/KERzUe1TUVxnNDMpr6UEswANLZ0cTGELbigvrEDGj?=
 =?us-ascii?Q?RRXO0+rZkPG3nV+fUMN7ovj3IxXmPNuLWL4QNhHkVkLrwCRVBdZTwSCJqmth?=
 =?us-ascii?Q?bKeCzDdybTKJrt6OUFGA/5CjA70w8KfnNBBFRfcL5Jgj+Nm7VzvwDMCynhUg?=
 =?us-ascii?Q?OD7gj29dKcpQj3CUVlZWa2YieT7HuFUlg7rqDWGAv5fteNKpPiXe89P5b16o?=
 =?us-ascii?Q?8LZJxbVbQyNLsMmJjTk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:01:32.2848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6214173-1b16-4dfc-3ead-08de1ded02b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8419

Define a new macro BIOS_INPUTS_MAX, to represent the maximum number of
BIOS input values. Replace hardcoded array sizes in relevant structures
with this macro to improve readability and maintainability.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v3:
 - No change

v2:
 - New patch spinned from v1
 - Add new BIOS_INPUTS_MAX macro and replace hardcoded values

 drivers/platform/x86/amd/pmf/pmf.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index bd19f2a6bc78..2145df4128cd 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -119,6 +119,7 @@ struct cookie_header {
 
 #define APTS_MAX_STATES		16
 #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
+#define BIOS_INPUTS_MAX		10
 
 typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
 
@@ -204,7 +205,7 @@ struct apmf_sbios_req_v1 {
 	u8 skin_temp_apu;
 	u8 skin_temp_hs2;
 	u8 enable_cnqf;
-	u32 custom_policy[10];
+	u32 custom_policy[BIOS_INPUTS_MAX];
 } __packed;
 
 struct apmf_sbios_req_v2 {
@@ -216,7 +217,7 @@ struct apmf_sbios_req_v2 {
 	u32 stt_min_limit;
 	u8 skin_temp_apu;
 	u8 skin_temp_hs2;
-	u32 custom_policy[10];
+	u32 custom_policy[BIOS_INPUTS_MAX];
 } __packed;
 
 struct apmf_fan_idx {
@@ -355,7 +356,7 @@ enum power_modes_v2 {
 };
 
 struct pmf_bios_inputs_prev {
-	u32 custom_bios_inputs[10];
+	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
 };
 
 struct amd_pmf_dev {
@@ -451,7 +452,7 @@ struct os_power_slider {
 struct amd_pmf_notify_smart_pc_update {
 	u16 size;
 	u32 pending_req;
-	u32 custom_bios[10];
+	u32 custom_bios[BIOS_INPUTS_MAX];
 } __packed;
 
 struct fan_table_control {
-- 
2.34.1

