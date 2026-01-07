Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB8833D6C5
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jan 2026 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795317; cv=fail; b=MiOWhzJSoEtJuPrRy25PxZM28zBcahs3JSphbc7QrcimNGzgnxe69LOSyirgavHzWh9+rnghndIhLNgGuC4Pd8g3+fDcKRQi+UQLSu2jqC9OYMClfE0MiLzG1Py/m3qZoKrKUpzjLJyzSxfMMN2+7XvjOAIipNkm6bu0rYBwzQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795317; c=relaxed/simple;
	bh=0TGFCxORAt4D7t/zw++JUoQEThT2u3Af91qwjFBzBQc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PRC7izK3Kikyj/IUVHCry1PtGW24hMQ45RgKYpDITxm9mG+P3La9d5YxgA8BHoiZRxfUgXcZHJlOrLZ8djrCoYoDD8OnqmWUNPU857L4iokTYBC1ctwMtQFJseeUcdI+3J1gzJnh+zfHvinXEIKbzNrb9UmPkywyz03Hd14kEyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eMSVTILq; arc=fail smtp.client-ip=52.101.48.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eMSVTILq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpUaLrfeoTlkw8s0ycxOhacBklYZqX5fLebIKh6zq072BtY7TMnrHugFvUF/BdO1oz3y3gJszugdxjeVW0MA/cV+NU855q+FAaQoCuDjLxMhomBmofiazcbjMROBTmQxYnkjKhg0WtWXQ2MkXcbIpY9d3SAtV1D+ZeVrWUAn07MhELUpaPoH+0ZQbLWj+DvurdWFht4E9b8tKMJ7XLd4MBn0JwqGdziICq8jMppAD3A7nlfwRqXZwAZbRJboAK8JALklI5db75A8VKeQ/jUC13m4O4Q7D2/cOJEJdCZ+6Pc4FFobf6kSogXtqFFZijIqpRoXYHBN/OiC8Q/9CQHGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7lVJjZmyMPeUFWralEiXs7kFbfKVTctSXdiTh+kP+E=;
 b=l7GsGqHQ4R1krSj3OQuAZcOJfGxXezvr7o3Hf9NfD8yw6ZUnX6pTRWXRO2bHE7zlGh3k2bP0y9uKH/arl/4Vj/T3s3/JISbD7lzICFTGSx8fdCf4QBH1zJY42I21IyAIJDbCJjJbrfFbUhueI5Gnq49jOWoLjOtCgEzB7Wqwa87KwQh3mD0/LxAL1ZvCBVCwIW/jFOiYjTj7lTnGjsZRgB/7ScCN+sA3GPnz9qkfBddeETga/56luOPgx6GFGQqw2I7UrSgD8+hMe60wZbBMzrgm2QaOu5AYfnQjmvnW8xqRLT9ua7DdzLdeYkHietXm/BAhleAwUsHf9pZxGVOogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7lVJjZmyMPeUFWralEiXs7kFbfKVTctSXdiTh+kP+E=;
 b=eMSVTILqp3mZwrcfsNLOcpF0ZqXTDCA+ISrQnpkcKSu39vfsJZPGs87fgyUcdIDMRSTmJAwOIqmEhL9viYHaHGTmUuh2ckXDkIys5oUOZ3xGNL4BVYcHUH7/iPcxNx/uZzpxbVzquvREjMcwyce6tBHEyoVaX6tN9Hnonf59kl08QrfV1EyB4of/yNTGFspsNb89WQS0Jx6z9ilCUNd9x7HVfgwOybQqGHUkPRVsYeKJYnLYjj6LYw3g3AD7pf6eZQd8WBYXvgTcTsjPF+X3BAghz0ouD3kKcqESKUrlEobUrs00/25XNhAwRpGTlCnYu9o+1VqLhSMcxRK48bQinA==
