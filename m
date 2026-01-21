Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010021.outbound.protection.outlook.com [52.101.46.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F3D421EE5
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007174; cv=fail; b=A9YzI5jeMtWB7IWiyEJj40FVBxuUFFwTKjhno4miNirK/ivS5Z8Pw+9s3nRlxYYKXbIJP0a5Kw5BnLcksvIeUEO8fSPYC904LoCnYwQUYP+RvXoWkvtoS6B7PyGXdNn1ly1uwqkcCFcnc70tDUtO/CYtoYOrb5baNYW01b0842Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007174; c=relaxed/simple;
	bh=0YXPh4UF6/Ldk7jTc8ZvAuxjzON/022VqE9jcYIYHrY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XtGlkS6zXfeweuk3GHPvxC69roL+geQ9xB5Jwh27EeCBC2xo00JJVhbtUFh2u9SBWPXuUBGBR+SdMP8t/1B01m3x6ztgvkKvZmYYS05kKHAuA+37JkfNbWsfyKgsqkp+6Fa2DmCqgmgMTaHmqw3X6pb1yC2wzZQR+7i8emPf49I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fsx2SVfj; arc=fail smtp.client-ip=52.101.46.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fsx2SVfj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDYPPvr2owlXLCT++0Ig82AsQS4tHF3BPEiRnU0t3K0AkY0h+ji/tKw784fds2uTNniOw73DMQNBsgecJX6HxBrB3t8aVZz5FKfFd+AoCh6+w7owx+8t/IiQful78IZf8Tj5ZUXiERiVbjCm+k1aum8w/ICeQ7lnQBjRu54nGEKzN1w5oaxzJKOjq4bIPgG2+QGDbnK0FsGPSEw215p0P/Nd7rjUZVzIK6f2xHrJlN4o3BXr4Q5mp5NpRdHFYKDEmRQPdlux8hqAQJcdguJfk13/2B8nAGUgZDHAMaUf7KdvfncnQs0OE8ULFqaM8ri8vtvxrwJOuZ7NgyCZeqo60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWq8k3zF3vPzvM1V87c47nPLRw324/F3JjMQ5g8i9nc=;
 b=mBIQPCmAIWsYazlD5V2yqtrMaNRGilQYuDYQTQg41BYqVZYRq+PhBOoMbN6LBmyTKAcBuTUifXeM0IqnFEeAyvWLSVJ5xilZ5VWyUJkaGrCQtfqzY3h24djzM9c8Uxdp2bxwVHDMZA8/8/0VtrxWtz+h9oMFu72DVSz9xyTe6Q3/MeTlaUkhupBAFEO+dlsqxUKyBqdbAs9MKXRcwHCEXxv7AX3+zPzfZPpkfOU0V1Yu9nByi/cgJeBR42XGzE9E+ntzmz1piAWT0HtvPPO5WPj12RN/VK/IKU48hiBTWMHriVLZHn41+bg9ImgMK2s7JykF10SQafUe5AYRnqHBGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWq8k3zF3vPzvM1V87c47nPLRw324/F3JjMQ5g8i9nc=;
 b=fsx2SVfjE/qHsmfMAZJ9+IWjRcoMi44Kg/AkFkrEGsIs3+Aq5SiaX0J2Xnx9MwP8Y1ZmzNJR8dc0+qmKGRLnUhp+Owd70zIR+9DrfSLOr1BmcQFAlOApTtbJcotKOUi9AWUoRqa7UeNgFn/xUo/qncuJWZbeleqDWlpAdBFtSeQ5MuC0zfA11jZPqBwNrtrHgK9Udmbz+L2P/U00Rmz1C4A6IDId08YYFor3Hs1EVQep8KuIZT2gLSOkVJDhqbAgA6S6lxzbp8hh1Twyju5iYam3wlumF8xD3pq5g+XSsW3EQ+OeZ4xGJ35020PJmNa4uPmZT2SfhxKFU+8EluXO0Q==
Received: from BN0PR02CA0055.namprd02.prod.outlook.com (2603:10b6:408:e5::30)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 14:52:49 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::2e) by BN0PR02CA0055.outlook.office365.com
 (2603:10b6:408:e5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 14:52:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 14:52:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:52:28 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:52:27 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 06:52:26 -0800
From: Oleksandr Shamray <oleksandrs@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Oleksandr
 Shamray" <oleksandrs@nvidia.com>
Subject: [PATCH 2/2] platform: mellanox: mlx-platform: Add support DGX flavor of next-generation 800GB/s ethernet switch.
Date: Wed, 21 Jan 2026 16:52:14 +0200
Message-ID: <20260121145214.4021631-3-oleksandrs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|BY5PR12MB4180:EE_
X-MS-Office365-Filtering-Correlation-Id: 9903e555-d09e-45dd-06aa-08de58fcbed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A1XZZJojCi/mL78Xvd3l7K7WgFMF9viuIuP+MGSSlOvuT64OAVTwr7jBjlH/?=
 =?us-ascii?Q?BeYCcw9jdJ0AMVsxjpNiQlHmeRN+bby2TyB8hBZMpnS82J+ismszlpBMSONP?=
 =?us-ascii?Q?ROWa6dk7FnHH1MSAuIwL/76dJssTNHX1B++YLPuraStXKABNsJt4j18XXfIu?=
 =?us-ascii?Q?BpahtO2KPvMnybmo8wgp/6wlPpDsqibV7yVohhhoAeAjNfeyH8YMdURLM2FR?=
 =?us-ascii?Q?pNwUIXmEBBGTYzHrFmwLbDG2lyfolpOB0eXnhn+Uesm2yPBK5hF5IR4yayvu?=
 =?us-ascii?Q?TOQX0HiLh6s046u6yDEsBgpBRnXF+Bm3T5T+SNo/9UuB++eFZE3H3n0mvkqx?=
 =?us-ascii?Q?TXslp3PXD/BhCsZG0DXBTiZjoQOg6DuCidjP0viaxEJuYwOCQthIIMHbeXLh?=
 =?us-ascii?Q?0n+pgvC7jx0CdOPHMaBQkDx/MgxvEZsqSWwZ1hw6V50thJ3RJtpDOXXAYw1G?=
 =?us-ascii?Q?huOw5b13I566lQP4paVlK2Pxym5bDbpgdH+zyHR69PMgJ37TJAqRzNOckA4R?=
 =?us-ascii?Q?EhhDbaG+wmEOfXfDPOUbq3E57cdRYP82absT1EoKw0qB1YB97A43F1MDoyQu?=
 =?us-ascii?Q?f+bvK8eVCyTJghNgRFWYRDNHIT82+ilkxT2TDXwrd8B9BFdB58bZlQtRx5bx?=
 =?us-ascii?Q?5UYqQ13gNkutYIDxZ+w92UWIyng9D4WhFrPKSkvDqCkhUFtj0zH8Qrx1RTT7?=
 =?us-ascii?Q?meLQhRMseaq+gurulPg4FI9hWi0FHTjKk2PhwX4is1otjEl1xNEo8p8c3SfO?=
 =?us-ascii?Q?T5XHjlhtBbNNduBGbBvZATtKv6XkLaBs4nBNwvwiii5lAKjBkGzlmKNlf3qy?=
 =?us-ascii?Q?Zq2Q/OgdGOR3O0Z3+T9iIEQtOhABsTHA8+41ePo/J/WD3jUmKFZz9vRZ4+eF?=
 =?us-ascii?Q?M0L7sF0uur1b1Bn/LC+alsj8ALz7QuKzRIkd/UYOGFQoS+WUM4nw64hxIdZ8?=
 =?us-ascii?Q?2S86AmHVB84sqYlyjmv5U/Tr2YcgrkhXUMfdTGxiz/K4V4JoXOxt8Kr7idEq?=
 =?us-ascii?Q?ucJccCo/6/3016zJVc/5lVgEfALpQ3t6j/AWMJPuFCom6HxKyOnwhktwjfmT?=
 =?us-ascii?Q?LpPYwDU7vRXXUAdoLHSKwD1NnG/6i+y9aA9YtYsWMdcL94sR+KRDGcVIiwPW?=
 =?us-ascii?Q?PT4eHoIC4mV47Bb0hII5khWETDAw2A6BLzeH/AdIEKMz42ga8IJKmxeqB3xt?=
 =?us-ascii?Q?ME5/C6CykKfT7VcEtcIdoO9QVLO8U/+OG44nMWNWx1wiOL4CgCIrdNJDbVMC?=
 =?us-ascii?Q?WIySl06f5t6wVLpLObyKVBVEqKOdy4mi9QUHkm/AVTTaAPZBXfjYEXU/lWes?=
 =?us-ascii?Q?+pxF3s2C6fMZhN5RYPukkarB/vRNWbHe261L16lldCAVVS9MFfnUt+ZCd0ze?=
 =?us-ascii?Q?ujz3UVhnWkAYWi4wj5j2NGfIhyn/gGK0c8y5G/Ze0nWGqhl+6Afp+HxvEOtd?=
 =?us-ascii?Q?rTxzS6oVU5Fp180XkUiFQdhSBcB5SxpBLMUMfA9SpSk4z1qXux8rSHMo+BJH?=
 =?us-ascii?Q?OqUFm/2huZriA4fw0ylNeTJqqK5JDpIMWCK+r94vkykfSSZpaWyKvG6DpOEy?=
 =?us-ascii?Q?wNv+OObuga6Z2TMBIeDRP2+d69XUAcC9zaUpK/l83dXg+9h7zJFSje2zeAZ6?=
 =?us-ascii?Q?v05aSG2h/VgHpP4WhJ6WrvtJbK9EUwjkyzA3hXjn85cQC8Cm3AO5/5HYuxoG?=
 =?us-ascii?Q?yugmGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:52:48.7577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9903e555-d09e-45dd-06aa-08de58fcbed0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180

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
index af0c6f4e8c12..1d1b7caef5f0 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -7772,6 +7772,27 @@ static int __init mlxplat_dmi_ng800_matched(const struct dmi_system_id *dmi)
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
@@ -7926,6 +7947,13 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
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

