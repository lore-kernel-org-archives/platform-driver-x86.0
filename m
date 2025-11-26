Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010025.outbound.protection.outlook.com [40.93.198.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354DC303A15
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150249; cv=fail; b=gbn9Pq9ET7psFKqye0QWm6hxmKeOx990Gpd2+nIxYwYkFsT6kJ33whNZxG0wT3WvZyi8AN1Hi+f+Q3KPxreLblFXmV0m0lc2XRu3ivbMEavo7CnKVAdlvrRILrYQKbqXqWuRn5JOhpiugWxa8AP/WZqcgIx8CsBut08VYYD/Grc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150249; c=relaxed/simple;
	bh=crFWXPzqz8I5qNSgmG6ZvBgQcq/6RSW4OYWdOnYa6KU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kHf6r27o3OFNEGEKW6XVYGr4B3vfRgLKMOk9uMb8wArC0gaErzXdSHM3WvqPCgyqzCT3GbX0RkRL4QEJlYEqD5J4PhSHskq4cO+cwLMC6RssOc3kyHoRZ7+NrOQ86NSmXA2a3uF7l1HHoQBoGdJQ9uALweWJsv7hlmP1+BrBnzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fZotJ+8W; arc=fail smtp.client-ip=40.93.198.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fZotJ+8W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgHsviQOKoVUBqp0DdzoAWEqIz4JnzzczUCmkDOGdY+bneFmPCeKYIkxtzd7Hn869WbRwYBSjVSPa2DCl+nb3PXfbrQZjs9MV+VgriAnbWQ4F3rqr/gCnzcSLl9HBdssTj03N7jnluVAe6saE8l2uSlwzDeIbgstacGoDxhAtDhaTePDUVNiGdz0CLDbtIhRqhD2WXXDrelN5JwmpxHKey0DNrMiOijNc5H1ol8D/Inw22TOw8Kz2xbBwjnmU7vXidi+9PcxVBJCmq7mcO4DABf8+WiQiqT95AmQrNAQ27w6tq299n/0G0Fv14+jKof54UOvonWtYZczwpuz/jcypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLPu1gP0rq41fLSaVWEeK22qe0Km1jRGM5N3KcIGthc=;
 b=dU7fxUwWv5M8Ty8wC9pQv7n8Npv08+XTaSOYx2vX00inxXikscO57XVYuxhvgvikpxRPuAkdDdzbSOBadv3kQHeLGNE2hVCFE/4sVkqGNpm7BDAOG/dEE9i5eKud+o2eexI/HYqZcyG3RSi7nKMxtUGVyoTd3Wao/YwI083ax0SOZdI5A0yVuqc8ak50vuUTpdpPqbpi1IoGGEDSZqWZV1Y7gckVa/Zb0PynI3NhfL+SddPUjgQfxipKGC0hOg1ZoBY+9UpSRbj/1ZJUIXnlb2Kxj91qR5JSe6sQmHzhfzgJsZfIR2ZdsegWcerYo4ec/XQ+xExCIgWOSyna3r2aZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLPu1gP0rq41fLSaVWEeK22qe0Km1jRGM5N3KcIGthc=;
 b=fZotJ+8W8ERBEcv2cWmfcEbKBqiTJHM+hTIp+xk4YEAKvAU6oDmQ6ti3yT/bCbe7jp88Vj2RkL08alhsgX4kDV/546WbMxx9sUCwXdw0JZINDKnoJlHJFztbDtdbdHJ8nAelzqJVIoXxy0DJ5OajYbsWRMhVHPVU1i6O7yRtxHY=
Received: from BY3PR05CA0034.namprd05.prod.outlook.com (2603:10b6:a03:39b::9)
 by IA0PPFD7DCFAC03.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 09:44:01 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:39b:cafe::ae) by BY3PR05CA0034.outlook.office365.com
 (2603:10b6:a03:39b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.3 via Frontend Transport; Wed,
 26 Nov 2025 09:44:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 09:44:01 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 03:43:58 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2] platform/x86/amd/pmf: Refactor repetitive BIOS output handling
