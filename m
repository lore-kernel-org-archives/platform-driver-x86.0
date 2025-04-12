Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F3518CC13
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Apr 2025 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744449664; cv=fail; b=TwcFs+xAoNc26q8mqc40yPEGh6uniW3tr9C309eVSJVhaMEzl9S8nf9Fnw73iuxwe8jT2sfzrHfIESqiPd700vLitOh/t0dw37Vc9/nTPTlI+bCvSyQKsyf6Y5SFasbnTSl6PB2wruOIAR67VEvrtrmLZnTXlvWOxQKkFF+u41A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744449664; c=relaxed/simple;
	bh=k1foDBuHH1XFTxiOIh5iMjTNuDuqE1M8HP0HynB6RjE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYgDkzJgbPM5dy2Ig8LaBfMTkMfv5cC5DPlPxaI+Wwh0Zlx8jH1P5B6ly8w/+uBrxl/0+6o5anVjbyP/ZaYmfsdnJ180UtVUp+F+GBeEYYZX7D9Dt6Q85AC8uGNTbEeo3eA41YzcWyI1UE3sFsW8lq1uOvVidJ+QxTy9pnRoUnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RcPkMjsJ; arc=fail smtp.client-ip=40.107.223.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RcPkMjsJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jaxtGMd2YwzwFQYTKL1d8I1cA2pP/zW/QP64djx6vdMwEahXUEJxUL5OCmwozL8nOkVb/zSmoTXMOL0nJKsaof/7J4v5Y43WI6jhfzzgZmjscp9D/xo4c0bAF1SU1bsiaHlLC4XJwRcb+8CtY7pmYV7SGqO5BjZmwfvPcXwymJ3A3XXYGO7atxgH/yPkerruwHuPH3g1FDLdq7S2XVACbyNTSNLZVXkfKiPT6ubhF4bZ5THW9zbE+3Y6mh9wHu3KhvwesSAbj+g5XnjzCX05uFL6pMaoAiZjJpkPW7HnDZHEQTMukq8Q48unqJP81gC8a1l3YyccAkY7SKaZ1evNSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KV2RPqm2Olux0gRFt2y7J8hcBaMUQOzxl3W/SeFmjzE=;
 b=nWHOU2oW+HNXnkkb8FT0kO3Jl9YsH5VkNuONh2l5cswCHZzyz5KBTpt0A4uajuNL1+Ub+bow9v430dyExx0PpwG5JVFfwLgKmcRNJ69uz2r7/HzhL0NXTdu3G5t0w3g/1z+z2FLhjYdnoPJDf87Ocwll5xTXHEUOY9x4ALp26XkREgkhjdYAmxtOYqvkU83kOaH7jfAEM5yX4Wzjd9BPFs1lBgAFZeS1uDUeIWJULCJKdBoOfDZ71XECm8V/N04Ohk4hp/Kjkjw/2OrQhZltocETTWlf24w/NjzqqP56ivDWdczjzAJVJo/2PSxV8aAcUAXHT39e8GRwls9LQYEwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KV2RPqm2Olux0gRFt2y7J8hcBaMUQOzxl3W/SeFmjzE=;
 b=RcPkMjsJ1DkCKOApIwBdmMeH/cZJKAiRxauXaAcERd7WPhpixWO+DHOtlYWY36r4t4m22YtsmCP7mcfmstKhPke0gmhU4ojPQIuBM77irDSU8OGz2wMJsxRgtD079pMcgZELqhMmQsoN8PrIhOJgHyOgQ5viRNyAd2JGDywKoF71W3oc9ioFBTs0tUnAsj7rK3mOznYWbVj1I/s0+1dtbx7S5XlSr2zOh15dE3haV7VX4IpXnl0KK1zabdP1oMxVrwkwzL9tcf8dEYE1Hgv3MGY3g0l6ciDeqIQhyZ6rL8Q6hSPE+tmS395WTVYCfoUp3KKCLwxm4ZTau7E+XlXE5g==
Received: from BN0PR02CA0058.namprd02.prod.outlook.com (2603:10b6:408:e5::33)
 by CY1PR12MB9652.namprd12.prod.outlook.com (2603:10b6:930:106::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Sat, 12 Apr
 2025 09:20:58 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::df) by BN0PR02CA0058.outlook.office365.com
 (2603:10b6:408:e5::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.30 via Frontend Transport; Sat,
 12 Apr 2025 09:20:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 12 Apr 2025 09:20:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 12 Apr
 2025 02:20:49 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 12 Apr 2025 02:20:47 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v8 5/7] platform: mellanox: mlx-platform: Add support for new Nvidia system
