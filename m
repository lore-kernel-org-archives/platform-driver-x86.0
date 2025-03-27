Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2070.outbound.protection.outlook.com [40.107.102.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EF71C6FF7
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093689; cv=fail; b=rNT2L3gzqTvjCHl+5ndk2dW96yB9P77F89Tnm+1BG12y+8xLL/T4OeyGQpYFPef4Sq6Mgd/ommS4ASqz6+h2J+e2imdEo5p4GwhUo00ar83C9DtHl+1PvMkZYqXza6hRhG+gMTsX0iW199/uGEdR6iHjFdCGHZQLqLGTGER52eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093689; c=relaxed/simple;
	bh=SP07LcVvag0JzHU9wPRmT3+fr34szdAkotYTXqRyn8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFRl2V0JNd5Y4BQx6qQReQfN2LBeNPxrk0Q55m4M6xO+stNpxSw34KDn7TO3YC/TttdJHeRGQNW3Vq0DY3CfV7jrvITQwl8scH9KGPtz2C6jy24FiJVJKQc6AiUNMO26r2U1nRlnbJJ+9BGVV5JYY/BVMrskmNu4Xfl2ICsIyig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DVVlK9i+; arc=fail smtp.client-ip=40.107.102.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DVVlK9i+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rk6dChmxiF6KadywdOvp9eC+doQJ6YLuUNtLmPyeTMloo9GW5IftTMA6GZ76i/1OV/57SaMvhG8+zs6CMwqDBU8tlMeg3zQkNPG/5fEjGPu6/l5DhIXOAv82A+0sJmhQ1GMlv7olfLiYWjUt/1eVKfMvXci+U3NGE5aPFqG3oNzhALe2V3guXBfTAUuUeNKWTCof24YekxpxbFOq4Zg3ayOXfUaHNXwwwD+qwXjjD6Zn/yZ2Vmr6unjohjGWPVs1IJsNcsU7PGn5v0OQ+YLP1OwgFdRJHocW6GD6i/264RQ3b5k7fljrCYP6z03g6VMeFkp/blryCOZC+QyFKFcVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnDHEwDvUHN1kXbhrm7a0xYekUybZCY3/GRcMEPBYxk=;
 b=UAhuUvkmuAHpTcksfquMuNJZ/bBaQeRNmSWPSTyUnh1ny9XrQh1W5B8olCS8a51gm63PWMV3Yinuj0xuM3HxYLfI2UI7x7tfjEhLzbxQUqnaRxqHoDOTg9mfT1LNcEVpYVrpiHae6qmQ+4uDJZ6paJjPsdVPTFnYq8eZaWDWuB02mwEGrPb/L7T8MvzlnfbeKhNBPsPWxe6mLf9NM+FuPRQwnrtAhw9/jpe2j0ZyF5W7ZJmBIpYw5ZaqM9CoTGFOxrVzXBdZkP8ahNncmoV0MBy/cbedNCJEqhT5sDLUBKDD+7I1mk1jeE/8pYVn1pfqnhKzimry3+8mat5M12tJxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnDHEwDvUHN1kXbhrm7a0xYekUybZCY3/GRcMEPBYxk=;
 b=DVVlK9i+x19AyybL6MbN2Y9YvFN92SWJMViNUKRS/TyLUIgxCCXJXgE7i9U0kIk6in4oY/BvRwZ8KdUx/HRc+O8AWvEy75NoqCW8NgxT3dNIwt7dIVrx2XqZdclU4Z0BlSc++seeQADnl2pBhstZE3NDk/X9/I77ytBA8y8aVFFCcfbzQqhZHfkK1FaVKmKgDOfzTN3z64KK376tBXkXB30XH2TWkM84rYD/JcyaXsRJ2D2uPPATKBb6jk0pP+EOtsiWTPd6kf0Oe5TAdvY+ywCdnuk1bYwznCqqdVTIT9bHJQDRKFnYstKDXGNSRidKHu+9WM0wXFen2SuGMjYSbQ==
Received: from MN0P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::32)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:41:22 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:208:52e:cafe::26) by MN0P220CA0003.outlook.office365.com
 (2603:10b6:208:52e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 16:41:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.2 via Frontend Transport; Thu, 27 Mar 2025 16:41:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 27 Mar
 2025 09:41:11 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 09:41:09 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v7 7/8] platform: mellanox: nvsw-sn2200: Add support for new system flavour
