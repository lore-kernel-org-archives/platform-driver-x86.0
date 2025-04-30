Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F19F25B1E3
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028655; cv=fail; b=uigbRGi3AiCRwPBMfGwMSI3jt97gnCc97rj3kpkFNxi3EXDaUdv7rawjiBWzD9aTcMtNbnkYQwCFg15u6g3QxzVMLzRGKMQ0tUi+JRjjRmHhuRe23XPZCVbpVI+HWFVm8bu7Nzngy0HIigN7QsKAV+PTJUlcCk/qzqJ3Y7tBKtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028655; c=relaxed/simple;
	bh=Z/784d11LrBQPpZ1p6208RXwgte35zfXahi6ZOMWaUs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MR2rErhurqaUTFlByQBLVzUkSSTGDitL0lhFoWX2uiFVpyyfmYovBV1GL1Ii4eJ5FqnU+FeSHmRVfH1biYq0ysmeBX1xwJDBn9UXq2H5Psy50qrG5pVhGbKO1xsQOGoZkXMuinG5JAV2SgYKCjf2UQSHxJiwmGkejJgZzr9+AxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZcJ2DAgJ; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZcJ2DAgJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbsCtpLwzU+1jWj3xMUZYlt1s37xS6UwSbX9B8VsYHnPLS5cGOrMHl9Q5IrRLBRNbwFbIXkrIzBHYc7CWBlL1F11sd7/bQfrNgQUsEvd0HZg/dbtBuwi0wjr82a6uG0Idgl9Laugj1AyveV/0lRpJm9kMBAxlSKffIxCXnzMknK3LZfsQ1TKb6y0bjdL/ZlhASsHlA7GJYgTKZ7gGY69HVcEmEcWMHzPKLkBh58e/Rk3yKSMtFwG8f88PWxkA9UX6Qs3ewWKXZ1xU69IWU28OQR6okypxa9y2/IZQ7D5oDAr9hqBDLSaO0ivhWvultfC7gLlSw3ragQv/L7CFVJBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmovD4mt0qhrxmFq59MWI3XdFkF05bqO41hPKVfxEl0=;
 b=eueqXOb0KGrFjUDGce5KckttPxqSTIwOEbrHsUEHhfHXIwdNZAams2yT+3dL7EgYyaBtFR2chXzX62PpWUbfcN7fmUm3S8Xp3vRUKtamuAkWLS/lvWfSRwuZrRPSFQl9nf9HGvj5C6XIRhIYA+5WSLRI0JkECBT/yokrWmIpYoPOnOgHzcdUREXOYWxqIMGeZLakglLauB/BGuJvM12zHQ80i4niG+yXC8FkMqIQ7fpowD1VfRYzYnAwIQjRlSklXaFSSq9ZY2zscPEEFyeq3bXnJ5XFEejLJ6MJgUPMke+HMMkgSG4KVfLIRtUc8mBFCueJywvXX3Ea49Mv/nUdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmovD4mt0qhrxmFq59MWI3XdFkF05bqO41hPKVfxEl0=;
 b=ZcJ2DAgJKOK2/Ffk34l1yA5sSAFDm5JG+vPW8IPBl4mWhtRI6ceIzr+nE+NJYzdqgfc/DEdz/F4iV5J2OMfmnSCCebxTQaE3hBpNKifYd66qMzNtnR+iwslndrdI5B+xZCDfa8BttfpK7jFiyM0vNHyZiOIZ3qBA/pSA1T/UwiRcRP4OAGHeBRNYJ64dvy9UqYTxrfTH0Z/LgZXxGsXyvEXjo+bH5X0yH5pqpiijqxQavhVjvHekrhsMYpvdZfLazFumYeqTfjzVpeg7jdJYCgxmBI6YYCN0FhH8jeDIwf357y/IZoMuGT0r9tBrmnC70lW9Bsu7mT6RvEutbku2vg==
Received: from SA0PR13CA0004.namprd13.prod.outlook.com (2603:10b6:806:130::9)
 by SN7PR12MB8433.namprd12.prod.outlook.com (2603:10b6:806:2e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 15:57:28 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::6a) by SA0PR13CA0004.outlook.office365.com
 (2603:10b6:806:130::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Wed,
 30 Apr 2025 15:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 15:57:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 30 Apr
 2025 08:57:14 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 08:57:12 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v10 1/2] platform: mellanox: nvsw-sn2200: Add support for new system flavour