Date: Wed, 26 Nov 2025 15:13:40 +0530
Message-ID: <20251126094340.4042742-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|IA0PPFD7DCFAC03:EE_
X-MS-Office365-Filtering-Correlation-Id: 513d5545-678c-43f9-c2cc-08de2cd0544c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RpCeQA+mkghTEMgdd3PraYjnFACPpLuvNL+XWFRZ+jfVisRFP0jSdp6byeyy?=
 =?us-ascii?Q?7/wzSu9l6nIJnYoigL+yB41mDhs1Sx5+dfpdBFQNef4LiYLa9O1vzGjjkYw7?=
 =?us-ascii?Q?WADxppD6cOaSA+C5HchlEbvURJoEGAK9+8jzqrygeYsoOS3llMgVDH9j217Y?=
 =?us-ascii?Q?6RcYGhmcqK0uPvpj8SJef0xI/Tc9cACueAaiBEoXiUc3xyhH/TrDtqy8MgHa?=
 =?us-ascii?Q?e+TgF5TZfp/9VCRxJ1k8JSAfgdnIIt20bxIxts4oH+yJoRoy2d74+cYU4RQ2?=
 =?us-ascii?Q?MWZUgjD4FmZpQPuixXwvf7E2MZs/uPD+w5Jnc/kuRFY3JIfp8zxhEvRfDPbr?=
 =?us-ascii?Q?ljunua9fKMOSqJTNSD3ogVLwBZtQAERO1y5zAl5HA0lnyYR/6UGv3OaLhkFE?=
 =?us-ascii?Q?5+EyaQXDVf6mzJz8JQY2vD52CSnH6DTMrRH4Y2BjgeO02Hzc2c0sL0ga0O0y?=
 =?us-ascii?Q?8gJFt2Z0DUep7thNIw3CSp+nqdh9+nrJeDKTyiNF1cJyKIHww5l6Gv8PMI6o?=
 =?us-ascii?Q?DqEEVS5P1OhZKj/KiHgL3g0rtVP4h2PHQzmDtHY9+m6pjwvxtbL3dbpZp/J+?=
 =?us-ascii?Q?CEJdUOI2D2Zejl0lArMaFouxO1zq5TrVbgCNgHw+FfiHbknKggh60L731A6a?=
 =?us-ascii?Q?zpI9xzRQu/JYque6PzKvm1IgKqrqscI0RawciEymlQWXkHmFHnDnsefg+XfT?=
 =?us-ascii?Q?VIqCHTb0wxLyaw4Ezy0WrQGZumYVgUv1lK+iG4E59YsEMRyDw+HIbDWkdhMS?=
 =?us-ascii?Q?OyweTjXYAbUCW+qoFC1gdrxxL24jLPLQXzOYL30wU3+goqWdxwClgS/xLVS8?=
 =?us-ascii?Q?XAu7c/ElKaOM67F93beDPk9Hbx1E88RJt0o+jjW+hU0KTOrYQU3g/uFK3Y1N?=
 =?us-ascii?Q?ZfGWEfeHZ181DO1dYZLlBBeH1++YsHDKmbWeAfBWbmuHqypbW7yBujpa+T0E?=
 =?us-ascii?Q?2m+c/UVeMzTaVcDXlfE1SdYBNiD1ZLsQPjJtExwQSPaK5YKkLs4Ya0oJKv82?=
 =?us-ascii?Q?hmiwjW44izWK3URiey8Ha8p5+mH9yboAiP0lUOaYwoS46CpvGSpXUkigY+4J?=
 =?us-ascii?Q?DB7ak+A/EV6zH0CIFkPtBfjlrHVWaC2Ityhzn2GtEbBRgRY6cmFhk4EiAhqH?=
 =?us-ascii?Q?lp5H82WFwDsbHh2l5zDCbRvBCLGynMNF4wlNVl95WRkKOrGBvnDSKLuMbiGj?=
 =?us-ascii?Q?a6xblmjdd0qYKTqpVIs8xtKvLk2Y7fLiTvY0b/B8n9auoID/gg02oTr07QEJ?=
 =?us-ascii?Q?IeHP+TAj5SV01yR4lMIU0fEjCjmRHirmyuC/sqzgnWlSqaJrT/Uys49JqtCm?=
 =?us-ascii?Q?WGyzAstOYZXjtoGPWUT0zA8UstKyhTxQFM8U+uynJwi3U5TueocC3zLGt/Bf?=
 =?us-ascii?Q?D3vzuiyhGQolcfYy8y4S48T4tWJnHimGLY66pzBLpQjA/+S6hMAngcoE8Lgc?=
 =?us-ascii?Q?79Nj7enUtw/K6LUix6no+JhLoUENuYb5k/mwXiTVRx5mpQyLnruFl/msPLaE?=
 =?us-ascii?Q?e2kPaIqdZPggvbJHRU8PFf8Jxm3g6xXcUz7tzKYWZpWdrHly3SXtblfYxVhO?=
 =?us-ascii?Q?PzNTBlwzDsw9RCTWDns=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:44:01.0953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 513d5545-678c-43f9-c2cc-08de2cd0544c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD7DCFAC03

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
v2:
 - Drop if() check for bios_idx

Note: This patch can be applied on ilpo-next

 drivers/platform/x86/amd/pmf/tee-if.c | 61 +++++++++++++++------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 2c74ba2a0b51..e4562caf98fe 100644
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
@@ -183,45 +211,22 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
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
+			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(bios_idx), bios_idx);
 			break;
 		}
+		}
 	}
 }
 
-- 
2.34.1

