From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH][v2] asus-rbtn: new driver for asus radio button for Windows 8
Date: Wed, 24 Jun 2015 10:57:51 +0800
Message-ID: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:52395 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752972AbbFXC57 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Jun 2015 22:57:59 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, alex.hung@canonical.com

ASUS introduced a new approach to handle wireless hotkey
since Windows 8.  When the hotkey is pressed, BIOS generates
a notification 0x88 to a new ACPI device, ATK4001.  This
new driver not only translates the notification to KEY_RFKILL
but also toggles its LED accordingly.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 MAINTAINERS                      |   6 +
 drivers/platform/x86/Kconfig     |  11 ++
 drivers/platform/x86/Makefile    |   1 +
 drivers/platform/x86/asus-rbtn.c | 240 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 258 insertions(+)
 create mode 100644 drivers/platform/x86/asus-rbtn.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d8afd29..03711ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1673,6 +1673,12 @@ S:	Maintained
 F:	drivers/platform/x86/asus*.c
 F:	drivers/platform/x86/eeepc*.c
 
+ASUS RADIO BUTTON DRIVER
+M:	Alex Hung <alex.hung@canonical.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/asus-rbtn.c
+
 ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API
 R:	Dan Williams <dan.j.williams@intel.com>
 W:	http://sourceforge.net/projects/xscaleiop
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f9f205c..a8ac885 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -516,6 +516,17 @@ config EEEPC_LAPTOP
 	  If you have an Eee PC laptop, say Y or M here. If this driver
 	  doesn't work on your Eee PC, try eeepc-wmi instead.
 
+config ASUS_RBTN
+	tristate "ASUS radio button"
+	depends on ACPI
+	depends on INPUT
+	help
+	 This driver provides supports for new ASUS radio button for Windows 8.
+	 On such systems the driver should load automatically (via ACPI alias).
+
+	 To compile this driver as a module, choose M here: the module will
+	 be called asus-rbtn.
+
 config ASUS_WMI
 	tristate "ASUS WMI Driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index f82232b..6710bb3 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -3,6 +3,7 @@
 # x86 Platform-Specific Drivers
 #
 obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
+obj-$(CONFIG_ASUS_RBTN)		+= asus-rbtn.o
 obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
 obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
 obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
