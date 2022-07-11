Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF14CCA47B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 08:46:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiGKIqg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 04:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiGKIqe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 04:46:34 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19038E1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 01:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgJ+5M8FN/k4erMwNzmfoSP30Ln5V7LjCLiF4S9Vvn3tnItgbGd8JOffXHgfFDnShEtsYAsNmnu0pmnMWcdUwYMuz9g3Vqncjdfnbry3VhuXT5ViDiaJ/9xOYeuyWZFPZTBIZYUMxzmBTGEqPFu2vg4AuGZnbby0N0Ae5oNv4zOIt+hBXNo3ODtmTnz51rDA0GIm1XUJy5sLLvluhBPMTczKUySufyUYxzXRwFULwvDpNBfdqB9XEjowL1UHMwl9n2mq2duLOockhp73c0GxTraWnKljo9rTL43MJBsAw1W6buUO9lSpyCjZRLEwsU7pivM8ynjceoGkBSpfMdq+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9dDxYTONiaWzVymrDObKUy6NLEw2SsnJAgBiKUTa14=;
 b=UuoypqISgBK2wUF/Lab4/CUDRo/Sl8yNkxHai5Y2g0SDxueeEPknyk1M5oKOg7pPU0lj9pC1+IR4IbQX8NP5JZTUfhd/uhapYWr3myngHJ5KeihiycnFbH32CAzacvqlhoujtY5kUsbxvmoEE9a1QHsq+RjM6Ct49C6Y+nEoO5fKEvOja8hOG6BY+Ns261nvZfX6Ej+B1VF8Jq8p9bPlYQAfs6nCZxg97wnoGNRWf0vBOwoblMzfAuBAgbSPtQl+926wi6XEve9DvCoOft7xBZn3TxYvfNncFW5hZjxeAx9EGe69ZL2Ogsmh8xl7mpAI6CpkMT7gWPmUzI8oA2DVJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9dDxYTONiaWzVymrDObKUy6NLEw2SsnJAgBiKUTa14=;
 b=UkIR0ergtO00rEzKJG3ZPsk+DX+k+3aX7eMhQEhlICfEuD08lwO6Jewp+Skl3WwfA6fFl8YzhMB+IHu7dCWg0BE9nf5qy+quC0cjUaIDLtzX04rXTpuUmIAAZK5VGLDJA5cUU2outM90hW7WreTH/92Kq/BEhtr2DZfbtH6LGJEif/L0c7VYRpyaxjNnWQA/78ULGRxuzZrxYLoDRCmtIhu2dAwgeZlodIkJO93TvSv30Jx5/SvgcSYCP3t4HnDCbBkh6MG3Bn+9NEJSYYHE0ERHtU/tu0wsWAcyrnjkcNpmszN5zLmWtz+R4EY+4jgh0ihQpzWxQQsD8UEEgRIkxQ==
Received: from MWHPR04CA0050.namprd04.prod.outlook.com (2603:10b6:300:6c::12)
 by DM6PR12MB4633.namprd12.prod.outlook.com (2603:10b6:5:16f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Mon, 11 Jul
 2022 08:46:31 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:6c:cafe::bd) by MWHPR04CA0050.outlook.office365.com
 (2603:10b6:300:6c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Mon, 11 Jul 2022 08:46:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 08:46:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Mon, 11 Jul
 2022 08:46:30 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Mon, 11 Jul 2022 01:46:29 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 4/9] platform/x86: mlx-platform: Introduce support for COMe NVSwitch management module for Vulcan chassis
