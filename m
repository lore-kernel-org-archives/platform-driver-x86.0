Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B0198850
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014525; cv=fail; b=ev8e1611c7dPi75yqHhHYZd5H7N+4n2VvMsOPaAgpOVGGMNSYkx13TbQ1ukwX3W2XL1JTPWI/eG4C0h15Hk3hd6JL0q3u2MofVGJvHE0yv88GMMwGjFF672SSasEqX0a2UVwaAC7hIGpSWiuVWuqzDJx6f8vktcjYGf8RA9jHzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014525; c=relaxed/simple;
	bh=mn74NDgOxcRIn3REBF9+4Pa/tnknw/2pfA5WnaAXbv4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cSs9sGYmE7gFVa3HGZvMXxmRtBwbPWAgIz70/3ttTGkuu18xnvdR8kfH/630hnfHl+VtSM7Zou0qkYOtpT8PrCKn4NtqdJJ/tbXbtMZR34YGQ0NTcymj9Jv7v1m6wmUOjc2Bt1QAALL7EzHiE7UaaeEkOXVrt4ufdUMQYWbT4KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HAO7h1z5; arc=fail smtp.client-ip=40.107.243.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HAO7h1z5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEOK0hZgH3XBW1qxeWi+GGnIV7xMJHbGLhTR3L25Rg+EfvV+hoFjmDShlAJzqnjx/rcn9QZBuix+caIhxIfDC+eImLvxky7iBpfOAZCrqPaxMkk6yng89cQhkvWNWCPyyK4NeDMBjEdE+8/a8o/+MEFrVFIq2cI4qj7c4GFSMer0qYC0Utb11/J0AYU98W2R7OnGgpeM3gqBlEI0Cdq6MObxvZUm/L3oKnrHqiS5ozi+2Pxeara2Bo9pLDK24ZwMc/l3V9prd3qZMgv1eYpc/nQk9a+fsWz65f78V2yrLuPQeWmIr3CoNrEKdU1zls9fnv/zKXw11+OoZh1/P22OFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNaAnfqdepDO4LNWDVFetwUAZMfYmfqBejEWo27SGrc=;
 b=x11wVBjO/FINXcuNKVoE4bpLVN1Tlu3wy+0hFxcYEgB6xc3OcOMfXZUsTOSPK1Ru5URuNpPrCupiO1c1e38lRH/mAQ30gGgV+7zCuwHGsUTuJwa1zxLKDfzBtarHM3/aoOnCpPkWMciWjp5OruJ34Mh1qaosMzJhW2AMUlOdpS4X3FUSFUDmjCX8Us9/v0w+lweJg491KyBKw5I8bCgYBawBny1b7vpmdqKoCwUnvP9H35vX/BOgqIe8qn0pNvet0AKYd62cIDM0PNXQfXnWX/uSJOTKuwZX2Ymg2XfUvnHRxnkUCMxTLFIy9LZAyu+a7CoEkXxG56fALM9+V7PsgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNaAnfqdepDO4LNWDVFetwUAZMfYmfqBejEWo27SGrc=;
 b=HAO7h1z5TcLeqspW7mphPIU7iNvuIz8ZSXEbMRpiTIaiICkfcFjJYgfme6kN+Fr4RBaYRQTx60c1Sd4yEtkWCXdAWZg4fZmERurqd6Hcfd6vYoSZEO3oX++wihvTZehql1dwJjidG4RnoehT5AT21WdqynBKsju1RitdwUUCeI4WUijO+PBLefeDxk2Ba75xfbyd4SkVUqPjCu2xSOXJmuI57FnhQBawoyEtqAQEFLMTQJtyd18Dpa44qhXfA0+0+4G8hnMNvlYRiUmtnprCMbKb5xQwcvfubbAQYIA3TV1oshH7FlF2A/dn9S8qWSqo2DTi5smGwkpax4ef7XMhYg==
Received: from DM6PR02CA0136.namprd02.prod.outlook.com (2603:10b6:5:1b4::38)
 by CH3PR12MB8901.namprd12.prod.outlook.com (2603:10b6:610:180::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 08:01:59 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:5:1b4:cafe::9a) by DM6PR02CA0136.outlook.office365.com
 (2603:10b6:5:1b4::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Thu,
 16 Jan 2025 08:01:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.0 via Frontend Transport; Thu, 16 Jan 2025 08:01:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 16 Jan
 2025 00:01:44 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 16 Jan 2025 00:01:42 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v3 09/10] platform: mellanox: nvsw-sn2200: Add support for new system flavour
