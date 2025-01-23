Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3F15A85E
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659546; cv=fail; b=ZsbOZdX+2Pbayatibsm8nkNw4UmT4ofpH8mrnbh2dT4XBNiGLy0Q5u9D2otiXVdmDF5oYPjioC/8yD2T4MdRegDlngm4vDNPhczyBg9ApPVNCGRRxr6d4Y0tUx5QrT1nMp39nXlDwrpKanMqcGxLww2SrtXA1Ixb7rvuZsjgF+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659546; c=relaxed/simple;
	bh=oL2ucFpvG3a4VB6QJe96gmupIxZOVuaQGSLrA7KzV+0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihh0SvogxJSuVN/5j94Kw9PqDn7Kg5zhsiWb2fFd+dtV+7DS/1ct2pbpSRwLuHMLo90J6kODZ5ZkmLjirz13A1uERH4uy1XKPnhwvhe8OlJPsDCrYY/Be+cHVrQNNJwT6MPoYk3peZRKWjOIajPoTkjun71phyC8+4sRId24j1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qYZczZjB; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qYZczZjB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLJYjFMRQqxL76kQGHymODZTwltkTGoDZljfnbm7EZmBgg0LX4Pa/IYIXNIdG4lfgw4ajO+j3uCXXf4dRShlV5MQJUqKfogVWuPOno00a0IUo52QOGT6JcB98peXo/q0JK3wLWZfesqkqb6nZVGxuyvVP/qtGebWgawQ+Z2HuufMliV4BZ0qgATIhW/zkMQfxnEDlqvU3fZm1IyIRwIH0U+zOijTIlzGsgiCt7lOGZ/o1uuSilG9FfSsfOgblgTewyxHKbXDD84r5FB0cHintkWmpRPuxtlSJXP4PM1yS3iLnjZAK+fYM3JE6apQAPY9FQpP0ar6h6Ubc1SfE2wDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9VzE35503heiith58e5T7Sq3UKEg6RrphWdxaT8THc=;
 b=Z+Setq71NbohZjabs+m5EoGNZ0trO03z7koVCwrJMNywZyXwya0J6vHZLH2HwnAqUYDlgBVvtkGf6XxM4uYbg35MdtK2OxOf0J7XxTU3XlQ8ImrlBVMbLEjgfsDebi6DI9t2Qw2gpT5BVmALNv35r79A1PB8cC2DzNdgF6DmcSH1ysO+M/fRGLc20w6YedtCT7M4QPT6n8nr7vWGPbp0VYfwwNbE+QBJip5weJbLYuMKlN1XL4LoIno7LCTQjKPZb0y1/G2DqVqIDXMfpN4s9UJ256z0DiyUWt2AWQQdMcK8JfBNnhr8Zx46FlXRpT+kezzdaxxA0yQB2qO3jwEMZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9VzE35503heiith58e5T7Sq3UKEg6RrphWdxaT8THc=;
 b=qYZczZjB0z7MzVW36DLYzg57Wvraspil6oBaNz3c+knYjR2rE/tVPwvNJgsEEgmNgvCGSUnTwzZzED4C1ncszU93BeVJKyOc2CCI8IBphImi0+Y6h+taIr9dUGcvju1CxWoWs743MVYgk5lDj7YRdRMsmLEuNW7GE0JhW0UpJ8Xi/ywCOMhOLdERaFFmFrQlPyZzCO0es4GIw1XGwUv4siAG4+uQif1nWWaH/AB4vWulTugb/HUdd5rxnS3SsufWsK1pCT47wmFEhvVg/Rch8qTyxnXruKDRGCZm/RnMfn4iHwv7jxWqUUwmAwVymnVxzKUBnt9Hugp8rBW2bcWB7w==
Received: from BLAPR03CA0083.namprd03.prod.outlook.com (2603:10b6:208:329::28)
 by SJ2PR12MB8720.namprd12.prod.outlook.com (2603:10b6:a03:539::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 19:12:18 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:329:cafe::67) by BLAPR03CA0083.outlook.office365.com
 (2603:10b6:208:329::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Thu,
 23 Jan 2025 19:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.0 via Frontend Transport; Thu, 23 Jan 2025 19:12:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:12:04 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:12:01 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 10/12] platform: mellanox: mlx-platform: Add support for new Nvidia system
