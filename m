Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811D970807
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 May 2025 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746377755; cv=fail; b=CRROYUrL6RgtCrshDN4B7Te6XNjg1CEy5Sb6jcD9rn4l9KSbGXy/JhVITb8dCK+etRiWYBf0dSnYOI30rjVn5KBTTDrOFOsKEZ0Ac0oyHUB57WRiepJd1dZ8o8iLmo8vBt588MmPPXglbx/1LJ0DV7t2/UsPBmGnT4H183AK3mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746377755; c=relaxed/simple;
	bh=l/04IqgRFJ849ahnIO98eqAebQ3tducPAoNhfvJRjD0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWdbcRL8soadCKZ+J2wlOAcZ4a3tKkSO8G3XlKgLPCvUOyDH6ZvIURuTkBzYd3bcRgt40dxKaz/jkYu7R1ohh9Kks6ClLkxWGRM2HZv+Ic9S2BltDXxa/enIQsgGvCuSQdmgwlw2GA+/+ol0mtP/vO7Oeh94jLgHmvL8zwh9AMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sVX6ZTjD; arc=fail smtp.client-ip=40.107.92.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sVX6ZTjD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFMynIIGTyRd2Lh+ImegAMe/KvGFxbEZ4IATvp9Rz2fKjxvE6VTvi4ZLGzoFQ3JFuzS74IjeBVvJgOjTScXOK/nnKFuSriey0X8G8o1NeoUldWGS3TcykH//6XZpiufVFZ8szUSE9SV3gHPloPSCrg/UhV9vOXhqJZC18eTzDDROv8C13U8cCEOdAEeA9Qzg2qgK6VSMZUr7tEeDzUrxvufdDlT/dijvuX/SXZyFvQSlRIzhK1vsoxbM9fLIrZVFezi6CKYoHvEMph3ybXDWRkEKWAO4K7sFrNgrlNX/yiu5TDaJWBVF+HanefvMlMfhbf3nZ/S0OrDDrUksy+E9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3taaf5qFaXI9vzsxJ/+BgkpJDnmzTDtR7aw0NB4LyA=;
 b=YbYZC0mlHChhZGVQWrsNA7NQ5qHDYAgQCqHbpddg/+J9wq6qIsYF29Gyf9xFlMbOXTrwOuuExfEsbc/EWz0FBlJr2N5t/7uVqktxXdMOt9jnddwtRtHHcKq7Oyscnv37GWGRmtyKKcbMdhPZLrT+odokJeaeDASwtGkHgSfFQU0y49eHtenErbDWtOOGdInGTnMxzvfVD5YPhKmlEjCfuGxDOaCPekNepjbk1qpBEWVOGeNHZzDgPbUOjYCRA2ZcYsYWBMaI6umMT9T2CJL4TeUgl5wo1eS9c6tpnDE4P2hpg+ECqwykQjl7DffUd+3k0ePebKiJgihCkIuyePVlvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3taaf5qFaXI9vzsxJ/+BgkpJDnmzTDtR7aw0NB4LyA=;
 b=sVX6ZTjD2+8xY0XLK6iPvX8T1C9YRst/d2i9HqNRB+PQYosPN9iDXqIWWkDHrA0O5iyqJJ+05D4TinEd0NeEu8zXTx7oH1Nc437Deha80+XIQYOOWbZyPNJzO9lrLcCLA1LW2sYmsq6fq5zrLE1WozjVA1t+yZvKI9p2EZ2MN6N1kILv0GUnxV+vni1N1+u6Jk4aRYBNeBvLHBj4fb6Mf/hyY/65+xoFRUpGs9JbJtMtsCgrd+CGM70s+5KykQQr3vpbhuEshZo1FswB6eSJuM4h7rF/J6AAIpF1SKK+1JxiGmTibC7aXPz+vYyGZCmSR7ZtUxSuTgXLISjygalYXA==
Received: from PH7P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::24)
 by SN7PR12MB8820.namprd12.prod.outlook.com (2603:10b6:806:341::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sun, 4 May
 2025 16:55:47 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::a8) by PH7P223CA0014.outlook.office365.com
 (2603:10b6:510:338::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.26 via Frontend Transport; Sun,
 4 May 2025 16:55:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 4 May 2025 16:55:47 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 4 May 2025
 09:55:35 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by drhqmail201.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 4 May
 2025 09:55:34 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 4 May 2025 09:55:32 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <alok.a.tiwari@oracle.com>,
	<platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v11 1/2] platform: mellanox: nvsw-sn2200: Add support for new system flavour
