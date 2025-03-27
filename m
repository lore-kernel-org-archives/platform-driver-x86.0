Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED121F1911
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093686; cv=fail; b=dJNUlkMG07K12vu4cAw/TI0wL3mmCYDG4nQgI2Vgv7jVdKIpk0XLkncX6DSTWfmQrFLzO7705839Dgkr76pM1SG804FcYzjHwin6lAs/Q+LCJzkDBpQ9YXLRMV+Tnn4iSsSPMCc8pnc7VGDvRgQTNB10BQE78Kzsll0HVJIamL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093686; c=relaxed/simple;
	bh=k1foDBuHH1XFTxiOIh5iMjTNuDuqE1M8HP0HynB6RjE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syVvhXHQac4H/qqlA0lZwPr/zJkFx32eng71uLi9BtFTUgj+bT5COInNjrPU3x4dacibcG0EmV6L9cn9mtg09zOHbEqM++lKjnuv5BKeewNl80Zr9CHfRIJBFxkssX/KNtsIDgGMZmKPKNIVByAD5CluNi/t3LnhbMeIWjmvw9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JbOy4fbl; arc=fail smtp.client-ip=40.107.244.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JbOy4fbl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RX+u1MfdrhLdiKJgIrd5V2aj2U6bSuGCOp/WsSVRcMIZMHZQVvAxXTf8Qosmv2R1SNZ1zBHMkrP6LpPtIckj92ZMZ45SFLGzd/HZMZXSbgflbxhXjG+ZAKLWl5d7BHTb8+UlOfxp2BiHdAjsVyOMZzCqNeCOyCcaQSZXzB80KOeQ6dKI2xfaSuYZkI9B53sxfM2MSAPYppGZ2EnoAtSQjharOBRcS1hNo5e2SlwnFN2UsYdtn6ofyv4ne+9+Bq3+uDSwGcQ5QuN+Vmpd0sDA7nEiZz68ebM6tcMTrFCA1ddNHT8JgpmitAwDaGsuH+g6I3qA+21WqFF+uj8OZL+vmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KV2RPqm2Olux0gRFt2y7J8hcBaMUQOzxl3W/SeFmjzE=;
 b=ylgwOwiVqKSlWBH3j7R8NkXXU7byq/koGzDVcRBhHhUkDc9QNqXREAhi9EpmZED0N1WGy2bXNmkr9BJ5MW7VOmSlD3sxQQg1eiky7OXCtIDSThMDORX+nhkhPAa6zZGn4HpX+KwOFOTyYDDrkCSQHB4TJiC+Z0Tco8jDOgQH21xoB/0QRGwLF8nYrI0vUPJz639exSrsW7JGZV1bdX36H2L+KaeauXCG3Q04inyOtAKvVbqTVXrZDp1/IoDid4XgdyzfMMtNBoX6g7jeCDEtjovgOgXioIf0QbL//o3oJJe9knoE0Lu7YhAO2MN3b3Qpp+IxICcHNZZ9nOGIQIuD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KV2RPqm2Olux0gRFt2y7J8hcBaMUQOzxl3W/SeFmjzE=;
 b=JbOy4fblM9ZFisOKeNSzJ3XVGve7EnmX2dVahAv0npRT9wciVqiJFpJmATWQd3GtBo4+0A/MvWrarpQXgjwlp7lasm5DtoQYDmAdPLMEOy2T7FLxRkdq74/ZpSpVHDWhgaJQHXenq+66YzJPguCwyRMfV73gnjpVjW1MQ4/ZYGHyuBUkNeoxCIwJIKoWnqwup//dHJrYZJHZJ/50kJ71nVwQoEEzNomjs43L28ckWj/pE/DlxHvbFbHlDmfXiPVf5Q9DPB84GH+bJhwUzEgT7Cw1DWjJcaGvqGPBH6zTcYUsy2JGLoexQlhP2p6XCoS3P4EMARHK4euLPl0mnUCucw==
Received: from SA9PR10CA0014.namprd10.prod.outlook.com (2603:10b6:806:a7::19)
 by PH0PR12MB5630.namprd12.prod.outlook.com (2603:10b6:510:146::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:41:20 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:806:a7:cafe::1c) by SA9PR10CA0014.outlook.office365.com
 (2603:10b6:806:a7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 16:41:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 16:41:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Mar
 2025 09:41:07 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 09:41:05 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v7 6/8] platform: mellanox: mlx-platform: Add support for new Nvidia system
