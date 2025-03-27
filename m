Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E6E1AA782
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093585; cv=fail; b=lHDQ3wPt2NPX2Fze+10VDk89a2f1+Ptw4kna9l5RQBYqPJeXrEs+fQ9EuodsR0kQcuxJMcLCYHFKxz47423ryU/jdPeAOYhEDobfXaaFeaGfMAnXIUz87Zg5qaeWbrK7zCI77TTW+CQKj0/HcJjMIIW4CGUYywDRza4CHmqyJCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093585; c=relaxed/simple;
	bh=TwCLYeEkuoLQhwWoRhEY5uaC9cOkp1tdQP10QSMh+A8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ANdQokTRkTlrlbti2INzAA3L/BxZ7HWYnDVoYtU2FvD6dPcujuT8gY7f+KHp0mOoTnRWHFTUeZvw9jV4YauYt3GaeSVIvfLF9/hQRdvVyWcCSe6bPnVhIJb81tqG57O8tGH5Uybf/U/Ku+EoL7WFLEjK3SA58GpsuN/mZwVt9BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hSBf6XRm; arc=fail smtp.client-ip=40.107.237.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hSBf6XRm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMYkDNBddV/9ZIva/MSbyRPw0FKKpJZWBPH65jo3eiTd+KJ5n4KWAuXIA2xEC4izbtclPXfd/0SPG60bJ6sRJP/pTlzU/QMaEGgUNO7aIeTM2H0uEIeCi/BZSnNyySfPMjh7LGR9dRQg1/GjtLByTeJkAy9J78WI1ilWxPR/O4IPiHeHdzaxFu4UldJ4lYGQw6mRlrcieKxWuzTFM+zNR2GDZzSu0knzgb5y+yd5REgm5EuRRmEDTy6The5XYR7dDWUTGKKrIa40ANXx+q01OQ3XRoKeH+dUmuvORKhMYAKzX96mBVx7i/mc0J8yn4gKwzm37nFnjvuXJ8mBR0t1xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFPgSyt0h+LzaJoOSjffaQgbN032SP4cQ5gAfb2WtBo=;
 b=uQ22bx0taELEwhO4lu9UQYGD89DZyncr+dZYmbT+/+DirGG/xibcuXl7h3vYWK7v4zNs520gSEJ1vosfj+MRvOz/CNr4Vv5Mp8DV4K7D+CR8l0RwWeFAf+2pTEfVbIqS9SevhLXkF/4bP61IZWARGpnOhFhOAD1FnIfQrPX7sCAp/KDyONGOT4Dyxz+Jf7HLp8bmzurUUqHCg1zOJt7K0BUmXUZUn272NkuyhQsKH3fd1RbKNnGEI0EKvNXzXVsHYsECEzv3OrN+A2MfQr9Px6SE+/Rmd57TMuqX3dHUwx4j2fm7eCXBFg7C0K8NVzipVm445ndPe+qI+ryeQI9G4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFPgSyt0h+LzaJoOSjffaQgbN032SP4cQ5gAfb2WtBo=;
 b=hSBf6XRm/w0EXufuTmfCQw8MScD8iizsDgPaFaL4Bw0QGwYUjzVGgK8lOfMQ8W4medFR+WUfqlDRfuMeyaZ40qUPF81eot90emVFlgcyM1LDmMM0dbcymGbIilVE3MT9mwO69EzLylAk+xVX/7py1AoQjPoWnr6N2829WFm79+2unlj8r0n7Bcosc42DrR1u3TBAi7XKMm9r8Ks1iR74kiO8VEJpEX+1DhpF2wZ2NzHqiUd+ulko5BcDUfhm/KnUzHLgv4wN7iLJP3Oc0nul9BsPs8yluFw8X+CqXIBQWCDlAAnStU8VpAiPLhQLsipbA4gKH3g5BagNUBjvyF9XyQ==
Received: from MW4PR03CA0030.namprd03.prod.outlook.com (2603:10b6:303:8f::35)
 by CY5PR12MB6323.namprd12.prod.outlook.com (2603:10b6:930:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:39:36 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::e9) by MW4PR03CA0030.outlook.office365.com
 (2603:10b6:303:8f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Thu,
 27 Mar 2025 16:39:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 16:39:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Mar
 2025 09:39:30 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 09:39:27 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v7 2/8] platform/mellanox: Rename field to improve code readability
