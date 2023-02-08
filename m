Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8302EC636D3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjBHGeL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjBHGeK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:34:10 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A9943904
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:34:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gA4WuPTL/7KGwwdiIydqA0FpaNWlR4rC6jgYFrs7vVifUOKPNIJ94pNxQhP2c3H9TpZdY2hXcONKRiXMMy1SDN7zKFJJjlk2WKLxhsTCSbzraAO3W8stwexGsV39nvmsKlnNhH/IiXd+UD9SaAJbqKZpipZj5eWx+2WdSqJ/2DVyGxKEWdLllMD405dqRQv77lS/NjP06ThHxtra20qGhLy4cwj7w8U1riZfiUzOZAgR3u28tKbhdlU4FgRtkJi9QXChBQ/II+kNaEPx9VQkqpblqQcIebce5ucyBQcdAPnu/JDx40lP5cn5q6+T+Y7VmPdqUuTIepLhTOifoRrQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sl6MRsdHe9fYFRkV9PHUcUv+mI0m/M1yXI8zt+1qJgY=;
 b=FEDiBsBxpSpAa11bUJI5ScNEaptvOPzQ5zk+gWM9jKMdigVrtYBDo4RpIGkhdqsfa79/VwVWzKJFUM0tujJblUTm4m87AM4mQMPyx48IpD+BUMe2sZRNodinzgC41LkgyB+gy3JUtnpgucsVVuH+rbWETObOaiR+T7YDffesjZPK39yDYadmJeFjsj5DZA6HPwrup1ILFwJ3tBfukeaXs89AlyOaBvzEmFWMsVutGiwILW2qm9BRmL6Lkpe1GRuF/DJyqPOJLdebMXdjd5OJ+6qo1m6JVR6l8dy2iIq42HO3MUMWmMLM9PGDROTbJgWo7izapoz5v2ejU/Sq+7G9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sl6MRsdHe9fYFRkV9PHUcUv+mI0m/M1yXI8zt+1qJgY=;
 b=iJ9pbeTGJaQ99ipttDe3Rv+PbGyXeqgxMVfPsnzrN4QiUnX84/s9dobVckq1s9spKzco3s890ZHuPL6V/TBBPh07NtFsPPYkW2MZkx6gFSjWjh4DsDKERjJjHmnNLocxw52DHkoR3V9xIXH2yrzDzWKwgikC89KQXh4hgYUKC9B7ADbbKmdXzzjgnV3pESiHuzOTt8PQ/Hhl5y3md7KSMOs8loD0Quc4wUBR8pqyUx6csy7ZaFrViDcoq8u23xB2Jh9x8vEx6Xq5LsfNVo45v6AhldvUTKdjD5laF625MROFIj8g0ILlI6YK2L9v4i5c6qmoqyKTWraMDK+fjXD5lQ==
