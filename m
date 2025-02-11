Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2088.outbound.protection.outlook.com [40.107.102.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591F71F12ED
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265715; cv=fail; b=iDZTQ+c3495UHvGgpijK1+zQBfxkv89QE9oVoz5xuPRaLkqz62tzFbHLqHIlDrQDwMz1FNNSDpRuG+wo0umsLIr2y/2Df6pthibUqbVI4+SSwDE8jfYR2q3ezFVxnarHtu3c9ctnxHB81j3gw+Lu1SS3gCUo6dw0FVxf8SXZ5nM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265715; c=relaxed/simple;
	bh=07OpRErcIqFt7AqWZmcsfGO20S+2T4Kxvs5U77w6n6Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UJ5x1Y8q1mqcWP+deSv+44KsTcJ+katGG7v92zp5sdIT9OpVAA4R78Q7S8MlYrKPg/yuIJNHlYsMHPLLlPUc7m//s6IDwZc4ddmFLV2LpNXicHMIvtbU9M4Oe4VqDdjFhD3H3tfQjIs45M6JmwOS/Not1QtwT7dXBvW2Bjw6MZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JDvNpkr/; arc=fail smtp.client-ip=40.107.102.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JDvNpkr/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcar4dbkviHLzDriyJrwRPrNwH2PT8rNO8WKD1U1hwOt0kkmr6WXQ4cRcIe3ZGgAsiGR9aBwuHEzwB/Z0ngqJm8cTmyCYwAuemj8+jldXKYUmn+P3LSb5FwF3UFq6nf5QLcK8pPyImIUjMiSwZwTZLZ8MKYAUnKG0Wlb3fV2NnuMfhJb2IhIpjmKZ+q3twMXmCdaR/BqOOPtJkeOf+mi3wo0J54xzVEb5XG8t4I4D67g2AtR6lxbaFAWyK8xzlalf4Ws1hPJAL38lVqargVuw38sfTJ/Bss1pkWg7KykgtO7DQqmujeiy5KsIdoP9gZMB2BndOqMhq0MlOLp7uDjzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsUp4Xv6LTafStifuvHnbahNmKWp/cLpuZqfEpCHy98=;
 b=MjEdFQgjMzst1BPWyf/zI1+Sw4acHE+YSygUwCr9PKCMIhbf22a+nfq1Rdjm4igr3PXiavxE4dyK2vGKgCfJRjT8ORu//ILXo84kNPj689sQMTPW9WwKnito9RB2fzEC2uMVmO40HmZNFj0gku9omWItuafRD7Hc1CdGmzZByr6vmsCAnBDjrdLK1+CGzBDVKV1jDCddvQyula39AYErunQ7sRgCxqW0QCvwl23AuqFEJLoqrV267ORDBrBwsMINdycqOeMwSGhhG4BAudAuENZfMxUBv9N/p3oFin3VlAj+HzMn+liz8ktFA8Hq3MNWFO8V5Me/igLIXEluuB8E8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsUp4Xv6LTafStifuvHnbahNmKWp/cLpuZqfEpCHy98=;
 b=JDvNpkr/ZmAIqRY8KlhvI9E3ooNrSxxl8AL3qL0fPHnT1XdtlL6o50Ar6Di3GhCmBRc31kFo7f8tU4HrYqoKZqjYFU3Nqbibzy103Vwn/3QyGqlvFYJ66lUynM8zeUP2/L5zOnjAOTCN4SoLbmwLyuubGVsrzNE7vY6edr0Fpdlrf2nXnrw+3pickJwsZy2MnS5pkU64Yg9zCgAB8MgIPN/A13bH0fHkhxTsKa701K0rBBF+nkfNymwvjf1nTByZrvjrIAtdvtbBOj8a1CMtkg1u0RxmUUuiaoGRiFo7YkBQO0YkSj0qfgYKDYryf5v1It1HlnU+yH59nflIpZJ4/w==
Received: from CH5P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::11)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 09:21:47 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::99) by CH5P220CA0009.outlook.office365.com
 (2603:10b6:610:1ef::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.11 via Frontend Transport; Tue,
 11 Feb 2025 09:21:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 09:21:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Feb
 2025 01:21:36 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Feb 2025 01:21:33 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v6 7/9] platform: mellanox: mlx-platform: Add support for new Nvidia system
