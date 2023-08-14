Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBACDC04A94
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 09:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235516AbjHNJCL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 05:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235741AbjHNJB6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 05:01:58 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B97171B
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 02:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO8EPSQfLKe0Uq1ZuwWIALmZt7Pig9q5VKnGK1GP79GN256gWbyTr7rrU1l0QY5WRUUEHREd2Dn69PDMTSkKCxNPXwQQgSIQe5FVrvk9LuHp+0EOGLibcT0O6NaGRVPzCxJeOZob90fLgQIV0D+hmsSuLqalMFfZVTFZAzpk/9MxnvKeGt97XlR5b3wrq0uOyTI6BEyi/E926623QRp6WeJl+ZA1GWhoxoVuu5XHbSE3O838I7hV7OkYZm3OcNkuCbI3cVg6Kbu6x0jkJhycMjlzDvWeQ/0tOsOudLHy+E43pE9wbEoyriNyJ7G8kDjYOK+hxIvKbRgSJCE6xgk31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGZsqncu6h51vEmJbmlJgNA4y6AnXVWWChYo3Cws2sc=;
 b=XWbL9di9jPAgQEze4TkXEMT5eOJ32w4ZPb1lxh8F4LrqxLvkEOElIbHl+Dl56kLkpAzb9v1Cg1rqZZ73OwrjmT1advrs9/MQCDCQ5HsvJbmMkPZ88RB7pCqL5h5XviRWDCxlYh1+ISx8OTAmA831TUPr9CExyzc9+NhOixvo31+h6h1Wh5VVc4kr098WNI2RmxzXo0wZzyKe3++MovT5+ddJ+/KjgqY9hYXcIPl7PA2NysTOWlEZ7tfhG7Wy9pWTGsS47hmcBiRtM0I57e5X19whkvoPivxTp/v6+lzP0XDWhb9BPBwlJbLyJ7DkJ/PSv63tppvFIUAtgEe8oqsqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGZsqncu6h51vEmJbmlJgNA4y6AnXVWWChYo3Cws2sc=;
 b=ofBUBsbCgQ/Z9uxhPSSu4iwu8HsY7UEryrXunB/QgwK7qr+bLQt3krVdhaHAl7qAw20cE+BjKBnwBaX/c5wM7uz05Fd1kGW8h9PF6qFfbW53ag2cgRqz4/PnyJeyO/WSx8+lb53tAco+GhscNFpzHeXE325lDJnu7314kYwPfD8ZL+yYXh1bTQyeN3mxz9MKBwl4z1gG6vm1FeD5hYxpuOv48ScSV1JuQimDD9L5Xu13h8vOBGwICg2hKYtTwQdedzAWewb8eMfvQD/MsgiyHOARoyTPJnyfx/D8B1qdBRVPbPVOC8Nt2HFpONG7N1TAEhtHll8hmRFU9oU7F6exDA==
Received: from SJ0PR03CA0357.namprd03.prod.outlook.com (2603:10b6:a03:39c::32)
 by SA3PR12MB7974.namprd12.prod.outlook.com (2603:10b6:806:307::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 09:01:34 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::cc) by SJ0PR03CA0357.outlook.office365.com
 (2603:10b6:a03:39c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 09:01:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 09:01:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 02:01:16 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 02:01:15 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 09/16] platform: mellanox: mlx-platform: Add reset callback
