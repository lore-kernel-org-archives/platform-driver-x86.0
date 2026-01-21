Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5493240F8E9
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007179; cv=fail; b=RJSXqwApzbRnx7JL3arav8xfvZHwSkiOfML+wijSTOggguVhEjuHJWFrYWezRRb4GPAKTKEmdOdAKhpAivOIIMLvjz81KJdJtXVsRfcG6qVku4mP054GVAjHdM0ejumUI40zFA9T9MSS18t7ITki4hJ+/1xTKhvPQHfIk0ZSn3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007179; c=relaxed/simple;
	bh=6lyYTJSFKwzvX/q/9MMxaOPvmSK1M3eSLyEOhorSMOA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LQYfaCdkZ0aFB2UY4WicByB+sQEBq6C/STJyPlco/OEOMlokAaJBdcFLNtfZsRtIf020d7+OQnefxScIt4vGXBVHZQAyNweqQ2p/VhKFolYZF1uEVkdoNjE3wQBAxtQJXWVm6agtQQDmiFv5xkZh8K7tvjj64wjHVUXxYJNcXyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dXkOGF/w; arc=fail smtp.client-ip=40.93.194.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dXkOGF/w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2vdjyjBE61dl4Os+ZhojDwxQksTP2wfc47gb8C6pvu3oiFoms55UFi70uMvfNioSibSmVha/NlkFXAuW7mV5HBHGimzu/RgyLOPPZj66gbdwCBW9fQexFSRQn0j58Ez8/tdPY46OA3FfhrYHQUfEXwc4ykIE3CGYxg2fGAXUUWOPfCXZFf+gWcwmCQ+CRfehySMu10UQpCklrMliHsaK0nBY+5QBE/fDv9A54Tu3FM1dsgK8phEJgo5xQ/wlGQI2MYL+90OXgXrdIpAaJP1uxCiqwaH4UhN2huTdpVhaHsuXijaURUODwoSS2DuSyJzQGZBqgVf480Pj8q6EgGghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKlcjh/nBXFC9IxrwIqQU3yTK781oxMLNNy29UvdPv0=;
 b=WYh6sRO4VsBicRhEybRvNIzjEKD2HJzI4WpOYQz+JcO3gIgKu0YpQ+8JUq7zFrdbmR5WXHaOzKLzHtl5lzUp9nZ5I+KyL2/gAP+Hi0kMvZFY1NAXN8bK8KOqLQvt48ziAVnuyHg4y521VAVg9guHPo+I6tpgDg7UHmJabO/psbB3+w2Iz+B1cNes/c+yJRIko3h2iIr+hcSIfWq6oWwTcUCBRSutsC7xJo/mQV73Xt9nW1d8kPRuSU2QzzzPG6Ekzvgh4syAFUGhVqEfTXLwfOhxnuFUQYerw/PztFIkyT0MQEyAF1GCvZyAZ0Ad+DYy6HHBs7I/wTR9JB1LP1M0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKlcjh/nBXFC9IxrwIqQU3yTK781oxMLNNy29UvdPv0=;
 b=dXkOGF/wTQ7ZiwyUw5FxibIFdwZblQKnMOZaFj1VTxEGu0z+QrnTEvByQH7ToEkIfPwk+a2vBhOd6lM5qJT/um3p0QPJ1ZE+flDVHZQhVdaUOgVwxpBWce9DxLFqp/2ueYhKQHkCFIVQ0QV68O6J1INaVRxUybJnEbk9KoD1kRVz1KDXa0FdcLgL8mozMEPmxgpohLtRfoByjkDzt/AEaMYS/rPwsrrvMaDWskUqWAuK4kV0LaaWBQ+QUk/feKqsFBS5B5ue7rRbwpgZ31VonBOc0mZkGSv9g7dkw7Sdh3IN7SgG0zUj8vimcP6YWzoHTn0oI51YHsASAECEH+CJJg==