Received: from BN9PR03CA0305.namprd03.prod.outlook.com (2603:10b6:408:112::10)
 by IA1PR12MB9532.namprd12.prod.outlook.com (2603:10b6:208:595::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 14:15:10 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:112:cafe::4b) by BN9PR03CA0305.outlook.office365.com
 (2603:10b6:408:112::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed, 7
 Jan 2026 14:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 14:15:07 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:14:50 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 06:14:50 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 06:14:48 -0800
From: Oleksandr Shamray <oleksandrs@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Oleksandr
 Shamray" <oleksandrs@nvidia.com>
Subject: [PATCH 2/2] platform: mellanox: mlx-platform: Add support DGX flavor of next-generation 800GB/s ethernet switch.
Date: Wed, 7 Jan 2026 16:14:16 +0200
Message-ID: <20260107141417.913935-3-oleksandrs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|IA1PR12MB9532:EE_
X-MS-Office365-Filtering-Correlation-Id: 056e19d9-3706-4c33-4e9f-08de4df7295a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WHqVfli3tJsabqqhaWVpkT4WN38h3Z+IjwVJmd68rpD11m0uIoP7RPTapgbx?=
 =?us-ascii?Q?p31THT6Mqi2npfZODieJpMOTopNjJcYoljyR4c0Fl4xK+fl1X33Gug5J7iTf?=
 =?us-ascii?Q?+3wKuNYrLjpw3lbnyI3toxeVZVN1fukKKkylp/aCBotb40O2jQ3Bk7wUSoWW?=
 =?us-ascii?Q?WUdIDBN7iheSZc06zjyCtfV0HzSZsuLcVbV3xzn4mHeZM0rFMS0BEx1G+idW?=
 =?us-ascii?Q?kHKDKoCNI4R9y9pRWmDLEg0hP6upshB/QY3HCT7z5mUFeJWsuKSILPdEVo9r?=
 =?us-ascii?Q?zbZweQTSrmBi79ml+L9qcooskypUHMiJ6F3jCa8pQxQqSoHqqF91xGFS4elx?=
 =?us-ascii?Q?CuTnxf7SLhAhGW/GdiQYmi7TFPsxRHUURHAil2dtJeyvGXVbb9pOfi/InN2b?=
 =?us-ascii?Q?hKrO7lsUJIFngA2dPfks7xTaGz+3d/NWJs4Szyw0YomkEuYn40Wnab6wNaSG?=
 =?us-ascii?Q?aebJPIvJBxAkPKmawMyPYeL9lIUeB7Xvy4iBK7yI3UDMhogJdErfWb1Pvli7?=
 =?us-ascii?Q?bxBn/Rl1pGRYM1C0dBWGTBXg6JhEmkQp6sljKd1if46MRW5CPj6DiM1wIBzP?=
 =?us-ascii?Q?z57S11NzVZwZjwuT+wA83KKIkYDkyvIAcg/XZjT447QpYVPbJyN4l4r1RbE3?=
 =?us-ascii?Q?Jg8FuEsSGpf/whhm3uC8E9Ht99ez6/qIEm/at+C1dl31X/YtX2SfxVxolx1e?=
 =?us-ascii?Q?oC9wGjm+4OfEene3QTbEqxfVPg869AtfmhEIQTINI+lnV6UIz4/hBcZ2lsjQ?=
 =?us-ascii?Q?wnDGxGBzTKmQXBur8BZ9ugRZmyHCw/30vByN9IUuKJEzOUopQ1Wpp+tT6wdr?=
 =?us-ascii?Q?3WBvy23pas8iCxAaVHFekDPQm1+jO7rYpfp0kpWV2y30vH+uHlJTW/nGohH6?=
 =?us-ascii?Q?h9sF1X+TtPG7ybt+8IzkskygIHyKYWNSjIXi9klIez9T1Pyle/ejF3oYEDqN?=
 =?us-ascii?Q?L0ngQkQTCQayEwdEJ5O3OklpjBQ/vFWbUiX/zZLlH1aE/EoKu5fTgTcsg9xc?=
 =?us-ascii?Q?CR9j7mPD42EWqtVnd8uznbUi9Az7yqEBEmtLxIBZ64jvjpqUiBfH4F0dK7FU?=
 =?us-ascii?Q?56h73yvUqLWTnaT2HyNJiZpZy8Ybhzl/8jYG3xt1JHW8sddWq+CpKP016WaJ?=
 =?us-ascii?Q?tzFAa8QAsjbWQj8kcN2AqETq0iH3G5fufx/uj4cJ9iO3quJ7QomoFI2VeagX?=
 =?us-ascii?Q?+wvqjUVqEcaQcRzZDKLNt/ogfLaZb+aq7rut8KV/zHx3n44Bt9ioAdQqIF8c?=
 =?us-ascii?Q?dsxQ6A662+SRvctOmFO11m/782knRsL63Q9UvU/YowATH0AUZkkuHjzNO2Sq?=
 =?us-ascii?Q?0iSKEfwwHcWWvZGOnpN5Z6pFmTxnKVIlZMZQIBhRJ1xGsDk35m2zlq5lddTp?=
 =?us-ascii?Q?LyOBIXoX7FyzoJRlRG9qj29xAdjOSt10udUTeimrqaxAbooX0kZi/i0JuAYM?=
 =?us-ascii?Q?cPDYOw2fFehOaEuEQC/yJ4Shnlm7kG4wyaT2+IrroC8OLXW0c2GdGWH0gHf2?=
 =?us-ascii?Q?Z4u4yNYVVaeau52zW0Ioy/hVbxWCJHfmkWcZdsidajj2WSZuD2NjQIZO6K2q?=
 =?us-ascii?Q?qaoZTWjjfWxFwJKIF8Q=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 14:15:07.7329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 056e19d9-3706-4c33-4e9f-08de4df7295a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9532

This system is based on Nvidia SN5600 Spectrum-4 Based 64x800Gb/s ETH Switch System, with the
following key changes:

Key changes:
- New Power Supply: AC/DC PSUs power replaced by rack busbar input power ORv3 DC 48V-54V.
- Dimensions MGX/DGX 1U compliance Tool-less top cover

Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index 14b3adf870e7..b117c04379cd 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -7770,6 +7770,27 @@ static int __init mlxplat_dmi_ng800_matched(const struct dmi_system_id *dmi)
 	return mlxplat_register_platform_device();
 }
 
+static int __init mlxplat_dmi_ng800_dgx_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_ng800_mux_data);
+	mlxplat_mux_data = mlxplat_ng800_mux_data;
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
 static int __init mlxplat_dmi_l1_switch_matched(const struct dmi_system_id *dmi)
 {
 	int i;
@@ -7924,6 +7945,13 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "VMOD0011"),
 		},
 	},
+	{
+		.callback = mlxplat_dmi_ng800_dgx_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0013"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI174"),
+		},
+	},
 	{
 		.callback = mlxplat_dmi_ng800_matched,
 		.matches = {
-- 
2.47.3

