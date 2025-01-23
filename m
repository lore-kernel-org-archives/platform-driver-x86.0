Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB65C1AA1DC
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659450; cv=fail; b=QrTlALPppVy5roJuGQv+LaERYLXg4itHhkzJ9XMvJ3wyaEhH1vphnEn0TBPn9T940kHKZHkmdmGclCsJZbhvlMWhaM1Y+7BoRUIXmUxkIDASOk7dg898ubceyO7NQhaJZYqy5s40JbNGliydYyYjh7dYKTi29psOpZ2pqROJ3Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659450; c=relaxed/simple;
	bh=v+/4QvR6l4tZNPStkXGspqNNmQpaknWMT9T4nNj2FGw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lAVXMkjCGsXmcxmfy9t1+djB5BoxRz2MF/83/rF6J/boLlLTUGvdcEt/U+JRkR/UzZZ6F1ZcKrBQl+waHF/mcV0Hjpu54txADwOhySTVSGvqOFFa5OVbLaJssVJGIikWrc+qsSb5IJgHRBnan6tCCSw7Xv+ZqMRk92xJ6SqCyJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tcxxA9LC; arc=fail smtp.client-ip=40.107.220.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tcxxA9LC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4CzsP0D0CqmabYGYtiHLjXzbGWfOMyeYFKxps2XPxQ2CD61tiaRFDz8UnAYtMa+EQU/aw+Ol4fjlZ8wlsADC+1Ozb/64aaJpfC5JlCo68XVgZ6d0qca35evhSCwVxQ9AJhkqVyrReTFdtSIsOV9lG4mD7f72iWaQlvCqSKO95l0bxN+f24IEDrwOHn0cyp1rGbkfIVEhCD7l0b6hNu6vr8kMCBoJf7grlpOxbHFuaHJZw2A2mIQuz9ivCRubW2f7HosNrdnCpS6J7Td5uKVCQYzDaZuv589W8K+jvEUnV09c+zKOpSJQ+tAG/C1+FU7G/zqneh0O4GiUP9nUgqAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSHf09RS+d4mXICY7e/pXVYtwdc6ph9klHC9zxBiyLE=;
 b=etxK2RbOFzCr+1c/p1aDRh22/7M5WgFis/lhd/evY8ya+SrKp30tFVZw0CraHmoLZsjuTFAeAyll3DaCdRt3qpkIZTybmaQdMjOfgLCz4hqgOgnARiHNy7c1SFbMwVkq86qciT6oQL9wgop15miqAnSfglNRAON/xx3pto4gq6/o+G8/pq0tN00DzBPzwYXQU4KZEfWEO/SqpPy2pDsQgn7bF8H6r/aFpoOT3Ow6zgfHGNBW/2+JNR0U/32u+258c+INpreHiZue8X/HFlTVuEPcnx5A+rAqPiRLOhbKxRa5QBmeRBxM0ZaLVdoERVlqY6N2aqbCZbOMpn3AVJyUWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSHf09RS+d4mXICY7e/pXVYtwdc6ph9klHC9zxBiyLE=;
 b=tcxxA9LCGPokHDIPWiwRFhrH2CD6DuJB0rnO2/mh5uKfUIMCToM/YTYmwsgXardpMZL6dCNy0aWwWLWzVxh6m0zZnCXuNaCFgMZkKxZlXFgATutDrU3fRYpW17TJ4J2i+5EcsyIZY1MyK0ViqQMHlHG4PYklgQ4wGmcmgAAPOaqhyUUjeBXU/VpxZQWGcUJVxOxRNpK4skvf5VayMCzI5IOf0Gndg3tpU5ijsZuRlpYwwWwJ8aEQG1Aj6eh5VVmE5jNELDt4rnr9eQ7Vec7ma80sCFYlWoj1Y0HFqh9M6mZJaeO9MKJjBYZ/klN0EpvOoanC9d8k9Mtf47Kfv7k/gw==
Received: from BN0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:408:ee::31)
 by SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 19:10:41 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:ee:cafe::aa) by BN0PR04CA0026.outlook.office365.com
 (2603:10b6:408:ee::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Thu,
 23 Jan 2025 19:10:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.0 via Frontend Transport; Thu, 23 Jan 2025 19:10:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:10:21 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:10:18 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 06/12] platform/mellanox: Rename field to improve code readability
