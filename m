Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3C915CD79
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739650; cv=fail; b=DXSyiGUU4ccOn0DLK8p5stwghLJzyUa31T5KFePSppKvwmpzaH3p0UvAcGvjeo6l66BDEPxUbxQ9r6dE04UHbFxB216b2lw00QusveurJWGTKWHnR7G7JvBBTYLz9XKnJIn0rkvq+OAxJVK1u/xhyA5tefiNQEIM1X8pBk5b92c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739650; c=relaxed/simple;
	bh=fOXasMPhAxVyO022JLtlQMYsX+Zzg2orDaXyH9KOgvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N7kmBeVx69A9LiVClHBWH50TAZnvxsi+wn8NfU/S/TqfldirUrVj6kwmlq7mPIb/UCtBg98mP+nQLne37v33tidhB5syifd2XWyDM0CTjZmr9sqh7r54QgEL0p7YrXAIfWE2KZTxCXgTxrSVw2QJI8eIkt7QnYl4mIBisYziSbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SxwIfT4L; arc=fail smtp.client-ip=40.107.220.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SxwIfT4L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sa0eXlS9sgjBil6Qoj5UCTrnUv7z6IOMp/MVbvVRe9N6WY3dEcVIWXc79T+CVHrFy8AUX7deS7uKcTLe9izXuOsXrHFcESx3U9wrMWEjOtzsAa8xfmPkTtcJBc/EJu91FBWMyDdlsQD51Hm/XqcMitmI9eApmfnnp66uQ9n2yUy5B2K3/RdUBdhsNBW7WBXobQprItBGAo4LFjT1ZsPrVBBPhswitVxVnudGRx6WGKlpHC9EgV31Pp6DC+22otLvabLjQIUJxJJqryRpXSfhDcgK7NppcoSo3SwGaQItmK0iNX6wUkv2/lpnTNwAt7gcBUqEiWNZXh0S8QfXIpse3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OeRSr6qQ2KgXRb9k9jUoEzMC77JJfo85Tjq4c7DDO4=;
 b=uaN9kBgI5LCnmPjkeQV2CLZaPhrArjaoCEeEVRrPURRq442/iA8KoxlX2Uj2gXhizGbt0fFK6fAUzCqJjoVNFtFBmmR3X1w6v1024oDyoWcPCwogNUFXo494lUYtiW4zMTDoiKCGJzCDmPxYU+E0LCP5E1JHmkcnRTSU4OBpbquMKJwCIZVU4smly0MtyhzmT7iNaHAIFrn9iwYctMwmzlpQz9aVdtgXk/9SA/YVPjb2F1yySMEioaM+2CQhPvpQ8Q6yk49/UotGKYuPhwmEQF9GAk156C1WvhjZNTiKKEzhDykU96pOmgxlo2P1evpm3F0dsXdOecJvV3C3E+Ws7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OeRSr6qQ2KgXRb9k9jUoEzMC77JJfo85Tjq4c7DDO4=;
 b=SxwIfT4LiwVu4tiOBIQue2ejvjxYP5qRVhxQZYI+ljKwdSbwP5lNsY8mPJOH+LOL1gWbPvxsvWwvCQPbPexEYPusI58y87nqDoGywuhS1BVRMVvY3li7MLbKlmggpxCDBUb7RLUelp43OJiJGY5jw7ocsI12p4S8eVSb0GarPrZQrisSnoryVIWhYp4qbkZ54dMt9OQkmN80mhHexcSvgwUqg8Q/izf02PUM6Bk8MHSAHn72fMzxnDlfiODmA9TkhcHtHN7M3bpVeD7El5uHRJZIkqKesYqXMOIYgYdjp7CgaipHEUVaflw0G5bI7WSKDrkpPsn2xL5JpkIy6DpGFA==
Received: from CH0PR03CA0293.namprd03.prod.outlook.com (2603:10b6:610:e6::28)
 by DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 17:27:23 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::cb) by CH0PR03CA0293.outlook.office365.com
 (2603:10b6:610:e6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.20 via Frontend Transport; Fri,
 24 Jan 2025 17:27:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 17:27:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 09:27:02 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 24 Jan 2025 09:26:59 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v5 02/12] platform: mellanox: mlx-platform: Cosmetic changes