Date: Sun, 4 May 2025 19:55:06 +0300
Message-ID: <20250504165507.9003-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250504165507.9003-1-vadimp@nvidia.com>
References: <20250504165507.9003-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|SN7PR12MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: 07058607-401e-4ad5-3434-08dd8b2c844f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ekm5DC9aUTxItDETp30pJ01cjVabmTAqiovotfuFBNcUVK3d15d/KP+4EOxo?=
 =?us-ascii?Q?X8t3yu70Gu4zwwbG9HarHOCD3al+Ds0PnQkmSVfeRFWM0fV2cbJVRob8r2LA?=
 =?us-ascii?Q?+VsSauA3JQueDB1E40208pNbSv8lQfsX0DjeSRL5GuX8xDPfASgyNWfsVk7i?=
 =?us-ascii?Q?UksQkMPhhnoVch5IV8zCa6PzsmXVt5WmxzXroFJ++qmx3DzMqb5tl6lKehqb?=
 =?us-ascii?Q?SIdxTg2U6ojOnvu0nP5xefpJ5HOqzPtv8nPbA/t74DiKeu6cSI8xyT2PrLa0?=
 =?us-ascii?Q?CQzh459ILTIFryzER2XPH7NVP3utIPPb6bKOzMRepqzrrRVqV2gZl7kn0rXi?=
 =?us-ascii?Q?QhZTcgupQ4o5LGcBaK1ZJjpgKwTSip5DoqXdjoVxe972goUW9JLuc0cToZnv?=
 =?us-ascii?Q?+6DWaFLtUigZk2gROnbkPFpsw1PzZzgVTpTVuPg+cTl+dTq5IPFO5F0+7AEk?=
 =?us-ascii?Q?qPOSOlnjSssYkpYEdMp18dJV0Be4nzX0SHb2tD57R/3qfxJa6X4/gBQ+Xqvq?=
 =?us-ascii?Q?hqlwdanZH2Tivfgdx9c+ZSUjsM6kNsXA6xaKpCdWVwzEk/TqBIMKW9s/RqfU?=
 =?us-ascii?Q?ulpeRXIhIAD4gegxYzX/w+4QXg5RYkqKnWVlifxIDskSu0qW+IgvHmizLQnZ?=
 =?us-ascii?Q?uXX1xgukml5NHNEKI445ZyVySIkuxPlnjBUZEuBZgH6uWkkyt4gYCTyy9gMB?=
 =?us-ascii?Q?eQaqmUJd+ofcB7fi+uIyu2jszqatJJryqjm+BDATZUzTltnV4FvkY07JiJgu?=
 =?us-ascii?Q?o0lXI2vPWp6BPk/i/vmoubFgI2hCpxTBmMifcDCJI7JzXd0YT+RJ6q9FCM6Q?=
 =?us-ascii?Q?O5stB256T+OK20mYUcfEquqybKnGTwbMnqxUKZp7l5pW8+wcAdzRw/5j5Y89?=
 =?us-ascii?Q?HqmnUfj47AyFl1Ej8gFBs+2QdGipOKFrQ2NSuSi3tzQ+2HR5fd4KsC23UQSR?=
 =?us-ascii?Q?ljyb0bYS9fNuExPhWOEgsCvWFiPB+jyYscWrCy63xDb4V2u1Y2O8nn/qbd6t?=
 =?us-ascii?Q?N5U3PiGQAK9tghFU6a+DBVqaBsbzN0n6fTlZDXTJWyrzl8VCW9GQtRFMZYXe?=
 =?us-ascii?Q?vgfDB1bHHhjTfUoUoFT7U1rD7UPs3oap7d2IMX3I0QAFFlJ+IXU00zDx8GNQ?=
 =?us-ascii?Q?bw3O3X8m2sKDvMvQRfjh6O+kbnXNfFvzF2N/BvS23752rexzkfEkIa+YXJsH?=
 =?us-ascii?Q?ox2wPiF5k5zs3aN5a9qsnqI0gOyLVyRA4mqaQsWp8h9X1nKM1bDyXt++4qXH?=
 =?us-ascii?Q?zQ/KMCICExv2F5gT/PyvrjUDrK68/O/xX0Lm9OSnhkv+WY0TgseAyslTY/3x?=
 =?us-ascii?Q?+oy68WX/N/mpWU7kkq+1Fo+WT3kPoKAuZMLO80mHnoP3Opn9EgpFFJz24koO?=
 =?us-ascii?Q?9zeTrUXdF7HZG2mkZnfL5a9mOKHBIWqHHkCPsINwGq+pz1FhwJrDsY6DpQbE?=
 =?us-ascii?Q?4P8f+wRg3WEt7gROYakTmJsRRjNbl6I6QzPyOiNzoNeQgCubAQolMBk6l7Xg?=
 =?us-ascii?Q?YguJDzvjR0TIk2Sn2CeeWMDaFxr1obhCN2x3?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2025 16:55:47.0025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07058607-401e-4ad5-3434-08dd8b2c844f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8820

