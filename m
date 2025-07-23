Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D5426E6F7
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 06:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252919; cv=fail; b=pBkRZHJjW8LbQm3GqRHGBAMJG5CAV818mwTdvGZLStAaMaOKhkzoOLXkrHoLzbbwmSVM0HWkWoUJ/aUYMfeKkdrj+aQQfQ/SFZ7nWjRk8x/7oAOfHljx1gj55Mk4/gUwP4r7DVRHrNBWS8ItnKNAc9TNglx1xc/Fh8RsqT/eHt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252919; c=relaxed/simple;
	bh=Mw2TvTIR1n2zcFBfTT/J0Yr0wjPJ0i1/GtEuu6AmVsk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zn1Y9lN1gYYD3UjRodrbMMzjI1wY76NxF3B+fhT0+EdaksK9tCubQqTw1pPJJUgE3F3c0+XEyMN7LxdTxDuR4y9wFqPebOFlGyIsI1kT3lPGyT/Zuo5/TrgVn9IHiTAoUYrNDEWTwQSDOyagpkxQmvDBP1E9i/ii1qNZRBV+Gu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TihxnXRE; arc=fail smtp.client-ip=40.107.236.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TihxnXRE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWOgK+fP2mFJEttLqCpkKSrVozcFL/djBf71c9RV0n9WQw0hlM5inTjwSvGGsNyJT9/VD/XZQsv6tiN2HckhwVRQgzgdlJbxGOqPr5r+USX16qoIiRb1OUOoRyuD1rrEnjrgO/01GqzvXT1CpWK9prq08l31OZMcz1Rh2fjsbs/D6Sdl94UN8K2F5LF1vxSMZ9NnI/dGt6VvgbrSgf/p+iKCxEk/tl7u0CxsdLS5cNV7qCONjAqtrfYf7T3MYA/7BMrZ7dHH/G3kHjrfaiejOgA9Dc/HsbvMB8fxV1VYedeOEIw3T4z1wlKlWdHfZVlvZtSrUrbMfb9lm2BvZnOywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/d8+3u3LjwRgp2QGtoSYVAvFn5qASfjsuPMG7Tg9I/w=;
 b=Inx+dJtqIAYnwQhT+OLbh75JV0bH5I7yKaY77PSOfG06ZgUKJhjZot9sMGujqpBkheu93J7mAwVLSo6zQZ9yYolrhPrbOcUYgXHcQb/3UMeDRHqkxXU0GbUx94Sh6SgKUV5QijrRTarTLg+gmABFO2C2tWaXmglvFwMcZY1aNIlAZc+lngSbigaiDF8LEbsAHMGK3ilTgW18wJWVg7N4SgJyRe6GXvOE7fHAAzjPFaE7uIDwVzm661TdQpDvaEcahEC83DiYCNlclj/LpvjK+/viOu+1xdgb+YdTDqml1MnWz6Fr4oHj8gUoaUc0Ne4nkgYtoyNvkibBpypyPHUWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/d8+3u3LjwRgp2QGtoSYVAvFn5qASfjsuPMG7Tg9I/w=;
 b=TihxnXREdoDGLMcpg2kAbneA1U3/zRkyC6UNsjTYS/W+HeU46P3KmUoar8bkdUFIuvL3zjxePj+kDBm0iWowyvyPlpkrrOcvO3FcpyZb95cziWb2uf6ZLtSzH0389bsTMfvxsCM609DeBh4vV2K6OQVMO20s1tOi7FmOHuVe980=
Received: from SJ0PR13CA0019.namprd13.prod.outlook.com (2603:10b6:a03:2c0::24)
 by CH3PR12MB9171.namprd12.prod.outlook.com (2603:10b6:610:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 06:41:53 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::8c) by SJ0PR13CA0019.outlook.office365.com
 (2603:10b6:a03:2c0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.5 via Frontend Transport; Wed,
 23 Jul 2025 06:41:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:41:53 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 01:41:50 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/9] platform/x86/amd/pmf: Fix the custom bios input handling mechanism
