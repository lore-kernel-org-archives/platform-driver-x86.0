Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0927155391
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 17:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739838; cv=fail; b=FShiEToBQv9/5xn0PCcWAlGaQ9GhSoPnBLPxQrpowoOJcOJuVBVGdMuZabJKLTA2HjXGYIuSrnnh+LfzzYwbqjkWRLpY8dCsmMZ31VaOOGwZL8d+QUmd3DFm0pswRC5jLjEVwEDsRsLwX8yPfGDvTu2IUs38na9xfpWZTp28DI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739838; c=relaxed/simple;
	bh=SP07LcVvag0JzHU9wPRmT3+fr34szdAkotYTXqRyn8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oK6pQ/Ki+/e/Xmi0vBboC+FxNIGkCZA44pJun8oMuCB1M8g3JsSIWf8WNDk8UKXEULErwZt0LWAyduk+/11Nsk1VnfZxndgMGpZFiq5n2j8cjBNcc/2xfoWn4cQGpH3kTXA2xF+SLYi4SJyo2UWv2fyf5lifZqYiR+YZP4dV7Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cvGoJars; arc=fail smtp.client-ip=40.107.220.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cvGoJars"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5TCvoxHM4ZZ4SdsbswVuRoMcxN2wDEWLr72NGdhyZPky6GTgyGgnUVRToOrZrByMgS25Zt/oSDxth9GsYXq/kSa5x9oSU2c5GIAk18Xj0H+5KOs3dUK3Ip1ehGtGX2nm6O/s/ONpfpzKM20q/Bcc+8N4baBZdXhUmPw+lUJMUQLGPfUiHhM24DLVNd8P2xGAP1blnsoR/xw4ePS1UUUmhY6KJMcy4vqmWY6rEnsKC51dZJhQ53rzTJtkORueKbrbwusaRuzY/9SL/jS2iznXmYfYO9VlhjjLCSeV/iMaEsnu5nAUIzJzNvP2x2FgxSXbhkUN3CSMToC+NwbXTlimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnDHEwDvUHN1kXbhrm7a0xYekUybZCY3/GRcMEPBYxk=;
 b=IrOEcvYZCHY490hGSZ8KEVCE21ND9aNeN5246y1njBwQNxKork7MtCjs6+ueCQmYHfYX/IHoQTEGnDVk+fsCJn4NK2zEmEgIeiwnvBvKf9o/W7ahxczRrxtxz9mmc5kHWEVWcFd40RLnFR4Sjq+ukjoUNIVqPRbM4ento4qAnrYoOgHz4TmxHvOfvR9APLneqVGASYYXBCIcHUTRHuH7NOZjMCxGtth4U7VJ/VgEh5YRR+3MEMjIJyuGDguUE4K6WxCFpVYq4/vkAXs7sGlxU1+HnvGoSjojFlzVfkg3gy/SaXzJ48QzDxpeIfBkcbfLCLkcBwT1Y76NA/6QbGS74A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnDHEwDvUHN1kXbhrm7a0xYekUybZCY3/GRcMEPBYxk=;
 b=cvGoJarsg9mHVulmkbO6kPr3zRGvojDkRXL0uZyxZ36IdravYrZZ7jf79AIO8WaqPwhunJUj2kQyxXEacHroD9U5qzPTkhNu/BSG05PsRwVJK5utF/b56hURUuKW8mlNwmg20PpffcTRNSym87cYSM5qX+kYqUUzFh5hpBpPitEfMaoYizNcA+qgF8ShmIs9EfCAi4GMddCbrwQBI6tyu7E0xbttxzyEZGB39T04r23w6lQjIDbvuD12R6it7l5wH5izuK3UGqFrhmFb6nE9/aGj5KqZtcyn0a5rUCAXb+84Z2UwMuIo2gKo8y8ueLN78R3jQEiocOkBrs4f9yLRTg==
Received: from DM6PR07CA0069.namprd07.prod.outlook.com (2603:10b6:5:74::46) by
 IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 17:30:32 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:74:cafe::32) by DM6PR07CA0069.outlook.office365.com
 (2603:10b6:5:74::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Fri,
 24 Jan 2025 17:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 17:30:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 09:30:13 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 24 Jan 2025 09:30:11 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v5 11/12] platform: mellanox: nvsw-sn2200: Add support for new system flavour
