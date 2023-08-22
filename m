Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538B5EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235441AbjHVLi6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235277AbjHVLiY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:38:24 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06B6CE9
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYMVtXFpiH++9RrQA1enQHNC7NH3Z5DYVNNVcoPhLtuoppXagujpRcjUps5U3vOO3ZvSbhgPoog+J5rG5N8oHPtOQkSQHbTpNiG8ltRcNHG8mzNEjidW7k1+rh7RmmbbZBjqKcvsPuxIHsf2dUdsaPsVetwn8DKaGHDPFiRNdX4MoTf9+4Pw+SUAftbdRcOxWT/M1cgZ1IAKygSLsJAZAww9dkfmpCibQEp4qzHcAOlfTlGCidm6HQrBFuMNf94sDTipWkhM50Adl0UbB7IGNdrMgZnCNKYJQzfQ9dSbbaru2xLXEDDvGybwljeXokiT3Hkj5JUbSLkaT2YFSGVRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ep+viDnettABcPb4R8dNWCwJ42Ux4DVO00iES3NiZWU=;
 b=eCTiili/9X4XvRLAQesyPINR5SorL5tip/c3SSDNTQbE8CjppnP+QZ0ojuekwpCzGAHPVa5zcElBAk85TKX3cfvzTZHmK+T/kVEHP8Q5zQ9QFd36zq9O3Y0Ny0FrZZvC1icYOqB6EVmIJ8HOxFpYZM6iMU4ZmUR+kMYvsi6nCvAA+na7oT30xhXW06ld2eEyuaAns3jL0FZiPpLCXu0zo/u+XJgBcgFK5OOo22iqTDnQo46xWPMw9tTOtXJAEHpAA3RNr+dqShmg9p93n+ytE69dXMor7ulgpfVSgsbIgSURp2W0zgQZ+IdC4xlfxd0IqyAbeatpMpwKpAPF7lotAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ep+viDnettABcPb4R8dNWCwJ42Ux4DVO00iES3NiZWU=;
 b=WQYiZfqGRBFugvzOsYTtJFZBDxhHJzo8995GELCxNT2QPTUykTE9mpNcQz/gn5K8Dpws+ZA5EFLj3FGRPEdjb9QZsbncHRGTBOd7C7b1ibGY47BpphGNfYKWCSL5etiNUXp7OINAp/h8nI9CyNEYSPOolKWeqQxix1o6PtTQlDM5nfJ8eL68GGPTgDcJCBVUdPQFtHc7zcwl0cQyC/A3yzcnFxARUvI3sNR+Bo3QKUtqdA4FOZru6DpLpc33ZfIxyZBXnCyYlitwxWYaSnda0XSGAzk9KUOb8foLhPgS/gfWsbcX3gaSRagm1M52x/gsU1N3WVJsVqa1OuanyZ2M6A==
Received: from SN7PR04CA0072.namprd04.prod.outlook.com (2603:10b6:806:121::17)
 by SA3PR12MB8439.namprd12.prod.outlook.com (2603:10b6:806:2f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Tue, 22 Aug
 2023 11:37:08 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:121:cafe::db) by SN7PR04CA0072.outlook.office365.com
 (2603:10b6:806:121::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:37:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:37:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:36:58 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:36:56 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 09/16] platform: mellanox: mlx-platform: Add reset callback
Date:   Tue, 22 Aug 2023 11:34:44 +0000
Message-ID: <20230822113451.13785-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822113451.13785-1-vadimp@nvidia.com>
References: <20230822113451.13785-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SA3PR12MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a68b522-9186-48a8-4ac3-08dba3041e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ssN6BqA5jVY2tVgztzsSo0IpRFrpShz956rZqAstpVgpCzOgHe1zHO4DF8tDQ9XJzCzKCIGWDkbbZtV7kQXlzJvHpB77pxFuTOnLKc0xe3RQDLSvdfEobrdDz0oyuZG48v0c8XFeJU0CCpGdsU1uvJM1hewNWScy3WhtlEAt1KFKGZDEBinA8CFPtbsQSuBHBoUDIirW4C49zxhbTH8QcoK5usH5q81mnBdPuxupob2pCvID+dwgrUnu2X9OX/+/dVX5hh1jUYTeA2H36GDu4KjaL8Y3j/KiVuKZyAaheJoAtwNQvxHZ8B+MiM952Un87ARSENj3PcPlGjLVx+frKavUmBB1GIBpOv2kqjZAiYGhKpApqfRZ5Lb+DmpFvvMiAjfjAK7Y/dL4uJcukNo3gxt/QPSaRgF551G579rcYWJSeN/eSjcb+aG9y//bBkMRbjdOFIXEwHPOOneEqZanr3XErsNJH9pGfnDzpguWMfrMxbEppMvZqUwpXxYv63v/cg0KpZM8JEpuifwBe27fsHFm6VVHbygGXpKM2fL3WYNhHX6C4qjYEJuQ/7akeAK9MA5YqWWcl9lXVmpXXlSzBv0PM9Oi+TgwHKUXto7i4hZYoeROn7TMpQFbSzz8gUNHP/Csem0ZavNnka7tqcGsC12WTHedYlQwM4KxtVY4H4RVGO+d/rba3lAz5P5Dsi/r1relW/hFpbH3dKwBVfjcGY+IDndzI5a58Y2gnp9XBRoji8BjM84Fg8nMLcwyobr
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199024)(186009)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(54906003)(70586007)(70206006)(5660300002)(41300700001)(1076003)(6916009)(2616005)(2906002)(478600001)(316002)(8936002)(8676002)(40480700001)(4326008)(6666004)(40460700003)(47076005)(107886003)(36860700001)(36756003)(26005)(83380400001)(7636003)(82740400003)(16526019)(356005)(336012)(426003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:37:08.6343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a68b522-9186-48a8-4ac3-08dba3041e5e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8439
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On L1 switches reset should include special actions against CPLD device
for performing graceful operations.
For that purpose, special PLATFORM_RESET# signal should be indicated.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