Date: Thu, 23 Jan 2025 21:08:10 +0200
Message-ID: <20250123190818.3834-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250123190818.3834-1-vadimp@nvidia.com>
References: <20250123190818.3834-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|SN7PR12MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 866835ea-4be7-448a-0d3e-08dd3be1a0c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?am4Tc8G4b2rVkY+4kgOJKwQ0zF5v2HkJUbrwekSCa+LqXLEwaqg3BzUVNXU2?=
 =?us-ascii?Q?+YQH/6vbzU0ciN5pZK84ih9FwtWwkdyJodDbYPAPLYd3EXGTZlRL77mLPty3?=
 =?us-ascii?Q?klPg9q75DKeWraZlMV1SqWLbUxhQ2TZKe9aZrZu4fOOuETorbdnCfG0pHC/6?=
 =?us-ascii?Q?9IoIBEQpN2d97EcjxIRd/YCZCvb0OZljNFNoqJOUP3V6o35fHRE1n4WKDVat?=
 =?us-ascii?Q?QSLN5nUhcTOAbjgocYv4vkYY0+YVMO0Lc4D2K2fQXIdt07+ayuz5e+e9kEUG?=
 =?us-ascii?Q?dEN3DUPraqm5NGxGnPneqCraN6BlBtC8lKBRhyhL9JQv9KZDFEvo9gq81gMe?=
 =?us-ascii?Q?DIKDvqm9+QPcyg0+2CL7ZMglI820Tnu8spcNPJGFQ8EmSd8UwYM2DDUpQ5ns?=
 =?us-ascii?Q?OF5hNiaV187rEQYUc/nnel934GLlJfsEn3eano2Lv+TglER7h9UzT4v1WCsY?=
 =?us-ascii?Q?W/oPAcAi4nZJZnVR1TJbC+xPSbPcmVdLHT/94IBzbUWkuK4yKH/VHg5+ig9I?=
 =?us-ascii?Q?OQxBO0uSDe7TcDuutUidv/HIeRRPNuC/PgN6VUbhg62MGCgpPllgVwLlyczu?=
 =?us-ascii?Q?cbb5PTvwJmTwBsVJCym/m1QMSxJP5PW/+YV0E2vW2PR+HRz/QdWQPsUIagoH?=
 =?us-ascii?Q?oieCveKA1bplQTfl307ipNiZJgzPoqm9aEcdidoTwbNuVTL5Gfn3wg0dZCEe?=
 =?us-ascii?Q?1rgtv07ieyyU47L2GjH55hCGtqpdoRxryfHRSDYMBEjGKdq4aI73mIzgUwon?=
 =?us-ascii?Q?+bbWvb47B/3WATOeQhlHnFFBOWR9zGAzUHE1HYBP3ICpHG+AysMVGpZ3u29W?=
 =?us-ascii?Q?MWoz/Nouq2kPrV7ell12Yzeax0fsqcxgr03QByuswYDManOCeNmvph1YJ8RC?=
 =?us-ascii?Q?2PDzKq/MvLgPcoT1Jkxkg9CXysUa7+l27XPAb/++TsDlBIFwj1gPaiUP7MyY?=
 =?us-ascii?Q?Yj8ZNbZR6jVgFAWTnUYhM7L9rbpWIRatrVHawMwaXh+tUTZ7vPYMPqa4Y3zW?=
 =?us-ascii?Q?jX2ZOsZUcFJuM2kfy8IAPiefkqcBPDb95W97GVxsBtQZPBF+DZEQKXqC6nnv?=
 =?us-ascii?Q?qjqabUXtfjFUHaiuAp+lndtsc3GsbajyoAVLIVxY7iGR1SDaCQfJagRVQiSL?=
 =?us-ascii?Q?CWDOnXFjQ+i4O7AEzvWhQB9yIa2BJvagCBPMnlb4xWHPwm5zw2kzW3PVJZb4?=
 =?us-ascii?Q?jdTY5SoiKcSw0rxw+Ba3+mCAtPDf8ig30Vt3GAh7TxZil29kGjol6f+ux739?=
 =?us-ascii?Q?2d42fk5W2gJfhtlgICJW0M5kP2Lr/VdA7MFQwGtBLu1LE6lGtrMUQc00Ef7m?=
 =?us-ascii?Q?i5WD9OrN1bpz0TDqVLhL0VyJEjpM4yU/n8C4jT2bCKUBW+tAZn2EQkmSdsLO?=
 =?us-ascii?Q?Dl5AljRN0UdLGAslpBqguc3KlYWYIday1S+aRUviJ/w/MLYvtIqO8kqNyqQL?=
 =?us-ascii?Q?2VRkIyrZQRclNF2rlGMMZoIKzsI9bWhKNhoDqSKxItXwthC9FrvaX/LXi5iQ?=
 =?us-ascii?Q?n6sTe2x1M99ygbk=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:10:40.5592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 866835ea-4be7-448a-0d3e-08dd3be1a0c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958