Date: Wed, 23 Jul 2025 12:11:14 +0530
Message-ID: <20250723064121.2051232-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|CH3PR12MB9171:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0c7695-18af-46ac-b7c1-08ddc9b402d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KfODGxBoZhVr9Cs/k6zk5n4Jr0WcXoxdvq+ED8b7woime4lvs9rTAZtjEvpD?=
 =?us-ascii?Q?Gf8GTp47GkfU534lc+PRL/OAzTZ2MuSBIGCUu3Zmn8yWzj7LHiRU98ihm/J7?=
 =?us-ascii?Q?t/bGHuRnXVKl2YBAUIiP8lVWjSAg+tCBato4DyuCg+SD3ZlyOt8erqSNAwtw?=
 =?us-ascii?Q?wWH/w7fTmByeUojvb+gmziEZPVnjQDg7tLVLVwXQ0KRQWkCIGREd5VnW43Vv?=
 =?us-ascii?Q?CMbv9pMaEUtmZAhSphhCcLP8TGI4gZEviTnl2fE3eEKy2WxwhvMw98/MLREt?=
 =?us-ascii?Q?uEx1uwP1QdqZAtwYYHGRbHS5udaEvq/RJRZm1AIBXIUVFGxDdf7674UAH5V4?=
 =?us-ascii?Q?lOF9JblQ8cUHXEyONdWM6MtE0wmKln8f6Gcl9kwLVciIMeuORzcVDzxmCrz1?=
 =?us-ascii?Q?Y0ai5HTRdajSq2bLEmJYgaVLDZbhSVB4/ppCeyYw5gMlT8G4DG0dTpLjPPpE?=
 =?us-ascii?Q?BIc8nvnfpyHMMUyro9zMCvG60ehJMkKIxORnDjDtQg+2rCZxABSNXKUDIX4a?=
 =?us-ascii?Q?pWLfyjPtil5+ce/zQTGV9bEFUtoheAZgG9+nt9h1ZU9frWR0vLwvxgk63ZOI?=
 =?us-ascii?Q?XNFtFRpbW18jJxSf3V4J6yaLRiffjrTD80wIx4wmordXKMEMfDahRUm+zgCc?=
 =?us-ascii?Q?D7MnaCIdVpvfHEPIL+DQwPkFrnwlMl+BFKdYu0gPNvURGLRxztIMpmRhhIob?=
 =?us-ascii?Q?ZooNcsMG8Pw/DeDCM2krhsKvFQvxVkbgBYFiMiI7E+VsIyMh0Y6KRe3YHzM1?=
 =?us-ascii?Q?UpHFhKYexxc1E+Ag4gUvmIVwv7xMlZSs4R6cMKoUUuwB+9nwNHwE6oeNKRTP?=
 =?us-ascii?Q?k9vM2GecnaJBE3IJf+bDv1FA8uQ51CcHLwGmYwy7sSKt8E+B10y9MPLf6e66?=
 =?us-ascii?Q?H4o8pG2lzzeKFdB+GY2sgoI1xlOq8sGI8MSuvYKAuJmIVyksJhE0iZ9DOJ0R?=
 =?us-ascii?Q?FMnnXHxbIqfCsq1e8CTGu6YKyQevol2ATK1jE8IDIveZbiuyyE0nCqmMU+8H?=
 =?us-ascii?Q?T3UvWc/ZjAUnsYfVwCzO+0JNACSzkxmfGFPM9xINOKKVttbUbf7rJUuKh6kP?=
 =?us-ascii?Q?E5aNS6PvS0b2BVWN2LREAcfSMpXfPORrM0yIGBOEHZfbq4m7YGj6pMZN+55b?=
 =?us-ascii?Q?s8yfvZdCI3q1JBLDGrQGiAfgRX9FppF/4pdP1ID4Pjvrn7wtkdIFRt+VZ1OD?=
 =?us-ascii?Q?nU4o4mx0YgLsq6jc+pcqYm6xpuzLUPthDCLJlNifFAp7VzcFgLn+bt4TtZyA?=
 =?us-ascii?Q?peGBMdAEfYs7SWRQzOJhEpPgZ6RX6L6/+h+6GdTqa1R6JWkn3B1rGO7d8TMU?=
 =?us-ascii?Q?TO/GWeMdA2PgH6xwRSnh9hyZ4N54niMousecgaB1zTTQxl9y7ZvZt01kRD5I?=
 =?us-ascii?Q?SQjJjpZ5IJZ8ZvaFtqaFbfiviURHWCQUGvj/RJd03HqHhWqfKYpzV+ICrGia?=
 =?us-ascii?Q?WYqLqFX8sZ+aXGuHLHA1IQYQr/bGGzCtAbSsOfaftxWXlx6Y1STpyeTdRAAc?=
 =?us-ascii?Q?3r/z5paDQqh59prAJshAxdCdmdXrWxrr0KPs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:41:53.4193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0c7695-18af-46ac-b7c1-08ddc9b402d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9171

