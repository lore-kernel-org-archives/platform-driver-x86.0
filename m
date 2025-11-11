Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B4034C81E
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 07:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762845044; cv=fail; b=hYDFG8isRur8Ae6jv7soTHMLQkb6Jth17HMGql6rJLPE6PEANV+/00KM5uxMFpojFqcDomFVMi+zfkAaQC3UfHweWmEL3+YsJgRQLhba5fE1gDDIe87hM8C06Cqpe0PPnMlpSUNIi0JYoERTc9T9EZEolEobeKL4r5Gt8X4MDjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762845044; c=relaxed/simple;
	bh=GSoq3dPf8jYSh93SOVAg1J6grenedaa6OygP4QbbhCI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=duduxE1SD52RJspTh7z9Tmj2IAwSSDWulhAS2uJ/Fes4qo03SSS3+MvgEvzYKaNvS+75o6PPgpmFX1vPoJF9cEU3GHEqF445CKJz4XA/uy03iLXcQG0Kvd4U09iJHF4DqwMXspAtjDpCGgLDwdXbmujSugbr5DZG8eYjmRYnUgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uZCOr8Gg; arc=fail smtp.client-ip=52.101.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uZCOr8Gg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nt4LIozGeiH3ZfaoLoSs9MbQ4kyNh6HdZFXkPCnsgL3DHNB4NIm2g22t3wtzWIL6tj4q99Fm8JWtaz1UIOOj7944/GY90SRNBGqalG/1dEI2iS+yrTwSH1MWPAB2LEBGT1db50HVSd85moTjkrF8uCVcPRdc9lPtpAiIKsovvSE0dKMWOx2m7ddTa+FypGU9kHzwlpC+HuuH3+T49UoBunpgIepFTGBJIbZp34VEtuJIf86Sy2SNNii/dKLY7urXoWisS0RIOcik6NgHhL/XnY3E/woqreuou0Cv5p7cWjG9vpib03ycG0jqP7zitXhRapIdTMGkXyezXBe+owyStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NaIo3lJmYvwfEQh1Yi2PzBv5Xd0xSgNgoB5uHJ8AccI=;
 b=IsXDb6pU0ofLA78OO8sIv3z93cahbGhTFUu5a7OUDTXi+yMlpneHFTlZQIkEqbWDP3QIg2XWu82o39/QY5E7YMhGkQADG0zbpKb/hvI17jWmEBzsVS6eHj9T3qpvHl3QBQN1bh/Q3Aftqf8UGsJpP6U/1liDdCcV09rFe9m1Vele/H55efXkD7zGDgAOEN86E579gmnnCXA6jQmEID3fS9IVGVMYja0O6BRbcPe5tgRoyykitOkTDZ0zki9KK5hDq8zxY717W87GrXU9JsVXi2+RQ+iu8dpAhCNliIk3PB3fWRr3Vxy+ttv2mIZt6i59pMWd7aFJHNeHZ2dzpsDeiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaIo3lJmYvwfEQh1Yi2PzBv5Xd0xSgNgoB5uHJ8AccI=;
 b=uZCOr8GgSsMXa8dfAmSJppYM+Oc3Q5BvtggB8MQuK6s9s4TQVOjHjHAwntLj78/SchN9D47Qe5jLTO68dXobJvCfaLJCeqoTX5imoDU7NopkeTlABL38fa/06+ca3g9j98qSm09ClfjmbYl9DetEePPPLhPYrMZpYpvTNTQ0b3g=
Received: from MN0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:208:52f::28)
 by SA1PR12MB8843.namprd12.prod.outlook.com (2603:10b6:806:379::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 07:10:38 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::72) by MN0PR03CA0001.outlook.office365.com
 (2603:10b6:208:52f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 07:10:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 07:10:37 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 23:10:35 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/5] platform/x86/amd/pmf: Store commonly used enums in the header file