Rename filed 'item' in structure 'mlxreg_core_item' to 'item_count'.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c   | 108 ++++++++++-----------
 drivers/platform/mellanox/mlxreg-hotplug.c |   8 +-
 drivers/platform/mellanox/nvsw-sn2201.c    |   8 +-
 include/linux/platform_data/mlxreg.h       |   4 +-
 4 files changed, 64 insertions(+), 64 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index bd3bb06ff8f2..9e49bc46ef3d 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -777,7 +777,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_PSU_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = MLXPLAT_CPLD_PSU_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -786,7 +786,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -795,7 +795,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_FAN_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = MLXPLAT_CPLD_FAN_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_fan_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_fan_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -804,7 +804,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
 		.inversed = 0,
 		.health = true,
 	},
@@ -816,7 +816,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = MLXPLAT_CPLD_PSU_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -825,7 +825,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -834,7 +834,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = MLXPLAT_CPLD_FAN_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_fan_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_fan_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -843,7 +843,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_comex_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
 		.inversed = 0,
 		.health = true,
 	},
@@ -865,7 +865,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_wc_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = MLXPLAT_CPLD_PSU_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -874,7 +874,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_wc_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_CARRIER,
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -883,7 +883,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_wc_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
 		.inversed = 0,
 		.health = true,
 	},
@@ -931,7 +931,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn21xx_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_pwr_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -940,7 +940,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn21xx_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
 		.inversed = 0,
 		.health = true,
 	},
@@ -1022,7 +1022,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn274x_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = MLXPLAT_CPLD_PSU_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_psu_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -1031,7 +1031,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn274x_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_pwr_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -1040,7 +1040,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn274x_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = MLXPLAT_CPLD_FAN_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_fan_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_msn274x_fan_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -1049,7 +1049,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn274x_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
 		.inversed = 0,
 		.health = true,
 	},
@@ -1087,7 +1087,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn201x_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_pwr_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_msn201x_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -1096,7 +1096,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_msn201x_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
 		.inversed = 0,
 		.health = true,
 	},
@@ -1193,7 +1193,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = MLXPLAT_CPLD_PSU_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_psu_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -1202,7 +1202,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_pwr_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -1211,7 +1211,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -1220,7 +1220,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
 		.inversed = 0,
 		.health = true,
 	},
@@ -1302,7 +1302,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
 		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -1312,7 +1312,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
 		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -1321,7 +1321,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -1330,7 +1330,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
 		.inversed = 0,
 		.health = true,
 	},
@@ -1339,7 +1339,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC2_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic2_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic2_items_data),
 		.inversed = 0,
 		.health = true,
 	}
@@ -1352,7 +1352,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
 		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_psu_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -1362,7 +1362,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
 		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_ng800_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_ng800_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -1371,7 +1371,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -1380,7 +1380,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
 		.inversed = 0,
 		.health = true,
 	},
@@ -2133,7 +2133,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
 		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -2143,7 +2143,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
 		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -2152,7 +2152,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -2161,7 +2161,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_asic_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_asic_items_data),
 		.inversed = 0,
 		.health = true,
 	},
@@ -2171,7 +2171,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
 		.reg = MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET,
 		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_pr_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_pr_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -2181,7 +2181,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
 		.reg = MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET,
 		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_ver_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_ver_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -2191,7 +2191,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
 		.reg = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
 		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_pg_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_pg_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -2201,7 +2201,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
 		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
 		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_ready_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_ready_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -2211,7 +2211,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
 		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
 		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_synced_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_synced_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -2221,7 +2221,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
 		.reg = MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET,
 		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_act_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_act_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -2231,7 +2231,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
 		.reg = MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET,
 		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_sd_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_sd_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -2263,7 +2263,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_chassis_blade_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_GWP_OFFSET,
 		.mask = MLXPLAT_CPLD_GWP_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_global_wp_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_global_wp_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -2317,7 +2317,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
 		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
 		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -2327,7 +2327,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
 		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
 		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -2336,7 +2336,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -2345,7 +2345,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_EROT_OFFSET,
 		.mask = MLXPLAT_CPLD_EROT_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_erot_ap_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_erot_ap_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -2354,7 +2354,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET,
 		.mask = MLXPLAT_CPLD_EROT_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_erot_error_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_erot_error_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -2472,7 +2472,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -2481,7 +2481,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_EROT_OFFSET,
 		.mask = MLXPLAT_CPLD_EROT_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_erot_ap_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_erot_ap_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -2490,7 +2490,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET,
 		.mask = MLXPLAT_CPLD_EROT_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_erot_error_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_erot_error_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -2499,7 +2499,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
 		.mask = MLXPLAT_CPLD_PWR_BUTTON_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_pwr_events_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_pwr_events_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -2508,7 +2508,7 @@ static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
 		.reg = MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
 		.mask = MLXPLAT_CPLD_L1_CHA_HEALTH_MASK,
-		.count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_health_events_items_data),
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_health_events_items_data),
 		.inversed = 1,
 		.health = false,
 		.ind = 8,
diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index c525b8754d48..f756dff48c88 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -288,7 +288,7 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 		/* Go over all unmasked units within item. */
 		mask = item->mask;
 		k = 0;
-		count = item->ind ? item->ind : item->count;
+		count = item->ind ? item->ind : item->item_count;
 		for_each_set_bit(j, &mask, count) {
 			if (data->capability) {
 				/*
@@ -425,7 +425,7 @@ mlxreg_hotplug_health_work_helper(struct mlxreg_hotplug_priv_data *priv,
 	u32 regval;
 	int i, ret = 0;
 
-	for (i = 0; i < item->count; i++, data++) {
+	for (i = 0; i < item->item_count; i++, data++) {
 		/* Mask event. */
 		ret = regmap_write(priv->regmap, data->reg +
 				   MLXREG_HOTPLUG_MASK_OFF, 0);
@@ -620,7 +620,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 		 * interrupt capability for some of components.
 		 */
 		data = item->data;
-		for (j = 0; j < item->count; j++, data++) {
+		for (j = 0; j < item->item_count; j++, data++) {
 			/* Verify if the attribute has capability register. */
 			if (data->capability) {
 				/* Read capability register. */
@@ -702,7 +702,7 @@ static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
 			     MLXREG_HOTPLUG_EVENT_OFF, 0);
 
 		/* Remove all the attached devices in group. */
-		count = item->count;
+		count = item->item_count;
 		for (j = 0; j < count; j++, data++)
 			mlxreg_hotplug_device_destroy(priv, data, item->kind);
 	}
diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index abe7be602f84..9cfe1a2bcdb9 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -481,7 +481,7 @@ static struct mlxreg_core_item nvsw_sn2201_items[] = {
 		.aggr_mask = NVSW_SN2201_CPLD_AGGR_PSU_MASK_DEF,
 		.reg = NVSW_SN2201_PS_PRSNT_STATUS_OFFSET,
 		.mask = NVSW_SN2201_CPLD_PSU_MASK,
-		.count = ARRAY_SIZE(nvsw_sn2201_psu_items_data),
+		.item_count = ARRAY_SIZE(nvsw_sn2201_psu_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -490,7 +490,7 @@ static struct mlxreg_core_item nvsw_sn2201_items[] = {
 		.aggr_mask = NVSW_SN2201_CPLD_AGGR_PWR_MASK_DEF,
 		.reg = NVSW_SN2201_PS_DC_OK_STATUS_OFFSET,
 		.mask = NVSW_SN2201_CPLD_PWR_MASK,
-		.count = ARRAY_SIZE(nvsw_sn2201_pwr_items_data),
+		.item_count = ARRAY_SIZE(nvsw_sn2201_pwr_items_data),
 		.inversed = 0,
 		.health = false,
 	},
@@ -499,7 +499,7 @@ static struct mlxreg_core_item nvsw_sn2201_items[] = {
 		.aggr_mask = NVSW_SN2201_CPLD_AGGR_FAN_MASK_DEF,
 		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
 		.mask = NVSW_SN2201_CPLD_FAN_MASK,
-		.count = ARRAY_SIZE(nvsw_sn2201_fan_items_data),
+		.item_count = ARRAY_SIZE(nvsw_sn2201_fan_items_data),
 		.inversed = 1,
 		.health = false,
 	},
@@ -508,7 +508,7 @@ static struct mlxreg_core_item nvsw_sn2201_items[] = {
 		.aggr_mask = NVSW_SN2201_CPLD_AGGR_ASIC_MASK_DEF,
 		.reg = NVSW_SN2201_ASIC_STATUS_OFFSET,
 		.mask = NVSW_SN2201_CPLD_ASIC_MASK,
-		.count = ARRAY_SIZE(nvsw_sn2201_sys_items_data),
+		.item_count = ARRAY_SIZE(nvsw_sn2201_sys_items_data),
 		.inversed = 1,
 		.health = false,
 	},
diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index d9f679752226..6eb9d56ec509 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -169,7 +169,7 @@ struct mlxreg_core_data {
  * @capability_bit: started bit in attribute capability register;
  * @capability_mask: mask in attribute capability register;
  * @cache: last status value for elements fro the same group;
- * @count: number of available elements in the group;
+ * @item_count: number of available elements in the group;
  * @ind: element's index inside the group;
  * @inversed: if 0: 0 for signal status is OK, if 1 - 1 is OK;
  * @health: true if device has health indication, false in other case;
@@ -184,7 +184,7 @@ struct mlxreg_core_item {
 	u32 capability_bit;
 	u32 capability_mask;
 	u32 cache;
-	u8 count;
+	u8 item_count;
 	u8 ind;
 	u8 inversed;
 	u8 health;
-- 
2.44.0

