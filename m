Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A394426C39F
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775679; cv=fail; b=UhkzPCS/VvYf0WUQLdfRhflxRna/8g36QWxAcCmooE6Z+wFuPJC8li2HL/Kkc/hW1wAK/t90AiA7vw4ONspyfoMKujOgWbm2w3tizTg2zKIGgjwiEySvrUbJPBbZSjUGzn2IUqzM/t1YHc7Bp/N6MoFc5Xgkt4Gjhqf0T/mjtDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775679; c=relaxed/simple;
	bh=NSsmnKw3v9yW8Ho4hYQg43ghyqjAKFM4mDR6tGx51E4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EBbgSlGGnNIrkLMYuO+dhfQ6+A2IrRfC2My1IJp8Sm6wvM9q8L8jh42RpIv0M5m6BiGbP1XtkUfBxciG8ZchTZ/OL63pnWq3BWE5yv903k2BaSzbXKwxBNX21aGpFCqyMaAGvjellBgVebYvRwc7+Nr59H/coMql+X5jwWmENnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OYlWpalH; arc=fail smtp.client-ip=40.107.237.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OYlWpalH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkRP7XxZ12CFziNZM/ZcwUxYG/DHt/vZB5AYCYbnwpREu88rH0yGszNhWbZDfJu6fFoBZ/7VVpGxGr+P1dRlX+hT/AT996ut/0sS0yF81oX3Y1xgUV4J7CLX8dVEBVBqZChjYPbh4lZxErnwLq2vBHR2gYKdukO0wQEA2X8PvI0PmysFj7zNEfRNXsAmoUvixQzQLTowGW+f89FoK/HxQX62bopc3vCLhJ/n9q5dQQ0qSpu1/lbD8IiG0Tl/TrSrZK6R4XmvUUsrErCgfv+Oe5lUXHBlsyFG9y4ktzxczin1gm8uG9p5xlI+I8bRfBMP8ZBO3dIrVgJ8amyRj3ttFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6ZR6MX+znxhO6ozF4/9Jm8aALT/KZ5dFayz/ymv4pU=;
 b=ONF+h/zorksfcS6n4jBrarMl6VHZSHBa4J4SvdMe2SJuD532Ynrx9X97D/hGuVR7jlJffSa3/4wWhcc7TYi0zEIPT1qJj9DNWv7NhwVZ8L5x/FnUtmtNaExrlPPi9qHyqtHKxCke2/jDogn4z2hXATYAgUFLqcoHsQiR66cLahe2mxexRFnF575Pq5Esr9HX/Ev5CIpc1ZgQLWZz0t9xDbAgZxBdoOZgQelmSPD7XV96ZRpNaBD8aaPS7+HW8ExyOt01sRt9/mv/j4E02OOU5CGr2OuvrTJ8YRdF+R5O6G3bhgmcPRM1PdvTRNBCCjN8kQ/yFlWly+o7eqkquPrcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6ZR6MX+znxhO6ozF4/9Jm8aALT/KZ5dFayz/ymv4pU=;
 b=OYlWpalHFq3dEMdmgtVQwKwo0PXakA6GXa7iK25EwwOjGGN6Xyn3MUEZd79KiA0mI8NC5tt3obGeAJ5Fvfh33DRS5SV4iMS7XZPbWglF9cJRoK5yihjzyyCaXi4JUp1u/vw2oiLondGpzBXGH6xGRFbP5rSYcHSlh8on+EfSgoo=
Received: from CH2PR08CA0012.namprd08.prod.outlook.com (2603:10b6:610:5a::22)
 by LV3PR12MB9187.namprd12.prod.outlook.com (2603:10b6:408:194::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Fri, 9 May
 2025 07:27:47 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::a4) by CH2PR08CA0012.outlook.office365.com
 (2603:10b6:610:5a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.27 via Frontend Transport; Fri,
 9 May 2025 07:27:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 07:27:47 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 02:27:44 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH 03/10] platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
