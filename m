Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B35244685
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 11:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724536; cv=fail; b=d8yqkoD1FxQSbbZHXFBuxxBNNq2ouCKFNB0BDQjuxm6kxqhJiYrZkF7AFKVW/t0JXO5X1EwGM+3m2lor2XdRIt9ZfZOHcsgflowDsiJRnqlcUQ3tC6HeTysWrRVR/BbMBEF5DeVYwJfeIaogGJxy0IZWq6sTQK1NqBK2Ta2kXwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724536; c=relaxed/simple;
	bh=kdmACCpNgBimmejj2nWizU/n7zYQzsxAOr/RlG7GbUA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r3+daRnTfnH8Tsr7aZUv/fMjinUSiz5bVcD3k9/slbWgDsTMDJ4a/IfOKVJcHGABOnC5v6h2P9LqPDJ3DIIWBg3BBexEq/tx5XUxWUYsN2EBS/dAdvVQJ/iqWNkXGcx44hpAKdA6sNVgCrViPPXWDvUbXMaO5G81tgA8qnf+eHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=muVQYMNc; arc=fail smtp.client-ip=40.107.243.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="muVQYMNc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyC+0k8wjzioqmZ7NIMbxPimj4zUO+lxq1Chs/rtTFf7NYC8VjjRQtDJ0VK5XJCPwmbDtKPyfp7KrCsaoDwBfHPToJKJbyhipQy6nyfCoNmB8eKOjBW/nCCpYHuBHmcZJdftmaqMBWXDu9PYfYV2tyy8qGK8eFU0ljciEPkuo+35XSmnLHcxHeZ0r60+Xlp016uGapUfvA2aU6ZVb6nzH+NjXvBkqnKxQVpHe0KTSbDijekNhL2lo5noGRbbiz8GBnmaTm3g4rY0M1zKUfUF91EpSzw8quWDoOjEHUWrQFj2TEuPScl8fa3ORa7lxE4TKlPBQWkr2e3CzZ1EIXfumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SObzcSGyADUqDcaiq5H3IaKEkj6i1llcRWqA/CanyFw=;
 b=xR3uTlq7tO0a4GqyZsgHM1T4Gwxyk25r4XIT2UDRYEsH1L+gnOFWy2ukVO814xZDr0QuLcY+DthYs3T3VmwrPCDhLKyQHkK9fgsrLmuibmn+cuoYx6VnkaLlbM/f/qcOqPoUstcuMcXL6XGx6WRpEAFhvepaW8s4ZSx9/Z0NqAj466A2w3UkQut5Dw9RWttVwqbRvi6c7TmRRZrSBICo1PaldCUul6wPSRf0S4izq5E2XftHnVn1nd7IvIXgkHqPUqwTxIEshZgRbuSdTJ3GIJbrIxyPdloh2Z899Ssk2utJjxT2K6AjKdCSuVfsqLSoV8KM9RkP7FVm4m2sxO7Duw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SObzcSGyADUqDcaiq5H3IaKEkj6i1llcRWqA/CanyFw=;
 b=muVQYMNcub341mSkcZ75V9a3X5x4fkUB6cK6xLaRBuQhDbwruhJTpx51w22RD/7FPmOh91Kw6G6qGnyMKcMWGGp+fUeXt1TvTrrbLeCx/arL3t+8CiRRm0iBjnogFTtU2L4WFKGd73fdV4LkRvz5agIKYvZtlaCqYXKJR29gBJQ=
Received: from BL0PR05CA0030.namprd05.prod.outlook.com (2603:10b6:208:91::40)
 by CY3PR12MB9704.namprd12.prod.outlook.com (2603:10b6:930:102::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 11:02:12 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:208:91:cafe::1) by BL0PR05CA0030.outlook.office365.com
 (2603:10b6:208:91::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.15 via Frontend Transport; Mon,
 1 Sep 2025 11:02:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 11:02:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:02:11 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 04:02:08 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 RESEND 3/9] platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