Date: Thu, 27 Mar 2025 18:38:53 +0200
Message-ID: <20250327163855.48294-7-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|PH0PR12MB5630:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad86b29-5a85-4eb0-ae7e-08dd6d4e33bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dNX/+FDXpQ3pGWNvSNOlnEMun8MMMrPNmWuFuWlWrBEhLaE5yOLU2I3llhXG?=
 =?us-ascii?Q?NHa1wkGgU9c7Ll/7UlQzrUXaUKerfopP89WST180XOB87gShkCrBBeWW/N9r?=
 =?us-ascii?Q?PkYu64B3CDNJzQx5loNPLfGjDiV1jBICol82vEmXBJzpAtZQyu1OIn8OUGTN?=
 =?us-ascii?Q?Ra1ZUxInk/KexmZ/gCb0mH/soPHGzNkdg0tkTrfx4KM5atdTB0hhhiBMav0s?=
 =?us-ascii?Q?PFM63qZ4Sz3MlH2FfoXxJcyyPiWgYb7VPMk+mHyZaAoIDhQXdyo/SGzNNZKv?=
 =?us-ascii?Q?RH8gH3rkSAfElHcSuz+p1KxGIsZXphaK36J4rT4doCYw3IKEQ2uNLrnCpFSx?=
 =?us-ascii?Q?lJDxRiXj/E+2OwMPEEgSKkl/5SJ8LcYkwSdooX4Tk6ao85CRkvh64TPL4Vnq?=
 =?us-ascii?Q?OeowBsSGbRX/M2FvYxNdyhuwV2zuEFF48nOw8e4tv4qTikvAGLuZy+4Bt/Gt?=
 =?us-ascii?Q?+s2f9pnXzAXNZkAW0zJkdXL6AME5PYbZaS/iMRjc1w2iDfdZDlmkQKzW8lTE?=
 =?us-ascii?Q?xsLH/oVd2Djg9FZN296W/rP7JApfPgnvzPKRKO6261Q+E6tZXmrrg2fnS5zD?=
 =?us-ascii?Q?WjbqIIuOI1aM/W7A+VX4OksgEpuENAHAK8Vkiir2S0cdV1+Y7U+mFaN8Sv9J?=
 =?us-ascii?Q?gpbo1TXNCugb7kItTpYWucDbc3TXqBAQRHLrO821HLDS8wHRB19FBXMAvM+k?=
 =?us-ascii?Q?IyZSS3WqVxxzrO0JUcSEjtUm78JxM/mELaLrGyLI3jiimsA2Xjtks0YuYXAT?=
 =?us-ascii?Q?ZE358OuarqMJEtm1c4v59/REVBmciyHA/CELh9LhWUXytLnwfQ64iHqoTHw0?=
 =?us-ascii?Q?pr1j9gXehtvxhS9gpnPTvdVS7CgfcVlTHL/OwOLUuZO5KdmY7vaah0sqeWd+?=
 =?us-ascii?Q?2o71K8tvjdOaITtm980pvD1Vy5FAVRv/bpAdnpsBlnQzK9J0e0lztVgZFi3U?=
 =?us-ascii?Q?405MXYN9yRjY+2Tp+vmmBBldwu0xkpGTWtb9oNEOufdsSn5pPxkRvi0URJpt?=
 =?us-ascii?Q?d6z4A4thE9LKEaWDSB/VH5DHwVwEKdlPoQmmXR3zdsdLZB8RUYCPx4BtjMFv?=
 =?us-ascii?Q?q0w0ilKtnINS0/XrLx+VwUMHBOVAztFmViE+tbCoGuN+ZwP0oovOPU3WRJpX?=
 =?us-ascii?Q?Z68geTLy07hgMZxOt42Rq4UQ9O70lS3rnQnlD16bcZ6kgr5Ef1aIpHUpQV0/?=
 =?us-ascii?Q?W4xoFJl9LL/N3gDJ4CcDslScKfQ9WlswBUz/l9LYYuVq2apuFOVOOriVgu1J?=
 =?us-ascii?Q?pP++ic4vogIw9+N7qSWxllpzAR+9l7nlwH83DDNtto3+Lzmfl2C4jOBePWVh?=
 =?us-ascii?Q?VwbxRVAExKt50M8Y5eRrd1c+QZBfTjQ8K0hxN7StDr8EWGgLHPcagKnO4YB0?=
 =?us-ascii?Q?QBr6IMAFVbDoVs68wUSCSnd7dGSUE1QGlbY4DqU4hie7iK+f24xqjkeWSzkg?=
 =?us-ascii?Q?h8nZHlvOtSz8oMwttrhjOWlW12rkba96+UVxQ97xaigtS1xZU1JnbHoq2OH/?=
 =?us-ascii?Q?rJLDyVDHM1AhYNs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:41:19.7886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad86b29-5a85-4eb0-ae7e-08dd6d4e33bb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5630

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