Date: Tue, 11 Nov 2025 12:40:09 +0530
Message-ID: <20251111071010.4179492-5-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|SA1PR12MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e353f13-f802-48a2-e0c9-08de20f16a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?khDXZvIWeAr6MYz0F5LCMePGQdb2pOuPM9zaIXZnFjdkfmtj1MZJzixofgXJ?=
 =?us-ascii?Q?FIqvOwduXF3DrosxePyocYmL/zX6mNx3zeSBeAsa94wVj7jqPNXFioCD4khF?=
 =?us-ascii?Q?A7v5/DlqD+7laDxWUVvJFHOWlLKLkTlZusuGsrZf+MLh+84dEWfr7r6i9LdM?=
 =?us-ascii?Q?buG30QSNx999LQChdsQcwu4vL60aQ2FBRbE3WLfe+f0RZ4Ht4a2+HqJ2LqUM?=
 =?us-ascii?Q?G6mTpZfpPcQg3X/dYW2CKHz2rvvAJBkLRJAxg8Yf6PQ+7a7QL2WcDrIYqtKg?=
 =?us-ascii?Q?OW4KcXP2dEfcdIhxtz+7/2GKqlFMguRN1PH+4tPqHpeZwN4GAqwjKI7XeWC/?=
 =?us-ascii?Q?PUcQRLwz0IzKV8Pg/XXOT4RzFKwCq3FWzwfPonkxL9yPM9YNN3UjdKYat1XC?=
 =?us-ascii?Q?lI5MzArYP2aJy3kZzcxtKsuby+8tIhwOlryf80FxKnrT1l13e+XADyY32cWu?=
 =?us-ascii?Q?RSbvABcGrUc9+1h0cL5HzU0K2hSOdG/H7jmTqCIFzRjbRgm9RzJIdo97yYIg?=
 =?us-ascii?Q?Fw09FnBF22etmbsDksQ3wh7dXfTiAziYsEFZI9NkOeWCKwIOCoxQE+HztaSj?=
 =?us-ascii?Q?Hzrh5OXiT5wwLO0EZoIWPob0TdBpvB5JjBYRuiMe0IQD3r7psJ9EK7AAjOC3?=
 =?us-ascii?Q?SZlit5eImwDLuSxG9D3IOFOGYMG/9mXIsownu9rWPoTReMVplibK0kfJCqAm?=
 =?us-ascii?Q?/nt6NCQBHh06J7DDi67zJKTZK/fjmf/YBu+rljCYsehuPhk+hVpzIReahYDb?=
 =?us-ascii?Q?7FrdkXqKBa31ZX2mR7VAB+I9tNMU/XEh6dimnIzW51s2bX4VOUKOMvJSXGs5?=
 =?us-ascii?Q?r3k3dI3HQ8+Xi27NgpBy2Nt7h7OwuLi8fK3VhvaVXoXRYyJOrC7T2FXt3M1I?=
 =?us-ascii?Q?VGgKEv0jc1+D3zqE6WifJCLe7uJHu69JaYWZHtKk9K9TCJY4MAbHKgYdJNE3?=
 =?us-ascii?Q?Wv0vbZbh8HrvVniraIExMymd176K+7tWmb1phBck6EFmvxpYHWuHjiVp4+La?=
 =?us-ascii?Q?fiizBBY7hi0PkQyZfmNdVy3mH/KX6ogTM/xm3Y/FiQ7L5I5fdN45ISQsU+x5?=
 =?us-ascii?Q?B/BkFFSa+DGu0p8eUC6jm+R9PrjhLrtywd8p6jcObRTz9/OErD7/Rv6bzzIj?=
 =?us-ascii?Q?1OXLADJGrA2vSpmqqna+4PTlUzGQWn2DJG0DlxFCylkvCEZ/Y/an8WlZD0eo?=
 =?us-ascii?Q?QEShjpQpDJ7KQlmDbL0pF0NAxTtW4H/Nijzb/1JuuzIp9iM4mccSzxJV5p6j?=
 =?us-ascii?Q?jIUqtLA6Ox2nmpzSTTWq0oQ/fa1MZdvV+Kd8YZCPj2nRD5Y07dhqZXc8DKqb?=
 =?us-ascii?Q?mbJKJ0C2IxuSO7xHbpKgq6H4QbnSMLI7nneCy2Kcw4GlO4P4y5Lu4+dN+FCz?=
 =?us-ascii?Q?4fRKTRWOKgl+oVHjBBZk8kmLDTwj8va7vw+UvlQCBge9TFZBWFmu0jT7w49N?=
 =?us-ascii?Q?3p9pinILZqtPA1M3IuCkw+nRYrG3Dj4F+Z2iCo9KVbG0VUL+PR4L4e+Sg6Cd?=
 =?us-ascii?Q?0LS7uQav2Tg3UqKkOhMT86Lqy8PVemZp/8WyautE0DE3fyvlYKwIIxpUUCU1?=
 =?us-ascii?Q?njfefoKCAmGkkEFKWsY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 07:10:37.7554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e353f13-f802-48a2-e0c9-08de20f16a6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8843

Relocate commonly used enums from multiple source files into a shared
header file to simplify code structure, improve readability, and
enhance maintainability.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 22 ----------------------
 drivers/platform/x86/amd/pmf/spc.c |  1 +
 include/uapi/linux/amd-pmf.h       | 22 ++++++++++++++++++++++
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 5880d6fc3afb..95121d173b41 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -645,14 +645,6 @@ enum system_state {
 	SYSTEM_STATE_MAX,
 };
 
-enum ta_slider {
-	TA_BEST_BATTERY,
-	TA_BETTER_BATTERY,
-	TA_BETTER_PERFORMANCE,
-	TA_BEST_PERFORMANCE,
-	TA_MAX,
-};
-
 struct amd_pmf_pb_bitmap {
 	const char *name;
 	u32 bit_mask;
@@ -684,20 +676,6 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
 	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(16)},
 };
 
-enum platform_type {
-	PTYPE_UNKNOWN = 0,
-	LID_CLOSE,
-	CLAMSHELL,
-	FLAT,
-	TENT,
-	STAND,
-	TABLET,
-	BOOK,
-	PRESENTATION,
-	PULL_FWD,
-	PTYPE_INVALID = 0xf,
-};
-
 /* Command ids for TA communication */
 enum ta_pmf_command {
 	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 85192c7536b8..a2745b4a5717 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -10,6 +10,7 @@
  */
 
 #include <acpi/button.h>
+#include <linux/amd-pmf.h>
 #include <linux/amd-pmf-io.h>
 #include <linux/power_supply.h>
 #include <linux/units.h>
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index bbc45c6fc113..b47eb45196f7 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -18,6 +18,28 @@
 #define PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC	5
 #define PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC	6
 
+enum ta_slider {
+	TA_BEST_BATTERY,
+	TA_BETTER_BATTERY,
+	TA_BETTER_PERFORMANCE,
+	TA_BEST_PERFORMANCE,
+	TA_MAX,
+};
+
+enum platform_type {
+	PTYPE_UNKNOWN = 0,
+	LID_CLOSE,
+	CLAMSHELL,
+	FLAT,
+	TENT,
+	STAND,
+	TABLET,
+	BOOK,
+	PRESENTATION,
+	PULL_FWD,
+	PTYPE_INVALID = 0xf,
+};
+
 enum pmf_metrics_id {
 	IOCTL_POWER_SOURCE,
 	IOCTL_POWER_SLIDER_POSITION,
-- 
2.34.1

