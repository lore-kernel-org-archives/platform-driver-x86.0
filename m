Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6C6244685
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 11:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724547; cv=fail; b=ZFZrztob6mkAwglqhnv8sxmZ34DDPGo0XWsDGiJbD0/tUfY/ByOZ3nChgt6WI8OHCl9QAIAVhat1lYdZ/SsJv6cG39pcWSYZBqrSDTUnm35w709GNYXnkn9Ft3lJ1fFyoOIPXEra8RVm5eoI1EduRo0F422RY4m/4hZTDaQviKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724547; c=relaxed/simple;
	bh=FC6S/d5LgCEZATyOmot2fpJNtTaDvoWw9V9p0+otoeo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uKhvfkLOry2E8O574kKZFDHfXKWU9F6TTIqpzjrRxwY7Vr53BaoJ/T1MoaovSs6okz4QgWfNzLtWZsFVKYfQck003Dn3vVUGRb8FXK+qFNruG+J/kPwHNGb2L4/2j9Lbk1rD8tBn9jmtiQWfoDSQ0R50VozUYrNwu5DYJlJil64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SeLXUExo; arc=fail smtp.client-ip=40.107.93.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SeLXUExo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqIglEEXo1w9/fsKM2sADHqezfBVCd5kRxQqUdSL5fRAZPRSc7P8sMT94mBWzYFGY+DeUcfZfqR0VUx/0MozlBcK4fg36jDOc0uKvQTbvY38kT3zDcd2aj8rg4+1xhHAhK9lNN1nS34pv2bwEip864v4PZtrGWFNPQkCJzDlfCU4Du2LBi0FIOgW1/eIkjRtsYTlnjSwOpI3rJibggNUvZxuREjWh4K8chEZbQTcKUfUv7iA+gKWMksRtPtwrqO81JBpX8a2jKFMIn1sVMJZgBbNIa3RIerL9r8RQPVP+uWvf8w8B+o49F0CG4n/5HedqNW0551B8jbWbDNwGo5kiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nteihAjXI5jRibDqiuQOMIMN9w2+UJ21mDICbCIZci4=;
 b=ZkTOeJRCgX5s70gKCr79JNFbuthKSIpRlka4Ni8pnmfsMH5LIxyell6XuiF7o+vPhnw4gpCWEZsAL+AcQPYMekYtk+2qooDLsN58tLJ9P15aSZjkZy6c668hAQkszlPJp4G/EkDhztRK5/ImO2Mv2T9RN8MKZHGbwKE3mYqxJDAI87JMMgtIpSwQ2yS+QMYYckP6rZeCqyVru87fyfoUt38XpAJGA9Q1GN4BcNpci3iVaMmDSSNqx2HPIaTO3nm7mJItVhSv1VVm8lMTs74A+yiJFhDSvLNz0ueTP/5lMB6yyyTXW3Z5xNYDt1JkKbYJCnwudw2LUGe+5lTtYr91tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nteihAjXI5jRibDqiuQOMIMN9w2+UJ21mDICbCIZci4=;
 b=SeLXUExoNFid3g0rHg22KdQUGhUuB9JD4ndfLRc5kRYhCChE7LL40Buo+64jdA5FajIUiiXsfR3FanlNoPlqc9h0RhluhEBRiPmV41DuGGPFOVkvHdtKXqDW08pOR//UayyHWJ+0FygEZ9KbLtdzIefiJhtoIlvE3gb9rJo/LIY=
Received: from BN9PR03CA0476.namprd03.prod.outlook.com (2603:10b6:408:139::31)
 by BY5PR12MB4114.namprd12.prod.outlook.com (2603:10b6:a03:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 11:02:23 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:408:139:cafe::a4) by BN9PR03CA0476.outlook.office365.com
 (2603:10b6:408:139::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 11:02:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 11:02:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:02:22 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 04:02:19 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 RESEND 7/9] platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating the policies
