Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013034.outbound.protection.outlook.com [40.93.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A72CCA4E
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149531; cv=fail; b=qHJl5p+imLwjhM2jrSGRDxWjMcp2cJ8q3BnhK86CL/A6N1d47W05TMystaXypByvBRhdcGMVE74AMqcXjx6kWfSEuIhvFKn8b0MDr0COWyw6LB9hsX6NI3IXB+qTO6WTQA7o9RY/LuXvuYkRM9//8Jcg23nhIcdYTqvOGsgJpyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149531; c=relaxed/simple;
	bh=Ytc3ACx3+EZcpc0Xllh5zS2mzdfQ5ilswGr+kFpWnFw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fa7LABuorrOsKpPR51uhJc7d3QoydpJEoVFUf8d+nPYxXioHc9dht4a7IeRYp7TvbQ9o2YZ4eo1gW0fO+hWGo2Wn2yViRZHOSrNAeG4qnxOTcVWRSybWG09pGW2HetJnf2n7JflfFuTotUhbFOWYRkJtgljZgMfps5/p5LYISsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LFNScw4p; arc=fail smtp.client-ip=40.93.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LFNScw4p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTAfqokWYTLGS1tYhaDYuiddUKOX65IYzT75ydbC+676brpreVymdAQpH9Wt7O7QntqFQrLjzs5HYbqIxP7c+QifMiFMce6aayBZUeOSW/y6K+lw09RaROJbS/e/2V00KjlofK9fYBzOds07OtV4Znk4+taG7tKXApbL5/pZc/IML+PWTC5NTlnNjxScLxdpL2rD7Q5NMSq8NQQBNKQUtrbJvEdKWRfc8ExyODixBzNGaToJTk73Sw9BgDpeTY07vl+PWMvs4Q8/dswuIiOMup1oFxTTqJDbVGI5ZrLrclsnFM/STjiEWxmc0znwxUGqMKanbVfl9CZQHyO7YQejeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBGCiYEv9IvCEQ6FJqUFrYYHu/3CNhwu/110QLWnEOc=;
 b=epwNx9VCLRUv6XLpuPYMFacPnoIvZ5Ld1BxQtJ1GL6xZtFJ9QWxD7bHuQ2XMAMfGbhT7gZTgAeUrzOem8x+vsB1nTrVmg3FP25jFbhWYFf70/4ydpm5h4pny6lmihCMCJYATfb0yZf0bv7LEJns0C9zuEQ77oIxKna1gTe+qqhj7DXxvV3E6QuwuM0QBBK2bwRMlK0D4XGe+PuDLSmca974ChSAHtJOsfirRJe0cfu5HT/sP/zPF9M7jsVzuFne1G4HUnwDJ0+Ob7F3vUF9+Pf300dVF6wlL4YOSZrglEmIMnVvdpZI7BdkNf+QDr+S6Ho84ORPIF075ZdHv1NP0Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBGCiYEv9IvCEQ6FJqUFrYYHu/3CNhwu/110QLWnEOc=;
 b=LFNScw4pkZWSoe27mCNmXlrgu2H3gmA6s1TAbQZf3WZNfjwaNxHBxprjmZ/u1d+xTdUfzEy7tVhV7WXd1ZoKSgiJFOG8/KI6Rf9qdSuPmrxTZW8UF4q2EX9Dwf1YW8y22ORDlhyy/QIaM25WemOeUS7FxRtsl7jNrsaRBQHg7wE=
Received: from BL1PR13CA0295.namprd13.prod.outlook.com (2603:10b6:208:2bc::30)
 by IA1PR12MB7567.namprd12.prod.outlook.com (2603:10b6:208:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 09:32:06 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:2bc:cafe::1d) by BL1PR13CA0295.outlook.office365.com
 (2603:10b6:208:2bc::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.3 via Frontend Transport; Wed,
 26 Nov 2025 09:32:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 09:32:06 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 03:32:03 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmf: Refactor repetitive BIOS output handling
Date: Wed, 26 Nov 2025 15:01:46 +0530
Message-ID: <20251126093146.3775572-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|IA1PR12MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 328fcb78-ef4b-410c-ff88-08de2cceaa20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qjKsd5NePbX7GGYENop2BNdD+7UEqz1HbeZyt7j1NdIzXxmWkJPqgc8fx86m?=
 =?us-ascii?Q?a0YgOBhH8SwhJrVCvE5/JjoRFnVouusbzC0e900JKuPzw0CnQ0B2xSSWn0UG?=
 =?us-ascii?Q?QfQ5KHETH0obBYXf71PY02l3/uoGEzjK8XBOL0PQKqR+KeNVyvE7jo1OhwCg?=
 =?us-ascii?Q?J0a0IahSQrl0GC3Vhk5FAOpxl5+5olmjO6V1RAGdB2wcPz/5P3FWS5UWNKos?=
 =?us-ascii?Q?MIW0xWIiEpzbSmZvE6x2z6fz8VklP5SYoADW0flg07vCj8QorABfa6hObZz9?=
 =?us-ascii?Q?tPPLgNMcAEdZDRKiAU0ToB3mEV5R6nyE4Gl0p84GCKRgqugbw4cKWaPgEg5w?=
 =?us-ascii?Q?blIcH5g5Q3sDmano4deXd+RYb3RuR8sgI/YoYJPzRdfZZXc+KaifREVkiAMt?=
 =?us-ascii?Q?NJ48kS3Q4J7/Ty4ceP21Y/EFDRSLUmXcXPDq0UO8nZ7N4crgMn6LYInLEHPT?=
 =?us-ascii?Q?lI4EBJOS+vC9+woeb8bHuXoJq1Pv5WLOfv7MgVFZy2KHbDXaoYQAhCylL4yY?=
 =?us-ascii?Q?TbxsQpUc/XbLoWUEnD484/b5NXKQH87E6nl+9cCvwQWXqhmj7xi9t+Zvb9E8?=
 =?us-ascii?Q?qoyLe4+08Zq7CcF6SC88ABkx9wNWfZbBS5k9Oa1dhEw+QSlZF5AtQK2da6iU?=
 =?us-ascii?Q?yOBSAwahDq6IWCRiGif/tMuPdxbH5fKQYudzDYyQMHalVmSSnfZT8r2Gl9vm?=
 =?us-ascii?Q?1G158GYdXfZCmMMc4HeYHpu0dFgIWA4D+MI2xC57Aip/tuq5sMt9XxmpLdfH?=
 =?us-ascii?Q?Zcdh3T6NMAAIbuBvXkVQD5mBZhotXmILAo8BiDoGPGss594UdUHFFmlO4jJa?=
 =?us-ascii?Q?tqR2Mb76RFa4CjlSKTXsMz7odV/r06Yg5e4gGdNLuBDVdmMXENRF89iHYRCH?=
 =?us-ascii?Q?Es7UeY0vZjDHS8Nur+VkA5Il+p+qvC18MOJTTF1sduZJ/CLaUO7c2mLoIfe7?=
 =?us-ascii?Q?iw/D0huyLeCUJ+f++UctLNLQqJ25ygX4013vBkYT02+ICQAa+xbxGOjwpS7Y?=
 =?us-ascii?Q?txys4NR+Me+Cdc+tOD997Bs8qEuF0men17Z3jFITRMpJmCU9/Pv9MU1RLbmY?=
 =?us-ascii?Q?Sjis+impcjQgsMAWuXPSzUyh1ZCVDEKVL4emQwsuyW72HZFyqB/QKOIWxa0G?=
 =?us-ascii?Q?TuO8WNlRjgM/Xqg/HLVgHPtJUqrNFTmd0WrjX12uLchg+WigAGu3eSQRUzte?=
 =?us-ascii?Q?2C0396kFy89nl7nsZuavvEHxd5IQ4YJifODY42ZEdyJ0+ohEqh9jYA+zsRb0?=
 =?us-ascii?Q?xgORVWmusaEf2J6INwuLOoX8cEfTOmnQyiXRiA7z7b7sk9dHA/yHFMWg7Ffy?=
 =?us-ascii?Q?1XTJ+r6x9IGqYXIfZWuW0VmNGmDAGUf/gx7Mcthg+SIedW/9uHgErWX2BEap?=
 =?us-ascii?Q?KApsF9ddlfkQTaSt7RK6VnR6CAciIofl/ziVaxu3ynfwODK5V+420PchUj2C?=
 =?us-ascii?Q?CA8QN5H1E0X8KjeaVisIClEzcp96MZ4U5jV9ml8lP/hdqoQgxA8HoQla0vlc?=
 =?us-ascii?Q?v4N3ATgBTPWQr3VPLyTzbTSKlJBUOq4R8WQb1Ard1ulhCNM/ET88llAT9U8d?=
 =?us-ascii?Q?WSpZG2mtNlP93H4AOds=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:32:06.1932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 328fcb78-ef4b-410c-ff88-08de2cceaa20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7567

Replace repetitive switch-case statements for PMF_POLICY_BIOS_OUTPUT_*
with a helper function and consolidated case handling. This reduces code
duplication and improves maintainability.

The 10 BIOS output policies (PMF_POLICY_BIOS_OUTPUT_1 through
PMF_POLICY_BIOS_OUTPUT_10) previously each had individual case statements
with identical logic. This patch introduces
pmf_policy_to_bios_output_index() to map policy values to array indices,
consolidating the handling into a single case block with fallthrough.

This approach handles non-sequential policy enum values gracefully and
makes future additions easier to implement.

No functional changes.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
This can be applied on ilpo-next branch.

 drivers/platform/x86/amd/pmf/tee-if.c | 64 +++++++++++++++------------
 1 file changed, 36 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 2c74ba2a0b51..a379556032fe 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -73,6 +73,34 @@ static void amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
 	input_sync(dev->pmf_idev);
 }
 
+static int amd_pmf_policy_to_bios_output_index(u32 action_idx)
+{
+	switch (action_idx) {
+	case PMF_POLICY_BIOS_OUTPUT_1:
+		return 0;
+	case PMF_POLICY_BIOS_OUTPUT_2:
+		return 1;
+	case PMF_POLICY_BIOS_OUTPUT_3:
+		return 2;
+	case PMF_POLICY_BIOS_OUTPUT_4:
+		return 3;
+	case PMF_POLICY_BIOS_OUTPUT_5:
+		return 4;
+	case PMF_POLICY_BIOS_OUTPUT_6:
+		return 5;
+	case PMF_POLICY_BIOS_OUTPUT_7:
+		return 6;
+	case PMF_POLICY_BIOS_OUTPUT_8:
+		return 7;
+	case PMF_POLICY_BIOS_OUTPUT_9:
+		return 8;
+	case PMF_POLICY_BIOS_OUTPUT_10:
+		return 9;
+	default:
+		return -EINVAL;
+	}
+}
+
 static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
 {
 	u32 val;
@@ -183,45 +211,25 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			break;
 
 		case PMF_POLICY_BIOS_OUTPUT_1:
-			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(0), 0);
-			break;
-
 		case PMF_POLICY_BIOS_OUTPUT_2:
-			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(1), 1);
-			break;
-
 		case PMF_POLICY_BIOS_OUTPUT_3:
-			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(2), 2);
-			break;
-
 		case PMF_POLICY_BIOS_OUTPUT_4:
-			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(3), 3);
-			break;
-
 		case PMF_POLICY_BIOS_OUTPUT_5:
-			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(4), 4);
-			break;
-
 		case PMF_POLICY_BIOS_OUTPUT_6:
-			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(5), 5);
-			break;
-
 		case PMF_POLICY_BIOS_OUTPUT_7:
-			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(6), 6);
-			break;
-
 		case PMF_POLICY_BIOS_OUTPUT_8:
-			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(7), 7);
-			break;
-
 		case PMF_POLICY_BIOS_OUTPUT_9:
-			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(8), 8);
-			break;
-
 		case PMF_POLICY_BIOS_OUTPUT_10:
-			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(9), 9);
+		{
+			u32 bios_idx = amd_pmf_policy_to_bios_output_index(out->actions_list[idx]
+					.action_index);
+			if (bios_idx >= 0) {
+				amd_pmf_smartpc_apply_bios_output(dev, val,
+								  BIT(bios_idx), bios_idx);
+			}
 			break;
 		}
+		}
 	}
 }
 
-- 
2.34.1

