Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663E0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 23 Oct 2021 09:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CB3E60FBF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 23 Oct 2021 09:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhJWJnI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 23 Oct 2021 05:43:08 -0400
Received: from mail-sn1anam02on2079.outbound.protection.outlook.com ([40.107.96.79]:27105
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229908AbhJWJnH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 23 Oct 2021 05:43:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKEL4iPOlgevbuLFlWRKap5mmxl9ESOvJo9rXa1RVYAlXq46adhFVcUxFCWvLqFNLjqXoEyljnPvSCKTArezb3hi2ODMocTVGg/Y65y/Jaj8CGnn2KUY0JPUljAPbe+KcfWhF2eCtNwCby69IVJvwj3juOz6sartzd1kNQyOiA/hm7w7sTb/r7BRs6HXDq2UwtOR9H87hzHX+hKMXNzayVtSh/4EAVlz0wh1M86QeXYyIZOMUUo2+H294La+RsV6O3mcc38mo+s3Vut1q+ZBw4wAGRKgl/myxgn3xbsgoU8J/Aq8K4iXEXi71LSFGriz10I0Apb7ZAU8PyyCiWMo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07uPai03nq+FfO1qhIcg7LazHLrXQ9hihBEKu3vMrlM=;
 b=nIK5ibSoyxTsmGfZgkrsMQtyef4myXn03lwAa3xPMpNRUYLkt33Ho30d64B+9EDN66V+KhXHRkHehsD2dGgDG2mD6JxqYm3+vAjqHUohu+aB1Y08fYSfDzYtYQfzcy55dzqTujxqLQz/9tHkYW7fiO0fAV1UwggppNuu7l8UJALceoMAaWSXZpawwkvgFbINtU7++E55/NcBfDTqoYGww6a3JJHdthDlxJPLpWOes+ygCjNA0iXR4+s0JSvLUtc9yS2jzEI+ZNYGSp2DLKoK9jXb2MCeuN7b3ZBXoXxxufR5nbdOHOcOsR9Yt0IQksJVFN4VDjdjf3f1AANpOZ6ORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07uPai03nq+FfO1qhIcg7LazHLrXQ9hihBEKu3vMrlM=;
 b=O8NiQkUbVAZ0HiChlubRH9qv1tBuDF+ZbNMXr2ddhB+ngCQ23sa52XBOMPkl4/iDdWpsJKpf5Ss/809e23/+fuc5FaYQUpfzvXmhl84XIzYv3oLxV9UInEoksyO8SWQ0Tdrht15VKCCxOvN9iOAqxgu3tDLiPbeyb/IpgyKFY5ooXEcOh7VaDocadEiZ53nNO0pxijXrYF9nVnq+zFHT0XKJHOZHt4tsC/JEznz40mIIpPZf2sKxUZ+WF0VYh5fDoXfZZeaqb5zpZt4Z/kwJwCOQ2xd0Vq4XUT7YdH+24LU/J9GvAdxvl59Dw5r8J1OnzPApP1tb6hSJzc95RVjbNg==
Received: from MW2PR16CA0004.namprd16.prod.outlook.com (2603:10b6:907::17) by
 SN6PR12MB4621.namprd12.prod.outlook.com (2603:10b6:805:e4::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18; Sat, 23 Oct 2021 09:40:47 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::49) by MW2PR16CA0004.outlook.office365.com
 (2603:10b6:907::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Sat, 23 Oct 2021 09:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Sat, 23 Oct 2021 09:40:47 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 23 Oct 2021 09:40:44 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <oleksandrs@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 1/3] platform/x86: mlx-platform: Extend FAN and LED configuration to support new MQM97xx systems
Date:   Sat, 23 Oct 2021 12:40:20 +0300
Message-ID: <20211023094022.4193813-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023094022.4193813-1-vadimp@nvidia.com>
References: <20211023094022.4193813-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da7d138f-4dcd-4105-e44e-08d99609311f
X-MS-TrafficTypeDiagnostic: SN6PR12MB4621:
X-Microsoft-Antispam-PRVS: <SN6PR12MB4621C6B1FD2AB1FCA0F8D875AF819@SN6PR12MB4621.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:308;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5BS4wMLPFu9AJ/wvlWaFNisVqCrIe60P6gTZakPyIsrdg09lEcLMCCQUPxaFAVCw2WlbILTBiTB8BGGBuC0W9Ay8lMp2f/VAfG8mwitqOII8C4HUX/nL++DfpI5cb7/xUBQsVYnlq3ePZHIdc4nU7XkIH9wQbiHkM5JXJ6mOwAv5RRPyLlHBHIMOEVpAWXQxUrdpygDyTJ4KpfTwCsMUKPq3vILQ9+c/VufG4PtePrCw8pN3/sWRoZFA+FwlZJPK5ExIMwTBLxZJZe37VSSlUXFPWYFBnRWaYvOzaAw4cnOGihFC2FAbMyzJTqisO5/3R4t3FJE+JGoR6eXqAKcFnkIUqEAdUwc1lTMYht6xD+UrouXxR4h0mZFEKByPof/7e1zDQ8uUpqHj9lQd5JH70DMg331mnJHqPM4Mcrx0x0Sgs7gmbNJY2vF8y/sANJccWl4arlC7xeB8ypBoMv8wIe+MgZoOS654EkRQ+kEItQ900mQfbUm77pAiyDsbOx55RFjKP4Oc5Pfr2MJwRpBBcueoGiYUpJ/iP/aJ4aJUnC38V3VczaOmaRah1DKiT+FyfBN01fYwtGAlhB8COM0gu5J7a0VMZEMvTGpIWT8agOEZn7oSjlYcoUGmxjWO9VceUCZ1F7UjNwWqE32RzEEcEj7M/88fPlQBYFCLdxV0FMG3Jozv669u+RT/Nzj/983+xTaXQmKI3PXvOyznTJRTFQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(36756003)(86362001)(36860700001)(6666004)(47076005)(2616005)(26005)(1076003)(336012)(508600001)(8676002)(70206006)(107886003)(70586007)(5660300002)(4326008)(7636003)(316002)(356005)(2906002)(8936002)(16526019)(186003)(54906003)(36906005)(426003)(6916009)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2021 09:40:47.1592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da7d138f-4dcd-4105-e44e-08d99609311f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4621
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for new system types "MQM97xx", which is based on Mellanox
Quantum-2 ASIC. It provides up to 64x400GB/s (IB) full bidirectional
bandwidth per port using PAM-4 modulation. The system support 32 OSFP
cages that can provide 64x400GB/s per port (two ports/cage). The system
fits standard 1U racks.

System is equipped with seven fan drawers and with per fan drawer LED
on backport panel and uses two-bytes for exposing CPLD Part Number
versions.

System is recognized by "DMI_BOARD_NAME" match, when this field is set
to "VMOD0010".

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Oleksandr Shamray <oleksandrs@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 56 ++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 7606165980c3..06fe58aaa23b 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -27,9 +27,13 @@
 #define MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET	0x02
 #define MLXPLAT_CPLD_LPC_REG_CPLD4_VER_OFFSET	0x03
 #define MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET	0x04
+#define MLXPLAT_CPLD_LPC_REG_CPLD1_PN1_OFFSET	0x05
 #define MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET	0x06
+#define MLXPLAT_CPLD_LPC_REG_CPLD2_PN1_OFFSET	0x07
 #define MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET	0x08
+#define MLXPLAT_CPLD_LPC_REG_CPLD3_PN1_OFFSET	0x09
 #define MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET	0x0a
+#define MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET	0x0b
 #define MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET	0x1c
 #define MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET	0x1d
 #define MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET	0x1e
@@ -127,6 +131,8 @@
 #define MLXPLAT_CPLD_LPC_REG_TACHO10_OFFSET	0xee
 #define MLXPLAT_CPLD_LPC_REG_TACHO11_OFFSET	0xef
 #define MLXPLAT_CPLD_LPC_REG_TACHO12_OFFSET	0xf0
+#define MLXPLAT_CPLD_LPC_REG_TACHO13_OFFSET	0xf1
+#define MLXPLAT_CPLD_LPC_REG_TACHO14_OFFSET	0xf2
 #define MLXPLAT_CPLD_LPC_REG_PWM3_OFFSET	0xf3
 #define MLXPLAT_CPLD_LPC_REG_PWM4_OFFSET	0xf4
 #define MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET	0xf5
@@ -194,7 +200,7 @@
 #define MLXPLAT_CPLD_PWR_EXT_MASK	GENMASK(3, 0)
 #define MLXPLAT_CPLD_FAN_MASK		GENMASK(3, 0)
 #define MLXPLAT_CPLD_ASIC_MASK		GENMASK(1, 0)
-#define MLXPLAT_CPLD_FAN_NG_MASK	GENMASK(5, 0)
+#define MLXPLAT_CPLD_FAN_NG_MASK	GENMASK(6, 0)
 #define MLXPLAT_CPLD_LED_LO_NIBBLE_MASK	GENMASK(7, 4)
 #define MLXPLAT_CPLD_LED_HI_NIBBLE_MASK	GENMASK(3, 0)
 #define MLXPLAT_CPLD_VOLTREG_UPD_MASK	GENMASK(5, 4)
@@ -933,6 +939,14 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_fan_items_data[] = {
 		.bit = BIT(5),
 		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
 	},
+	{
+		.label = "fan7",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = BIT(6),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(6),
+		.hpdev.nr = MLXPLAT_CPLD_NR_NONE,
+	},
 };
 
 static struct mlxreg_core_item mlxplat_mlxcpld_default_ng_items[] = {
@@ -2164,6 +2178,20 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_led_data[] = {
 		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
 		.bit = BIT(5),
 	},
+	{
+		.label = "fan7:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED6_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(6),
+	},
+	{
+		.label = "fan7:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED6_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(6),
+	},
 	{
 		.label = "uid:blue",
 		.reg = MLXPLAT_CPLD_LPC_REG_LED5_OFFSET,
@@ -3526,6 +3554,20 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_data[] = {
 		.bit = BIT(3),
 		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
 	},
+	{
+		.label = "tacho13",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO13_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET,
+		.bit = BIT(4),
+	},
+	{
+		.label = "tacho14",
+		.reg = MLXPLAT_CPLD_LPC_REG_TACHO14_OFFSET,
+		.mask = GENMASK(7, 0),
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET,
+		.bit = BIT(5),
+	},
 	{
 		.label = "conf",
 		.capability = MLXPLAT_CPLD_LPC_REG_TACHO_SPEED_OFFSET,
@@ -3835,9 +3877,13 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_VER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD1_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD2_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD3_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
@@ -3935,6 +3981,8 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_TACHO10_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO11_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO12_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO13_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO14_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET:
@@ -3958,9 +4006,13 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_VER_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD1_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD2_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD3_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
@@ -4050,6 +4102,8 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_TACHO10_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO11_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO12_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO13_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_TACHO14_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_CAP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_CAP2_OFFSET:
-- 
2.20.1

