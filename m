Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F0D31DDA4
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234668; cv=fail; b=TymAaNnUK+qfcl3nVcZaWHm6dCNi4SZ8TD4pHEBpKUkdJgHC0iYqn5a4FXiZmLH2vWfVJYu3tO5AZPmHh2c4QqwdsPA7o3mxltYcQjxoPgEySwOgB7HmLvdsOSLFz8MLV2Q0Kub5XSAOaf/ODmTP+QfRT32/TMhuCFBha132r84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234668; c=relaxed/simple;
	bh=kHrT9wyxb7E0gO/tLk6UcFfDE6rhpag5HpMJS6QjnX0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mgebg2jmvC3t/8S+jjLuPWdayKQWrqBiG2ezeedJKbDS9c9/mSLsyuevPUcnfW9VdTJmWZ/Pxy5Pxuk8uE7y49UUe3riKQd+p9t1xjBUU1mhRm8tt/8/vjIy63FTZeHMTqGaD1BvPvH+tLQJbrkmbfBx2xThYI3+aAoZRcNqS5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pEdQFp6e; arc=fail smtp.client-ip=52.101.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pEdQFp6e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruhr1yDV8lVp/jrf8VFE94RPUC4y1YPKlmkIKC+8uDA6qeMIAA442cU45pkqLlwd/qRZTRySKAQtPk1mZSwHVC7Toq5R1yUxrtFnjOPmA0akm1+P5xiB5QCJhBJRZWVEg2n0K8boUzsg0T4uHNKD9TK7U8iLVaWWfoHf+4YYl1Brt/zNAqXpMXNbH12+28Ug2KCIbTCE4st0NfRjmh2qxm+hmzLJ4K1Gqb9IeURoROq3oLKTmjR2vsAHFKyHuv5YJo9ecbvr4e3tbpa2yZ3g1CVKgUpEHt0KdYPALyINRYNQob7ey5/wL32ORRjZKGYHapmlMF1F61AQIo6dpNxrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJXNo2zBNFKZA7mVQwAeimppCJBJPNDGZ0lfNLQGlvc=;
 b=iIxEBRmqI4Ii7UZ6ceLctl16bnx0UOFCKnQn5PsAJH5A1EkuP7kkX3BSrFYWxOYvUMtS3ioWTthN6YunqN4NwbVsBtLojlM6qEwtfFq3L2SJb4BeysLw9lGgieSPpWr/CuoKcu9jNyzyl8nPy8gTPmgf1/4DGUo3Uipf054uD+oAu9IYSTzjn5cQKePp03lVogCrGGkaSU3QMM7sv0S1+NJ6a5iqoQRm0fj9E9d9YBd+YQDfpDYNA558n4Su4ZFAtlfD0u+rM+kvCQrv8IGEeklwDbImEwhI/FAizeUAkyxx5fXvlqYHivg4zKgeSza7EKKPEErXW5zwUurMA+P5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJXNo2zBNFKZA7mVQwAeimppCJBJPNDGZ0lfNLQGlvc=;
 b=pEdQFp6e7pgWE1kS+vh5U8R2C7KIMZKGfisnaW6IIibCuDLqvaCHPeIKw4V2SMmtFoW2jlDR4S0BAEK55cFqmR/laZ2XRSRfdzO6vpceWL1TscxtSmnarRZBhAofl0pmmr8DEZu/7BKzGUOD+WTiqwQh9co4NNY7dE7hN7BmZ7o=
Received: from SJ0PR03CA0179.namprd03.prod.outlook.com (2603:10b6:a03:338::34)
 by CH3PR12MB9121.namprd12.prod.outlook.com (2603:10b6:610:1a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 09:11:03 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::5c) by SJ0PR03CA0179.outlook.office365.com
 (2603:10b6:a03:338::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Thu,
 27 Nov 2025 09:11:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 09:11:03 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 27 Nov
 2025 03:10:59 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3] platform/x86/amd/pmf: Refactor repetitive BIOS output handling
