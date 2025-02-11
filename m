Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670F01EF0A9
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265613; cv=fail; b=jg9pVVq3XR4hycqusR0hBU/nEg9t10kx9wuGdLRAeceQHhBtN045WYKtNac7u2GHNknNrNfn3hcvT4evdYyq1xkFmsSq0aQ5gdvens51cOdTys7/0t/as1DoGHOaLN6VnLTObiKGB6iVrKJdchXBgR7kwqWFi6dD0njgi+rUnEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265613; c=relaxed/simple;
	bh=NntBIzRxcLd4l7b71HUxpN6NxB53CJKqnVdatkucvpQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R02bwMARrsaoT9hyYJkFJ5g/LDQNojerMK8K4nCCI/EflkC0TJ0lVHVD9Xvm5HuFn++tTe+Mmiwmosgi/I2J+uRJisO4iwVzzmX+VPB6/0QVVzjBYN30g8KwMi+Dn1rNrgX73IwS6EQLxoOrhipCEY7MCuN3FhBBbBm/ZDE3Tfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sDEHOpuX; arc=fail smtp.client-ip=40.107.237.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sDEHOpuX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGegb6tW1sf+U1zJx51a5ZsDtURYnYH9d+dorgxKZl3LtsUFAsjCeg9PAsU65YEsne3dKF2L41YpwFoalBDSmX6fKS+MduucFXnDeKdIhfojet8wdyPcriuY44Xu+ntCGzHEF2arLQYa2eXZtliR2w8/TjrbbllUbni4sb58q4xjk4AbyI9SfBDlsYaf3VV1Ua4EGvSzdT++d+NwjREfCcP/Tx88wEz7q9dk5suiaQNYoT11OW6aiO5PSLdPL5411w2cb/ki29FOCaXovZ5ediP6BCxdZgRQMwNRcJmKxYNLT0Si+5HKGgGpmzf5OkEMlep6yS9FNElPBQQd0hQF9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkl+Uf1v4jJhVTl2xznFBNeOoUXNhNvWbnEojEH9jEA=;
 b=m2IF/u1QGFLRszhJ8OJYj4EO1Y8YVYSAmohpLdZm36DKfQ/ROhcXg47KomlxLd3TQqCDwe91/G1grnHIQZ10rav/Iz3fVeK/m/tZRaZ7iGwgIHjLbFqzH2xyUusdR3kb63wuDYCJszVUb6nD3+aSgUhMnVCmagZjSpSEj8CbKUYWIVQ/y6fK8UH+gidXP/qWMatCkwh3vpsS/LmotN5CMNqj14p0+M3hxTsrjTLY5RQUlRbWZkpFY9xn4EqB3rwoImKi7KAh0nOSfFAPH8e8dk4CiznA1CieTbqU8We3uqzro0AZQZyeWr6JirCGoaHM1jYR6e2H0gTjUbE8zu9QLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkl+Uf1v4jJhVTl2xznFBNeOoUXNhNvWbnEojEH9jEA=;
 b=sDEHOpuXwTJPDzw/Oy7Tt87FHGhyTK7yqr0OkWZqCYJAGFPvw3F7WmGrRpif8DKokfSvlkfFqZ6pnetcJicvG3QdpUfz0eCIP+B9X3LTQP3lFvPDppMS+P90e9qThEHyxFhygl4nRIQhKiBHjcRacLMos3r8cJpoCw9nMV7nLhCCUBemlONuw2z2ucljKAEeTOQiSqRJr7qZF8vtb+KexG2HVCifvDjHB5jn7jx+vf0LQBpvPV13D82waNLA3H8IycVY5xCK6RfRfd+mNDON4TsAqqI9ZuN/CZ7sfyoyiZzjbXy0pI89zmYwaNMEIOrjo3SNX+Ky7/mUgi/ZXIgd8g==
Received: from DS7P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::33) by
 CH3PR12MB9454.namprd12.prod.outlook.com (2603:10b6:610:1c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 09:20:05 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::bc) by DS7P222CA0018.outlook.office365.com
 (2603:10b6:8:2e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 09:20:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 09:20:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Feb
 2025 01:19:52 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Feb 2025 01:19:50 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v6 3/9] platform/mellanox: Rename field to improve code readability