Received: from DS7PR03CA0326.namprd03.prod.outlook.com (2603:10b6:8:2b::28) by
 DS0PR12MB8368.namprd12.prod.outlook.com (2603:10b6:8:fe::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34; Wed, 8 Feb 2023 06:34:06 +0000
Received: from DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::5e) by DS7PR03CA0326.outlook.office365.com
 (2603:10b6:8:2b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 06:34:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT087.mail.protection.outlook.com (10.13.172.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 06:34:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:34:00 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:33:58 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 01/13] platform: mellanox: Introduce support for rack manager switch
Date:   Wed, 8 Feb 2023 08:33:18 +0200
Message-ID: <20230208063331.15560-2-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT087:EE_|DS0PR12MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f37e7b0-07d7-4393-5cb5-08db099e7a10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AeGQDqySwg0ErFoJ6lrZ95UndCxy5Nb+A8g8Tz0jqCbWEjD3SpiardDX1psnE2i+VUPk9y9nG78Mh34dpOpiuiIzV6yzGG5u9SM/O30/1cYPlwTJNZcEXVc9v5Cf/eTkAwjE18DNmBXjp99afoYWBosXaA7uukFrBRe1bg3rnXbxG7vvt8xvvisk8+8BTCS9n6YwZLZ3coIP+QDco8wW4dnv2Tbe0AZkaghPGvF8U5qlgvsSDvSLGExkuYrE7iu8SYrXCiZ2ABoz/ZD6cfgj5ocX5NZHEhWw5goOYK6fDSvuqWgLyzrvMWygpgBj7d0G9QYx3aGxq/Wtv+jGL7g8da75X1Dpcl7OjPv+yCF46NcyRkMR7ZQGRn9isx5V1mJpxg/NGgkkvE90vGUBo0qB/rl8ql1shWn3IQIHX8hFdpmteOwbuuFOVVBYgOx08inWKEwVbJL6WiI4PAq446hRKEgf6dAIC/zgaTOGHtLAiqUsNVBTpc4SJ72UammmjSFsc+gz6c7/0iED/G5LZ0aDvm/YTcov1D8fyNTaGU1V/ejSXMr+38VH9vF0nbiTNtG4ImK6S73c59ZARegLXDHTZ3h2pZcy2HVQX8PcHets7yHISZsQ808DfSRxzdweNFwwnpbiyYtug33BGgm97kBmy3clKBf0DBvZmxta5kloNg/NarGdS8M55qibfI99Ni89fP6hvrDkA1T+B2vjGr+XCQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199018)(36840700001)(40470700004)(46966006)(82310400005)(30864003)(54906003)(356005)(1076003)(8676002)(40480700001)(16526019)(186003)(316002)(86362001)(6666004)(107886003)(7636003)(82740400003)(26005)(478600001)(426003)(41300700001)(8936002)(336012)(83380400001)(40460700003)(47076005)(5660300002)(36756003)(4326008)(2616005)(70586007)(36860700001)(70206006)(6916009)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:34:05.8870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f37e7b0-07d7-4393-5cb5-08db099e7a10
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8368
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The rack switch is designed to provide high bandwidth, low latency
connectivity using optical fiber as the primary interconnect.

System supports 32 OSFP ports, non-blocking switching capacity of
25.6Tbps.
System equipped with:
- 2 replaceable power supplies (AC) with 1+1 redundancy model.
- 7 replaceable fan drawers with 6+1 redundancy model.
- 2 External Root of Trust or EROT (Glacier) devices for securing
  ASICs firmware.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 261 ++++++++++++++++++++++++++++
 1 file changed, 261 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 2fac05a17a5c..3e4adeb20a7e 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -90,6 +90,12 @@
 #define MLXPLAT_CPLD_LPC_REG_FAN_OFFSET		0x88
 #define MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET	0x89
 #define MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET	0x8a
+#define MLXPLAT_CPLD_LPC_REG_EROT_OFFSET	0x91
+#define MLXPLAT_CPLD_LPC_REG_EROT_EVENT_OFFSET	0x92
+#define MLXPLAT_CPLD_LPC_REG_EROT_MASK_OFFSET	0x93
+#define MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET	0x94
+#define MLXPLAT_CPLD_LPC_REG_EROTE_EVENT_OFFSET	0x95
+#define MLXPLAT_CPLD_LPC_REG_EROTE_MASK_OFFSET	0x96
 #define MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET	0x9a
 #define MLXPLAT_CPLD_LPC_REG_LC_VR_EVENT_OFFSET	0x9b
 #define MLXPLAT_CPLD_LPC_REG_LC_VR_MASK_OFFSET	0x9c
@@ -109,6 +115,8 @@
 #define MLXPLAT_CPLD_LPC_REG_LC_SD_EVENT_OFFSET	0xaa
 #define MLXPLAT_CPLD_LPC_REG_LC_SD_MASK_OFFSET	0xab
 #define MLXPLAT_CPLD_LPC_REG_LC_PWR_ON		0xb2
+#define MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET	0xc2
+#define MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT	0xc3
 #define MLXPLAT_CPLD_LPC_REG_WD_CLEAR_OFFSET	0xc7
 #define MLXPLAT_CPLD_LPC_REG_WD_CLEAR_WP_OFFSET	0xc8
 #define MLXPLAT_CPLD_LPC_REG_WD1_TMR_OFFSET	0xc9
@@ -214,6 +222,7 @@
 #define MLXPLAT_CPLD_LED_HI_NIBBLE_MASK	GENMASK(3, 0)
 #define MLXPLAT_CPLD_VOLTREG_UPD_MASK	GENMASK(5, 4)
 #define MLXPLAT_CPLD_GWP_MASK		GENMASK(0, 0)