Date: Thu, 27 Nov 2025 14:40:38 +0530
Message-ID: <20251127091038.2088387-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|CH3PR12MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e886cfb-ffbf-489a-10a0-08de2d94e3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pBeptOw7gzXEkmDd6JFXMNlnOSq9tnNyZPwoJc/izlwd0/Eb/mp3ealRfcPp?=
 =?us-ascii?Q?lQeI50xcVPLIxEaOZ8ydk6i/tQn061byUl7feaeslWZBHjr9+K/wxDz9kg8P?=
 =?us-ascii?Q?6vS73g3n7dNAfQBUyYFnJfZL7M1lHc5Odrz7lP5zn2CAzMzHXmuEPceGF/fQ?=
 =?us-ascii?Q?shV2tvcMt5v/23PvVh4Z9BQGd4sW+1ag842Vo1ibLSuF67vLCfehiKQoaGJQ?=
 =?us-ascii?Q?w2CQR0ha0v3pKNuLefN9GeWmkchypiX1gEt8kyy40hTlStDgikmwEUazNV3s?=
 =?us-ascii?Q?BYv7d80k0L2h29KXvS6bqsYow7IyuX/iYSdLQvoj9CetGpNHa/BqbLMBXPHi?=
 =?us-ascii?Q?z3+UFy/7hklZguge5xpS4FwSEoUYnfNmzNrDUDUQdTyxpF98VuB2ZKIwMMDN?=
 =?us-ascii?Q?rRATIEwpsgh/LNGa3h0s+hF7FUgE2k7AWzygRsx1pc3jsBsjM7j9MFJtsRp5?=
 =?us-ascii?Q?tMZsSV+f0Rz1wXQRTimtW3L8hRe7ZSNkQn0+iGCpUkOJ7iqaq+M/JO2Yv2UP?=
 =?us-ascii?Q?xnTnkN4RjH5Ce/ZjT4nzRQSdu+/goUoJklr2158jmPvWPZIZC1K0W5NsPu6B?=
 =?us-ascii?Q?jjPLOk85b80Qx47nC2KPCwuTvzxXtSv+Z1ROWsx0zG52owEImK7+xXQdZe51?=
 =?us-ascii?Q?ernW27xhg/NESx+Uw49mSGX0/wjuxWu9mry+F92MKJdoEMtKW+/9J1fgJQWp?=
 =?us-ascii?Q?P2CfWE8vAJ+HshLrgnMthp15a3cyXeYCqxFUdGQTbbIz9cdyvZY5HlqaO2wZ?=
 =?us-ascii?Q?dNro/3hNgOo7gCsIjjUcSn6/6KERuv1Zy84E7/TuPjPKn44r2W9e61l1WRRW?=
 =?us-ascii?Q?CtwqRMYPW28YbOIgVvUnlFU0ABYH8Lm51kRmrlWjujzAAtyIdY+2M4sWcEjK?=
 =?us-ascii?Q?zDQXYVjsHXvicOJjvxPxLfiumJ8f8/T9fIDw8Mxo5GY8K6SL1VtcmIa2Yk13?=
 =?us-ascii?Q?FX7A6odDlFTRoPI0/LBNSgMCey88l6k84A3tFnHN7/oK2Edtpzv6ylSl6YVa?=
 =?us-ascii?Q?F5w+XB4pXnWwNDO0QK3MOK/yzJuvMipxkDaUkY+LbUTg6MXlnnTBMoTOoLa+?=
 =?us-ascii?Q?F51xHfyIdO2BLzfgEtfVfCi9mROzthNYv+eZtdlMSJgQbcY58zExDkhNPJUK?=
 =?us-ascii?Q?xd2knpQ3iq6gBZC106y1ZdKEz2U8wG9BBwVpU0uPUnUz1OwFhmif+pmlFUBa?=
 =?us-ascii?Q?VouiVr0HvJ6CwcPhSPLwrsF2fo9Kqkmwhh6BOCDZ8H4bszqdiU5PKXr+JIja?=
 =?us-ascii?Q?xjvgd10y00uQGICDAuzlL9/84eDFY4bvgARzQa5A8QBwAg/M9yGu/3slcFeR?=
 =?us-ascii?Q?JAfdtV0ciMlrgZcNOKFsYGNqFYFTG3EL2txP19ajiMNOS0DEoufGtXZjSieQ?=
 =?us-ascii?Q?CVzoq6jCqUl0Nf3e74ii3v1jbGmHoifmxHVVvralHBjcNaxP3nEljvng/uov?=
 =?us-ascii?Q?kdy5nWVL33Wxr8d+9XQBisy3hNArit3hYvJOSvziaI+7/T5ZiYm80Tq6NXgX?=
 =?us-ascii?Q?5MAPXyl3fBOU//PFb72a71ScFuHzrEBikmZ4PZKbn7XkBY6GV4EG5Qa/lzbo?=
 =?us-ascii?Q?TkQgEWZ5JOiZnFxMkHU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 09:11:03.3897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e886cfb-ffbf-489a-10a0-08de2d94e3e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9121

Replace repetitive switch-case statements for PMF_POLICY_BIOS_OUTPUT_*
with a helper function and consolidated case handling. This reduces code
duplication and improves maintainability.

The 10 BIOS output policies (PMF_POLICY_BIOS_OUTPUT_1 through
PMF_POLICY_BIOS_OUTPUT_10) previously each had individual case statements
with identical logic. This patch introduces
amd_pmf_get_bios_output_idx() to map policy values to array indices,
consolidating the handling into a single case block with fallthrough.
Also, add a new function amd_pmf_update_bios_output() to simplify the code
handling.

This approach handles non-sequential policy enum values gracefully and
makes future additions easier to implement.

No functional changes.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v3:
 - Add new function amd_pmf_update_bios_output()
 - Use shorter names wherever possible

v2:
 - Drop if() check for bios_idx

 drivers/platform/x86/amd/pmf/tee-if.c | 72 ++++++++++++++++-----------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 2c74ba2a0b51..cec8b38c1afe 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -73,14 +73,53 @@ static void amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
 	input_sync(dev->pmf_idev);
 }
 
+static int amd_pmf_get_bios_output_idx(u32 action_idx)
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
+static void amd_pmf_update_bios_output(struct amd_pmf_dev *pdev, struct ta_pmf_action *action)
+{
+	u32 bios_idx;
+
+	bios_idx = amd_pmf_get_bios_output_idx(action->action_index);
+
+	amd_pmf_smartpc_apply_bios_output(pdev, action->value, BIT(bios_idx), bios_idx);
+}
+
 static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
 {
+	struct ta_pmf_action *action;
 	u32 val;
 	int idx;
 
 	for (idx = 0; idx < out->actions_count; idx++) {
-		val = out->actions_list[idx].value;
-		switch (out->actions_list[idx].action_index) {
+		action = &out->actions_list[idx];
+		val = action->value;
+		switch (action->action_index) {
 		case PMF_POLICY_SPL:
 			if (dev->prev_data->spl != val) {
 				amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, val, NULL);
@@ -183,43 +222,16 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
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
+			amd_pmf_update_bios_output(dev, action);
 			break;
 		}
 	}
-- 
2.34.1

