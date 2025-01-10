Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B34A2063C9
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516765; cv=fail; b=nAeq2xQoKHCHipVY7oAKKZwBS7wx6vy+Uei657rv0oedWHObTsr1fg4vozZodPKu+1Syh24o8Ud5uNXvPte4rMQbInkg47KVVBQ7B00zNHMO/5Lso/M8roYWeoh5D+lifFlge3IdG3slpuYsil9mYv8XBYPtH7It58nDFwYbo1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516765; c=relaxed/simple;
	bh=68uxl0sAYY5GKSKb0XyxCbj4pTkL2rHxSAfb2fDO96U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KjBme1InqsRl9qPDE1dgIy8dAUxqKIAyKlPVIVnQBsqYaGmWV77LrXintp3+tb5X2xPLbk+3EtsFXH28pY7J1IuXo2b+QxGGz+ldnHM0biu5EZvFuKE5phSr89Yk5AX9Cp1gfPQVJnGQCGA2mITsjpS3iWfP0kLq9l2sVY4bwew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mYQ+lxvf; arc=fail smtp.client-ip=40.107.92.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mYQ+lxvf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQtwoI0iJRKVkdv0bbQ+0nkqBAQVPQyLqtf8ZMBlaGWIx75HlqDJg9ebCw0El4IMbn0xcblWDtT1ZRBBKj9gTI3p4qIEvIMFy2457gjVBeNnEm5Ufwr6iODSE1D/jIETPUmmUQowMXHKNM5yQ0Pwvb7bXMlz/wbAkSjNpFfjxZlafmk2XjytH6Cw/qtCSiC4uwaYa3m0nOPT7AKNZi8jG962JBRZaojyjTpPDTOl1fv4+3LNlOS2rTJb6nBiaeX8pcJAvFlPMazijE8vHSmvj/C2Oq9NHB09lj1TG72Doe+qkRvQ7bKlr+shfuLBTrkV0jMpMIqYWNlGfejWp+fdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUs+nLG8EqE/33QEsloDn71t/GQzEcKIjluJoJ6N0hM=;
 b=E28hztwyaAUt1C887IJYLD4bWnR1odrPPqsfcCGNud+ey/UTFYYPJN+vo6cgRh5UJ72rIj+hWtRdOJt5wQ48YYHbj0OTdzBeKCT2s4CvfvaNEw/mn6aXmclVQjRR4DLdRI+SEvvaLLN9LCpnBfhf2ePSF8uWv+hEvobO4HV3qU17H7QfCK9xmTaAjUptmsBnt32Czp1Kvib02Khace0aRyBs31C2xZ8xw4Ks/abYozKaTOiJC86ZNemFazJ9pZseMudnALXQkmRDEpc8Pl8jsth8K3rrnnxnDifScbIuOSstuf8kggWXiciUVGClJDMHlJSWLgarm+7T1XP+4ZRhTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUs+nLG8EqE/33QEsloDn71t/GQzEcKIjluJoJ6N0hM=;
 b=mYQ+lxvfo8eA+Fh1YfaigYX7IKabMdcf8+a1e8cBwuimFK3Y9/0sy/3q+0WAByeGQ3s7o90CMEJzhrnQC5HlQMC146joTars3Dy9QxWPNV1udQpxL3qSIbJCAr8ZO0XDJF/EXSnjAdEsYjEjtGVXBmlxnujARmsP+yZ1/Ijg490HZN8G5qadIa6NxJVUJc+CFR8emWdlCkbGI2jOxQs9CJyUxPbl9ctwF50+zvgw0EIDPJAPVLTZc3IB6352wf/29cWzfUIIrfckWeVzTSwpIWohaMlpYpAopVnlvSHZO14jIrwnbbsXSELQAk4qm+HMryTo+N7idQzXz+DES0eTZw==
Received: from SA9PR13CA0018.namprd13.prod.outlook.com (2603:10b6:806:21::23)
 by BY5PR12MB4228.namprd12.prod.outlook.com (2603:10b6:a03:20b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 13:45:57 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:21:cafe::ef) by SA9PR13CA0018.outlook.office365.com
 (2603:10b6:806:21::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.6 via Frontend Transport; Fri,
 10 Jan 2025 13:45:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 13:45:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 05:45:45 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 05:45:43 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 02/11] platform: mellanox: mlx-platform: Cosmetic changes
