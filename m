From: Dan O'Donovan <dan@emutex.com>
Subject: [RESEND RFC PATCH 5/5] platform: x86: add platform driver for UP Board
Date: Mon,  4 Jul 2016 17:07:14 +0100
Message-ID: <1467648434-29080-6-git-send-email-dan@emutex.com>
References: <1465762392-9205-1-git-send-email-dan@emutex.com>
 <1467648434-29080-1-git-send-email-dan@emutex.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467648434-29080-1-git-send-email-dan@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, dvhart@infradead.org
Cc: lee.jones@linaro.org, andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org, Dan O'Donovan <dan@emutex.com>
List-Id: platform-driver-x86.vger.kernel.org

This platform driver instantiates a platform device relevant to the
UP board, in particular a device representing the unique I/O pin CPLD
controller on the UP board.

In addition, this driver registers pin maps to configure
appropriately the underlying SoC GPIO pins for use with the
UP Board I/O pin header.

Signed-off-by: Dan O'Donovan <dan@emutex.com>
---
 drivers/platform/x86/Kconfig    |  13 ++++
 drivers/platform/x86/Makefile   |   5 ++
 drivers/platform/x86/up_board.c | 167 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 185 insertions(+)
 create mode 100644 drivers/platform/x86/up_board.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3ec0025..b579adb 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1011,4 +1011,17 @@ config INTEL_TELEMETRY
 	  used to get various SoC events and parameters
 	  directly via debugfs files. Various tools may use
 	  this interface for SoC state monitoring.
+
+config UP_BOARD
+	bool "UP Board Platform I/O Driver"
+	depends on ACPI && PINCTRL_CHERRYVIEW
+	select GPIOLIB_IRQCHIP
+	select LEDS_CLASS
+	select NEW_LEDS
+	---help---
+	  This driver provides support for the platform functions on the UP
+	  board.  It includes platform, pinctrl and gpio drivers for the CPLD
+	  that manages the external pin header, as well as a driver for the
+	  built-in LEDs.
+
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 9b11b40..687c583 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -70,3 +70,8 @@ obj-$(CONFIG_INTEL_TELEMETRY)	+= intel_telemetry_core.o \
 				   intel_telemetry_pltdrv.o \
 				   intel_telemetry_debugfs.o
 obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
