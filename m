From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH][v2] dell-wireless: new driver for dell wireless button for Windows 8
Date: Wed, 12 Nov 2014 14:51:44 +0800
Message-ID: <1415775104-25105-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:34560 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751521AbaKLGwG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 12 Nov 2014 01:52:06 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com

This is for Dell's new ACPI device for radio switches with ACPI
ID "DELLABCE". This device is Dell's solution for Microsoft
Windows 8's new requirement for wireless hotkeys.

When wireless hotkey is pressed, BIOS issues a Notify(RBTN, 0x80)
which is tanslated to a keycode KEY_RFKILL to userspace.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/Kconfig         |  12 +++
 drivers/platform/x86/Makefile        |   1 +
 drivers/platform/x86/dell-wireless.c | 159 +++++++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/platform/x86/dell-wireless.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4dcfb71..c500dc2 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -228,6 +228,18 @@ config HP_WIRELESS
 	 To compile this driver as a module, choose M here: the module will
 	 be called hp-wireless.
 
+config DELL_WIRELESS
+	tristate "DELL wireless button"
+	depends on ACPI
+	depends on INPUT
+	help
+	 This driver provides supports for new DELL wireless button for Windows
+         8. On such systems the driver should load automatically (via ACPI
+         alias).
+
+	 To compile this driver as a module, choose M here: the module will
+	 be called dell-wireless.
+
 config HP_WMI
 	tristate "HP WMI extras"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index f82232b..5e360a5 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_DELL_LAPTOP)	+= dell-laptop.o
 obj-$(CONFIG_DELL_WMI)		+= dell-wmi.o
 obj-$(CONFIG_DELL_WMI_AIO)	+= dell-wmi-aio.o
 obj-$(CONFIG_DELL_SMO8800)	+= dell-smo8800.o
+obj-$(CONFIG_DELL_WIRELESS)	+= dell-wireless.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
 obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
diff --git a/drivers/platform/x86/dell-wireless.c b/drivers/platform/x86/dell-wireless.c
new file mode 100644
index 0000000..17abf48
--- /dev/null
+++ b/drivers/platform/x86/dell-wireless.c
@@ -0,0 +1,159 @@
+/*
+ *  dell-wireless button for Windows 8
+ *
+ *  Copyright (C) 2014 Alex Hung
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
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
+#include <acpi/acpi_bus.h>
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alex Hung");
+MODULE_ALIAS("acpi*:DELLABCE:*");
+
+#define DELL_TOGGLE_SWITCH	0
+#define DELL_SLIDER_SWITCH	1
+
+static int switch_type;
+
+static struct input_dev *dellwl_input_dev;
+
+static const struct acpi_device_id dellwl_ids[] = {
+	{"DELLABCE", 0},
+	{"", 0},
+};
+
+static int dell_wireless_input_setup(void)
+{
+	int err;
+
+	dellwl_input_dev = input_allocate_device();
+	if (!dellwl_input_dev)
+		return -ENOMEM;
+
+	dellwl_input_dev->name = "DELL Wireless hotkeys";
+	dellwl_input_dev->phys = "dellabce/input0";
+	dellwl_input_dev->id.bustype = BUS_HOST;
+	dellwl_input_dev->evbit[0] = BIT(EV_KEY);
+	set_bit(KEY_RFKILL, dellwl_input_dev->keybit);
+
+	err = input_register_device(dellwl_input_dev);
+	if (err)
+		goto err_free_dev;
+
+	return 0;
+
+err_free_dev:
+	input_free_device(dellwl_input_dev);
+	return err;
+}
+
+static void dell_wireless_input_destroy(void)
+{
+	input_unregister_device(dellwl_input_dev);
+}
+
+static void dellwl_notify(struct acpi_device *acpi_dev, u32 event)
+{
+	if (event != 0x80) {
+		pr_info("Received unknown event (0x%x)\n", event);
+		return;
+	}
+
+	if (switch_type != DELL_TOGGLE_SWITCH)
+		return;
+
+	input_report_key(dellwl_input_dev, KEY_RFKILL, 1);
+	input_sync(dellwl_input_dev);
+	input_report_key(dellwl_input_dev, KEY_RFKILL, 0);
+	input_sync(dellwl_input_dev);
+}
+
+static int dellwl_add(struct acpi_device *device)
+{
+	acpi_status status;
+	unsigned long long output;
+	int err = 0;
+
+	status = acpi_evaluate_integer(device->handle, "CRBT", NULL, &output);
+	if (!ACPI_SUCCESS(status))
+		return -EINVAL;
+
+	switch (output) {
+	case 0:
+	case 1:
+		switch_type = DELL_TOGGLE_SWITCH;
+		err = dell_wireless_input_setup();
+		break;
+	case 2:
+	case 3:
+		/* hard block is handled by module drivers */
+		switch_type = DELL_SLIDER_SWITCH;
+		break;
+	default:
+		err = -EINVAL;
+	}
+
+	return err;
+}
+
+static int dellwl_remove(struct acpi_device *device)
+{
+	if (switch_type == DELL_TOGGLE_SWITCH)
+		dell_wireless_input_destroy();
+
+	return 0;
+}
+
+static struct acpi_driver dellwl_driver = {
+	.name	= "dell-wireless",
+	.owner	= THIS_MODULE,
+	.ids	= dellwl_ids,
+	.ops	= {
+		.add	= dellwl_add,
+		.remove	= dellwl_remove,
+		.notify	= dellwl_notify,
+	},
+};
+
+static int __init dellwl_init(void)
+{
+	int err;
+
+	pr_info("Initializing DELLABCE module\n");
+	err = acpi_bus_register_driver(&dellwl_driver);
+	if (err) {
+		pr_err("Unable to register DELL wireless control driver.\n");
+		goto error_acpi_register;
+	}
+
+	return 0;
+
+error_acpi_register:
+	return err;
+}
+
+static void __exit dellwl_exit(void)
+{
+	pr_info("Exiting DELLABCE module\n");
+	acpi_bus_unregister_driver(&dellwl_driver);
+}
+
+module_init(dellwl_init);
+module_exit(dellwl_exit);
-- 
1.9.1
