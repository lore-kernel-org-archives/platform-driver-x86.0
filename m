Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86CA2116F6
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2025 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745227322; cv=fail; b=n9/UIwSHIYL0RI4wwxkKfcKHeCfMtHa5rbTKcvxFYNqwsxRG63H6uihKz6xR/EYgql1cbRoSqz18LxeXiV4blJ8mVZhIEspJzWTYslZcGHNjuKxA1fIHM2FgdGSzJzFzXg6DwfqWpxLrI6F2VPGN2ZSymC5z+VZv7kaWYYuhtuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745227322; c=relaxed/simple;
	bh=jfihAKyoxj5KvXvNcTAEqegtrB2gK7YH3LqC09Q5RRM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V/n40kBDI38Z+oxRSANDnbq/3qTvfZcScMsDgOg86pjiQeWC+u9mNlNr8yhiQnNvXiFMxmbY0Nu/0mBY1wCFU/w7r4oHxp6EwS/TMVrvxaLKscMLY8z14N6ng6kRTNpPZ84krbqLAIBMRmRTqC2JtAa1oWHnoZWXg0iKILlJtlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=chw/FX25; arc=fail smtp.client-ip=40.107.243.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="chw/FX25"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNb6U63x3kAjBgef0tQh7zlWZd/5vy+r/CWTDmhISPS686dFbjsAg2JNdjrn1+Bus8uAFsZTaS8ibadCq29T1dkfVUBPl+GccRzG1xtLPmP397T22xtmASLN4VPfYO1wnrsOvwv8Itf7FDTJewXASDRwPVKDPeMvWRowzzc/RyGyUVmRJMkK8SrplFOHTOrbyC1d0p89Xle0hGABucter53LqsYLhIGoXrsKacZO+yq4RCAmdv+GCEPKohwfSPoFsGeyoda3jJMhv9wpr3hcYNewnwRFy+HW7lbEwcruZNea9+SRuEhFbVOj4scJSxCq8nNUsu8J8K2N0KZvVT4+sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIGH8i/qIe8cFiJdVa4p8INMAA5tS5alqhmgnRK+pAw=;
 b=xxSwdpfh5bvOj46p7ga6UjeBrwKHao8sCRNdp6BaAcPumqFDDPan+/iQkOXDXhM7p+SJ4pq4wcJ9QjpjepGIZVyWTqV5S9ivXbbIFfju6+JiKvtjHxCgAEohXdH2TC76fT9Z1Iu8/cqSgY0IET1PksEh2HZ2nVJdupi5lPr0ReUOgxuYgMGLrsV4KOJ1JjUi7MsBChZFkuB+3BbKkWvFf+OgS1kBlnKmYExqf2od0BfFyymORz1GGO9hnryBmSG457AsOgcRCr28Ztuk3UZrKu/LMrGiHs/YEd9Equt2hNgJPL69FwqfxknJhCgyL1IMduKk3uDWLx4Wa+vFIKLWZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIGH8i/qIe8cFiJdVa4p8INMAA5tS5alqhmgnRK+pAw=;
 b=chw/FX25PxKOfD63RNmyWXC4YrSO/NSe7aMJHosOfySP+3sc46SgTTR4xQI2YxrrmohqiT3th6OqxGQPWvWrc26UgSzzA6B8SIkPSiDV3bzSpxXkPO3XZqYhKKllrRu4JncKVmskQzbNe8Pd6UrNqb7hQP2oqbLvZ19p8opQ7fgUL11yNuybGNLJ8HzMA6BBqMD7vzBnw2dat79GzxBb8cUNDOiroAsX/JCLuICflKqFdQC7fVM+VW5sC5QRy1LKKO2GZH8yjhsHP1PLYRKFLPDbojbByZvZH6ATFENtyz6xYBsUO1i7u9UmEErDfaQnlQafhtOsogs7lsLBSE4LCg==
Received: from BL1PR13CA0209.namprd13.prod.outlook.com (2603:10b6:208:2be::34)
 by SA1PR12MB8742.namprd12.prod.outlook.com (2603:10b6:806:373::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 09:21:53 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::a5) by BL1PR13CA0209.outlook.office365.com
 (2603:10b6:208:2be::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Mon,
 21 Apr 2025 09:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 09:21:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 02:21:36 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 02:21:33 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v9 4/6] platform: mellanox: mlx-platform: Add support for new Nvidia system