diff --git a/drivers/platform/x86/asus-rbtn.c b/drivers/platform/x86/asus-rbtn.c
new file mode 100644
index 0000000..a469881
--- /dev/null
+++ b/drivers/platform/x86/asus-rbtn.c
@@ -0,0 +1,240 @@
+/*
+ *  asus-rbtn radio button for Windows 8
+ *
+ *  Copyright (C) 2015 Alex Hung <alex.hung@canonical.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
+#include <acpi/acpi_bus.h>
+#include <linux/rfkill.h>
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alex Hung");
+MODULE_ALIAS("acpi*:ATK4001:*");
+
+#define ASUS_RBTN_NOTIFY	0x88
+
+static struct platform_device *asuspl_dev;
+static struct input_dev *asusrb_input_dev;
+static struct rfkill *asus_rfkill;
+static struct acpi_device *asus_rbtn_device;
+static int radio_led_state;
+
+static const struct acpi_device_id asusrb_ids[] = {
+	{"ATK4001", 0},
+	{"", 0},
+};
+
+static int asus_radio_led_set(bool blocked)
+{
+	acpi_status status;
+	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
+	struct acpi_object_list args = { 1, &arg0 };
+	unsigned long long output;
+
+	arg0.integer.value = blocked;
+	status = acpi_evaluate_integer(asus_rbtn_device->handle, "HSWC",
+				       &args, &output);
+	if (!ACPI_SUCCESS(status) || output == 0) {
+		pr_err("fail to change wireless LED.\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int asus_rfkill_set(void *data, bool blocked)
+{
+	radio_led_state = blocked ? 0 : 1;
+
+	return asus_radio_led_set(radio_led_state);
+}
+
+static const struct rfkill_ops asus_rfkill_ops = {
+	.set_block = asus_rfkill_set,
+};
+
+static int asusrb_rfkill_setup(struct acpi_device *device)
+{
+	int err;
+
+	asus_rfkill = rfkill_alloc("asus_rbtn",
+				   &device->dev,
+				   RFKILL_TYPE_WLAN,
+				   &asus_rfkill_ops,
+				   device);
+	if (!asus_rfkill) {
+		pr_err("unable to allocate rfkill device\n");
+		return -ENOMEM;
+	}
+
+	err = rfkill_register(asus_rfkill);
+	if (err) {
+		pr_err("unable to register rfkill device\n");
+		rfkill_destroy(asus_rfkill);
+	}
+
+	return err;
+}
+
+static int asus_rbtn_input_setup(void)
+{
+	int err;
+
+	asusrb_input_dev = input_allocate_device();
+	if (!asusrb_input_dev)
+		return -ENOMEM;
+
+	asusrb_input_dev->name = "ASUS radio hotkeys";
+	asusrb_input_dev->phys = "atk4001/input0";
+	asusrb_input_dev->id.bustype = BUS_HOST;
+	asusrb_input_dev->evbit[0] = BIT(EV_KEY);
+	set_bit(KEY_RFKILL, asusrb_input_dev->keybit);
+
+	err = input_register_device(asusrb_input_dev);
+	if (err)
+		goto err_free_dev;
+
+	return 0;
+
+err_free_dev:
+	input_free_device(asusrb_input_dev);
+	return err;
+}
+
+static void asus_rbtn_input_destroy(void)
+{
+	input_unregister_device(asusrb_input_dev);
+}
+
+static void asusrb_notify(struct acpi_device *acpi_dev, u32 event)
+{
+	if (event != ASUS_RBTN_NOTIFY) {
+		pr_err("received unknown event (0x%x)\n", event);
+		return;
+	}
+
+	input_report_key(asusrb_input_dev, KEY_RFKILL, 1);
+	input_sync(asusrb_input_dev);
+	input_report_key(asusrb_input_dev, KEY_RFKILL, 0);
+	input_sync(asusrb_input_dev);
+}
+
+static int asusrb_add(struct acpi_device *device)
+{
+	int err;
+
+	asus_rbtn_device = device;
+
+	err = asus_rbtn_input_setup();
+	if (err) {
+		pr_err("failed to setup asus_rbtn hotkeys\n");
+		return err;
+	}
+
+	err = asusrb_rfkill_setup(device);
+	if (err)
+		pr_err("failed to setup asus_rbtn rfkill\n");
+
+	return err;
+}
+
+static int asusrb_remove(struct acpi_device *device)
+{
+	asus_rbtn_input_destroy();
+
+	if (asus_rfkill) {
+		rfkill_unregister(asus_rfkill);
+		rfkill_destroy(asus_rfkill);
+	}
+
+	return 0;
+}
+
+static struct acpi_driver asusrb_driver = {
+	.name	= "asus acpi radio button",
+	.owner	= THIS_MODULE,
+	.ids	= asusrb_ids,
+	.ops	= {
+		.add	= asusrb_add,
+		.remove	= asusrb_remove,
+		.notify	= asusrb_notify,
+	},
+};
+
+static int asusrb_resume_handler(struct device *device)
+{
+	return asus_radio_led_set(radio_led_state);
+}
+
+static const struct dev_pm_ops asuspl_pm_ops = {
+	.resume  = asusrb_resume_handler,
+};
+
+static struct platform_driver asuspl_driver = {
+	.driver = {
+		.name = "asus-rbtn",
+		.pm = &asuspl_pm_ops,
+	},
+};
+
+static int __init asusrb_init(void)
+{
+	int err;
+
+	pr_info("Initializing ATK4001 module\n");
+	err = acpi_bus_register_driver(&asusrb_driver);
+	if (err)
+		goto err_driver_reg;
+
+	err = platform_driver_register(&asuspl_driver);
+	if (err)
+		goto err_driver_reg;
+
+	asuspl_dev = platform_device_alloc("asus-rbtn", -1);
+	if (!asuspl_dev) {
+		err = -ENOMEM;
+		goto err_device_alloc;
+	}
+	err = platform_device_add(asuspl_dev);
+	if (err)
+		goto err_device_add;
+
+	return 0;
+
+err_device_add:
+	platform_device_put(asuspl_dev);
+err_device_alloc:
+	platform_driver_unregister(&asuspl_driver);
+err_driver_reg:
+	return err;
+}
+
+static void __exit asusrb_exit(void)
+{
+	pr_info("Exiting ATK4001 module\n");
+	acpi_bus_unregister_driver(&asusrb_driver);
+
+	if (asuspl_dev) {
+		platform_device_unregister(asuspl_dev);
+		platform_driver_unregister(&asuspl_driver);
+	}
+}
+
+module_init(asusrb_init);
+module_exit(asusrb_exit);
-- 
1.9.1
