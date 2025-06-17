Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B03A2609C8
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144484; cv=fail; b=D0oUZ9y2Ui551sQefSfeIJpcFmdqpYJWUv9lSINtFWICc4DgJex1OLH90krloYZy+zVtwbPR94X6HIt+Cs9PQbOx7MR31jOGpIVCaRnGgb+W5FqH5WBmgQjkjYr+nUW0giY1n+EjbdWdGmiPjxDTEcb2XDzK500gu/umSKagqkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144484; c=relaxed/simple;
	bh=vPJ3ISnEP01IAeh/H6yqiUgkJkcJmn0UBa0vEkVvD1c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c0m8HZD0FldH3CemVwAsWigZiihkEULcs5HgZtvBJK3zhdx8KfnXodgaDqQE2YkLDcJTvfJpmrEgEV4/1SHFuDm4a2VHzbxlRWy3avE8t8dNew2JkLcdNUqdsxF2U8kGffML7A2OfORT8UeZxSYhhl2y7cCMjktvZrzM9PDlmNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p9oRMaRy; arc=fail smtp.client-ip=40.107.102.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p9oRMaRy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpnHL6g51aSZGZFu3M/Ewqh1JkLyCThY7Y6ngfpGP104YLYAITL65sajTpnSLhdKaT/csLhEdH3grkZnKIc8U6e/O0SmZUjJw+ZSdRiurda7BKTWhXnbtlo52Iehnu3UyVHA7QmRx99CDqOgDZjvD2smpEyrzWoGf7gXbAWqE8MM0vy4FeC1MvWNKxTlumswnGZNCGidGJ3/sfuoSBHQIdWV/B1hRUnj+f7AzuwX2//1WCTdlitYf/9R5mTG2ufdAfFxxSrlrvE5ehQ4N1VuHmo/RV1eVf4DPUhYtU/7pFDAFIq3DscsAHabWu15a9pTvdvgljG9h/ADWPSh+HmVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/R5OTvDMyTmUNv9VEeDcV9AqPu/AQuzhDm82t/TCTg8=;
 b=SpdlEiVZZQVTbLy/rXBOiAVveLQkyQs+4ZE+2QvBXIB0eTlt8Q730lKrJZB8VO5jY2BiQt2GuK38XOvjuN2phu7IiFRXVBG9s7Pt9Rk7Djl9d4Z/L9PWwbknAq64DYgoDhd/s+H72WWCAevV3wDJJzqxsQXPaQCqTyujscnsMYNAw9zISTtW9hxTaoiCM8/VcRN8kib3fT2k6Wd/RxGQzx90WVKZFbZfRoFkOBsmGn5jHpqOH65FSzRTlNjzWjbrfDu358FvMnfgeu+uUtMvkO/MYVEwtomvJgrG9BsoUhBrodA8saFejQmclKEQv0gundXp70SpinBAC6cCISFgOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/R5OTvDMyTmUNv9VEeDcV9AqPu/AQuzhDm82t/TCTg8=;
 b=p9oRMaRyLJGq7BTlimiyZyxgsbbIdfI68q77Y5lxvX4nzdKr55M0ygAIVJUIuQXSabIJcBnrX/7AdPrBJymCzdWY2R1HZYrjfNIpgqZMpawtut/fDAfc8+7aHNCiXvg+ViPUNNhwWHpCv+G8/GVYx7wh9/AJK34SE6ae/4Kf9j4=
Received: from CH0PR03CA0081.namprd03.prod.outlook.com (2603:10b6:610:cc::26)
 by DS7PR12MB6166.namprd12.prod.outlook.com (2603:10b6:8:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 07:14:39 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:cc:cafe::56) by CH0PR03CA0081.outlook.office365.com
 (2603:10b6:610:cc::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 07:14:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 07:14:38 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:14:36 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v2 3/9] platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
