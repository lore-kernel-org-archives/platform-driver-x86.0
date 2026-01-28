Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012063.outbound.protection.outlook.com [40.107.209.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA6128C87C
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jan 2026 08:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769587211; cv=fail; b=tUXrwcl6AybZvTNTD/OOzK/UXpxph12YJ5Aso0G90OtAeoXGAWik47H8dHwmqF6qLXegR3uSpPeCFVMrlI0keDW43NFaSu/LysnBnjadkUb2k49GEMAaaEMDOrn7KukOIdsVmIHRasCykud3W0JyF9EFdhsXJ55nUvZ7LcYJZaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769587211; c=relaxed/simple;
	bh=/6QWgkcXOPhIBzMfhn5TKLz2WVYBnqGi0t4BBs2ULr4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mgi6gqrrg3l8p6A2Hg/6HvWtcpbDgavM+1AX8p6P2GYah5aAhfB5qeiI0142Ko0+RwyGtkxlLBq7wk4NysZcFrP/sn3Wk8DPY5MCukpJdpNJKxQUu7ujpsbHOK50qA6VXXQsBIJa2fCZC+OHPBlfigTUoGjXp9iu+du2IPM+COc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kmW0dLgW; arc=fail smtp.client-ip=40.107.209.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kmW0dLgW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZIw2NqElS7mb7Qev/jRk4Vgx25dlQx/UADUU7hGLUaPGa210Bs5IfpspuiXfy5oFs6dz2/UEpg7DEByzW9oRyajSfe8QcjwPa0+V9BiSsqx6rXD91ucjJDGfnBY/ww+KVTztHmUbcIbm/vHke5M0R0x2lX7E980fSoVrh9fSHGAIt2vrcTLpSsg1akl3f89qWwu8cAqGie3WxZoq1akaV3Q0mEDz+m9593T9zYHLmdblgFzrjtOfvnIwaHOu9qLjuTIVYzAnEbtFDYAYKIZnfLx4WJkVWMuQ3/rw/Fh1Ac/tSccCjHV8/Ad3+OcKiuSXqGrhpl5mzOGUZsGtIkANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N14yGla/ymJCayPjiBmBTsRkid7Hl5URMQc/WljIDTk=;
 b=ARhyO95c4xMCH/c9jw8uEUNUkP0JnsA3dpds7o7ViDGa2GpFD7EV3A9HcuRBoisnw8ewF85bshANn/Jo81HUP2qRA07WlvPuQxfzXmkWS0cITRishrtTd+NNK0rzewgMPvIodqaXKVyKjz7UQlMfeBVyQouFO1j97bqIbl5KhflZp4pAHmBV1VgjSmcsShGWMo3rTdIODj1UVtlSFgo+rtbFQfkS3g3PgqAYWl107YLaXAJXZZmzwpVkbyv4XXMIHRPAcG+aK4CyWtZlgoyyjiSIjs/4fnyLXS+VHiCzogYnaT12IIqc0Ok4ENV94B0lzBrvpHr+5MTuGz7FTmW1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N14yGla/ymJCayPjiBmBTsRkid7Hl5URMQc/WljIDTk=;
 b=kmW0dLgWuEfR7AXLvA3xfKP1smKyEb5Zlne1l4i0kXu8O+33nmWVer+zSuNX2zvhnWCX3Vd3k1MhRnExZVEYWh9sikf+UC95JxVXpikriPIGbP6xdtzqH2AwIbf9Wwy0y35ZOwW8O/57ech1UqOpwzGtfaQDoukPsS8aafiBFSjwphowdlRny9K3uJwOUsPf5V71fq+4vaJbjcExy5QrfddGdUmz/+WRwr952PiIKR7h9gFfnuPDeLwZPAgkZpa8+2lh/gTkyvQ1P5iL7TYbBILI711XcAZ9JWbExuewv9Ktk9TRi8MAjHzFjGNVG7A+pAiA2vmuov0jAGTjeU7hrQ==
Received: from DM6PR03CA0035.namprd03.prod.outlook.com (2603:10b6:5:40::48) by
 MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 08:00:01 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:40:cafe::50) by DM6PR03CA0035.outlook.office365.com
 (2603:10b6:5:40::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 08:00:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 07:59:59 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 23:59:45 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 27 Jan
 2026 23:59:45 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 27 Jan 2026 23:59:43 -0800
From: Oleksandr Shamray <oleksandrs@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Oleksandr
 Shamray" <oleksandrs@nvidia.com>
Subject: [PATCH platform-next v3 1/2] platform: mellanox: mlx-platform: Add support for new Nvidia DGX system based on class VMOD0010
Date: Wed, 28 Jan 2026 09:59:38 +0200
Message-ID: <20260128075939.2704019-2-oleksandrs@nvidia.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128075939.2704019-1-oleksandrs@nvidia.com>
References: <20260128075939.2704019-1-oleksandrs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|MN2PR12MB4390:EE_
X-MS-Office365-Filtering-Correlation-Id: 0394ba88-eb27-40b5-3215-08de5e433c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?imotNUz9ZxSWBCskYwHPGqJ2AGRpEmuHyhe3jp9jWWtDQdFcxE87txnG3wpn?=
 =?us-ascii?Q?r0Ft7NNU0OaPnpnfwkdTdo/GQCzZZXo7Dt0JlzUJlJAndnIcbowiURrTfecL?=
 =?us-ascii?Q?UtdazSaxaA6ZJNVFZEN+IXaZWSVW6fF9DXigT+G3X8zFPSSP2dw96+/tLONk?=
 =?us-ascii?Q?cCKb79S+oYo9DRur9dNhALBe4dOx2E2akEMuwC/scobcltdrTUYC+UdPz9kQ?=
 =?us-ascii?Q?XQSbYGzLGDcgOmkahhTN/K3XPUotdomsb+M1WpM786Z+6PyMntUsBsRP9u3c?=
 =?us-ascii?Q?uMYG7kupRXlO7rjpfh01/OyWZxKLy7/wA8HnRU2fcS4EAX2cqq/HbM75nnPy?=
 =?us-ascii?Q?PbGogAVJA+MRNXU8797Si46G/D4K4816rLZlbT+IYUjfMZUIzegyzJ7Knhy0?=
 =?us-ascii?Q?Y7AWpNaMY2Hn+NWtuFhlqkcR0frwvfzdHshuIGMZ46Mk7JEesoUbQExvl8ES?=
 =?us-ascii?Q?lKCn3liUrZCn18J4+XNE70tNKfLQksiWb0TNK1P/H8eCLQSmeHwn7kCRt3qq?=
 =?us-ascii?Q?C3322WdE/d+BDzxDvF8VKajrwA3ben0QSsAweQ8TOvrcogij5ie4jVHGbkpT?=
 =?us-ascii?Q?GVW23bidsLlJYw5sFJLwSlDQ/UaM2mvEstUiAvpTBLjVT0PwMYMk8PKmiMlR?=
 =?us-ascii?Q?lNaHVZqYHeMFyv80dLBJuijFnV1SVKAC74vuriKnx12PMCVKuHQcZsZSgy08?=
 =?us-ascii?Q?4h+8LTkcgok18HqhVh86XPpB0vFoNJpvAD7VeC+XKLUx8Wri+7uWPEtcr2m+?=
 =?us-ascii?Q?I2WMM5ydTQP/WuZLsGt35f5I07oeJu/CFE6N2KekjbRvPMqEvm+HTYZ5jypv?=
 =?us-ascii?Q?09Zj1ItqhB0Tda1ERxixs6/O4BC4Ya3wND3YKE2HBh/Cobcjzf4R508vgfjQ?=
 =?us-ascii?Q?UOZ6U1URmqTbn7HSC7/1ykldwyylJ8kIcD78T+j5RKsRjTwZoDbo6MkTTO38?=
 =?us-ascii?Q?syl0k5gHSYXBNGqHLBoe/8hYjPWkFTExpgOZJSc0fmIuswpFrSOH0kUj9gXA?=
 =?us-ascii?Q?zNj322rn0gslA5XnrdHDi96oDZDfZsqYzuh3G01GsiPv5JwVsoledMAdAHK+?=
 =?us-ascii?Q?mug0B1i4jsPIzBEXhAD99r9BU6u0yqFQkZ9CzAVeZtswsNDuwAf11ZIKq66U?=
 =?us-ascii?Q?kr9r9MQo5NBDabvO8dBB3Cd+J7gGto093Vb2HNjAoyJacw+zTCq7sAMGqnJW?=
 =?us-ascii?Q?uTRXl9GMfUH8CCgs129kOP18Ft8Y7GDw7BqOqoiFXpGMZE4f+nY99Dudr15J?=
 =?us-ascii?Q?EpIor7qHVLGpKLZe9ZYDl9Ff8DlP+OCUQnKTJKafOsi7Jh1zUAY8KU9YpkQW?=
 =?us-ascii?Q?8O+ZO7y9drCeUUKVi1YM5g/AxQqxu+IZxZ5M/MBtQUtBGwq/tsl/WNMjXNss?=
 =?us-ascii?Q?h8ogQHUpDemtdkj9qQ0uEPm4+1c1HyT/g2oI8IPG/8RqeYigdphdHJehQLCk?=
 =?us-ascii?Q?ts6tNTfke9DM5gLE0xDXOaw0MoVBsfABgaz8WzR9Waz6fJFn1Vc21xYfbzpi?=
 =?us-ascii?Q?2mXkcTNxXHmRHDS5MtJ9PaJuLnj0ktxi2hM91HL88sKot8DGmw8u9dghibqc?=
 =?us-ascii?Q?T9IeiY0w7LAYBMc0Qb1oAnOl3odbhaT2l3ptl6NkVwMtMPwsOtLh0SJAqf21?=
 =?us-ascii?Q?kBVdlDlfVz3u+PxLypUqEk8f3E/phv9psXsPYaP9p13Zw5rVYbpDj2JYmx+m?=
 =?us-ascii?Q?JPlAcQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:59:59.8594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0394ba88-eb27-40b5-3215-08de5e433c44
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390

This system is based on Nvidia QM9700 64x400G QTM-2 switch, with the
following key changes:

Key changes:
  1 New system SKU: HI73.
  2.Power Supply: PSU AC replaiced with PDB board (added pdb/pwr attributes).
  3.CPLD: Update register map with new PDB related signals.
  4.Added explicitly includes for <linux/array_size.h> and <linux/bits.h>.

Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
---
v0 -> v3
- Comments pointed out by Ilpo:
  - add explicitly includes for array_size.h and bits.h
 - modify commit text.
 - fix patch version (by mistake v2 version was not specified).
---
 drivers/platform/mellanox/mlx-platform.c | 456 +++++++++++++++++++++++
 1 file changed, 456 insertions(+)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index d0df18be93c7..af0c6f4e8c12 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -6,6 +6,8 @@
  * Copyright (C) 2016-2018 Vadim Pasternak <vadimp@mellanox.com>
  */
 
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/i2c.h>
@@ -727,6 +729,16 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_psu_items_data[] = {
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
@@ -776,6 +788,15 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_ng800_items_data[] =
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
@@ -1399,6 +1420,45 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
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
@@ -1450,6 +1510,16 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
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
@@ -4625,6 +4695,359 @@ static struct mlxreg_core_platform_data mlxplat_default_ng_regs_io_data = {
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
@@ -7239,6 +7662,32 @@ static int __init mlxplat_dmi_ng400_matched(const struct dmi_system_id *dmi)
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
@@ -7458,6 +7907,13 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
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