Date: Thu, 16 Jan 2025 09:59:15 +0200
Message-ID: <20250116075919.34270-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250116075919.34270-1-vadimp@nvidia.com>
References: <20250116075919.34270-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|CH3PR12MB8901:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3bdfc1-8c54-4edc-37a9-08dd36040d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zJjUg79ighRfJWDXgnKxJKgRpyP5XDaOvLJfm/lLr1XCSzv2ADd32/hxjBx4?=
 =?us-ascii?Q?vVxe1tNs3lP+QqVYveOMVNdCgBczB1He8XIW0Snl8q8bTOLh35zwMFK7X1vf?=
 =?us-ascii?Q?H3/5FuW64QenY/FdkYd4zMdpWqzFzTUmhA5ciJc7xxlQ9jtK/m4cqtURZ50p?=
 =?us-ascii?Q?56kLb5l4Bb+H5EvByYGeDixm6DrNitj/3RKlL7NbVmWQmPt7/SuYlT1XL5Qp?=
 =?us-ascii?Q?zJKx2yw/egN4lytXVpb+v4gjkjbGTYjy0K7m2vKqcATMgcX0rPYBn/XdJLze?=
 =?us-ascii?Q?39LfXLJWJJyU7skRhR1YOnkn9WgIPgZqIl+NET9+Et7Rc/YqD2yYMugQ4d0Y?=
 =?us-ascii?Q?1YSUqau4BJfoA0x31P3wsyTugnPXUnSZQvUwetbmZc65Td0Li+aBMLPN/+Xi?=
 =?us-ascii?Q?00EF4s1CELnqSYChaqdeBnO7RpcRS15JD7a3XOANJo1/72PyHxdLTu2gNi2d?=
 =?us-ascii?Q?FZS3ESWtYBk1pT0zdlqlY7FFhim3Dz9C9VpzP3//uw43Jvt4c1zIlQaZB1yp?=
 =?us-ascii?Q?yUkR8nRe/f+WoAx5kpHiB/DMrcF7kZlcFrbfakxGqO67BYrq8Ma6fqUxf0IQ?=
 =?us-ascii?Q?skMYyt0H0wAcCCHdmQqJrTBVZ67zK2NuwXttI0nfhInTePmQN8+DE3QCf6+k?=
 =?us-ascii?Q?DkJmb7N6kZDwPRh82BCq4FibLHh0tfr9TWbYBAT3+/2/bkc3CUQxOllgjXZz?=
 =?us-ascii?Q?MGjl0gg/vKkOMnbLAvGYqruwGZMRSuGDtmN9TLEO+uBnckb0ow6ZGXHzCv3B?=
 =?us-ascii?Q?bxbeHCRq3sQxL5GZdSa3qp2QoNJWu+yIxum9wi0TY4EBN6x2jprxOXQxDGs5?=
 =?us-ascii?Q?SGcfEpqqNjt8wK/YIGsoly0pITUGc2htVzyVV9pu3KGDF5EXOirzwBGMx5w0?=
 =?us-ascii?Q?fB/X1WVbuW2ovhtqUnQbgbtEyrKVTV9zq6DcX0smc7G6nqULDAI3Y69PodOo?=
 =?us-ascii?Q?y/TszgccQzM9Sl9TB/UVgJZDmVF3ZlulyboCh7TEJSvhCdTqVZjegFq7sPfR?=
 =?us-ascii?Q?N99KLZPUbFZOKElgadQvrdFxY6h/iMxpdOVtb4OHz6c2rbJFMxVTa+NwwDr1?=
 =?us-ascii?Q?TDW0GJ5w3S5JRUfhK8nheK3LkWOvq/F9vnl1rQoNO48c4uWJVM3+0xQttOnK?=
 =?us-ascii?Q?7dbn6bQWKbYpzqinWICbTdTkJDOI750HyMu/Mewh1CyqQbPGRnylzyyOlzME?=
 =?us-ascii?Q?dZ1bvIegOegpYI2boENFpHH1MG4z7pbGUn7nS3NaqExoazS2cDJ2iQbStbCm?=
 =?us-ascii?Q?9Bm8i/zn6Egm+O48J/GPQkVmYblMwjjT9mMW8g3ZgPPNI9yMQn7+2FKjOW5Z?=
 =?us-ascii?Q?nmlzI/oj27RuuM5nijNzayXYy5PQezMr1G010TF7zgoKr4Q0foSByol/qQTj?=
 =?us-ascii?Q?zamwnLe13ctFjqySmrenJUjmU1DjL6C7z/fCPGLCx3sgJrsapv2vfnkMa7YD?=
 =?us-ascii?Q?y49GHwkQ14HsdSTqOXBN7HhSfvFU1UUdzGCHGrKzCkJ095zzgoYeDy/K9AkE?=
 =?us-ascii?Q?Ha14xfUccovDG+Q=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 08:01:58.6282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3bdfc1-8c54-4edc-37a9-08dd36040d56
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8901

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

