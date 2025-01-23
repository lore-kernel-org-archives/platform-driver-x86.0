Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E0D15A85E
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659549; cv=fail; b=dWJ/6IHPfoiKBdyTGhD/s8lzELDm3T45ki+Yw/LT7EhPtKLN00ywyW/P/baafMhs16/wGpl3Dys2fcqWLW260tuktIJ2sdjiH/R/ZINAXh7PhytFWQQ28XmUUzlP9vFGNxFh2T7EQobKdDQBCH4iPlsEg4FGJUQQepLPLPg/m4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659549; c=relaxed/simple;
	bh=/MMTwe2NJ2dBzoLPMbLFS4q3b2Qc9O/wnfTbMHVDEU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UBj7oNWkVU9enIF/pWPEpX+zdGC5iQ/a2i86Qz+pNv30Vo6QcjXUDY1w+3yeK1d7pOKUWXKYzgYKJh937ciEuX/EVuXpE6XUnFrA/JvX0riS1/ueAhBpGRaOCHJygo17H2sWd+qzfdpxjNQ958+Rjotz54KAK+qkjSjb6W0S97g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mx9MU63r; arc=fail smtp.client-ip=40.107.223.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mx9MU63r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/b5izcalTEUfM278qUQqtToZxxkg7vL/mBW5B6lSh34vkAjCQjff1kbjoiRwdQNRL1lh1zshMZGUjADfSG2Az6J53XIbirz5aAxOQnthN6/unOvrLIPwuGc+GkLoIt1ccXd0zkDZV4lN5UqiAFPlhvtE/ovjEnsquYNymNF+1zhozF14ZOUroORtRDcG2YscihRjbwoJgz+Jz16yJgSswDjvxrVI6FuzsW4w+84M+5Py61C9aGPhCrAVqhaHOGOI3dhKkWtckZa5aDERYpaI2W8lbANOKxZ0QSASoHe0u9G4hrY8NKSKxY3kOj5uvmZ/VS+J3b9lO5DSMphkkMTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDHmTWUhglx5Iy2Y/l4UvYLuH30VAmP/W71Y9XwJwkU=;
 b=Eqc679+cWr2jOxMl0yW3VmbGb13LCyy6ir8zEvlsbVEz4YuYYATQ0hyGFc7le0DI/uXYuSQQ9FTMjGxcBNDJxQ7VK/tFhTBrYAY5jFz9c75q7PP6zk4V6jdeT8n7AzsfGBasKvgA14h0UILyXkjYbh6ZQC1Wn4ZVuWuxf88n0ZU3P2dPMEzsvJCJjzspf6ypUFz1t1lQFOOUoSHBs+gUK8sQvdQMaLP9tIHuKJKk7mtzz6F5D10oeOp76ey3ajwMDnCtWAlg2zNG/q9Fm75iNkJB7dnx9SQm1eSEXNH7lllfkueyIox+36fwzLJ+Y+qTwO02Mo7E0K9Q+UCABM6zyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDHmTWUhglx5Iy2Y/l4UvYLuH30VAmP/W71Y9XwJwkU=;
 b=mx9MU63rSavMeuHgrPQCc51QyQW8mk7Fkp5l9hpoTynNylhFxwGPzKlFQ2lRh51OvSG4Bvyy5kPTw9qJEU82OkSBoJ8QI/7DDZuRMdn0jBA15BfzE3HUpEENPpM6foM7+o5rT/AMdo6J/JhIxaWIDmod58aCmZMk0mFhyAM7aRpB+7j0tFy3nN74c8X9/R4KCqZw9j8H1zTy0GdSWi3+A3I5/0EdkqcTo1ywCxY6a9c+rWr8CFrmaq4LQh+IZ5zcLLCwtAAaroWwCH3LdzWkDQl2ju+Cl14T3l/+rySV/aDEcZenzgnIJVG1KEReDOQk78oRpaK73trBjkHi+nTXgg==
Received: from PH7P221CA0053.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::22)
 by MW4PR12MB6779.namprd12.prod.outlook.com (2603:10b6:303:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 19:12:23 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::b5) by PH7P221CA0053.outlook.office365.com
 (2603:10b6:510:33c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Thu,
 23 Jan 2025 19:12:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Thu, 23 Jan 2025 19:12:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 23 Jan
 2025 11:12:08 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 23 Jan 2025 11:12:05 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v4 11/12] platform: mellanox: nvsw-sn2200: Add support for new system flavour