+#define MLXPLAT_CPLD_EROT_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_I2C_CAP_BIT	0x04
 #define MLXPLAT_CPLD_I2C_CAP_MASK	GENMASK(5, MLXPLAT_CPLD_I2C_CAP_BIT)
 
@@ -243,6 +252,7 @@
 #define MLXPLAT_CPLD_CH2_ETH_MODULAR		3
 #define MLXPLAT_CPLD_CH3_ETH_MODULAR		43
 #define MLXPLAT_CPLD_CH4_ETH_MODULAR		51
+#define MLXPLAT_CPLD_CH2_RACK_SWITCH		18
 
 /* Number of LPC attached MUX platform devices */
 #define MLXPLAT_CPLD_LPC_MUX_DEVS		4
@@ -280,6 +290,9 @@
 /* Minimum power required for turning on Ethernet modular system (WATT) */
 #define MLXPLAT_CPLD_ETH_MODULAR_PWR_MIN	50
 
+/* Default value for PWM control register for rack switch system */
+#define MLXPLAT_REGMAP_NVSWITCH_PWM_DEFAULT 0xf4
+
 /* mlxplat_priv - platform private data
  * @pdev_i2c - i2c controller platform device
  * @pdev_mux - array of mux platform devices
@@ -460,6 +473,36 @@ static struct i2c_mux_reg_platform_data mlxplat_modular_mux_data[] = {
 	},
 };
 
+/* Platform channels for rack swicth system family */
+static const int mlxplat_rack_switch_channels[] = {
+	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
+};
+
+/* Platform rack switch mux data */
+static struct i2c_mux_reg_platform_data mlxplat_rack_switch_mux_data[] = {
+	{
+		.parent = 1,
+		.base_nr = MLXPLAT_CPLD_CH1,
+		.write_only = 1,
+		.reg = (void __iomem *)MLXPLAT_CPLD_LPC_REG1,
+		.reg_size = 1,
+		.idle_in_use = 1,
+		.values = mlxplat_rack_switch_channels,
+		.n_values = ARRAY_SIZE(mlxplat_rack_switch_channels),
+	},
+	{
+		.parent = 1,
+		.base_nr = MLXPLAT_CPLD_CH2_RACK_SWITCH,
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
@@ -2064,6 +2107,97 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_nvlink_blade_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
+/* Platform hotplug for  switch systems family data */
+static struct mlxreg_core_data mlxplat_mlxcpld_erot_ap_items_data[] = {
+	{
+		.label = "erot1_ap",
+		.reg = MLXPLAT_CPLD_LPC_REG_EROT_OFFSET,
+		.mask = BIT(0),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "erot2_ap",
+		.reg = MLXPLAT_CPLD_LPC_REG_EROT_OFFSET,
+		.mask = BIT(1),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_erot_error_items_data[] = {
+	{
+		.label = "erot1_error",
+		.reg = MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET,
+		.mask = BIT(0),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "erot2_error",
+		.reg = MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET,
+		.mask = BIT(1),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
+static struct mlxreg_core_item mlxplat_mlxcpld_rack_switch_items[] = {
+	{
+		.data = mlxplat_mlxcpld_ext_psu_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_ext_pwr_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
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
+		.data = mlxplat_mlxcpld_erot_ap_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_EROT_OFFSET,
+		.mask = MLXPLAT_CPLD_EROT_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_erot_ap_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_erot_error_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET,
+		.mask = MLXPLAT_CPLD_EROT_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_erot_error_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_rack_switch_data = {
+	.items = mlxplat_mlxcpld_rack_switch_items,
+	.counter = ARRAY_SIZE(mlxplat_mlxcpld_rack_switch_items),
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
+};
+
 /* Platform led default data */
 static struct mlxreg_core_data mlxplat_mlxcpld_default_led_data[] = {
 	{
@@ -2947,6 +3081,44 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(2),
 		.mode = 0200,
 	},
+	{
+		.label = "erot1_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "erot2_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0644,
+	},
+	{
+		.label = "erot1_recovery",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "erot2_recovery",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0644,
+	},
+	{
+		.label = "erot1_wp",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+		.secured = 1,
+	},
+	{
+		.label = "erot2_wp",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+		.secured = 1,
+	},
 	{
 		.label = "reset_long_pb",
 		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
@@ -3142,6 +3314,25 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(4),
 		.mode = 0644,
 	},
+	{
+		.label = "erot1_ap_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "erot2_ap_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "spi_chnl_select",
+		.reg = MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT,
+		.mask = GENMASK(7, 0),
+		.bit = 1,
+		.mode = 0644,
+	},
 	{
 		.label = "config1",
 		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET,
@@ -4257,6 +4448,10 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROT_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROT_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROTE_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROTE_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_IN_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_IN_MASK_OFFSET:
@@ -4274,6 +4469,7 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_LC_SD_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_SD_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_PWR_ON:
+	case MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT:
 	case MLXPLAT_CPLD_LPC_REG_WD_CLEAR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD_CLEAR_WP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD1_TMR_OFFSET:
@@ -4358,6 +4554,12 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_FAN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROT_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROT_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROTE_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROTE_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLC_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET:
@@ -4382,6 +4584,8 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_LC_SD_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_SD_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_PWR_ON:
+	case MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT:
 	case MLXPLAT_CPLD_LPC_REG_WD_CLEAR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD_CLEAR_WP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD1_TMR_OFFSET:
@@ -4492,6 +4696,12 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_FAN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROT_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROT_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROTE_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_EROTE_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLC_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET:
@@ -4516,6 +4726,8 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_LC_SD_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_SD_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_PWR_ON:
+	case MLXPLAT_CPLD_LPC_REG_GP4_RO_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_SPI_CHNL_SELECT:
 	case MLXPLAT_CPLD_LPC_REG_WD2_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD2_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
@@ -4583,6 +4795,13 @@ static const struct reg_default mlxplat_mlxcpld_regmap_ng400[] = {
 	{ MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET, 0x00 },
 };
 
+static const struct reg_default mlxplat_mlxcpld_regmap_rack_switch[] = {
+	{ MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET, MLXPLAT_REGMAP_NVSWITCH_PWM_DEFAULT },
+	{ MLXPLAT_CPLD_LPC_REG_WD1_ACT_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET, 0x00 },
+};
+
 static const struct reg_default mlxplat_mlxcpld_regmap_eth_modular[] = {
 	{ MLXPLAT_CPLD_LPC_REG_GP2_OFFSET, 0x61 },
 	{ MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET, 0x00 },
@@ -4676,6 +4895,20 @@ static const struct regmap_config mlxplat_mlxcpld_regmap_config_ng400 = {
 	.reg_write = mlxplat_mlxcpld_reg_write,
 };
 
+static const struct regmap_config mlxplat_mlxcpld_regmap_config_rack_switch = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 255,
+	.cache_type = REGCACHE_FLAT,
+	.writeable_reg = mlxplat_mlxcpld_writeable_reg,
+	.readable_reg = mlxplat_mlxcpld_readable_reg,
+	.volatile_reg = mlxplat_mlxcpld_volatile_reg,
+	.reg_defaults = mlxplat_mlxcpld_regmap_rack_switch,
+	.num_reg_defaults = ARRAY_SIZE(mlxplat_mlxcpld_regmap_rack_switch),
+	.reg_read = mlxplat_mlxcpld_reg_read,
+	.reg_write = mlxplat_mlxcpld_reg_write,
+};
+
 static const struct regmap_config mlxplat_mlxcpld_regmap_config_eth_modular = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -4957,6 +5190,27 @@ static int __init mlxplat_dmi_nvlink_blade_matched(const struct dmi_system_id *d
 	return 1;
 }
 
+static int __init mlxplat_dmi_rack_switch_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_rack_switch_mux_data);
+	mlxplat_mux_data = mlxplat_rack_switch_mux_data;
+	mlxplat_hotplug = &mlxplat_mlxcpld_rack_switch_data;
+	mlxplat_hotplug->deferred_nr =
+		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
+	mlxplat_led = &mlxplat_default_ng_led_data;
+	mlxplat_regs_io = &mlxplat_default_ng_regs_io_data;
+	mlxplat_fan = &mlxplat_default_fan_data;
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
+		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_rack_switch;
+
+	return 1;
+}
+
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{
 		.callback = mlxplat_dmi_default_wc_matched,
@@ -5014,6 +5268,13 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "VMOD0009"),
 		},
 	},
+	{
+		.callback = mlxplat_dmi_rack_switch_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0010"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI142"),
+		},
+	},
 	{
 		.callback = mlxplat_dmi_ng400_matched,
 		.matches = {
-- 
2.20.1

