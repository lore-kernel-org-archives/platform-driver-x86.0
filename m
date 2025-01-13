Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165F6249F9
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757975; cv=fail; b=HV6v5oX/ESTpC8sdM+H3CntqLBjIRqtkvfFLVeuqZo28zB/72WX/vSMpuTe9vBbfG8vItRC56vXziMDDNPC8cjQh4gB4HglTWJvopoERXmR6p582UH8Qvnw2PLhBrt8djjobkc3TK1s1WKWWAEmydTf7Zvq0abggSLhbKPuDHdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757975; c=relaxed/simple;
	bh=mn74NDgOxcRIn3REBF9+4Pa/tnknw/2pfA5WnaAXbv4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HpZT75h/utvxwLeKLsUX+PcY26OwE1tJinLODXYhOFSDXh1WAk+JUBeJeeirPdZAAIB2UqPmQ7Px/1MmFrwFe0ibvG8REHBAEFLCBTSuZiAs6CDbAx2+QFH3Y7WelMbo24lRSWAnHNIRqIj193oExMhZAgrWkSEhB5WwESaaeyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=okYUHGI8; arc=fail smtp.client-ip=40.107.93.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="okYUHGI8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8Nwp87/rr9jY8D2cO2MvgN/hjjpRLhq+RJDon5858bWHVia53HntKtbeDc9eRmXg1xolOdkpOM3fw/gi+jqKY1fooQKXXtbttyoxAVSkGqJojzb1wu6vJ/ljiW1PFfgJ96MZVpTQe0hxg1fTR0zW/fEAPqfXKT96Za6+6Oe6I2zJ/MNmuGhmwkmHrfQTsoGrSKAYuHUdBPyEig5lSXJgkAdG4bSZsSu4WdjOZPYgO+1Wo+jlS1nXQ+yR0UzJoEhuKi/tXNMjiOo6B/vZhbIzoQ+wUVCkZ5Sc2nPEDZk8/2kJ6YtTf2zU4QHG8WQdhitMrq1dKh0Sm+/8H45vfXJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNaAnfqdepDO4LNWDVFetwUAZMfYmfqBejEWo27SGrc=;
 b=kw5Q/WKmoeSJuDxxETzA5pAIFa/Zg61UjS9mbaTPFxhYRGRipOxMGZUX2hUqKGkda5T5fXeXw7tUW3Sum8M7y/SSolkLrfmH3q5MGuYGbTx5pOBBZXRtwg4V1C0FpcIh8568Qi7YUQvxbl++fiVwMmp/OOPXWyPlnP5ixr2qt92jHa3jlTBbOThb+GGq8kwUiqL80fxixQMHJkLTAXtIs/mG6A63Y4GNn1Wg2CguGjKdRHk5wnQD5LFtTa0Edpx1/eWvVR5jn4jKtIf00lnUy9ICQjwLXBQvChJAAajTfilTa5NJX4xKUwcv2+NSd8nVKyi3Nb5JLXuo9FplF4P29g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNaAnfqdepDO4LNWDVFetwUAZMfYmfqBejEWo27SGrc=;
 b=okYUHGI8+8SWTbktZ+Uqhk0y2SD0AkeUR60+p+HDS1fbxZJQEin70ulQQ2XRi1c6K9xOMxA+kvkGPDBnegkIf3Z9MZLw/lYGjTQtIsrT82diPh+neLXaVOwlhru5Cff6He0KcYaO5nKrg5wL4aHg99mU2HhzTu6bVCssZweHL8JPgguRrGB+f0hGM441VpThWgbekh7xLhrITVRUczflWMtufDtEE1R2A5a0N0aqgkqcCKMw6P9Jql8ObxwsViiRHaSAxwr0+RH88jl5H+sc1rnsJAQw5BPu85WS1G0OCNfpLYaz7tmUFzqaaMduTr8FJyqPpGWdSQvOympnOi9fUg==
Received: from SN6PR05CA0030.namprd05.prod.outlook.com (2603:10b6:805:de::43)
 by IA1PR12MB7496.namprd12.prod.outlook.com (2603:10b6:208:418::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:46:10 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:805:de:cafe::9d) by SN6PR05CA0030.outlook.office365.com
 (2603:10b6:805:de::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.10 via Frontend Transport; Mon,
 13 Jan 2025 08:46:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:46:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:45:54 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:45:51 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 09/10] platform: mellanox: nvsw-sn2200: Add support for new system flavour
