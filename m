Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC691155391
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 17:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739836; cv=fail; b=DAhFn3QtgJd/tM6roGOKQzcswlAO73k4jMK6OuzBrS/Bmlj2zN31tLQBpwdWX1DA8LeViczJ6P/1mIGolAU326gM0kLmCj9NzhndvfjohkCG2TXarXPjhaoHMs/y3IAjd8ForbZGbg4TOUqhKv8e/8HldFxQ6wUBkRXnDI7QkaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739836; c=relaxed/simple;
	bh=y082UbF6MKsedkDp+YeSu7imtVw1USsAX6InScVzqNY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ephpu90g80gWQYmcsfOhul+DxJ7Qdy+MEdzrrDgpZ5JLrjd0FC3oxrmf5NrHibjvun3Jft8wBEGDFLhiqzxVZroX9noNAUD/KLvKsPs8sBnR1EurWQnYdwonXyxeZwgPf5kJvO8kc8WC81teK9wPklUHmI1czs6oJitTkrtX+G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fvSEz7rQ; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fvSEz7rQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Debxuw6BXYiNONBL41HzrPlq/jGzJKRt3Amgxs72/ORIWU3+7LyDPugFUqUQqkaT1ZTpVRlt9GHPA9g9gm907OB2pW+8ifnClN+HsjITlkMdUMK1azvZ5Kv41lUbMW1OAhYplklKvGgZ3FP2FyIGy7s8/beDnIEUNXWdgyx0seVRVebE8QLbmfoeSrIKUt8QACUdPfGIftNgnKSmAyiBu+vr7OWMT0rT0qyOF1i1W3QEVHKa3uIW2qrrRPbeM2gLUDUP8q5gwssFB/roHHw4knOh3iBc0ecUgG9J64nDCJ1UDMxZDavHt+3aWkhwewihJ9pWtQoly2iLN4xt2syi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/C/FjJDnAYmMDucO3to4uKGZiBM8ykkrKVGv5TqB5eI=;
 b=Vqs7TscAEhJ5AIrTR/IMOv1QNeGK3FwN+3ThjmiX4wSnp+TolJ48Bx5c2X/CgxRerA5c12kNpFbXeoUsfg2b2lNlrmz9iHD6gdffcqDZg18KxClD3vGwoa7SLcvm2md6PkTkTP/BGWrNeG61xtonrFMJSMYBR+qhMC7Ap01ZADdIr+RuR4SfNfOyf/EnCVaqJsPuyPe1/pdJnhdtC52z66wVpDWBPrEisBMX2a+i4Nkmn0czUe5VB5C0MsC4Pe/Z+yy+2dYgcOPnLJaKNJarRyGSWpQIr2oCy/vlBFHHpsUIMOGPBjiKxIN3fTw4gJmdRzs7iULs3BjibALkVv0CWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/C/FjJDnAYmMDucO3to4uKGZiBM8ykkrKVGv5TqB5eI=;
 b=fvSEz7rQCCJyYEEk+smQbRO1Yywl+4X960Z3gMpYgdFyCAY+yy9WukvK/t0BHreEbbvICWJgLBbOfkFKEUoeCq6Suyo49/i1daq1kj4nIW8hnSRwOxEdNBgS2101U766zWvcAJPr/stW1Wz9Gx+QVYOfE7HnCjmBhegRfAX522pvTPpERedJ++6y3kYrFQLrefZ5yE5asdAaza1TwKWQOncOIzYLu7UKEyvW7vhJUygRpoEOPJ1pmjCRcDAttI+FptvMdWUHuxEDTYwDRJEgHEuUxxhkxMyADxsAtgNSwbgTZzXzTNvzA7WqA7O5LUeCMmD4lVjfiFOIu+GiyvKJ7w==
Received: from DM6PR02CA0109.namprd02.prod.outlook.com (2603:10b6:5:1b4::11)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 17:30:28 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:5:1b4:cafe::4d) by DM6PR02CA0109.outlook.office365.com
 (2603:10b6:5:1b4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Fri,
 24 Jan 2025 17:30:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 17:30:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 09:30:10 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 24 Jan 2025 09:30:07 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v5 10/12] platform: mellanox: mlx-platform: Add support for new Nvidia system
