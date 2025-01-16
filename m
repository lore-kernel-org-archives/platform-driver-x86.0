Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2927318C03B
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014409; cv=fail; b=STLmytABBEF8h0hWMfRw/5b/PlGQnmi3sczuMiXk4Hmlnq/E9sZZLYz6aszf4b+aOdqhEKqHlbPg4vosVuBaXAo++kXNvnDbXdyRTz0zexyevoVrsuXiqRir9lpUgrtq2qe+jIy+VA2ai4s/j9U7j2qUrigBO2T1Y9er3gnMYsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014409; c=relaxed/simple;
	bh=fOXasMPhAxVyO022JLtlQMYsX+Zzg2orDaXyH9KOgvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syebhkvD6cgd2E73++6MV0ak1W1VElf/fBxj82XJRcxO52C57GLmv2kFvSUxjBY9Zy6XmK8Aw0OiUCvDDHBn+rN50SbJuJZ2FeTsuJgX9t7sF8OS5rvTUAxeZT4xjFp3H93PYCyisIpjP+A50QD6Cs8v2GQFMf49uQDvXo1bIIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T9MG8NVu; arc=fail smtp.client-ip=40.107.223.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T9MG8NVu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e53uWwszGL2OHX9tkVLFEzRJnih6fjHmDGsZnFd/i13dtd9E8NX54m2c2/8NviQQqC5khdn8k0sZWpzavxSs3ZhuwqMF98MYxG1qN6TmWiRqmlnqzDYtZRHcse5sOhniifXJt91f+8kr7dZBxuGJV6wDPUqFnADTVp7w1tknDV1c1yWA7wikS5NpO1AL8YiQES3APIb9rveU+lv771fQqtVoWX7dmjoecdtVC+yzFr8GfX2m1pKmLrQ49kzwTYW6P7BBfrpR+8ekUuXzAgCSAkGkG7t3sKDIK4GLk3f/OjBteRh98VELoR/owJsjD9eshHVa5GA9mgD00EId7WdnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OeRSr6qQ2KgXRb9k9jUoEzMC77JJfo85Tjq4c7DDO4=;
 b=XlL4QrSl4BLOlc9rYYblurab3/GAUnSkaU/N34hPSvh3Y6e464uAz6NYRQLHYj2RlLZglwtl8T9UTAXzzhL3Xig10rDEEW9hTTGsupCq7saee3Th7crfvb4D8KsvnZcwObICSVXnWNv6gi2ukS9dHdtCRvOYFAJxN+JXTrmNAp+8DPiWdMVR5cwZ9wCDBiGrb7Xd6Vf7IM0EHipIUFIVW8poudYc7+gMMFOOuTNUacH+oLWWz63WsKzIQ92BlxVYe9dKZL6GqhhUmUmGEiYzOnwpXsVFTVqga/Lr9qMpqIovHbgA0F9Dqz72KAfkQ7Xo7/VU0aYYSqNsKH7/fu5KBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OeRSr6qQ2KgXRb9k9jUoEzMC77JJfo85Tjq4c7DDO4=;
 b=T9MG8NVuUAWePSAjOv86b/lAEjEoOBSj92ExJ+ncKjA3zKJvJrxsxlxOH4O1Y9KxvD4wLRdB7PBNou5odPrvi3QijKWUnyRWSZG8MijkBhccoqwBBfYZj/bpx9XRo8OX/NqtsOUTL228SDzEb3t+jsWvGGKAUR/x4exTfO+8TmIrQdVkO+GAFXcYtydZAF64vzLI3Mi4vkSSaqAGe3Rz7wn+SQqQA8n5KLYvWBk40kKe4Y9CpipUj9wNLlxkc+mC9S31lFYy+QpWA7lH1RS+aWYcgI9eUXMdpUh/sDMh85tzUGbVINFgh6kJ51H5tFJbf+1i1BTFz/0YU943umXthA==
Received: from BN0PR07CA0006.namprd07.prod.outlook.com (2603:10b6:408:141::23)
 by MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 08:00:03 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:141:cafe::63) by BN0PR07CA0006.outlook.office365.com
 (2603:10b6:408:141::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Thu,
 16 Jan 2025 08:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Thu, 16 Jan 2025 08:00:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 15 Jan
 2025 23:59:51 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 15 Jan 2025 23:59:48 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v3 02/10] platform: mellanox: mlx-platform: Cosmetic changes
