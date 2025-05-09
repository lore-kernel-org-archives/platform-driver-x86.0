Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3D6A55
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775675; cv=fail; b=s3ywjiW0pVv8K3jZkCLcIkqzuIaCpmpVDjIxnW05l2IcwOhVbVpSLJEXWm3vOnM/U8amedBIlw23xjV+jQj1NITvwMvvjoJ8u/8r64JbJj2ET7DT7Bq9pyX7WPElvfzqoF/Dcp6Dj2gMR+MQycRqyvWG+TYHVu2DMQ6klsUmrQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775675; c=relaxed/simple;
	bh=+QIU3dyYytHRvsk01jgPi/4V/PtLdeA/r5sSPKlm8aI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nvo4bszHVq6u2LOiBOxi3fGOHJzqVI+wBFb7wAsQp9JfGqlMKtMn0bMOWIht9q8AqZmAV+8YEUA3nz93exYqAHMejkIgKGCiG5yoKpKkPMr1BAoQg4CRj1Bf3v4JtsBlGSN2bjeo3Ph0eKL1R3hDnAtpaHJx3qfJJCiZRwu4yLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AhJm6hLv; arc=fail smtp.client-ip=40.107.92.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AhJm6hLv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6svw0Xo7diV3SjlmiAAAV2/F4ZQHs/tGQcka7CEpBKlqXQSEVvIbMsM1u5NlcUOXjAO9qDXfQUol+3QUVX5R82vsqXavYj6lTQI+qPUwZiSCgkhyzoHXocr0Y7MQ9TnKVAPISiFPcD89weiVNURn+YbvMGnNoyg8khIczH0uvxvccZ2IcsUAIHVeeFXGEvI6oPP7VDoA9CN/D2duLe5x2euVY/409bdRQGYdH7xIGxnNOSp67ARtz7y2yOA8yLvPri9ZGUPycT3te0ENvdJ0Oqe0fnLVOAaDUXjDKkdCte+uLpmc4NeVlAixMnKdv8v5/TSU7ilEpDVJHSE2CNDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2rVe/ksr5hZR2EHu0o/Z/3jV2uyJYqrVCmFZrnXsv0=;
 b=EsZpWOJs4OYQGDwX5YlBjhiOyWUuPX9orBAAFXw0DEoLtOqshNmLEsLmx5/lArpI/vPqU29lxuzNQyRVga+NZs1mNsZRtRJn6G9IoC0MAnLQwoIkIg5AK15I9IbBPXfpCO1m+DXzZ3NROM9ozw+7yFf8hT66MwmjN0AvwQJbOGmMCDUoEqHjEMM99+C/TT6KZYT+xwb3GPMMpILKsagzwyQCV6+inbie5BFy7OZzSEmgxXklFCqKHlev6TQjLbusn48lg2ACur0cCxUchl3aeO0pfHh6gTdK8qrvykWFq2l3crQgVWS3mVUIl8KW2MXc+fpi86AdPAYx/DP/xQxFlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2rVe/ksr5hZR2EHu0o/Z/3jV2uyJYqrVCmFZrnXsv0=;
 b=AhJm6hLvGtu1xzgGOGiiTV2CqLHdf0OMJTqeshWk+0gE0FPNFOCjN59Zv5QrzNcFZut02Jq3r0bkEVPGWjJ5FKQFEAYtaSlSlVY0BXtY2yPwgyMF41hgCs7hXVJxKzgduMYbJZOu+6n1ccQA/BYEHa8lznQKL8Ke2bkOcAIadRI=
Received: from CH2PR18CA0005.namprd18.prod.outlook.com (2603:10b6:610:4f::15)
 by SJ2PR12MB9007.namprd12.prod.outlook.com (2603:10b6:a03:541::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 07:27:45 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::3d) by CH2PR18CA0005.outlook.office365.com
 (2603:10b6:610:4f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.27 via Frontend Transport; Fri,
 9 May 2025 07:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 07:27:44 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 02:27:41 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH 02/10] platform/x86/amd/pmf: Fix the custom bios input handling mechanism