Date: Thu, 23 Jan 2025 21:08:14 +0200
Message-ID: <20250123190818.3834-11-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|SJ2PR12MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9c7f7f-14d7-4f41-2a36-08dd3be1da9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gO59KNj3Z0y00vbAZ7v6t5ceKMbs4hG4cN5qJqblw9bdJTWWB2gJpXITpw4I?=
 =?us-ascii?Q?NgrgCW6WwMiSRszHic1bbWvXa3nxt298tDjF3ero0k97drbzh9JtQPmKxCfm?=
 =?us-ascii?Q?X1Kso5Cb0+LfQBLoCTFzYk0EHJrHFe8sbuMqFpYt+7nLnVHdzTUotMYxEBtB?=
 =?us-ascii?Q?UMG3jxVdclWEK5EaqCpBDoSJYgj28UsQ//o1+esACbateNMwdI1M4Vx2Ijwr?=
 =?us-ascii?Q?410P8waBZxWy9oEKlbN0sg2X07oD6kmtOsEimFQ3pCRh7pf4jBh7HLw6uy0g?=
 =?us-ascii?Q?PoJR84qAjH9Z7U3sy6IDv2I7l3f17liItzkSyJsQO6BilEM8HtLCvpU31rae?=
 =?us-ascii?Q?CueOp/g1gTR0RQgpH+jvOffIl8blPSIkA4AtCSZvnAAlxBsgRu59sDZPMbwm?=
 =?us-ascii?Q?uM7+YSoDCsQyM2cmtdKvab5fxiBfn/W+23u60iblAaFOumdh0b4B05L/buew?=
 =?us-ascii?Q?ttEZZEppSSs9f68Pv5P6O8O9vnsXVN/b2xBGKYUXdGnZQ1w+LaA8LM0eRM5n?=
 =?us-ascii?Q?RwS+15mgcRsTFkIVy1PH5u6wLbRnzWpsKtW6rOjmZSJwlFZMD9c1aMuaFrhX?=
 =?us-ascii?Q?RfLHjgQBHR5ZXLdIuQIu49g1/cVHkfRYTS1zvv/ozB0+eACrRXqr5lVal9nh?=
 =?us-ascii?Q?LxoP+hK2d4RBDfrQuheoqxKZYMKXjDarrUGJPqLGKFJlQP4fayzcSvfSG4nM?=
 =?us-ascii?Q?Y3tTrJl42odSfRVt0088bQOQnJQxMGULxsrinXEQ5r2CnkSdgzCLjRsXwiBH?=
 =?us-ascii?Q?xpOb7BVq3QV3Jmu9A+dxpXw03z1JNaji7WK7iGYpKHGcwEOo8TmkXPEAorpJ?=
 =?us-ascii?Q?YuSPD/4AF45r+zHw01vdPJZCPxpWxUcDz4EQ5EC/tbhRHghfRLEhEn5fwdZE?=
 =?us-ascii?Q?3KgsfGNDsFM+qGJ5VLIk1J0oce06AmJ62SSJUuP1GHK9kJggGQ8bUS4Fd8QO?=
 =?us-ascii?Q?WZHn+syeVHGUSPS7jdAyD+/vY0fWokKSZ+g398AHDFCOTHDTnrTsvOwNkFnM?=
 =?us-ascii?Q?8tKR1LyDEWLl//KrJR7j9Rza8VG3p8dg6qcAePEz4FyrtJo1bA6cXayUhk6y?=
 =?us-ascii?Q?DG1KFylQY+Al+u45sJN5NLqd6Hzn7Dw/DmxA8n2jsTgPdGadzcQpNCH9z6cd?=
 =?us-ascii?Q?DrHgcfb96Hsz9rJ4dINWS2V3jbJeRMbnEPvlg8C7s0l2+K+WmKEmzc02pV/D?=
 =?us-ascii?Q?ujNyTKwsKydzrdriLMVUqUzfKAm5YMObGwk0Y9jMPkpvhvv2/AZRFul9LPe4?=
 =?us-ascii?Q?j92jCgykdO8TY/RDDa5NPpfkQcFelcG/SSBOh1sioWJB62cFoweHwGLqrvUg?=
 =?us-ascii?Q?Qw3ISmVNsUuW2+U2cwT3XanVFsmVVMoI3nS/GNomMicJbuJn/AvVYaSJ71UL?=
 =?us-ascii?Q?9tdY9LgmG18hqxM0GnJAUATJRHofh98pdQsjdCVhMtpoozl71Gy5eicFPK9j?=
 =?us-ascii?Q?H/EawySaSvQ7kOpJjqYVHrtFFXphDjPxAqO/yBKw5OqkHmCE9p+lfmRswGMA?=
 =?us-ascii?Q?tb08gMxU/eDKQmM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:12:17.5835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9c7f7f-14d7-4f41-2a36-08dd3be1da9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8720