Date: Tue, 11 Feb 2025 11:19:06 +0200
Message-ID: <20250211091912.36787-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250211091912.36787-1-vadimp@nvidia.com>
References: <20250211091912.36787-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|CH3PR12MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d92b0ed-ba59-4469-3a15-08dd4a7d4585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mvUXRE+HrrweeHXPzKnYnJmq3P2hrFJMWw+gu7y/cfWhumyKIS5lBhiPcKqI?=
 =?us-ascii?Q?ISbINw5TuMOoC1eDF9bkQUPDbNk24QaFCUBdCVPidrGo2ZEfnDGEtBjE/X4k?=
 =?us-ascii?Q?IycogiKNhD6y2xPuN8xBbhMsss4zR4o6rMgxy9nvVWTQzgtoBHze8gtQwBlr?=
 =?us-ascii?Q?IoluRyGgBg9tk9IOEztQIjKSZjHPg8fVYJ+/B+J0+49rtJMbX24MzY6bLXY9?=
 =?us-ascii?Q?RGuEiDXDVU4EtLbdM8aW5vniJ2fuzpc4E+mTUnYZL7qnSuhlNasS0rrmi0tX?=
 =?us-ascii?Q?NWRdiHWrHUdsshRSy5DghA8Bu77S3LILLUnpFfqEy+4QKR/cVY0YpM+aXPPe?=
 =?us-ascii?Q?7yPbHvZHm2WA7NzW8pqF3r2VB4OdV2gM+HHVjYhi6ab9KQ85j1uJDO8uIs46?=
 =?us-ascii?Q?jfi4jcdjMDN4O0i03fWnuOHZnPLVh5M8Z5GQh4y043qgXnV/bvoKC4+okKte?=
 =?us-ascii?Q?AMujS9IopFTWD6gXplgROolj7a92BOmHGHfKV6T+xRbAZlEb3CIWnZMqbbI1?=
 =?us-ascii?Q?t1JKNbaCQTWjXJGT8747UGyZluHnztIJMpJOWQMxTdPjSoIpX/eZ5nbNecmD?=
 =?us-ascii?Q?lFxaaUrM29iWuBfCoL5ABZSeeJY0hrxItlbC0z0vzqHa+Y5cB1VcZNtRqqXP?=
 =?us-ascii?Q?uvGEtxqTLs/ercXgpHLRWT1Ola9uHNQSC84sh6q4ylVpEmYQGqAIwvCOmS4l?=
 =?us-ascii?Q?uiiWlVkaRIJkeD0d0ZOkRFxSnnsNjUFcUPxUGwYQLSKGQiYXPSSsKuFeCSOT?=
 =?us-ascii?Q?4L/BfMJ14aJR1Py29l3Jg0WP9RdnlCl3Tt5fVXh+cKueqwuHFxTLBvAkYHiI?=
 =?us-ascii?Q?X7eEHuJuw3TXOUmscMr4bJ2Lc+hCGLAVTwNb7I3e7n/UVlTUKTTQC8g5vyl3?=
 =?us-ascii?Q?eYM36SPnEjMY9PbSA1ebhUbCMYSHnavvwa9HOiZuR4aoPmgV4IVeRvNSFQcT?=
 =?us-ascii?Q?lKiEPSciC3PoumRdDaRksNecUgp9MzQffI7l9t3CFeG2D/P8nVddqIlsrpV5?=
 =?us-ascii?Q?HQ0bA+UZLgO9/v2E808850kqcsiwooScPnn+93g0EmKPrmo48wT57jtWUbTN?=
 =?us-ascii?Q?m3KdZGe1gItrSbRt9kUeuEfU4g21SRgYR8Bcrw7ZzI56q6FBgkh6tNk0+Ix8?=
 =?us-ascii?Q?Xjr7hCeoKtLnV+9IEcS30fyoG0hfwhNYuUvUqtFGfJw6QoXnhzCHs8UhgYRi?=
 =?us-ascii?Q?kqLCHqq2q/e88RsEXRUcV2HkY7dEBZhz2X1HVQ50Y/oANxQF1z6A1e4RkuR4?=
 =?us-ascii?Q?g0eFkrhnwQPhd04Uq3TLHwMJ3xleojNjupHClEKtWGftnANeV7icDocNSZ26?=
 =?us-ascii?Q?7XGOaRJEoHZSGm5/zLbYtjk16ZYRJyefHLArxVYQ7yQHuWSmuEDAplUnJL2u?=
 =?us-ascii?Q?RiC6UO6zmGH95rPbt2IvZd+CYOxLm7YvYECWywth9RQdDB0+3vuJ9qcNpLJM?=
 =?us-ascii?Q?g/7lqb1aRiUM5o5H4Ew8x0zxPAlrLHJM9lUTkQwiBG7tV1Phv0IYBLDk3BxN?=
 =?us-ascii?Q?DMihvUe/OYbZH78=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:20:05.2642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d92b0ed-ba59-4469-3a15-08dd4a7d4585
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9454

Rename field 'counter' in 'mlxreg_core_hotplug_platform_data' to count.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v5->v6
- Fix commit text.
  Only structure 'mlxreg_core_hotplug_platform_data' was modified.
  Field 'counter' in structure 'mlxreg_core_platform_data' is not
  renamed, since this change will affect other drivers in different
  subsystems and it will complicate submission.
