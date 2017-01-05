From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] platform/x86: Remove PMIC GPIO block support
Date: Thu,  5 Jan 2017 13:32:28 +0200
Message-ID: <20170105113228.132165-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:5019 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752933AbdAELdJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Jan 2017 06:33:09 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The Moorestown support was removed by commit 1a8359e411eb ("x86/mid: Remove
Intel Moorestown").

Remove this leftover.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/Kconfig           |   8 -
 drivers/platform/x86/Makefile          |   1 -
 drivers/platform/x86/intel_pmic_gpio.c | 326 ---------------------------------
 include/linux/intel_pmic_gpio.h        |  15 --
 4 files changed, 350 deletions(-)
 delete mode 100644 drivers/platform/x86/intel_pmic_gpio.c
 delete mode 100644 include/linux/intel_pmic_gpio.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3cf325de9bf3..9d9b12556809 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -836,19 +836,11 @@ config INTEL_SCU_IPC_UTIL
 	  low level access for debug work and updating the firmware. Say
 	  N unless you will be doing this on an Intel MID platform.
 
-config GPIO_INTEL_PMIC
-	bool "Intel PMIC GPIO support"
-	depends on INTEL_SCU_IPC && GPIOLIB
-	---help---
-	  Say Y here to support GPIO via the SCU IPC interface
-	  on Intel MID platforms.
-
 config INTEL_MID_POWER_BUTTON
 	tristate "power button driver for Intel MID platforms"
 	depends on INTEL_SCU_IPC && INPUT
 	help
 	  This driver handles the power button on the Intel MID platforms.
-
 	  If unsure, say N.
 
 config INTEL_MFLD_THERMAL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 6bad273856e0..d84f53101520 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -56,7 +56,6 @@ obj-$(CONFIG_INTEL_SCU_IPC)	+= intel_scu_ipc.o
 obj-$(CONFIG_INTEL_SCU_IPC_UTIL) += intel_scu_ipcutil.o
 obj-$(CONFIG_INTEL_MFLD_THERMAL) += intel_mid_thermal.o
 obj-$(CONFIG_INTEL_IPS)		+= intel_ips.o
-obj-$(CONFIG_GPIO_INTEL_PMIC)	+= intel_pmic_gpio.o
 obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
 obj-$(CONFIG_XO15_EBOOK)	+= xo15-ebook.o
 obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
diff --git a/drivers/platform/x86/intel_pmic_gpio.c b/drivers/platform/x86/intel_pmic_gpio.c
deleted file mode 100644
index 91ae58510d92..000000000000
--- a/drivers/platform/x86/intel_pmic_gpio.c
+++ /dev/null
@@ -1,326 +0,0 @@
-/* Moorestown PMIC GPIO (access through IPC) driver
- * Copyright (c) 2008 - 2009, Intel Corporation.
- *
- * Author: Alek Du <alek.du@intel.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-/* Supports:
- * Moorestown platform PMIC chip
- */
-
-#define pr_fmt(fmt) "%s: " fmt, __func__
-
-#include <linux/kernel.h>
-#include <linux/interrupt.h>
-#include <linux/delay.h>
-#include <linux/stddef.h>
-#include <linux/slab.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/gpio/driver.h>
-#include <asm/intel_scu_ipc.h>
-#include <linux/device.h>
-#include <linux/intel_pmic_gpio.h>
-#include <linux/platform_device.h>
-
-#define DRIVER_NAME "pmic_gpio"
-
-/* register offset that IPC driver should use
- * 8 GPIO + 8 GPOSW (6 controllable) + 8GPO
- */
-enum pmic_gpio_register {
-	GPIO0		= 0xE0,
-	GPIO7		= 0xE7,
-	GPIOINT		= 0xE8,
-	GPOSWCTL0	= 0xEC,
-	GPOSWCTL5	= 0xF1,
-	GPO		= 0xF4,
-};
-
-/* bits definition for GPIO & GPOSW */
-#define GPIO_DRV 0x01
-#define GPIO_DIR 0x02
-#define GPIO_DIN 0x04
-#define GPIO_DOU 0x08
-#define GPIO_INTCTL 0x30
-#define GPIO_DBC 0xc0
-
-#define GPOSW_DRV 0x01
-#define GPOSW_DOU 0x08
-#define GPOSW_RDRV 0x30
-
-#define GPIO_UPDATE_TYPE	0x80000000
-
-#define NUM_GPIO 24
-
-struct pmic_gpio {
-	struct mutex		buslock;
-	struct gpio_chip	chip;
-	void			*gpiointr;
-	int			irq;
-	unsigned		irq_base;
-	unsigned int		update_type;
-	u32			trigger_type;
-};
-
-static void pmic_program_irqtype(int gpio, int type)
-{
-	if (type & IRQ_TYPE_EDGE_RISING)
-		intel_scu_ipc_update_register(GPIO0 + gpio, 0x20, 0x20);
-	else
-		intel_scu_ipc_update_register(GPIO0 + gpio, 0x00, 0x20);
-
-	if (type & IRQ_TYPE_EDGE_FALLING)
-		intel_scu_ipc_update_register(GPIO0 + gpio, 0x10, 0x10);
-	else
-		intel_scu_ipc_update_register(GPIO0 + gpio, 0x00, 0x10);
-};
-
-static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	if (offset >= 8) {
-		pr_err("only pin 0-7 support input\n");
-		return -1;/* we only have 8 GPIO can use as input */
-	}
-	return intel_scu_ipc_update_register(GPIO0 + offset,
-							GPIO_DIR, GPIO_DIR);
-}
-
-static int pmic_gpio_direction_output(struct gpio_chip *chip,
-			unsigned offset, int value)
-{
-	int rc = 0;
-
-	if (offset < 8)/* it is GPIO */
-		rc = intel_scu_ipc_update_register(GPIO0 + offset,
-				GPIO_DRV | (value ? GPIO_DOU : 0),
-				GPIO_DRV | GPIO_DOU | GPIO_DIR);
-	else if (offset < 16)/* it is GPOSW */
-		rc = intel_scu_ipc_update_register(GPOSWCTL0 + offset - 8,
-				GPOSW_DRV | (value ? GPOSW_DOU : 0),
-				GPOSW_DRV | GPOSW_DOU | GPOSW_RDRV);
-	else if (offset > 15 && offset < 24)/* it is GPO */
-		rc = intel_scu_ipc_update_register(GPO,
-				value ? 1 << (offset - 16) : 0,
-				1 << (offset - 16));
-	else {
-		pr_err("invalid PMIC GPIO pin %d!\n", offset);
-		WARN_ON(1);
-	}
-
-	return rc;
-}
-
-static int pmic_gpio_get(struct gpio_chip *chip, unsigned offset)
-{
-	u8 r;
-	int ret;
-
-	/* we only have 8 GPIO pins we can use as input */
-	if (offset >= 8)
-		return -EOPNOTSUPP;
-	ret = intel_scu_ipc_ioread8(GPIO0 + offset, &r);
-	if (ret < 0)
-		return ret;
-	return r & GPIO_DIN;
-}
-
-static void pmic_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-{
-	if (offset < 8)/* it is GPIO */
-		intel_scu_ipc_update_register(GPIO0 + offset,
-			GPIO_DRV | (value ? GPIO_DOU : 0),
-			GPIO_DRV | GPIO_DOU);
-	else if (offset < 16)/* it is GPOSW */
-		intel_scu_ipc_update_register(GPOSWCTL0 + offset - 8,
-			GPOSW_DRV | (value ? GPOSW_DOU : 0),
-			GPOSW_DRV | GPOSW_DOU | GPOSW_RDRV);
-	else if (offset > 15 && offset < 24) /* it is GPO */
-		intel_scu_ipc_update_register(GPO,
-			value ? 1 << (offset - 16) : 0,
-			1 << (offset - 16));
-}
-
-/*
- * This is called from genirq with pg->buslock locked and
- * irq_desc->lock held. We can not access the scu bus here, so we
- * store the change and update in the bus_sync_unlock() function below
- */
-static int pmic_irq_type(struct irq_data *data, unsigned type)
-{
-	struct pmic_gpio *pg = irq_data_get_irq_chip_data(data);
-	u32 gpio = data->irq - pg->irq_base;
-
-	if (gpio >= pg->chip.ngpio)
-		return -EINVAL;
-
-	pg->trigger_type = type;
-	pg->update_type = gpio | GPIO_UPDATE_TYPE;
-	return 0;
-}
-
-static int pmic_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
-{
-	struct pmic_gpio *pg = gpiochip_get_data(chip);
-
-	return pg->irq_base + offset;
-}
-
-static void pmic_bus_lock(struct irq_data *data)
-{
-	struct pmic_gpio *pg = irq_data_get_irq_chip_data(data);
-
-	mutex_lock(&pg->buslock);
-}
-
-static void pmic_bus_sync_unlock(struct irq_data *data)
-{
-	struct pmic_gpio *pg = irq_data_get_irq_chip_data(data);
-
-	if (pg->update_type) {
-		unsigned int gpio = pg->update_type & ~GPIO_UPDATE_TYPE;
-
-		pmic_program_irqtype(gpio, pg->trigger_type);
-		pg->update_type = 0;
-	}
-	mutex_unlock(&pg->buslock);
-}
-
-/* the gpiointr register is read-clear, so just do nothing. */
-static void pmic_irq_unmask(struct irq_data *data) { }
-
-static void pmic_irq_mask(struct irq_data *data) { }
-
-static struct irq_chip pmic_irqchip = {
-	.name			= "PMIC-GPIO",
-	.irq_mask		= pmic_irq_mask,
-	.irq_unmask		= pmic_irq_unmask,
-	.irq_set_type		= pmic_irq_type,
-	.irq_bus_lock		= pmic_bus_lock,
-	.irq_bus_sync_unlock	= pmic_bus_sync_unlock,
-};
-
-static irqreturn_t pmic_irq_handler(int irq, void *data)
-{
-	struct pmic_gpio *pg = data;
-	u8 intsts = *((u8 *)pg->gpiointr + 4);
-	int gpio;
-	irqreturn_t ret = IRQ_NONE;
-
-	for (gpio = 0; gpio < 8; gpio++) {
-		if (intsts & (1 << gpio)) {
-			pr_debug("pmic pin %d triggered\n", gpio);
-			generic_handle_irq(pg->irq_base + gpio);
-			ret = IRQ_HANDLED;
-		}
-	}
-	return ret;
-}
-
-static int platform_pmic_gpio_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	int irq = platform_get_irq(pdev, 0);
-	struct intel_pmic_gpio_platform_data *pdata = dev->platform_data;
-
-	struct pmic_gpio *pg;
-	int retval;
-	int i;
-
-	if (irq < 0) {
-		dev_dbg(dev, "no IRQ line\n");
-		return -EINVAL;
-	}
-
-	if (!pdata || !pdata->gpio_base || !pdata->irq_base) {
-		dev_dbg(dev, "incorrect or missing platform data\n");
-		return -EINVAL;
-	}
-
-	pg = kzalloc(sizeof(*pg), GFP_KERNEL);
-	if (!pg)
-		return -ENOMEM;
-
-	dev_set_drvdata(dev, pg);
-
-	pg->irq = irq;
-	/* setting up SRAM mapping for GPIOINT register */
-	pg->gpiointr = ioremap_nocache(pdata->gpiointr, 8);
-	if (!pg->gpiointr) {
-		pr_err("Can not map GPIOINT\n");
-		retval = -EINVAL;
-		goto err2;
-	}
-	pg->irq_base = pdata->irq_base;
-	pg->chip.label = "intel_pmic";
-	pg->chip.direction_input = pmic_gpio_direction_input;
-	pg->chip.direction_output = pmic_gpio_direction_output;
-	pg->chip.get = pmic_gpio_get;
-	pg->chip.set = pmic_gpio_set;
-	pg->chip.to_irq = pmic_gpio_to_irq;
-	pg->chip.base = pdata->gpio_base;
-	pg->chip.ngpio = NUM_GPIO;
-	pg->chip.can_sleep = 1;
-	pg->chip.parent = dev;
-
-	mutex_init(&pg->buslock);
-
-	pg->chip.parent = dev;
-	retval = gpiochip_add_data(&pg->chip, pg);
-	if (retval) {
-		pr_err("Can not add pmic gpio chip\n");
-		goto err;
-	}
-
-	retval = request_irq(pg->irq, pmic_irq_handler, 0, "pmic", pg);
-	if (retval) {
-		pr_warn("Interrupt request failed\n");
-		goto fail_request_irq;
-	}
-
-	for (i = 0; i < 8; i++) {
-		irq_set_chip_and_handler_name(i + pg->irq_base,
-					      &pmic_irqchip,
-					      handle_simple_irq,
-					      "demux");
-		irq_set_chip_data(i + pg->irq_base, pg);
-	}
-	return 0;
-
-fail_request_irq:
-	gpiochip_remove(&pg->chip);
-err:
-	iounmap(pg->gpiointr);
-err2:
-	kfree(pg);
-	return retval;
-}
-
-/* at the same time, register a platform driver
- * this supports the sfi 0.81 fw */
-static struct platform_driver platform_pmic_gpio_driver = {
-	.driver = {
-		.name		= DRIVER_NAME,
-	},
-	.probe		= platform_pmic_gpio_probe,
-};
-
-static int __init platform_pmic_gpio_init(void)
-{
-	return platform_driver_register(&platform_pmic_gpio_driver);
-}
-subsys_initcall(platform_pmic_gpio_init);
diff --git a/include/linux/intel_pmic_gpio.h b/include/linux/intel_pmic_gpio.h
deleted file mode 100644
index 920109a29191..000000000000
--- a/include/linux/intel_pmic_gpio.h
+++ /dev/null
@@ -1,15 +0,0 @@
-#ifndef LINUX_INTEL_PMIC_H
-#define LINUX_INTEL_PMIC_H
-
-struct intel_pmic_gpio_platform_data {
-	/* the first IRQ of the chip */
-	unsigned	irq_base;
-	/* number assigned to the first GPIO */
-	unsigned	gpio_base;
-	/* sram address for gpiointr register, the langwell chip will map
-	 * the PMIC spi GPIO expander's GPIOINTR register in sram.
-	 */
-	unsigned	gpiointr;
-};
-
-#endif
-- 
2.11.0
