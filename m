Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013056.outbound.protection.outlook.com [40.93.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C469633E36D
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jan 2026 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795322; cv=fail; b=c+OeGw6GZc1KPlrO+p3oPO5+CwJf1XsK5Y30abeAgvAfdME+iDpM+oQ/7UC9iHeYh6zCgCmImD6N8G7DM5sHLRWvOhYsJ+HKgobvUPpx1hbANNqle47DXQRdsNyffjLpoednxJp4332qrBX9e8yuYdD12+XPCvuhrkHVZFgG+ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795322; c=relaxed/simple;
	bh=zWFTQtOqr6WUr9/eXLS1H/dpqY8OUdIqqqeKuQA9UzM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aDGRk3wT//ObFHSLXQZt8Cg72XXgvLYRF2P3P8Jy/m2eZp3wJJjF/y1UWHOk6q04QcdfPWSEWEbR6VTsMJbniPp74sff7BjgwA6ZlHQ8W5L7RVOHwDbYqqBilG5QxolnxdXp+7PPqGypQxZ2uZRLHQwcUOxagyhqOwLbgx7IbAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L7JIIi0+; arc=fail smtp.client-ip=40.93.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L7JIIi0+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntBxZdGTrZgfijko1mY5b4sIybyS3jeovCi7cFhG7KsiKeui0+JrQei1jI4x1CkYoM8ZHyklhlAPea3HxS76BeXH9tv5En5E10kmb7W++eOZJIh6Co4osPPzr4N3+X5/T6GlbyGCwR8Yih8/iguWifAZvtLpJXyzzyFYNeLEe9WR/zFO65tCKF8hGJ/KnL+VxSodl7+AjNyqPzvhgTsjPB62oFicxbqskjYYzyuYPdCmNaIP+cmWujXcFXLTv+sNzqBlALZd6WoXAsCce3LtzQpe2hGB+sF3LyT1xx409zq5BmVlOB57a02ZIgl1pG/ipQJ/SpHyzYhDxr8W43Lpdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRA3KNe88FUzXPFH/172qOW+4OLLiUuPQlHux1fJ+Jg=;
 b=cVThsnO8QFpIbtaIlkun5LInHaWrPiGLgyVY6eNdWRLFbcYiBFB3xzojWJLQJq7wdSzeuF5kiPlfy4hGmH36c1gzEnktDnuwqzvDcx5i3ikA/L1ukbYz9opPIZZl0s3LAhQuudEWA6n2Elc0i/j3xgo9aJh1KDNN1oTt7wwxlwTjUtEjFqmiKQVqaYXA/C3GAQaD0UrvEPVhzg7a3FrIqam+y7INQx8h+lJv5V8/x5M8nw6/N2L+6UPbD4Br/wjmsxbu4Wv/ponpbl1EJ8/WOxbnZqCziTr6aGdxIs2b+IK4FIb2cYywq5c7LNijKUIkPL/4IWki4LLQQw6UIa/pKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRA3KNe88FUzXPFH/172qOW+4OLLiUuPQlHux1fJ+Jg=;
 b=L7JIIi0+wRB0Fd9kC6GFOsYxPBO5PmAPEDa2xPhZp+EXvKafFw2ZcC/hf3AL4Dysqy+btMxZIUNb7RarDvzTKj0P/Ax9PGlQRG6utOXBZHvQa1/6YqdMyOH65YXJe6NoudF1+cSEIOXvlU1OOAw149MH3oEAgiEiBPP5WwfpWDCq7ddJVJRic0ZOB28J4B9kJ0B5oxdbk7kLkBoRK1/tt8bbWmse3CNGNlbqB9LDEb5Z13JZ3HeCQkNLKsQp7xgH1J/aCTKrQShrRHFVVyKMSN0+d+ygnfKc0zkhdyytj8iggQNlURPGaOC3WUeSQ/sM11HXR1c4/uzMpt2NAS4frg==
Received: from CH0PR03CA0108.namprd03.prod.outlook.com (2603:10b6:610:cd::23)
 by SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 14:15:06 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::59) by CH0PR03CA0108.outlook.office365.com
 (2603:10b6:610:cd::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 14:15:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 14:15:05 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:14:46 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:14:46 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 06:14:44 -0800
From: Oleksandr Shamray <oleksandrs@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Oleksandr
 Shamray" <oleksandrs@nvidia.com>
Subject: [PATCH 1/2] platform: mellanox: mlx-platform: Add support for new Nvidia DGX system based on class VMOD0010
Date: Wed, 7 Jan 2026 16:14:15 +0200
Message-ID: <20260107141417.913935-2-oleksandrs@nvidia.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107141417.913935-1-oleksandrs@nvidia.com>
References: <20260107141417.913935-1-oleksandrs@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|SJ2PR12MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b3ee9b-4f84-4cd0-44a8-08de4df727be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NY1JgX/5P2X4SLLspAw/1Ip9ORndeqFHCmToVv1gU99YSbIpEptJNXh7eIfG?=
 =?us-ascii?Q?6Z61Srx2n98Ze8aM5WNJnjPjRMx78RyJdNCatRTE42nvFVjWpGSxH3X9J+wx?=
 =?us-ascii?Q?fuTqKtS8E5nHKkWiOEMVdb7DVtsCc7iGDilZ2j2Kr6Q2Z/9nZ2R+/x7x+UrZ?=
 =?us-ascii?Q?Tr1FblNK4b4totijZCP4U+nPlnZI4HbiKtr1fgaCkZGrVSuNsekYOad2AsO1?=
 =?us-ascii?Q?t8va5+amxNUfk4PEdLAsqfmMPrmUipL7O3YfK8Plpe1SktS9/DFBA6nijtjR?=
 =?us-ascii?Q?SQbNTY9B91cvwK7ZEWPPcRUJYubeB+ULlcG4D+W+kx37EcHAQrW10VafxVPy?=
 =?us-ascii?Q?epjTR3gmfcofxZn9Go5FcQjZzUIHePn95+6NEoGY0S9mnO69miYJ/b9qUjjz?=
 =?us-ascii?Q?sYNfDWB6wk9PjgcPBrFqq/jopbt3DyQe8zS1J4UTJNU6xL46UDZAKx8jldo7?=
 =?us-ascii?Q?KgleTY0ZptSkYVQejWSSqRkIAtLIWvO7pmbBBpu8/1tYqGV6EGXHU/dAe4hl?=
 =?us-ascii?Q?9U9H0rNh+qAGxS7kSq856O2rqoveZWzAX07kzd1NCM6aCN1WPw3lRcbwRIw/?=
 =?us-ascii?Q?d/Q5YGQAgeJnMoOUgP2vadVzUtHLl9CLIldmPWKzRqZiOdHx58bD5mijHR9T?=
 =?us-ascii?Q?K4FidDQgoCM/rTtboU+WFyl6eGFu73aOioNaKzlYyN3uyI+4IO/QkJXIrC7y?=
 =?us-ascii?Q?O8CSGqlhBpbH6uUK1EeBst0ee/r8sDzu9686fILjuvECh/kdWa9AnKN0Wjw3?=
 =?us-ascii?Q?ar0AtYHtcg8YsiDWEwt4X3kNYH9mWV0YTYeLhaw20Js2I/q87F7pFxQeWb6p?=
 =?us-ascii?Q?BiH5V+/ZqBizGd6Ob9Pz0slkbXhxdVE633BQER6CADzQZOcN5d6pJUyGQN3Y?=
 =?us-ascii?Q?fBsXAuzsNPZMLOtNVrzfO3VHiv5W98azVeL6b7IYTm9F81vayW4qBQ8SBK7x?=
 =?us-ascii?Q?A2yxDqFEzKY8RbvKFaAG913Jfql/gAfNCrT1W1+Dvh0DStMOfkXGgborQO+V?=
 =?us-ascii?Q?08EaCCjyOIiXyj1cckNsgv+lonWUJVnijjL7RqQegoQHLTb/w3YzVPXKyGgt?=
 =?us-ascii?Q?fY912tbmc0PFLwxM8VK7uPU11qspqwsoF1FspDfYDEXy9O2JzQPTxNfUc3hY?=
 =?us-ascii?Q?WWf6GZkdfUPEEGj3zJX/NoRC73EMEZrGdJ40lzBbfO/9O+B7rp+kYQmYC/aN?=
 =?us-ascii?Q?23BtcHWUGG3NO/viLGHdmyNAC4HfWqVlQH0AnRFBUkid5mPhoTF0+11jFkBg?=
 =?us-ascii?Q?ol9GKI/pwWOW6AhdqIVxvzjnyVXsudulGW0Ci+xuKP8BMzkC8NcxDA+rsKhr?=
 =?us-ascii?Q?jtwS7g4WtMzjQioIndMOESB301xq69c2IKEqIDOSjsVMyWfrv5utPYLBQPv8?=
 =?us-ascii?Q?Rppj2UjojwSiAcO/JBumBqOHwEkoy9NVuUXnN+tJr7PNx6NgmzPrl+Gs7jxr?=
 =?us-ascii?Q?grxcGhcJ++eL4hQNvLNcF31JRoJNVNrcgD91cfRavcEF7rtH63yqhzLL5F1+?=
 =?us-ascii?Q?SEYE5FaS/RHQSEBiu89hzVkMp/NG4N+DvRbmyuXc5uk1Or/NneArLTcgWbze?=
 =?us-ascii?Q?IdR8Ksm3JjXa1iWrF20=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:15:05.0639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b3ee9b-4f84-4cd0-44a8-08de4df727be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917

This system is based on Nvidia QM9700 64x400G QTM-2 switch, with the
following key changes:

Key changes:
  1.Power Supply: Rack busbar input power ORv3 DC 48V-54V
  2.Dimensions MGX/DGX 1U compliance

Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 454 +++++++++++++++++++++++
 1 file changed, 454 insertions(+)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index d0df18be93c7..14b3adf870e7 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -727,6 +727,16 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_psu_items_data[] = {
 	},
 };
 