Received: from BN0PR02CA0020.namprd02.prod.outlook.com (2603:10b6:408:e4::25)
 by CYXPR12MB9339.namprd12.prod.outlook.com (2603:10b6:930:d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 14:52:49 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::15) by BN0PR02CA0020.outlook.office365.com
 (2603:10b6:408:e4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 14:52:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 14:52:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:52:28 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:52:26 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 06:52:24 -0800
From: Oleksandr Shamray <oleksandrs@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Oleksandr
 Shamray" <oleksandrs@nvidia.com>
Subject: [PATCH 1/2] platform: mellanox: mlx-platform: Add support for new Nvidia DGX system based on class VMOD0010
Date: Wed, 21 Jan 2026 16:52:13 +0200
Message-ID: <20260121145214.4021631-2-oleksandrs@nvidia.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121145214.4021631-1-oleksandrs@nvidia.com>
References: <20260121145214.4021631-1-oleksandrs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|CYXPR12MB9339:EE_
X-MS-Office365-Filtering-Correlation-Id: c49a2c80-ba1c-4452-072d-08de58fcbead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?byQtdLlHE2Ib1g4ybU+flyIJYo/P0yKfBYg6zC967adlEuc8wZ77rdv/yDvB?=
 =?us-ascii?Q?5Q/S7VHtJ2r+hX+y2kZT+ZUVizjb9w2OKqxxmo2p4IFrEtcud074B0WGjEKb?=
 =?us-ascii?Q?mVW1B+MO9gWcERsKy/wI0MCssmRZhf7V0/D8XWvSoL7FVNKna80liIXZE4CH?=
 =?us-ascii?Q?yr3At4QQT3texJfW9stmSttwFLgVhAeDhsE7eHlKCkgneWh+T81+VvmZs7oN?=
 =?us-ascii?Q?teueDOpo8T8VZcWE0IW6oBDk5X5MzDmjGA7M39pVwFa3nDZc9SIKj53DHYzH?=
 =?us-ascii?Q?Lxw1jAtY2o8Wdx9TjrQebePKzeyRW7Y6KpE3+f462gK8wF3Z6Nr5E+nNRV5J?=
 =?us-ascii?Q?7TQ7xulf+99b77L01mvXpvGIp3cH3VLyW5zfyiHmu/t/K2Kjg8P8bE6oy/ng?=
 =?us-ascii?Q?rvnermhEzixTCLJdQ0l66YltU2gJlTLZv+8YMMERbG2DszGp80upeM7UUleX?=
 =?us-ascii?Q?i0dfR2W1Nmi458MOCY01gVjRVoC04Wwprxepgl/ywdacse/1COlhLyFWL5tV?=
 =?us-ascii?Q?MubKDqgQLwGdnWUPMKnQqk4lH7rzkhgf+VeIieuQ2X5jjVpQKMGuajvBY7aU?=
 =?us-ascii?Q?BrsPbv94+H0Dv74YAD2RsgeU0/USd2R1lxPfQTZczlMks+nsAPP7T4T+kJwT?=
 =?us-ascii?Q?bDdqQQrkxIOCyk4OJFP0nWATBDQRz8FYnPTpre1VqwATOTtz/G5ACMitYpK6?=
 =?us-ascii?Q?+q0qxZjK9FSxY3Oikb2qRQJtfH/v6qvSGdocljF7sxVPXgIlk7qiwKZFmBMP?=
 =?us-ascii?Q?tikJlHphn+Sykrq6Vzpt6FZWY5AwBm4ILuDNtGx7L6d1t3o6WzilHYnH8FlA?=
 =?us-ascii?Q?WkBa9hpnPyCYz+LBuE1WL7uvgW4CPtgbGUWlV805/wcJoAhib/lQjEFLbwK8?=
 =?us-ascii?Q?qfx6cocLSUIaKF3aMoJE7t1WU969YmBrkDiCgxcT8Yv5NCe8fbn0qY37GoYS?=
 =?us-ascii?Q?7fTjDrlBYt9obAZWSJZMvzqooTc5PpqLnUr+jTpZmyShLBO40y5gSr3YFO5d?=
 =?us-ascii?Q?eqdFaDJOgwk3SqwKHKhGFftpOcn9gMBnn7C4QI0P88wgqvtgFdsRxH1teIye?=
 =?us-ascii?Q?nIBPMJDHRxBlSQSYhYB9ra00H1r68doZA34Y66zmY80eC+IQBLOzEl/K2We4?=
 =?us-ascii?Q?b45HXNR76i6/NUjMsmLaOwrth5blSfVPffTEOEB2RGDIAvZqOdc8MmxWRF8R?=
 =?us-ascii?Q?e8uy81J8gdY1Hzmh9DPhi6J0/Solp0WNXIeOclVhaTUb1n5VUdzykpv8WYOS?=
 =?us-ascii?Q?K1U2iV1Lzypd2u2XBabgNNIv/iGnh5YQ3BtGV8G/jPAcqy2MrACpp7O4n+Vz?=
 =?us-ascii?Q?KgXSML9jf6/2ocgcMvxthecxgMkuAIsvMHiZ0ZduVZnXxzrqOzQtxvQJUJUN?=
 =?us-ascii?Q?qV79ED0A7l06ifQe+j3f59vuWRarX9/V8sTP852iMROmmJVyuwVvGir0zZn0?=
 =?us-ascii?Q?0yVMyEhwWyUl66oZooTtotuotB3AxuE3L7aKcSijiU5o3S0uSdBVObMSfig/?=
 =?us-ascii?Q?CZ1ipPHDcMgFIcfyMtpNuufvyOzg4dB90EWFDqIj0mM65Tqaq/YLQf1Nw9q9?=
 =?us-ascii?Q?UvscxevIZnz/iNYVFqCd7ig1uMg/P/HqQZQvcZ4N4ulYyrRkIHYqBu19hHOp?=
 =?us-ascii?Q?Erb5bgJI8uAjmKp5IHSfLLTquUYROHsCbM86+c22jNft55rvnSNhXkH7KIIy?=
 =?us-ascii?Q?6ABRmg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:52:48.5299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c49a2c80-ba1c-4452-072d-08de58fcbead
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9339

This system is based on Nvidia QM9700 64x400G QTM-2 switch, with the
following key changes:

Key changes:
  1.Power Supply: Rack busbar input power ORv3 DC 48V-54V
  2.Dimensions MGX/DGX 1U compliance

Added explicitly includes for <linux/array_size.h> and <linux/bits.h>.

Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
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

