Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D451C433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2252F61353
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbhJBJfD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Oct 2021 05:35:03 -0400
Received: from mail-sn1anam02on2041.outbound.protection.outlook.com ([40.107.96.41]:29894
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232655AbhJBJfD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Oct 2021 05:35:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5homhpgReACANLso8ppqv0eTFKClMsrSqewn4ggxY5ZLJiYoxuDRSSQ/nPfCS1cgIWaOEkrujIjDoF29w0YwdDgDC2EsXQ2Km4aPPj5180gz3ABayqny029SrYLPtqbtWZfINpv7agtoiknTz5z6V4GtTQY2mH0+L+6Fa9+O/RcR38ZoyIjpAOaMMgqUiD0SMM7axGqWWcdya0ndmBT7Ak4sMLxayZl998ZtvG62bakc9IbwJgGEUGKyT1/knLg71ImB/rGdrRMwalOjwwHiiSBDz9IYfYmKFkTLuJ1wkj+fppj6GAMCBbEes4W29VYG87ApM5Y1li543RKtGLmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkeH0s9RQ7j1+/lVSgD+2N79LQI4+LpjPci3erKZiTs=;
 b=CEBF7q7MAn8DhkxBd454bVubQDTnRLZgzugsPe32jx42tCYvV0IFzmLB/D7HEDy5Xd8a9gmxF48gq5ou8yrniAoE/IMMtfoVKWYxYm5M8AJ17ymqAGq2zwXcvg8fBdhsHEXkmDQ090vep59p3rsWBaFqx1TtFAaOpXrox5diZxsJByAfXqgDir4kqP8cxzwkPBh5BrVNyrnBCDkeMsVvUs00NPR71ceeWX7ebL70y3tDmOIU9g9+grPmecp+S3jpGKgSyMZ6gGT+AZ1WtNERWcLDpjEwXUQgtPyHt5o5y60tVg95Zz33pwYRatopDmIy4gcLt4MAqJZzW7K72s5Slw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkeH0s9RQ7j1+/lVSgD+2N79LQI4+LpjPci3erKZiTs=;
 b=Oaawawkt78+bxjkZUPEqLrjS5mZHwguhXeXworyGh9sOc3fq4FPCtHsktDgkqqJhMb7HPSZhdDR6suTKinevGFHKqAyXnT+1DE12q1Iu/vKoH+0B1DqnMX2GdVbjEzsgnH1Ug9Xvhignt/V13i1MGjLGQD4cpgpRyWP/9849xxFEteMU567x6DumnR/JW1LQ5Pr9la64lgv8NRgj8w+xGmF29fhsOwz5y3CarR5etj/n2Kbyl522xgha1FD5MEoET3dbh47iskm9zN4m8T43WRBKMCeKPDdTiPe6HoV1lONXxHGAE5z+CSyrntZ/KdSM0Dq+l+3M7u78HN1QKVvjvg==
Received: from MW4PR04CA0173.namprd04.prod.outlook.com (2603:10b6:303:85::28)
 by MN2PR12MB4832.namprd12.prod.outlook.com (2603:10b6:208:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Sat, 2 Oct
 2021 09:33:15 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::c5) by MW4PR04CA0173.outlook.office365.com
 (2603:10b6:303:85::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Sat, 2 Oct 2021 09:33:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Sat, 2 Oct 2021 09:33:14 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 2 Oct 2021 09:33:12 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <michaelsh@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 07/10] platform/mellanox: mlxreg-lc: Add initial support for Nvidia line card devices
Date:   Sat, 2 Oct 2021 12:32:36 +0300
Message-ID: <20211002093238.3771419-8-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002093238.3771419-1-vadimp@nvidia.com>
References: <20211002093238.3771419-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33c75300-95df-41e4-be8b-08d98587a8e4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4832:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4832CD63800177D1A6A9B3B4AFAC9@MN2PR12MB4832.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TKm4iVlbAXYvPnmwRyQSqZPyvxq48m/0a3wAHU3AGhuAXrP6ZFVqvGmj8lRqUS2LdohFpudiUXf/Ghx+oiU7XhMpMY3myiYvgAVxQwRTyxUUhBfSenppB+sxdMhuSg45TqvXvow9+jrfhYfp3DhVF5Trtksibq5dgPc34saUQ+2pAu+aOeYFa39vAEsZz+iHlG0MqMPKGZ/X+okP+ZrrnXt0LE6Lh43atnIB5aEfxG0aoTz13ht3D7XNu6RRIR6Bk3pmXk4CKMQKN5xZBIM1ticjBM4aqzwbgaalpsVI4NH5TI8N9slFfX2Gp1kHyGrfjLFJt7W7RrpmGb7mVFRhERbs0jWB2iRsTfceA5eQoDi1PiON7zCQnh2bFXmAY9gu2fQfOq7T1Ohn6DsxMXBw8AqlLwTNWTzUMo64QQ5slxJ9oBS2Zhr0/7Bwywg/jDTc0q7AGYyZ8k1/mnu0+z7OsPeUUyTEk05Q2j1W31z4I8cjPwTSwfbswrax5s3yNL1muK0kaUXo3aNR6ZyMsz37pvdN37ZBqhrv6a6HqBHMP0OnG2SdbENjD8tZNfWg/BzW/Ro+KIv1lW7lDIIMdN8B88H9L16Ge0JcaVG+5z4NFdMGBPY6RS4AyefsGZ3GWIaaxnNu7ddB0u5bVNY9bM8O+biiV3IVY93bKvchAwKOjWsQWm59jIR73irqMvj+OFSgn98XIAX0Dy6+Knc+ynSGFENJNvIXnl8y0EOr+bpsJXw=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(70206006)(16526019)(36860700001)(6916009)(70586007)(30864003)(4326008)(86362001)(47076005)(186003)(426003)(82310400003)(107886003)(54906003)(1076003)(7636003)(8936002)(2616005)(26005)(83380400001)(36756003)(508600001)(6666004)(336012)(2906002)(316002)(356005)(8676002)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 09:33:14.9168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c75300-95df-41e4-be8b-08d98587a8e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4832
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Provide support for the Nvidia MSN4800-XX line cards for MSN4800
Ethernet modular switch system, providing a high performance switching
solution for Enterprise Data Centers (EDC) for building Ethernet based
clusters, High-Performance Computing (HPC) and embedded environments.
Initial version provides support for line card type MSN4800-C16. This
type of line card is equipped with:
- Lattice CPLD device, used for system and ports control.
- four Nvidia gearbox devices, used for port splitting.
- FPGA device, used for gearboxes management.
- 16x100G QSFP28 ports.
- hotpswap controllers, voltage regulators, analog-to-digital
  convertors, nvram devices.
- status LED.

During initialization driver creates:
- line card's I2C tree through "i2c-mux-mlxcpd" driver.
- line card's LED objects through "leds-mlxreg" driver.
- line card's CPLD register space input / output "hwmon" attributes for
  line control and monitoring through "mlxreg-io" driver. These
  attributes provide CPLD and FPAG versioning, control for upgradable
  components burning, NVRAM devices write protection, line card
  revision, line card power consuming, line card reset cause
  indication, etcetera.

Lattice CPLD device and nvram devices are feeding from auxiliary power
domain and accessible, when line card is powered off. These devices
are connected by line card driver probing routine, invoked after line
card security verification is done by hardware and event lc#n_verified
is received for line card located in slot #n.

Gearboxes, FPGA, hotpswap controllers, voltage regulators,
analog-to-digital convertors are feeding from main power domain. These
devices are connected after power good event "lc#n_powered" is received
for line card located in slot #n.

The driver 'mlxreg-lc' is driven by 'mlxreg-hotplug' driver following
relevant "hotplug" events.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/mellanox/Kconfig     |  12 +
 drivers/platform/mellanox/Makefile    |   1 +
 drivers/platform/mellanox/mlxreg-lc.c | 906 ++++++++++++++++++++++++++
 3 files changed, 919 insertions(+)
 create mode 100644 drivers/platform/mellanox/mlxreg-lc.c

diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index edd17e1a1f88..d4c5c170bca0 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -34,6 +34,18 @@ config MLXREG_IO
 	  to system resets operation, system reset causes monitoring and some
 	  kinds of mux selection.
 
+config MLXREG_LC
+	tristate "Mellanox line card platform driver support"
+	depends on REGMAP
+	depends on HWMON
+	depends on I2C
+	help
+	  This driver provides support for the Mellanox MSN4800-XX line cards,
+	  which are the part of MSN4800 Ethernet modular switch systems
+	  providing a high performance switching solution for Enterprise Data
+	  Centers (EDC) for building Ethernet based clusters, High-Performance
+	  Computing (HPC) and embedded environments.
+
 config MLXBF_TMFIFO
 	tristate "Mellanox BlueField SoC TmFifo platform driver"
 	depends on ARM64
diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
index 000ddaa74c98..a4868366ff18 100644
--- a/drivers/platform/mellanox/Makefile
+++ b/drivers/platform/mellanox/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_MLXBF_PMC)		+= mlxbf-pmc.o
 obj-$(CONFIG_MLXBF_TMFIFO)	+= mlxbf-tmfifo.o
 obj-$(CONFIG_MLXREG_HOTPLUG)	+= mlxreg-hotplug.o
 obj-$(CONFIG_MLXREG_IO) += mlxreg-io.o
