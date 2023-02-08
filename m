Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5715C636CC
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjBHGfr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjBHGfq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:35:46 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753B838B67
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:35:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhK3XlG60NXQkLN+iiX0zdznRdKbCy25MsXOC70UpumDwtHND9m4cnGViDp0LDIJ8kBTRuMYKnmK0CLUTXkHsIDw18eWTZauZJ0mzTiGNgx4cd3DKzPtvMm3366BKkmTu5Ey1pUoZDPJM07uee06j/Nv0OPWOQQuQYDJqrblmG+ziMYsEUQcX70UdU/dBjWOpURFSho2rMnA91N2Hn/p2fIDd8s+BIhhFlodnQcBces1U9xfpkxWzZ/k3/FKtek+ZzCcoUA1n1cia08Q1ooYuF4KXJo+SzlYe79UfWz/wRl6Fa8Trs8RCHYoRc/u1kHvGv06C0mKKfQ31hfKIZet2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k12UtvTSol6Jx2O0zeocFEate1dgpUCIUrTcfxVVASs=;
 b=MXFWhYgqeQV7e4P1CPgBzCe7+0jTjepaydiKRy3g5Q9m3cfRx9aXx2n/FNTrFoeBn0imlE1nwVnC7HIA/YXCypc4Uk1ha+OoMRGZ1zHb138tdVw5BCbjXscUCHaRQr94QGmecfHjI9i6TD4ylNiczDZi8ORTVRidkCsIvZ0O6U2MCdochVtiBy/Ls9U4KGuv7C1vBek9gMmngJHIhjqlv4AtYbRkVWfA1hPwlwyr9TGJTvoXOJQkpMPPc61x6BI/w+HjAZ22JSysKuysfg++y/7qUP4zI8riCAzGl7GL0mAsYxj1fymrgMR+BELh3JKIaA0yQXCLa7cWfTO2AJb3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k12UtvTSol6Jx2O0zeocFEate1dgpUCIUrTcfxVVASs=;
 b=KgTCT0D6bEjDksThUsmk7rcCHU3nAw/VllCXDob3Y85a+kJUdQhUarsrDHgTyBjx85hr7NUkYGjujbKlDNmVgOVHmMumEkeYrm5Off6P4NDk3itgb1O799uuOEUqtjJZWenrzH//vRJfpnoyH8Otr8SveC3DP36JQbc+ryOF2qETdZK+kxjd7++jhsVjBwNv6vyACzAa1JDP7z7oiPlOluL4UJqTiJAsSc5F5SDrulkIFIAcO6bY1qnY1Ue72sByil3jR7VYLWTlV9JaZlVFMB8B8yGPD6CQNMUjVZXVyBPsTscL9MDFHdwAJfvTruBMM//TdyU+U+trLNL9w7mPZQ==