Date: Fri, 9 May 2025 12:56:46 +0530
Message-ID: <20250509072654.713629-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SJ2PR12MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: db898313-457e-4a78-c64a-08dd8ecafd9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MefRbe2KbGcCPMidhXrJwiZob8CwyY+WwDQ8t8waAtAz6vhBh1kF9/FUtrn0?=
 =?us-ascii?Q?fU+UklKTgx1RcB97o79JmfmYq0ZZqIgF3pduiDTvyicSixx67aFmW+E84tLj?=
 =?us-ascii?Q?g2FZgrUCUsIz4L/1p2L1cUd31YcV0PDknYtlFi/wC2u++/7enCsa7eXMzCI2?=
 =?us-ascii?Q?NT3naHOrEIWUQTl1Y+njNvJno0f7d/TZHJcoYv5FK1hnT6Zm7fTYoz6ysBJT?=
 =?us-ascii?Q?P5F+Lk/AX6au02yPcsc98NK+34DdJCetA+uo01jLoUd6AC3gO2S6eCNHIKH6?=
 =?us-ascii?Q?Ip+PNcZeX4x37JpkWWgrRp9yxIPIlS5U8yGxYWQCqK2aSa4etsK8uH6omvGT?=
 =?us-ascii?Q?mV3OMUUy7rKjtdMB/+f8/wk0FFycL0x8fPtnJ95w7XRGfSAb1DN9Z8hfW5K8?=
 =?us-ascii?Q?O+2IV6Bf2IC2Zz4Spk9uY7A7dTwH+GOxXD7nDdfqT1to+97T5KnbRCZqsVrW?=
 =?us-ascii?Q?YsXNyf8VhUNDp4o0SyVbfbo+tDiK+WPQOjC0abSVp7yAVDWLfZ9FHyRzm/Jb?=
 =?us-ascii?Q?ziwgG6CsLcWbceC+uGw59kjzpIXbkKabhJ4f8/F50/LpbWvDMC/ZVRkg632k?=
 =?us-ascii?Q?mZEhomBPkhTFkyZlfO1qqPj9FP+F4SecRZbtROAA8k2cPqysO/pVE8XreDrv?=
 =?us-ascii?Q?LnLrVGZPvKGPBv0UwrW7jpV+w2nkXLdpmRHeor9gV/M7/T8EkOmsJIRiCGfy?=
 =?us-ascii?Q?0BJdumoF6H5BZrPsNhkY9U9aTj2I28DsIqMmjxNAsGzbkrDnjteSEMd+1iEm?=
 =?us-ascii?Q?eHkEnyMWkFxHjzlKUJJzeIN3dnxTK3CR0Cpaj7HaipBPZnb1vSxEKg8nexKl?=
 =?us-ascii?Q?gGOm1j5EZCFLLhEO3DcWc4x35ubrK3ktxdw/2H19TmDMXWla8Hbv/RpRHLXH?=
 =?us-ascii?Q?Oolf0AJY9tiGE7m9NW97zEvTTcE2brD4t+fE/LM29TM0XdclyjYN36VoxtSt?=
 =?us-ascii?Q?xF5UQaglYxlxctGpKxAXXiopLF3lMpLCAo9NsmvZ9yf0P1da5238dbYCCAF0?=
 =?us-ascii?Q?Fr5sLE9bh2sm1/Wft00bTey5LnSCNBz56hiAZfBxFl8WFwn3470oe7IDlstz?=
 =?us-ascii?Q?FR/xYlSfldrwpstJ766La6CfxGEaObgUZ/Aq+zZcJy03Wo/KZRnoCf0b3EW8?=
 =?us-ascii?Q?cHP3RgNvVERMcwWznTEGbhqa0UUYDZS29gmI+IVhovGjY52w+cJqWKKnq2qA?=
 =?us-ascii?Q?rbgUuI/tMHbZpyrKzrTcM8u8ieP7rqQmqD0Bn5ym8M7eCbzCs20PJwkHxsZY?=
 =?us-ascii?Q?mUvIOpDB/QM0mQVluM1PcQlSiPunS4ys60zu/hkrqoHqY7nQU+wLAeuvd4jO?=
 =?us-ascii?Q?EGRYYQEwafY4cyTyb8bW14IHgEM9arP31qLAbjXABxR/lcLrVbQyKzTKJ2E+?=
 =?us-ascii?Q?XzQCN0ONA0DdsDRf/8YqOZh+0wG5+OShLC7R6XCvssyfzqEJtWHNA0DQni2v?=
 =?us-ascii?Q?q4+RPtgTAoxyjxvxbsrsHIVqQYh/+cEF/rqvtGuBa2dAEJ+OJwJLqm66t9Bv?=
 =?us-ascii?Q?XcQ2Uo2gCzTan1X18b6IKv2tGIRE7BZyG9Y5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:27:44.5566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db898313-457e-4a78-c64a-08dd8ecafd9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007

Originally, the 'amd_pmf_get_custom_bios_inputs()' function was written
under the assumption that the BIOS would only send a single pending
request for the driver to process. However, following OEM enablement, it
became clear that multiple pending requests for custom BIOS inputs might
be sent at the same time, a scenario that the current code logic does not
support when it comes to handling multiple custom BIOS inputs.

To address this, the code logic needs to be improved to not only manage
multiple simultaneous custom BIOS inputs but also to ensure it is scalable
for future additional inputs.

Cc: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 12 ++++++------
 drivers/platform/x86/amd/pmf/spc.c | 15 ++++++---------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 4665e68e5c07..eceed2348165 100644
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
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 1d90f9382024..e72c11aba31d 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -101,18 +101,15 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
+	u32 *bios_inputs[] = {&in->ev_info.bios_input1, &in->ev_info.bios_input2};
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
+			*bios_inputs[i] = pdev->req.custom_policy[i];
 	}
 
 	/* Clear pending requests after handling */
-- 
2.34.1

