Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179DE2609C8
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 07:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144482; cv=fail; b=Q/UiTX06uyjkx99pM3Y3dlAcfIxJki1pKHYXkXNJiU08w9UyFcIqN4aDQpv18CjivpBlm6KdOE1ReIoXxYlbk/4ywIcZG6kGyDNc5LB0BfoqvU5PJuQRVVl6hZEqN8X4AP6JRyFnefyiETkTxd373GsbxN3qoUkYpfM8vA2z3ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144482; c=relaxed/simple;
	bh=UDVOBWFIOVdzr7G+FuUqLnxgrwTAIl1q2rENaET744o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TbYWyFkwtvn1fWDfU9JSFZWKylQ8D2PYcPgvBQtx0hpcJ8u+wsBvpBlPW366MIjmECTlOTYXTaSlb4vgUyhnYsvbXtbB+a2RMF4NV9vTd4mqD63UjZQNz+Sq6SdQuxSRmot2AxL4r7ai4e1U3UwOWpmgsT08/xGkDODEw1BHbJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q3igTEXU; arc=fail smtp.client-ip=40.107.100.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q3igTEXU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzb6g4QHWJ/ziIPaHJq/SkrDQXiGC0581EUXXPr+nzS9OFYWzwNr/Sh9dnP7XaJb4SbtJ05n2AkTjfiNXoafncvsotO0kh+gppoZCZzUAXftqfV4JPx/zcPJH5EPPm6uwzmvuspg1kyZquVGKvHH8Q7jGg0q/rDFbxEJG+EqpfP4UBE+jMZFYTDXUw/6ZEm79LN/4RN9gBP38dEx1xd9DiQqLC7OrBh9FNofiwF3s2+KmZ0/chBXk24+ukS2jS1I8VKwKzA4B8IjHT8hJdLSdoxfBg9/szjNd5EKe2fOpzf8ZIwDXCS0QouPk1qRoHlFOs5dIIh6uR+LM68PY5VBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ct6zw4JqNOU6N0+IF4keM2fC6kyfHmDwbs0w2C0ql5o=;
 b=ghNn6o96ICB4zossjslSg5UYVpS0FbT+Ds5uDAlmIYGmJ7ewIKQlBNsCdvXrR4qdA+IqkQVnDhC9pRfa8wvzZHEDc5nUNPjDRLmx4Z89MgLfVtqZAzQrbk+0Oc6lSYtw+wjqlrXBtrJmZitNFhq5zyFyEeMZqSOgfrHdxD+5c3VI7SlFQk+uQGbZbygjqQ1J7zsug+llTgv+gjFzX9j3aMfy7cTXAnCn64xsDb6LQnt+FMrO26AKSqFJpwoVGyHIk3RFmpjPAt3evcsEMAZwQWm/858Rvcakibdtvsuom2sen8zroHNNAG4R8mR6KyYtdHdqywA4E5Du7dwWTy8Qcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ct6zw4JqNOU6N0+IF4keM2fC6kyfHmDwbs0w2C0ql5o=;
 b=q3igTEXU26lqR5qJxDayvaa0DXJz5hu6TBH7t7DfpIS+h0k/j4IgRArUHfUKcogNuOydF6t0lELbxCkqx6rxEPC4tzaIZ9SKEb19DXa8H99AOkxPmFgO75gCJ9rBFuzwp5bvT4wrqea8g7w9XKZHfmZcmbEMCrm4yPbJC8HLPaY=
Received: from CH0PR03CA0085.namprd03.prod.outlook.com (2603:10b6:610:cc::30)
 by BL1PR12MB5802.namprd12.prod.outlook.com (2603:10b6:208:392::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 07:14:36 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:cc:cafe::c3) by CH0PR03CA0085.outlook.office365.com
 (2603:10b6:610:cc::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 07:14:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 07:14:36 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:14:33 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v2 2/9] platform/x86/amd/pmf: Fix the custom bios input handling mechanism
