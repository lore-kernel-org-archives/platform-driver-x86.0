Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A5B1ADC97
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659350; cv=fail; b=rzjNe8CkumnmB1CyATvpsgWNN1J0U7dzPQyY5XSnDFmQQBQg4GqTtn2UxRy6viHxUEhtc96V5XCbq14sPi90GNl5sMHrgyVm8KrGxBEWTQUNmquPuKFdRMYu1v/0ncZ7fiiqLDi+Hqc91shAPKD4cOu+VsIP1xkXNqm6dM+iMgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659350; c=relaxed/simple;
	bh=fOXasMPhAxVyO022JLtlQMYsX+Zzg2orDaXyH9KOgvA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6iBQJLGVpsmYNR8SuchHiU/Rr4AmSziR8BdgAlh8oYlnrHQ1eiTno5+fc9clFq881GLzllDfZvGCVU5gCrNbhwGOH3l/drDoZiHzQ9/nPatRy8W2KOK+ZV94ge7X0mqfg6i/NXCGjmJ3KkP0AQxKak9QvNvfEy1cXVwHZvJvA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kuot/iKc; arc=fail smtp.client-ip=40.107.100.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kuot/iKc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZO0u6jrkjUjO7moaMRDmV8AStrlk6oGDGayhx2wpNEH/DK2JN00nkVm4i5Dsc4/cJ71HZrE0aS01Ueh14xb/+7JjGxLfjuLyCBbSBazW73Kg9tjGZTl0fwzsnTc2Uyj/1eeUVYeKq/8mlFT9hleeMm2g4x18y1PI9oD/Gh7x72ff5qm9xhF/r79JaCwOhX2GasMyzPqWIAZlkzA6uoI9QlWGrQnIlUsGoBXgiCFmSXPsDnCN5KylHoxKsCuhZyn8HdFZgCBYnn0F4ctudhhySqzedoTQI+y4ZSWxpA90wgc0cVVznAJ0uSalTVkF8wDZisjlR1T8WtCzYZuR1nh70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OeRSr6qQ2KgXRb9k9jUoEzMC77JJfo85Tjq4c7DDO4=;
 b=fjyNtBNL4O4iy7t5wuI5bH+MaEoHWIsRDJtTiljnBIBG7ZY8qoJ6g89oc1SekKi3az7pCKkbPrD0pp45V8shb6S7H653GGDHaf1hAk63jqCHGYg65mGFNlQafs4dyehFPpTBbDWe/G8BIOUviiz8fZhILu5377Pg7vTV58XWS43ws/iiaH07wfb1SzxR+M2iGgVyV/L7MmivCS6cEcR7Lh5QgMa3GK5Tuxse606CirV8kPqiLIykAkojtUkVDv9984kPm1YDT1ql6z/xXKpKznwgmKy9xiPLZoDpvatKMUCAycdZKzLBnCXKlnXz0IOcsCtoZ3b5BBV13iKTkk7teA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OeRSr6qQ2KgXRb9k9jUoEzMC77JJfo85Tjq4c7DDO4=;
 b=kuot/iKcQCQRDSNgkj1bvUNSOpng6m4l9I9E4lQc1Jm+10XwuAjQmDFHyCFah6/RUGzvCS251DI9PjRsaoO5cvMwhI1F0CK7/OEdtLw0KH7d3sl9cArWaIDkXTLlYO1gLs9P3boW+C34PD4AzJZHtE2lGVNehewwuIICl7W4mReaIp97USXTB77ws9UcDPiZ7Q6DUR/sHFwhAnKjJsHz3HMAWmYFCtFpEX+g6PHFUCuWCk91azetuZhAK0jEs250C9QnWb6zMkcAdhu9i0oEi1eiU13WS98Jq8hEa8Ag6WiPnw0Vsi+JHEIHDChunnQfBGyOj4EUyIlmw999jR5FaA==
