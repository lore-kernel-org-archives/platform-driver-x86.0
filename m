Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2075.outbound.protection.outlook.com [40.107.101.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746CC18CC13
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Apr 2025 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744449671; cv=fail; b=n8kDaOREDwnXP1jsY0aLUzqhtvXTjjHNw/4BR0+kLWucMPX/JL8dGFcxhLHIfQKp2umPd2gYbOdTJBmnua+IaliArV5yOar9uU+LTBk258eOj9owofkGAn9qqWRs5nvbPWDKlgn0k+DWuhgxL+94lWpXqH4Va45pMyPt+ZX+7RE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744449671; c=relaxed/simple;
	bh=SP07LcVvag0JzHU9wPRmT3+fr34szdAkotYTXqRyn8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KBoE9LvwET9Kwi51Vd1FYpF8A9IeZXeRru+Kgmn3goATG7l5HMaqdQcFreKsaNTOcVe0cRDf//3BUMFfdgcgRsMKsGezCzbfXHZs51geH1MtsxiVd6lUhTsuA0RYe2QKyUptrKZmmmgakFrFwgCMLzjnDiyIpc1dr91ysvSN6bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sfjjyGo2; arc=fail smtp.client-ip=40.107.101.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sfjjyGo2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avXZyhZ5qnb+zjrZFvPVYZIa3vs5PUdKY25trW8bIDKbYa3id0YTIgxW6X/3AIEJHzLLjJ/ELhyHpTWWufFpjt9XMfJQQoA+z0kMe1jglhGtecSi1+D3cDH4X8whUkaDhEG8eUaOOHjo4RuzSVjj7BcEeFDv9Cu1cUe/ecMEtpxx79Se8YYJjEdnQVyGTRb/aUjczedwZ0Y43kAycN58cVoeL4tCWTcEbNHOijYHiJ9PBX3Sob6U0Xe3R+fT4E0sKTBcTCqjnV7wp/w1rIMpirfQQg1izLzQionTofjUPas4UexIZSRh7kFbDdiaSn8+yJxQEUV+vbfGT4wTr1+TqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnDHEwDvUHN1kXbhrm7a0xYekUybZCY3/GRcMEPBYxk=;
 b=Aztqw1xrJJStLGZk5dTBHFxr+2sWt45dha7+nHj5X9ZPLsuyTOF0MgQONFVBb6fj5tCWpsj92mKbUkPCc6xxUHXo3UrOZZgEN3J7swfD2FrlS8VxYwrh+XU64AP8dMiGFxD8vcuEBAJK9HRWIMcwERG5tvMNQWbosVV9fYC0RYcKZDimBHmifd8s3P7GBGeZRqS8UpmmLPSiXkn+DuRzgJUQV79F0B6Qcre2Ucg4OYy78POhg53F2sztLvJ6NPrZA+qimzyUwvHjide2HW/e+2gxqEi1CAPL3QL49QfPF6EentLvqsAnELvwlqL3g49b35C2+8TP6P5RkFU40/4I6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnDHEwDvUHN1kXbhrm7a0xYekUybZCY3/GRcMEPBYxk=;
 b=sfjjyGo2EX6OVN+mhyjtsJQWaHURsHvsBJGyWIQUem9OB/xX7EhQNyd/PjfhU5oLsx1IQ9PpDBj6058xb36sTdgGm4Gan3NcLFEIFvABB4P/Yp1rbJZAJ6wG2yqpb6+qiDZ6yGiB+VSt1YGGqYneWWKNLCZgEVC/Ix1pCyd4shGYNd1BtJZBDyr92ZcdHNqb1cGw30+lI8wPmOGm5tw+4EcoPVtpWmzZrbaMemUniOd7QSz9zUtFFl8eHjJ2wmVdG5DM7OXPLM/Ej38GFwHb0TLaU5VahNBI/bqOVEo0Hak8hJ5Xh2Y3xRcLWh2PoA3TZW/PjNhMWJEsMkrUNa3hFw==
Received: from BY5PR20CA0030.namprd20.prod.outlook.com (2603:10b6:a03:1f4::43)
 by DM3PR12MB9326.namprd12.prod.outlook.com (2603:10b6:0:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Sat, 12 Apr
 2025 09:21:05 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::ea) by BY5PR20CA0030.outlook.office365.com
 (2603:10b6:a03:1f4::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Sat,
 12 Apr 2025 09:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Sat, 12 Apr 2025 09:21:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 12 Apr
 2025 02:20:54 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 12 Apr 2025 02:20:51 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v8 6/7] platform: mellanox: nvsw-sn2200: Add support for new system flavour
Date: Sat, 12 Apr 2025 12:18:42 +0300
Message-ID: <20250412091843.33943-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250412091843.33943-1-vadimp@nvidia.com>
References: <20250412091843.33943-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|DM3PR12MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b60cdaa-bc8e-4a2b-aa12-08dd79a35a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0bXgzSxQuVoP7YDXRPNt+BRCCZ1L9BeMFEZwdxk8/mzevOvesuiyqg01Zt3k?=
 =?us-ascii?Q?bl/XlhknqXXZai0DKm0E5iACc1wcN/obdi+Q6gik8bNwF7vs38vAdKbSUeN9?=
 =?us-ascii?Q?iOxrju20k9dsWU9fngn/36l9XZ1SV0DvhwCyhr3rEwcXVPauvSvYx0gW6Dco?=
 =?us-ascii?Q?1J9jidt8gqlPJNsGq6OalO6v8O2kijQ/UAw1usklSD0JoeYi3eM1PDNQWpbp?=
 =?us-ascii?Q?AsK8crzDBMmmynTRy93lo94yYS2ByJQVvB1jP8WUHv4Fh80FknoxFJ7mfqld?=
 =?us-ascii?Q?reYUwdS/wfWPnaClAC49HkvEcRpLZxooEJycBLyFYr6keB8RgsPVHBWspOjk?=
 =?us-ascii?Q?BG+pCaSumZO3oYo070qrANNCFuBdqBFPw6ZuJsFuDFgxyX4Lio5LM0MimBMI?=
 =?us-ascii?Q?nYYCKqZPi6kB/Fi2weigKPLoB1IHzyHkXP4BVIROkczpIDBSOPAKsFasMY/J?=
 =?us-ascii?Q?wavKR1AoCXsX6HShErMbyB8rGdLGYT0GUsDQa20PJ/Sf8pIY9KHf0m4qirDb?=
 =?us-ascii?Q?akb64J2JeRkyVuMxqZOYMYsTEis8VOJIEgfztOBla81j0wHiYVroFLj1BBpi?=
 =?us-ascii?Q?wJThw73dtpFa2EOOt7GwuBfP7xRV6MYMi9owoglYBXlwXqxJNNgSAbDoS4Q0?=
 =?us-ascii?Q?3ibb2DrpTQ7uWiBmamqKQKqn70NOVtj7IbTadv6YPPYIP6/M+7Xd48IPctO9?=
 =?us-ascii?Q?xUlRPWVqmEXJpDZCOJSldfqZ7ANWNOTVL0jujFW0piB62Xyk3fvfxzVpbO2s?=
 =?us-ascii?Q?11ZwgxXqNRk6TaSplvN5j/LAfWytU6EweGA6YnYcDaJJ/+llHOb15Lz9WO+M?=
 =?us-ascii?Q?gTgf09xyVOBg50tmfpiAbFmaKfknFo7Onff07RBKF63mfCYxd4JrS+Rs9k7u?=
 =?us-ascii?Q?e/HPFodr85a3Cm/Sf2mXeSMIwrcC+Et4CSXgl12BV+J6hkyPsaGLt5DI4I4P?=
 =?us-ascii?Q?GLV+GF818LEOwp4d+3igxhXJw18WddZjy2ZIcVipT1zr7ZAsbvvwb0ziIZYP?=
 =?us-ascii?Q?sODnlFeHRnKq4fg3dcYxkWaJzX/NIUejyF9UrOzdIYiBdYJWBrL8bZqQZhWc?=
 =?us-ascii?Q?e4WrScmWgw+KpMdQaTd6zUwtS3CPLNSuq96/IXaqeMpwwobtHjE+3AJpDExr?=
 =?us-ascii?Q?lFg7Wr+k+TjZlBSgnIIbDHH82KR3NCfDJLJSncaTGFb8i/f4Mo2EGUkfXICk?=
 =?us-ascii?Q?VPcTW4N1GPVLkYq2mNSjEIUcJA2BbkblSuBQr0aOIvDcDcDsJwRs2ChqZy/E?=
 =?us-ascii?Q?n0xcCaWXNpcMWiFy08Qwvvdkwx+bpKOF/IeubxUdAnm8F+ReHCguD6phW0ER?=
 =?us-ascii?Q?LmjlckRL9lJ6uqYSDo93nl/iuWMKoB+FKZifCjzuBn7lx6gRG+FbjozTRqMO?=
 =?us-ascii?Q?DsAUwbHGKkKYVg+MP+zqFLxMtdzNsA88N3GRLWky/1anbTpHkMeZPiRkawjL?=
 =?us-ascii?Q?IO9gWSuGcWDmKhdgD0h+NzygIrU5sPKYCRW6xjMvplRCZq8o5I+z+vZMOHK3?=
 =?us-ascii?Q?LBQiK5FH+ukrahPyBm87NbbIHAWkMTi2jY2h?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 09:21:05.3555
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b60cdaa-bc8e-4a2b-aa12-08dd79a35a1a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9326

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
index 451d64c35c23..6f643e6ddb99 100644
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