+/* Platform hotplug dgx data */
+static struct mlxreg_core_data mlxplat_mlxcpld_dgx_pdb_items_data[] = {
+	{
+		.label = "pdb1",
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = BIT(0),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
 static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_items_data[] = {
 	{
 		.label = "pwr1",
@@ -776,6 +786,15 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_ng800_items_data[] =
 	},
 };
 
+static struct mlxreg_core_data mlxplat_mlxcpld_dgx_pwr_items_data[] = {
+	{
+		.label = "pwr1",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(0),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
 static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_items_data[] = {
 	{
 		.label = "fan1",
@@ -1399,6 +1418,45 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
 	}
 };
 
+static struct mlxreg_core_item mlxplat_mlxcpld_ext_dgx_items[] = {
+	{
+		.data = mlxplat_mlxcpld_dgx_pdb_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_PSU_MASK_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = MLXPLAT_CPLD_PSU_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_dgx_pdb_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_dgx_pwr_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = MLXPLAT_CPLD_PWR_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_dgx_pwr_items_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_default_ng_fan_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_default_asic_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.inversed = 0,
+		.health = true,
+	},
+};
+
 static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
 	{
 		.data = mlxplat_mlxcpld_default_ng_psu_items_data,
@@ -1450,6 +1508,16 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,
 };
 
+static
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_dgx_ext_data = {
+	.items = mlxplat_mlxcpld_ext_dgx_items,
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_dgx_items),
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,
+};
+
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ng800_data = {
 	.items = mlxplat_mlxcpld_ng800_items,
@@ -4625,6 +4693,359 @@ static struct mlxreg_core_platform_data mlxplat_default_ng_regs_io_data = {
 		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_regs_io_data),
 };
 
+/* Platform register access for next generation systems families data */
+static struct mlxreg_core_data mlxplat_mlxcpld_dgx_ng_regs_io_data[] = {
+	{
+		.label = "cpld1_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD4_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld1_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld2_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld3_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld4_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld1_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD4_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "asic_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "reset_long_pb",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_short_pb",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_aux_pwr_or_ref",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_dc_dc_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_from_asic",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_wd",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_asic_thermal",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_sw_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_comex_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_platform",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_soc",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_comex_wd",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_system",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_sw_pwr_off",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_comex_thermal",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_reload_bios",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_pdb_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "pdb_reset_stby",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0200,
+	},
+	{
+		.label = "pwr_cycle",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "pwr_down",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "deep_pwr_cycle",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0200,
+	},
+	{
+		.label = "latch_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0200,
+	},
+	{
+		.label = "jtag_cap",
+		.reg = MLXPLAT_CPLD_LPC_REG_FU_CAP_OFFSET,
+		.mask = MLXPLAT_CPLD_FU_CAP_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "jtag_enable",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "dbg1",
+		.reg = MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0644,
+	},
+	{
+		.label = "dbg2",
+		.reg = MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0644,
+	},
+	{
+		.label = "dbg3",
+		.reg = MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0644,
+	},
+	{
+		.label = "dbg4",
+		.reg = MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0644,
+	},
+	{
+		.label = "asic_health",
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+	{
+		.label = "fan_dir",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_safe_mode",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_active_image",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_auth_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_upgrade_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "voltreg_update_status",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
+		.mask = MLXPLAT_CPLD_VOLTREG_UPD_MASK,
+		.bit = 5,
+		.mode = 0444,
+	},
+	{
+		.label = "pwr_converter_prog_en",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+		.secured = 1,
+	},
+	{
+		.label = "vpd_wp",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "pcie_asic_reset_dis",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "shutdown_unlock",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "config1",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "config2",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "config3",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "ufm_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_dgx_ng_regs_io_data = {
+		.data = mlxplat_mlxcpld_dgx_ng_regs_io_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_dgx_ng_regs_io_data),
+};
+
 /* Platform register access for modular systems families data */
 static struct mlxreg_core_data mlxplat_mlxcpld_modular_regs_io_data[] = {
 	{
@@ -7239,6 +7660,32 @@ static int __init mlxplat_dmi_ng400_matched(const struct dmi_system_id *dmi)
 	return mlxplat_register_platform_device();
 }
 
+static int __init mlxplat_dmi_ng400_dgx_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_default_mux_data);
+	mlxplat_mux_data = mlxplat_default_mux_data;
+	for (i = 0; i < mlxplat_mux_num; i++) {
+		mlxplat_mux_data[i].values = mlxplat_msn21xx_channels;
+		mlxplat_mux_data[i].n_values =
+				ARRAY_SIZE(mlxplat_msn21xx_channels);
+	}
+	mlxplat_hotplug = &mlxplat_mlxcpld_dgx_ext_data;
+	mlxplat_hotplug->deferred_nr =
+		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
+	mlxplat_led = &mlxplat_default_ng_led_data;
+	mlxplat_regs_io = &mlxplat_dgx_ng_regs_io_data;
+	mlxplat_fan = &mlxplat_default_fan_data;
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
+		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
+
+	return mlxplat_register_platform_device();
+}
+
 static int __init mlxplat_dmi_modular_matched(const struct dmi_system_id *dmi)
 {
 	int i;
@@ -7458,6 +7905,13 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI142"),
 		},
 	},
+	{
+		.callback = mlxplat_dmi_ng400_dgx_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0010"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI173"),
+		},
+	},
 	{
 		.callback = mlxplat_dmi_ng400_matched,
 		.matches = {
-- 
2.47.3