Date: Wed, 30 Apr 2025 18:56:50 +0300
Message-ID: <20250430155651.49732-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250430155651.49732-1-vadimp@nvidia.com>
References: <20250430155651.49732-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|SN7PR12MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: f8232b9a-16a3-4997-4b2b-08dd87ffb544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YDFJ/obYuqjpdlUlw1AY9gVjlEWhY0QWjrsXlKi4h/4K6NHdb4D9kIr/7DO7?=
 =?us-ascii?Q?REHaZ/BE8SiXYxObBDAFon2g1JjwoNWclaqY+arXkbhPv9GphYkeZpmK5gYL?=
 =?us-ascii?Q?wkLNIqmmB0MwFB5RVhtQR2tvIuDy8m5ZbNmVL9v49aMtleBT2YT9ZUtV58Sk?=
 =?us-ascii?Q?ZTvzPI6mOrM92Ck7QIE3mlkOlugo8bhsOJ53VEy5DAsR6XTQmi34sjPYH2Op?=
 =?us-ascii?Q?kM1vUL/KvTHVXe/oyo9Iql3ru7QgCNFOyAnrtutXSrpGuY+Gu+o3zwNqSSAG?=
 =?us-ascii?Q?usJWYu0HkaotbRAb/99EkWv87YK1JwIlUCMQNJjAu9ujdhGaIezQoKrWcxal?=
 =?us-ascii?Q?20FLo5HV/66oaNCz515yaihUXd7OtPhw9bGmBVOGstQuyxegcTqilVcG4fjA?=
 =?us-ascii?Q?GxUdT1Lea22dNCH7OwgSQ1fB03R0WNJqxrwo7/lenuKLP7jQwkwIkkjFPiKi?=
 =?us-ascii?Q?hx60EKmdtTWRggX1QNQQxG0HCh22Oq/dn//jGAD9w7U2holxBKhSkDpsNBPo?=
 =?us-ascii?Q?362cj3k0tEU0hinra9jYyjhva+VGnXsYM5YFLNjKWBvI6UTBmvSUJMvHOD2W?=
 =?us-ascii?Q?XLLMxT78Ivmy3v43E0nI98mISRVPstXGn5Zs+4z+7moASUAYbBFIFgwIAB3O?=
 =?us-ascii?Q?aQV42HduVESbN4M2ozwJNCzE+AfLtIiGnXF/n6hmd98+wRTW2xM/C5ImWB2/?=
 =?us-ascii?Q?SyujHyp5P/+qcQTzOknA0tAdNwadscEkgci1u8fxarlytDJggtBqr38LctCC?=
 =?us-ascii?Q?tR3nq8KNlNN5cT9KKGsukyQsTC7YAvalcYroljKLzRoKAADwQ/gohx3A5Dtp?=
 =?us-ascii?Q?zPAi+MdXHVSUSj7aRR45lkNAyiXv0cQ3PtyZlxzlozHQjoq/dutWPG0t+Fzp?=
 =?us-ascii?Q?2ZCWFV5RGtC/tx9j0UmPo6zYOkoOEdDhADCRfQe0K3qrMFPeBqg1yIx2bUIa?=
 =?us-ascii?Q?b1+/FQ3/blA2f55OfJtr1eXKIbO1H2Iyfy2MQCBSNGVY/kuKZVmSgWiC/dfU?=
 =?us-ascii?Q?Q+S140oGtPyeKeOgH+s97na8vXXCZpHW1z57k3LbDVasIGzc9L9kfOVbv7/A?=
 =?us-ascii?Q?V7As2/22tJFYmssFqZIFpGk6j/x6bvx7MiDbP185jNWKOMVc6zMsY6fhjEbe?=
 =?us-ascii?Q?CPwpyFIYi4GSX8RJXsZUQmJkSLKIuEiWGTJE+C+kNYY/YUl8aWDnQbqi6cPs?=
 =?us-ascii?Q?2vRrFMnxkPjvHgXSAP3CrueC39c+ItKi2IUNQOXPDctTaFO+tOHAx9NP23zT?=
 =?us-ascii?Q?7vBI3wkCcPi6yNDYUw6MEF14DefSSIVfxXPbjbgyLaEdsQRZIMYwzJWR8c9f?=
 =?us-ascii?Q?Br8YYElQ3/47IvggMF9waPQLhFX2a0CGqWw7bsP9ZnlwvwQw2dW/OJaXt57I?=
 =?us-ascii?Q?nDERa385d1+IyMUm6QiB/Eluu/0MV83hjIfVLkSBErXay4AlBYsq+3OVB0td?=
 =?us-ascii?Q?26crJlbzq27Xrcm9xBlsZYBfcDpe9p1AmTcHsjtgW7wIMVKBoQ/Ka2dZceFX?=
 =?us-ascii?Q?5KsNfxByuiwgFmFEAaYPV2wtgClJS9UTVA5d?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:57:28.2530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8232b9a-16a3-4997-4b2b-08dd87ffb544
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8433

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
index d0e5a18c0303..119be6b51da2 100644
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
 
+	/* Validate system powering type - only HI168 SKU supports extrenal power. */
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