Date: Thu, 27 Mar 2025 18:38:54 +0200
Message-ID: <20250327163855.48294-8-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250327163855.48294-1-vadimp@nvidia.com>
References: <20250327163855.48294-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: fa4192d2-1475-42fc-f2f6-08dd6d4e3511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/L3EiH8mHH6xEDkrukVV+jbPSSGiNDuHEcO4MHnDakX/92Vn9ib9yLlJRbOX?=
 =?us-ascii?Q?4H+22hXNuVuRaSBSFB+avoXecmj8VC0msjYmnhWeyoggUhEuV32gLqOO6Gdh?=
 =?us-ascii?Q?T/Yl7/2IcZha8CVYE0oMFcu418PrBGBIbLoKwv8dyysIGrjPKFDMOHsGtlXt?=
 =?us-ascii?Q?zbz+Dwxdvj+ww5I/98BpqYygBCjPWDb28C7zuaO/k2UrBqrA4dnAX9l/4WvD?=
 =?us-ascii?Q?AwnNchULB8b+TppcAh/ngQGhCWdjUHj+lzZUVXH2e9c7eFGjh/7gzCYtXxVI?=
 =?us-ascii?Q?G9TCMl63PZc0EjqwO+H2h/Zy7SE2CWdByshYoC9lKwYrjdFCMC6qrzLJ4opK?=
 =?us-ascii?Q?iEyple5G10an8WQOcZv4biD4PY5icNBXo1A0xYlBHSXkFHewZ7YQY0chsou2?=
 =?us-ascii?Q?Wl/cVquLF6V9D3h8wUP/bOCwi63HLGou1lcVs3JDA+CcCo4HgxNzT3gRktqg?=
 =?us-ascii?Q?Zly7vfqHKc6FvOIzeGPlk8JKa6aQK+ro9YmbjF2BsJdF1LN92fu6PS/fwBab?=
 =?us-ascii?Q?DaY+60udllQlh9kppbt0s0XONj9H8OHPOzpIAoQq1LKodaLvzU2xP9JBz5V9?=
 =?us-ascii?Q?g2PLsOeQWD5qL4crgmsDQqa3PlcbRVRTPC9DSKKV4At4OuD67T2mexs5I0Bz?=
 =?us-ascii?Q?IFwrrmC5eIreVvJ0LRZ7bWRYA2gzM5AG1ehdlzBZ3eN7xmWy6Bli2tMhDhSG?=
 =?us-ascii?Q?A5TJrcOJBTN8mrIuQFUt7uLB6xMxfwWbBDtQ+Lgr2EnmvlVyha8Tc6h10wXI?=
 =?us-ascii?Q?qwzxte6mx6tmuMzHvKedq4CPILgvF+ngbbjlX/jRRNkmbaeQHPmclANiRhOD?=
 =?us-ascii?Q?CQ8x8LqtM7HqbcWkSzhFibWq1kEAOcB72JHyvQ3Zs6jfCml8VAKfjvOJuGUt?=
 =?us-ascii?Q?S1Zi/wSL/W81i4zDbUqB3IHsSKwY2H5tfcCL8Oq0G5WwoGZa+h9RqZy6eFCI?=
 =?us-ascii?Q?Zvdm4Pq7VUsR6AEBhHbrNh7Xjl0t9Otsf2xJcZlEZV3okoMpVdAsQSIpqYyq?=
 =?us-ascii?Q?rQc5ZcCsqBhgCMCjdua+HlGmoqvlFaB4abzhJcbcBnGuo/GfhocnTc0wa+zL?=
 =?us-ascii?Q?Pd8XwImOxeaVnMz8mr1iQy3CMLM+9lYXuISpP+jPFnI77Q7eW6It1V7/rb7T?=
 =?us-ascii?Q?sRdvzR+YpGxXXcW0f44mi0mz6l2gAPtBK7nNqvn4icabFg0+9F2AL3R0k9z5?=
 =?us-ascii?Q?qdIIsXT3SktQlkfJtFrCicgewKadaKRynm0ARhqlT+dh9WxRznkKc3AKBiVC?=
 =?us-ascii?Q?MLvWlE8TfbQHIRMTj3pLraDf8BNXSVw46vvSoMnjObJNuTwolJwoTGMihUbd?=
 =?us-ascii?Q?UhbU1tCPfVFZDpY8n8Fv4R0uE8F83bq6lWD0P6Cz3te6CLf+iQyVqAT7yCNs?=
 =?us-ascii?Q?5nB2zviZate0BvDk6w0uWxkXwQ/FjMA7P2ZFjkvTKZJezUsEUpUuYH6FdlHu?=
 =?us-ascii?Q?mbOfBt9OADBTrq8p6boVI1wQjy/nUKOWfDp0y/VXA1No5p1l5OusSHeyN4Lf?=
 =?us-ascii?Q?WCLpUFPFjJ1zyhk=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:41:22.0392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4192d2-1475-42fc-f2f6-08dd6d4e3511
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219

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