Date: Fri, 9 May 2025 12:56:47 +0530
Message-ID: <20250509072654.713629-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|LV3PR12MB9187:EE_
X-MS-Office365-Filtering-Correlation-Id: 34240c6d-aa18-4cb7-95aa-08dd8ecaff81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6rtZP7IxH5xqic7itmtuLcYFsga/FcBk0657XE00GjjHodP3A7E39hXEtWlu?=
 =?us-ascii?Q?KxaV1a6IQNZMECBPKoeDEIRCd6VikDQs8oulrnjDQL0seDq1Mf/grJGwrTnl?=
 =?us-ascii?Q?AkOD1+eDP+1CAx0vcNW+EGs+hWC6YVriQ8tV4zHGjMOIvTYwpnvcOpDztuIk?=
 =?us-ascii?Q?c5u5sl5WauyvaP1PS4+RU0nOl+qEvyGymn3NOcQMbeshYB/wGPR0hrZQgIkY?=
 =?us-ascii?Q?aLWk3ln8J17C9BaizjS7meF8dDwEbD/dIXjGYEEFuO5ywogzMS8i87iNvK5n?=
 =?us-ascii?Q?Y7mbMtOThjlKoaTvORf1Ag1yYzL1dDrgG0u8NH5gDX9QYMIGTM8lLN8/Hrkj?=
 =?us-ascii?Q?TxD0rB8o9KZcd50vCaQQPPAXNXgQs+HqO3ULRy3vE38blYihaNAtjhvmDuUx?=
 =?us-ascii?Q?aQ/3HpSLGPqCNaUrP12yby/CUuLLzLAH53LvrM3vusa6FhMWvwdB4OZGjOdO?=
 =?us-ascii?Q?dYKNZ6pa6zZnSfB2hsRsj9+yus+LCNlrJNlUcAHNAdeiAz5lIEo/5exosY9H?=
 =?us-ascii?Q?mvUJnO8vvnpBIK7JiA9CVx4JzsJUpvmDjUE3e4QOJDJLHUr3cM1WgKkcLNKz?=
 =?us-ascii?Q?X4YojHNSCTfGAwQHq+nJH3KS0VEvU56c4OQdlsXF6pWgZqhUra+hwfn2ibVX?=
 =?us-ascii?Q?N9FcXSiM1lIhXXnIwsxrIUvyOgr+PPCON3mtSJYs5k1n37rVxNimek0YhIcl?=
 =?us-ascii?Q?CPc23Yorkf/c+WNAbNC84FrSQ0MLNJATVB/RX1HDNOuPi6zxIsa25zBGzQ5h?=
 =?us-ascii?Q?w8ckEjaoY1HHTry+w2BTNBE2jx5fPrDHR1aC5PhrJhasmmaGFDYVJelqHIWB?=
 =?us-ascii?Q?ejtEO+3coqoL2fqNzI1XfaaDSdNr49JQPHN9X8H6PinupcZWuEDbMZNPJDop?=
 =?us-ascii?Q?CmTEmUe9WofAi6pGP5ePHstLcIpqqcytJOGs1V9L8eqnh7fNDgppPjoH/RHA?=
 =?us-ascii?Q?3zMzVHyJ/FWdz7NSKaV7j60SZEqz9NwA3WLbsHVKsHDqS3jcpg55/FboVO6f?=
 =?us-ascii?Q?ay0/KZ3zwNA9yLYoeQNj3Pab4DXyCQI7JFikKqjjXCdQY7OnxgQTCucGVOBo?=
 =?us-ascii?Q?XYn5gbiuPvTtbcpXSMH8vHI8hbqAgRHq6fJInXs7PFyb57Vd4ZSDx/IHsP+i?=
 =?us-ascii?Q?co/BC99PTZqTxLeG3mic1+GhRxUrQbG0XucrdwsaSKth6KCt0dcbMQLJNJzN?=
 =?us-ascii?Q?oLcTL3Wk8Uu7Y43PmHPVc06nBwONpjQAsyD1K2M94ELIJ86hNdxzmJPAiM3q?=
 =?us-ascii?Q?gX+VxSRiTdAwX2k3LYa0/r3HzNEoY4ZkPtZs6rMkJSa/iv0ixGxFCx4Abtth?=
 =?us-ascii?Q?0xmjZfuRJ34fLbujLX240DoF7S8w3+3NU2Yu366THlp8qnRvX29kaVjmAfbO?=
 =?us-ascii?Q?Gi0oaGhg0bTBEbOEYxB22m1LVcinNoWIMM9SN6BJ2t/TcwjnQZW0Otx4x2FZ?=
 =?us-ascii?Q?qrWXzd7ghSXfsd0GMkhXJfur8TMWlhGNC+YEKcrdGISF+UdB6VuiNyQSx3/n?=
 =?us-ascii?Q?UUXzoFwrPC4SiAKccNlrvJtQIdJBU+QbbMca?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:27:47.7141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34240c6d-aa18-4cb7-95aa-08dd8ecaff81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9187