Add support for SN5640 and SN5610 Nvidia switch.

SN5640 is a 51.2Tbps switch based on Nvidia SPC-5 ASIC.
It provides up-to 400Gbps full bidirectional bandwidth per port.
The system supports 64 OSFP cages and fits into standard 2U racks.

SN5640 Features:
- 64 OSFP ports supporting 2.5Gbps - 400Gbps speeds.
- Air-cooled with 4 + 1 redundant fan units.
- 2 + 2 redundant 2000W PSUs.
- System management board based on AMD CPU with secure-boot support.

SN5610 is a 51.2Tbps switch based on Nvidia SPC-4 ASIC.
It provides up-to 800Gbps full bidirectional bandwidth per port.
The system supports 64 OSFP cages and fits into standard 2U racks.

SN5610 Features:
 - 64 OSFP ports supporting 10Gbps - 800Gbps speeds.
 - Air-cooled with 4 + 1 redundant fan units.
 - 2 + 2 redundant 2000W PSUs.
 - System management board based on AMD CPU with secure-boot support.

Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2->v3
Comments pointed out by Ilpo:
- Add empty lines for visibility in mlxplat_dmi_ng400_hi171_matched().
---
 drivers/platform/mellanox/mlx-platform.c | 97 ++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index dcf251e551a2..9335a93bd797 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -3042,6 +3042,60 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_l1_switch_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_PWR_BUT,
 };
 
+/* Platform hotplug for next-generation 800G systems family data  */
+static struct mlxreg_core_item mlxplat_mlxcpld_ng800_hi171_items[] = {
+	{
+		.data = mlxplat_mlxcpld_ext_psu_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_modular_pwr_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_xdr_fan_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = MLXPLAT_CPLD_FAN_XDR_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.capability_mask = MLXPLAT_CPLD_FAN_CAP_MASK,
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_xdr_fan_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_default_asic_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.item_count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.inversed = 0,
+		.health = true,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ng800_hi171_data = {
+	.items = mlxplat_mlxcpld_ng800_hi171_items,
+	.counter = ARRAY_SIZE(mlxplat_mlxcpld_ng800_hi171_items),
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,
+};
+
 /* Platform led default data */
 static struct mlxreg_core_data mlxplat_mlxcpld_default_led_data[] = {
 	{
@@ -4528,6 +4582,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(4),
 		.mode = 0644,
 	},
+	{
+		.label = "shutdown_unlock",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
 	{
 		.label = "erot1_ap_reset",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
@@ -7355,6 +7415,29 @@ static int __init mlxplat_dmi_smart_switch_matched(const struct dmi_system_id *d
 	return mlxplat_register_platform_device();
 }
 
+static int __init mlxplat_dmi_ng400_hi171_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_ng800_mux_data);
+	mlxplat_mux_data = mlxplat_ng800_mux_data;
+	mlxplat_hotplug = &mlxplat_mlxcpld_ng800_hi171_data;
+	mlxplat_hotplug->deferred_nr =
+		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
+	mlxplat_led = &mlxplat_default_ng_led_data;
+	mlxplat_regs_io = &mlxplat_default_ng_regs_io_data;
+	mlxplat_fan = &mlxplat_xdr_fan_data;
+
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type3); i++)
+		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type3[i];
+
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
+
+	return mlxplat_register_platform_device();
+}
+
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{
 		.callback = mlxplat_dmi_default_wc_matched,
@@ -7455,6 +7538,20 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "VMOD0019"),
 		},
 	},
+	{
+		.callback = mlxplat_dmi_ng400_hi171_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0022"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI171"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_ng400_hi171_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0022"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI172"),
+		},
+	},
 	{
 		.callback = mlxplat_dmi_msn274x_matched,
 		.matches = {
-- 
2.44.0

