Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9858C23315F
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757974; cv=fail; b=jR6BZ3srsVLymYwMF4/ivE8wY/GcP1ihlHn+b1/8gL4ZGlNKaNppVhHQaLIpyST3p9UKyeiclySQje8FLWdoUNNV7rTTl82M7rWpDZfSs+VzkqlgqI9hrywv8bZ6X945ap3acG1Ar5fE0u0tUVWArHR2d/v9G6SaWl7/UnnPrnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757974; c=relaxed/simple;
	bh=FlhE7wUbVwI4zwwrI+uVoKL2S1ZwhcZ453BWVWUJ6PQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uiYOPP8jSmECNCHuX6e6EkrDn3zBhIE8neloROhCl0C4krCz+eEoHuPVppgadVL0V3YNKdCffjGldFrYCngQGCZHtqH7ZPbC1QoYLh02BEdJEz2zEMQC0ETvZwmshU4+J0vsBTLqxKdUkFON6CyOgOs63sgEqBln5Gy96zFq51o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=El9ee7y2; arc=fail smtp.client-ip=40.107.220.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="El9ee7y2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K10zsg3ROGlgOd/MneFRbiSTgHoLWqPqXYw1dNWKVqlScS1/W5cXMQInfF6+sGWcZ4G3eoHqTx0KcHJYjD6gcm157I+mZkjjTktOF0XtwOC/x9fILVaUD+Puy0VCSCReXi3ncww1ts8y3hyKx2D9saSHCV2j8oBSgyTsWC4yus8f1HBoqMf1OAcxU3D8IKeKG2cAwBZCLURRmQPCUJIaJtfJRlKPINBI5aVW15MygGLtgFUvAa5MHoxIuTs7262UD8taWr5dCcwt/pUXVyBH9Mm1CXe9lY7zAPuVcpMmNvf/UZe000y6rqDaR1zVj9u5WGEMDKPXPg4XY1aSpNZKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0PFaQVu6fHILm1Ro2he1a9Jgvf86qDUDK0kUWe4LAI=;
 b=nv1JYsS45M/mq0EvcCZ2idVbxFwXTzkBTKbIsAhoomeYutJN3gRJPJxHXQSrHSvhW1MI1U9lYL2OKEwATtPr/sdgoB+/YSHh2unY1PmdmGsGMY61X17yoqcJ3jYIXG5LETYXIkck5Oljc084ea+uwQKptjbt+0sprDroFAUQjFFEbS+GRuD1wQRNCexW6ULWfoHq+B2L1VplkjYNPPNoKDVKUN0buzWjRIMfFY2Xzr+Tax5pprOK1aGttT7pZNqQ3XepVjRBXBatxE5ygZM7gQjWQucuJN4LuoWpzg4hE6Ctck+GOhHVLOCMyPcLvS+uQGd0Vxd0pjljbyS4uJEuCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0PFaQVu6fHILm1Ro2he1a9Jgvf86qDUDK0kUWe4LAI=;
 b=El9ee7y2k05gvvXhgq5kWOR1+pfeZwv9ycksUmnFqsx8IKoj3X54tj/A8iRTUbGIymge5blZbtJ/7ksf4P20zfAPpOfLUyK3Akt/OT+m0gQqJ3Z4uF6+XD/9lnLEmrCpeu+hHlimiyjmXXLjPLm+RHwyTyRlQijgs68ByLYcqeTFHwPDJGuo4W8OSay492b+fCs+1/E8q4EzCkT56e1c2C5NFKD6ji8rLlYZUr0vdMZtnMgmjmaGmrN9SCvWMywG72plOv1Om7H792PqnQmAVExVu7XoPNEMUmOP3zq7Y1nZYXSOQXTPm3qB2WtdhK9WH2Df3RhLttCayM3oeDxQ7A==
Received: from CH0P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::7)
 by LV3PR12MB9411.namprd12.prod.outlook.com (2603:10b6:408:215::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:46:09 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::91) by CH0P223CA0019.outlook.office365.com
 (2603:10b6:610:116::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 08:46:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:46:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:45:50 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:45:47 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 08/10] platform: mellanox: mlx-platform: Add support for new Nvidia system