Date: Mon, 21 Apr 2025 12:20:49 +0300
Message-ID: <20250421092051.7687-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250421092051.7687-1-vadimp@nvidia.com>
References: <20250421092051.7687-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|SA1PR12MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: adf7a2f0-71c0-4328-d4df-08dd80b5f46e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s8I7iAfufzZ7rDlTPlSxEkrAZ6Le5mA6Z9erNSf6jrrJDCaQmDx/b9/TWIip?=
 =?us-ascii?Q?pZO62awrxzL2rSM4dq4RovdtBYfta/oosW3W9CO59TPFx8ijNjYE1XomVfkB?=
 =?us-ascii?Q?elIwsQILfJjq7R7JuyYAgi07LI9SxLy6ZEd2dSHMK5+pNtmoodvvk2p3FvLn?=
 =?us-ascii?Q?6QcU7dZa9OSOQd7ls+WMKPwf4FFxDri3Fb6GPYGUQGjn3Wigz1Dc5i/BsITM?=
 =?us-ascii?Q?9fa9g/z2Lvrmgs9yagZesP31H3xzOj2cmnqsf4loyNWyIr5oADLDQHKBxeP2?=
 =?us-ascii?Q?QoiiEEUIfyuhld+/9zcefPAhl8iGd7zR1qryVXs/3wTbIYsV5v9IOsVCLZUP?=
 =?us-ascii?Q?ngOOvJ9ga4oJsEQnfwMPQIX/jLmWx+fm2duX3Yk/WruPrILZh+060CcWZPqh?=
 =?us-ascii?Q?+XjYW4qedV9bM2Qk4odx4/KGzUWopCMz/HXmG1csYNK0KjupPvI7RuGEhjG3?=
 =?us-ascii?Q?xCkK8jj2XyeMH42G4F2OWDLl7LL/J2nUHtyOprubzjTnzpgZoTOr3KkKcQgg?=
 =?us-ascii?Q?tlVEJOj6qRYcI/tVRJtuZSGvYWLQiaXHUwQ1D7gMAc8qtMG8PvrFt4ENFEs6?=
 =?us-ascii?Q?5rwgSPKzh3O/NKxvA+xNKbF7dDeuXzNtlU2AJgbuBeOyeWJUM6V1wV7cXpOs?=
 =?us-ascii?Q?qKuwsfIV7VyYVSlsIvv9/XRasCL0J8XHTggXKHOeItzcyQoDqPjytTg67v+w?=
 =?us-ascii?Q?cSdRmCAvAbJK9clUtilCM2hZ0Zgy+YWLgeY5aiSau0optNWV5NM1N7f1CF9N?=
 =?us-ascii?Q?9oZLPMjlpL9t1lalGumaGEjGqurVV1a6jSMyQz+Kx1hn6nYByjCr7PlFgDO3?=
 =?us-ascii?Q?mdr4gA0q7KDiyTzdFUohV8QJPV0RyL68YpioXjzngTItsRSUEzLbV7t8ebCb?=
 =?us-ascii?Q?xJr/mH/izSpiuEuOCE5DV36vtxQqrqqdVigQ+JgE2dC/TMQ6kNPte2FA1Yy0?=
 =?us-ascii?Q?gDjNC2JpwKD0HVzmBSJvZhZropVC0IHsb2roQlI9u2DqYIGzYV1XoBIeJBSL?=
 =?us-ascii?Q?DAtM2X9+Fmv92wVwtBVbfqCVO3GNWrXyHlN4yV/cqJMoECGwli//JhwF0z//?=
 =?us-ascii?Q?yGeTuvirXIT5L7T26q0vaDqsf1BC/iiyBmpKoxv+uKFho1mKCJImZDhP5CGo?=
 =?us-ascii?Q?1bJNtAmO3s7Mng7VgSsAEpzxtDeLH7N9/HqzagO41r/4B6R5C0fYcMDWBMCR?=
 =?us-ascii?Q?2mok/7tHUhkBauWbx0jLX3J6ETpliNr6WV9HvFLyZjeHJswVE/bOFSLwnHHX?=
 =?us-ascii?Q?7PNtnRR2fC5qpba5+oc/lqqUZqe5FLn2kOkGBSU3RZtUqKFJCCZGwg3tqM6b?=
 =?us-ascii?Q?vjrdlZ0wSz3NJiuaZSaKUliqyv0YfhC38CwzlL6TknfZhcB1EZIR+ri6PzJw?=
 =?us-ascii?Q?9Gn/rsb1bPWJBmOGUIRiz6wQxnlHuqaSQUcxT+dPeam2BFW7V68PSoCUQ4HF?=
 =?us-ascii?Q?wkOtkd7UJHIZDCe3UewnAP7gIEV+3wteRZPVYUbM84nou9kYax+skk7oAkgd?=
 =?us-ascii?Q?5Z5Y3Nmq6JA6KZ6flDCUMND9faQbNkt4ScEj?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:21:53.2951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adf7a2f0-71c0-4328-d4df-08dd80b5f46e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8742

Add support for SN5640 and SN5610 Nvidia switches:
- SN5610 is a 51.2Tbps switch based on Nvidia SPC-4 ASIC equipped with 64
  OSFP ports supporting 2.5Gbps - 400Gbps speeds.
- SN5640 is a 51.2Tbps switch based on Nvidia SPC-5 ASIC equipped with 64
  OSFP ports supporting 10Gbps - 800Gbps speeds.

Both equipped with:
- Air-cooled with 4 + 1 redundant fan units.
- 2 + 2 redundant 2000W PSUs.
- System management board based on AMD CPU with secure-boot support.

Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v8->v9
Comments pointed out by Ilpo:
- Simplify commit text.
- Fix comment - drop "next generation".

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
index 4c2ad2472f35..191c459e3e16 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -3000,6 +3000,59 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_l1_switch_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_PWR_BUT,
 };
 
+/* Platform hotplug for 800G systems family data  */
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

