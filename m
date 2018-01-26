From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH 09/11] platform/x86: mlx-platform: Extend register map configuration with IO access verification callbacks
Date: Fri, 26 Jan 2018 19:03:44 +0000
Message-ID: <1516993426-11384-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60130 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751374AbeAZRHS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Jan 2018 12:07:18 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>

Add definitions for hotplug device masks and events offsets, in order to
specify explicitly all hardware registers allowed for IO operations for
all the drivers sharing register map with mlx-platform.

Extend register map configuration with the sets of writable, readable and
volatile registers to allow verification prior to the access. It prevents
unexpected access to hardware registers by the drivers, sharing register
map with mlx-platform.

Extend register map configuration with cache type field in order to have
ability to cache hardware register value, where possible. Use simple flat
array type for register lookups, which is most suitable in case when the
number of the registers is not too large.

Add at the end of probing routine calls to regcache_mark_dirty and
regcache_sync in order to sync register cache with hardware values. The
first routine indicate that hardware registers value required sync, the
second performs sync.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
v11->v12
  Comments pointed out by Darren:
  - add explanations in commit message;
  Fixes added by Vadim:
  - add register cache synchronization at the end of mlx-platform probing;
---
 drivers/platform/x86/mlx-platform.c | 77 +++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index fa27ca8..2d34aa8 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -48,9 +48,18 @@
 #define MLXPLAT_CPLD_LPC_I2C_BASE_ADRR		0x2000
 #define MLXPLAT_CPLD_LPC_REG_BASE_ADRR		0x2500
 #define MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET	0x3a
+#define MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET	0x3b
+#define MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET	0x40
+#define MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET	0x41
 #define MLXPLAT_CPLD_LPC_REG_PSU_OFFSET		0x58
+#define MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET	0x59
+#define MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET	0x5a
 #define MLXPLAT_CPLD_LPC_REG_PWR_OFFSET		0x64
+#define MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET	0x65
+#define MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET	0x66
 #define MLXPLAT_CPLD_LPC_REG_FAN_OFFSET		0x88
+#define MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET	0x89
+#define MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET	0x8a
 #define MLXPLAT_CPLD_LPC_IO_RANGE		0x100
 #define MLXPLAT_CPLD_LPC_I2C_CH1_OFF		0xdb
 #define MLXPLAT_CPLD_LPC_I2C_CH2_OFF		0xda
@@ -299,6 +308,64 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn21xx_data = {
 	.mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 };
 
+static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
+		return true;
+	}
+	return false;
+}
+
+static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWR_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
+		return true;
+	}
+	return false;
+}
+
+static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRLO_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWR_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
+		return true;
+	}
+	return false;
+}
+
 struct mlxplat_mlxcpld_regmap_context {
 	void __iomem *base;
 };
@@ -327,6 +394,10 @@ static const struct regmap_config mlxplat_mlxcpld_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 255,
+	.cache_type = REGCACHE_FLAT,
+	.writeable_reg = mlxplat_mlxcpld_writeable_reg,
+	.readable_reg = mlxplat_mlxcpld_readable_reg,
+	.volatile_reg = mlxplat_mlxcpld_volatile_reg,
 	.reg_read = mlxplat_mlxcpld_reg_read,
 	.reg_write = mlxplat_mlxcpld_reg_write,
 };
@@ -473,6 +544,12 @@ static int __init mlxplat_init(void)
 		goto fail_platform_mux_register;
 	}
 
+	/* Sync registers with hardware. */
+	regcache_mark_dirty(mlxplat_hotplug->regmap);
+	err = regcache_sync(mlxplat_hotplug->regmap);
+	if (err)
+		goto fail_platform_mux_register;
+
 	return 0;
 
 fail_platform_mux_register:
-- 
2.1.4
