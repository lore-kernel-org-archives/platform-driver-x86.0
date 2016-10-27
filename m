From: vadimp@mellanox.com
Subject: [patch v1 1/2] drivers/platform/x86: move module mlx-platform from arch/x86 to drivers/platform/x86
Date: Thu, 27 Oct 2016 13:59:18 +0000
Message-ID: <1477576758-102003-1-git-send-email-vadimp@mellanox.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:37451 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S942726AbcJ0OoN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2016 10:44:13 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, fengguang.wu@intel.com
Cc: davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, andriy.shevchenko@linux.intel.com, Vadim Pasternak <vadimp@mellanox.com>

From: Vadim Pasternak <vadimp@mellanox.com>

Move module mlx-platform.c from arch/x86/platform/mellanox/ to
drivers/platform/x86/.
Remove folder arch/x86/platform/mellanox/ and update relevant Makefile
and Kconfig.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 MAINTAINERS                               |   2 +-
 arch/x86/Kconfig                          |  12 --
 arch/x86/platform/Makefile                |   1 -
 arch/x86/platform/mellanox/Makefile       |   1 -
 arch/x86/platform/mellanox/mlx-platform.c | 266 ------------------------------
 drivers/platform/x86/Kconfig              |  14 +-
 drivers/platform/x86/Makefile             |   1 +
 drivers/platform/x86/mlx-platform.c       | 266 ++++++++++++++++++++++++++++++
 8 files changed, 281 insertions(+), 282 deletions(-)
 delete mode 100644 arch/x86/platform/mellanox/Makefile
 delete mode 100644 arch/x86/platform/mellanox/mlx-platform.c
 create mode 100644 drivers/platform/x86/mlx-platform.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e30399..960f364f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7879,7 +7879,7 @@ MELLANOX PLATFORM DRIVER
 M:      Vadim Pasternak <vadimp@mellanox.com>
 L:      platform-driver-x86@vger.kernel.org
 S:      Supported
-F:      arch/x86/platform/mellanox/mlx-platform.c
+F:      drivers/platform/x86/mlx-platform.c
 
 MELLANOX MLX CPLD HOTPLUG DRIVER
 M:	Vadim Pasternak <vadimp@mellanox.com>
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bada636..ccd5ff7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -550,18 +550,6 @@ config X86_INTEL_QUARK
 	  Say Y here if you have a Quark based system such as the Arduino
 	  compatible Intel Galileo.
 
-config MLX_PLATFORM
-	tristate "Mellanox Technologies platform support"
-	depends on X86_64
-	depends on X86_EXTENDED_PLATFORM
-	---help---
-	  This option enables system support for the Mellanox Technologies
-	  platform.
-
-	  Say Y here if you are building a kernel for Mellanox system.
-
-	  Otherwise, say N.
-
 config X86_INTEL_LPSS
 	bool "Intel Low Power Subsystem Support"
 	depends on X86 && ACPI
diff --git a/arch/x86/platform/Makefile b/arch/x86/platform/Makefile
index 3c3c19e..184842e 100644
--- a/arch/x86/platform/Makefile
+++ b/arch/x86/platform/Makefile
@@ -8,7 +8,6 @@ obj-y	+= iris/
 obj-y	+= intel/
 obj-y	+= intel-mid/
 obj-y	+= intel-quark/
-obj-y	+= mellanox/
 obj-y	+= olpc/
 obj-y	+= scx200/
 obj-y	+= sfi/
