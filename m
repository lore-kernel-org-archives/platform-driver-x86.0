Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B9D1D0E2F
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049757; cv=fail; b=rjUIDL9poM8u0LQnUcaNCadJOVXLT1k1BCi+BwB2oqmI3Yd4mm2Ptjo16XPLD87EhAZwPJf931kZtsfgLEECEaZkc2WAOctH1LAaDeZwE/pp7Aprcy841txZAqMIEyFquqxjJHkIviDZ5gbyrT+3Ub8YpcVib3/5fK9+nnhRiic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049757; c=relaxed/simple;
	bh=/pP3zgOqPJXrGI3XuQfUTszCxSIcckTmjeEb15xiJGA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+MXN8z8GGUaVl8g0XXiOpcUhujdyWraqC6V2QGyNALDgTaOrlHx1E8gm0MGKjWhiK3mthlONnNYcCoYhkBboXImLuief9nPc9Ja1cDxsV6DLNAx6Gim2s8VOkg06T76DlHH8YlcMihuslSCKXCeHuZZCroPMd9kvPXvp87lQtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bCNX5G0S; arc=fail smtp.client-ip=40.107.236.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bCNX5G0S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9zPy5baIl6b0x8dsrTYuuoJ7F9liY5QWP0V/vO+yMnbTiUz6b3wCBCRXl3JZr4wePeAZeo2rIvpqbuGK442n4wmlJaf3fo+neDNbZT8qCo8fcyr0Jn3kl5rJ2O5MUzIUiwKVRx7ZVi+M9wNxqhx0vWnfHzXyK3qNJMKmA0iQfP5cx6MnP4vOg6pYDKQQYR3bxb4WVBXCMaUEPg5dre/uwYyjvqMEOJe/jKEJXixQ1SfGB12l0MLdMFazAk/ca95A87wauHLQAqp6VeHZz/gTTPUUDK00XJ0p2U+NSCm3+UPcZHRhuuMQmBxSk5UVFkhGSDVK97otFTCIegA0Gz0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ANLe2AzFf2d36GQZwoiuD3S55CjPJwmYcGPf6jjU1Q=;
 b=bHleqhsS0PJP1s3fw7WI18BsExMKDJ8lsGeqN5G3gWXwUMKdUQGCFtqu27nnpRYYCNtumASrLi8YwAoMwogA7flOSAARA5N0JN7SU12xhm8safLbZw1yJTfSsKALdIv6nmStA8zCj0h9m8PNMr5De2hYVA+ZhTVLCdVccyoRqx0JGD5ZrpM/2+X/Vhf6+18H5MreO/8KRHDQhZzkJog+N7hjUN0fRbaXxPOAjMETraGcZd7v0K4aeRX6m6sQ8MNRMK76/vBrFFGipfTwoc3qVBfrRAu+l9iFmR/kwOrm2KNbKdF2Xb3+jFzZ42Cw1kt30dN6lphVdgTH6ssc7/4KFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ANLe2AzFf2d36GQZwoiuD3S55CjPJwmYcGPf6jjU1Q=;
 b=bCNX5G0SFo89EMyMfNYHXuxyfFvFxBkM/xWNPZfyQw7YI8JEPwxHpaWMZTYo4XPZ6CA6Ig8S5jdMo+xT6SPSSnQKJNGcKBXSFfylaDXLIqKNQghlblZBwRZyMoOeIRQdSrVu0Vf+Ok+Ggwtn9Wv1C6HuwQcQ8Q0CfxmV+YwBJhA=
Received: from CH0PR13CA0009.namprd13.prod.outlook.com (2603:10b6:610:b1::14)
 by MW6PR12MB8736.namprd12.prod.outlook.com (2603:10b6:303:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 07:09:09 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::60) by CH0PR13CA0009.outlook.office365.com
 (2603:10b6:610:b1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.8 via Frontend
 Transport; Fri, 8 Nov 2024 07:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 07:09:08 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 01:09:06 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH v5 09/10] platform/x86/amd/pmc: Add STB support for AMD Desktop variants