Date: Fri, 24 Jan 2025 19:26:20 +0200
Message-ID: <20250124172632.22437-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250124172632.22437-1-vadimp@nvidia.com>
References: <20250124172632.22437-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|DS0PR12MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 499b8d47-13d0-4ddd-fa67-08dd3c9c5d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u45kbBIgaLif64WgRLdYYqzU98Eosi8WHlG2/ao3cQTZ3g6BWkAY1hOJGREU?=
 =?us-ascii?Q?LcYJ0rd6nPwhVrL7OsAxgWHz350aspR0QFvbnGrNhHzob06mgesuY8CfwsnA?=
 =?us-ascii?Q?5RyLJTiWquCrNC6cb1oYpD+D3Q+52wlK2wqA9klrh2epuVGnY1HH9EQu7yrm?=
 =?us-ascii?Q?PTTiNTm67TDCQ2zp6xV88zzbp860fHiPCzfE4olKtU6ETR8xOZ86yXLZwqnV?=
 =?us-ascii?Q?l2RqprnTCKSjzjllFYVjnyTerQ1AvL9UjDn8eadRaz0lwNEgbECmPQusDddH?=
 =?us-ascii?Q?FACAELAYwXId3Ak3lEA+ln/fNarXZzoVRDGUr556V9GgStMExqdvgOAVka4X?=
 =?us-ascii?Q?Q6tWK05UuP5PMD/m286nqagz3S/RriDl9/3Age03+W+szNyUebuGk8hLBZqr?=
 =?us-ascii?Q?L+xmHMp3knRCyrInmN1mExnZFCwZcJ3zYCK4DS7i5gaqc4HFZ0XdHkrV7UiE?=
 =?us-ascii?Q?aCbPa2n9WlRmjEZtJvn9xTjogVNYO7nm5wyBgysCa6YoJQ5Ichj9nG2nH/82?=
 =?us-ascii?Q?6wzTqRGPhObMXAj9pdSVQYI5h2dXXst5l16d8ZNi7VtRHTnjt3VX+WC/6ib2?=
 =?us-ascii?Q?vbBXS+7RNxFbk8b6D9xCEwGGaEFqAZtf9LP+yySkV88s5zNa9FV+qQu6bOBc?=
 =?us-ascii?Q?wCzAbALuPy9LEquhj0j6BIZzZ3NT3GVUOTZ5AbJ/GUoUxrt9vp8vwmR37gWm?=
 =?us-ascii?Q?IjpTjJg98lQ1uFmk3+A/YX7GKdl3uGtngfYRh0s1mfaHpRbsn8vMekA1LHFR?=
 =?us-ascii?Q?Vdk9B8za3xyCvvpup9CPbtZTWZ+bW56xefNGmnzh8tXby/WRU/+4hyLJMlUp?=
 =?us-ascii?Q?3Rub8oOGnpPsh2cpJT6RFX9fiM7wJs5WAcOq+O3QamTdItY95jQmA+oXLAcX?=
 =?us-ascii?Q?6S0npUXjh4UOwyTgprIMtG33mmf9kk7MAqJSIVFTzZEvOIXIMzkf6NY/whXO?=
 =?us-ascii?Q?sdM+IpU/aRJ+FILhQewgRJy0v/JxaudVp0m+qvSCcAep7rIC+7gfAcRizsUC?=
 =?us-ascii?Q?T48+mvdjRTKsN297y+oXExrL2N5OBBPPr/VMBpjJ4VOHIMky1KentCqvpp+7?=
 =?us-ascii?Q?Zmxo3pJRkdkfgZu259n/V7LoJw4XSBEM7wHTNXKHzPtpW00TjRkyHG6p4IZh?=
 =?us-ascii?Q?kIVpuEiO+NIOII4Ps4k1mE7pY2orwocxZY/aY3gEXCQGbghVQZRQVeOilNbS?=
 =?us-ascii?Q?yTlqvfH6tPwfwbLAZYOjRgW2CsiEwvO8YTA12x4u7UGzwLAwCsuoefonJrN9?=
 =?us-ascii?Q?AVu/0Czs6dPI/ZU+PRw3R5hlMUf6Li7jpIPJDhSkWu10Ha6oH53SvnQtaZyR?=
 =?us-ascii?Q?p8pgrr1L4zFSbNwJDK1Kl2VclE+vUyx9aVmvZZf+HtpDBrS9vpRhaMq5oFSj?=
 =?us-ascii?Q?J0XtbSJTalzlVNj4cKD2mV7BNsI1SQ7IQbjk+jvZ9omuDw4YDGTi99awQUyg?=
 =?us-ascii?Q?4SxWEVjEph4l1k+3U7qAZbVdhws4Hv10iC88wovtrTRFk0LyPYtmhDpJQwNB?=
 =?us-ascii?Q?RTmRtI+t9dVH2Ng=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:27:23.0225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 499b8d47-13d0-4ddd-fa67-08dd3c9c5d27
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8317

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