Date: Tue, 17 Jun 2025 12:44:06 +0530
Message-ID: <20250617071413.3906284-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|DS7PR12MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: e8661f50-53b3-48bc-cde9-08ddad6e9f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r7wz0c1VEGgLnk8qqLNCbIX7SIus/CWBOmNv/AbaVc78jA2fNOQoo1KNB3cz?=
 =?us-ascii?Q?emCXk4zOn50oL/lQVIQnsDUh9Q5QjYeyiH9nOWAtok17O+R8kWCyDmk3NrQI?=
 =?us-ascii?Q?rqpS4T/ntHkhIEbUuXR0eEUEuEoLe0WoCCtc3YQcu97CrWQJPcRSheBB2wiM?=
 =?us-ascii?Q?Z9PFnG5hQq3nXE26wuH7S8JPwjnTOTYf6AIMim5UJdP7nnt8TOdYr92wWczT?=
 =?us-ascii?Q?XpYj8x0uQWe0rRW5YksS/MajzimyBsJkk/nsBzuaZcGgVolRwZjMpZMalny2?=
 =?us-ascii?Q?pS2iXbogJa+wbIXjypr3aREYZuZgUN4SXuN8dRZ4tAE5OCQZ9uQmZlgAAOUu?=
 =?us-ascii?Q?WbJXzMesk4NpLVUDMUdp2AkVYXE5I2DixcA4b0wI4Mp6DpjgpkM3UzdpOXLh?=
 =?us-ascii?Q?0M2IPtWVZ4ZbARj9ctsgcuOCwG57AmSlcFACvqycEBwjeiY6ZN543LKJ8yGA?=
 =?us-ascii?Q?W0ivi0RMjFeWAO1czHzrvcNn9sqgK7e8fswN5FsUKagO0EEyvQRvfmD4LjL0?=
 =?us-ascii?Q?+TrzxowIqdbvHEiJl8albbo9RZYEjDtFjj1Z4GN7Z9C9y7SNPFYG1t8V9wzO?=
 =?us-ascii?Q?QB5hCTHhfdjSN9FBb0rWfRkIKLwmLcFNO0BweM8mrl3tv0+gMKj2Y2Xs6D7F?=
 =?us-ascii?Q?H9Jz0h8o2KDVtW2bAp0WcEyQw4KJVsbnxukWLNT5SkPdXQ35crrlXpmja8hD?=
 =?us-ascii?Q?XcA0thp+r8OTQ49IOGUZohv1iwGeGnHsuHHIzoOq/nBkuk1Ieo34EHzdsY3U?=
 =?us-ascii?Q?1P9i1mNc2gyXkzHX2sH2INYmq1gyo2Umz3HqfaYxogJ8dEixTPxnX22vgq0+?=
 =?us-ascii?Q?kTJnwy6zSVBPBqU4xWdo3WiKczvBRdTrcyvOuAUtpAlLQH2afVtMnmbdGb6b?=
 =?us-ascii?Q?P9JX8JP4uCeRGhpE2fq8d7ywsJ1wi0V/K6wP57lRHV+1RgIJVFWq287npJXM?=
 =?us-ascii?Q?tubDyTm+/+eRfn0rCQsg5QgFDFTupfLGkIa5Rwr81c9Vo9ug/DLT9Hm447gH?=
 =?us-ascii?Q?J0Scc8R9mBfQtjQImxyOv5XDeSZ6hkb1YcE70WoUW8CzMemItrhAVFMmGyUz?=
 =?us-ascii?Q?l6xLfhHjgWTYL6WSZ6kOQdxY01T01Flmsw7WF8PqJ/LYonFl1kcUTl4ZXqeh?=
 =?us-ascii?Q?kfFVBX6OUJk8meXT93SkRZzEfddhOnk10xd+amhHR/HYXCI8E8UBp+aiOhYw?=
 =?us-ascii?Q?tDUtfDWv33Nci/TE43r0wB6T+917KRoFiyvxY6dDmQWuASTFbOaSBmLgwTfz?=
 =?us-ascii?Q?Ou0j2afc4ScX3ECTwBeHv0ziI9Tk0QEwC8GbHV8XlrHXpC5h7ro+94XrZABa?=
 =?us-ascii?Q?aA2YiSP9IcCUOAGt8XA4RnlBiZibV3IADJTONxK5tgS0wloN9LsRlvQ4DYil?=
 =?us-ascii?Q?0Ak41ikREAn66buqd4mQEf+sRNZM4aM9CrFYIuNkobJV7wWA1B2/EmOpW0XU?=
 =?us-ascii?Q?LmqZeKjvswhWgYtUvIWQJv5Of6UiEMWTDx/oUHs9KkbRWYynVTLFt4+fyWRM?=
 =?us-ascii?Q?+mHtmXaVx/ZeU1yIcYAS1X5lr4j7Y2hahsyM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:14:38.8343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8661f50-53b3-48bc-cde9-08ddad6e9f68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6166

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
 drivers/platform/x86/amd/pmf/pmf.h | 12 +++++++++++-
 drivers/platform/x86/amd/pmf/spc.c | 13 ++++++++++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 696b170255e0..10d658dd66cf 100644
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
@@ -715,7 +723,9 @@ struct ta_pmf_condition_info {
 	u32 workload_type;
 	u32 display_type;
 	u32 display_state;
-	u32 rsvd5[150];
+	u32 rsvd5_1[17];
+	u32 bios_input[8];
+	u32 rsvd5[125];
 };
 
 struct ta_pmf_load_policy_table {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index e72c11aba31d..167b7455d6b0 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -92,6 +92,14 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 		laptop_placement_as_str(in->ev_info.device_state));
 	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
 	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
+	dev_dbg(dev->dev, "Custom BIOS input3: %u\n", in->ev_info.bios_input[0]);
+	dev_dbg(dev->dev, "Custom BIOS input4: %u\n", in->ev_info.bios_input[1]);
+	dev_dbg(dev->dev, "Custom BIOS input5: %u\n", in->ev_info.bios_input[2]);
+	dev_dbg(dev->dev, "Custom BIOS input6: %u\n", in->ev_info.bios_input[3]);
+	dev_dbg(dev->dev, "Custom BIOS input7: %u\n", in->ev_info.bios_input[4]);
+	dev_dbg(dev->dev, "Custom BIOS input8: %u\n", in->ev_info.bios_input[5]);
+	dev_dbg(dev->dev, "Custom BIOS input9: %u\n", in->ev_info.bios_input[6]);
+	dev_dbg(dev->dev, "Custom BIOS input10: %u\n", in->ev_info.bios_input[7]);
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -101,7 +109,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
-	u32 *bios_inputs[] = {&in->ev_info.bios_input1, &in->ev_info.bios_input2};
+	u32 *bios_inputs[] = {&in->ev_info.bios_input1, &in->ev_info.bios_input2,
+		&in->ev_info.bios_input[0], &in->ev_info.bios_input[1], &in->ev_info.bios_input[2],
+		&in->ev_info.bios_input[3], &in->ev_info.bios_input[4], &in->ev_info.bios_input[5],
+		&in->ev_info.bios_input[6], &in->ev_info.bios_input[7]};
 	int i;
 
 	if (!pdev->req.pending_req)
-- 
2.34.1

