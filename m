From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v11 10/12] platform/x86: mlx-platform: Extend register map configuration with IO access verification callbacks
Date: Wed, 24 Jan 2018 20:34:56 +0000
Message-ID: <1516826098-125036-2-git-send-email-vadimp@mellanox.com>
References: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516826098-125036-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Add definitions for hotplug device masks and events offsets.

Extend register map configuration with the sets of writable, readable and
volatile registers to allow verification prior to the access.

Extend register map configuration with cache type field: use flat type.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/platform/x86/mlx-platform.c | 71 +++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 81a7306..95eb9d9 100644
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
 static int
 mlxplat_mlxcpld_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
@@ -317,6 +384,10 @@ static const struct regmap_config mlxplat_mlxcpld_regmap_config = {
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
-- 
2.1.4