Date: Thu, 23 Jan 2025 21:08:15 +0200
Message-ID: <20250123190818.3834-12-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|MW4PR12MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: df49b4a4-3ea9-4efb-e242-08dd3be1dd54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+3Uj8PtGVVcK0euxKjGR7VXxhCOFJkyjmP8mX/hoDRYscdVVVq3mxMTGToLR?=
 =?us-ascii?Q?Kc6WM3L+zT5qNgVufm77GWoyBa/aMXDRzeyTYETQji1Du7ALkt154VBUJWVh?=
 =?us-ascii?Q?wuc9/fSNca8JAPwvoQ5R0nYK8X8mMy24f1raMUIPgfH8DM+wxRWKPWzJJ4p1?=
 =?us-ascii?Q?IFsyc4JwYgkYBVpj9sXPI4RB97ovFhVjUAErXTbd56W9TGh+ork7r+czBdKT?=
 =?us-ascii?Q?gw1THr7rQ7I9EOR2JswDhWNgPPRUdYkXaMNcoO75MKjtFkECRQsKOkAXDtED?=
 =?us-ascii?Q?7hv4tdNA/Dtwv9IRmdscUKTTBarcvTDE6A+M5907cHv7jsYUN905ZiCkDTfb?=
 =?us-ascii?Q?jCvGPpANAQjWs9ebknOmhxm8lFXJ+1oYh7nthNfa+CGJw/kS6rrmPaMGz1/K?=
 =?us-ascii?Q?yePzFXspY/qSVasD3Ym6rRkV3yF9eeKF8XTS/ACKB4z+B3zXDqaXluIZuLJK?=
 =?us-ascii?Q?FnJL9XX4wZEEGr46UxjdKcYJG2MIpbPpkRXHQ7iXyLuI3J6myl2m5HPYOqQ8?=
 =?us-ascii?Q?eGNdidQt0thzinmZentolTBhB0ov4cuopByQ/ABQI1cWslzjo/JUhLW4yKBQ?=
 =?us-ascii?Q?RdGZFwYjo/SzjWXbtt4SQmyLiDf4gJS5IucnT/PN7WZ0U3P6IcUEME2AzNAK?=
 =?us-ascii?Q?ehkBLcy9x9Id4OOw/V4dVsSPEbiD8v195GuSHoS4nRWsEgeiAwU6SJ6hS2Rb?=
 =?us-ascii?Q?qZDLBQ+NZG8Csf3a8Uk2qqBO4RSxEO6oCJpTDA7cEcNGzse+o6dQImLPqY28?=
 =?us-ascii?Q?O03JiMapiNv/6H8NgK+wxoDeUCtqlbhEnLNP/jk1/B+HcoSaC4J8IVSjhx5m?=
 =?us-ascii?Q?eN2qsCeb6sYQ+gSInpgmgmjVUZd0Pf52EuFt/lJXXEjMHv3jiQqkI51D0CoQ?=
 =?us-ascii?Q?9MQmGO1Vz/knDvzKDIQE8778heLW/aNspI7yJnwU9dB8Rv6YbHNqhmEfvpd6?=
 =?us-ascii?Q?I3nlKPPAZ5K3Kvbs7xPWkUZ2eT4In5lcOxHsVSttBSJSK1v14dimtA6Vh8Ig?=
 =?us-ascii?Q?VfZ5LphiAjXqOs10vtIR/hHttRVUs02xTxDskHv3GW/WnWgFP7ZnOTq8CJCn?=
 =?us-ascii?Q?gi/dqGFPb2aTS4ZNBmHa208UYwY9wzk+qxD5JlKzn9/vxc0y9KcSM90SJOyY?=
 =?us-ascii?Q?MjH0USjgiZ1/ceUjFF7W1iataPZFyB0sR//7FFbna9rt88QT7f1Jpvgmgpd8?=
 =?us-ascii?Q?AEor8aQHPFcIdnaX/04mZD0nfhsGipt7BtvUmPK5dn8axFFOek2y4AJU0ygX?=
 =?us-ascii?Q?vcyl78oRhSQbO9sFVI4+bDjHGPzwVxjIVFQ3NfTX9CIL3a6EHgdXrj7bDa5y?=
 =?us-ascii?Q?SetO0xHvzzesmVeOIW0sUuwqkjFKfzFcZV4z6B2t2i2QO9/OehWnHs3CXCIg?=
 =?us-ascii?Q?XkKr0sb10GpttiEQgHEyUTpF1i3V9gteuc5QLkJO04dxtw1gbMMXm3ss/BF4?=
 =?us-ascii?Q?FCnvSkt60zualRnZ9u2aSL/uo9WBULSpSxiEaMViFRfOCJR0ODuuAFH1Eksn?=
 =?us-ascii?Q?HUga6Fhd3TeAojc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:12:22.2392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df49b4a4-3ea9-4efb-e242-08dd3be1dd54
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6779

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
 drivers/platform/mellanox/nvsw-sn2201.c | 110 +++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index 9cfe1a2bcdb9..c185adfc6ee1 100644
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
+ * @ext_pwr_source: 1 if system powered by external power supply; 0 - by internal;
  */
 struct nvsw_sn2201 {
 	struct device *dev;
@@ -152,6 +157,7 @@ struct nvsw_sn2201 {
 	struct mlxreg_hotplug_device *cpld_devs;
 	int cpld_devs_num;
 	int main_mux_deferred_nr;
+	u8 ext_pwr_source;
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
+		.item_count = ARRAY_SIZE(nvsw_sn2201_fan_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = nvsw_sn2201_sys_items_data,
+		.aggr_mask = NVSW_SN2201_CPLD_AGGR_ASIC_MASK_DEF,
+		.reg = NVSW_SN2201_ASIC_STATUS_OFFSET,
+		.mask = NVSW_SN2201_CPLD_ASIC_MASK,
+		.item_count = ARRAY_SIZE(nvsw_sn2201_sys_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data nvsw_sn2201_busbar_hotplug = {
+	.items = nvsw_sn2201_items,
+	.counter = ARRAY_SIZE(nvsw_sn2201_busbar_items),
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
 
+/* SN2201 default basbar static board info. */
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
 
+	/* Validate system powering type. */
+	sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+	if (!strcmp(sku, "HI168"))
+		nvsw_sn2201->ext_pwr_source = 1;
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