Add support for SN2201 system flavour, which is fitting OCP rack
form-factor and feeded from external power source through the rack
standard busbar interface.

Validate system type through DMI decode.
For new system flavour:
- Skip internal power supply configuration.
- Attach power hotswap device.

Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v10->v11
Comments pointed out by Alok:
Fix typos in comments.
v9->v10
Fix kernel test robot worning:
- Check 'sku' is not NULL.
v8->v9
Comments pointed out by Ilpo:
- Use 'bool' for 'ext_pwr_source'.
Notes from Vadim:
- Only one specific SKU uses external power - no neeed for table.
- 'acpi_match_table' misindent will be fixed in separate patch.
---
 drivers/platform/mellanox/nvsw-sn2201.c | 110 +++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index d0e5a18c0303..8c31189a94dd 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -104,6 +105,9 @@
 	| NVSW_SN2201_CPLD_AGGR_PSU_MASK_DEF \
 	| NVSW_SN2201_CPLD_AGGR_PWR_MASK_DEF \
 	| NVSW_SN2201_CPLD_AGGR_FAN_MASK_DEF)
+#define NVSW_SN2201_CPLD_AGGR_BUSBAR_MASK_DEF \
+	(NVSW_SN2201_CPLD_AGGR_ASIC_MASK_DEF \
+	| NVSW_SN2201_CPLD_AGGR_FAN_MASK_DEF)
 
 #define NVSW_SN2201_CPLD_ASIC_MASK		GENMASK(3, 1)
 #define NVSW_SN2201_CPLD_PSU_MASK		GENMASK(1, 0)
@@ -132,6 +136,7 @@
  * @cpld_devs: I2C devices for cpld;
  * @cpld_devs_num: number of I2C devices for cpld;
  * @main_mux_deferred_nr: I2C adapter number must be exist prior creating devices execution;