Date: Fri, 10 Jan 2025 15:45:00 +0200
Message-ID: <20250110134515.8164-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250110134515.8164-1-vadimp@nvidia.com>
References: <20250110134515.8164-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|BY5PR12MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf26643-172d-4418-08fc-08dd317d1c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qny0D+KvbKSKB/Su7cN2pQlEJSPdBPJeYRiU0PkHKSZeosAFZIMbGVOh5A+J?=
 =?us-ascii?Q?WD3NZCwzmS9NMGSZrL0JLqH7J5n+WMXbFhkl9SCdfsEwnRTRXiyWKAGoOFQX?=
 =?us-ascii?Q?W+W0spqCbtkayBwXhaiYrBf6tgig4Y1DCNnx+vx5femqAHXSv5vYuT9YHfta?=
 =?us-ascii?Q?43f/o+zExvM8LxPkgO+utAdoeV5BOUfF7j1ILgpwya9AXwRL6LpdJ4F81dpc?=
 =?us-ascii?Q?j0g5SznodndZPdDTCMMfmQgNOvExsVeYxXOJo1TLoks6B5k8IUCsTjQmRu9k?=
 =?us-ascii?Q?3gQcCPFrlhCnqXRKzDUkc6k87eKJIYWuh8DxXbP/vCiBpMAIqi/38m8yIlj6?=
 =?us-ascii?Q?OCC+N7XWmCwmjv6rYVjaLNLoR60Q7LIzF4xHlL8KcKvTHsgPj9bePXi3R5IR?=
 =?us-ascii?Q?HbQ0m3mGQ9s8dJjSCFi/rU425L0ubxGNmnokf8gqzGF7ZG99g6Vt8UbGoyhA?=
 =?us-ascii?Q?49N+/HXjZ+soGPMYW173AMfOouIKjoLZSpCFmweV2cmPU1/416qKZQGJT/is?=
 =?us-ascii?Q?g/ARCj3IN35YkQcwUWtSkSwEe5G7QqaP7h+drzBj2Ub7jw+r3PsLFFRabMeu?=
 =?us-ascii?Q?VV1lBOuMzItlloPT0/4X8gc1TIA2dSvnGyxfRxmHBUDjL2lDBzzJebXjtVU3?=
 =?us-ascii?Q?6fpZzaFOFQp7L4kCFBqRrfmSekqUThrjQzUKONSjdtLmBCYaY0R0QeRu1Cem?=
 =?us-ascii?Q?Kg27rT6gjh29W1JebTanexE6b1JzTw1Br7E0iYT8r5vQfm7C7rgTl/Xffzce?=
 =?us-ascii?Q?Fc0qF6YVArLgYg/J83a1YPn00Ti8CnkgCv43LpxkttA6kh1NmKhm+W/0Q0d2?=
 =?us-ascii?Q?EKHTy0u0Yww2tpSJejJkh98pxyKgPifevjVnevNCseRMNcH+jP9rHaZtPRcX?=
 =?us-ascii?Q?7ayuYZ7amXblb0NslBMxHfWw/Tf/N4YF14UK7KLcWccl5Yo1Ey3RcTdqRpnu?=
 =?us-ascii?Q?iCNPqHTtXC4M4AxYWXdoH0JVYACG5QGIvUpCullGH7f9S799zqAVPHstKWU1?=
 =?us-ascii?Q?SereQCK2w3p4Xdau3Ec5himeQSV8lpelcHTCQrkybLRe6YphEWNd8Y1Wn8lh?=
 =?us-ascii?Q?uWODeJldTVl4IUdcdO32P8GxcSC5OwGCOkNT1/d7NsCy6Qfj3sElYr2cuyQd?=
 =?us-ascii?Q?z47UjGqtE3WJmxgNtjHcO0hBvaMj5+agXzXAIX1/LPv5yXgFgq8ZY1fK8rFz?=
 =?us-ascii?Q?iUS0QSVW5I0xasOkUqB0fCH+CtZ2WW/g1R9XwBvB3Fw6vF808PsfjjMWpJIn?=
 =?us-ascii?Q?WWdfyD9lfWrJ2ykCrn0c+i6KOccjeBP7ikLLmmLeE4sMOhqElD8EJTkaNqzD?=
 =?us-ascii?Q?HnM67ksx5gblrV7JV50fnWpjcj6Y9VzgnRJoGnfrFObZewQ3U1CHqf1wPOdH?=
 =?us-ascii?Q?cQFoNj2xjH+SHfgm+iPp+VO6XaMys813TohYwO6uw9s7MNn7kwlp+hfI1+HU?=
 =?us-ascii?Q?F0c+4miqKDK5DN5Wnjp/C++hEORlhEBpDKOPWOS2EHSIbfWXOCLgCTkZXzQs?=
 =?us-ascii?Q?M784uq6uiic7vAM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 13:45:56.8761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf26643-172d-4418-08fc-08dd317d1c34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4228

Remove redundant spaces.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Felix Radensky <fradensky@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index 9c7f30a47f1f..383dfaf66983 100644
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