diff --git a/arch/x86/platform/mellanox/Makefile b/arch/x86/platform/mellanox/Makefile
deleted file mode 100644
index f43c931..0000000
--- a/arch/x86/platform/mellanox/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-obj-$(CONFIG_MLX_PLATFORM)	+= mlx-platform.o
diff --git a/arch/x86/platform/mellanox/mlx-platform.c b/arch/x86/platform/mellanox/mlx-platform.c
deleted file mode 100644
index 7dcfcca..0000000
--- a/arch/x86/platform/mellanox/mlx-platform.c
+++ /dev/null
@@ -1,266 +0,0 @@
-/*
- * arch/x86/platform/mellanox/mlx-platform.c
- * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
- * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions are met:
- *
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- * 3. Neither the names of the copyright holders nor the names of its
- *    contributors may be used to endorse or promote products derived from
- *    this software without specific prior written permission.
- *
- * Alternatively, this software may be distributed under the terms of the
- * GNU General Public License ("GPL") version 2 as published by the Free
- * Software Foundation.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
- * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
- * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
- * POSSIBILITY OF SUCH DAMAGE.
- */
-
-#include <linux/device.h>
-#include <linux/dmi.h>
-#include <linux/i2c.h>
-#include <linux/i2c-mux.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/platform_data/i2c-mux-reg.h>
-
-#define MLX_PLAT_DEVICE_NAME		"mlxplat"
-
-/* LPC bus IO offsets */
-#define MLXPLAT_CPLD_LPC_I2C_BASE_ADRR		0x2000
-#define MLXPLAT_CPLD_LPC_REG_BASE_ADRR		0x2500
-#define MLXPLAT_CPLD_LPC_IO_RANGE		0x100
-#define MLXPLAT_CPLD_LPC_I2C_CH1_OFF		0xdb
-#define MLXPLAT_CPLD_LPC_I2C_CH2_OFF		0xda
-#define MLXPLAT_CPLD_LPC_PIO_OFFSET		0x10000UL
-#define MLXPLAT_CPLD_LPC_REG1	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
-				  MLXPLAT_CPLD_LPC_I2C_CH1_OFF) | \
-				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
-#define MLXPLAT_CPLD_LPC_REG2	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
-				  MLXPLAT_CPLD_LPC_I2C_CH2_OFF) | \
-				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
-
-/* Start channel numbers */
-#define MLXPLAT_CPLD_CH1			2
-#define MLXPLAT_CPLD_CH2			10
-
-/* Number of LPC attached MUX platform devices */
-#define MLXPLAT_CPLD_LPC_MUX_DEVS		2
-
-/* mlxplat_priv - platform private data
- * @pdev_i2c - i2c controller platform device
- * @pdev_mux - array of mux platform devices
- */
-struct mlxplat_priv {
-	struct platform_device *pdev_i2c;
-	struct platform_device *pdev_mux[MLXPLAT_CPLD_LPC_MUX_DEVS];
-};
-
-/* Regions for LPC I2C controller and LPC base register space */
-static const struct resource mlxplat_lpc_resources[] = {
-	[0] = DEFINE_RES_NAMED(MLXPLAT_CPLD_LPC_I2C_BASE_ADRR,
-			       MLXPLAT_CPLD_LPC_IO_RANGE,
-			       "mlxplat_cpld_lpc_i2c_ctrl", IORESOURCE_IO),
-	[1] = DEFINE_RES_NAMED(MLXPLAT_CPLD_LPC_REG_BASE_ADRR,
-			       MLXPLAT_CPLD_LPC_IO_RANGE,
-			       "mlxplat_cpld_lpc_regs",
-			       IORESOURCE_IO),
-};
-
-/* Platform default channels */
-static const int mlxplat_default_channels[][8] = {
-	{
-		MLXPLAT_CPLD_CH1, MLXPLAT_CPLD_CH1 + 1, MLXPLAT_CPLD_CH1 + 2,
-		MLXPLAT_CPLD_CH1 + 3, MLXPLAT_CPLD_CH1 + 4, MLXPLAT_CPLD_CH1 +
-		5, MLXPLAT_CPLD_CH1 + 6, MLXPLAT_CPLD_CH1 + 7
-	},
-	{
-		MLXPLAT_CPLD_CH2, MLXPLAT_CPLD_CH2 + 1, MLXPLAT_CPLD_CH2 + 2,
-		MLXPLAT_CPLD_CH2 + 3, MLXPLAT_CPLD_CH2 + 4, MLXPLAT_CPLD_CH2 +
-		5, MLXPLAT_CPLD_CH2 + 6, MLXPLAT_CPLD_CH2 + 7
-	},
-};
-
-/* Platform channels for MSN21xx system family */
-static const int mlxplat_msn21xx_channels[] = { 1, 2, 3, 4, 5, 6, 7, 8 };
-
-/* Platform mux data */
-static struct i2c_mux_reg_platform_data mlxplat_mux_data[] = {
-	{
-		.parent = 1,
-		.base_nr = MLXPLAT_CPLD_CH1,
-		.write_only = 1,
-		.reg = (void __iomem *)MLXPLAT_CPLD_LPC_REG1,
-		.reg_size = 1,
-		.idle_in_use = 1,
-	},
-	{
-		.parent = 1,
-		.base_nr = MLXPLAT_CPLD_CH2,
-		.write_only = 1,
-		.reg = (void __iomem *)MLXPLAT_CPLD_LPC_REG2,
-		.reg_size = 1,
-		.idle_in_use = 1,
-	},
-
-};
-
-static struct platform_device *mlxplat_dev;
-
-static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
-		mlxplat_mux_data[i].values = mlxplat_default_channels[i];
-		mlxplat_mux_data[i].n_values =
-				ARRAY_SIZE(mlxplat_default_channels[i]);
-	}
-
-	return 1;
-};
-
-static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
-		mlxplat_mux_data[i].values = mlxplat_msn21xx_channels;
-		mlxplat_mux_data[i].n_values =
-				ARRAY_SIZE(mlxplat_msn21xx_channels);
-	}
-
-	return 1;
-};
-
-static struct dmi_system_id mlxplat_dmi_table[] __initdata = {
-	{
-		.callback = mlxplat_dmi_default_matched,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "MSN24"),
-		},
-	},
-	{
-		.callback = mlxplat_dmi_default_matched,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "MSN27"),
-		},
-	},
-	{
-		.callback = mlxplat_dmi_default_matched,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "MSB"),
-		},
-	},
-	{
-		.callback = mlxplat_dmi_default_matched,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "MSX"),
-		},
-	},
-	{
-		.callback = mlxplat_dmi_msn21xx_matched,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "MSN21"),
-		},
-	},
-	{ }
-};
-
-static int __init mlxplat_init(void)
-{
-	struct mlxplat_priv *priv;
-	int i, err;
-
-	if (!dmi_check_system(mlxplat_dmi_table))
-		return -ENODEV;
-
-	mlxplat_dev = platform_device_register_simple(MLX_PLAT_DEVICE_NAME, -1,
-					mlxplat_lpc_resources,
-					ARRAY_SIZE(mlxplat_lpc_resources));
-
-	if (IS_ERR(mlxplat_dev))
-		return PTR_ERR(mlxplat_dev);
-
-	priv = devm_kzalloc(&mlxplat_dev->dev, sizeof(struct mlxplat_priv),
-			    GFP_KERNEL);
-	if (!priv) {
-		err = -ENOMEM;
-		goto fail_alloc;
-	}
-	platform_set_drvdata(mlxplat_dev, priv);
-
-	priv->pdev_i2c = platform_device_register_simple("i2c_mlxcpld", -1,
-							 NULL, 0);
-	if (IS_ERR(priv->pdev_i2c)) {
-		err = PTR_ERR(priv->pdev_i2c);
-		goto fail_alloc;
-	};
-
-	for (i = 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
-		priv->pdev_mux[i] = platform_device_register_resndata(
-						&mlxplat_dev->dev,
-						"i2c-mux-reg", i, NULL,
-						0, &mlxplat_mux_data[i],
-						sizeof(mlxplat_mux_data[i]));
-		if (IS_ERR(priv->pdev_mux[i])) {
-			err = PTR_ERR(priv->pdev_mux[i]);
-			goto fail_platform_mux_register;
-		}
-	}
-
-	return 0;
-
-fail_platform_mux_register:
-	for (i--; i > 0 ; i--)
-		platform_device_unregister(priv->pdev_mux[i]);
-	platform_device_unregister(priv->pdev_i2c);
-fail_alloc:
-	platform_device_unregister(mlxplat_dev);
-
-	return err;
-}
-module_init(mlxplat_init);
-
-static void __exit mlxplat_exit(void)
-{
-	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
-	int i;
-
-	for (i = ARRAY_SIZE(mlxplat_mux_data) - 1; i >= 0 ; i--)
-		platform_device_unregister(priv->pdev_mux[i]);
-
-	platform_device_unregister(priv->pdev_i2c);
-	platform_device_unregister(mlxplat_dev);
-}
-module_exit(mlxplat_exit);
-
-MODULE_AUTHOR("Vadim Pasternak (vadimp@mellanox.com)");
-MODULE_DESCRIPTION("Mellanox platform driver");
-MODULE_LICENSE("Dual BSD/GPL");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSN24*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSN27*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSB*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSX*:");
-MODULE_ALIAS("dmi:*:*Mellanox*:MSN21*:");
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1853769..78ed245 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1028,10 +1028,22 @@ config INTEL_TELEMETRY
 	  directly via debugfs files. Various tools may use
 	  this interface for SoC state monitoring.
 