Received: from DS7PR03CA0024.namprd03.prod.outlook.com (2603:10b6:5:3b8::29)
 by CY5PR12MB6324.namprd12.prod.outlook.com (2603:10b6:930:f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Wed, 8 Feb
 2023 06:35:40 +0000
Received: from DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::19) by DS7PR03CA0024.outlook.office365.com
 (2603:10b6:5:3b8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 06:35:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT087.mail.protection.outlook.com (10.13.172.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 06:35:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:35:32 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:35:30 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 05/13] platform: mellanox: Introduce support of new Nvidia L1 switch
Date:   Wed, 8 Feb 2023 08:33:22 +0200
Message-ID: <20230208063331.15560-6-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT087:EE_|CY5PR12MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 488feb46-0510-45f4-5293-08db099eb25c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OTL7CfLLY9vPtU1fxcB/nhApecVN4P1pWH21teviYqDZEsQdKZnze+3wCVQZ2fYNZQE5qBOiPkaE4iZCHIv7rk196TW9cDpr7sw87WzaHahaadQX9p4l1+crHUZAS5BdXiLjhlOd4KYITIoIwEmYRjVPLR3iqSxvcHNl1jU7EK7Jif+G2tJAAfD0J10ORcTLxfXH+xZzQZ7FmSlOtYZkjmBD87pOBCCzA6cq9cTn0eAgI4m81JnhahU3eRGqRvV94rTG4Wu08/+TmWYUXzRBnMkGckMCiN3UpYQRMw0XBu46mr/CzoR2AfkphHRYzElsWd8yN4tCPSZUPpGKy36ZKzSgPSA7n46QGrMfN/ZiLZYmHX1u+jjfHvf2ga/QzAro0m1b0Md5U8MH0H5ZMfIT+9pO2t3h3HzmAl7Fh/+2cpV8OEdA7ycFF17dGohZ7wxNunApfC/hOQYRh1Sl2hyQosW/bwU011/CxGUrgFbW60kHTcH65h++dgaHQU8x63VbvmGcR7tfldvSKlilLnzhyU/GvNddE1daPOLsHzy8OZpHDeVMReEGMnbe8ACbeBMvDnb6fViJaU3rFGKQi2+0PdCo+9JhhqCINbDS+a9TzmWwIoHt8ToUWGV8PdxruudAz7e6MRHpcyn0X0HfcKt5254089CaDAeU1IMjv72mmstBfGno1+oq8d/NbFDuQZr5M1qGVEopf3SlzwZ+CvXnKw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199018)(36840700001)(46966006)(40470700004)(54906003)(356005)(316002)(426003)(47076005)(41300700001)(36860700001)(2906002)(36756003)(8936002)(82740400003)(7636003)(30864003)(5660300002)(40480700001)(83380400001)(70586007)(70206006)(40460700003)(8676002)(6916009)(4326008)(107886003)(6666004)(16526019)(2616005)(82310400005)(478600001)(186003)(26005)(86362001)(1076003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:35:40.3372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 488feb46-0510-45f4-5293-08db099eb25c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6324
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for new L1 switch nodes providing L1 connectivity for
multi-node networking chassis.

The purpose is to provide compute server with full management and IO
subsystems with connections to L1 switches.

System contains the following components:
- COMe module based on Intel Coffee Lake CPU
- Switch baseboard with two ASICs, while
  24 ports of each ASICs are connected to one backplane connector
  32 ports of each ASIC are connected to 8 OSFPs
- Integrated 60mm dual-rotor FANs inside L1 node (N+2 redundancy)
- Support 48V or 54V DC input from the external power server.

Add the structures related to the new systems to allow proper activation
of the all required platform driver.

Add poweroff callback to support deep power cycle flow, which should
include special actions against CPLD device for performing graceful
operation.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 392 +++++++++++++++++++++++++++-
 1 file changed, 391 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index cd7f6ff11b1e..1a07a9994f05 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/i2c-mux-reg.h>
 #include <linux/platform_data/mlxreg.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 
 #define MLX_PLAT_DEVICE_NAME		"mlxplat"
@@ -61,12 +62,19 @@
 #define MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET	0x37
 #define MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET	0x3a
 #define MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET	0x3b
+#define MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET	0x3c
+#define MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET	0x3d
+#define MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET	0x3e
+#define MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET	0x3f
 #define MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET	0x40
 #define MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET	0x41
 #define MLXPLAT_CPLD_LPC_REG_AGGRCO_OFFSET	0x42
 #define MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET	0x43
 #define MLXPLAT_CPLD_LPC_REG_AGGRCX_OFFSET	0x44
 #define MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET 0x45
+#define MLXPLAT_CPLD_LPC_REG_BRD_OFFSET		0x47
+#define MLXPLAT_CPLD_LPC_REG_BRD_EVENT_OFFSET	0x48
+#define MLXPLAT_CPLD_LPC_REG_BRD_MASK_OFFSET	0x49
 #define MLXPLAT_CPLD_LPC_REG_GWP_OFFSET		0x4a
 #define MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET	0x4b
 #define MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET	0x4c
@@ -96,6 +104,9 @@
 #define MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET	0x94
 #define MLXPLAT_CPLD_LPC_REG_EROTE_EVENT_OFFSET	0x95
 #define MLXPLAT_CPLD_LPC_REG_EROTE_MASK_OFFSET	0x96
+#define MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET	0x97
+#define MLXPLAT_CPLD_LPC_REG_PWRB_EVENT_OFFSET	0x98
+#define MLXPLAT_CPLD_LPC_REG_PWRB_MASK_OFFSET	0x99
 #define MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET	0x9a
 #define MLXPLAT_CPLD_LPC_REG_LC_VR_EVENT_OFFSET	0x9b
 #define MLXPLAT_CPLD_LPC_REG_LC_VR_MASK_OFFSET	0x9c
@@ -127,6 +138,7 @@
 #define MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET	0xd1
 #define MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET	0xd2
 #define MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET	0xd3
+#define MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET	0xd9
 #define MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET	0xde
 #define MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET	0xdf
 #define MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET	0xe0
@@ -210,6 +222,7 @@
 					 MLXPLAT_CPLD_AGGR_MASK_LC_SDWN)
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_LOW	0xc1
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2	BIT(2)
+#define MLXPLAT_CPLD_LOW_AGGR_MASK_PWR_BUT	BIT(4)
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_I2C	BIT(6)
 #define MLXPLAT_CPLD_PSU_MASK		GENMASK(1, 0)
 #define MLXPLAT_CPLD_PWR_MASK		GENMASK(1, 0)