The existing amd_pmf driver is limited to supporting just two custom BIOS
inputs. However, with the updates to the latest PMF TA, there's a
requirement to broaden this capacity to handle 10 inputs, aligning with
the TA firmware's capabilities.

The necessary logic should be implemented to facilitate this expansion of
functionality.

Cc: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 19 ++++++++++++++++++-
 drivers/platform/x86/amd/pmf/spc.c | 13 ++++++++++++-
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index eceed2348165..17b46085726e 100644
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
@@ -715,7 +723,16 @@ struct ta_pmf_condition_info {
 	u32 workload_type;
 	u32 display_type;
 	u32 display_state;
-	u32 rsvd5[150];
+	u32 rsvd5_1[17];
+	u32 bios_input3;
+	u32 bios_input4;
+	u32 bios_input5;
+	u32 bios_input6;
+	u32 bios_input7;
+	u32 bios_input8;
+	u32 bios_input9;
+	u32 bios_input10;
+	u32 rsvd5[125];
 };
 
 struct ta_pmf_load_policy_table {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index e72c11aba31d..dfb8036671a0 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -92,6 +92,14 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 		laptop_placement_as_str(in->ev_info.device_state));
 	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
 	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
+	dev_dbg(dev->dev, "Custom BIOS input3: %u\n", in->ev_info.bios_input3);
+	dev_dbg(dev->dev, "Custom BIOS input4: %u\n", in->ev_info.bios_input4);
+	dev_dbg(dev->dev, "Custom BIOS input5: %u\n", in->ev_info.bios_input5);
+	dev_dbg(dev->dev, "Custom BIOS input6: %u\n", in->ev_info.bios_input6);
+	dev_dbg(dev->dev, "Custom BIOS input7: %u\n", in->ev_info.bios_input7);
+	dev_dbg(dev->dev, "Custom BIOS input8: %u\n", in->ev_info.bios_input8);
+	dev_dbg(dev->dev, "Custom BIOS input9: %u\n", in->ev_info.bios_input9);
+	dev_dbg(dev->dev, "Custom BIOS input10: %u\n", in->ev_info.bios_input10);
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -101,7 +109,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
-	u32 *bios_inputs[] = {&in->ev_info.bios_input1, &in->ev_info.bios_input2};
+	u32 *bios_inputs[] = {&in->ev_info.bios_input1, &in->ev_info.bios_input2,
+		&in->ev_info.bios_input3, &in->ev_info.bios_input4, &in->ev_info.bios_input5,
+		&in->ev_info.bios_input6, &in->ev_info.bios_input7, &in->ev_info.bios_input8,
+		&in->ev_info.bios_input9, &in->ev_info.bios_input10};
 	int i;
 
 	if (!pdev->req.pending_req)
-- 
2.34.1