+ * @ext_pwr_source: true if system powered by external power supply; false - by internal;
  */
 struct nvsw_sn2201 {
 	struct device *dev;
@@ -152,6 +157,7 @@ struct nvsw_sn2201 {
 	struct mlxreg_hotplug_device *cpld_devs;
 	int cpld_devs_num;
 	int main_mux_deferred_nr;
+	bool ext_pwr_source;
 };
 
 static bool nvsw_sn2201_writeable_reg(struct device *dev, unsigned int reg)
@@ -522,6 +528,35 @@ struct mlxreg_core_hotplug_platform_data nvsw_sn2201_hotplug = {
 	.mask = NVSW_SN2201_CPLD_AGGR_MASK_DEF,
 };
 
+static struct mlxreg_core_item nvsw_sn2201_busbar_items[] = {
+	{
+		.data = nvsw_sn2201_fan_items_data,
+		.aggr_mask = NVSW_SN2201_CPLD_AGGR_FAN_MASK_DEF,
+		.reg = NVSW_SN2201_FAN_PRSNT_STATUS_OFFSET,
+		.mask = NVSW_SN2201_CPLD_FAN_MASK,
+		.count = ARRAY_SIZE(nvsw_sn2201_fan_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = nvsw_sn2201_sys_items_data,
+		.aggr_mask = NVSW_SN2201_CPLD_AGGR_ASIC_MASK_DEF,
+		.reg = NVSW_SN2201_ASIC_STATUS_OFFSET,
+		.mask = NVSW_SN2201_CPLD_ASIC_MASK,
+		.count = ARRAY_SIZE(nvsw_sn2201_sys_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data nvsw_sn2201_busbar_hotplug = {
+	.items = nvsw_sn2201_items,
+	.count = ARRAY_SIZE(nvsw_sn2201_busbar_items),
+	.cell = NVSW_SN2201_SYS_INT_STATUS_OFFSET,
+	.mask = NVSW_SN2201_CPLD_AGGR_BUSBAR_MASK_DEF,
+};
+
 /* SN2201 static devices. */
 static struct i2c_board_info nvsw_sn2201_static_devices[] = {
 	{
@@ -557,6 +592,9 @@ static struct i2c_board_info nvsw_sn2201_static_devices[] = {
 	{
 		I2C_BOARD_INFO("pmbus", 0x40),
 	},
+	{
+		I2C_BOARD_INFO("lm5066i", 0x15),
+	},
 };
 
 /* SN2201 default static board info. */
@@ -607,6 +645,58 @@ static struct mlxreg_hotplug_device nvsw_sn2201_static_brdinfo[] = {
 	},
 };
 
+/* SN2201 default busbar static board info. */
+static struct mlxreg_hotplug_device nvsw_sn2201_busbar_static_brdinfo[] = {
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[0],
+		.nr = NVSW_SN2201_MAIN_NR,
+	},
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[1],
+		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
+	},
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[2],
+		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
+	},
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[3],
+		.nr = NVSW_SN2201_MAIN_MUX_CH0_NR,
+	},
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[4],
+		.nr = NVSW_SN2201_MAIN_MUX_CH3_NR,
+	},
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[5],
+		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
+	},
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[6],
+		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
+	},
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[7],
+		.nr = NVSW_SN2201_MAIN_MUX_CH5_NR,
+	},
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[8],
+		.nr = NVSW_SN2201_MAIN_MUX_CH6_NR,
+	},
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[9],
+		.nr = NVSW_SN2201_MAIN_MUX_CH6_NR,
+	},
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[10],
+		.nr = NVSW_SN2201_MAIN_MUX_CH7_NR,
+	},
+	{
+		.brdinfo = &nvsw_sn2201_static_devices[11],
+		.nr = NVSW_SN2201_MAIN_MUX_CH1_NR,
+	},
+};
+
 /* LED default data. */
 static struct mlxreg_core_data nvsw_sn2201_led_data[] = {
 	{
@@ -981,7 +1071,10 @@ static int nvsw_sn2201_config_init(struct nvsw_sn2201 *nvsw_sn2201, void *regmap
 	nvsw_sn2201->io_data = &nvsw_sn2201_regs_io;
 	nvsw_sn2201->led_data = &nvsw_sn2201_led;
 	nvsw_sn2201->wd_data = &nvsw_sn2201_wd;
-	nvsw_sn2201->hotplug_data = &nvsw_sn2201_hotplug;
+	if (nvsw_sn2201->ext_pwr_source)
+		nvsw_sn2201->hotplug_data = &nvsw_sn2201_busbar_hotplug;
+	else
+		nvsw_sn2201->hotplug_data = &nvsw_sn2201_hotplug;
 
 	/* Register IO access driver. */
 	if (nvsw_sn2201->io_data) {
@@ -1198,12 +1291,18 @@ static int nvsw_sn2201_config_pre_init(struct nvsw_sn2201 *nvsw_sn2201)
 static int nvsw_sn2201_probe(struct platform_device *pdev)
 {
 	struct nvsw_sn2201 *nvsw_sn2201;
+	const char *sku;
 	int ret;
 
 	nvsw_sn2201 = devm_kzalloc(&pdev->dev, sizeof(*nvsw_sn2201), GFP_KERNEL);
 	if (!nvsw_sn2201)
 		return -ENOMEM;
 
+	/* Validate system powering type - only HI168 SKU supports external power. */
+	sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+	if (sku && !strcmp(sku, "HI168"))
+		nvsw_sn2201->ext_pwr_source = true;
+
 	nvsw_sn2201->dev = &pdev->dev;
 	platform_set_drvdata(pdev, nvsw_sn2201);
 	ret = platform_device_add_resources(pdev, nvsw_sn2201_lpc_io_resources,
@@ -1214,8 +1313,13 @@ static int nvsw_sn2201_probe(struct platform_device *pdev)
 	nvsw_sn2201->main_mux_deferred_nr = NVSW_SN2201_MAIN_MUX_DEFER_NR;
 	nvsw_sn2201->main_mux_devs = nvsw_sn2201_main_mux_brdinfo;
 	nvsw_sn2201->cpld_devs = nvsw_sn2201_cpld_brdinfo;
-	nvsw_sn2201->sn2201_devs = nvsw_sn2201_static_brdinfo;
-	nvsw_sn2201->sn2201_devs_num = ARRAY_SIZE(nvsw_sn2201_static_brdinfo);
+	if (nvsw_sn2201->ext_pwr_source) {
+		nvsw_sn2201->sn2201_devs = nvsw_sn2201_busbar_static_brdinfo;
+		nvsw_sn2201->sn2201_devs_num = ARRAY_SIZE(nvsw_sn2201_busbar_static_brdinfo);
+	} else {
+		nvsw_sn2201->sn2201_devs = nvsw_sn2201_static_brdinfo;
+		nvsw_sn2201->sn2201_devs_num = ARRAY_SIZE(nvsw_sn2201_static_brdinfo);
+	}
 
 	return nvsw_sn2201_config_pre_init(nvsw_sn2201);
 }
-- 
2.44.0