Date: Fri, 8 Nov 2024 12:38:21 +0530
Message-ID: <20241108070822.3912689-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
References: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|MW6PR12MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c5540a-0968-4b7a-e604-08dcffc43d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mIc2dsPJhRD8RiGA2gAGW2rMbC4BUdW4eOp5JmQ+yttmQG09sjPo6AMAFrut?=
 =?us-ascii?Q?ob4ezkFgX4yWxzv+/fibVooWoSM4bV0vrmkyJEo3l39CxKTS/sAmTx7+tqmO?=
 =?us-ascii?Q?mzgPjJYUODjnqp9gWYMd2tfSXCslD+GIHgTsi6Y82+B17JXehLgOeSabWvM3?=
 =?us-ascii?Q?h1rCEgUUt3eMAec4E2wN5q79CrdatfNZip5pRdhMZJ89lP04+I9ezvNAyUnl?=
 =?us-ascii?Q?6h0F6S8nSWoTc3kv0MbsFAVXtV5HtJNQpp8hKP9gDUEcEPS1Gxo1sKcAt1KL?=
 =?us-ascii?Q?DDKiW7GMRJ5YUBf7Y40yNcVqtF1gS/3SXpUP0pEdyaUbL5iZnJLg2V87egYo?=
 =?us-ascii?Q?95hCRqtXOOVC02GO01fF/cjrivh98DrriYNwVFGN+R3BZoz3S/UQNcVYJjwF?=
 =?us-ascii?Q?lipLHKkxJCdTGHRR1LzrgaA+R5bKAagS5QAQNzqccXc/85sj95x/tYuBt3Jn?=
 =?us-ascii?Q?O7OPUVQC6bw3pXKEs1Zsw6buRx7jqXOQI1GNEi7cHwvmtXM2y02qHHlLZRGl?=
 =?us-ascii?Q?n8LKN7M0/4Z0/gepVLvG3/uw9zwf/3nXhjUNF1b66QWevyhJnsKom6DPwHEt?=
 =?us-ascii?Q?rw6A4+49nGQHsQd84xjF1sMRVTOc3AXR+lwy27ZuvcB+ZEOKyRfN22VCgR7j?=
 =?us-ascii?Q?lDJxSVU1uIFUJ6YzP259Ai7I/djMDOwMH94yNdpdzSqv2eIatyM9Ddnh4VgZ?=
 =?us-ascii?Q?8gBkaJg7hF+iBDNfjEIU3/0KMXZAt8najslmTBEVPAFD7C01L72xBgIQikMG?=
 =?us-ascii?Q?LVqrhNSvl2KWIZNaFBBT2AqjNiCI5qigSNYF5TkOXypJ8CVuDwq8VnElYhx8?=
 =?us-ascii?Q?u6yqUHhGBeih8jl1QC5BhHmNyRGe8aEU7iHL/j7KrBZASo1cr+zdMMai6KTi?=
 =?us-ascii?Q?EFxXAKHJ3+Gss75VwffSgow02XmCCJ80uGb8yGmc/On182oAoS1NjhHzY6LG?=
 =?us-ascii?Q?V4FBmMriMwck6UYt4d1g969ohw6rXqKDjgvPxhrL15GT/Mn2ewiIQaeXca/Y?=
 =?us-ascii?Q?fF8vk0oyUUI+W7Iwoz6LC2DwezhdeTCqArdXj/3xu2cv2ZW37ZcMElYi00hA?=
 =?us-ascii?Q?vyWyTjI9uVkrnPu/1DmCl9aputgKEwjLBsJTP8sGTB8xE7QKkz5p1BZCqHce?=
 =?us-ascii?Q?ku/pQwymxMcoBROsHCUu23SRiFwEzYOnSrRyoO3BF1qNFONEgwoKbGEhKe98?=
 =?us-ascii?Q?ZzsncQzPyxpf3kE6dVw/BskItV9ggk4fnUgoOwvnqRR1ndcksucgdff9/cVY?=
 =?us-ascii?Q?XgyKwf2G4k5ymVjkRmwyElKAS0m0rstz7HbKbIiLZfB7gCas/VtLWvzODbTt?=
 =?us-ascii?Q?H2Il//zWIfGQQ1fD1MRFwHKjwIKCCO6PlFRN3A9rfD3XMwUtX7fkmKfcoxj3?=
 =?us-ascii?Q?MohodFWflHToVBt/kfYbgh49hCalBc8p5kyGZfTA1ruLe0ZnAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:09:08.9688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c5540a-0968-4b7a-e604-08dcffc43d85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8736

