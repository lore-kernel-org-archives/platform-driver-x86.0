Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0281E5205
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Aug 2025 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756530050; cv=fail; b=Bl6EDXwGLknV2/osPfYA+e9KMha902BGc6HhPqzt3RIWj3pV2PBT22L3WLXfPAF99KeUGpI7WH6vXh4sXhCyJ60GtROR36ANuNPoznyDpQ/pYdhASxvvjblsSmS938RrZcl7FRfo308VPEDGmo9pdmmhyV55//Y08/EUybojIuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756530050; c=relaxed/simple;
	bh=P8h1kxxVlz0eTLBK4i8tSwGX7fUMzKc+6yajYN+zMFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GjVKb3r4jZ3fUNRajc3oa5soTHi9KuXv+6YnKU58tkh3d/U7Ymes+X7AxIociuOZ4p2qnKq4iWuDQEsym6WAePz8a1FVB66UxNtDVPVpxQ+Unpn81sGMdYNoVlSV82j0RxM7uR8NJsROa2VHl4wJp3vQA6eesgR7AviI1WSLclI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WD7sduQW; arc=fail smtp.client-ip=40.107.220.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WD7sduQW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YP2vKSVlZJomm2v6UvhkYwBbzBRgYJm86MPJNQcuUAcjwTtIN9eWJL5tfBr573u2Ov65UdYZhni0UjGnQko2vdr7PSvYldulPu6WkBlVsP83E2kHJ5oEmpN1xQs0hTnezC0jLeXn7hpSDiiSOnaT84NPqPGPlwZErYPpUHprf/JNw8+LjgnXxex6qzX7v/bBRpA38HlFsXtVUT5VSwBFdz/TrDe68ywTvUhKUDSbosCFEHmfzNgi7L6STZmESfkDSa4v7MtPcG9dGRMK0D6i8u7/f3GgwGdOnIEZUfL8Z0lAmLLhq0wwp5g/QboIfIlhyx3G8v+UN6Xk6z8aJvyTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCMEmctqrQ5+NtrEED8OIypoBg8T3jj3Go2J/Z0Wfrw=;
 b=DWcMHdzC6TdFa9IHrc3r99IAyQqh8TnqH95zC9EhwkdtU9/c39l+F3aNs/3rmPXJMImSUhLW1k2Gloh5aaoXGFOhNbUZyxPlvpzLXIRebxdTSU4IxRgEmXPwNj0O85/SbGfvnYKcH91qhFrFOJ25mdJ+Ekpm9XKLPieqAcwAIIoPMi4+WpaFkB6t/gQ9tHDWgGUpGrlzkKt/HGiJg19uIpjA6hT5ES0ZsOHK9Y/KkO08koIhYE2qtSirG8VmIy12RUGYlK+4UCTtALWWuhBs/2lhP0x0nV+Ik4bO39kHaNzNfp2Upnn8u+EocB8dc7W4U1EchnVxEAIINaNhPAOlHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCMEmctqrQ5+NtrEED8OIypoBg8T3jj3Go2J/Z0Wfrw=;
 b=WD7sduQWqdsXzXJKjiuf/8hk1YmbZdO5LoDBfuSk+rvdcFlb81wxBIr5Cusq4Zs1LT6EhoUUQ3AzNFrxdS9iBjiLaukl6X4xFv1PDkYhuBBzN/7GjPUg+5jLATVjCc6C4e/xOEC/vGFKyXOZRhZT3RBgeVwbepZcv4l8NuqCecM=
Received: from SJ0PR13CA0235.namprd13.prod.outlook.com (2603:10b6:a03:2c1::30)
 by DM6PR12MB4385.namprd12.prod.outlook.com (2603:10b6:5:2a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Sat, 30 Aug
 2025 05:00:36 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::ef) by SJ0PR13CA0235.outlook.office365.com
 (2603:10b6:a03:2c1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.10 via Frontend Transport; Sat,
 30 Aug 2025 05:00:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Sat, 30 Aug 2025 05:00:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 30 Aug
 2025 00:00:35 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 29 Aug
 2025 22:00:33 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 2/9] platform/x86/amd/pmf: Fix the custom bios input handling mechanism
