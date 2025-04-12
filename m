Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE654F81
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Apr 2025 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744449567; cv=fail; b=DKojq+rSRLV6o5MCcs6dCxq3vBjAfjTL0kj8DfR8ZEDS8FPbtp4bwflZl84eHNydcRngxDAh1zx4GlyGS8umE/+q6xRo4qH00fc2iXkZxGTcV2QjcYt+ZR8eNrMQSQsdMSufNUGEK2dk1GJKv8FnJlbjLUwo8Gyar0HV/sKHw4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744449567; c=relaxed/simple;
	bh=sjVxMYlh4JJ/RcWBXGa9jzJbbDfumB3v270vNyneoUk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TV3tq9H4ogmd7C1mHcDjmC6drzEemJk0e80d7e1BYao+5i4H8Ce6Wa0rk/VRMlLmm/wyorjQ64XcWVbUSoPYesCregQQJrFlzp5uk1WGbNdj9+rdM6zz8TF52BFkWxmiIB0waQ5Z+h7UBAXJxkI12KA3bjiOKCeAwp1WLGQDzqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Im6y3lnk; arc=fail smtp.client-ip=40.107.236.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Im6y3lnk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JN/Fdp8RT47t+U4sc6fIWUAjkODOjleJLKztETpT3Qu2zwrXsih++0ZVh30gEnvE9Qm6FvIXAMJCqwYgR9ZK1nMRNGS/sYcT/Zixb+kfbXW4NJqk3uRmi7Vfjk1IQcqHkqxcGe7RKMIW7L9PKoVWzzXfGnQDf3ShNkCakXggj0C21v7mmFKjkStU/dsFdMC6yb7Z44NmPgpnH44dGTL9zgr9DqCkHJan1gTCfjmiTWgRljk/S87+RyJQvNxyf0WFrgiaW7y0jfDgDE/3VWvPno9fOXsJxjDr6qhCIBQvWFtqKe3f7S6z3xydgav40N0khEA9+cA5JFKiQme7uCafmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqdEuzb7/NuQjkDyjtjxpcfDY3tUZ/lJEL2Fl7vS6Hk=;
 b=WObh1rQaGXQsq0Rw69T1/SRvtROvmU8KQeVvIjjahe4fYiLIRRPQbakt7kdnOBMSkZSBDIqwLJmO9jHmlKLJve0MEcqFy2c1K+afNTjdORpjrYF7cJhfH5FBb6VR3u8P4JooSozWwv4YOQgKUUld2WqVoOb6+vevhlUAhfJ8BOUMhe/lN0KG+GmlbuQLIhE2SCuYh+uVIpLuh7ZlifGEHmHAzffGafHT1AJQlPSJ1JsymyUs71I8eiTQqgpQOqDNK0MBZ6ypMPF0f1+bGQSEYfvEP793xemNCbpRyXX3ROR7+YS+9W+IFTkiTv3fpB00RDf8gQ036snVh/UBC7NzKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqdEuzb7/NuQjkDyjtjxpcfDY3tUZ/lJEL2Fl7vS6Hk=;
 b=Im6y3lnk5AgWbjPkxpTJopQSQGK6WDG9oxI02j4r5aW290slOJocjoBY5r8rwx0cGABaUg5uqHgNA2cdVgDGYNZneuEMMdZSQhhrOOX001awUURcu516az98Q4sX75mOiGE6lYNVZp2G6cLn0tY67me371kB+W25Y/qe06amwzxD8CU+Cqv0GRZoG8AYQkSbomgHqYU2D4S33TNN67w+KXh/5/sA8zP5Ua29s/0GEWFX9Rjvw+Giqqk0rL7pvYDVfJS4Nbvy1obVmujFjz84YQP964cMNONPizdKLg1qUStVmQht239V2u41bfPrNHEsSRZvkKLYnOk27flmRjZ8sA==
Received: from BN9PR03CA0093.namprd03.prod.outlook.com (2603:10b6:408:fd::8)
 by PH7PR12MB7137.namprd12.prod.outlook.com (2603:10b6:510:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Sat, 12 Apr
 2025 09:19:18 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::bf) by BN9PR03CA0093.outlook.office365.com
 (2603:10b6:408:fd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Sat,
 12 Apr 2025 09:19:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 12 Apr 2025 09:19:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 12 Apr
 2025 02:19:12 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 12 Apr 2025 02:19:09 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v8 1/7] platform/mellanox: Rename field to improve code readability
