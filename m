Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415A220E010
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516860; cv=fail; b=hxO6DZd0eg5Ui6qX6DEjKFqyHtQhdvZY3zxgNWPdfze+LkrEFZgADaHEfvIRb+7oCTAoEQub/FKfbmw+JhmJFpPcQ1gU3VHYs82/rkYbrzuhSsrJX523kJS5UzyLXVo+9tAc8Mik/ASHJZkt9m/wIaXImH+0GjupA8uVyzkwnY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516860; c=relaxed/simple;
	bh=9S5189DQV0z2LvCvSA9RTCtxYgi7lqldaGd5UaIgiUE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mqpFjxqXQXI0XVMK8UpPYW2hDMJYM9H5o82zu7ymtsiyOThacVAf4NgS3tlP3p+UnRyk19lrldLlwjD65myc9qYx9iCv8rA585pMcBolrgoQOT7CMLHjn4ncGwY+sx7r43kvbOylP4Pr8BsAmdgjKRr4hsQUsHeJTpT/oOYVo8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KJgdIBq9; arc=fail smtp.client-ip=40.107.96.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KJgdIBq9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXC5IxVxtIopPpXgW9rUkuXXWSPkJzFeS/abdFCMKSkNwK5hqkA9X8+toJr/x8+EI9FAs+Sik+LK8PCuuRaoadK++W5JO88pW/JYtnmVnHAjKzPoiwJq/7lv25oD4+pZTibBWKd9RSjarE4hEUgXaDO7vNWNsUhB4kDO6IgEcC95CqNBMWugtyZ/6VBy8yK27EEk7X1yumXe5kbr2BiRGPE3uoVMuj2dM4N3I2a2iTFrU4nOH6R8R/DHzJWAGIAFAH/ZtaZ6gwEHGde9OZ79kLV9TUb3lKkbK1fduKqZaUfCvS04O3zbWs1XNGU+qnNOfk3MNaRV973qkmxGi0Axwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3rDX7HF8Xww4snxUcOOmIIblXViEYdCnk5v4XLVlWY=;
 b=IstdnkoBjWu5pdRxMtRxwy67PWLFfJiQAEid5kTBzd2ODAq7tfcO3fwv/ZrSPk8dO+eSqR89Ydrlhu0XekAVmRZoeJM6Ykv+FPulFZiyGm6hGdPKMAl/KQOQQNnnxgcu08ssmjVVr9ULL9qOmV6XcKhIh14Zui7hpqUuYIbln07A69TjUA+Iclu85boXnzFOEV/V/vsINsjLoHHxMBmSfa8W7J9+9DLIh+mk+Y8B8VG3v0VK91PHq1n8V3Tj+bZGBRsChvAtHQn3d9y4Q3E/v0fb8N7GCoY8LR4joqRnGUtxfjJ5sGESvuS0020UbHpr5tKXHOzPTDAGTou4EDwKRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3rDX7HF8Xww4snxUcOOmIIblXViEYdCnk5v4XLVlWY=;
 b=KJgdIBq964uUD7+Pp8QCEHzwBMv0a/cDedld5+ZPkAthM6fxV3SZyiE4VCBnKGLz4cOkqMkXfb0r7QBcBdflhHxDxRvisDGSmokWLuwDwijW3Dz4rA8bmmiknLltZR8RIWZsaQM8nBCmPLNdKxFqLflZqYWIcF0sfu91Zm8MwtAAYaGw4bpiO7HNPZInyMQLC5HjSRxMPP9xzoEDo3cnI6DDtHXh57N2GbEKYpWdyoPUCNzQJZtZG1QHLfuWAJACYQ8j4nkSZNCVWkYltXiXt9C9LiLCt/tcwtuqdWcINvymwsS3lL4bz3UIUfxsD4KVyAmInYx30hvhEvqZBh3psw==
Received: from SA1PR05CA0004.namprd05.prod.outlook.com (2603:10b6:806:2d2::29)
 by CYYPR12MB8992.namprd12.prod.outlook.com (2603:10b6:930:bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 13:47:33 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:2d2:cafe::4d) by SA1PR05CA0004.outlook.office365.com
 (2603:10b6:806:2d2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.5 via Frontend Transport; Fri,
 10 Jan 2025 13:47:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 13:47:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 05:47:30 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 05:47:28 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 09/11] platform: mellanox: nvsw-sn2200: Add support for new system flavour