+obj-$(CONFIG_UP_BOARD)		+= up_board.o \
+				   up_board_cpld.o \
+				   up_board_pinctrl.o \
+				   up_board_gpio.o \
+				   up_board_leds.o
diff --git a/drivers/platform/x86/up_board.c b/drivers/platform/x86/up_board.c
new file mode 100644
index 0000000..8635759
--- /dev/null
+++ b/drivers/platform/x86/up_board.c
@@ -0,0 +1,167 @@
+
+/*
+ * UP Board platform driver.
+ *
+ * Copyright (c) 2016, Emutex Ltd.  All rights reserved.
+ *
+ * Author: Dan O'Donovan <dan@emutex.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include <linux/module.h>
+#include <linux/dmi.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/regulator/fixed.h>
+#include <linux/regulator/machine.h>
+
+/* Internal context information for this driver */
+struct up_board_info {
+	struct platform_device *cpld_pdev;
+	struct platform_device *vreg_pdev;
+	struct pinctrl_map *pinmux_maps;
+	unsigned int num_pinmux_maps;
+};
+
+/*
+ * On the UP board, if the ODEn bit is set on the pad configuration
+ * it seems to impair some functions on the I/O header such as UART, SPI
+ * and I2C.  So we disable it for all header pins by default.
+ */
+static unsigned long oden_disable_conf[] = {
+	PIN_CONF_PACKED(PIN_CONFIG_DRIVE_PUSH_PULL, 0),
+};
+
+#define UP_PIN_MAP_MUX_GROUP(d, p, f) \
+	PIN_MAP_MUX_GROUP_DEFAULT(d, p, f "_grp", f)
+
+#define UP_PIN_MAP_CONF_ODEN(d, p, f) \
+	PIN_MAP_CONFIGS_GROUP_DEFAULT(d, p, f "_grp", oden_disable_conf)
+
+/* Maps pin functions on UP Board I/O pin header to specific CHT SoC devices */
+static struct pinctrl_map up_pinmux_maps[] __initdata = {
+	UP_PIN_MAP_MUX_GROUP("8086228A:00", "up-board-pinctrl", "uart1"),
+	UP_PIN_MAP_MUX_GROUP("808622C1:00", "up-board-pinctrl", "i2c0"),
+	UP_PIN_MAP_MUX_GROUP("808622C1:01", "up-board-pinctrl", "i2c1"),
+	UP_PIN_MAP_MUX_GROUP("80862288:00", "up-board-pinctrl", "pwm0"),
+	UP_PIN_MAP_MUX_GROUP("80862288:01", "up-board-pinctrl", "pwm1"),
+	UP_PIN_MAP_MUX_GROUP("8086228E:01", "up-board-pinctrl", "spi2"),
+	UP_PIN_MAP_MUX_GROUP("808622A8:00", "up-board-pinctrl", "i2s2"),
+	UP_PIN_MAP_MUX_GROUP("i2c-ADC081C:00", "up-board-pinctrl", "adc0"),
+
+	UP_PIN_MAP_MUX_GROUP("8086228A:00", "INT33FF:00", "uart1"),
+	UP_PIN_MAP_MUX_GROUP("808622C1:00", "INT33FF:00", "i2c0"),
+	UP_PIN_MAP_MUX_GROUP("808622C1:01", "INT33FF:00", "i2c1"),
+	UP_PIN_MAP_MUX_GROUP("808622C1:02", "INT33FF:00", "i2c2"),
+	UP_PIN_MAP_MUX_GROUP("80862288:00", "INT33FF:03", "pwm0"),
+	UP_PIN_MAP_MUX_GROUP("80862288:01", "INT33FF:03", "pwm1"),
+	UP_PIN_MAP_MUX_GROUP("8086228E:01", "INT33FF:03", "spi2"),
+	UP_PIN_MAP_MUX_GROUP("808622A8:00", "INT33FF:00", "lpe"),
+
+	UP_PIN_MAP_CONF_ODEN("8086228A:00", "INT33FF:00", "uart1"),
+	UP_PIN_MAP_CONF_ODEN("808622C1:00", "INT33FF:00", "i2c0"),
+	UP_PIN_MAP_CONF_ODEN("808622C1:01", "INT33FF:00", "i2c1"),
+	UP_PIN_MAP_CONF_ODEN("80862288:00", "INT33FF:03", "pwm0"),
+	UP_PIN_MAP_CONF_ODEN("80862288:01", "INT33FF:03", "pwm1"),
+	UP_PIN_MAP_CONF_ODEN("8086228E:01", "INT33FF:03", "spi2"),
+	UP_PIN_MAP_CONF_ODEN("808622A8:00", "INT33FF:00", "lpe"),
+};
+
+static struct up_board_info up_board_info = {
+	.pinmux_maps = up_pinmux_maps,
+	.num_pinmux_maps = ARRAY_SIZE(up_pinmux_maps),
+};
+
+static const struct dmi_system_id up_board_id_table[] __initconst = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_MATCH(DMI_BOARD_NAME, "UP-CHT01"),
+			DMI_MATCH(DMI_BOARD_VERSION, "V0.4"),
+		},
+		.driver_data = &up_board_info,
+	},
+	{ }
+};
+
+static struct regulator_consumer_supply vref3v3_consumers[] = {
+	REGULATOR_SUPPLY("vref", "i2c-ADC081C:00"),
+};
+
+static struct up_board_info *up_board;
+
+static int __init
+up_board_init_devices(void)
+{
+	const struct dmi_system_id *system_id;
+	int ret;
+
+	system_id = dmi_first_match(up_board_id_table);
+	if (!system_id)
+		return -ENXIO;
+
+	up_board = system_id->driver_data;
+
+	/* Register pin control mappings specific to board version */
+	if (up_board->pinmux_maps) {
+		ret = pinctrl_register_mappings(up_board->pinmux_maps,
+						up_board->num_pinmux_maps);
+		if (ret) {
+			pr_err("Failed to register UP Board pinctrl mapping");
+			return ret;
+		}
+	}
+
+	/* Create a platform device to manage the UP Board I/O header CPLD */
+	up_board->cpld_pdev =
+		platform_device_register_simple("up-board-cpld",
+						PLATFORM_DEVID_NONE,
+						NULL, 0);
+	if (IS_ERR(up_board->cpld_pdev)) {
+		pr_err("Failed to register UP Board I/O CPLD platform device");
+		return PTR_ERR(up_board->cpld_pdev);
+	}
+
+	up_board->vreg_pdev =
+		regulator_register_always_on(0, "fixed-3.3V",
+					     vref3v3_consumers,
+					     ARRAY_SIZE(vref3v3_consumers),
+					     3300000);
+	if (!up_board->vreg_pdev) {
+		pr_err("Failed to register UP Board ADC vref regulator");
+		platform_device_unregister(up_board->cpld_pdev);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void __exit
+up_board_exit(void)
+{
+	platform_device_unregister(up_board->vreg_pdev);
+	platform_device_unregister(up_board->cpld_pdev);
+}
+
+/*
+ * Using arch_initcall to ensure that pinmux maps are registered
+ * before the relevant devices are initialised
+ */
+arch_initcall(up_board_init_devices);
+module_exit(up_board_exit);
+
+MODULE_AUTHOR("Dan O'Donovan <dan@emutex.com>");
+MODULE_DESCRIPTION("Platform driver for UP Board");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("dmi:*:svnAAEON*:rnUP-CHT01:*");
-- 
2.1.4