Received: from CH0PR03CA0235.namprd03.prod.outlook.com (2603:10b6:610:e7::30)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 19:09:02 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:e7:cafe::2a) by CH0PR03CA0235.outlook.office365.com
 (2603:10b6:610:e7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.18 via Frontend Transport; Thu,
 23 Jan 2025 19:09:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 19:09:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:08:46 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:08:44 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 02/12] platform: mellanox: mlx-platform: Cosmetic changes
Date: Thu, 23 Jan 2025 21:08:06 +0200
Message-ID: <20250123190818.3834-3-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: dc28f916-d6b1-45ef-f910-08dd3be16628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MeGkaVcc8Ks6afwJ7nG8GgEDVxkMSdcuMaA5nNUqO3D+De/wmereahMMq2Ym?=
 =?us-ascii?Q?mDhhAARqxOfQbmIjLbMkeTyNzshslNo4UpIbziSBwOzWhBs5SLdQqcBXhoiV?=
 =?us-ascii?Q?2nXSPsBbadTTTnYhDHoTrGeaJ1HCuVQ2uCi61g64yPmospxt6D/Wdsf7fPWB?=
 =?us-ascii?Q?bOZ9u8wmv67+o/0TjM/Uhn1oGqIF9d8jMkZO82qWR7/s+uvltGdEV7RvQ2GH?=
 =?us-ascii?Q?b812NB1QNxI3lLxEn3ZNDcF8n94iUdsGOgErKH3aXa686J6F3bw2gd8HoIUj?=
 =?us-ascii?Q?oGyD+5jhtMv2C1bmBspkSZsrt/QduR1IuzCIgzjMrJaTDg1OZoNTqcDxN9i9?=
 =?us-ascii?Q?+LQ422T0Y7n6bbkUihaoVbEgInWEOtun25YWUicBkekoXfi9k9FmiFU0w/o0?=
 =?us-ascii?Q?P81TC6GC69OL2HmNY4oxt3GeZxJ2SYj1p3sYnP5HzjogBkFWt1hTO+GtTbCI?=
 =?us-ascii?Q?sfzB8IAYnrX1xeOpYYGt62q51ttlMPF98P/kRDU26wzuXAqothhSzjW5Oqb5?=
 =?us-ascii?Q?I/vhdf9w5LdU7a1Pbe94EAb7ojbvcrWBfRvVVsyFKUQv+n2xPB34gJRrRaTz?=
 =?us-ascii?Q?Fol/72CESVYXLh4nbrhm1pvLLJwYf5XWK5OSWh72DvFmXaMtisc0H3T/kUVN?=
 =?us-ascii?Q?Ckhokem8y+wAxMd2nUZnVMPLdndiWB6Fyk2jBS5P/kgLmD5d4R05xzDHbduV?=
 =?us-ascii?Q?00ia/o9BB6rWzdbQ+FStp+9e72FPST5Xb3B2sQ2Kg6gDbJ5OhRM9DFv2R5Sx?=
 =?us-ascii?Q?rQXwZKaOx11atzybfh6rQk/gHYy+NDefUrxooz9xjXzXQXCaMiMFVPwjeuWk?=
 =?us-ascii?Q?3pN+5EskDXLigf/H1rjExLyFLOT6ILLAscGiapCjLuRC4P86D1qdVq/gz8g3?=
 =?us-ascii?Q?SYAa/Q0g7qB/44EDMcYocgVYhMl8cEkOhtJiCDMm54ajsfNixEJ/cBnINJLQ?=
 =?us-ascii?Q?L4U4WtD9uDvSEgwL+BHKG118+atvvNJQnn8KvrDACRSxczn54T+iYXZ3uj37?=
 =?us-ascii?Q?aCkRSjzBkdh7UmdEyN9be55nJgrIrbSbM2bwkVWrvwE87p3voXHTNp16a2Cp?=
 =?us-ascii?Q?CLdVpO0bFQKLblKwX154vI6qIUDsjlm/iYNpfqhHQkRGNBtohFfdMjdDY5jY?=
 =?us-ascii?Q?9Np7012vxZiqvxVX5VQ4I6XGazqV6Z/r4bJHEE+OWc7UUQmJLFIigQ+YRSjA?=
 =?us-ascii?Q?n99UwgqqqxUQrgtblKA8RiNF/MMpNVML5QTn07kentZS6J9sYJSGezelwErJ?=
 =?us-ascii?Q?Amk1/sXFumZg++oAbkNRMa8SuqTnXYQQg3ZoIczM5XMpO785Fkp6xhYFyiP9?=
 =?us-ascii?Q?6dfzPC1I2WxkbDdDO/ZHjPEqXq7vDZ3mAiS1ub0L9eNqU3PBVB6z6v8UQ6N9?=
 =?us-ascii?Q?FKAsNd4oRlhBVItQnQl/mcXliAFDD5ij6EjSYIOjQOSy1/2ckm9NdBErFrrR?=
 =?us-ascii?Q?TkZYZX01CsNjdEJtQrX7EXMWPwbP3X70bbZ35rOSkjFAWe88rbJzNeA4TyQ3?=
 =?us-ascii?Q?78dnMX1HB088mXc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:09:02.2401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc28f916-d6b1-45ef-f910-08dd3be16628
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313

