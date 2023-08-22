Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F5FEE49A3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbjHVIP5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233724AbjHVIP4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:15:56 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2056.outbound.protection.outlook.com [40.107.95.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F3912C
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeDxu8x5LXKsiig7JFSq+Y8D/Vamw/9un0L9WbBSiQ20jB4hstFoyXCLvpdiDy9QIvtpklB6lGEH3Lhcr6f8EhEuJwGhr7329VfoOM7jUEY6opvq5dJi0L1R1ppeYhhulEgLcdF0+Cat28EHLBrX6BeEKCOWJCgCWe8RrRTIpt/wBFqRlD7SJSAKy6ntCxCh3gVGr9xvfJYalHBWEL/0QCSiPQOCcX14/yh3rO4T7tJ+IUUV2QC0y34vKwwQYSLKKy7jpz7N+wmHi9hVrWX09t4P1LlO5dYonC5iTIrJaw37fLOLBX59GGiWycY5ZL62e9F7v2eTyM5wGG0OX1JP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaBstP60muus2eRPJaftO9yWcezhX3/u+gwj3DMAmZ4=;
 b=KCDLOrqIF+Vc+hiIKrz9biOxzIc0bvpzS1dI4vEzmT712geBRgOs+CTv7LYi6QDM8fTkTl4WZbJ1GIx6GrTar+hsrwOAWETHQnEHHBHaeFSMkn6JV9vA0elGD+64K8SC82CRxhpZiKbW3aLglUNxPqUtGxuCFHI6bmKIpRbxtgjkqdYB/BAMAaVUgdQSG5B0FlnM2pdEBK9Irq2U6MSSk091zh6PnqYKLh0fDQezBofUnMH8orRDTiriNhgB9cpbu589dFHecgOnY81nOCGsadJMQQ7gjhVEUGQswUvFhm/hmEnRoUO9lFWycq4BAuFNIdPawUHoKFMuV2vSyE2DKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaBstP60muus2eRPJaftO9yWcezhX3/u+gwj3DMAmZ4=;
 b=I8xtkBPZlKMxMm+Jl7ytJLrnfFgILX+IZb7DRr9m/4kS90Q5SpZBC9Or/6X+qZV6Yl/xzO26i+Gk5B0DNMf9nyrjy9JHayOXv134npR4BxTmtiLwQc55C01CcZROHVJI/9DZGx65WbkFmem6YVU3JDzhHXBC88K/YtytephOhwFC6Uc+QOaHQGPUcIUI3h/+rM/9GaawggxSkmO8TWcCC/JORdgsk7KAtquGeG6eb9ymMGmWLpswUyu1H/4MKkQKEAiygfWkTjk67CZJM0Ptv5hakJXFEQ85GNMBPKIbMEQlhG60iCJdAxhYlS/t2xa9SUbSICsnCF4o6tIGNshGYA==
Received: from SA1P222CA0171.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::8)
 by SA1PR12MB7344.namprd12.prod.outlook.com (2603:10b6:806:2b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 08:15:52 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:3c3:cafe::fc) by SA1P222CA0171.outlook.office365.com
 (2603:10b6:806:3c3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 08:15:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 08:15:52 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 01:15:43 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 01:15:41 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v3 09/16] platform: mellanox: mlx-platform: Add reset callback
Date:   Tue, 22 Aug 2023 08:13:28 +0000
Message-ID: <20230822081335.64344-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822081335.64344-1-vadimp@nvidia.com>
References: <20230822081335.64344-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 drhqmail201.nvidia.com (10.126.190.180)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|SA1PR12MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: d85e8d18-9902-4b8f-fd76-08dba2e8001f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BavUloEE+LmMqRNJKGzGMMhnPvWFW7x2c8Lj58VdJQp3KMz+3FGLmLTq5w1bE6xL3Lk764GhTcWRLFy06rlAx0i3RHWHw6CyRYVD8sCtnU0uvPoAl2zfMXfb+CUu57nhG5dPOAvig0/n33UcQiJ7PgERTlydgvz1SPfU2ddm7AdsHyIXVZIN1R4y8X8qWjIEMw90ICryXS3XvEmBUOdqFdcYk1FtH7U04ITsHB1vX6PLlNEA0TA+/pTDF22h9jalCdGKEDE2GUkscEhqPTYVmQzsSfIrjecO5YN0xNrFZky1sWyMCnG6f6YnslVT4uTfh4xhd/M5UqK4sPNmM9G036wz3CRn8t8BxPUX5Ic0ZXwHMLJfj8XmILzM2Mo9j509UtZoXto0ygiSx3v7c+tn/zA4YUsO4kqfbN/ewv/wQI0xWkajDiaH7tChUJyyKyQnF3RyKRPk2WL8ngjCsSNiGMB+eiYz3yJh81EAJvd5t9mbq3PjkP8eKhqQF9yNg8d1UilzGzWpmsRdRr+xPv5WvuMnaMRVOtLuKZ5O/tAMera3xnvhv6rAweCkW+CyWwMjaeGd2rECLOozT/h/rk5efEsdY6buUXVPNxhmNxOIk4/YV4AVbdEb3CcuXV78jNpV6BQtLoQRpPvGZ3sxx47XvXiLZjuxZVd7FnppczWBp0AF83jHLf9ol09WgnviEJWl17vFVaw56TbsQVEVyI7YQfn8y1LSRTZqe1wkuo9UFhWij0CIashbdoH/wzG0W2LB
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(40480700001)(83380400001)(5660300002)(336012)(426003)(16526019)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(107886003)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:15:52.0016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d85e8d18-9902-4b8f-fd76-08dba2e8001f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7344
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On L1 switches reset should include special actions against CPLD device
for performing graceful operations.
For that purpose, special PLATFORM_RESET# signal should be indicated.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v1->v2:
- Comments pointed out by Ilpo:
  - Use GENMASK() for MLXPLAT_CPLD_RESET_MASK define.
  - Use a named define instead of BIT(0).
