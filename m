Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE473451
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014521; cv=fail; b=mGIYzMKRPquvJPunxpqgo3wLmwfgfyX3ufpLqs/dpwQ0U09O7PAr/SEmFZLo/R6hH7Ep3Kwkr5ze9jLJvKUntr7u5KOHXryYGy3+GW3+ecBD/jIyhtp4gNtiH+bUIzPFsYmhLkES1OJLrE8xAQYXiNWwA5kDlrBXGPmzD5bgSuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014521; c=relaxed/simple;
	bh=a1/QgX6XGlvpE0fdwsPLYx1b4C51wNcTMQBs7IsLl2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u3dZGUYC+4/aDiKE0c8f5dSc7gAfvLuaW2Xg5mFerW9tW286ssKHd0EDkFk/VqiLyrFH0CAgbsw+c/WfhX67ruecXS4hvMVHrVBwUQgpuDmbK3XSE8G+kR4qn9ECIRP8lgDeGwf+4mk/xOehfvJnsF3cKlFYCkNO1wkbGmg3Axw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mcDA8CMj; arc=fail smtp.client-ip=40.107.223.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mcDA8CMj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1NTRTMxFjhHzj7wY+5lm5VevMjSw1TKztgGi7BPMD8vvqr3hMNSJB+jfn3cH8CBayXDKW1vaS9pb2SQMC/l+3Ag0desdttTFDRXRfYOQJL0niMZ+B8eF/SAbmBXbdT0/VtYatGUpkO5ybNG9qg82w1SJrxR7ny+E45s5CiWc7KShPiYncMQ90w80u7cFUuN2kSs4EWGjxP0DNP0uTGI8c0+dNQDfW5gQ9GsPTHIc4inam7o74bwclQuLLeABVkP2qQxDZzheF4AIicgRczaSwVWtru1i9bfpWfeA2yj4JEegkkL/ucOYvRUBK1h1PTevdUYpVeN+aHcpb5lJMkS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84ApyUzWqPPW+T9lCRV/t/Nmpkohpt6m4TxHSQuQlZA=;
 b=fxeSibkm+Lh0jeOrroZ5lnE6sV43MlkF2zELyXSunWRP50wyVvoW2dbb0hN6T+ku2CDVkc9HsvZYM+I993yy8ez96xQsS96kC03coJ+bWpe/TWRArpI3dHHrU6UyPQsI5jr7RbvN6zrcLfl6cPljLSTBcNKfnSN8tL6G/LO/GAMs43UmvIZdX7rbTTUWmyksp8yaBWzEybKAhmbd1qayUwlx99nZJA0FCC/s8y/V0s9pEo0OVHLpIvWkrZgvZCoOWsvOnvf3AV01fVHlQhPBgrygVqKLNpuetcI4HZqv+cMmZZgdIuNoPSxEFREny/VSE1wrCHnx5Ge/OxO8BkLVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84ApyUzWqPPW+T9lCRV/t/Nmpkohpt6m4TxHSQuQlZA=;
 b=mcDA8CMjcAy+6mb8f7MnvPJQlqwlmFlqbBGQN6s2Y/LOvMfX7RNEf9VSA5/nZtGtYmXW0opJGzP6BTJy6/dj+KYRfBQKlAShSFQ9tH50tyLIGYQlgkQclZdumnaQ7w44OLI5mfXG3T1W/CAaIo6ZU+nw+1L89L2tG3zXBYLSjznMaPJtr7FIfYc2js4KJ8XGFLu6vLuoNK+okwBbgzLHUkI6TRkcmANxlwqaN8oFj5zHrpx+t2Cb5RFqVPzMqICkvHfQ8RUbbhBhS/C8+JGFFWh1TLQN+HmSU8UD+Japj9ufMkWvWm7Aem8/Y0O+SV46LuzELzCRcifgEXi1cDh84Q==
Received: from CH0PR03CA0089.namprd03.prod.outlook.com (2603:10b6:610:cc::34)
 by PH8PR12MB6721.namprd12.prod.outlook.com (2603:10b6:510:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 08:01:55 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:cc:cafe::7f) by CH0PR03CA0089.outlook.office365.com
 (2603:10b6:610:cc::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Thu,
 16 Jan 2025 08:01:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.0 via Frontend Transport; Thu, 16 Jan 2025 08:01:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 16 Jan
 2025 00:01:40 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 16 Jan 2025 00:01:38 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v3 08/10] platform: mellanox: mlx-platform: Add support for new Nvidia system