Date:   Mon, 14 Aug 2023 08:59:03 +0000
Message-ID: <20230814085910.56069-10-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230814085910.56069-1-vadimp@nvidia.com>
References: <20230814085910.56069-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|SA3PR12MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed2e335-5539-49f3-ed31-08db9ca50f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k+4duESRR6WMW8SltV3tlNT4xWucul22tjCJ5wD5ewnS1KyBF5JT6cO3jteLUNy7+7I1eABvwL2uNwDBrS2bcGLS39ABySWeENVI8diq8VE40xLjLrsGAAQEwdAZQWjGHDZHW6TX6gqLs3yM/ufG4h/VCqmNChYhs+8fsOegkZTWQHWE09CGxgUDgJ078lqLrceMikdnR1H78+H4thhLETig/U8DNrm90gBOpH+SMjNB2G9qPyp4iOQTvsSVmYTZXo7rrrVLmDz5zfRiLuURVxViaOouyzZWYHG6+5sm8ZZOzzh7S679V6YPu02tA59ccUuq11hrU+XrtloHdpE05HsXgNX1CKaZCndVHMmaIgXFm3qnOzzhJAhB4s27ORenmrHTG41D0N38Zn7JQT4SmtibTBUAIdJzj5IL3YzU8VjqjVKfhBWHGsw6amuT9Gk+5zPcLNLc6F9kmKp3kHSSSW8OFgLlQTRwWCJNL2luUJaVfprSFVevzfmB0x/p8iBd28dkF5Or6VFHCZ+KLezI4yKVgB3lwhlO9VfgaXweJ+4MreEm4G5yL1fC92Iq2BnrM83/kZDmuXUq3zOlPHURbHKUURfQ+Ss9MteYyg0ok7C6EdWJ4xxh83a45H+PB5o65GLFqmrVIQz90Ex05dQ6gqSeqaazGQTsbXrzWD4p64pZTcqlfFdY4Rm82m3Vd10W4nzz+PuhzFAZ272qBKUqZ29Gf1RMkq2GuwWCLkgx+7LaIocfAwWRZtejDyleWoEm
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(186006)(1800799006)(451199021)(82310400008)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(478600001)(7636003)(356005)(82740400003)(6666004)(8936002)(8676002)(4326008)(70206006)(54906003)(6916009)(316002)(41300700001)(70586007)(83380400001)(36860700001)(47076005)(336012)(26005)(16526019)(1076003)(107886003)(426003)(2616005)(86362001)(2906002)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:01:33.7677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed2e335-5539-49f3-ed31-08db9ca50f07
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7974
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On L1 switches reset should include special actions against CPLD device
for performing graceful operations.
For that purpose, special PLATFORM_RESET# signal should be indicated.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 45 +++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 1010064d54e9..b577ce572ab1 100644
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
@@ -265,6 +266,7 @@
 #define MLXPLAT_CPLD_LPC_LC_MASK	GENMASK(7, 0)
 
 #define MLXPLAT_CPLD_HALT_MASK		BIT(3)
+#define MLXPLAT_CPLD_RESET_MASK		0xfe
 
 /* Default I2C parent bus number */
 #define MLXPLAT_CPLD_PHYS_ADAPTER_DEF_NR	1
@@ -441,6 +443,7 @@ static struct i2c_mux_reg_platform_data mlxplat_default_mux_data[] = {
 static int mlxplat_max_adap_num;
 static int mlxplat_mux_num;
 static struct i2c_mux_reg_platform_data *mlxplat_mux_data;
+static struct notifier_block *mlxplat_reboot_nb;
 
 /* Platform extended mux data */
 static struct i2c_mux_reg_platform_data mlxplat_extended_mux_data[] = {
@@ -2361,8 +2364,11 @@ static int
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
 
@@ -4957,6 +4963,7 @@ static struct mlxreg_core_platform_data mlxplat_mlxcpld_wd_set_type3[] = {
 static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED2_OFFSET:
@@ -5065,6 +5072,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
@@ -5229,6 +5237,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD5_PN1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
@@ -5533,11 +5542,33 @@ static struct mlxreg_core_platform_data
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
+	if (action == SYS_RESTART && !ret && regval & BIT(0))
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
@@ -5861,6 +5892,7 @@ static int __init mlxplat_dmi_l1_switch_matched(const struct dmi_system_id *dmi)
 	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
 	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_rack_switch;
 	pm_power_off = mlxplat_poweroff;
+	mlxplat_reboot_nb = &mlxplat_reboot_default_nb;
 
 	return 1;
 }
@@ -6410,8 +6442,15 @@ static int __init mlxplat_init(void)
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
@@ -6429,6 +6468,8 @@ static void __exit mlxplat_exit(void)
 
 	if (pm_power_off)
 		pm_power_off = NULL;
+	if (mlxplat_reboot_nb)
+		unregister_reboot_notifier(mlxplat_reboot_nb);
 	mlxplat_pre_exit(priv);
 	mlxplat_i2c_main_exit(priv);
 	mlxplat_post_exit();
-- 
2.20.1

