Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0DEC636CC
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjBHGeY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjBHGeX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:34:23 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E064390D
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJ3wTnewQv5JDzEK7luJFRSvI6fP50g5jZkcKSYldh4MzAL/LFgQ9CgrjYu3lUchjwBxZzkIns1Z6vZch2uxp4b3jwlDAnVuICSyN6x+kUKNhhZzhksDUeFOxBUYcg9drhAwQ7ohsF2fJBVvx7RoYGFnUbQx868nqZt4ekwldnKICYJewiuQOJe3tweAsQNIeDqF4Bckr2/Z5uiNP/0+oWCw2qBrpmDrgYjvMP5/3X7Fjoz2nsiUTw7C811Ju9pf3GMRloN+6oC2EvlHKBgr7aRfpQvpkB8/8Kb1aWKlzCaAG7H1un6TWQDgndoD7iy3BNLfAtyD1H+qOBnGvGRdBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFQWyNggelTX+arAvbx9+D1Kch9ioV0sSdhv98UCrgA=;
 b=NDN+oAYZM+EO1Stt7Q1O5vPntcHb6W2+vmb8XwcsGi6Zk8qVDGIT8PNqm7g+6Y4uS159lXN0PdCPrdQ5eOFLgeL0FRFNrfIlF6kmda8lF55t8091iIb24Qi8nY9YkOBXJKUtY2cGBPbUZIb0qaZPPXJJR2ZdGr33tnFhblu3SSZK+qNCp1VZgMQwX4BjNeoekyosfH9YNZoGexfuDTvTROZLDj7PT6RfnkEaq9dFtg8KLnpIIpFTbu7ITQNYjc9llUc7feifNKH51czTbWy6iQDP+h0ncS3YWOetxr5d0yNmvvB+7KTj51cu4uacNUfsV2N24MPlgkT7DE0hVBVgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFQWyNggelTX+arAvbx9+D1Kch9ioV0sSdhv98UCrgA=;
 b=iQjYVBEpRVN4KnOuElptYVm8twOu6GSv/ddAUXlnybgOaZvKjz+gNFSAB8ZGGtMKtV7viQ2XIYtjK2esEsc5x8oZqQeSTsqQ6ZPbV5EVyeCs8bFbVNFa85Jc3NmTDK7ELGEKC3gozVkPIAw9FVqFvXNicRihqyynt00vexsAZAppNSkQnKFSMV5ZsbnR7J1vh7V/P+eQp45IzZEFDxv0J+nMthO6IYySL8s4nu1FAz35h5q35dPSJGB8OyK7auyZaCkiqInoPw2c/ir2vq2q9jx8W7k5+/H//3xOHK5YRHM4jvA6yKeC5sMKNoVSNJG8+NYDJHo1EIDIflMXc3Kn2Q==
Received: from MW4PR03CA0223.namprd03.prod.outlook.com (2603:10b6:303:b9::18)
 by BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 06:34:18 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9::4) by MW4PR03CA0223.outlook.office365.com
 (2603:10b6:303:b9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 06:34:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 06:34:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:34:08 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:34:07 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 04/13] platform: mellanox: Introduce support for next-generation 800GB/s switch