v4->v5
Comments pointed out by Ilpo:
- Fix misspelling in submit text.
- Fix structures names to 'count'.
---
 drivers/platform/mellanox/mlx-platform.c   | 26 +++++++++++-----------
 drivers/platform/mellanox/mlxreg-hotplug.c |  8 +++----
 drivers/platform/mellanox/nvsw-sn2201.c    |  2 +-
 include/linux/platform_data/mlxreg.h       |  4 ++--
 4 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index bd3bb06ff8f2..2334b740267c 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -852,7 +852,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_data = {
 	.items = mlxplat_mlxcpld_default_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_default_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -892,7 +892,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_wc_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_wc_data = {
 	.items = mlxplat_mlxcpld_default_wc_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_wc_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_default_wc_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -902,7 +902,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_wc_data = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_comex_data = {
 	.items = mlxplat_mlxcpld_comex_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_comex_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_comex_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_CARR_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRCX_OFFSET,
@@ -949,7 +949,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn21xx_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn21xx_data = {
 	.items = mlxplat_mlxcpld_msn21xx_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -1058,7 +1058,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn274x_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn274x_data = {
 	.items = mlxplat_mlxcpld_msn274x_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -1105,7 +1105,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn201x_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn201x_data = {
 	.items = mlxplat_mlxcpld_msn201x_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -1229,7 +1229,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_default_ng_data = {
 	.items = mlxplat_mlxcpld_default_ng_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -1389,7 +1389,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
 	.items = mlxplat_mlxcpld_ext_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_ext_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -1399,7 +1399,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ng800_data = {
 	.items = mlxplat_mlxcpld_ng800_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_ng800_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_ng800_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -2240,7 +2240,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_modular_data = {
 	.items = mlxplat_mlxcpld_modular_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_modular_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_MODULAR,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -2272,7 +2272,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_chassis_blade_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_chassis_blade_data = {
 	.items = mlxplat_mlxcpld_chassis_blade_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_chassis_blade_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_chassis_blade_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -2363,7 +2363,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_rack_switch_data = {
 	.items = mlxplat_mlxcpld_rack_switch_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_rack_switch_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_rack_switch_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -2518,7 +2518,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_l1_switch_data = {
 	.items = mlxplat_mlxcpld_l1_switch_events_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_events_items),
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_events_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 93bdd20fd71a..a082f5cc26e4 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -262,7 +262,7 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 	item = pdata->items;
 
 	/* Go over all kinds of items - psu, pwr, fan. */
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		if (item->capability) {
 			/*
 			 * Read group capability register to get actual number
@@ -562,7 +562,7 @@ static void mlxreg_hotplug_work_handler(struct work_struct *work)
 		goto unmask_event;
 
 	/* Handle topology and health configuration changes. */
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		if (aggr_asserted & item->aggr_mask) {
 			if (item->health)
 				mlxreg_hotplug_health_work_helper(priv, item);
@@ -611,7 +611,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 	pdata = dev_get_platdata(&priv->pdev->dev);
 	item = pdata->items;
 
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		/* Clear group presense event. */
 		ret = regmap_write(priv->regmap, item->reg +
 				   MLXREG_HOTPLUG_EVENT_OFF, 0);
@@ -695,7 +695,7 @@ static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
 		     0);
 
 	/* Clear topology configurations. */
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		data = item->data;
 		/* Mask group presense event. */
 		regmap_write(priv->regmap, data->reg + MLXREG_HOTPLUG_MASK_OFF,
diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index abe7be602f84..451d64c35c23 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -517,7 +517,7 @@ static struct mlxreg_core_item nvsw_sn2201_items[] = {
 static
 struct mlxreg_core_hotplug_platform_data nvsw_sn2201_hotplug = {
 	.items = nvsw_sn2201_items,
-	.counter = ARRAY_SIZE(nvsw_sn2201_items),
+	.count = ARRAY_SIZE(nvsw_sn2201_items),
 	.cell = NVSW_SN2201_SYS_INT_STATUS_OFFSET,
 	.mask = NVSW_SN2201_CPLD_AGGR_MASK_DEF,
 };
diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index b2a3377a28e5..a660bfa4bc6f 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -213,7 +213,7 @@ struct mlxreg_core_platform_data {
  * @items: same type components with the hotplug capability;
  * @irq: platform interrupt number;
  * @regmap: register map of parent device;
- * @counter: number of the components with the hotplug capability;
+ * @count: number of the components with the hotplug capability;
  * @cell: location of top aggregation interrupt register;
  * @mask: top aggregation interrupt common mask;
  * @cell_low: location of low aggregation interrupt register;
@@ -228,7 +228,7 @@ struct mlxreg_core_hotplug_platform_data {
 	struct mlxreg_core_item *items;
 	int irq;
 	void *regmap;
-	int counter;
+	int count;
 	u32 cell;
 	u32 mask;
 	u32 cell_low;
-- 
2.44.0