Date:   Mon, 11 Jul 2022 11:45:54 +0300
Message-ID: <20220711084559.62447-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220711084559.62447-1-vadimp@nvidia.com>
References: <20220711084559.62447-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f025ec0-01d6-4167-dcb0-08da6319da38
X-MS-TrafficTypeDiagnostic: DM6PR12MB4633:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S8g5lq7pDpxhAyXSmwbCw4S/bV7TTtERi8t0njeqfJeMUwYZR8JxijwGaRZtdgncPMUVT0A3cq37wA+/8boJU50RrDM1aTWjxC1KLTCbgFGJx4bpeeoAi//O0OQ8ZuXGNwjO2WxXz2M+UleA8tye3nYg5X6Uq2PulvOerfPMzfF0QlN/+IUIfdvZQ432ADtJfSAF2cF4b0eHPs00JAA98dD/0Ce96qfiupVOlSWuaaVK1R9m0cIr2U99zH4vR+uAE95A7NqLgLmV36fb1yPCDfkT/7sP39AEOcaMlvsPsOOQyPDezKJQhF5YmXP50cGM4ZhlmMklRu2SZZZ+ftHUTxi2qo121nK29h8nDBlLJ6Tr8lHzHsG31aBN8kuCYXk8skAqBw6H2yYHN2cqVkKDg/OdfJ7b8PZ36KeKnFkbiQJxVx5PbI8Ib/HsAQScDDGagBlV/cvOK7bTgTpnuTUjdutZU+Wy59c1M9utztMXD6r8hMgYUpR/+hLDWPi3KvIN5Cutizb9Ih8amkhkWKIVdO/+Lj61AqiH0yhlFSqjnCkrvKUMYuJ+fN59+uqCO3P+Kpmc07wNCx270qypWTYF/F+UqagelwMljyB8Kx2efWuSmftSkQ+ZXaTMN9luS+jHARxc7Qgu1t1QKRYMWhBfLPts5UG2niC+69f9Q0AUBMmqtbx+2pmAv4p6WCWGFd65JtqEUHSs/aeHC9VJqduprZwndyQs+kC9qsldgWQYS24su6gqFPUJ8smulF7RBb92Vll9ksfUuTkCY4/6UqhLIEGHM7A5vRLYKNZGq6SXDWvIvyxQFxMYAD8ynFrbakdPUX8xxxYXA8QrG8bhDUFw6uMVhF7ikwg/rngrbljDlMc=
X-Forefront-Antispam-Report: CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(346002)(39860400002)(36840700001)(46966006)(40470700004)(107886003)(5660300002)(54906003)(1076003)(4326008)(8676002)(8936002)(70206006)(70586007)(316002)(86362001)(6916009)(81166007)(6666004)(26005)(2616005)(41300700001)(82740400003)(478600001)(356005)(82310400005)(36756003)(40460700003)(36860700001)(83380400001)(336012)(47076005)(186003)(30864003)(426003)(2906002)(16526019)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:46:31.1432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f025ec0-01d6-4167-dcb0-08da6319da38
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4633
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Vulcan is chassis containing Nvidia's Hopper dGPU (GH100), NVswitch
(LS10) based HGX baseboard and COMe NVSwitch management module.
The system is built for artificial intelligence and accelerated
analytics applications. Vulcan is offered as an HGX product to cloud
service providers and OEMs, who intend to build fully interconnected
GPU systems for large scale deployments.

Driver is extended to support new COMe NVSwitch management module.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 269 ++++++++++++++++++++++++++++
 1 file changed, 269 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 190d488d4cd1..9e6054e2f0ac 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -67,6 +67,9 @@
 #define MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET	0x43
 #define MLXPLAT_CPLD_LPC_REG_AGGRCX_OFFSET	0x44
 #define MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET 0x45
+#define MLXPLAT_CPLD_LPC_REG_GWP_OFFSET		0x4a
+#define MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET	0x4b
+#define MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET	0x4c
 #define MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET 0x50
 #define MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET	0x51
 #define MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET	0x52
@@ -209,6 +212,7 @@
 #define MLXPLAT_CPLD_LED_LO_NIBBLE_MASK	GENMASK(7, 4)
 #define MLXPLAT_CPLD_LED_HI_NIBBLE_MASK	GENMASK(3, 0)
 #define MLXPLAT_CPLD_VOLTREG_UPD_MASK	GENMASK(5, 4)
+#define MLXPLAT_CPLD_GWP_MASK		GENMASK(0, 0)
 #define MLXPLAT_CPLD_I2C_CAP_BIT	0x04
 #define MLXPLAT_CPLD_I2C_CAP_MASK	GENMASK(5, MLXPLAT_CPLD_I2C_CAP_BIT)
 