Date: Fri, 24 Jan 2025 19:26:28 +0200
Message-ID: <20250124172632.22437-11-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250124172632.22437-1-vadimp@nvidia.com>
References: <20250124172632.22437-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|SN7PR12MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ffe97b-a346-4004-a4a0-08dd3c9ccb09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rZT4c05qP07dq9dGoeVjdJYTfzJrWzZDR6iRnOmCTcPEDxG15p64cswUMDUg?=
 =?us-ascii?Q?ZCHg7H6a77QdOe4wfKpR2UGarzLYTQgRVuK9ZhS7LbB91w+9PglHW8wpM5u/?=
 =?us-ascii?Q?FmuDP/KpafFSYtZXNfbHHVRdqJGHz/gmzmxEU+t59QR6ZWs5PC5L8qfjidl+?=
 =?us-ascii?Q?lzNBVD2XmKoFDKpISfe8U95Lav+SpobFUWU0jO2hfTW5dTPWPide8l8Y2m/H?=
 =?us-ascii?Q?aT3CtKo4p0gwdXTXZJEyEj+bRyrRqM7Y5A/qH0mUkSJZI1v6dWpn8RAbrVXn?=
 =?us-ascii?Q?mEhA99+sX34hihB/qw+zh0tDoNfzuIINOQvWsAZsnVarypJ0HcYCVw50eMOo?=
 =?us-ascii?Q?dLlsa79xXyaMhksnDh3BOcLfJ15FsJ5toXFwLYhBX254RztWM4R8u/n1GJbL?=
 =?us-ascii?Q?/mF9RldgBb0cHvoxV9ap7EoSInPOI8echPuwvuJl6uyQvMW7o9DD8Kr5GBtF?=
 =?us-ascii?Q?slTn2EJk5thAr8VcpIyFYnNoyWNzVSzJnBfAj3UVoTSv+nq8GHh/Jh3K41h6?=
 =?us-ascii?Q?K23F+GmwTgfkuGwfokz9nCL0rYk9+igJbZX4opS4ullaGoyro01B6T8oHTi6?=
 =?us-ascii?Q?o+wrH61CL0QS+rVkXwXIF2dArrFszOZZgGOr7EMjdFJzbAAxSr0Lv+27Y+I8?=
 =?us-ascii?Q?bno8k5TRJEAGUcDnVujhk9Xs+MPeaiZULsq5UvNwfY8pYIFFva1y00ZAbWxY?=
 =?us-ascii?Q?PhpwYcKXrL1Eq8HUJbB8EVdiSjRnvNR65KjVmTFOX8VurrTffbYFbfSoet3A?=
 =?us-ascii?Q?pB8d/j+vZgC813W2lNsVPoH1GM36cDrqVhuYDYqub7u9vaRI0HkFh9x66OQA?=
 =?us-ascii?Q?pt78WCxl4lhNuGMIi3mkYtQWPfHy2Q9ozbu5m0ee91ZZp7f/Xly5ABGptoDb?=
 =?us-ascii?Q?ATuJ3ru56l2yqginLTmsW7goH0plqLVwTvPEvCwMgGBzQIBUUcx/xO0OK0p9?=
 =?us-ascii?Q?sALzk8DSW3PIUJ87vh+eZ8TD6yeeMtkmYl7EM5fw2dDb8iyjLvkx3/idOTGg?=
 =?us-ascii?Q?HNPx9weIj0uraYDZEC15rhqCBek4cGplcm0qq3tLjAJqAFVmTzVBSKlKGFBm?=
 =?us-ascii?Q?ZL7YXxOkF0RVOUhYkN5uAGrmxM6BnPoN3Ke3OkqYISgxKzrxceuPdOn6T+Sg?=
 =?us-ascii?Q?GqMQ5ihFgvalsdSmZ5xItYMfVblUc/eav9yz/Zmg4/E9SICIA4vBx+EV59C0?=
 =?us-ascii?Q?1Dg5K5mBLklKh0WQL6m+3qgEtpVFes0KZgkgrRAgY010xcGYS9kfivYBXny6?=
 =?us-ascii?Q?lcDM74M73Jru6Ey3XxsnRGWAGTmfh65O/LEXuV+z5kDlPZcBAJWSd+otI9Ur?=
 =?us-ascii?Q?x/kmUbxNi/tmM236Hr90zVXDARkHaFWLuperXTSEIPLZ3VP+JzdCR74bLt89?=
 =?us-ascii?Q?thWa5IgJnWrjjMCs2HopgQGJNH0XptJsRlnjUFWNWCaEuNWu9mZa4P/geC7m?=
 =?us-ascii?Q?cxZTqT4U71m+2a1soav1svaOFcJ7gPp9w4qp5ddA7uLQ3wp0osstXzDboDkg?=
 =?us-ascii?Q?+mAXdcJ5k6t6P3Y=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:30:27.3887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ffe97b-a346-4004-a4a0-08dd3c9ccb09
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929

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
index ee72a53a8b06..953f92a7cf22 100644
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