Date:   Wed, 8 Feb 2023 08:33:21 +0200
Message-ID: <20230208063331.15560-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208063331.15560-1-vadimp@nvidia.com>
References: <20230208063331.15560-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT040:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7469a6-1b90-4580-fc9c-08db099e8165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4cJRGE3kU0cZ7mOgeOOCGFzFyRXDfx3rHik/0hK284tQFH9vx1T7lY9JOu8mAmb3wgz36Z2MwLY/UDcuYSV0JPaJ7bXoovrALciyTMC+zlYmT7tJ7nkG0FpiPXW6X4dXmKxTjaEiTeRFClX6qoPMJLbWnHoyWDhBkRwGQQzYNammAbQHoUB3xAjT1O97tIXhjIn6q6UBKPEZxZvITiGq9rFgtVZ8ojrvVxNZA2WqkD/PqvtBxKoGeheoUUP6cyiiQVmO+IcrCYQzE4ZwYdjELvC1MlyYxErgrJKWPqcFJ6OPv8LjCudWiQSfZ6io7sUBMmTneXtSANu2E/+PHTJwEnCJ4OonU5J592iWFaztihb2LfkCIsyR21jKaDcEF/C/fn9eQcz65dN8XB9hj8FuqC7Elja8htvNrI8UVBI+6cY52HNAgeQ7UioBhjdZabYpKF5HrqYFTQ9eAlyvfSpKSWPTV/YgIPsTmutT0/0AaZzT7N00XG+8z/7IbJ2Ay3zOZLv/bQQfcn/hJUzdIRV5/ejfuiFQRn0Y4tq9Xl36QxiDmjqidXhDK4J9o28Jm+hlKUIAJbFP7kVnun9EjhdrL+agHBa7izqzNJXxdPmF3g59X9/gIjYBH+Gf9YscBR7IamLjE9GlMwFFgM6sapLEd/i0iYgpBEQBACWn0pmBYogY4X1B2LZZBH7F2rXrhTvL5YCdOyrcU4rmcxxEvNboCA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199018)(36840700001)(40470700004)(46966006)(82310400005)(54906003)(356005)(1076003)(8676002)(40480700001)(16526019)(186003)(316002)(86362001)(6666004)(107886003)(7636003)(82740400003)(26005)(478600001)(426003)(41300700001)(8936002)(336012)(83380400001)(40460700003)(47076005)(5660300002)(36756003)(4326008)(2616005)(70586007)(36860700001)(70206006)(6916009)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:34:18.2547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7469a6-1b90-4580-fc9c-08db099e8165
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Introduce support for Nvidia next-generation 800GB/s ethernet switch
SN5600.

SN5600 is 51.2 Tbps Ethernet switch based on Nvidia Spectrum-4 ASIC.
It can provide up to 64x800Gb/s (ETH) full bidirectional bandwidth per
port using PAM-4 modulations. The system supports 64 Belly to Belly 2x4
OSFP cages.
The switch was designed to fit standard 2U racks.

Features:
- 64 OSFP ports support 800GbE - 10GbE speed.
- Additional 25GbE - 1GbE service port on the front panel.
- Air-cooled with 3 + 1 redundant fan units.
- 1 + 1 redundant 3000W or 3600W PSUs.
- System management board is based on Intel Coffee-lake CPU E-2276
  with secure-boot support.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 180 ++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index e629ec8a2a2f..cd7f6ff11b1e 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -253,6 +253,7 @@
 #define MLXPLAT_CPLD_CH3_ETH_MODULAR		43
 #define MLXPLAT_CPLD_CH4_ETH_MODULAR		51
 #define MLXPLAT_CPLD_CH2_RACK_SWITCH		18
+#define MLXPLAT_CPLD_CH2_NG800			34
 
 /* Number of LPC attached MUX platform devices */
 #define MLXPLAT_CPLD_LPC_MUX_DEVS		4
@@ -503,6 +504,37 @@ static struct i2c_mux_reg_platform_data mlxplat_rack_switch_mux_data[] = {
 
 };
 