Remove redundant spaces.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlx-platform.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/mellanox/mlx-platform.c b/drivers/platform/mellanox/mlx-platform.c
index 1a09f2dfb7bc..8207447aae16 100644
--- a/drivers/platform/mellanox/mlx-platform.c
+++ b/drivers/platform/mellanox/mlx-platform.c
@@ -2247,7 +2247,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_modular_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
-/* Platform hotplug for NVLink blade systems family data  */
+/* Platform hotplug for NVLink blade systems family data */
 static struct mlxreg_core_data mlxplat_mlxcpld_global_wp_items_data[] = {
 	{
 		.label = "global_wp_grant",
@@ -2279,7 +2279,7 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_chassis_blade_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
-/* Platform hotplug for  switch systems family data */
+/* Platform hotplug for switch systems family data */
 static struct mlxreg_core_data mlxplat_mlxcpld_erot_ap_items_data[] = {
 	{
 		.label = "erot1_ap",
@@ -2387,7 +2387,7 @@ static struct mlxreg_core_hotplug_notifier mlxplat_mlxcpld_l1_switch_pwr_events_
 	.user_handler = mlxplat_mlxcpld_l1_switch_pwr_events_handler,
 };
 
-/* Platform hotplug for l1 switch systems family data  */
+/* Platform hotplug for l1 switch systems family data */
 static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_pwr_events_items_data[] = {
 	{
 		.label = "power_button",
@@ -4401,7 +4401,7 @@ static struct mlxreg_core_platform_data mlxplat_modular_regs_io_data = {
 		.counter = ARRAY_SIZE(mlxplat_mlxcpld_modular_regs_io_data),
 };
 
-/* Platform register access for chassis blade systems family data  */
+/* Platform register access for chassis blade systems family data */
 static struct mlxreg_core_data mlxplat_mlxcpld_chassis_blade_regs_io_data[] = {
 	{
 		.label = "cpld1_version",
@@ -6573,7 +6573,7 @@ static int mlxplat_probe(struct platform_device *pdev)
 	}
 
 	/* Set default registers. */
-	for (i = 0; i <  mlxplat_regmap_config->num_reg_defaults; i++) {
+	for (i = 0; i < mlxplat_regmap_config->num_reg_defaults; i++) {
 		err = regmap_write(priv->regmap,
 				   mlxplat_regmap_config->reg_defaults[i].reg,
 				   mlxplat_regmap_config->reg_defaults[i].def);
-- 
2.44.0