+obj-$(CONFIG_MLXREG_LC) += mlxreg-lc.o
diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
new file mode 100644
index 000000000000..0b7f58feb701
--- /dev/null
+++ b/drivers/platform/mellanox/mlxreg-lc.c
@@ -0,0 +1,906 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Nvidia line card driver
+ *
+ * Copyright (C) 2020 Nvidia Technologies Ltd.
+ */
+
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/platform_data/mlxcpld.h>
+#include <linux/platform_data/mlxreg.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+/* I2C bus IO offsets */
+#define MLXREG_LC_REG_CPLD1_VER_OFFSET		0x2500
+#define MLXREG_LC_REG_FPGA1_VER_OFFSET		0x2501
+#define MLXREG_LC_REG_CPLD1_PN_OFFSET		0x2504
+#define MLXREG_LC_REG_FPGA1_PN_OFFSET		0x2506
+#define MLXREG_LC_REG_RESET_CAUSE_OFFSET	0x251d
+#define MLXREG_LC_REG_LED1_OFFSET		0x2520
+#define MLXREG_LC_REG_GP0_OFFSET		0x252e
+#define MLXREG_LC_REG_FIELD_UPGRADE		0x2534
+#define MLXREG_LC_CHANNEL_I2C_REG		0x25dc
+#define MLXREG_LC_REG_CPLD1_MVER_OFFSET		0x25de
+#define MLXREG_LC_REG_FPGA1_MVER_OFFSET		0x25df
+#define MLXREG_LC_REG_MAX_POWER_OFFSET		0x25f1
+#define MLXREG_LC_REG_CONFIG_OFFSET		0x25fb
+#define MLXREG_LC_REG_MAX			0x3fff
+
+/**
+ * enum mlxreg_lc_type - line cards types
+ *
+ * @MLXREG_LC_SN4800_C16: 100GbE line card with 16 QSFP28 ports;
+ */
+enum mlxreg_lc_type {
+	MLXREG_LC_SN4800_C16 = 0x0000,
+};
+
+/**
+ * enum mlxreg_lc_state - line cards state
+ *
+ * @MLXREG_LC_INITIALIZED: line card is initialized;
+ * @MLXREG_LC_POWERED: line card is powered;
+ * @MLXREG_LC_SYNCED: line card is synchronized between hardware and firmware;
+ */
+enum mlxreg_lc_state {
+	MLXREG_LC_INITIALIZED = BIT(0),
+	MLXREG_LC_POWERED = BIT(1),
+	MLXREG_LC_SYNCED = BIT(2),
+};
+
+#define MLXREG_LC_CONFIGURED	(MLXREG_LC_INITIALIZED | MLXREG_LC_POWERED | MLXREG_LC_SYNCED)
+
+/* mlxreg_lc - device private data
+ * @dev: platform device;
+ * @lock: line card lock;
+ * @par_regmap: parent device regmap handle;
+ * @data: pltaform core data;
+ * @io_data: register access platform data;
+ * @led_data: LED platform data ;
+ * @mux_data: MUX platform data;
+ * @led: LED device;
+ * @io_regs: register access device;
+ * @mux_brdinfo: mux configuration;
+ * @mux: mux devices;
+ * @aux_devs: I2C devices feeding by auxiliary power;
+ * @aux_devs_num: number of I2C devices feeding by auxiliary power;
+ * @main_devs: I2C devices feeding by main power;
+ * @main_devs_num: number of I2C devices feeding by main power;
+ * @state: line card state;
+ */
+struct mlxreg_lc {
+	struct device *dev;
+	struct mutex lock; /* line card access lock */
+	void *par_regmap;
+	struct mlxreg_core_data *data;
+	struct mlxreg_core_platform_data *io_data;
+	struct mlxreg_core_platform_data *led_data;
+	struct mlxcpld_mux_plat_data *mux_data;
+	struct platform_device *led;
+	struct platform_device *io_regs;
+	struct i2c_board_info *mux_brdinfo;
+	struct platform_device *mux;
+	struct mlxreg_hotplug_device *aux_devs;
+	int aux_devs_num;
+	struct mlxreg_hotplug_device *main_devs;
+	int main_devs_num;
+	enum mlxreg_lc_state state;
+};
+
+static bool mlxreg_lc_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MLXREG_LC_REG_LED1_OFFSET:
+	case MLXREG_LC_REG_GP0_OFFSET:
+	case MLXREG_LC_REG_FIELD_UPGRADE:
+	case MLXREG_LC_CHANNEL_I2C_REG:
+		return true;
+	}
+	return false;
+}
+
+static bool mlxreg_lc_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MLXREG_LC_REG_CPLD1_VER_OFFSET:
+	case MLXREG_LC_REG_FPGA1_VER_OFFSET:
+	case MLXREG_LC_REG_CPLD1_PN_OFFSET:
+	case MLXREG_LC_REG_FPGA1_PN_OFFSET:
+	case MLXREG_LC_REG_RESET_CAUSE_OFFSET:
+	case MLXREG_LC_REG_LED1_OFFSET:
+	case MLXREG_LC_REG_GP0_OFFSET:
+	case MLXREG_LC_REG_FIELD_UPGRADE:
+	case MLXREG_LC_CHANNEL_I2C_REG:
+	case MLXREG_LC_REG_CPLD1_MVER_OFFSET:
+	case MLXREG_LC_REG_FPGA1_MVER_OFFSET:
+	case MLXREG_LC_REG_MAX_POWER_OFFSET:
+	case MLXREG_LC_REG_CONFIG_OFFSET:
+		return true;
+	}
+	return false;
+}
+
+static bool mlxreg_lc_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MLXREG_LC_REG_CPLD1_VER_OFFSET:
+	case MLXREG_LC_REG_FPGA1_VER_OFFSET:
+	case MLXREG_LC_REG_CPLD1_PN_OFFSET:
+	case MLXREG_LC_REG_FPGA1_PN_OFFSET:
+	case MLXREG_LC_REG_RESET_CAUSE_OFFSET:
+	case MLXREG_LC_REG_LED1_OFFSET:
+	case MLXREG_LC_REG_GP0_OFFSET:
+	case MLXREG_LC_REG_FIELD_UPGRADE:
+	case MLXREG_LC_CHANNEL_I2C_REG:
+	case MLXREG_LC_REG_CPLD1_MVER_OFFSET:
+	case MLXREG_LC_REG_FPGA1_MVER_OFFSET:
+	case MLXREG_LC_REG_MAX_POWER_OFFSET:
+	case MLXREG_LC_REG_CONFIG_OFFSET:
+		return true;
+	}
+	return false;
+}
+
+static const struct reg_default mlxreg_lc_regmap_default[] = {
+	{ MLXREG_LC_CHANNEL_I2C_REG, 0x00 },
+};
+
+/* Configuration for the register map of a device with 2 bytes address space. */
+static const struct regmap_config mlxreg_lc_regmap_conf = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = MLXREG_LC_REG_MAX,
+	.cache_type = REGCACHE_FLAT,
+	.writeable_reg = mlxreg_lc_writeable_reg,
+	.readable_reg = mlxreg_lc_readable_reg,
+	.volatile_reg = mlxreg_lc_volatile_reg,
+	.reg_defaults = mlxreg_lc_regmap_default,
+	.num_reg_defaults = ARRAY_SIZE(mlxreg_lc_regmap_default),
+};
+
+/* Default channels vector.
+ * It contains only the channels, which physically connected to the devices,
+ * empty channels are skipped.
+ */
+static int mlxreg_lc_chan[] = {
+	0x04, 0x05, 0x06, 0x07, 0x08, 0x10, 0x20, 0x21, 0x22, 0x23, 0x40, 0x41,
+	0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d,
+	0x4e, 0x4f
+};
+
+/* Defaul mux configuration. */
+static struct mlxcpld_mux_plat_data mlxreg_lc_mux_data[] = {
+	{
+		.chan_ids = mlxreg_lc_chan,
+		.num_adaps = ARRAY_SIZE(mlxreg_lc_chan),
+		.sel_reg_addr = MLXREG_LC_CHANNEL_I2C_REG,
+		.reg_size = 2,
+	},
+};
+
+/* Defaul mux board info. */
+static struct i2c_board_info mlxreg_lc_mux_brdinfo = {
+	I2C_BOARD_INFO("i2c-mux-mlxcpld", 0x32),
+};
+
+/* Line card default auxiliary power static devices. */
+static struct i2c_board_info mlxreg_lc_aux_pwr_devices[] = {
+	{
+		I2C_BOARD_INFO("24c32", 0x51),
+	},
+	{
+		I2C_BOARD_INFO("24c32", 0x51),
+	},
+};
+
+/* Line card default auxiliary power board info. */
+static struct mlxreg_hotplug_device mlxreg_lc_aux_pwr_brdinfo[] = {
+	{
+		.brdinfo = &mlxreg_lc_aux_pwr_devices[0],
+		.nr = 3,
+	},
+	{
+		.brdinfo = &mlxreg_lc_aux_pwr_devices[1],
+		.nr = 4,
+	},
+};
+
+/* Line card default main power static devices. */
+static struct i2c_board_info mlxreg_lc_main_pwr_devices[] = {
+	{
+		I2C_BOARD_INFO("mp2975", 0x62),
+	},
+	{
+		I2C_BOARD_INFO("mp2975", 0x64),
+	},
+	{
+		I2C_BOARD_INFO("max11603", 0x6d),
+	},
+	{
+		I2C_BOARD_INFO("lm25066", 0x15),
+	},
+};
+
+/* Line card default main power board info. */
+static struct mlxreg_hotplug_device mlxreg_lc_main_pwr_brdinfo[] = {
+	{
+		.brdinfo = &mlxreg_lc_main_pwr_devices[0],
+		.nr = 0,
+	},
+	{
+		.brdinfo = &mlxreg_lc_main_pwr_devices[1],
+		.nr = 0,
+	},
+	{
+		.brdinfo = &mlxreg_lc_main_pwr_devices[2],
+		.nr = 1,
+	},
+	{
+		.brdinfo = &mlxreg_lc_main_pwr_devices[3],
+		.nr = 2,
+	},
+};
+
+/* LED default data. */
+static struct mlxreg_core_data mlxreg_lc_led_data[] = {
+	{
+		.label = "status:green",
+		.reg = MLXREG_LC_REG_LED1_OFFSET,
+		.mask = GENMASK(7, 4),
+	},
+	{
+		.label = "status:orange",
+		.reg = MLXREG_LC_REG_LED1_OFFSET,
+		.mask = GENMASK(7, 4),
+	},
+};
+
+static struct mlxreg_core_platform_data mlxreg_lc_led = {
+	.identity = "pci",
+	.data = mlxreg_lc_led_data,
+	.counter = ARRAY_SIZE(mlxreg_lc_led_data),
+};
+
+/* Default register access data. */
+static struct mlxreg_core_data mlxreg_lc_io_data[] = {
+	{
+		.label = "cpld1_version",
+		.reg = MLXREG_LC_REG_CPLD1_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "fpga1_version",
+		.reg = MLXREG_LC_REG_FPGA1_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld1_pn",
+		.reg = MLXREG_LC_REG_CPLD1_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "fpga1_pn",
+		.reg = MLXREG_LC_REG_FPGA1_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld1_version_min",
+		.reg = MLXREG_LC_REG_CPLD1_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "fpga1_version_min",
+		.reg = MLXREG_LC_REG_FPGA1_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_fpga_not_done",
+		.reg = MLXREG_LC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_aux_pwr_or_ref",
+		.reg = MLXREG_LC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_dc_dc_pwr_fail",
+		.reg = MLXREG_LC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_from_chassis",
+		.reg = MLXREG_LC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_pwr_off_from_chassis",
+		.reg = MLXREG_LC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_line_card",
+		.reg = MLXREG_LC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_line_card_pwr_en",
+		.reg = MLXREG_LC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld_upgrade_en",
+		.reg = MLXREG_LC_REG_FIELD_UPGRADE,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+		.secured = 1,
+	},
+	{
+		.label = "fpga_upgrade_en",
+		.reg = MLXREG_LC_REG_FIELD_UPGRADE,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+		.secured = 1,
+	},
+	{
+		.label = "qsfp_pwr_en",
+		.reg = MLXREG_LC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "vpd_wp",
+		.reg = MLXREG_LC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+		.secured = 1,
+	},
+	{
+		.label = "agb_spi_burn_en",
+		.reg = MLXREG_LC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+		.secured = 1,
+	},
+	{
+		.label = "fpga_spi_burn_en",
+		.reg = MLXREG_LC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+		.secured = 1,
+	},
+	{
+		.label = "max_power",
+		.reg = MLXREG_LC_REG_MAX_POWER_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "config",
+		.reg = MLXREG_LC_REG_CONFIG_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxreg_lc_regs_io = {
+	.data = mlxreg_lc_io_data,
+	.counter = ARRAY_SIZE(mlxreg_lc_io_data),
+};
+
+static int
+mlxreg_lc_create_static_devices(struct mlxreg_lc *mlxreg_lc, struct mlxreg_hotplug_device *devs,
+				int size)
+{
+	struct mlxreg_hotplug_device *dev = devs;
+	int i;
+
+	/* Create static I2C device feeding by auxiliary or main power. */
+	for (i = 0; i < size; i++, dev++) {
+		dev->client = i2c_new_client_device(dev->adapter, dev->brdinfo);
+		if (IS_ERR(dev->client)) {
+			dev_err(mlxreg_lc->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
+				dev->brdinfo->type, dev->nr, dev->brdinfo->addr);
+
+			dev->adapter = NULL;
+			goto fail_create_static_devices;
+		}
+	}
+
+	return 0;
+
+fail_create_static_devices:
+	while (--i >= 0) {
+		dev = devs + i;
+		i2c_unregister_device(dev->client);
+		dev->client = NULL;
+	}
+	return IS_ERR(dev->client);
+}
+
+static void
+mlxreg_lc_destroy_static_devices(struct mlxreg_lc *mlxreg_lc, struct mlxreg_hotplug_device *devs,
+				 int size)
+{
+	struct mlxreg_hotplug_device *dev = devs;
+	int i;
+
+	/* Destroy static I2C device feeding by auxiliary or main power. */
+	for (i = 0; i < size; i++, dev++) {
+		if (dev->client) {
+			i2c_unregister_device(dev->client);
+			dev->client = NULL;
+		}
+	}
+}
+
+static int mlxreg_lc_power_on_off(struct mlxreg_lc *mlxreg_lc, u8 action)
+{
+	u32 regval;
+	int err;
+
+	mutex_lock(&mlxreg_lc->lock);
+
+	err = regmap_read(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_pwr, &regval);
+	if (err)
+		goto regmap_read_fail;
+
+	if (action)
+		regval |= BIT(mlxreg_lc->data->slot - 1);
+	else
+		regval &= ~BIT(mlxreg_lc->data->slot - 1);
+
+	err = regmap_write(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_pwr, regval);
+
+regmap_read_fail:
+	mutex_unlock(&mlxreg_lc->lock);
+	return err;
+}
+
+static int mlxreg_lc_enable_disable(struct mlxreg_lc *mlxreg_lc, bool action)
+{
+	u32 regval;
+	int err;
+
+	/*
+	 * Hardware holds the line card after powering on in the disabled state. Holding line card
+	 * in disabled state protects access to the line components, like FPGA and gearboxes.
+	 * Line card should be enabled in order to get it in operational state. Line card could be
+	 * disabled for moving it to non-operational state. Enabling line card does not affect the
+	 * line card which is already has been enabled. Disabling does not affect the disabled line
+	 * card.
+	 */
+	mutex_lock(&mlxreg_lc->lock);
+
+	err = regmap_read(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_ena, &regval);
+	if (err)
+		goto regmap_read_fail;
+
+	if (action)
+		regval |= BIT(mlxreg_lc->data->slot - 1);
+	else
+		regval &= ~BIT(mlxreg_lc->data->slot - 1);
+
+	err = regmap_write(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_ena, regval);
+
+regmap_read_fail:
+	mutex_unlock(&mlxreg_lc->lock);
+	return err;
+}
+
+static int
+mlxreg_lc_sn4800_c16_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
+				 struct mlxreg_core_data *data)
+{
+	struct device *dev = &data->hpdev.client->dev;
+
+	/* Set line card configuration according to the type. */
+	mlxreg_lc->mux_data = mlxreg_lc_mux_data;
+	mlxreg_lc->io_data = &mlxreg_lc_regs_io;
+	mlxreg_lc->led_data = &mlxreg_lc_led;
+	mlxreg_lc->mux_brdinfo = &mlxreg_lc_mux_brdinfo;
+
+	mlxreg_lc->aux_devs = devm_kmemdup(dev, mlxreg_lc_aux_pwr_brdinfo,
+					   sizeof(mlxreg_lc_aux_pwr_brdinfo), GFP_KERNEL);
+	if (!mlxreg_lc->aux_devs)
+		return -ENOMEM;
+	mlxreg_lc->aux_devs_num = ARRAY_SIZE(mlxreg_lc_aux_pwr_brdinfo);
+	mlxreg_lc->main_devs = devm_kmemdup(dev, mlxreg_lc_main_pwr_brdinfo,
+					    sizeof(mlxreg_lc_main_pwr_brdinfo), GFP_KERNEL);
+	if (!mlxreg_lc->main_devs)
+		return -ENOMEM;
+	mlxreg_lc->main_devs_num = ARRAY_SIZE(mlxreg_lc_main_pwr_brdinfo);
+
+	return 0;
+}
+
+static void
+mlxreg_lc_state_update(struct mlxreg_lc *mlxreg_lc, enum mlxreg_lc_state state, u8 action)
+{
+	mutex_lock(&mlxreg_lc->lock);
+
+	if (action)
+		mlxreg_lc->state |= state;
+	else
+		mlxreg_lc->state &= ~state;
+
+	mutex_unlock(&mlxreg_lc->lock);
+}
+
+/*
+ * Callback is to be called from mlxreg-hotplug driver to notify about line card about received
+ * event.
+ */
+static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind, u8 action)
+{
+	struct mlxreg_lc *mlxreg_lc = handle;
+	int err = 0;
+
+	dev_info(mlxreg_lc->dev, "linecard#%d state %d event kind %d action %d\n",
+		 mlxreg_lc->data->slot, mlxreg_lc->state, kind, action);
+
+	if (!(mlxreg_lc->state & MLXREG_LC_INITIALIZED))
+		return 0;
+
+	switch (kind) {
+	case MLXREG_HOTPLUG_LC_SYNCED:
+		/*
+		 * Synchronization event - hardware and firmware are synchronized. Power on/off
+		 * line card - to allow/disallow main power source.
+		 */
+		mlxreg_lc_state_update(mlxreg_lc, MLXREG_LC_SYNCED, action);
+		/* Power line card if it is not powered yet. */
+		if (!(mlxreg_lc->state & MLXREG_LC_POWERED) && action) {
+			err = mlxreg_lc_power_on_off(mlxreg_lc, 1);
+			if (err)
+				return err;
+		}
+		/* In case line card is configured - enable it. */
+		if (mlxreg_lc->state & MLXREG_LC_CONFIGURED && action)
+			err = mlxreg_lc_enable_disable(mlxreg_lc, 1);
+		break;
+	case MLXREG_HOTPLUG_LC_POWERED:
+		/* Power event - attach or de-attach line card device feeding by the main power. */
+		if (action) {
+			/* Do not create devices, if line card is already powered. */
+			if (mlxreg_lc->state & MLXREG_LC_POWERED) {
+				/* In case line card is configured - enable it. */
+				if (mlxreg_lc->state & MLXREG_LC_CONFIGURED)
+					err = mlxreg_lc_enable_disable(mlxreg_lc, 1);
+				return err;
+			}
+			err = mlxreg_lc_create_static_devices(mlxreg_lc, mlxreg_lc->main_devs,
+							      mlxreg_lc->main_devs_num);
+			if (err)
+				return err;
+
+			/* In case line card is already in ready state - enable it. */
+			if (mlxreg_lc->state & MLXREG_LC_CONFIGURED)
+				err = mlxreg_lc_enable_disable(mlxreg_lc, 1);
+		} else {
+			mlxreg_lc_destroy_static_devices(mlxreg_lc, mlxreg_lc->main_devs,
+							 mlxreg_lc->main_devs_num);
+		}
+		mlxreg_lc_state_update(mlxreg_lc, MLXREG_LC_POWERED, action);
+		break;
+	case MLXREG_HOTPLUG_LC_READY:
+		/*
+		 * Ready event – enable line card by releasing it from reset or disable it by put
+		 * to reset state.
+		 */
+		err = mlxreg_lc_enable_disable(mlxreg_lc, !!action);
+		break;
+	case MLXREG_HOTPLUG_LC_THERMAL:
+		/* Thermal shutdown event – power off line card. */
+		if (action)
+			err = mlxreg_lc_power_on_off(mlxreg_lc, 0);
+		break;
+	default:
+		break;
+	}
+
+	return err;
+}
+
+/*
+ * Callback is to be called from i2c-mux-mlxcpld driver to indicate that all adapter devices has
+ * been created.
+ */
+static int mlxreg_lc_completion_notify(void *handle, struct i2c_adapter *parent,
+				       struct i2c_adapter *adapters[])
+{
+	struct mlxreg_hotplug_device *main_dev, *aux_dev;
+	struct mlxreg_lc *mlxreg_lc = handle;
+	u32 regval;
+	int i, err;
+
+	/* Update I2C devices feeding by auxiliary power. */
+	aux_dev = mlxreg_lc->aux_devs;
+	for (i = 0; i < mlxreg_lc->aux_devs_num; i++, aux_dev++) {
+		aux_dev->adapter = adapters[aux_dev->nr];
+		aux_dev->nr = adapters[aux_dev->nr]->nr;
+	}
+
+	err = mlxreg_lc_create_static_devices(mlxreg_lc, mlxreg_lc->aux_devs,
+					      mlxreg_lc->aux_devs_num);
+	if (err)
+		return err;
+
+	/* Update I2C devices feeding by main power. */
+	main_dev = mlxreg_lc->main_devs;
+	for (i = 0; i < mlxreg_lc->main_devs_num; i++, main_dev++) {
+		main_dev->adapter = adapters[main_dev->nr];
+		main_dev->nr = adapters[main_dev->nr]->nr;
+	}
+
+	/* Verify if line card is powered. */
+	err = regmap_read(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_pwr, &regval);
+	if (err)
+		goto mlxreg_lc_regmap_read_power_fail;
+
+	if (regval & mlxreg_lc->data->mask) {
+		err = mlxreg_lc_create_static_devices(mlxreg_lc, mlxreg_lc->main_devs,
+						      mlxreg_lc->main_devs_num);
+		if (err)
+			goto mlxreg_lc_create_static_devices_failed;
+
+		mlxreg_lc_state_update(mlxreg_lc, MLXREG_LC_POWERED, 1);
+	}
+
+	/* Verify if line card is synchronized. */
+	err = regmap_read(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_sync, &regval);
+	if (err)
+		goto mlxreg_lc_regmap_read_sync_fail;
+
+	/* Power on line card if necessary. */
+	if (regval & mlxreg_lc->data->mask) {
+		mlxreg_lc->state |= MLXREG_LC_SYNCED;
+		mlxreg_lc_state_update(mlxreg_lc, MLXREG_LC_SYNCED, 1);
+		if (mlxreg_lc->state & ~MLXREG_LC_POWERED) {
+			err = mlxreg_lc_power_on_off(mlxreg_lc, 1);
+			if (err)
+				goto mlxreg_lc_regmap_power_on_off_fail;
+		}
+	}
+
+	mlxreg_lc_state_update(mlxreg_lc, MLXREG_LC_INITIALIZED, 1);
+
+	return 0;
+
+mlxreg_lc_regmap_power_on_off_fail:
+mlxreg_lc_regmap_read_sync_fail:
+	if (mlxreg_lc->state & MLXREG_LC_POWERED)
+		mlxreg_lc_destroy_static_devices(mlxreg_lc, mlxreg_lc->main_devs,
+						 mlxreg_lc->main_devs_num);
+mlxreg_lc_create_static_devices_failed:
+	mlxreg_lc_destroy_static_devices(mlxreg_lc, mlxreg_lc->aux_devs, mlxreg_lc->aux_devs_num);
+mlxreg_lc_regmap_read_power_fail:
+	return err;
+}
+
+static int
+mlxreg_lc_config_init(struct mlxreg_lc *mlxreg_lc, void *regmap,
+		      struct mlxreg_core_data *data)
+{
+	struct device *dev = &data->hpdev.client->dev;
+	int lsb, err;
+	u32 regval;
+
+	/* Validate line card type. */
+	err = regmap_read(regmap, MLXREG_LC_REG_CONFIG_OFFSET, &lsb);
+	err = (!err) ? regmap_read(regmap, MLXREG_LC_REG_CONFIG_OFFSET, &regval) : err;
+	if (err)
+		return err;
+	regval = (regval & GENMASK(7, 0)) << 8 | (lsb & GENMASK(7, 0));
+	switch (regval) {
+	case MLXREG_LC_SN4800_C16:
+		err = mlxreg_lc_sn4800_c16_config_init(mlxreg_lc, regmap, data);
+		if (err)
+			return err;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	/* Create mux infrastructure. */
+	mlxreg_lc->mux_data->handle = mlxreg_lc;
+	mlxreg_lc->mux_data->completion_notify = mlxreg_lc_completion_notify;
+	mlxreg_lc->mux_brdinfo->platform_data = mlxreg_lc->mux_data;
+	mlxreg_lc->mux = platform_device_register_resndata(dev, "i2c-mux-mlxcpld", data->hpdev.nr,
+							   NULL, 0, mlxreg_lc->mux_data,
+							   sizeof(*mlxreg_lc->mux_data));
+	if (IS_ERR(mlxreg_lc->mux))
+		return PTR_ERR(mlxreg_lc->mux);
+
+	/* Register IO access driver. */
+	if (mlxreg_lc->io_data) {
+		mlxreg_lc->io_data->regmap = regmap;
+		mlxreg_lc->io_regs =
+		platform_device_register_resndata(dev, "mlxreg-io", data->hpdev.nr, NULL, 0,
+						  mlxreg_lc->io_data, sizeof(*mlxreg_lc->io_data));
+		if (IS_ERR(mlxreg_lc->io_regs)) {
+			err = PTR_ERR(mlxreg_lc->io_regs);
+			goto fail_register_io;
+		}
+	}
+
+	/* Register LED driver. */
+	if (mlxreg_lc->led_data) {
+		mlxreg_lc->led_data->regmap = regmap;
+		mlxreg_lc->led =
+		platform_device_register_resndata(dev, "leds-mlxreg", data->hpdev.nr, NULL, 0,
+						  mlxreg_lc->led_data,
+						  sizeof(*mlxreg_lc->led_data));
+		if (IS_ERR(mlxreg_lc->led)) {
+			err = PTR_ERR(mlxreg_lc->led);
+			goto fail_register_led;
+		}
+	}
+
+	return 0;
+
+fail_register_led:
+	if (mlxreg_lc->io_regs)
+		platform_device_unregister(mlxreg_lc->io_regs);
+fail_register_io:
+	if (mlxreg_lc->mux)
+		platform_device_unregister(mlxreg_lc->mux);
+
+	return err;
+}
+
+static void mlxreg_lc_config_exit(struct mlxreg_lc *mlxreg_lc)
+{
+	/* Unregister LED driver. */
+	if (mlxreg_lc->led)
+		platform_device_unregister(mlxreg_lc->led);
+	/* Unregister IO access driver. */
+	if (mlxreg_lc->io_regs)
+		platform_device_unregister(mlxreg_lc->io_regs);
+	/* Remove mux infrastructure. */
+	if (mlxreg_lc->mux)
+		platform_device_unregister(mlxreg_lc->mux);
+}
+
+static int mlxreg_lc_probe(struct platform_device *pdev)
+{
+	struct mlxreg_core_hotplug_platform_data *par_pdata;
+	struct mlxreg_core_data *data;
+	struct mlxreg_lc *mlxreg_lc;
+	void *regmap;
+	int i, err;
+
+	data = dev_get_platdata(&pdev->dev);
+	if (!data)
+		return -EINVAL;
+
+	mlxreg_lc = devm_kzalloc(&pdev->dev, sizeof(*mlxreg_lc), GFP_KERNEL);
+	if (!mlxreg_lc)
+		return -ENOMEM;
+
+	mutex_init(&mlxreg_lc->lock);
+	/* Set event notification callback. */
+	if (data->notifier) {
+		data->notifier->user_handler = mlxreg_lc_event_handler;
+		data->notifier->handle = mlxreg_lc;
+	}
+	data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr);
+	if (!data->hpdev.adapter) {
+		dev_err(&pdev->dev, "Failed to get adapter for bus %d\n",
+			data->hpdev.nr);
+		return -EFAULT;
+	}
+
+	/* Create device at the top of line card I2C tree.*/
+	data->hpdev.client = i2c_new_client_device(data->hpdev.adapter,
+						   data->hpdev.brdinfo);
+	if (IS_ERR(data->hpdev.client)) {
+		dev_err(&pdev->dev, "Failed to create client %s at bus %d at addr 0x%02x\n",
+			data->hpdev.brdinfo->type, data->hpdev.nr, data->hpdev.brdinfo->addr);
+
+		i2c_put_adapter(data->hpdev.adapter);
+		data->hpdev.adapter = NULL;
+		return PTR_ERR(data->hpdev.client);
+	}
+
+	regmap = devm_regmap_init_i2c(data->hpdev.client,
+				      &mlxreg_lc_regmap_conf);
+	if (IS_ERR(regmap)) {
+		err = PTR_ERR(regmap);
+		goto mlxreg_lc_probe_fail;
+	}
+
+	/* Set default registers. */
+	for (i = 0; i < mlxreg_lc_regmap_conf.num_reg_defaults; i++) {
+		err = regmap_write(regmap, mlxreg_lc_regmap_default[i].reg,
+				   mlxreg_lc_regmap_default[i].def);
+		if (err)
+			goto mlxreg_lc_probe_fail;
+	}
+
+	/* Sync registers with hardware. */
+	regcache_mark_dirty(regmap);
+	err = regcache_sync(regmap);
+	if (err)
+		goto mlxreg_lc_probe_fail;
+
+	par_pdata = data->hpdev.brdinfo->platform_data;
+	mlxreg_lc->par_regmap = par_pdata->regmap;
+	mlxreg_lc->data = data;
+	mlxreg_lc->dev = &pdev->dev;
+	platform_set_drvdata(pdev, mlxreg_lc);
+
+	/* Configure line card. */
+	err = mlxreg_lc_config_init(mlxreg_lc, regmap, data);
+	if (err)
+		goto mlxreg_lc_probe_fail;
+
+	return err;
+
+mlxreg_lc_probe_fail:
+	i2c_put_adapter(data->hpdev.adapter);
+	return err;
+}
+
+static int mlxreg_lc_remove(struct platform_device *pdev)
+{
+	struct mlxreg_core_data *data = dev_get_platdata(&pdev->dev);
+	struct mlxreg_lc *mlxreg_lc = platform_get_drvdata(pdev);
+
+	/* Clear event notification callback. */
+	if (data->notifier) {
+		data->notifier->user_handler = NULL;
+		data->notifier->handle = NULL;
+	}
+
+	/* Destroy static I2C device feeding by main power. */
+	mlxreg_lc_destroy_static_devices(mlxreg_lc, mlxreg_lc->main_devs,
+					 mlxreg_lc->main_devs_num);
+	/* Destroy static I2C device feeding by auxiliary power. */
+	mlxreg_lc_destroy_static_devices(mlxreg_lc, mlxreg_lc->aux_devs, mlxreg_lc->aux_devs_num);
+	/* Unregister underlying drivers. */
+	mlxreg_lc_config_exit(mlxreg_lc);
+	if (data->hpdev.client) {
+		i2c_unregister_device(data->hpdev.client);
+		data->hpdev.client = NULL;
+		i2c_put_adapter(data->hpdev.adapter);
+		data->hpdev.adapter = NULL;
+	}
+
+	return 0;
+}
+
+static struct platform_driver mlxreg_lc_driver = {
+	.probe = mlxreg_lc_probe,
+	.remove = mlxreg_lc_remove,
+	.driver = {
+		.name = "mlxreg-lc",
+	},
+};
+
+module_platform_driver(mlxreg_lc_driver);
+
+MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
+MODULE_DESCRIPTION("Nvidia line card platform driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("platform:mlxreg-lc");
-- 
2.20.1