Date: Sat, 30 Aug 2025 10:30:02 +0530
Message-ID: <20250830050009.454739-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250830050009.454739-1-Shyam-sundar.S-k@amd.com>
References: <20250830050009.454739-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|DM6PR12MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa5a388-c74a-473a-5f0a-08dde7822833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5OosuUnKJ/BftpkEGiScpPupeSgZV+6dZZT/nDfpjU+GCTBNuAx9SgpPW6AA?=
 =?us-ascii?Q?klQ5Ua+nbQP5UiMWedOJzRjr1whqhJggX5ua7VzIoDWBFh8WlWEoHdDR+5FI?=
 =?us-ascii?Q?dxWoBYiOIc+HQbUyCJsQmP5/2DhlSA07BN7fjMMwqraO0JIoZuCPxhxptVWS?=
 =?us-ascii?Q?4cvjaY/FmlHKA7gjhmka7HvwrMKVwbNnU0sRiq6BMT5dAT6SgvZCJVSlhEwx?=
 =?us-ascii?Q?BKq4v+9DhwXkLHNZ8iOdl3WT2fTaPj6eC35lYssuZxPjr6905+IqiNBLRQ25?=
 =?us-ascii?Q?I21Qo0DBE6wWxrmPWr+xdWPtNKE8qaAvaRYJtKLb4SrHjHLiYDxWnkz3X+In?=
 =?us-ascii?Q?vFmOXS+DbozQAzaG8PJL34a4V8RsUUC2TaHs1EZPULZdHBHYZe/+oPNaj/YF?=
 =?us-ascii?Q?a5cPoLZGlozzkSZ+cX540eNDvKbVHVJh5zCwLTJ2l7e/lCEmgTMODWEPeJb3?=
 =?us-ascii?Q?XRUJz23G3D3M4PagjtPfxo2spIJLR0r7B/Ng5a0bx0M1HudgYnqiZtdlDkxB?=
 =?us-ascii?Q?ANinO7hQ/NFzRYEqLT+y8Kc3k7daIJ1mT3s9d965e6eKsV5KKzRkmMcdxZcz?=
 =?us-ascii?Q?M0HNcr/5Hkm2rbretBNLx5Pr3r0/VkRxcg6pz3ymn+3bSQm4mDaWJv9nxD9+?=
 =?us-ascii?Q?uKj+dEbiB+RXjQmqoJrMnV3KH1OocrxLJYAv7Oh68VxJj57Q4Cd6DIjyX46l?=
 =?us-ascii?Q?OdpX9n35edNiTZ8GzHoM58lEKCMr7RNsyyIU4vb6h23Vf3TCkrF8CyEbagdh?=
 =?us-ascii?Q?O8GtvhXtSuSXrToZKCwFcTT3fxBQXnqVrDwcNR0FrT9v8rE9e83SHfvji5Xe?=
 =?us-ascii?Q?mp91BZUsqcBtDDGjt8VatPpRWZ6+4IazyHNs57fwgl9V7DFHAVJAFKjbdD2A?=
 =?us-ascii?Q?1vtxlPhQGgKlxyCuIhvB/fhn9yoQ2TCwyVckJ+ekteORzuPITMnsbK9bjtXW?=
 =?us-ascii?Q?Az8U0fuve2u0IZw2QpY4spCA8cYTyGU6BO9e9ArchACwPgR9q5h+oXB4WhGT?=
 =?us-ascii?Q?teYbB8pVkdKqqt+TKq5voVy6nlOCSYlXu2SX5nNe5dPhPyWbqvFkypsQZK6V?=
 =?us-ascii?Q?XRN806x8iuw3mApEi2PCRGThXcL8NzMS3xSSSgj99lSaVOYe7akGCWnjeB7z?=
 =?us-ascii?Q?xVr7fPQ3RHkZx0w1ac59eSIcMjRj6JLVRIpLn7jIOJEGstJF5sQx8JJxhbgG?=
 =?us-ascii?Q?1EO94lr3JuQKQjG3Mc6AsdcDKfaFFeQif6JUDjoJ7UCyjdE9ah3zSPhbdYsQ?=
 =?us-ascii?Q?RosEDlRjYZQ0Hf+z3xytsJDX1FYA1VEse9cjTI98ARhm0sUv8ZAIREIFJuYG?=
 =?us-ascii?Q?A4/mg1QdQ9nck8JrWyGjz72CqKHa4aJNlhHjIB6H9TTBFRw9Tumv8JduB53Z?=
 =?us-ascii?Q?bQpnCS5ZneIS+tsLVrNS2hOMvteQBkRf0QncEfdPyLB1YYxwhjmOa+BVdYCs?=
 =?us-ascii?Q?hSTJOdHLCONilbGCc0Q6rpiWlhumI8mAPV1Na1yb7p+RoFgow+8obwwCf9Bc?=
 =?us-ascii?Q?fd9m7FzQ9GvoFg4P7oZeRc+pQJq6a/Tul3G8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 05:00:36.1363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa5a388-c74a-473a-5f0a-08dde7822833
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4385

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
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 15 +++++-----
 drivers/platform/x86/amd/pmf/spc.c | 48 +++++++++++++++++++++++-------
 2 files changed, 44 insertions(+), 19 deletions(-)

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
index 1d90f9382024..869b4134513f 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -70,8 +70,20 @@ static const char *ta_slider_as_str(unsigned int state)
 	}
 }
 
+static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
+{
+	switch (index) {
+	case 0 ... 1:
+		return in->ev_info.bios_input_1[index];
+	default:
+		return 0;
+	}
+}
+
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
+	int i;
+
 	dev_dbg(dev->dev, "==== TA inputs START ====\n");
 	dev_dbg(dev->dev, "Slider State: %s\n", ta_slider_as_str(in->ev_info.power_slider));
 	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
@@ -90,29 +102,43 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
 	dev_dbg(dev->dev, "Laptop placement: %s\n",
 		laptop_placement_as_str(in->ev_info.device_state));
-	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
-	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
+			amd_pmf_get_ta_custom_bios_inputs(in, i));
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
+	case 0 ... 1:
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
+	unsigned int i;
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
+		if (!(pdev->req.pending_req & custom_bios_inputs[i].bit_mask))
+			continue;
+		amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
 	}
 
 	/* Clear pending requests after handling */
-- 
2.34.1