Date: Tue, 17 Jun 2025 12:44:05 +0530
Message-ID: <20250617071413.3906284-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
References: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|BL1PR12MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e6f53d-dcb3-420d-bc1b-08ddad6e9dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lWKpzhmwbXUuGuGNjpAHmNnPdgIrL20aagcyQNIwG6Ls7jNf5SXl4ikvkpGY?=
 =?us-ascii?Q?beoAYZMc4F2StpcL4llvBPeRCdYYZyua00mbmufTUrVL3P8UDoafi3cQNlOo?=
 =?us-ascii?Q?75fSVl3MSo4zzUlBJxzuY5KTI5C3Pw6du82wC67xU92Asf5G5HUGOEZ66dFt?=
 =?us-ascii?Q?E2H8EzaaUK/Gf7d4XP9RIuxAJjv0VVL28n2KBnL4oDkb4d+Bg6yQ0aQVL2nV?=
 =?us-ascii?Q?FjMoKEAviqGqb7Sy8YH8TGsgTPfdQzz+VqH/rQyh6HH67jpJDGebB4ljHGrF?=
 =?us-ascii?Q?t2wvaDx4muT3+prvCXOaaUBdAKXumlzM55zZGtXgSG1pnfbLLpc5f43zOBUI?=
 =?us-ascii?Q?tl2Zx876XElLvrfmR8sorFNZKfs/ZO1T638rnIXM6reVNtdUKGfKtnAxYfGI?=
 =?us-ascii?Q?Xpq9xE8f+NnK0PXk1FRd+L4AFroSFsaS4b57Fd0NHpfHYwQPHfQb2kB+O/PA?=
 =?us-ascii?Q?adxapPihFP171cVBqcf3ma3pHXZedgERuz/UjF+pSd4yNzoZKiSC9CIbAJ2j?=
 =?us-ascii?Q?FbNZJMQ26YdVNCPPFomjlB/AaQtqpR/LmWsgnTLexa1VmTSqMz8VR4ubpUpG?=
 =?us-ascii?Q?ttepdbi/ZpxH0OUCliXlg2FXCkCPESguzlm21nJ8NUJQwF3zO33+WRckGpbv?=
 =?us-ascii?Q?z21fo20xYs+n8FAH1wMoDooV7SfOKGQ8fGk4SU5SBsEUPTvQEt4bSEjqxzzn?=
 =?us-ascii?Q?GvX5xwre79s9YuaNy+ChL1c2feHTr3Y0n5fOvV7hP6k61rX/ICdHmFEKovFj?=
 =?us-ascii?Q?xjPkEUrwzdgiLnfXsZ6Z33dkMDLRRMEnCTJF/kBBpVkLKH+lmB/WvKOKGTm1?=
 =?us-ascii?Q?EVWmAso9n7Dynyrpe/kw2B2gqqbIelz/Nc00v+H7M4/PGmYM+fwFIO2PJ7yD?=
 =?us-ascii?Q?QNVTq/fUNR5+Ynrg/1N2oP+ECTBVLGy7HXKSCbuRJRghA6f9cIHfCm5ttoHp?=
 =?us-ascii?Q?vZaqA2SRvhcsskOTJyLofNgHfk1JGOqii138xq1KzjhCb/qSSrb70bBWKEXz?=
 =?us-ascii?Q?880ut1LxJDRSMzWs/baH8+ygVWohd5UYL5c0/dKpEfbLKUpcsc/wW+/GQnOO?=
 =?us-ascii?Q?bShPU8lDJWKEedC6AluPGFmGyKCbR/Cvz9rKNalcJi6B2g0UHLfU74pKXTQb?=
 =?us-ascii?Q?zUtqWgjlGOK6IirSwiRPxHTQFC4Z6IsXaUhFy8wbhKeYZlXTojDYy5IJoizZ?=
 =?us-ascii?Q?oCwOYzwnR1RloXth3r+eDM5HJxsTstvQers4GohvK1TfIGAmecsvf8oNUFsk?=
 =?us-ascii?Q?CIdGhg80IR4lpZQUl7uXM8eDHzSxwQoqsFYq3hEfuKf9EzS6yaxVmEgTmzMW?=
 =?us-ascii?Q?Qyop6su4Sq87e6sX61v5xeRDEYdVFrrpO6B5xNpqtifFQJI1qmtKpXOxtA62?=
 =?us-ascii?Q?n7W61v40feeQvEveFpEGwjxJLGKfYIJ2+sTrgQz8O08psGNbKI/pzH0PQtNQ?=
 =?us-ascii?Q?hYT/qJ3SmrhReMlIciDFbbnKC/+jYxXhdpeUry9NUCP2qveT7brPfA1RUK97?=
 =?us-ascii?Q?TO6UbB2iCS4GaoqAdvBjmyTA53P6vmRzz0Vh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:14:36.2032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e6f53d-dcb3-420d-bc1b-08ddad6e9dd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5802

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
index 1a5a8d70c360..696b170255e0 100644
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