Date: Thu, 16 Jan 2025 09:59:14 +0200
Message-ID: <20250116075919.34270-9-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250116075919.34270-1-vadimp@nvidia.com>
References: <20250116075919.34270-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|PH8PR12MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 67a51976-dc5e-48fb-a6b3-08dd36040b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AMD2ptxvaMuuJvR5ycvg3l6w61N6CMwnyjs6sMEjCy5MqUW7UoFk7XJk095/?=
 =?us-ascii?Q?usDSqnpC4pj7Sq7QgWV+K/YCULvmC6AjzXJXMVP/PrIS6YDcSwjL3fOiSY5F?=
 =?us-ascii?Q?xu5J/i7HbLCpySnXK91wR4rnhaIIPK951ECgMpq+eYzNGDlXAr8aINNrjZl2?=
 =?us-ascii?Q?p/7oTBKOwJ/KwV3efA3I18DIzaKGZTikkCdHiiIGknMCw7Q0pm87CmgWaGBR?=
 =?us-ascii?Q?BtGErKb0JDoIDctXBUjeFS7b4GvGoyeqbStTbaLfP3m4oRWSPRlCpu6n10AP?=
 =?us-ascii?Q?nFZZlRt1jG8MsThcUp78d/LhV3qrl+rFYbBXtwR+Ib9ho6K1I1a5neFmpPTL?=
 =?us-ascii?Q?A15duzfVRo1YODEKeBGaGXvZZVbAteZJ5h6nt8H2z2Y540BIDoOx46ToeAMQ?=
 =?us-ascii?Q?C8f8QIGh1Ze0gHwqCNpp4Wbsb8+kwTMGKyBlJWk6kT6dHdLLy4BGRs3S+oDW?=
 =?us-ascii?Q?4KNGWpCLysTkmgECWlIhz7CJR1oNoooXyu1HNNhhzZHAmjILF9ctq3nThPXc?=
 =?us-ascii?Q?t6wqnk26O4PzUbUjq90Ygmi6kqCA0IIVghoDqQpcyCAMiiFcfLEIc4XxwMTb?=
 =?us-ascii?Q?QSjXe3XX9QMJq88A7oeCMjAOa2T/rQssnwAFoWWz4BpSUQaW0MixB2TLgYU0?=
 =?us-ascii?Q?YD75PWwIdO8XSPbknARR155NTOexKDA1scJuRwHONxbzGLwrWF8NV4vUxrfP?=
 =?us-ascii?Q?3yIQtJZBotdWsNVFYr35wtHlfAM0RuuOrlvkwu3B5zKZW/YYooEh+D0ZSFNM?=
 =?us-ascii?Q?qTjP24Wo0ykxCCtQ/Gh7vu4idOR9Z7RZuQ3zHDTGYEbFi7b8dxVESy0NVDxj?=
 =?us-ascii?Q?JGNfgSSfsJ/Ya9VLBpamL71CLqqzs7O/5qfUr2ISZY0lKp/MkLUB9DQYKkxX?=
 =?us-ascii?Q?ZifByg0W05i5yRYmBW6aPHQji8jCJrGasenjqPC7mHY/vGWjGLgZk0naC2N0?=
 =?us-ascii?Q?F7CAX6l5aWwHHRN3YiM/saRrrYxmSc78lVK6z6//SjEvNwEI6Assl9Q137nx?=
 =?us-ascii?Q?ePcBlmEYR185rMY5QuvmsBuzbCD2Blt0xaCTOk6aDUwROzITlLJ3GZGMtT9j?=
 =?us-ascii?Q?aVdJd7F7tQFjhBipcMWuKm/jlZFchakuUiXWOQsWjHlFD4hatRA+PkPdPeNW?=
 =?us-ascii?Q?AgZbFVurmvHJ4bybVGBrtALZk71sC/Dm3E6cTfORArCN6OWmEXbjyg8R0pAj?=
 =?us-ascii?Q?+rsxCEDJxCPJ+LZN2S4HfsuS/XbF4Tpj8kB9WQGWqH9wK/QQwbGiwa1i40Qm?=
 =?us-ascii?Q?U5AF8BsKPFrlXQUntwI6lWjhLPxO78W3Q+cgco3GAA2sflE5jCwSfdzFSmi+?=
 =?us-ascii?Q?MMffAUykpH4nqjg+fNFtxNU8UDdsjnnBSHnbH3dQEzSTHe7Nt38X43S02WFL?=
 =?us-ascii?Q?Vf8tKS5XIG7IY5woV6o+McRambJDJ+LCn3dcVTH4HGejx2jR0i83P0iraqa/?=
 =?us-ascii?Q?A5dVi5JP5KcjNQ3dQWR/h5nthEC1JjPEem/UT4keXjytLLpw7Kvz1uj5seSV?=
 =?us-ascii?Q?2kmbDhgb6IYz57o=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 08:01:54.8401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a51976-dc5e-48fb-a6b3-08dd36040b0a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6721

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
index 9d237852d3e0..f6e8938c936b 100644
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
@@ -7353,6 +7413,29 @@ static int __init mlxplat_dmi_smart_switch_matched(const struct dmi_system_id *d
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
@@ -7453,6 +7536,20 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
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