Date: Tue, 11 Feb 2025 11:19:10 +0200
Message-ID: <20250211091912.36787-8-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250211091912.36787-1-vadimp@nvidia.com>
References: <20250211091912.36787-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: c20ceaf3-5117-44b0-3c51-08dd4a7d826b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1ORLEVcTpEGiyj6HIeeZcj+RxAbqBkZRp1226KqK9VPAYPTuM6kFvEXexnsY?=
 =?us-ascii?Q?ShDUMxyGjfwOz9ApbrcVdIIJ6brBxvSV47jW3PMc7GVnwCYDTLGJTWWwTdHP?=
 =?us-ascii?Q?pMrRuQJQJ4ziESqApmB8LLXM2SaGKZYS1d7TvaLSXvqUWtcCTzceV63e0h85?=
 =?us-ascii?Q?aKj4EnWS2SD+kfzBR3IDWk8TbQGgBgWIx/1fpgovDfwldtHoED04DTMT+seJ?=
 =?us-ascii?Q?D1U1sQmfezd2CsKge1lf3p5uCK05hVLtAKoUhig0FwanzcWCEB0MNhA5q1qp?=
 =?us-ascii?Q?lDJ9tEw8wZ7B/kRSNVLx7tQXtT73T5FK1QT99ULfL+waSCFJyEY72/8wHRGA?=
 =?us-ascii?Q?O7QJZSOMhLv8iNDVaazUxOUtQ49rmExtwqmU2BA7CsaY+SLqUCGEgFgAmZVl?=
 =?us-ascii?Q?Qx/FG/DT+KfU8lwjpmAQ+GpPdiDqnk4if2yZqRiXFI8TQvMqJf52RHvM2qwz?=
 =?us-ascii?Q?M5+YXvE5cFjNx3w6oFxFI7BhRFurpqScmozPo1FLac+rdxrVF1rjOl0TiBvi?=
 =?us-ascii?Q?UecmK7PdlpWKh2lsI7qyjn3FOb89V81f6C/DRkWiKy0za214LOMU3AGyezOn?=
 =?us-ascii?Q?D3/GSH0YiGeAMz8TuZWRtYChW2uVtrZk99SIvysZRleNsW0rZujMFCl8tBG5?=
 =?us-ascii?Q?+bBeBneBvFBjOeLfUmgeksBL9xJMb83BQ30XIJ6NAkeoaTO1vV8caf/UChk2?=
 =?us-ascii?Q?sEWTJ0aVOFzeY8Q5wOM5wmZPSLiILkq3c67+aZwikwOGWJM2cMbrCrZMCxqG?=
 =?us-ascii?Q?0UqysW2GQIr7MO605Cl6tJTtVbm9D0jWVVJ76ZMxVVmAE2dG4b2ghGqcJwEh?=
 =?us-ascii?Q?jJNlj+W3sWpgeMc2Gs+7i3AiulkU05dfrwYSlhCTX4qk0hG+ktIQIssUP6rg?=
 =?us-ascii?Q?4FdRp62+ebTv7Q2OzpCXvXoOBW6vlc55DQVtMmMIvNuuA+8wOqLWOb/xAmne?=
 =?us-ascii?Q?RPw+cdrKgFd/GJ4zbF5gKVCjsBnuFfVk+XJFa7vpX2Tp/sxbkkGD4qDRlL+R?=
 =?us-ascii?Q?OnUoP/kE3JibH/f4ldmYV/GDvYDLleb3lftIimw01QWFJcXAekRI1ZehWfDM?=
 =?us-ascii?Q?MPwNmPChwWSnVty4HTVVjIjciH7EK0D2SZQc0UWRLeARaAtI0B+oIVl/HYDV?=
 =?us-ascii?Q?RWb9VmAEvgosiFsdSdBiuPcCzc6+7X5mc9zuKYxnhb3A8Xz3FcvoJbKqTejD?=
 =?us-ascii?Q?60/Mxwcjvi64MRD37EZ2+NILUP216BD3HAqvNrkUuPcbENIwkCw5r33JMxTZ?=
 =?us-ascii?Q?xHlFiD90HsPssmZqX2OBSviUSytho+jtMTMrvyJK9k+jgdXutm30PZvcxSi+?=
 =?us-ascii?Q?FVT4JMBVfKN/Grb3eCb+M52A7u5/6hoqj8j+XJBhPbhsPybqhJt0srJId9bR?=
 =?us-ascii?Q?rKpSR+hGRz7ekD5P/3+P0m2Qa+XtCnfweeSp8FwNS/ExCKqH7gmmCMxZx7HO?=
 =?us-ascii?Q?0RaPaw1uoS8TV4jizm/fpVjKC3vhBJLdF2khN90TPERFuNI4lls/MuK4tmLa?=
 =?us-ascii?Q?va0V30uRIa4TexE=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:21:47.4974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c20ceaf3-5117-44b0-3c51-08dd4a7d826b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

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
v5->v6
Comments pointed out by Ilpo:
- Change 'int' to 'unsigned int' in mlxplat_dmi_ng400_hi171_matched().

v2->v3
Comments pointed out by Ilpo:
- Add empty lines for visibility in mlxplat_dmi_ng400_hi171_matched().
---
 drivers/platform/mellanox/mlx-platform.c | 97 ++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index bb50db717baf..1d91143f40a5 100644
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
@@ -7354,6 +7414,29 @@ static int __init mlxplat_dmi_smart_switch_matched(const struct dmi_system_id *d
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
@@ -7454,6 +7537,20 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
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

