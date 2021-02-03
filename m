Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2770BC433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C353764F8C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbhBCRhd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 12:37:33 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50973 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232317AbhBCRhb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 12:37:31 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 3 Feb 2021 19:36:31 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 113HaOOM001002;
        Wed, 3 Feb 2021 19:36:31 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy@infradead.org, hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH RFC platform-next 7/8] platform/mellanox: mlxreg-lc: Add initial support for Mellanox line card devices
Date:   Wed,  3 Feb 2021 19:36:21 +0200
Message-Id: <20210203173622.5845-8-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210203173622.5845-1-vadimp@nvidia.com>
References: <20210203173622.5845-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Provide support for the Mellanox MSN4800-XX line cards for MSN4800
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

During initialization driver sets callback function for:
- handling line card related I2C adapters completion. When all the
  adapters are created this callback updates line card I2C topology.
- handling line card related hotplug events. When an event is received
  it performs the relevant action, like power on/off line card,
  enable/disable line card, power off line card in case of thermal
  shutdown event.

Lattice CPLD device and nvram devices are feeding from auxiliary power
domain and accessible, when line card is powered off. These devices
are connected by line card driver probing routine, invoked after line
card security verification is done by hardware and event lc#n_verified
is received for line card located in slot #n.

Gearboxes, FPGA, hotpswap controllers, voltage regulators,
analog-to-digital convertors are feeding from main power domain. These
devices are connected after power good event "lc#n_powered" is received
for line card located in slot #n.

Hardware holds the line card after powering on in the disabled state.
Line card driver is responsible to move it to enabled state after
receiving lc#n_synced and lc#n_ready events. Order in which these two
events are rasised could be vary.

The driver 'mlxreg-lc' is driven by 'mlxreg-hotplug' driver following
relevant "hotplug" events.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/Kconfig     |  12 +
 drivers/platform/mellanox/Makefile    |   1 +
 drivers/platform/mellanox/mlxreg-lc.c | 807 ++++++++++++++++++++++++++++++++++
 3 files changed, 820 insertions(+)
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
index 000000000000..d1f3f783cb12
--- /dev/null
+++ b/drivers/platform/mellanox/mlxreg-lc.c
@@ -0,0 +1,807 @@
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
+#define MLXREG_LC_REG_MAX			0x2600
+
+#define MLXREG_LC_SYNCED	BIT(0)
+#define MLXREG_LC_READY		BIT(1)
+#define MLXREG_LC_ENABLE	(MLXREG_LC_SYNCED | MLXREG_LC_READY)
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
+	u8 state;
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
+		.label = "lc_pwr_en",
+		.reg = MLXREG_LC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld_upgrade_en",
+		.reg = MLXREG_LC_REG_FIELD_UPGRADE,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "fpga_upgrade_en",
+		.reg = MLXREG_LC_REG_FIELD_UPGRADE,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
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
+	},
+	{
+		.label = "ini_wp",
+		.reg = MLXREG_LC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "agb_spi_burn_en",
+		.reg = MLXREG_LC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "fpga_spi_burn_en",
+		.reg = MLXREG_LC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
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
+	/* Create static I2C device feeding by auxiliary power. */
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
+		dev->adapter = NULL;
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
+	/* Destroy static I2C device feeding by auxiliary power. */
+	for (i = 0; i < size; i++, dev++) {
+		if (dev->client) {
+			i2c_unregister_device(dev->client);
+			dev->client = NULL;
+			dev->adapter = NULL;
+		}
+	}
+}
+
+static int mlxreg_lc_power_on_off(struct mlxreg_lc *mlxreg_lc, u8 action)
+{
+	u32 regval;
+	int err;
+
+	err = regmap_read(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_pwr, &regval);
+	if (err)
+		return err;
+
+	if (action)
+		regval |= BIT(mlxreg_lc->data->slot);
+	else
+		regval &= ~BIT(mlxreg_lc->data->slot);
+
+	return regmap_write(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_pwr, regval);
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
+		regval |= BIT(mlxreg_lc->data->slot);
+	else
+		regval &= ~BIT(mlxreg_lc->data->slot);
+
+	err = regmap_write(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_ena, regval);
+
+regmap_read_fail:
+	mutex_unlock(&mlxreg_lc->lock);
+
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
+/*
+ * Callback is to be called from mlxreg-hotplug driver to notify about line card about received
+ * event.
+ */
+static int mlxreg_lc_event_handler(void *handle, enum mlxreg_hotplug_kind kind, u8 action)
+{
+	struct mlxreg_lc *mlxreg_lc = handle;
+	int err;
+
+	switch (kind) {
+	case MLXREG_HOTPLUG_LC_VERIFIED:
+		err = mlxreg_lc_power_on_off(mlxreg_lc, action);
+		break;
+	case MLXREG_HOTPLUG_LC_POWERED:
+		if (action)
+			err = mlxreg_lc_create_static_devices(mlxreg_lc, mlxreg_lc->aux_devs,
+							      mlxreg_lc->main_devs_num);
+		else
+			mlxreg_lc_destroy_static_devices(mlxreg_lc, mlxreg_lc->aux_devs,
+							 mlxreg_lc->main_devs_num);
+		break;
+	case MLXREG_HOTPLUG_LC_SYNCED:
+		if (action)
+			mlxreg_lc->state |= MLXREG_LC_SYNCED;
+		else
+			mlxreg_lc->state &= ~MLXREG_LC_SYNCED;
+		err = mlxreg_lc_enable_disable(mlxreg_lc, mlxreg_lc->state == MLXREG_LC_ENABLE);
+		break;
+	case MLXREG_HOTPLUG_LC_READY:
+		if (action)
+			mlxreg_lc->state |= MLXREG_LC_READY;
+		else
+			mlxreg_lc->state &= ~MLXREG_LC_READY;
+		err = mlxreg_lc_enable_disable(mlxreg_lc, mlxreg_lc->state == MLXREG_LC_ENABLE);
+		break;
+	case MLXREG_HOTPLUG_LC_THERMAL:
+		err = mlxreg_lc_power_on_off(mlxreg_lc, !action);
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
+
+	/* Update I2C devices feeding by main power. */
+	main_dev = mlxreg_lc->main_devs;
+	for (i = 0; i < mlxreg_lc->main_devs_num; i++, main_dev++) {
+		main_dev->adapter = adapters[main_dev->nr];
+		main_dev->nr = adapters[main_dev->nr]->nr;
+	}
+
+	err = regmap_read(mlxreg_lc->par_regmap, mlxreg_lc->data->reg_prsnt, &regval);
+	if (err)
+		goto mlxreg_lc_completion_notify_fail;
+
+	if (regval & mlxreg_lc->data->mask)
+		err = mlxreg_lc_create_static_devices(mlxreg_lc, mlxreg_lc->main_devs,
+						      mlxreg_lc->main_devs_num);
+
+	return 0;
+
+mlxreg_lc_completion_notify_fail:
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
+	data->hpdev.user_handler = mlxreg_lc_event_handler;
+	data->hpdev.handle = mlxreg_lc;
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
2.11.0

