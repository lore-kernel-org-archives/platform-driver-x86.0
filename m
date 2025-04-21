Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26E1ADC93
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2025 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745227403; cv=fail; b=mpE8yImex6pIxK7Ag9HSiVqJzA5gOZ709DOoloeFAj3SJ+2Bt6sDUhJL8Ap4a+87xFG8j4rAYajZxjh5TAh8UGSML++HNjsL/4ZZQ8JkZXMlc4det+s0EsKywuaYa2DPiEoo9olkEPvGN2IOHV5jPxXbm1WhvkzOLqnzXDFyh7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745227403; c=relaxed/simple;
	bh=JaGLhY3+qRXv215pS4GYcg+x0gRI/8fejYAu6jhDli8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CQ0rknE2qNRb77WNQ3LnniqUwhigvMsAA9Hl5mhK+2JYiQvObqTZ54Jp27yUOQ+RISvj2xrfx5CkZayFrP4lzeDsYQMwC4CSZNOvRMzYu5OKfcYfh7PF9oelGyGYsQNDR9tKPgp405wDpA3aooO8OVDxdPMS2xK3NQFqswe0v48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Td0nyTkq; arc=fail smtp.client-ip=40.107.220.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Td0nyTkq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InxZPmTtA6aKjvB/KGm5KKRwwZK3LBFPiZsdze0y5voI4wRgle9JIk8vgNqnDQg6YXBlOZ2VPkmsBn8LtZVPm9EjneCS2+F5rgxpMyisUJTTmvXv30540HH/kvm5sIw18hnJ9mrmDK9qgdyX1LZzzbGe6vSAgzlxgXWdR9GoDEHtqD50cqJeXAFtTXaBXDozJ9Z4YBAw1CmFUSkeRDu4oR+XEIwECCAq6Nkhh2EQR7iQU7CyGdY3tJZaNcOOZv4w1AfGg3GA+20Bzg9z09XpXnNUK8nEfj8L6nKZNHgmNSTmyfNpXnmRXJeFxvWLfUMNynya1iqEjn9EWzGojQGMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nL/xxztiCm7I+BTjVQepUX2HzWdE1lqLOSssA1OUokA=;
 b=BO6PNJdXFYB4F9/VefpoyBgUdzWdc3laG3Z/wsP/M+AT/1T2UOLfgWEUxX9hw7375R0JfcmtsgsZ/SExvaenbeK8vzHDXcmqbRUupNP+oI90u9yyzHHUQXqfmtKGgDYUNNGmER3w2IayBPB6xWuewFLrhm8AhoUl4VRNfkqCWbUgLm6DYbZ0bzq2iWvi4cEN/QlLYtqmwvK55v8ET5rwbU0HeYBN/fux3fhqDe13o/2Rt2++/q5CJ/S+solG6wGN7C7XIGWQGLvDjnll7MtdmwhVSRktbFaxOzAswxx+5Eu4mabSUDBqFfjTpzY2MJlXxbIGrnDnfag+IKte36GFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nL/xxztiCm7I+BTjVQepUX2HzWdE1lqLOSssA1OUokA=;
 b=Td0nyTkqczjiXhxLxgcKMa4jnN3etMvfHsEhocqU7ygL8y9ZIFadbkHaufoyP6EZ+qaWDrpLxPHf1vn+sx4PIyuCZ1dMTUIxmxMCN02zrNSs4Zz47OhIxi/SFyJEzrA1lJx7mfpf48eszeM7QQViDbdYW1jLPFRTQ015nHIqMWZha8wveUtuAlM/XwLxsTgj2MRDDMesDE4K6ADrlxOU3q4clH3fMO/CvXG4RkhIP9CM+pl2v0cucc3f5nOLDpenEUEH3IfpE0uuSSfYA3mQeH5DVmkKsVHh5KLqmWlWdtLLEsDzvY71NerrjRNqchvaNk+BRzhz349xEFUcSkUwAQ==
Received: from BL0PR02CA0142.namprd02.prod.outlook.com (2603:10b6:208:35::47)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 09:23:16 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::23) by BL0PR02CA0142.outlook.office365.com
 (2603:10b6:208:35::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Mon,
 21 Apr 2025 09:23:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 09:23:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 02:23:00 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 02:22:58 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v9 5/6] platform: mellanox: nvsw-sn2200: Add support for new system flavour
