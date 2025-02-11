Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F8D1F12ED
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265721; cv=fail; b=mDhWAiZFaDyCHiKnR6ISn/zHg+3f90Zi4VwhkwmPLFTdrWsyR6WkZgIbp2K1LEmXy1LdVwhgS8eLXaTwqVX+nCGUwpFGIkN8otDqpOBKIRbA2OCwrxR1nZFaiVptMlFWzMc89MPKwj+j25elAoTX3bg4ofhmBlxvWp3e9HNaBv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265721; c=relaxed/simple;
	bh=SP07LcVvag0JzHU9wPRmT3+fr34szdAkotYTXqRyn8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=noNC8qrB6hWXAP5bVJmYCiJIAR4bGjkiwYBnAfPZmE8Mfs7U8VF8o68iCvtxHVbc3Oijo3gkB543djxkrb6S0J8GNtQhU9cU8YpS9zSOHFUZcp2tglwtz2u20BxH2Gbm4wS3KPGjGVqYs8MzsvmAVHK2nEvuZ6G1qlviq9dxyXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qrwVIL4U; arc=fail smtp.client-ip=40.107.243.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qrwVIL4U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6zWeZFKoC0xuH70ajM6MplGFa9tfdyAQ1LLvdVlJ1Vx2Rzh0g/lCbuoliRrWR/a5GzOqoQ4JAebAFtEU6B0tgzCuAhSqtCaAQtweJwnnTu/W3qt1oPa5rIANH+M4koLS+B+YbEuSFPzrPKc5kRwPFlWiaqDUeiCjj/IqAsWPclmM4JR+eYK+f5e/Vpga4n4YnOHMqibYsbvo/7LA1LeIWAgo+n0J2L0UzLbWqwt02Ja9sjsqIpf9iQUthOUj8IpVqTx7XIDKErUbp7/6vpChcTX0qIuwmEeA1D5RS1zgl1qU8Dwj38yoeW9zFDFbZ/3tC0df3h+BkCjX/yZhpVyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnDHEwDvUHN1kXbhrm7a0xYekUybZCY3/GRcMEPBYxk=;
 b=cLyj5tXLAHy09JsZHP3b5QePcekVlCDOmbOOX1PmXthfEFCKOETNPvWNxZnvDmt0FTBtz41L9P1AZlLdEOWPG7GonAs2o/mx1z0u+0mHRv0OBPAZo8PK+ohAjnP1W73aeMX5Dm/77A/+GKrMn0RPxDbk2EpsxwQbdl/X8Uhc+hD9WgbmvQTCVU9aIF3rQYxLif6osoyWiEVfxsxUWefr6vjazz9Z3MF1EwcsGSaNWgmCJJ0Wevn5Odu7StdswLRNJN4+kx+TFj7724+f9AEIVI0G8zGcBOMYFXjXENRzjeexQoB0sh3nxN1MHMhv9VsByEoHXw+DEA09FpgEz9iDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnDHEwDvUHN1kXbhrm7a0xYekUybZCY3/GRcMEPBYxk=;
 b=qrwVIL4UmllDGQ2F3bONofB/ayIuToAxvceOc3fYCO5lFu9Ve/ewTnygV7K0FfU9wVE6UwdNcQvIf5nLZenhVy497BfLeHsLm9ul8fh8zr1dFp6n9JKRCW/B2P+7i5CG6osDscPHbChl4eHByQTqOmbSQ5u3eMV4BD4OUG4bKprX7ImE+FvlPy8gsld7a+VPmqECrSJIdTwb5/elCmm/1W40dCISRE4LawJ/g/Tzf4vqJzmzACAk5D8JjmTgfYPy+zpOaOsxIy8fHPkX8AmsxQ0iEdsf6q69dOhJviVfF/QDV0iYrz0f3hSqAZR9kYAXptnhluhaZROkKF7eD1YKpw==
Received: from SA0PR11CA0183.namprd11.prod.outlook.com (2603:10b6:806:1bc::8)
 by SJ2PR12MB8927.namprd12.prod.outlook.com (2603:10b6:a03:547::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 09:21:53 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:1bc::4) by SA0PR11CA0183.outlook.office365.com
 (2603:10b6:806:1bc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.12 via Frontend Transport; Tue,
 11 Feb 2025 09:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 09:21:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Feb
 2025 01:21:40 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Feb 2025 01:21:38 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v6 8/9] platform: mellanox: nvsw-sn2200: Add support for new system flavour
