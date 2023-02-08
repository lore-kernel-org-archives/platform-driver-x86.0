Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8828CC05027
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:34:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjBHGeU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:34:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjBHGeT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:34:19 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5B74390D
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTu5AyEvwjv4SgXLaTZIOBgnUBCbDJ/KSEiY6NYuzLXFCnQfUzLGopfmhaTkWOCiUDiAvH79WWlR9EK8WATAe7P1AkUDs9E5h2SBeiw/hmHhmO0CVP41MCAJpaZpAzpKdr0c4ypOUDmfPGVWrqEyYIaCORHRDVRjp0tv+Ne4N4ro1rtD6F1r5glYetL+u/X1uPtJxwR9uViuAfkZiYRVvvmXADkdM5KhEslPeEa9JQlG+0H8n6IzNxYPnxwPQNvGTYFRtmOekg/K6QweeZBup3zPNE6EH0LY5KTDf7YYVdzISsM7vf8Q7vASi2yMgeTsu4FrgPH9Zan2Aq/iNhFgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiPVLT6pJcoB1/WRQvSEdDJqUwDlz9/1+f++oPW7Txo=;
 b=WAFQd5q4n4NwNuE5oaQedyhPFJupe6XJaJIzvLr3cKcgTf+4Q+mK0pd8G75PET3AFVglJBFIh0fqUrk3l6hGSiY1eHy9t0A4Wc9XXUqhFjy40IyNQEyDoO+K6ASmvRyhT/EVxCnxFxjQBpWhPsEboR/hnejFBhrZNdEBWezD/0h/LqFOsFDpg/B5n6MaL+5ECSrRdTCEkXfNnbzyII/Rdwv9CmXZ/lnxqZusmF4ecW+Yoi0r+CniQhUm5gJtpN0kOC8Rxk9ij7QH4jE6EVH05FLLfrIVZwD5Lln2w1zKjkO3ED/9XMbgzqTAyvx1B6BGM2HiPe5Te+Ynl49Dq7UmnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiPVLT6pJcoB1/WRQvSEdDJqUwDlz9/1+f++oPW7Txo=;
 b=U09+6htyVeYlYgVcDUoEJiMhAiO0laQNFsl53uXBI+AXdFGGBwkksWsikP+BF6kT3+NrBoMfh1PCi7+ExMdGBWbM0SGBrrZAjxcuCLmTOTAYLjCtL688qXfRAQmNbnN4p5CgZXxG/vIrNbZb+X9SjuyVonV4SSGBvtP7L4jbadNT2HpO1fUZIqU5g6cm7W+HVdWjHqo/ZoCXhlLuWh7R84wIgr5Lo0Uh0QLEx1ldoKQxiIkDuMG/PAErNyXj/gUVg3lxCie8hvmsxbuvfbrGCDVYlrIRYc3/j+GfX7PUD6xD7iVmm36+sdlyqsr7pYKuIaSvR8H8VYEg/kZJou7uow==
Received: from DM6PR11CA0065.namprd11.prod.outlook.com (2603:10b6:5:14c::42)
 by BN9PR12MB5162.namprd12.prod.outlook.com (2603:10b6:408:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 06:34:14 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::f4) by DM6PR11CA0065.outlook.office365.com
 (2603:10b6:5:14c::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35 via Frontend
 Transport; Wed, 8 Feb 2023 06:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 06:34:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:34:05 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:34:04 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 03/13] platform: mellanox: Cosmetic changes - rename to more common name
Date:   Wed, 8 Feb 2023 08:33:20 +0200
Message-ID: <20230208063331.15560-4-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT057:EE_|BN9PR12MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: e1504cda-d372-44d4-b116-08db099e7edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w5QXJ6s7/KI+mkhUCJ7Aevqk4t8VNevb2nYaguqAu91nu9SIwMeJgJlNcIIhOnXUU4QZGer4VcvWitUmy3b2S59x+EpkSPc43I3n55BtU5hTIpe84/PnOYVcbErj/qIvFpnQeVQ0ZjwS5+j1HbTM8gcNN6iRTo26DN54p2SpWAduR3TurP9RabesuVQBdzqfKpMwn7FPeMNMJttgZT3YzEYE3EzbRLqZLuKZjdaSW1IpHXf0BWxFQahJUyLU0Qv1iUDN23t0r/QvLxmmwxzhauBl0FVFgIT7e4hJJ0H6YPSnSbK47fw8YyejD5/fQ5NlX06zsuXrKn+/jxD8D4CBurLbj5VIKV8eN9rIMEPL4wx1EL2xNW2lhIi5Vnsj6zQG5278ru5StwZROMJ+hZTE5IWa1gozsUXOLdS8L3c6llG/u/rYyzuwAr6Jcv9GVjlg7u2C0GqrWb84Zt8vHUzrThdN+jRJtaax8Tkm/+0Z3jaqIjauIxESeh2urFEQIi06/R6p+Nb+cYvkqIQAlH3O2LJUUIZLaA5v8YIJ6IAIk/7/clNZAI8aasHNIks9veQPW/GDwEYdJptI2Yyh6cTc6TOH9ksq+N5vUXCL0iAXVcZysbPB0oUO2t4M6AQIiiRjY9ILG90ZqfjLEfzS/aV6mPlaYhmSevSLJa7q+8b2CcFgl/8K0Nx/zmzmcOq2xNKiMf+aKgtcsfOAsnAOyJo92A==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199018)(46966006)(36840700001)(40470700004)(36860700001)(316002)(70586007)(82310400005)(70206006)(2906002)(40480700001)(356005)(54906003)(8936002)(5660300002)(40460700003)(86362001)(6916009)(8676002)(4326008)(41300700001)(1076003)(82740400003)(107886003)(7636003)(6666004)(186003)(16526019)(26005)(36756003)(478600001)(47076005)(426003)(83380400001)(2616005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:34:13.9435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1504cda-d372-44d4-b116-08db099e7edd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5162
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Rename 'nvlink_blade' in several declaration to more common name
"chassis_blade", since these names are going to be used for different
kinds of blades.

Fix 'swicth' to 'switch' in comment.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index c53eca49c47f..e629ec8a2a2f 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -473,7 +473,7 @@ static struct i2c_mux_reg_platform_data mlxplat_modular_mux_data[] = {
 	},
 };
 