Date: Fri, 10 Jan 2025 15:45:07 +0200
Message-ID: <20250110134515.8164-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250110134515.8164-1-vadimp@nvidia.com>
References: <20250110134515.8164-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|CYYPR12MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: 8689afb4-9f45-40a6-c0fe-08dd317d556e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vis1E54SR57pFk00nYlwOqiem1u916loa4iwx6IjfJX8VxhBk2tAB6BpUTmv?=
 =?us-ascii?Q?wgxXhjdILbiTOmCsyu+UDkIPK/5YsaMxHjdQLOAD+nbPWW3eqgpa6qte3phH?=
 =?us-ascii?Q?HDZ+8KyCPgzGqEyNf4Uoe7zIWn9SA2DK8IIHiy2l0lc0RHqfghKm+QeGFypq?=
 =?us-ascii?Q?OwlqtriwEADZ9MZ/IoyqIX+KNLkf4JEZLxU07cJMzQd1oUXqRYvs5hpZJLhq?=
 =?us-ascii?Q?eEUJgI1Q6lFrWKMoiyv7+cr0HUgahCei8Lheh6AfRvqKxiKRw66RfOT3Cqzj?=
 =?us-ascii?Q?c1a5OqUir/6CoW2zTdGTHoZ0EJfwtr9PCHrD6pHeHDwwdMGlmFixGui3QDjx?=
 =?us-ascii?Q?qpJ+JNfVl+QkLI4nMqBEDuk6ci/s64rLc5mgY1rQ1HCAhBtKY4iRD7xrxJS8?=
 =?us-ascii?Q?2kqwKh6n/46JWfKcZFmu7K8oDgH8+EA+GYEtACRxurqJWOXu0v1XDpUIarsn?=
 =?us-ascii?Q?VHewJwATi0vBSqN2DVL0LTCekmeHg6oHW+dnnYHFf73iZdRhOeCMaiURTA2j?=
 =?us-ascii?Q?3YnHJ+iZ3DNbljNY0F5GlgNvBQK4+vV8fzjPAZ7wsZ7sXvOUAbJzZyMhGQig?=
 =?us-ascii?Q?KPXNA8zbm7aDCnIwskGL5freG2jKalO+/mZF55TqWGgOcVXNg+N+QgmPFePw?=
 =?us-ascii?Q?UovrTFzTfCYk7FMKqL7aCL2FN2inpj2V2iCbv8cIYc+8tjbsoTCk94VaUdH3?=
 =?us-ascii?Q?HDQ3fqrT0qgiNo0qYi5wT/rFTjjJGE8Drr1xZYMf/Ii1HuKKh2a+7WnUDTZc?=
 =?us-ascii?Q?igCCVovlgS5jo2WoUgGLqv+OJyJOmEo+uSkGdtpfZN46Unh+GbIBgLWm+K7G?=
 =?us-ascii?Q?8iTTUYXpt3IYPtNdE5LfH0Gy3IaeekRRtHhtlfi5Cg/CRvY1xe9jiUQysLmn?=
 =?us-ascii?Q?55XmmhT3Ijy5t6SA4yYAoVwKzHKqyBcSpsPuYQtTcUelgc6nIl1RGOyuwKXc?=
 =?us-ascii?Q?ZZbWLIxKGor5h/ijD8D803jTZrvZou+OnhONn7EK4ZOWw+DsqzpM1mO5H7ft?=
 =?us-ascii?Q?4+wpQqz1/0HkNZHQM6Nz/1RiFI60crKW5S5epKR6raAYL+3Kcilh1XovysZB?=
 =?us-ascii?Q?8jM6CyAz5x3WqIGcd5llsMTyM9MBAf/usFEvzdSee+nRhx6uwAVOcLX4jBB2?=
 =?us-ascii?Q?wAhh9CKfMRpxKf4PqcxT2l80i1RfIS13SSXe80HWFlvP4ghnjJhuv9ze69pS?=
 =?us-ascii?Q?gcuA6PvAgJpxD/hR8MPQjGY08/wplJ3GnQyQxwOI0NCM//Pmep5VrVrscYcz?=
 =?us-ascii?Q?xK6G6mHUk50ZTY9svE0sHOdzFC+HcMtz1WzwrivcGBCkFQz1Hl46Ii2kZHHm?=
 =?us-ascii?Q?B6UWtja6zqUsNhObtGLJbxP+bCJRrzKDDk3oFxBo6gdw93mvy/8LD4b5/IY2?=
 =?us-ascii?Q?5z+zhiuJVsQLbBrhF3kzdSPKSuRkhP6kVZrhD+t6b6L3OFu3W/0g3mIPrnZI?=
 =?us-ascii?Q?Co6Gk327NtoRSAHQwdv2rLZha+F8ZrImBnYONcklYGEr0KP2StxdCyFYmk1k?=
 =?us-ascii?Q?pGipZq2QJ3QUoTk=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 13:47:32.9066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8689afb4-9f45-40a6-c0fe-08dd317d556e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8992

Add support for SN2201 system flavour, which is fitting OCP rack
form-factor and feeded from external power source through the rack
standard busbar interface.

Validate system type through DMI decode.
For new system flavour:
- Skip internal power supply configuration.
- Attach power hotswap device.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/mellanox/nvsw-sn2201.c | 110 +++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index 0c047aa2345b..cc8fbb325aa7 100644
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