Date: Tue, 11 Feb 2025 11:19:11 +0200
Message-ID: <20250211091912.36787-9-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250211091912.36787-1-vadimp@nvidia.com>
References: <20250211091912.36787-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|SJ2PR12MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 08699adf-0f46-4ae1-7b32-08dd4a7d85ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SY2WHFCEpGAdHEU3jvb6mNGeL6jEVwbnA7jGRZZr6TXFada9Uo1AU5Yp5YQO?=
 =?us-ascii?Q?IuYPWFV+tc1WFh+2ek6b5qy5Z2OIanlugMSs3VgYUf+2OFEKpV+YLkI7GbA2?=
 =?us-ascii?Q?gkYystwofObnSe/9PGa89xYB28dkFx6Drc7drkfodssAwxM9owlb9ccYVQTN?=
 =?us-ascii?Q?RfZZ3KJaNELMPWxa+ym3Rng4vh/9nVvR3gG0skCOKLIkcwZ8CLg5Un7tgej/?=
 =?us-ascii?Q?IPU7xUY2UkGmXmPx0oHIkRm2OjQtaM6T1i/PKlMowSh93EM6t7KK2OxoU4kU?=
 =?us-ascii?Q?iyDQDCBfiimloxQQ5X8S3EMu6et2VxgWxcvW6b+4j0otIrVUQXD6VUr++Fjg?=
 =?us-ascii?Q?tWAAE2pwr7rsGq+w+zWlXS+65b8f7vLntPKgEmA8la/yzZuiVeuIHnFiR4n+?=
 =?us-ascii?Q?X2c61ompP1KBgqmMgRs7awXU7dvHn2WhWt0Y9MZy1yMOpqaY/Rxgj//D761H?=
 =?us-ascii?Q?0n4KJLNCisr4HAjTng74VaM0nl99ZbBShH76Sk6xsl8HeLLh1Q881XsBRBJB?=
 =?us-ascii?Q?/rytctzXkqgIbSxo/M5h41sLpik8pFMfmV+EO2jtCCrmcXf1in2URCR1i8ch?=
 =?us-ascii?Q?BwNA85rk2uIOhpFxGiqa5fhyGp6D9w0FKOOQRNM2kBUIUpnBZzEgZX2ch1sT?=
 =?us-ascii?Q?EFLJeuvPKbwyV5Za0YeREZJlsSo92orKk6kyBLvJ6IsU95z5BfVHdAda5+HD?=
 =?us-ascii?Q?p/XZaheih25dKUESJ0I4VLQWwVI/Krh67rGY6Veg7wMyBxYuvvTYgmBNbhJf?=
 =?us-ascii?Q?Kl2g8iXCwpInek+ZQs4LnnsEbekyntxS02FcVYVKxQBVOG5Ai8pDF+Aiyu/d?=
 =?us-ascii?Q?4avLUQhE7i3XONHxKdwnj+u4PceI8gvFk3mKesQmPn/1YL3d6AWqEnk9tWzJ?=
 =?us-ascii?Q?Vo65NQqBOnsVNoApumVkE+lyw0Vq6POaSHKjVa42e8pcDhV0INf/w4vLm6TN?=
 =?us-ascii?Q?lvMK9saIk4ZEGi+ly46EysB/y7TUX+YMUJfRU+nNYX8m8wsrqN5grWUeOzhH?=
 =?us-ascii?Q?U5SkHzTVTMDBtBaE7sFwdOpfWRK1MG4dxuL1WXjaeSXEH3l5Pc5SiAEb11+B?=
 =?us-ascii?Q?dBxolXn/OWJtLinjlsDJfwO+f1ye5juCESvDxkX21aMdENP5iu5pn6aCK5FU?=
 =?us-ascii?Q?ExPEWjKjEwmmSGJj+4PYrgUpWcD3i64hlIg0DUHaJqvUerOwHahmRvx//QzP?=
 =?us-ascii?Q?k5ixR7JDpNs9qRoPmhGsSUMrLhn28Ub5ZEugEfjrbGtCaw/bInOoP8DL6YRZ?=
 =?us-ascii?Q?qw6SXy5ZwwWbn5Jw2y+Cbr+919WekqcBbnGjfVsx0/bzYbRGx1/Cl4g+zjYs?=
 =?us-ascii?Q?TByCmhDDDSpk3R+b3w/opFggzCXHS35L5wY7iXafeM9w88Lx8WaZeJtYE1Aj?=
 =?us-ascii?Q?ylF1wuJLdLCWCCVqCjpSpCKwLdZo2Zoxbc/55F86RHJRlQsYmSsgmv0JGDwM?=
 =?us-ascii?Q?qXGWmdFxI3TL0z9zo63bjHu4k1bB19JoU9PTDnWAl8nq1wU/cbe8uDpHX+Da?=
 =?us-ascii?Q?xtqz7xq6p/MdMpY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 09:21:52.9244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08699adf-0f46-4ae1-7b32-08dd4a7d85ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8927

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