-/* Platform channels for rack swicth system family */
+/* Platform channels for rack switch system family */
 static const int mlxplat_rack_switch_channels[] = {
 	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
 };
@@ -2085,7 +2085,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_global_wp_items_data[] = {
 	},
 };
 
-static struct mlxreg_core_item mlxplat_mlxcpld_nvlink_blade_items[] = {
+static struct mlxreg_core_item mlxplat_mlxcpld_chassis_blade_items[] = {
 	{
 		.data = mlxplat_mlxcpld_global_wp_items_data,
 		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
@@ -2098,9 +2098,9 @@ static struct mlxreg_core_item mlxplat_mlxcpld_nvlink_blade_items[] = {
 };
 
 static
-struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_nvlink_blade_data = {
-	.items = mlxplat_mlxcpld_nvlink_blade_items,
-	.counter = ARRAY_SIZE(mlxplat_mlxcpld_nvlink_blade_items),
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_chassis_blade_data = {
+	.items = mlxplat_mlxcpld_chassis_blade_items,
+	.counter = ARRAY_SIZE(mlxplat_mlxcpld_chassis_blade_items),
 	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
 	.mask = MLXPLAT_CPLD_AGGR_MASK_COMEX,
 	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
@@ -3848,8 +3848,8 @@ static struct mlxreg_core_platform_data mlxplat_modular_regs_io_data = {
 		.counter = ARRAY_SIZE(mlxplat_mlxcpld_modular_regs_io_data),
 };
 
-/* Platform register access for NVLink blade systems family data  */
-static struct mlxreg_core_data mlxplat_mlxcpld_nvlink_blade_regs_io_data[] = {
+/* Platform register access for chassis blade systems family data  */
+static struct mlxreg_core_data mlxplat_mlxcpld_chassis_blade_regs_io_data[] = {
 	{
 		.label = "cpld1_version",
 		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_VER_OFFSET,
@@ -4046,9 +4046,9 @@ static struct mlxreg_core_data mlxplat_mlxcpld_nvlink_blade_regs_io_data[] = {
 	},
 };
 
-static struct mlxreg_core_platform_data mlxplat_nvlink_blade_regs_io_data = {
-		.data = mlxplat_mlxcpld_nvlink_blade_regs_io_data,
-		.counter = ARRAY_SIZE(mlxplat_mlxcpld_nvlink_blade_regs_io_data),
+static struct mlxreg_core_platform_data mlxplat_chassis_blade_regs_io_data = {
+		.data = mlxplat_mlxcpld_chassis_blade_regs_io_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_chassis_blade_regs_io_data),
 };
 
 /* Platform FAN default */
@@ -5168,14 +5168,14 @@ static int __init mlxplat_dmi_modular_matched(const struct dmi_system_id *dmi)
 	return 1;
 }
 
-static int __init mlxplat_dmi_nvlink_blade_matched(const struct dmi_system_id *dmi)
+static int __init mlxplat_dmi_chassis_blade_matched(const struct dmi_system_id *dmi)
 {
 	int i;
 
 	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
 	mlxplat_mux_num = ARRAY_SIZE(mlxplat_default_mux_data);
 	mlxplat_mux_data = mlxplat_default_mux_data;
-	mlxplat_hotplug = &mlxplat_mlxcpld_nvlink_blade_data;
+	mlxplat_hotplug = &mlxplat_mlxcpld_chassis_blade_data;
 	mlxplat_hotplug->deferred_nr =
 		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
 	for (i = 0; i < mlxplat_mux_num; i++) {
@@ -5183,7 +5183,7 @@ static int __init mlxplat_dmi_nvlink_blade_matched(const struct dmi_system_id *d
 		mlxplat_mux_data[i].n_values =
 				ARRAY_SIZE(mlxplat_msn21xx_channels);
 	}
-	mlxplat_regs_io = &mlxplat_nvlink_blade_regs_io_data;
+	mlxplat_regs_io = &mlxplat_chassis_blade_regs_io_data;
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_ng400;
 
@@ -5288,7 +5288,7 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 		},
 	},
 	{
-		.callback = mlxplat_dmi_nvlink_blade_matched,
+		.callback = mlxplat_dmi_chassis_blade_matched,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "VMOD0015"),
 		},
-- 
2.20.1