Originally, the 'amd_pmf_get_custom_bios_inputs()' function was written
under the assumption that the BIOS would only send a single pending
request for the driver to process. However, following OEM enablement, it
became clear that multiple pending requests for custom BIOS inputs might
be sent at the same time, a scenario that the current code logic does not
support when it comes to handling multiple custom BIOS inputs.

To address this, the code logic needs to be improved to not only manage
multiple simultaneous custom BIOS inputs but also to ensure it is scalable
for future additional inputs.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 15 ++++++------
 drivers/platform/x86/amd/pmf/spc.c | 37 +++++++++++++++++++++---------
 2 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 1a5a8d70c360..79defe2c91e6 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -623,14 +623,14 @@ enum ta_slider {
 	TA_MAX,
 };
 
-enum apmf_smartpc_custom_bios_inputs {
-	APMF_SMARTPC_CUSTOM_BIOS_INPUT1,
-	APMF_SMARTPC_CUSTOM_BIOS_INPUT2,
+struct amd_pmf_pb_bitmap {
+	const char *name;
+	u32 bit_mask;
 };
 
-enum apmf_preq_smartpc {
-	NOTIFY_CUSTOM_BIOS_INPUT1 = 5,
-	NOTIFY_CUSTOM_BIOS_INPUT2,
+static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
+	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
 };
 
 enum platform_type {
@@ -690,8 +690,7 @@ struct ta_pmf_condition_info {
 	u32 power_slider;
 	u32 lid_state;
 	bool user_present;
-	u32 bios_input1;
-	u32 bios_input2;
+	u32 bios_input_1[2];
 	u32 monitor_count;
 	u32 rsvd2[2];
 	u32 bat_design;
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 1d90f9382024..3e3f5a2473bc 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -90,29 +90,44 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
 	dev_dbg(dev->dev, "Laptop placement: %s\n",
 		laptop_placement_as_str(in->ev_info.device_state));
-	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
-	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
+	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input_1[0]);
+	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input_1[1]);
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
 #endif
 
+/*
+ * This helper function sets the appropriate BIOS input value in the TA enact
+ * table based on the provided index. We need this approach because the custom
+ * BIOS input array is not continuous, due to the existing TA structure layout.
+ */
+static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int index, u32 value)
+{
+	switch (index) {
+	case 0:
+		in->ev_info.bios_input_1[index] = value;
+		break;
+	case 1:
+		in->ev_info.bios_input_1[index] = value;
+		break;
+	default:
+		return;
+	}
+}
+
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
+	int i;
+
 	if (!pdev->req.pending_req)
 		return;
 
-	switch (pdev->req.pending_req) {
-	case BIT(NOTIFY_CUSTOM_BIOS_INPUT1):
-		in->ev_info.bios_input1 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT1];
-		break;
-	case BIT(NOTIFY_CUSTOM_BIOS_INPUT2):
-		in->ev_info.bios_input2 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT2];
-		break;
-	default:
-		dev_dbg(pdev->dev, "Invalid preq for BIOS input: 0x%x\n", pdev->req.pending_req);
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
+		if (pdev->req.pending_req & custom_bios_inputs[i].bit_mask)
+			amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
 	}
 
 	/* Clear pending requests after handling */
-- 
2.34.1