+config MLX_PLATFORM
+	tristate "Mellanox Technologies platform support"
+	depends on X86_64
+	---help---
+	  This option enables system support for the Mellanox Technologies
+	  platform. The Mellanox systems provide data center networking
+	  solutions based on Virtual Protocol Interconnect (VPI) technology
+	  enable seamless connectivity to 56/100Gb/s InfiniBand or 10/40/56GbE
+	  connection.
+
+	  If you have a Mellanox system, say Y or M here.
+
 config MLX_CPLD_PLATFORM
 	tristate "Mellanox platform hotplug driver support"
 	default n
-	depends on MLX_PLATFORM
+	select MLX_PLATFORM
 	select HWMON
 	select I2C
 	---help---
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 1f06b63..2d6a587 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -71,4 +71,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)	+= intel_telemetry_core.o \
 				   intel_telemetry_pltdrv.o \
 				   intel_telemetry_debugfs.o
 obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
+obj-$(CONFIG_MLX_PLATFORM)	+= mlx-platform.o
 obj-$(CONFIG_MLX_CPLD_PLATFORM)	+= mlxcpld-hotplug.o
diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
new file mode 100644
index 0000000..86a1356
--- /dev/null
+++ b/drivers/platform/x86/mlx-platform.c
@@ -0,0 +1,266 @@
+/*
+ * drivers/platform/x86/mlx-platform.c
+ * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. Neither the names of the copyright holders nor the names of its
+ *    contributors may be used to endorse or promote products derived from
+ *    this software without specific prior written permission.
+ *
+ * Alternatively, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") version 2 as published by the Free
+ * Software Foundation.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+ * POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/i2c.h>
+#include <linux/i2c-mux.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/i2c-mux-reg.h>
+
+#define MLX_PLAT_DEVICE_NAME		"mlxplat"
+
+/* LPC bus IO offsets */
+#define MLXPLAT_CPLD_LPC_I2C_BASE_ADRR		0x2000
+#define MLXPLAT_CPLD_LPC_REG_BASE_ADRR		0x2500
+#define MLXPLAT_CPLD_LPC_IO_RANGE		0x100
+#define MLXPLAT_CPLD_LPC_I2C_CH1_OFF		0xdb
+#define MLXPLAT_CPLD_LPC_I2C_CH2_OFF		0xda
+#define MLXPLAT_CPLD_LPC_PIO_OFFSET		0x10000UL
+#define MLXPLAT_CPLD_LPC_REG1	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
+				  MLXPLAT_CPLD_LPC_I2C_CH1_OFF) | \
+				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
+#define MLXPLAT_CPLD_LPC_REG2	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
+				  MLXPLAT_CPLD_LPC_I2C_CH2_OFF) | \
+				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
+
+/* Start channel numbers */
+#define MLXPLAT_CPLD_CH1			2
+#define MLXPLAT_CPLD_CH2			10
+
+/* Number of LPC attached MUX platform devices */
+#define MLXPLAT_CPLD_LPC_MUX_DEVS		2
+
+/* mlxplat_priv - platform private data
+ * @pdev_i2c - i2c controller platform device
+ * @pdev_mux - array of mux platform devices
+ */
+struct mlxplat_priv {
+	struct platform_device *pdev_i2c;
+	struct platform_device *pdev_mux[MLXPLAT_CPLD_LPC_MUX_DEVS];
+};
+
+/* Regions for LPC I2C controller and LPC base register space */
+static const struct resource mlxplat_lpc_resources[] = {
+	[0] = DEFINE_RES_NAMED(MLXPLAT_CPLD_LPC_I2C_BASE_ADRR,
+			       MLXPLAT_CPLD_LPC_IO_RANGE,
+			       "mlxplat_cpld_lpc_i2c_ctrl", IORESOURCE_IO),
+	[1] = DEFINE_RES_NAMED(MLXPLAT_CPLD_LPC_REG_BASE_ADRR,
+			       MLXPLAT_CPLD_LPC_IO_RANGE,
+			       "mlxplat_cpld_lpc_regs",
+			       IORESOURCE_IO),
+};
+
+/* Platform default channels */
+static const int mlxplat_default_channels[][8] = {
+	{
+		MLXPLAT_CPLD_CH1, MLXPLAT_CPLD_CH1 + 1, MLXPLAT_CPLD_CH1 + 2,
+		MLXPLAT_CPLD_CH1 + 3, MLXPLAT_CPLD_CH1 + 4, MLXPLAT_CPLD_CH1 +
+		5, MLXPLAT_CPLD_CH1 + 6, MLXPLAT_CPLD_CH1 + 7
+	},
+	{
+		MLXPLAT_CPLD_CH2, MLXPLAT_CPLD_CH2 + 1, MLXPLAT_CPLD_CH2 + 2,
+		MLXPLAT_CPLD_CH2 + 3, MLXPLAT_CPLD_CH2 + 4, MLXPLAT_CPLD_CH2 +
+		5, MLXPLAT_CPLD_CH2 + 6, MLXPLAT_CPLD_CH2 + 7
+	},
+};
+
+/* Platform channels for MSN21xx system family */
+static const int mlxplat_msn21xx_channels[] = { 1, 2, 3, 4, 5, 6, 7, 8 };
+
+/* Platform mux data */
+static struct i2c_mux_reg_platform_data mlxplat_mux_data[] = {
+	{
+		.parent = 1,
+		.base_nr = MLXPLAT_CPLD_CH1,
+		.write_only = 1,
+		.reg = (void __iomem *)MLXPLAT_CPLD_LPC_REG1,
+		.reg_size = 1,
+		.idle_in_use = 1,
+	},
+	{
+		.parent = 1,
+		.base_nr = MLXPLAT_CPLD_CH2,
+		.write_only = 1,
+		.reg = (void __iomem *)MLXPLAT_CPLD_LPC_REG2,
+		.reg_size = 1,
+		.idle_in_use = 1,
+	},
+
+};
+
+static struct platform_device *mlxplat_dev;
+
+static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
+		mlxplat_mux_data[i].values = mlxplat_default_channels[i];
+		mlxplat_mux_data[i].n_values =
+				ARRAY_SIZE(mlxplat_default_channels[i]);
+	}
+
+	return 1;
+};
+
+static int __init mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
+		mlxplat_mux_data[i].values = mlxplat_msn21xx_channels;
+		mlxplat_mux_data[i].n_values =
+				ARRAY_SIZE(mlxplat_msn21xx_channels);
+	}
+
+	return 1;
+};
+
+static struct dmi_system_id mlxplat_dmi_table[] __initdata = {
+	{
+		.callback = mlxplat_dmi_default_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MSN24"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_default_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MSN27"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_default_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MSB"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_default_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MSX"),
+		},
+	},
+	{
+		.callback = mlxplat_dmi_msn21xx_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "MSN21"),
+		},
+	},
+	{ }
+};
+
+static int __init mlxplat_init(void)
+{
+	struct mlxplat_priv *priv;
+	int i, err;
+
+	if (!dmi_check_system(mlxplat_dmi_table))
+		return -ENODEV;
+
+	mlxplat_dev = platform_device_register_simple(MLX_PLAT_DEVICE_NAME, -1,
+					mlxplat_lpc_resources,
+					ARRAY_SIZE(mlxplat_lpc_resources));
+
+	if (IS_ERR(mlxplat_dev))
+		return PTR_ERR(mlxplat_dev);
+
+	priv = devm_kzalloc(&mlxplat_dev->dev, sizeof(struct mlxplat_priv),
+			    GFP_KERNEL);
+	if (!priv) {
+		err = -ENOMEM;
+		goto fail_alloc;
+	}
+	platform_set_drvdata(mlxplat_dev, priv);
+
+	priv->pdev_i2c = platform_device_register_simple("i2c_mlxcpld", -1,
+							 NULL, 0);
+	if (IS_ERR(priv->pdev_i2c)) {
+		err = PTR_ERR(priv->pdev_i2c);
+		goto fail_alloc;
+	};
+
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mux_data); i++) {
+		priv->pdev_mux[i] = platform_device_register_resndata(
+						&mlxplat_dev->dev,
+						"i2c-mux-reg", i, NULL,
+						0, &mlxplat_mux_data[i],
+						sizeof(mlxplat_mux_data[i]));
+		if (IS_ERR(priv->pdev_mux[i])) {
+			err = PTR_ERR(priv->pdev_mux[i]);
+			goto fail_platform_mux_register;
+		}
+	}
+
+	return 0;
+
+fail_platform_mux_register:
+	for (i--; i > 0 ; i--)
+		platform_device_unregister(priv->pdev_mux[i]);
+	platform_device_unregister(priv->pdev_i2c);
+fail_alloc:
+	platform_device_unregister(mlxplat_dev);
+
+	return err;
+}
+module_init(mlxplat_init);
+
+static void __exit mlxplat_exit(void)
+{
+	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
+	int i;
+
+	for (i = ARRAY_SIZE(mlxplat_mux_data) - 1; i >= 0 ; i--)
+		platform_device_unregister(priv->pdev_mux[i]);
+
+	platform_device_unregister(priv->pdev_i2c);
+	platform_device_unregister(mlxplat_dev);
+}
+module_exit(mlxplat_exit);
+
+MODULE_AUTHOR("Vadim Pasternak (vadimp@mellanox.com)");
+MODULE_DESCRIPTION("Mellanox platform driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS("dmi:*:*Mellanox*:MSN24*:");
+MODULE_ALIAS("dmi:*:*Mellanox*:MSN27*:");
+MODULE_ALIAS("dmi:*:*Mellanox*:MSB*:");
+MODULE_ALIAS("dmi:*:*Mellanox*:MSX*:");
+MODULE_ALIAS("dmi:*:*Mellanox*:MSN21*:");
-- 
2.1.4