Date: Sat, 12 Apr 2025 12:18:37 +0300
Message-ID: <20250412091843.33943-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250412091843.33943-1-vadimp@nvidia.com>
References: <20250412091843.33943-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|PH7PR12MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 090acfa4-223f-4c10-5798-08dd79a31a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0/Ej4/gjdpzY0bZu7jBfaIG9t4Cv0QPjjCNZnDctAWRWwBzV2QggrOfT/PMo?=
 =?us-ascii?Q?lymm395QYHSGkYDwG0oRsYXD++SR9Tp5fDj3YGZz1PRBrie1ZpAKpziJ+Wrv?=
 =?us-ascii?Q?vYW13Mpdt4619k6KuBijW/Fm7EIigVJeLTvz2kU/LOS/h3t+JM7aPrWSMyad?=
 =?us-ascii?Q?8WvF9t/sWq98HKQM3VOjfGnUqewL2W8DSMoYg8dzP58mo4Dy7s53OIgQPGi1?=
 =?us-ascii?Q?m5ys9j5FTeVveS7zYPUouyH6VNpP8ZIb7s/vcXz8sw1gOw0a5F+kWHW3d4e1?=
 =?us-ascii?Q?SVl18qbzeH09KDXlGncNzkmIkIN6NnSe54jeHXWaqfxgvZFmj9SBJFObaR3w?=
 =?us-ascii?Q?Z/X9Ijwu9WfhtGBMGgM2EoCkByf7e+tZcD6/fszknvrXZ0u6td1VnAmdrZx8?=
 =?us-ascii?Q?krs1TlONRGEMzGIy+rOtEqI9leqgY2bdhMQpOEZr15bd5qZZuLlEL1Dsoy/5?=
 =?us-ascii?Q?ozXJ4egts3jl9aHNyVbFi7MPDFHi/Iw6gg9T6LQeXVtqaJJHdKz/QXFVblRc?=
 =?us-ascii?Q?8gHlvz5fjx95FYgwjF0Ic9I3IMEi5QBCDXeVoPUtIP39GVsXnRw83l2Q28p5?=
 =?us-ascii?Q?x8YBWo+z+48gFQ7r//bX+kHifLpS7rgfrvHjPJMZF8qYFGixIcA7eoXDoHa4?=
 =?us-ascii?Q?AAFOqAUaN+YhvztTwneRQb6EqVXvqcCMryxjrHulkAi6M0cYvhD4LaQSzLv6?=
 =?us-ascii?Q?OUsft2Xsj+VFiC/rRIag4JrPFXOPrEs8txZAz98/O0o7LyG5JLvJdYrVQ5lt?=
 =?us-ascii?Q?rJ13IGwtQLm21cHPcMBzD3tPGEJnauJcQbJ3QlLKjsmHcPd5hrmr0kZSDSZs?=
 =?us-ascii?Q?jLptN5Qrp/BHGkAL20HSyVklE9DUDQQJz4EIyf31WELmJxKBjLybBLLEE46D?=
 =?us-ascii?Q?YiBy2TU35C2n6uTwuCTi3USDyAzDp1Zbxc0sK7LygiucByEhJpHtvyPgYfz5?=
 =?us-ascii?Q?LAtx1GGNrl4dQ68OJM986nXhnaI82qmcmHBHVCyPupgmXHh8vIDfSNWquFhE?=
 =?us-ascii?Q?FKxW5YWWCQpazQIOufCaMyFFLhhh1uD0vp6Pi8hniEgogGedjwYesIXeiFqR?=
 =?us-ascii?Q?+7Fx9SCJ+JeWy+PV+ZqnUVkNb8RPJiDqk0SgzYffOJ5q5jhSfsvcDXljvTCL?=
 =?us-ascii?Q?7SfU1MUsytHoGzG8H65h9xCfcIYXJwEILSqsrk6KNOfryGrXpxeLWTsSGBVs?=
 =?us-ascii?Q?D2eIgWM5NNdy1PDAHQ68jeupZhOCgAtzuXuslal+vOe8pQekIIInQHLTydOW?=
 =?us-ascii?Q?UsE5dW3tY5+CZH8aiXCTncZusU+TjS73EVhxCbItCeA7PUhWLSD+kps2mJ9Z?=
 =?us-ascii?Q?RT2mCkEzjkugeCzSU/f1lSNUb/e1UVUwrUChxCvJw49/J9jrsjz2WtJvBrTD?=
 =?us-ascii?Q?7vHPgDoDIwfKQJgAxCT1+LYgJQdJ6VL2A0ORFVgllFxSSTcL/IS9Q96G1+ZX?=
 =?us-ascii?Q?BvE6sXUi1qurIWud/T1k8jqJgVTP1Rux4f8uie5z5IDk0jfnODAyzWGObxXY?=
 =?us-ascii?Q?H70mrCCx7V2kV9goxhl/uCKF9VjRHJyx5l82?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 09:19:18.3624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 090acfa4-223f-4c10-5798-08dd79a31a5e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7137

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
index 0ce9fff1f7d4..550378c2881a 100644
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
@@ -541,7 +541,7 @@ static void mlxreg_hotplug_work_handler(struct work_struct *work)
 		goto unmask_event;
 
 	/* Handle topology and health configuration changes. */
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		if (aggr_asserted & item->aggr_mask) {
 			if (item->health)
 				mlxreg_hotplug_health_work_helper(priv, item);
@@ -590,7 +590,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 	pdata = dev_get_platdata(&priv->pdev->dev);
 	item = pdata->items;
 
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		/* Clear group presense event. */
 		ret = regmap_write(priv->regmap, item->reg +
 				   MLXREG_HOTPLUG_EVENT_OFF, 0);
@@ -674,7 +674,7 @@ static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
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
index 0b9f81a6f753..f6cca7a035c7 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -209,7 +209,7 @@ struct mlxreg_core_platform_data {
  * @items: same type components with the hotplug capability;
  * @irq: platform interrupt number;
  * @regmap: register map of parent device;
- * @counter: number of the components with the hotplug capability;
+ * @count: number of the components with the hotplug capability;
  * @cell: location of top aggregation interrupt register;
  * @mask: top aggregation interrupt common mask;
  * @cell_low: location of low aggregation interrupt register;
@@ -224,7 +224,7 @@ struct mlxreg_core_hotplug_platform_data {
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