Date: Mon, 1 Sep 2025 16:31:34 +0530
Message-ID: <20250901110140.2519072-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|CY3PR12MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: d521b75d-82a7-4a55-fed1-08dde94700ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k37ef1uGEcatO93dGx5HCVp+KDaLZQZ4v8wVqcePbKNUsgfdzeT6wn3lvVXX?=
 =?us-ascii?Q?BeJyrrS74tgQNQO7mq4ljV/gWlOKvUJ2Aho2IpIVK/QTFb7kCPTkvIYQQdf+?=
 =?us-ascii?Q?DJ+VAL5+IzvwkIug1XMgaFEeBoWao7Y9gGqAGUFUQfWpMJBNfFLvl4J5ieAT?=
 =?us-ascii?Q?9bhXwwpa8LnS06DDMYXUfBZKVsvxsxC2P+MLLUTKsjuNYMWoAeFvNjjQQV8z?=
 =?us-ascii?Q?CMIB/d7ZG/3sYDYi1qtTKaOlRrQDGZ7QZskWOY/zXmwh843K0P+Fp1oy4PDj?=
 =?us-ascii?Q?e6iIcHeaFbwJ+tMcukBYXUdKjup2hFRzlGQCUaYUJn54u7DpFENzeB22v7kg?=
 =?us-ascii?Q?Ob2as9Dw17Bi2KSi2VftZiZBwWvy9yMHqNsBBOAC44BNI0HnHtqwi6EmZ+YS?=
 =?us-ascii?Q?T5AUshvfRgDF51SYcbYd91Ot3/WHbSkJcdErrya8gGdyEfeXAWDKvQ0gvh4b?=
 =?us-ascii?Q?SHJBEpqLmaukffTPM/NIQ/HAq73u2EMzFjulBp2Z9yJSFZ6vj2M95UT2qOZa?=
 =?us-ascii?Q?0DDSp/3rQjR3hz/WdiH+6devPP60mNkVEPhR737Ya0h03PPKkQ0PsztkzzXC?=
 =?us-ascii?Q?74rZeq2krCSRqqZGy+9capOXvz8ogZnL3roPVDYmNg5r8ptFBdoip6hhlNUr?=
 =?us-ascii?Q?rKZVwAVs/3fHIkOjygxP5dl66ISnHGtk0UIbeBT7QE5+lCrhuroLxyliwJAy?=
 =?us-ascii?Q?Jy7rHPXwUivnRKomkLByUvRpIW+JXBAc/R8AZwwPY0Q9ala0bGg3b8vx+L2N?=
 =?us-ascii?Q?dy+sEvWzU0TGbENnCFIhDBtD8e8Ymcw98GVdsqsUQmwiqjudNIAV/FZBA8kn?=
 =?us-ascii?Q?H+mIoTkXOZceQfFpKwuvBX4NoIObjn+RhZ4KtYdARUiGAEMrM5hQfx3LXj7d?=
 =?us-ascii?Q?FcDo+lC/9T4Vq/dudtfHdYmKsIgKRzoPAEJKPcma5oVR2Vh3Z6/GA9SHG8fq?=
 =?us-ascii?Q?M/VhhcPcusUTcYODfPDtImo3eT0AaaBLAbVeR5FoOLc81xgXCV4LrmQee9NZ?=
 =?us-ascii?Q?AVLjCvfNdiQHtV6NUhFNn/F7xTX/9rDmwySPITDistOFOf+2C+Fr054IJijH?=
 =?us-ascii?Q?qMJ3LTynIhwr47Tyydt0qDFom8u4Av8bD+vqsX6EQA497NZrPqFObk/1//Gj?=
 =?us-ascii?Q?nAiPqSpVepXPGce3WWWk58FYQat+oEmwBE000bGeCWZDkuToWbZ8PpNmEUye?=
 =?us-ascii?Q?rzFpVfdm9C5gqEOjI6263R1AsT/Hts5c8TDy7WJMX+yU4J9RwB03DxLEm2nB?=
 =?us-ascii?Q?jH5uHzAdmivDWXRWYvQS2LuuCq4Zh6vSlFAGtqNizuC7t4b9d8aaTi9USLaw?=
 =?us-ascii?Q?61Tl/lBB2jyBoEu5qytjLzQD4OO3c+dol7WjbmVFjgLtFQ7HaoLo/n4SoGaL?=
 =?us-ascii?Q?C9rgBehl6xu86txRJZqyMJ4XOhqmbXa5pUiF+KzHpsHfaTgfyaPSHLAqp9cs?=
 =?us-ascii?Q?iDpZvxQe01O6aV9SNcgzscIZuwRv4lbuZ/BJs2latSJwAm/6gKy0QmH/ktKb?=
 =?us-ascii?Q?5hGKkOaDpk8LebNgebFo1UbAcqBEk6hhfBXe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:02:11.9333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d521b75d-82a7-4a55-fed1-08dde94700ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9704

The existing amd_pmf driver is limited to supporting just two custom BIOS
inputs. However, with the updates to the latest PMF TA, there's a
requirement to broaden this capacity to handle 10 inputs, aligning with
the TA firmware's capabilities.

The necessary logic should be implemented to facilitate this expansion of
functionality.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 12 +++++++++++-
 drivers/platform/x86/amd/pmf/spc.c |  5 +++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 79defe2c91e6..2fcdc2493552 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -631,6 +631,14 @@ struct amd_pmf_pb_bitmap {
 static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
 	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
 	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT3",     BIT(7)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT4",     BIT(8)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT5",     BIT(9)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT6",     BIT(10)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT7",     BIT(11)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT8",     BIT(12)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT9",     BIT(13)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(14)},
 };
 
 enum platform_type {
@@ -714,7 +722,9 @@ struct ta_pmf_condition_info {
 	u32 workload_type;
 	u32 display_type;
 	u32 display_state;
-	u32 rsvd5[150];
+	u32 rsvd5_1[17];
+	u32 bios_input_2[8];
+	u32 rsvd5[125];
 };
 
 struct ta_pmf_load_policy_table {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 869b4134513f..06b7760b2a8b 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -75,6 +75,8 @@ static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int
 	switch (index) {
 	case 0 ... 1:
 		return in->ev_info.bios_input_1[index];
+	case 2 ... 9:
+		return in->ev_info.bios_input_2[index - 2];
 	default:
 		return 0;
 	}
@@ -122,6 +124,9 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
 	case 0 ... 1:
 		in->ev_info.bios_input_1[index] = value;
 		break;
+	case 2 ... 9:
+		in->ev_info.bios_input_2[index - 2] = value;
+		break;
 	default:
 		return;
 	}
-- 
2.34.1

