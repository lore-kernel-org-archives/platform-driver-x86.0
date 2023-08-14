Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435A2C001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 20:37:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232414AbjHNUgy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 16:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232508AbjHNUgr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 16:36:47 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBF7E5E
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 13:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kK7+WxtAtuEJ6eMfv4dYZBRwO6wz/kbJv7tv/CN2/8iRp21nXyey40zcU4zFxnaYhmQRSeKUsWUlcKquFAb7cqhEHAYnNbMsIAsG1ZmBDQ6pRA8j9f3Is3oGR+sgAUMRFqc020KXPYGo1R6+rRkXGmtwA2QLXQAGJEB733TUp80LPXK7TkCmMq8MTy5RyPBlqT4znkcd1Wd+YDmx0g4zyPiDTOVlJVcki5XCs6JkjsUa0R2oB/NGkWk/1uSeBjFzew0BY+ONX4MUfvUY6WEcIoGxfUc/yBvUW6SNe2PO0AxTcVD2Q+TP613ZJ74aaNBWHCDPRtiP2W5PWUQFkNmiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArL6WqvJQKDjurQJ+hRn+ugEtBucHKKJObYmoU8WoHI=;
 b=mNQ23qZyqMC5BkBE8PEIf2Xe3lmuiiS/+X/dkfdBFNzZP/d8wik8gR97a/se73cJUJ/honptiRv8l6nOuWDdf2YYPHCfwmM5XFAqiWCctlvpyleM4uQ8eBdSBLl1R9FIRol58+yWTm7OnMtG1EM9/MlPzY4rnNFpJvGVz4xCXP8QPhVnTWckxc/RpPyTORIPhMaU+8DXR5B0OKMaq9kIjqAGwjWx3Lb3CNSwHMAx0al8xN6OGZIXvCX599YCf55ug5sSehIU9aF546Z6j/61a1F28NcbyhW2IVZMbn1BSUcNednwEl6WJivFBuAecK7vfV8KBbJ3n2Oq/MNpbGETpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArL6WqvJQKDjurQJ+hRn+ugEtBucHKKJObYmoU8WoHI=;
 b=EkFKoVZ4GZjn9k1g8ulOZkiDqlAhYqVOrjae4HZLE36zu0cKuhA/kOLMxvM9+HktaCwr8jmBhqTf9kPScuHPcgkdcGXgyltQ5BkIw5JjxN3ixtWNa1NRzNiAer2IedOgWd+hiXb2uTYeUfrbuxPJXoOX7sFP1SOaiZJHvJvwNhwQSnwHT2AvmD7QkjLpwi9tu5Pi3dhBPK8mRO70WKiiwY67NhSBraxeX266+Z+SMOPLmYq/HV16GAouMghax/Gq9bQMFsU9JvZxNyh4IZDqbIuHPiLRWF8U4yFttCjYsJALOJ0u165lvM5nkEwnw4RRSDtrR29BWf1IGWXt7ljpKQ==
Received: from CH2PR11CA0017.namprd11.prod.outlook.com (2603:10b6:610:54::27)
 by SN7PR12MB7936.namprd12.prod.outlook.com (2603:10b6:806:347::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 20:36:37 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:610:54:cafe::e5) by CH2PR11CA0017.outlook.office365.com
 (2603:10b6:610:54::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 20:36:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 20:36:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 13:36:16 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 13:36:14 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 09/16] platform: mellanox: mlx-platform: Add reset callback
Date:   Mon, 14 Aug 2023 20:33:59 +0000
Message-ID: <20230814203406.12399-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814203406.12399-1-vadimp@nvidia.com>
References: <20230814203406.12399-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|SN7PR12MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 36651566-3326-4857-f689-08db9d062815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cm7sg2RnDzP3hJIdtJhV6G10x6UegCR5qMpsgENfpJbFT+2DDffWicd5QqdQHiZdXt+8KWTqC5Z5p7U72/VrcRTn9Bgt3SBbrmrcNm5IEKEnpF4NOVB/KkKrzHF73N7UsDGOCQ65AoagbyXErRv2qLfcz57dtGnneqGpctVBEK0D3p/8vgSCua7aDnT26Do7L8QrUKJthjCcIiFL5dvpFm5c3wvM4NlzSH5HBgcX4YVLTY2zAPQYF6ghyzzmXZbx33DqfgZVtOU1E2FHCu3efxPQ28KyMOi2/0FIZ3p8x+SaoTj8YzpUQMVdK81PEq+Kvb8RQ+sh1fzjqEyz3DK1YcT+4tqbnb7k3L2SaKVMUwQxBgXQd/rmielQxXRmMYcoCNOsjPpevEGRopBTeN8vgHoTv70hv8k3X6fQVa73qRP8/YqAmw9LPRcLRRRJDTV16EiN9aO76OVIGPwgLAAVxtlgXUu8EO3113N85oEOlYec+nhs8r2dcq9NZ+yXFRAAFBJEQYMiZnALaj3+NH2kOL5fA0ObuVX4W55vZ1rx7CsUp6VfUXRe9MQ8NUhgF9QYUGrQmt7IDHjFz0IyBlnLZRtmCoA9OVY5O2J6RC+cpT6GMSGmDuKs0GR7srUhcK3HCcoUpgzXc3W71uLYoBnCpNIuJA9XTMJmUTpcv4lV9GD/wDXJMfDC8bvm8IQpf28/vaDvvYD2MEyBulZBBEsfk4IMTwz/4TG8zG3ni1CiQvICJlgArl5V9xww0Tc2REg/
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(1800799006)(186006)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(107886003)(16526019)(26005)(1076003)(41300700001)(336012)(8936002)(70206006)(70586007)(316002)(8676002)(36860700001)(2616005)(83380400001)(426003)(47076005)(478600001)(40460700003)(40480700001)(6666004)(54906003)(36756003)(86362001)(4326008)(6916009)(82740400003)(356005)(7636003)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 20:36:36.9543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36651566-3326-4857-f689-08db9d062815
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7936
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On L1 switches reset should include special actions against CPLD device
for performing graceful operations.
For that purpose, special PLATFORM_RESET# signal should be indicated.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
v0->v2:
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