Date: Thu, 16 Jan 2025 09:59:08 +0200
Message-ID: <20250116075919.34270-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250116075919.34270-1-vadimp@nvidia.com>
References: <20250116075919.34270-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|MN0PR12MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ff1844-9aff-40d7-9b61-08dd3603c8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bhs6k3nLCehJfpdHdoY/md4iKcHLmA11NDRqoHphLqxQ136hLGv/iLdJZp4q?=
 =?us-ascii?Q?C4zDk0TeX4BqKiTyQQrm73THrOoQVPbq0rRYtHR6+/fn2oIsos2v+fUTPz/K?=
 =?us-ascii?Q?/GVXvF/V0w2jW3uawcTpM6c6MPcfppxOQXZiotIvhm1ctU69VjjpDIWRxenY?=
 =?us-ascii?Q?7rrt0hTEPB2ZXz4fcXUMmIkVx7vH6n1cUfVV8YDuFCGbSrPFAPnfDVKf5Oxi?=
 =?us-ascii?Q?Id1h/hUZ1DtrU58G4cTOSwRqpZynl38pPMtU14yOaI6Zi54vRJQahe+FXxF8?=
 =?us-ascii?Q?dXb3qeq8lgZeqy7xZIlSkM6XAm/f8NZoZ66YHPiiItXtkzS6UuhduZuzzTBo?=
 =?us-ascii?Q?8cAV6EGTnkRGDNSaiudu1wQJINknD1KmFch/S2dYJqSde+PPOrDGMta+xZz6?=
 =?us-ascii?Q?qyZSiop1K5RLiIYS5B2JI1eaacdjh7PV9lpj4EfEfu90QTngTVzkHBPq/GxT?=
 =?us-ascii?Q?zkC5l/yQirP8rKDb+RR3d8JbJG47lvMZAOX5YZHCxQBYeItnJhAaJHG6oO22?=
 =?us-ascii?Q?DG7gHv0R9JH8Y8Z6LNuUg10js2PMl27n28JQfVoGv6hopEed5YLHSsQfTZQK?=
 =?us-ascii?Q?3EOlQ8Qi9jZCQpdu65JAGAQKabRFOs0jhvlEWHfFU1pFmPF9s4cxdIZizq4U?=
 =?us-ascii?Q?z1GrvaOtJltBwQzdiuRe3spKtfRxiQnJqwJcFh+90dY4dRD3LEPQmeBZZjhK?=
 =?us-ascii?Q?8RnYviGclsEAAqhkNUbgyNwcccLQVrIokBi9m1v4q0Z+9j9W25k8ukOj5AVU?=
 =?us-ascii?Q?Og4ktf3NEG5WiWJ6IqKtXJr1NCo3bI2ZVsx6JGgk8OFtvCya0k13jUEZJO2e?=
 =?us-ascii?Q?DVGEu6j9toQjK2HQMDsCO0DgmqRcHF9fwIbbF9BQTyknCGdhxh2aemrtP3h2?=
 =?us-ascii?Q?tGEDVT1My1s5/ZFAqZ6L2cnorsaMC02mybY+1x3gO+XpkHAqWxvQkN45yjPT?=
 =?us-ascii?Q?TT9imU502JKKoWf7cOJOBAA3iQH3hNzo3gxNOTAHHBPM8lkFO6govi4iDY6v?=
 =?us-ascii?Q?zVnEQKSnXIantoiRPVGpp7iGwVSjCL1ciqg24AMPVyD1d4aZCY5FnMnWFde6?=
 =?us-ascii?Q?whpratALb5lcCV93RACXkiZ1cDqihgjW6AIxNcdqtDesPR9cpdw6BbUyLt/T?=
 =?us-ascii?Q?BOCMu9Qif1sL1wa4Cy/RygEnGhy8wADnekDJZ4Mt24K20q9lDp13umEhLTm3?=
 =?us-ascii?Q?YUkFOvBbimekQnUXZnAfX+JCB2ZazykfRFfSG9Bt7nIb4eQD3zWiPXJxsTpF?=
 =?us-ascii?Q?Iww0BZm/+0ennjMC0K7EhAbxEJwOxWwVOTFdCXhpSdCuLMDFYIgjrimoIPws?=
 =?us-ascii?Q?Ffp85xHM1vYyD/S2nq17UnWmq8f2BPwIwiB1Sq8g/W5dwHFpW4HnnfKcJswx?=
 =?us-ascii?Q?1/fWCvCfZDbFG822/M21uHXmRSs88ujZDrLKOQx6HDSvH0Y+sIMRjUxmV5+P?=
 =?us-ascii?Q?aU6/PNlwy8LCIse7WXd9fBiPgAEX44POh+JfoA3omMTAVtR57Xt6rXR8I1kb?=
 =?us-ascii?Q?jqfEi0Vs9DadPtg=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 08:00:03.4160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ff1844-9aff-40d7-9b61-08dd3603c8ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6102

Remove redundant spaces.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index 1a09f2dfb7bc..8207447aae16 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -2247,7 +2247,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_modular_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
-/* Platform hotplug for NVLink blade systems family data  */
+/* Platform hotplug for NVLink blade systems family data */
 static struct mlxreg_core_data mlxplat_mlxcpld_global_wp_items_data[] = {
 	{
 		.label = "global_wp_grant",
@@ -2279,7 +2279,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_chassis_blade_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
-/* Platform hotplug for  switch systems family data */
+/* Platform hotplug for switch systems family data */
 static struct mlxreg_core_data mlxplat_mlxcpld_erot_ap_items_data[] = {
 	{
 		.label = "erot1_ap",
@@ -2387,7 +2387,7 @@ static struct mlxreg_core_hotplug_notifier mlxplat_mlxcpld_l1_switch_pwr_events_
 	.user_handler = mlxplat_mlxcpld_l1_switch_pwr_events_handler,
 };
 
-/* Platform hotplug for l1 switch systems family data  */
+/* Platform hotplug for l1 switch systems family data */
 static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_pwr_events_items_data[] = {
 	{
 		.label = "power_button",
@@ -4401,7 +4401,7 @@ static struct mlxreg_core_platform_data mlxplat_modular_regs_io_data = {
 		.counter = ARRAY_SIZE(mlxplat_mlxcpld_modular_regs_io_data),
 };
 
-/* Platform register access for chassis blade systems family data  */
+/* Platform register access for chassis blade systems family data */
 static struct mlxreg_core_data mlxplat_mlxcpld_chassis_blade_regs_io_data[] = {
 	{
 		.label = "cpld1_version",
@@ -6573,7 +6573,7 @@ static int mlxplat_probe(struct platform_device *pdev)
 	}
 
 	/* Set default registers. */
-	for (i = 0; i <  mlxplat_regmap_config->num_reg_defaults; i++) {
+	for (i = 0; i < mlxplat_regmap_config->num_reg_defaults; i++) {
 		err = regmap_write(priv->regmap,
 				   mlxplat_regmap_config->reg_defaults[i].reg,
 				   mlxplat_regmap_config->reg_defaults[i].def);
-- 
2.44.0