@@ -223,6 +236,16 @@
 #define MLXPLAT_CPLD_VOLTREG_UPD_MASK	GENMASK(5, 4)
 #define MLXPLAT_CPLD_GWP_MASK		GENMASK(0, 0)
 #define MLXPLAT_CPLD_EROT_MASK		GENMASK(1, 0)
+#define MLXPLAT_CPLD_PWR_BUTTON_MASK	BIT(0)
+#define MLXPLAT_CPLD_LATCH_RST_MASK	BIT(5)
+#define MLXPLAT_CPLD_THERMAL1_PDB_MASK	BIT(3)
+#define MLXPLAT_CPLD_THERMAL2_PDB_MASK	BIT(4)
+#define MLXPLAT_CPLD_INTRUSION_MASK	BIT(6)
+#define MLXPLAT_CPLD_PWM_PG_MASK	BIT(7)
+#define MLXPLAT_CPLD_L1_CHA_HEALTH_MASK (MLXPLAT_CPLD_THERMAL1_PDB_MASK | \
+					 MLXPLAT_CPLD_THERMAL2_PDB_MASK | \
+					 MLXPLAT_CPLD_INTRUSION_MASK |\
+					 MLXPLAT_CPLD_PWM_PG_MASK)
 #define MLXPLAT_CPLD_I2C_CAP_BIT	0x04
 #define MLXPLAT_CPLD_I2C_CAP_MASK	GENMASK(5, MLXPLAT_CPLD_I2C_CAP_BIT)
 
@@ -235,6 +258,8 @@
 /* Masks for aggregation for modular systems */
 #define MLXPLAT_CPLD_LPC_LC_MASK	GENMASK(7, 0)
 
+#define MLXPLAT_CPLD_HALT_MASK		BIT(3)
+
 /* Default I2C parent bus number */
 #define MLXPLAT_CPLD_PHYS_ADAPTER_DEF_NR	1
 
@@ -315,6 +340,8 @@ struct mlxplat_priv {
 	void *regmap;
 };
 