+/* Platform channels for ng800 system family */
+static const int mlxplat_ng800_channels[] = {
+	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
+	18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32
+};
+
+/* Platform ng800 mux data */
+static struct i2c_mux_reg_platform_data mlxplat_ng800_mux_data[] = {
+	{
+		.parent = 1,
+		.base_nr = MLXPLAT_CPLD_CH1,
+		.write_only = 1,
+		.reg = (void __iomem *)MLXPLAT_CPLD_LPC_REG1,
+		.reg_size = 1,
+		.idle_in_use = 1,
+		.values = mlxplat_ng800_channels,
+		.n_values = ARRAY_SIZE(mlxplat_ng800_channels),
+	},
+	{
+		.parent = 1,
+		.base_nr = MLXPLAT_CPLD_CH2_NG800,
+		.write_only = 1,
+		.reg = (void __iomem *)MLXPLAT_CPLD_LPC_REG2,
+		.reg_size = 1,
+		.idle_in_use = 1,
+		.values = mlxplat_msn21xx_channels,
+		.n_values = ARRAY_SIZE(mlxplat_msn21xx_channels),
+	},
+
+};
+
 /* Platform hotplug devices */
 static struct i2c_board_info mlxplat_mlxcpld_pwr[] = {
 	{
@@ -522,6 +554,15 @@ static struct i2c_board_info mlxplat_mlxcpld_ext_pwr[] = {
 	},
 };
 
+static struct i2c_board_info mlxplat_mlxcpld_pwr_ng800[] = {
+	{
+		I2C_BOARD_INFO("dps460", 0x59),
+	},
+	{
+		I2C_BOARD_INFO("dps460", 0x5a),
+	},
+};
+
 static struct i2c_board_info mlxplat_mlxcpld_fan[] = {
 	{
 		I2C_BOARD_INFO("24c32", 0x50),
@@ -601,6 +642,23 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_wc_items_data[] = {
 	},
 };
 
+static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_ng800_items_data[] = {
+	{
+		.label = "pwr1",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(0),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr_ng800[0],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
+	},
+	{
+		.label = "pwr2",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(1),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr_ng800[1],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
+	},
+};
+
 static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_items_data[] = {
 	{
 		.label = "fan1",
@@ -1224,6 +1282,47 @@ static struct mlxreg_core_item mlxplat_mlxcpld_ext_items[] = {
 	}
 };
 
+static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] = {
+	{
+		.data = mlxplat_mlxcpld_default_ng_psu_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_psu_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_default_pwr_ng800_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_pwr_ng800_items_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_default_ng_fan_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_default_asic_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
+		.inversed = 0,
+		.health = true,
+	},
+};
+
 static
 struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
 	.items = mlxplat_mlxcpld_ext_items,
@@ -1234,6 +1333,16 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,
 };
 
+static
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ng800_data = {
+	.items = mlxplat_mlxcpld_ng800_items,
+	.counter = ARRAY_SIZE(mlxplat_mlxcpld_ng800_items),
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,
+};
+
 static struct mlxreg_core_data mlxplat_mlxcpld_modular_pwr_items_data[] = {
 	{
 		.label = "pwr1",
@@ -3093,6 +3202,13 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(7),
 		.mode = 0644,
 	},
+	{
+		.label = "clk_brd_prog_en",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+		.secured = 1,
+	},
 	{
 		.label = "erot1_recovery",
 		.reg = MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET,
@@ -3221,6 +3337,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(6),
 		.mode = 0444,
 	},
+	{
+		.label = "reset_ac_ok_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
 	{
 		.label = "psu1_on",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
@@ -3302,6 +3424,13 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.bit = 5,
 		.mode = 0444,
 	},
+	{
+		.label = "pwr_converter_prog_en",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+		.secured = 1,
+	},
 	{
 		.label = "vpd_wp",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
@@ -3326,6 +3455,30 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(1),
 		.mode = 0444,
 	},
+	{
+		.label = "clk_brd1_boot_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "clk_brd2_boot_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "clk_brd_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "asic_pg_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
 	{
 		.label = "spi_chnl_select",
 		.reg = MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT,
@@ -5211,6 +5364,27 @@ static int __init mlxplat_dmi_rack_switch_matched(const struct dmi_system_id *dm
 	return 1;
 }
 
+static int __init mlxplat_dmi_ng800_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_ng800_mux_data);
+	mlxplat_mux_data = mlxplat_ng800_mux_data;
+	mlxplat_hotplug = &mlxplat_mlxcpld_ng800_data;
+	mlxplat_hotplug->deferred_nr =
+		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
+	mlxplat_led = &mlxplat_default_ng_led_data;
+	mlxplat_regs_io = &mlxplat_default_ng_regs_io_data;
+	mlxplat_fan = &mlxplat_default_fan_data;
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
+		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
+
+	return 1;
+}
+
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{
 		.callback = mlxplat_dmi_default_wc_matched,
@@ -5287,6 +5461,12 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "VMOD0011"),
 		},
 	},
+	{
+		.callback = mlxplat_dmi_ng800_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0013"),
+		},
+	},
 	{
 		.callback = mlxplat_dmi_chassis_blade_matched,
 		.matches = {
-- 
2.20.1