Date: Mon, 1 Sep 2025 16:31:38 +0530
Message-ID: <20250901110140.2519072-8-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|BY5PR12MB4114:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e869c7b-246c-4949-24bf-08dde94706f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6sg5DfK7eHU8UPkcEpt9+BUabw7zaqEc+o/aGqNBRAG7OY0vhiCZqdfjPp6V?=
 =?us-ascii?Q?TqYTq0U1KmQJTSOxMqn3WoJhO5M5gywfq8IP0weHKb9Mcm2VjjjmoR5WYLT5?=
 =?us-ascii?Q?KvU92SzVLoQFUAJvWceNuc/lChc8TW5GjUNeblYYTtjHvthXfcP5DuVeovfT?=
 =?us-ascii?Q?He+31iZupKOhHL2fZ0C0DHYHjDGa5UTF5GFVtvrBacTzOVH/1ZtZ93wl+OTS?=
 =?us-ascii?Q?zuhn5NzIu3uOe9tyqMKOc7h/P2OQL0Y2XuEBkltmp8AW/8ClbQnN6QPZOwKD?=
 =?us-ascii?Q?BUkNUQT+Vm6rGMa6BAE6ScivB71sUC31uY3Ph6xVwumLpsOYlgzbve8bK07s?=
 =?us-ascii?Q?2yZh9UxxHppxjzihCBoIdSim+DNiBmjbkqGEulg4gTmnSyh2lEIDZk4I5yW5?=
 =?us-ascii?Q?kWCRTQPRZnliRq0ZA2E3cs4PSx6a1B34XJzuB++8GRnJDJT0OWvusJZ14oto?=
 =?us-ascii?Q?iTvxS/aRhuJzuymuEO9StCgiJk22r46QKbytihi9e3BvaprNItEXQXWaX61k?=
 =?us-ascii?Q?Kt+5MA8QYP1c4m7dq3WsKHBBx5mX+Tu/ByN/5Kpl0x9+AQmfML3sMHaFGDgH?=
 =?us-ascii?Q?V3rZnjcgkvcmnn2QQfZM2irjy5r3VTaEHQm8s13yO+ogU4lUcHZKlYGrODBP?=
 =?us-ascii?Q?HeEcPb1qfM+JssSTIMwSv5TE9QZaJWGgMDEU2n3VVPwGXZOVZSJYxQD7AUk9?=
 =?us-ascii?Q?GUZN//MpXITklYaXVTG1uMFQeXdJf3EMeBoMpGxK52/nUWrv+8FKRGOAekdd?=
 =?us-ascii?Q?q0GJjBclcp/TUIg8EGa/UajbeHsUB088PT+ANz1udQePo67YbADm07G1oZXJ?=
 =?us-ascii?Q?+hbcUwpiYqVvQPfibUa3qsMFpJn9EKAMy950Ep42aGz/b/m4tu7S8HVAIX/u?=
 =?us-ascii?Q?wMeq/3pFzpLttmjI6t2FB90km4zysaYiXvlb8ZmB+3feuZplnfOm13rOhfYk?=
 =?us-ascii?Q?2SPpHIg0uT18X6AjvXPD161UENpR2HUQbX67ViGEYDsVojmL5/ooIFJ8wL2n?=
 =?us-ascii?Q?pjzc0rdgywXyIHDDa5BXKV5Baps/dYFe+7y3eQkx4fVAekNTK7FP6VzsJSUn?=
 =?us-ascii?Q?hQSOGDVS7NlZcGIjWSnATUrFzKYb/YTOFYtvxCbVXWWQcTOmBOxsvI5jXAQs?=
 =?us-ascii?Q?weG3LKDk3tDq5hOwYYLRX/Rz0p/Udp5xBtQZ1/+8l+DzfhQ9pCtVxq+8nIaU?=
 =?us-ascii?Q?mpEXypWslN87qaBhJy9QPt9YKSeBUHptOSUKWzgnP7hQmT5TLxDit252bz6p?=
 =?us-ascii?Q?ZutkLgglswWik0P0bPyDGFE8jNlKW/umbGsPVuMM0VvnNtxrmtfPqJzYV2E7?=
 =?us-ascii?Q?eHvfB2qYsJFHCTgdWSumH2021Kc8srkMj/KVWGigH54Etj6uTiGDQVv+NvCX?=
 =?us-ascii?Q?mxVoJNMROf3iFAZz0CvO3gPZfRTwbqhlhFucEj13IFEMzdbvj16tlcTQ0HjC?=
 =?us-ascii?Q?SOnE9v64uPOeyvO1bMnRaJUBemGHpzBGNH40N1fqlJTqljgc+T0jDQ6L6xmk?=
 =?us-ascii?Q?pgccBSJrDXYDe9p1AxxxxgTAKgHWxZXdiqzQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:02:22.4387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e869c7b-246c-4949-24bf-08dde94706f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4114

The current code fails to send multiple BIOS input data to the PMF-TA
for policy condition evaluation. Only the most recent BIOS input data is
properly sent to the PMF-TA, while previous inputs are overwritten with
the zeros.

To address this issue, the BIOS input data should be stored and passed on
to the PMF-TA.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 5 +++++
 drivers/platform/x86/amd/pmf/spc.c | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 647993e94674..6d2579f8cff4 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -354,6 +354,10 @@ enum power_modes_v2 {
 	POWER_MODE_V2_MAX,
 };
 
+struct pmf_bios_inputs_prev {
+	u32 custom_bios_inputs[10];
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -400,6 +404,7 @@ struct amd_pmf_dev {
 	struct mutex cb_mutex;
 	u32 notifications;
 	struct apmf_sbios_req_v1 req1;
+	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 1b612e79a3d8..aeead2477a07 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -142,12 +142,18 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
 		if (!(pending_req & inputs[i].bit_mask))
 			continue;
 		amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
+		pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
 	}
 }
 
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
+
 	if (!(pdev->req.pending_req || pdev->req1.pending_req))
 		return;
 
-- 
2.34.1