Date: Mon, 21 Apr 2025 12:20:50 +0300
Message-ID: <20250421092051.7687-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250421092051.7687-1-vadimp@nvidia.com>
References: <20250421092051.7687-1-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 460ede87-58fb-4dee-4ba2-08dd80b625f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BcKrOzGEkiGu1HcfWEY3dlNzRyOeZ5EoxzNhnNjf6JPCihbZo6AUNaQ/vlXD?=
 =?us-ascii?Q?6lDaZSSRI+FOQPPUNLVVzRjKJh8VNfVG5eHxAb6Sz72sfYZ+g2gbnr4dIj3F?=
 =?us-ascii?Q?meuaRn7e5mDquhn9lYH3hLI5xSe7icXFmKqp0IiNo5eR+ljEx3kOm3KuQRui?=
 =?us-ascii?Q?/9J05dwdfl773cezAeQ9lVK4fVlSZnKPb1qaYdNuRZqHw4fXyg/9WR5JnrKf?=
 =?us-ascii?Q?YM6Gbm/U9E13OfS1szNID5Uvzv2VY1RnvgJhcXLseCvH5WdjxAFIwsQwPehz?=
 =?us-ascii?Q?EHPeZ1YwCsFUfcX5EXUBfW95zcTLMnQff2Cz3F5k8FTv2cB5pWb91Yy0/h0E?=
 =?us-ascii?Q?BlDAhKXMG3ovW9XZ9iqjE4hoRJIu97doUgTmAoN2toU2B+VZ5RLqU4/miVA6?=
 =?us-ascii?Q?FZ1ii9DorX+i184d/2k/1QELugOAe3SjoahehQmJyxeDx3FEHwKWl8r8hLXZ?=
 =?us-ascii?Q?BvMP6ITdla8O5GfX0RdzKVnFSmuSBN2hZMF5CY9hIjyVtXMOe/xjeQrJjUW/?=
 =?us-ascii?Q?ScmiiO0VfMkYDb3D5g+oybhGx622z3pr1dEslIWn7J2eQHofM93agV5SHmZe?=
 =?us-ascii?Q?zjRABj0VUI6h+sXlZTEG4lKF1lYYyEUcIPTM1TH2llIrESWgbB2mpQWNYLoB?=
 =?us-ascii?Q?Q1iwChGUQpZcowC3YeAWfwt923CpcYiBAdc33Ga96BUd4CbViaf0P4kwV+lU?=
 =?us-ascii?Q?8+pUKLBRxGrNxr4S5gBYwVaLS50WzIVFFnN/uftUhUuT6jNk1XymtHsyC53O?=
 =?us-ascii?Q?WctScJ71qCUrLVN8efstPVynk22ykZNcQ0Ak7JcX+o3l2a/6wSMb3gQkrbwE?=
 =?us-ascii?Q?hH/rT4wVDMF8yNdmFZwuUAJMVVJE1p0xYopQHtltehigE4OQtyidCyaYtIX8?=
 =?us-ascii?Q?QnIbJPi9ytTWedGQToocZSs2pVk3QfRo1HhynT0QekxkjhGkPHhgBwH9jbNJ?=
 =?us-ascii?Q?Cec2bdZdqCOese4I67IDy7m7kSXRC0tRf4iEsCwOKAHo8Ii6TWRqPTXFLsaW?=
 =?us-ascii?Q?aIwMRqXK7M/c5AeO0nByDZAzB4YBuFzncVrh/yFZ9AtxQUOaPlyiMZ+WEZlN?=
 =?us-ascii?Q?f5cscDPMVVPOoDpavmhuemPPz7MID2H7CmXldS2PazAkJiu7O3WGZd80+kbJ?=
 =?us-ascii?Q?JMrnXBmpS6JlEgNyrmexrvyMj6WlkK/b4FxdUi05k68ZYjLWOH20OaudnE9D?=
 =?us-ascii?Q?ic63xilcdR0hMz/7nnECRQ86SD/wLXwHL186yGE4LxkbQ/CwSM2DIoSLfYwY?=
 =?us-ascii?Q?g3JfXD0N02VW7yF52a1P0IYNiHgM5t9IquwFAFTWbdZkMRk64RkOkIe+mNKj?=
 =?us-ascii?Q?4z4ooy6zPTpYzaRzhCt+kqdoktjzM2+rCRP3bD1npwhkwRKM1W93ZKZukxdm?=
 =?us-ascii?Q?3KZOYxHyxCc0G73HH5DpX+j9hQ5JGRzteZWUetwXFH0pEPMR2ZiVI3Ztj4CJ?=
 =?us-ascii?Q?y7AtaEzdq+cM4mKxRNCd1h+rj0sthveMI+RyvKCZgzRBZyLhmkUrn++Cq3TE?=
 =?us-ascii?Q?W2WTw224NN1j7YB8Sy5yKk2O+ctafQ1jHXcn?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:23:16.3452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 460ede87-58fb-4dee-4ba2-08dd80b625f0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560

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
index 451d64c35c23..dfc673327201 100644
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
+	if (!strcmp(sku, "HI168"))
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

