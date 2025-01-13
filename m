Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2056.outbound.protection.outlook.com [40.107.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2243223315A
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757864; cv=fail; b=LPu5G/0i3Sx4j/c05WFdcfaKHm3NFLPimVC4W5QTORjfH+h5QWJGYIAqjpIur9mnQOy2IeaZewx2tJDbFgMJ5eZsjtm96XpIEMMuDZ72wYfoeCDLuSr9xgNYW2gYXjjhajqA6a+ZBtPaeffbvAB67XA7i4th9AJbmKg9HjdBEEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757864; c=relaxed/simple;
	bh=fOXasMPhAxVyO022JLtlQMYsX+Zzg2orDaXyH9KOgvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o9R0LKtbCERfAH3t6ggGFR4y8oVe4duyWVCFBgrrzalRxdM3M3tC0HbM2DeGitzm8E2u3FGTtBoZyTfQct2Uc+R+CP97/8qYRUGGS22Zs3RrIR4F2X+DvlDmCpfZ2V5Q76nIEGnz2H6SDJDzka3aSV3U8Yr5hp5CANjZOjy7Ps8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hU41Csnl; arc=fail smtp.client-ip=40.107.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hU41Csnl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJAb1vuAhPwo4rDM3QXRcBohZ53El1xi2ksvK5m9HzxdEi1ke/yMDcac+FdWPq4jDxpxBZslUifJEVdgYTtlmeV60dsGEh6nJuMFOrAmUR+yEZTpvDlLWy/VahHY1nlgu0vLJMYdg59l2IKq4syAsHQtju9EzmXb72QPjSX1Moc5V5hZdbst9LV+n8sbdxnJHYoBq6Gti6Ver9WqpDFb8dVlV0GdTbwcHxwf79RY+Q67ZI8+tbg1DLR9fqohJKD2c4a+8qqIBCr8cTTilmQztY51l9xuoGc3d2W66++Dzdub141vbK+P9c3rpOmHzVeSQjyMj/Isu7jafY/ZnAKUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OeRSr6qQ2KgXRb9k9jUoEzMC77JJfo85Tjq4c7DDO4=;
 b=HQjTTAWLYd9fgDhDdlwau34RsSXl+LtSHRtSsG3nrHiTxkNA5QzO6IiktaYhTbv6WOTAQEpKQLuW9D13cl6y5UufdVZ+RJZEDoQLRsjSOzFkGj4+AZ03enDK26KJE86KWS12rhmHCqe1FrDR8UHQ1BqfldpJZiYnMfp3T04vY8D6UOs7K1CQuKPLeVgGw124+tU+i/3Vb1hp2xo8IQj7PRR39kt454Kx5pcAJIz0eWyhnQvwR9AqQD/z0gPO+d9jFwblE540N76gR7zVHpdho7SC8yBmfubSmtoe0c1QMuevifoDFYAS+RQe9XjaEbNwPhkieQVXqGjsWS0z7LUIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OeRSr6qQ2KgXRb9k9jUoEzMC77JJfo85Tjq4c7DDO4=;
 b=hU41Csnlwl0lOngVnGf8Z6sEaFUH9gn0LZ10u3QlymgdyU/ZwBkJ24iAAtRfaBCp02U+jCIx3soMvCONB1IrdtHzlLEWoRvD7OChQZl3tbNnqqIGuIB+jR2qupsYrKaW6P70qxR+SoZTejZyzY8ph3o6nOJNCpH7DPa53QVlby6tT9TOD2rTvXbV/XQHYm0EvowUMPFfT6BK28jPhcGTXRp/FEbNFKLSzYdrf8SIE0GxfqlVN+sBvLCIxn8HDix84knvYfzOBYFGSD72+IWrjeFRm29QipSH8Nuq6n2UpRpAVmRcs3tupJDPRpJPtRjeGac/LQj1f6dJe0K8E27ugg==
Received: from CH2PR03CA0021.namprd03.prod.outlook.com (2603:10b6:610:59::31)
 by MW4PR12MB7168.namprd12.prod.outlook.com (2603:10b6:303:22d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 08:44:19 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::1a) by CH2PR03CA0021.outlook.office365.com
 (2603:10b6:610:59::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 08:44:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:44:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:44:06 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:44:03 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 02/10] platform: mellanox: mlx-platform: Cosmetic changes
Date: Mon, 13 Jan 2025 10:43:24 +0200
Message-ID: <20250113084337.24763-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250113084337.24763-1-vadimp@nvidia.com>
References: <20250113084337.24763-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|MW4PR12MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e19b64-1ba2-419b-2bb9-08dd33ae7857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cmTAXXMxu/1X/lcF866uIvJ3lNog1ckrOAbBmoyAI5MKw1hP/lCIaKdsh94M?=
 =?us-ascii?Q?BZqo+MmF++s3oly6HwOPsi2UN2j7tv7HIKSd2PK5N2dgc5vAdFFXGC4r5zhl?=
 =?us-ascii?Q?p40k9qsXiIEhAXDTNrMxQyei8P9glIRZ9kB5ocZPICKqBimhb+/0k5URUd1I?=
 =?us-ascii?Q?KlYKVbAHqxPpM87VglxAuzhbykfJuqIh/vlI/GNb19C9tB3Ly3u9Y7JitqVt?=
 =?us-ascii?Q?iRA4EdJSZvXI2KUd4w4kWgoiQuRHZuDL0W5p7vrwNBEe+5NJH05IqpIunpw0?=
 =?us-ascii?Q?kJj3i9yGAtLeMsP8D8Gn8/CGiC4JhbekOTj9UivQn3lWxh9+neyEKCG35n6R?=
 =?us-ascii?Q?Bv7C/mNWE8i5QC/+7V8DaWg3noPwSNSnRvIQO4NhNBPlHyQBWvPVYR5rXIdE?=
 =?us-ascii?Q?BEMvU2zLlCy1Fn5iOj4Ttq64xpHBGF8MgYbCQx/8z5zzYJJOFJX5EirXI3I9?=
 =?us-ascii?Q?gPsVmvvceOmsIfWiecCSm8lk6hAp3dMPJUJuv4lF7tL34AC8YDCfrlT+/toV?=
 =?us-ascii?Q?YGNdC4m26ZxVy97HvA6pLqiT0hK+qvkM+MSi0+yoGS1d/F531AmPdNWG1llC?=
 =?us-ascii?Q?v503g46HH7DOSFmUsnGyTeg9NDtRCAo2U6QcUNcmyCHnVJQ/ttZ56s1hiF+f?=
 =?us-ascii?Q?9/2IlBkO5wuJtQbdvcIGm14X99TL4SFknsE+cjE3Co+1SIa32qCYsMr6mVjJ?=
 =?us-ascii?Q?mu+4dMRbkn6zeJN4JZ3dFJ5+EIzm1y4DjRQlkfbmZwhWsFRNTUPIsuEbd8uj?=
 =?us-ascii?Q?TMHKMKx5uwIy3qzbiKa9taor4xNEUI8f8pyWrwDUL3MBMA8Jg3wgsyuLKROu?=
 =?us-ascii?Q?pTq2zEl9cTN8E/CdEZgq8CsvmbQ4A+tGDJ5y4uForzMvtkdL/oXYrwP1cyQM?=
 =?us-ascii?Q?LNrOvqS25Co8+8DL3eq8nrWE5yN9291gcb+8euWwHxU+gafBAnVMFGWsEL7l?=
 =?us-ascii?Q?1oPoUUtzh5aSrBSvkgltWZgj9QTInqbf8fufqwzm4xPb0t9VL/Nx7ZXW3qYg?=
 =?us-ascii?Q?dUkICh47Bwmes8qO313pPJOQdt378rB06GP+R1hPt+fUHWagtGR+LYA841l0?=
 =?us-ascii?Q?M4WkECWU8QNdyiTzd22NkIvK0eKIxGgfziOtz2kJF9g5+DTxg3AqVlgnP+hs?=
 =?us-ascii?Q?8/yZgzfMF4BaZZCW0oTonS6R0Q1NMvASYdmxdLjqNF0pMPCY+nwOqMrJNidA?=
 =?us-ascii?Q?2ng3MtYpHn9wESXu0BGB31RU32ZYCLkWJA21khvWt+mQYI4nhTNkluonMGPi?=
 =?us-ascii?Q?t6awERKyq6oDKMqJB7ft3krENcQnOj7O68a2taM0nzgwCKt2KTJ76vJv0vVa?=
 =?us-ascii?Q?SzhW3VT3UhCFKmGH74yWWPSmCx00ZRcPu4mlspYv1IPPY6xOrXAks8ts1T+4?=
 =?us-ascii?Q?b7LXugEa4PFgXIbjSSA/Sw+3dlf+eAwcd8xJYtD0jmKsRjkuflAtsunce7Dn?=
 =?us-ascii?Q?JUlzzJvIC37OuC2i+OmpMcsUddMX4YHAqcTsOZS3HQ+HfXZcrnraTdg8y6V5?=
 =?us-ascii?Q?cDROjZCRlhhlE7Q=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:44:19.1220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e19b64-1ba2-419b-2bb9-08dd33ae7857
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7168

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