Date: Thu, 27 Mar 2025 18:38:49 +0200
Message-ID: <20250327163855.48294-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250327163855.48294-1-vadimp@nvidia.com>
References: <20250327163855.48294-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|CY5PR12MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dfd0a47-ba15-405c-c001-08dd6d4df607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B5trLdEALfokZtAHzTR3ZX5B4yDgjHki2NX6c/Qagh2chnah5Uqr7f1iFVws?=
 =?us-ascii?Q?Dtv0xs/cxAFR3Kgpt1SB1xodlzY3OD0sqpXNsoM79FHSy1v5vHHT10NTd97i?=
 =?us-ascii?Q?qhvEToXmShHeq9RtHGV6e/iyzsEl8PP0TeO9oiO0jDnnT+I/LDfjfPOXqG6P?=
 =?us-ascii?Q?DVIR5VmE+rcXN/FN1dksKIWOkgCx9Wjr9H4YB/uj+JK0KdUeuJJhjqd5ou1h?=
 =?us-ascii?Q?CXiwVltDiTpDmrJVx2RV4yHPPC6mLJ9xWObCfeBpXeNK+C/t82n59x9BIMPp?=
 =?us-ascii?Q?FXGoxP7nVm4hsK/8BQGHKkMTvqPWJKoWsibDDcF/VgCnuzkZao3M+LMROocw?=
 =?us-ascii?Q?DAUbBbh8JKbeDXwygQeoOXsav+jU+or9j+aay8H4H7v85RANDLXnWMUQVEWa?=
 =?us-ascii?Q?vkaxPt9Dpe8gbvVE//o0SDhaNjDRXFiGynsv5JAe0BUgU41ySwzkGSS6iAZR?=
 =?us-ascii?Q?5LnzTL5BjjS1yGuKj+lUzprFeuZUsfGiGRF0nlJXiTr1ciSgt2xrJ1aRiJwl?=
 =?us-ascii?Q?XWqdxDc1f614wL5yfX0ueZsmdoTJSOUDgVzo9UXEmGsAXCnw8fPoaZArbNVb?=
 =?us-ascii?Q?t9bvwRGkKdXBwpFIrgRURSDN7r4PF+MEu7KX7LyG1FHJXYBHM6mDfu8nyNd3?=
 =?us-ascii?Q?2YJkWpIv31SUZVRFttKGI25GIYzUQibSsVw6N9zRxw1uTNWV0plwKOZMS573?=
 =?us-ascii?Q?IDVj2K4pqSrI2zpNvW3GzEwkiksFurpz/WqLdncsGqRlhnku/C7iEIpAnKhG?=
 =?us-ascii?Q?eHXgHA23q76VKjczU5ehQX57xzawEj949g8qyOf2C9kY4X6PHxRMOOYiFZHD?=
 =?us-ascii?Q?zaIJRKFivtSuqSIu6sHxIiPHQF8SHoWofuvDVkgd6gLHcjoJvh6X+jyeSiE+?=
 =?us-ascii?Q?eKeE+IJwWe+7imo7KUoH0VCBOhZ8F8EQsPowwgP5PGxyNi981gsIFt4z81uR?=
 =?us-ascii?Q?Yu9+jqN6BufS6RSLw2Q9nq95aJSaSqcAEK7wPtuKHBe9Oraiy0cJoNa/a/cc?=
 =?us-ascii?Q?MYQ4bGKqThe85yzZ7gT1b14bZnJYNAvi1p9xL8KbTzY9YQU8ftRf2iu4g9HZ?=
 =?us-ascii?Q?t0O8knjbnwwXQgFB5hPqUb/B7+qSx+cnYvKACn88TSlDZrJWldw6FkrQYcwu?=
 =?us-ascii?Q?AL7UPq/77/gjSotjAni7f0Vd7KOnVw6SA4RO69OrB4UWjMmouuzb8qxdh7jr?=
 =?us-ascii?Q?am4BQIIlwGDcZR/5/qQUTlEosskzsFreP2Qab9d74y9Kade2ZTMZSt3AMKkZ?=
 =?us-ascii?Q?Tjsv/kB/qxFAU5sH0UUpW/nXWQID/r0K4Qey+WWsWjsnS7fdlaL+4kJNBfkN?=
 =?us-ascii?Q?cvdDVNSi62tZlMs/oj8+fRZ5fhTzNxp88G86X+3ZgnemqM1cCmZbJxO/VFrD?=
 =?us-ascii?Q?r4LqaW+Bp5bVKSUgOVuuBzLiixJSpIbI0i+39/XIy8N9uCkQksVCIPbgG0Hn?=
 =?us-ascii?Q?pjr3KujuzaC5xui6tMvCkejsm0Oamvx1FXF0KwGSPOzEWYrGbVCfk0/boKFE?=
 =?us-ascii?Q?QwOFybOZscQJ3gw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:39:36.3153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dfd0a47-ba15-405c-c001-08dd6d4df607
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6323

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
index bec12bc73e67..1f1e34c9c040 100644
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
@@ -564,7 +564,7 @@ static void mlxreg_hotplug_work_handler(struct work_struct *work)
 		goto unmask_event;
 
 	/* Handle topology and health configuration changes. */
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		if (aggr_asserted & item->aggr_mask) {
 			if (item->health)
 				mlxreg_hotplug_health_work_helper(priv, item);
@@ -613,7 +613,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 	pdata = dev_get_platdata(&priv->pdev->dev);
 	item = pdata->items;
 
-	for (i = 0; i < pdata->counter; i++, item++) {
+	for (i = 0; i < pdata->count; i++, item++) {
 		/* Clear group presense event. */
 		ret = regmap_write(priv->regmap, item->reg +
 				   MLXREG_HOTPLUG_EVENT_OFF, 0);
@@ -697,7 +697,7 @@ static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
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