Date: Sat, 12 Apr 2025 12:18:41 +0300
Message-ID: <20250412091843.33943-6-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CY1PR12MB9652:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7d622a-ffec-41a0-33d9-08dd79a355a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vqGS3FdXgamOnps18LwqcWKmnbLvfiISjnqiyF1yxSeIVw6hZ6jc9i7Oyzle?=
 =?us-ascii?Q?Ps42aNCAUBCL+XstiH339eFjobmxXzzMoi0fJH4Ve+NJhDuq4TB39028DrER?=
 =?us-ascii?Q?fQxDyrlOeMyScAOV2U5vjr60bIUZptXLWGakEYo8qH0/tQw6e99zikUszUxh?=
 =?us-ascii?Q?Sm4XdGNDsHIrtjcRMdEWEZOnrHKM4WUNudZWc6se1VJoipBPqVX/Lkh+EEzH?=
 =?us-ascii?Q?lFN10gph0aJ8njKxh9lc9P2J/alxxShZUiKGbu7AUL1c/uS4y1LL1TQQSvmI?=
 =?us-ascii?Q?HFePo3/JoXUh8bQEnrvfQdZVBAoj0OjTIiGpLoSbdJZNn17GiCoHjDvVZ7N9?=
 =?us-ascii?Q?BhrxU9k5gyo/jl1iU8dQ2FNu0RVn7yC4Zx+uwjhwTY6uTcYH9rJ3fMJeOIq3?=
 =?us-ascii?Q?4x+VZ2c6xfgH6hTqFTtqc8E1G2rzSUu3b7vHoYsSk3vxlbwxp6iA3vrZcVZ0?=
 =?us-ascii?Q?xD+02JQoOP3hTt7pU3WJDAJgrivfbvqzgk2BdILP7QUm0qP5DOEcygs2Zmuj?=
 =?us-ascii?Q?QsZqRzHMSr6Ntodad7xGh9s5cupAJG7KP8sYRLU5jIpOeeL1LVi+zIm9pIwr?=
 =?us-ascii?Q?Z0N+vMLKdCJOOfF+sS06XV13I2nDXgSrHb3OpAZoQwqXyk/Vsdtnj97DsM/J?=
 =?us-ascii?Q?Uq7HH0e33OhyFNiqmirsYcL3rJoYB7gKH3Ofzf9WYHpo2XdzCWTFtHFcjMcK?=
 =?us-ascii?Q?c9NFcAPAO7gnr/+m7dbCPOWTnE7bZQb5138H+tI2RQNZxNdQCMOJ3wSVFMfD?=
 =?us-ascii?Q?nsGhxd0DyT0SoAnOmnFPIirl3bFgNJcT1aeFtnzdDrEQ4/K6a2UxEO5xj5bx?=
 =?us-ascii?Q?DNmD3ygBu1Rn43dy9kCi4t5XBHxezjbT7mrfZNw921H+2gMxBe+wL1BMu2er?=
 =?us-ascii?Q?Wf8KEAMZzngeCDOjotnXK7ISfXVBw75uyx7XXTvfoR/OOZnZusMmeaQROZ7C?=
 =?us-ascii?Q?yv/Q5Lm6kbT2trDctpD7feTopSIbz8O0YDrS5fWlPyCFW4R4/y4No62Xzd7r?=
 =?us-ascii?Q?c9YY+nZ2aAY8Nel2jIDRtOpd5dqKmQwvf6A+wSF8+DPixULNKEZyy/W2Toyb?=
 =?us-ascii?Q?HCTNLb1nBfQCWGiXXyPCSR3AI1UTVUjxP7Sg2CEe85/iZj0I5zofTnFqvq9B?=
 =?us-ascii?Q?UqA3sNcZK+ROV0+ElpP6DJngwhT3NRBsnGo4d5X7KPRl15PtY+FcL1ifQpGp?=
 =?us-ascii?Q?GMrgMLHBwHDJ9kaHWIK+uyl2ggTD1oe/mRBPZoF0j7oYvv217IkTURuMKBFw?=
 =?us-ascii?Q?LJUD3yi1D/w/bIngl6uxIsf3Ycd725KoK/GXEVDLhr79SH/36SIbCqbDfbtR?=
 =?us-ascii?Q?ph7qVkbGDfFaUyjqGZjYEY6At7KUTLc3vKIPrGWiYE5LgiEJ0LsrtidwHVZQ?=
 =?us-ascii?Q?z25lat3igu/v5hPcvGhNST3HxAFpPLlDNwKpG4gHuZFZ79RM03O/OUgDEr1i?=
 =?us-ascii?Q?fQud6k8Cf7fuPK7QnD0/acG3cQV9jrxsnFx/3FSCicvb7UYUd3Bfp1263lvC?=
 =?us-ascii?Q?0dEI5vSA2eGa+naCyXynVJYpA5eiR7rQ3XLt?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 09:20:57.8320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7d622a-ffec-41a0-33d9-08dd79a355a8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9652

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
v6->v7
Changes added bt Vadim:
- Remove 'capability_mask' field.

v5->v6
Comments pointed out by Ilpo:
- Change 'int' to 'unsigned int' in mlxplat_dmi_ng400_hi171_matched().

v2->v3
Comments pointed out by Ilpo:
- Add empty lines for visibility in mlxplat_dmi_ng400_hi171_matched().
---
 drivers/platform/mellanox/mlx-platform.c | 96 ++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index 4c7ff22117a6..9b8b430070b6 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -3000,6 +3000,59 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_l1_switch_data = {
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
+	.count = ARRAY_SIZE(mlxplat_mlxcpld_ng800_hi171_items),
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,
+};
+
 /* Platform led default data */
 static struct mlxreg_core_data mlxplat_mlxcpld_default_led_data[] = {
 	{
@@ -4486,6 +4539,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
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
@@ -7312,6 +7371,29 @@ static int __init mlxplat_dmi_smart_switch_matched(const struct dmi_system_id *d
 	return mlxplat_register_platform_device();
 }
 
+static int __init mlxplat_dmi_ng400_hi171_matched(const struct dmi_system_id *dmi)
+{
+	unsigned int i;
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
@@ -7412,6 +7494,20 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
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