+static struct platform_device *mlxplat_dev;
+
 /* Regions for LPC I2C controller and LPC base register space */
 static const struct resource mlxplat_lpc_resources[] = {
 	[0] = DEFINE_RES_NAMED(MLXPLAT_CPLD_LPC_I2C_BASE_ADRR,
@@ -2307,6 +2334,156 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_rack_switch_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
+/* Callback performs graceful shutdown after notification about power button event */
+static int
+mlxplat_mlxcpld_l1_switch_pwr_events_handler(void *handle, enum mlxreg_hotplug_kind kind,
+					     u8 action)
+{
+	dev_info(&mlxplat_dev->dev, "System shutdown due to short press of power button");
+	kernel_halt();
+	return 0;
+}
+
+static struct mlxreg_core_hotplug_notifier mlxplat_mlxcpld_l1_switch_pwr_events_notifier = {
+	.user_handler = mlxplat_mlxcpld_l1_switch_pwr_events_handler,
+};
+
+/* Platform hotplug for l1 switch systems family data  */
+static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_pwr_events_items_data[] = {
+	{
+		.label = "power_button",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
+		.mask = MLXPLAT_CPLD_PWR_BUTTON_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+		.hpdev.notifier = &mlxplat_mlxcpld_l1_switch_pwr_events_notifier,
+	},
+};
+
+/* Callback activates latch reset flow after notification about intrusion event */
+static int
+mlxplat_mlxcpld_l1_switch_intrusion_events_handler(void *handle, enum mlxreg_hotplug_kind kind,
+						   u8 action)
+{
+	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
+	u32 regval;
+	int err;
+
+	err = regmap_read(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET, &regval);
+	if (err)
+		goto fail_regmap_read;
+
+	if (action) {
+		dev_info(&mlxplat_dev->dev, "Detected intrusion - system latch is opened");
+		err = regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+				   regval | MLXPLAT_CPLD_LATCH_RST_MASK);
+	} else {
+		dev_info(&mlxplat_dev->dev, "System latch is properly closed");
+		err = regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+				   regval & ~MLXPLAT_CPLD_LATCH_RST_MASK);
+	}
+
+	if (err)
+		goto fail_regmap_write;
+
+	return 0;
+
+fail_regmap_read:
+fail_regmap_write:
+	dev_err(&mlxplat_dev->dev, "Register access failed");
+	return err;
+}
+
+static struct mlxreg_core_hotplug_notifier mlxplat_mlxcpld_l1_switch_intrusion_events_notifier = {
+	.user_handler = mlxplat_mlxcpld_l1_switch_intrusion_events_handler,
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_health_events_items_data[] = {
+	{
+		.label = "thermal1_pdb",
+		.reg = MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
+		.mask = MLXPLAT_CPLD_THERMAL1_PDB_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "thermal2_pdb",
+		.reg = MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
+		.mask = MLXPLAT_CPLD_THERMAL2_PDB_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+	{
+		.label = "intrusion",
+		.reg = MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
+		.mask = MLXPLAT_CPLD_INTRUSION_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+		.hpdev.notifier = &mlxplat_mlxcpld_l1_switch_intrusion_events_notifier,
+	},
+	{
+		.label = "pwm_pg",
+		.reg = MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
+		.mask = MLXPLAT_CPLD_PWM_PG_MASK,
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
+};
+
+static struct mlxreg_core_item mlxplat_mlxcpld_l1_switch_events_items[] = {
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
+	{
+		.data = mlxplat_mlxcpld_l1_switch_pwr_events_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET,
+		.mask = MLXPLAT_CPLD_PWR_BUTTON_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_pwr_events_items_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_l1_switch_health_events_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_BRD_OFFSET,
+		.mask = MLXPLAT_CPLD_L1_CHA_HEALTH_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_health_events_items_data),
+		.inversed = 0,
+		.health = false,
+		.ind = 8,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_l1_switch_data = {
+	.items = mlxplat_mlxcpld_l1_switch_events_items,
+	.counter = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_events_items),
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_COMEX,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW | MLXPLAT_CPLD_LOW_AGGR_MASK_PWR_BUT,
+};
+
 /* Platform led default data */
 static struct mlxreg_core_data mlxplat_mlxcpld_default_led_data[] = {
 	{
@@ -2836,6 +3013,114 @@ static struct mlxreg_core_platform_data mlxplat_modular_led_data = {
 		.counter = ARRAY_SIZE(mlxplat_mlxcpld_modular_led_data),
 };
 
+/* Platform led data for chassis system */
+static struct mlxreg_core_data mlxplat_mlxcpld_l1_switch_led_data[] = {
+	{
+		.label = "status:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "status:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
+	},
+	{
+		.label = "fan1:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(0),
+	},
+	{
+		.label = "fan1:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(0),
+	},
+	{
+		.label = "fan2:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(1),
+	},
+	{
+		.label = "fan2:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(1),
+	},
+	{
+		.label = "fan3:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(2),
+	},
+	{
+		.label = "fan3:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(2),
+	},
+	{
+		.label = "fan4:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(3),
+	},
+	{
+		.label = "fan4:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(3),
+	},
+	{
+		.label = "fan5:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(4),
+	},
+	{
+		.label = "fan5:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(4),
+	},
+	{
+		.label = "fan6:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(5),
+	},
+	{
+		.label = "fan6:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(5),
+	},
+	{
+		.label = "uid:blue",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED5_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_l1_switch_led_data = {
+		.data = mlxplat_mlxcpld_l1_switch_led_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_l1_switch_led_data),
+};
+
 /* Platform register access default */
 static struct mlxreg_core_data mlxplat_mlxcpld_default_regs_io_data[] = {
 	{
@@ -3367,12 +3652,48 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mask = GENMASK(7, 0) & ~BIT(3),
 		.mode = 0200,
 	},
+	{
+		.label = "deep_pwr_cycle",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0200,
+	},
+	{
+		.label = "latch_reset",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0200,
+	},
 	{
 		.label = "jtag_enable",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
 		.mask = GENMASK(7, 0) & ~BIT(4),
 		.mode = 0644,
 	},
+	{
+		.label = "dbg1",
+		.reg = MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0644,
+	},
+	{
+		.label = "dbg2",
+		.reg = MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0644,
+	},
+	{
+		.label = "dbg3",
+		.reg = MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0644,
+	},
+	{
+		.label = "dbg4",
+		.reg = MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0644,
+	},
 	{
 		.label = "asic_health",
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
@@ -4586,11 +4907,18 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_OFFSET:
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRCO_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRCX_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_BRD_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_BRD_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_BRD_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC2_EVENT_OFFSET:
@@ -4605,6 +4933,8 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_EROT_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROTE_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROTE_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWRB_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWRB_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_IN_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_IN_MASK_OFFSET:
@@ -4633,6 +4963,7 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM3_OFFSET:
@@ -4683,6 +5014,10 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRCO_OFFSET:
@@ -4692,6 +5027,9 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_GWP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_BRD_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_BRD_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_BRD_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
@@ -4713,6 +5051,9 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROTE_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROTE_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWRB_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWRB_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLC_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET:
@@ -4749,6 +5090,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET:
@@ -4825,6 +5167,10 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_SAFE_BIOS_WP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRCO_OFFSET:
@@ -4834,6 +5180,9 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_GWP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GWP_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GWP_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_BRD_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_BRD_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_BRD_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET:
@@ -4855,6 +5204,9 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_EROTE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROTE_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_EROTE_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWRB_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWRB_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWRB_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLC_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET:
@@ -4885,6 +5237,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_WD2_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TLEFT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_DBG_CTRL_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET:
@@ -5080,7 +5433,6 @@ static struct resource mlxplat_mlxcpld_resources[] = {
 	[0] = DEFINE_RES_IRQ_NAMED(MLXPLAT_CPLD_LPC_SYSIRQ, "mlxreg-hotplug"),
 };
 
-static struct platform_device *mlxplat_dev;
 static struct mlxreg_core_hotplug_platform_data *mlxplat_i2c;
 static struct mlxreg_core_hotplug_platform_data *mlxplat_hotplug;
 static struct mlxreg_core_platform_data *mlxplat_led;
@@ -5090,6 +5442,14 @@ static struct mlxreg_core_platform_data
 	*mlxplat_wd_data[MLXPLAT_CPLD_WD_MAX_DEVS];
 static const struct regmap_config *mlxplat_regmap_config;
 
+/* Platform default poweroff function */
+static void mlxplat_poweroff(void)
+{
+	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
+
+	regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET, MLXPLAT_CPLD_HALT_MASK);
+}
+
 static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
 {
 	int i;
@@ -5385,6 +5745,28 @@ static int __init mlxplat_dmi_ng800_matched(const struct dmi_system_id *dmi)
 	return 1;
 }
 
+static int __init mlxplat_dmi_l1_switch_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_rack_switch_mux_data);
+	mlxplat_mux_data = mlxplat_rack_switch_mux_data;
+	mlxplat_hotplug = &mlxplat_mlxcpld_l1_switch_data;
+	mlxplat_hotplug->deferred_nr =
+		mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
+	mlxplat_led = &mlxplat_l1_switch_led_data;
+	mlxplat_regs_io = &mlxplat_default_ng_regs_io_data;
+	mlxplat_fan = &mlxplat_default_fan_data;
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
+		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_rack_switch;
+	pm_power_off = mlxplat_poweroff;
+
+	return 1;
+}
+
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{
 		.callback = mlxplat_dmi_default_wc_matched,
@@ -5473,6 +5855,12 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "VMOD0015"),
 		},
 	},
+	{
+		.callback = mlxplat_dmi_l1_switch_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0017"),
+		},
+	},
 	{
 		.callback = mlxplat_dmi_msn274x_matched,
 		.matches = {
@@ -5802,6 +6190,8 @@ static void __exit mlxplat_exit(void)
 	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
 	int i;
 
+	if (pm_power_off)
+		pm_power_off = NULL;
 	for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0 ; i--)
 		platform_device_unregister(priv->pdev_wd[i]);
 	if (priv->pdev_fan)
-- 
2.20.1