Date: Mon, 13 Jan 2025 10:43:31 +0200
Message-ID: <20250113084337.24763-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250113084337.24763-1-vadimp@nvidia.com>
References: <20250113084337.24763-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|IA1PR12MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0e01fc-ef88-4595-d8b4-08dd33aeba5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wKy3GHIth1uODKWm+Wim/ivLq9GW9dIj0j7wsjX4f0rA5V8zxvyK0DBiQv8k?=
 =?us-ascii?Q?pZVDacFozI5+t9CLBPxUnwa0fApB6bCFSCKF0ZOzL4taMe2+NpaOy6pFLOrJ?=
 =?us-ascii?Q?HPNToZReds9vb20m0u4wojTKhpQ2qyXqfxuZoJtWXjhJ7J3pxJqM1NUdLF2a?=
 =?us-ascii?Q?N0v1e8hRzpFpcS2E2DYMHfrgIGzGLE3oSr1TozeNgzmIpDvyFMkfrK3zuzGE?=
 =?us-ascii?Q?RFXwFxH4izETgPyso91lI4l6dDyWo/nIg8hmCrUaFAGFyxpQFQJOhlIBivRW?=
 =?us-ascii?Q?EdevFjIMyv783+RY1Ejl/0xW3pWRXAeXDqna0oDxLt57Vk9cS2fhZ7R/yq/L?=
 =?us-ascii?Q?Jd/jZZXkcwDrjhkcBdt6ivEk3WnClzHqrfUNdQ+5JScVmc42smumUaCn/r7k?=
 =?us-ascii?Q?A0gmusDYM89hW33TzhqdbDZq2OTlipKAzxIcCkMenfGNLgL/1tk0Z7DKIgTv?=
 =?us-ascii?Q?8QtanKhNd9CxZ1YuinxlqDdDQYrw9ti5SXhgI5+ICJfqhwG8y2VvQWH/kf5+?=
 =?us-ascii?Q?IaZywH4z43c+5FGaIMMh/SeUDIX//GTd1+SgABzgnWfwe2+wR1rbZEu2xdtu?=
 =?us-ascii?Q?7550+0LUUqSGuEh7deG61H+1V+T89Gcbms8pJkXq/sC89ZxlfyfSiXACNrrp?=
 =?us-ascii?Q?5kowpMRrWzrH9rfP4Lxn1ocibE5JJkIqAhHP1uorDUlogUCtk+uAF60GywDf?=
 =?us-ascii?Q?NoJH0uD7V9bjKNgAzh5ymBKciHTWrWZYM/owlF8eN/i6LMIDaYXG4Kd5JGpG?=
 =?us-ascii?Q?1qcWmrU3TRM8iQzdbrya021nZ0nQN8xv8mqcc2irCIJ7vyqAZvaXRxkAavVi?=
 =?us-ascii?Q?dyDG6o5+LxAd+TbhjTHvjf47d2Ap0de4cKL739Zms0WoybtTYxbwkRRvAkzs?=
 =?us-ascii?Q?PiBOq9AUqU7di24pggxSY9DtNlrm9upBOC+IEIdOjVBIwO7ZENsmJyXHKdvQ?=
 =?us-ascii?Q?B54nO1Svqw1dEgwHPP1KpV7A69mckzQQSJElqk8fveaR/sUqoNYrguliSbhN?=
 =?us-ascii?Q?+njh1/8BaMP568i9BzvQLJSobTIapHGJgXyVG9PorXvTCGN30B8a1xVdXroa?=
 =?us-ascii?Q?CsF5BuJiEb/EWQrTICFuex67fFwVYzv3QRyxtB2UfIBeXAcc/8ul/SRDqpY7?=
 =?us-ascii?Q?XJSNMhCCc3LTR1P3XeUMmdTJPUuhG0wxDbPXdbIcL6jRHxPd6H5vovDBRMuc?=
 =?us-ascii?Q?AtG6aSK5X6Mg/DYnJXBKG4WWU7WYDrPhmvCFi9ushBXnacZcp6VuJREuhC58?=
 =?us-ascii?Q?+8mOW5/pn61bgDHgF+xDh0AJ25yALkDpvykr2lEpuM0zufgGGfshTRSuqXw4?=
 =?us-ascii?Q?BzOhMle+vduvcp0ZhTmA0G4ZT2NEYQjybvSUoYmt6NRTULtx+TtEAOWLVBXX?=
 =?us-ascii?Q?Vj440DdpKwSTsUqBvB9UVgDpUuqVVwYPNbK0C6+SVBYohpq7JMO5EGO/Bz9p?=
 =?us-ascii?Q?dUm5844K6sddEY9iTp9Y7PGws36u41Ov7ww58hlwL5psrA0GEMFJTBRdZUvt?=
 =?us-ascii?Q?um//B2HX2X/+e7s=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:46:09.9045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0e01fc-ef88-4595-d8b4-08dd33aeba5c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7496

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
index abe7be602f84..a6f982a8e874 100644
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