@@ -2027,6 +2031,38 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_modular_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
+/* Platform hotplug for NVLink blade systems family data  */
+static struct mlxreg_core_data mlxplat_mlxcpld_global_wp_items_data[] = {
+	{
+		.label = "global_wp_grant",
+		.reg = MLXPLAT_CPLD_LPC_REG_GWP_OFFSET,
+		.mask = MLXPLAT_CPLD_GWP_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
+static struct mlxreg_core_item mlxplat_mlxcpld_nvlink_blade_items[] = {
+	{
+		.data = mlxplat_mlxcpld_global_wp_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_GWP_OFFSET,
+		.mask = MLXPLAT_CPLD_GWP_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_global_wp_items_data),
+		.inversed = 0,
+		.health = false,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_nvlink_blade_data = {
+	.items = mlxplat_mlxcpld_nvlink_blade_items,
+	.counter = ARRAY_SIZE(mlxplat_mlxcpld_nvlink_blade_items),
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_COMEX,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
+};
+
 /* Platform led default data */
 static struct mlxreg_core_data mlxplat_mlxcpld_default_led_data[] = {
 	{
@@ -3589,6 +3625,203 @@ static struct mlxreg_core_platform_data mlxplat_modular_regs_io_data = {
 		.counter = ARRAY_SIZE(mlxplat_mlxcpld_modular_regs_io_data),
 };
 
+/* Platform register access for NVLink blade systems family data  */
+static struct mlxreg_core_data mlxplat_mlxcpld_nvlink_blade_regs_io_data[] = {
+	{
+		.label = "cpld1_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld1_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld1_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_aux_pwr_or_ref",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_from_comex",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_comex_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_platform",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_soc",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_comex_wd",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_voltmon_upgrade_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_system",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_sw_pwr_off",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_comex_thermal",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_reload_bios",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_ac_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "pwr_cycle",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "pwr_down",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "global_wp_request",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "jtag_enable",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "comm_chnl_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0200,
+	},
+	{
+		.label = "bios_safe_mode",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_active_image",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_auth_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "bios_upgrade_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "voltreg_update_status",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
+		.mask = MLXPLAT_CPLD_VOLTREG_UPD_MASK,
+		.bit = 5,
+		.mode = 0444,
+	},
+	{
+		.label = "vpd_wp",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "pcie_asic_reset_dis",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "global_wp_response",
+		.reg = MLXPLAT_CPLD_LPC_REG_GWP_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "config1",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "config2",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "ufm_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_nvlink_blade_regs_io_data = {
+		.data = mlxplat_mlxcpld_nvlink_blade_regs_io_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_nvlink_blade_regs_io_data),
+};
+
 /* Platform FAN default */
 static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 	{
@@ -3974,6 +4207,8 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC2_EVENT_OFFSET:
@@ -4067,6 +4302,9 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRCX_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GWP_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
@@ -4197,6 +4435,9 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRCX_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GWP_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
@@ -4629,6 +4870,28 @@ static int __init mlxplat_dmi_modular_matched(const struct dmi_system_id *dmi)
 	return 1;
 }
 
+static int __init mlxplat_dmi_nvlink_blade_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_default_mux_data);
+	mlxplat_mux_data = mlxplat_default_mux_data;
+	mlxplat_hotplug = &mlxplat_mlxcpld_nvlink_blade_data;
+	mlxplat_hotplug->deferred_nr =
+		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
+	for (i = 0; i < mlxplat_mux_num; i++) {
+		mlxplat_mux_data[i].values = mlxplat_msn21xx_channels;
+		mlxplat_mux_data[i].n_values =
+				ARRAY_SIZE(mlxplat_msn21xx_channels);
+	}
+	mlxplat_regs_io = &mlxplat_nvlink_blade_regs_io_data;
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
+
+	return 1;
+}
+
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{
 		.callback = mlxplat_dmi_default_wc_matched,
@@ -4691,6 +4954,12 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "VMOD0011"),
 		},
 	},
+	{
+		.callback = mlxplat_dmi_nvlink_blade_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0015"),
+		},
+	},
 	{
 		.callback = mlxplat_dmi_msn274x_matched,
 		.matches = {
-- 
2.20.1