Date: Mon, 13 Jan 2025 10:43:30 +0200
Message-ID: <20250113084337.24763-9-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|LV3PR12MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: 70cc4dbd-7cdf-4a70-6de9-08dd33aeb99c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pB2RxaYWYNN25E1Y5dYPMtw19YdddeD5WjSJWZxStL1Guc4tKJ6Kxe8oPs/R?=
 =?us-ascii?Q?TrRgJ+kEf5g53gl7WZY0OZyc8KaudmXppo/06k/tcV0RgZJlDtMfCycYrqNT?=
 =?us-ascii?Q?4u485SjTwFg3p+HC/62DwAe3oUl4oCpyQNC3vPFRMTTBRVQ2nQfUiSvYbBUX?=
 =?us-ascii?Q?1bBkcD6KPNTWxiebpS/vP2FuF92ZQnNUDp46Bd3zf56ks8Quhe1EowHSxTx/?=
 =?us-ascii?Q?amoZr8iYfJxpXS88pbXCBGVMDg7+s5N57GxoLSwHRXq0iY7Cr+m2vDrrTTKQ?=
 =?us-ascii?Q?locj76ScMyW9Gx3ypo9tRl0A7TMB23Vu0JORMsYa/bvQT2JW2NRTxIBCSU3c?=
 =?us-ascii?Q?UklruFc15agGCW3hdHElkcLcE6W7S9cF2YbUtNSb4SDkvAFVUvkAD7l+Rhoy?=
 =?us-ascii?Q?KD5Ky/liSf6gVCsuNnFXIV14WOZfftKpG01diOpW9VHae8FYuiMbCRkQt08u?=
 =?us-ascii?Q?EMTdXdfvTCPQtIi0kv3xLeqqJV+wZTysInUTpon7uFpBuV35jMuAwPVpM65b?=
 =?us-ascii?Q?OIUv87uNix4RYFzJBDedvwGWp5/dWOZfAXwS/w2pzusY9X7caUu+6h5ivj9H?=
 =?us-ascii?Q?O4Ns2gVPfcxrIGL3afMLw/qW/OOGyeiM4VApJBJD0FT2gUX7/gLHf1anuVEP?=
 =?us-ascii?Q?6InlCAokezZwbSUAgmspLnd1Keg3DnFVQSwJ0ZwBbtDa0vsyy+lqU3/zy/oe?=
 =?us-ascii?Q?Gv1zptcQXoZlDW6adteMn6eZf1hUuYIQ/LpKAbVsqf+l0EiurBOFSBo7fzcw?=
 =?us-ascii?Q?kGDA+ipwy1EakFkUmhaSBE27g4lM2sv3ikuvIh22vOO2SIhuuPNF4N641i/Z?=
 =?us-ascii?Q?iFZh6QHdLcwgwxyLS4gpTEahVb+CXBaR8aqcniMCehDB9dtm2xdidlKKzjuJ?=
 =?us-ascii?Q?tvxihYApfSdx3Zm89mGnV9HPNG03gVIaJozutYlnej7tiTrOg26r6akpJSW/?=
 =?us-ascii?Q?yJtj84Apoqyum9hLwGahr/WJigMRhgmPHYerjGj2FwDYoWHRuUr8zWXQ9rOQ?=
 =?us-ascii?Q?15gcXVMl9QsJ9xa8WLiQgxEJrQ+z3i0ONt6pHCljVZx3jLeLUvlqmOZGDmjz?=
 =?us-ascii?Q?MTovknpWqxe69upCOyPUl2srUq+u+La2f+OHqPBcrzYYfJ4N6b3lL+BrJ9V5?=
 =?us-ascii?Q?zcIrRKZGXu0+fUumDwFeEnNZqZdXcCtkI7wmVDcRbHhdFMmZJF5GhUFtG2Bx?=
 =?us-ascii?Q?PC8/a4yLOwjWN7SaWiJJDIm8+WDa8TnrEihnJDGWxO+M1wesaHJhLKMNrlU7?=
 =?us-ascii?Q?AobKXxAOWY34PTASRdX3pH3aUB5rPc5Fkd+MnJoWmHtdx0C48j31CHw7osIi?=
 =?us-ascii?Q?ehfaMV/SSktjlcMBfgvyTbsTWLDQ9mDcSrdXxCwoc0KFBBajCbv68Gkmh+/u?=
 =?us-ascii?Q?3R9XmyqznbifRZc3ivVvjr6vhFzzOuryRVXyCO7yc4g6H7cCc7Tlcyy9ybTP?=
 =?us-ascii?Q?JejS7tjtq+iuO3oi5EEXXC/TK6SYD0BEG77tWZXE37fMBtODDGfhtWe0WPyY?=
 =?us-ascii?Q?uJ4b4jjEM6+DtTo=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:46:08.6122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70cc4dbd-7cdf-4a70-6de9-08dd33aeb99c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9411

Add support for SN5640 Nvidia switch.

SN5640 is a 51.2Tbps switch based on Nvidia SPC-5 ASIC.
It provides up-to 400Gbps full bidirectional bandwidth per port.
The system supports 64 OSFP cages and fits into standard 2U racks.

SN5640 Features:
- 64 OSFP ports supporting 2.5Gbps - 400Gbps speeds.
- Air-cooled with 4 + 1 redundant fan units.
- 2 + 2 redundant 2000W PSUs.
- System management board based on AMD CPU with secure-boot support.

Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 95 ++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index 9d237852d3e0..5ede7eb5977d 100644
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
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_modular_pwr_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
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
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_xdr_fan_items_data),
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
@@ -7353,6 +7413,27 @@ static int __init mlxplat_dmi_smart_switch_matched(const struct dmi_system_id *d
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
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type3); i++)
+		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type3[i];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
+
+	return mlxplat_register_platform_device();
+}
+
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{
 		.callback = mlxplat_dmi_default_wc_matched,
@@ -7453,6 +7534,20 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
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