Date: Fri, 24 Jan 2025 19:26:29 +0200
Message-ID: <20250124172632.22437-12-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 87643ec2-7bd9-44e6-23a2-08dd3c9ccdb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QI2CHBv6QvAIh0vW1Ez9mNRc4dZe2CW99r6PBr9aNRwlItro03Aenj8Tj9rE?=
 =?us-ascii?Q?407uWplrL8v6H7xBNkgWLoZV5FwnKzlewAw2GIgo1Gh5w6fG38pvqCORmo9s?=
 =?us-ascii?Q?lp+6QgwU65JjiDCeVIr8XlajFPPidjQoZdBiHmkQv4LKUvxNCbXApyyapOeo?=
 =?us-ascii?Q?QFz4HF2cXBN9EVd2QVIQRi2b7m+XZTUpO0ozlomUNMizmJ5YR22YdWRhZ4nJ?=
 =?us-ascii?Q?0VrMQgtU67klpedRV7oT6ujWcpjAO+mLrdt6mrbQk3n55/L6Cl0dH2pZqttG?=
 =?us-ascii?Q?XyDcljivVaQkqAQR+iwsIG6ceByh/xxODYnFw8uMZOTMTJYjTxQmdsMnF1Qs?=
 =?us-ascii?Q?R1QUpfxPG7a/PtT6h3oteHbW4i96NALic9UYskpSQRy/GIFC/4NGIO03K/mN?=
 =?us-ascii?Q?ivoWNKwar1Ntln05dFtU/SeXQya55gLpaph5OLrpA7rMcz//4XsP88qqURTB?=
 =?us-ascii?Q?MekxIoXLJq6VuzAl7f/FAmmi3daEgW/krgsYr+uYrcqtvE5tJoNZnh26t9dk?=
 =?us-ascii?Q?xHxeSmVUwMjwO1ORTxc9FQI/1OBDKMCdYtDZJKAb0CkO34FpECoLw4foPS/4?=
 =?us-ascii?Q?ZoO7YwoJomgNb5wyhT+EhlSPPouo6Pg0rO9V5R020Q0THMQyZg8mXbDh2jzp?=
 =?us-ascii?Q?18/vP9sXr+SnJ9V24yR/hIhSN4b3Qmp+GqfdPq92/z7gDBaNKpFZkDFwo7zK?=
 =?us-ascii?Q?9HjnezpYua9Vvphl9dJ6FW6odhw6r1FO5XawX+wH2vhwPWPBoVv8/TevDOF6?=
 =?us-ascii?Q?sBe5ZpvRRIM17bDck4IzGzr9UDKE2cvbxQ5KP+pejj5nGilJORQdN9uOUCe3?=
 =?us-ascii?Q?3XVDXQnjquwqTo5FrYpEae8+7DcWkFh+m1vmfjcyc09OB90Z4X4zILzNIjfu?=
 =?us-ascii?Q?ilxsyGUGqv9M9m17YPZVfblJYJVlyFlQz0yH9oSgANYzg+Go/CI5w0WoOg3k?=
 =?us-ascii?Q?gEIrx551cSU45wSHzzOLWy1pw4QKZMQiK3venFTxY2c6rkB8A1c/OcDLStAK?=
 =?us-ascii?Q?zhy0QidS7Z5O8lsCotDWyPc7OthZxx1z6Z9boqA/53CBHAT9eqPNrU1JbywQ?=
 =?us-ascii?Q?W9tUC3/fZ6QaYZaI/MnpDYO6pOIXNcbBfL72pXl7KDmKwLYr5go5NKMKaEdl?=
 =?us-ascii?Q?0vr1gT3tMEcBQbJVTOeUOdxlacxElLnifJBXbST64xKBuD7OiQruQIzlZ3dy?=
 =?us-ascii?Q?DrPqLUckpxb+mU0lya6R/96Lieiek7VtQuzUUW4qLcOKDHGuZH8JmQGd+/4K?=
 =?us-ascii?Q?+jZT3l6jAUOdYvVKCNgq9l//WwqNvagdPQKooYvc8byeR4O0C6wH5hvychCb?=
 =?us-ascii?Q?0+Gs1wfvo0SQOk+gfsEOSNbfDoJeArJPO5idXi33gpdfLf0xO3ZvAjaD5mXq?=
 =?us-ascii?Q?btApbHkZZI88AUYI/rUbSeAnCG4chAvpifhP1keUlgRJ2o+nsG4FcA+ef+bP?=
 =?us-ascii?Q?rcyjtvXFugvR3Wf7SXZIpKtX5KQWoERP4NzAecN+Hf3u4AFPUe/0SZunRFY5?=
 =?us-ascii?Q?qjMxp8Beja/yTs4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:30:31.8731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87643ec2-7bd9-44e6-23a2-08dd3c9ccdb1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649

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