---
 drivers/platform/x86/mlx-platform.c | 46 +++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 1010064d54e9..296569492a71 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -35,6 +35,7 @@
 #define MLXPLAT_CPLD_LPC_REG_CPLD3_PN1_OFFSET	0x09
 #define MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET	0x0a
 #define MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET	0x0b
+#define MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET	0x17
 #define MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET	0x19
 #define MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET	0x1c
 #define MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET	0x1d
@@ -254,6 +255,7 @@
 					 MLXPLAT_CPLD_PWM_PG_MASK)
 #define MLXPLAT_CPLD_I2C_CAP_BIT	0x04
 #define MLXPLAT_CPLD_I2C_CAP_MASK	GENMASK(5, MLXPLAT_CPLD_I2C_CAP_BIT)
+#define MLXPLAT_CPLD_SYS_RESET_MASK	BIT(0)
 
 /* Masks for aggregation for comex carriers */
 #define MLXPLAT_CPLD_AGGR_MASK_CARRIER	BIT(1)
@@ -265,6 +267,7 @@
 #define MLXPLAT_CPLD_LPC_LC_MASK	GENMASK(7, 0)
 
 #define MLXPLAT_CPLD_HALT_MASK		BIT(3)
+#define MLXPLAT_CPLD_RESET_MASK		GENMASK(7, 1)
 
 /* Default I2C parent bus number */
 #define MLXPLAT_CPLD_PHYS_ADAPTER_DEF_NR	1
@@ -441,6 +444,7 @@ static struct i2c_mux_reg_platform_data mlxplat_default_mux_data[] = {
 static int mlxplat_max_adap_num;
 static int mlxplat_mux_num;
 static struct i2c_mux_reg_platform_data *mlxplat_mux_data;
+static struct notifier_block *mlxplat_reboot_nb;
 
 /* Platform extended mux data */
 static struct i2c_mux_reg_platform_data mlxplat_extended_mux_data[] = {
@@ -2361,8 +2365,11 @@ static int
 mlxplat_mlxcpld_l1_switch_pwr_events_handler(void *handle, enum mlxreg_hotplug_kind kind,
 					     u8 action)
 {
-	dev_info(&mlxplat_dev->dev, "System shutdown due to short press of power button");
-	kernel_power_off();
+	if (action) {
+		dev_info(&mlxplat_dev->dev, "System shutdown due to short press of power button");
+		kernel_power_off();
+	}
+
 	return 0;
 }
 
@@ -4957,6 +4964,7 @@ static struct mlxreg_core_platform_data mlxplat_mlxcpld_wd_set_type3[] = {
 static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED2_OFFSET:
@@ -5065,6 +5073,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
@@ -5229,6 +5238,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
@@ -5533,11 +5543,33 @@ static struct mlxreg_core_platform_data
 	*mlxplat_wd_data[MLXPLAT_CPLD_WD_MAX_DEVS];
 static const struct regmap_config *mlxplat_regmap_config;
 
+/* Platform default reset function */
+static int mlxplat_reboot_notifier(struct notifier_block *nb, unsigned long action, void *unused)
+{
+	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
+	u32 regval;
+	int ret;
+
+	ret = regmap_read(priv->regmap, MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET, &regval);
+
+	if (action == SYS_RESTART && !ret && regval & MLXPLAT_CPLD_SYS_RESET_MASK)
+		regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET,
+			     MLXPLAT_CPLD_RESET_MASK);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block mlxplat_reboot_default_nb = {
+	.notifier_call = mlxplat_reboot_notifier,
+};
+
 /* Platform default poweroff function */
 static void mlxplat_poweroff(void)
 {
 	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
 
+	if (mlxplat_reboot_nb)
+		unregister_reboot_notifier(mlxplat_reboot_nb);
 	regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET, MLXPLAT_CPLD_HALT_MASK);
 	kernel_halt();
 }
@@ -5861,6 +5893,7 @@ static int __init mlxplat_dmi_l1_switch_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_rack_switch;
 	pm_power_off = mlxplat_poweroff;
+	mlxplat_reboot_nb = &mlxplat_reboot_default_nb;
 
 	return 1;
 }
@@ -6410,8 +6443,15 @@ static int __init mlxplat_init(void)
 	if (err)
 		goto fail_regcache_sync;
 
+	if (mlxplat_reboot_nb) {
+		err = register_reboot_notifier(mlxplat_reboot_nb);
+		if (err)
+			goto fail_register_reboot_notifier;
+	}
+
 	return 0;
 
+fail_register_reboot_notifier:
 fail_regcache_sync:
 	mlxplat_pre_exit(priv);
 fail_mlxplat_i2c_main_init:
@@ -6429,6 +6469,8 @@ static void __exit mlxplat_exit(void)
 
 	if (pm_power_off)
 		pm_power_off = NULL;
+	if (mlxplat_reboot_nb)
+		unregister_reboot_notifier(mlxplat_reboot_nb);
 	mlxplat_pre_exit(priv);
 	mlxplat_i2c_main_exit(priv);
 	mlxplat_post_exit();
-- 
2.20.1

