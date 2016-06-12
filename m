From: Dan O'Donovan <dan@emutex.com>
Subject: [RFC PATCH 4/5] platform: x86: add UP Board CPLD LED driver
Date: Sun, 12 Jun 2016 21:13:11 +0100
Message-ID: <1465762392-9205-5-git-send-email-dan@emutex.com>
References: <1465762392-9205-1-git-send-email-dan@emutex.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:32891 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753372AbcFLULe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Jun 2016 16:11:34 -0400
Received: from [92.51.199.138] (helo=statler.emutex.com)
	by bert.emutex.com with esmtp (Exim 4.84)
	(envelope-from <dan@emutex.com>)
	id 1bCBjH-0006Ig-BZ
	for platform-driver-x86@vger.kernel.org; Sun, 12 Jun 2016 21:11:31 +0100
In-Reply-To: <1465762392-9205-1-git-send-email-dan@emutex.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Dan O'Donovan <dan@emutex.com>

This pinctrl driver manages the LED Control function provided by
the I/O CPLD integrated on the UP Board.  This allows basic on/off
brightness control for each of the individual LEDs.

Signed-off-by: Dan O'Donovan <dan@emutex.com>
---
 drivers/platform/x86/up_board_leds.c | 85 ++++++++++++++++++++++++++++++++++++
 drivers/platform/x86/up_board_leds.h | 50 +++++++++++++++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 drivers/platform/x86/up_board_leds.c
 create mode 100644 drivers/platform/x86/up_board_leds.h

diff --git a/drivers/platform/x86/up_board_leds.c b/drivers/platform/x86/up_board_leds.c
new file mode 100644
index 0000000..4186475
--- /dev/null
+++ b/drivers/platform/x86/up_board_leds.c
@@ -0,0 +1,85 @@
+/*
+ * UP Board CPLD LEDs driver.
+ *
+ * Copyright (c) 2016, Emutex Ltd.  All rights reserved.
+ *
+ * Author: Javier Arteaga <javier@emutex.com>
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
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/leds.h>
+#include <linux/platform_device.h>
+
+#include "up_board_leds.h"
+
+/* Internal context information for this driver */
+struct up_board_led {
+	struct up_board_leds_pdata *pdata;
+	unsigned int offset;
+	const char *name;
+	struct led_classdev cdev;
+};
+
+static void up_led_brightness_set(struct led_classdev *cdev,
+				  enum led_brightness value)
+{
+	struct up_board_led *led = container_of(cdev,
+						struct up_board_led,
+						cdev);
+	struct up_board_cpld_info *cpld_info = &led->pdata->cpld_info;
+
+	cpld_info->reg_set_bit(cpld_info->cpld, led->offset, value != LED_OFF);
+}
+
+static int up_board_leds_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct up_board_leds_pdata *pdata = dev_get_platdata(dev);
+	struct up_board_led *up_led;
+	int ret = 0;
+	size_t i;
+
+	for (i = 0; i < pdata->nled; i++) {
+		struct up_board_led_info *led_info = &pdata->leds[i];
+
+		up_led = devm_kzalloc(dev, sizeof(*up_led), GFP_KERNEL);
+		if (!up_led)
+			return -ENOMEM;
+
+		up_led->pdata = pdata;
+		up_led->offset = led_info->cpld_offset;
+		up_led->cdev.brightness_set = up_led_brightness_set;
+		up_led->cdev.name = led_info->name;
+
+		ret = devm_led_classdev_register(dev, &up_led->cdev);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver up_board_leds_driver = {
+	.driver.name	= "up-board-leds",
+	.driver.owner	= THIS_MODULE,
+	.probe		= up_board_leds_probe,
+};
+
+module_platform_driver(up_board_leds_driver);
+
+MODULE_AUTHOR("Javier Arteaga <javier@emutex.com>");
+MODULE_DESCRIPTION("UP Board LEDs driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:up-board-leds");
diff --git a/drivers/platform/x86/up_board_leds.h b/drivers/platform/x86/up_board_leds.h
new file mode 100644
index 0000000..473b1ad
--- /dev/null
+++ b/drivers/platform/x86/up_board_leds.h
@@ -0,0 +1,50 @@
+/*
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
+#ifndef _UP_BOARD_LED_H_
+#define _UP_BOARD_LED_H_
+
+#include "up_board_cpld.h"
+
+/**
+ * struct up_board_led_info - information for an UP Board LED
+ * @name:		LED name
+ * @cpld_offset:	CPLD register bit offset for LED control
+ *
+ * Information for a single CPLD-controlled LED on the UP Board.
+ */
+struct up_board_led_info {
+	const char *name;
+	unsigned int cpld_offset;
+};
+
+/**
+ * struct up_board_leds_pdata - platform driver data
+ * @cpld_info:	CPLD configuration interface information
+ * @leds:	Array of LED information structures
+ * @nled:	Number of entries in leds array
+ *
+ * Platform data provided to UP Board CPLD LEDs platform device driver.
+ * Provides information for each CPLD-controlled LED on the UP Board.
+ */
+struct up_board_leds_pdata {
+	struct up_board_cpld_info cpld_info;
+	struct up_board_led_info *leds;
+	size_t nled;
+};
+
+#endif /* _UP_BOARD_LED_H_ */
-- 
2.1.4