Previously, AMD's Ryzen Desktop SoCs did not include support for STB.
However, to accommodate this recent change, PMFW has implemented a new
message port pair mechanism for handling messages, arguments, and
responses, specifically designed for distinguishing from Mobile SoCs.
Therefore, it is necessary to update the driver to properly handle this
incoming change.

Add a new function amd_stb_update_args() to simply the arguments that
needs to be passed between S2D supported Mobile SoCs vs Desktop SoCs.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/mp1_stb.c | 33 ++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
index d19a13a82e1e..c005f00988f7 100644
--- a/drivers/platform/x86/amd/pmc/mp1_stb.c
+++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
@@ -36,6 +36,11 @@
 #define AMD_S2D_REGISTER_RESPONSE	0xA80
 #define AMD_S2D_REGISTER_ARGUMENT	0xA88
 
+/* STB S2D (Spill to DRAM) message port offset for 44h model */
+#define AMD_GNR_REGISTER_MESSAGE	0x524
+#define AMD_GNR_REGISTER_RESPONSE	0x570
+#define AMD_GNR_REGISTER_ARGUMENT	0xA40
+
 static bool enable_stb;
 module_param(enable_stb, bool, 0644);
 MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
@@ -233,12 +238,33 @@ static const struct file_operations amd_stb_debugfs_fops_v2 = {
 	.release = amd_stb_debugfs_release_v2,
 };
 
+static void amd_stb_update_args(struct amd_pmc_dev *dev)
+{
+	if (cpu_feature_enabled(X86_FEATURE_ZEN5))
+		switch (boot_cpu_data.x86_model) {
+		case 0x44:
+			dev->stb_arg.msg = AMD_GNR_REGISTER_MESSAGE;
+			dev->stb_arg.arg = AMD_GNR_REGISTER_ARGUMENT;
+			dev->stb_arg.resp = AMD_GNR_REGISTER_RESPONSE;
+			return;
+		default:
+			break;
+	}
+
+	dev->stb_arg.msg = AMD_S2D_REGISTER_MESSAGE;
+	dev->stb_arg.arg = AMD_S2D_REGISTER_ARGUMENT;
+	dev->stb_arg.resp = AMD_S2D_REGISTER_RESPONSE;
+}
+
 static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 {
 	switch (dev->cpu_id) {
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
-		dev->stb_arg.s2d_msg_id = 0xBE;
+		if (boot_cpu_data.x86_model == 0x44)
+			dev->stb_arg.s2d_msg_id = 0x9B;
+		else
+			dev->stb_arg.s2d_msg_id = 0xBE;
 		break;
 	case AMD_CPU_ID_PS:
 		dev->stb_arg.s2d_msg_id = 0x85;
@@ -254,10 +280,7 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
 		return false;
 	}
 
-	dev->stb_arg.msg = AMD_S2D_REGISTER_MESSAGE;
-	dev->stb_arg.arg = AMD_S2D_REGISTER_ARGUMENT;
-	dev->stb_arg.resp = AMD_S2D_REGISTER_RESPONSE;
-
+	amd_stb_update_args(dev);
 	return true;
 }
 
-- 
2.34.1

