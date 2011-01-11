From: Daniel Drake <dsd@laptop.org>
Subject: [PATCH v2] OLPC XO-1.5 ebook switch driver
Date: Tue, 11 Jan 2011 20:25:55 +0000 (GMT)
Message-ID: <20110111202555.D58CE9D401C@zog.reactivated.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mtaout02-winn.ispmail.ntl.com ([81.103.221.48]:53618 "EHLO
	mtaout02-winn.ispmail.ntl.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753755Ab1AKU0M (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 11 Jan 2011 15:26:12 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: dmitry.torokhov@gmail.com, platform-driver-x86@vger.kernel.org, pgf@laptop.org

From: Paul Fox <pgf@laptop.org>

The OLPC XO-1.5 has an ebook switch, triggered when the laptop
screen is rotated then folding down, converting the device into ebook
form.

This switch is exposed through ACPI. Add a driver that exposes it
to userspace as an input device.

Signed-off-by: Daniel Drake <dsd@laptop.org>
---
 drivers/platform/x86/Kconfig      |    9 ++
 drivers/platform/x86/Makefile     |    1 +
 drivers/platform/x86/xo15-ebook.c |  181 +++++++++++++++++++++++++++++++++++++
 3 files changed, 191 insertions(+), 0 deletions(-)
 create mode 100644 drivers/platform/x86/xo15-ebook.c

v2: incorporates all feedback from Dmitry Torokhov

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index d163bc2..d31084b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -654,4 +654,13 @@ config XO1_RFKILL
 	  Support for enabling/disabling the WLAN interface on the OLPC XO-1
 	  laptop.
 
+config XO15_EBOOK
+	tristate "OLPC XO-1.5 ebook switch"
+	depends on ACPI && INPUT
+	---help---
+	  Support for the ebook switch on the OLPC XO-1.5 laptop.
+
+	  This switch is triggered as the screen is rotated and folded down to
+	  convert the device into ebook form.
+
 endif # X86_PLATFORM_DEVICES
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 4ec4ff8..130cf58 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -34,3 +34,4 @@ obj-$(CONFIG_INTEL_IPS)		+= intel_ips.o
 obj-$(CONFIG_GPIO_INTEL_PMIC)	+= intel_pmic_gpio.o
 obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
 obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
+obj-$(CONFIG_XO15_EBOOK)	+= xo15-ebook.o
diff --git a/drivers/platform/x86/xo15-ebook.c b/drivers/platform/x86/xo15-ebook.c
new file mode 100644
index 0000000..8d3c3b1
--- /dev/null
+++ b/drivers/platform/x86/xo15-ebook.c
@@ -0,0 +1,181 @@
+/*
+ *  OLPC XO-1.5 ebook switch driver
+ *  (based on generic ACPI button driver)
+ *
+ *  Copyright (C) 2009 Paul Fox <pgf@laptop.org>
+ *  Copyright (C) 2010 One Laptop per Child
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or (at
+ *  your option) any later version.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/input.h>
+#include <acpi/acpi_bus.h>
+#include <acpi/acpi_drivers.h>
+
+#define MODULE_NAME "xo15-ebook"
+#define PREFIX MODULE_NAME ": "
+
+#define XO15_EBOOK_CLASS		MODULE_NAME
+#define XO15_EBOOK_TYPE_UNKNOWN	0x00
+#define XO15_EBOOK_NOTIFY_STATUS	0x80
+
+#define XO15_EBOOK_SUBCLASS		"ebook"
+#define XO15_EBOOK_HID			"XO15EBK"
+#define XO15_EBOOK_DEVICE_NAME		"EBook Switch"
+
+ACPI_MODULE_NAME(MODULE_NAME);
+
+MODULE_DESCRIPTION("OLPC XO-1.5 ebook switch driver");
+MODULE_LICENSE("GPL");
+
+static const struct acpi_device_id ebook_device_ids[] = {
+	{ XO15_EBOOK_HID, 0 },
+	{ "", 0 },
+};
+MODULE_DEVICE_TABLE(acpi, ebook_device_ids);
+
+struct ebook_switch {
+	struct input_dev *input;
+	char phys[32];			/* for input device */
+};
+
+static int ebook_send_state(struct acpi_device *device)
+{
+	struct ebook_switch *button = acpi_driver_data(device);
+	unsigned long long state;
+	acpi_status status;
+
+	status = acpi_evaluate_integer(device->handle, "EBK", NULL, &state);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	/* input layer checks if event is redundant */
+	input_report_switch(button->input, SW_TABLET_MODE, !state);
+	input_sync(button->input);
+	return 0;
+}
+
+static void ebook_switch_notify(struct acpi_device *device, u32 event)
+{
+	switch (event) {
+	case ACPI_FIXED_HARDWARE_EVENT:
+	case XO15_EBOOK_NOTIFY_STATUS:
+		ebook_send_state(device);
+		break;
+	default:
+		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
+				  "Unsupported event [0x%x]\n", event));
+		break;
+	}
+}
+
+static int ebook_switch_resume(struct acpi_device *device)
+{
+	return ebook_send_state(device);
+}
+
+static int ebook_switch_add(struct acpi_device *device)
+{
+	struct ebook_switch *button;
+	struct input_dev *input;
+	const char *hid = acpi_device_hid(device);
+	char *name, *class;
+	int error;
+
+	button = kzalloc(sizeof(struct ebook_switch), GFP_KERNEL);
+	if (!button)
+		return -ENOMEM;
+
+	device->driver_data = button;
+
+	button->input = input = input_allocate_device();
+	if (!input) {
+		error = -ENOMEM;
+		goto err_free_button;
+	}
+
+	name = acpi_device_name(device);
+	class = acpi_device_class(device);
+
+	if (strcmp(hid, XO15_EBOOK_HID)) {
+		printk(KERN_ERR PREFIX "Unsupported hid [%s]\n", hid);
+		error = -ENODEV;
+		goto err_free_input;
+	}
+
+	strcpy(name, XO15_EBOOK_DEVICE_NAME);
+	sprintf(class, "%s/%s", XO15_EBOOK_CLASS, XO15_EBOOK_SUBCLASS);
+
+	snprintf(button->phys, sizeof(button->phys), "%s/button/input0", hid);
+
+	input->name = name;
+	input->phys = button->phys;
+	input->id.bustype = BUS_HOST;
+	input->dev.parent = &device->dev;
+
+	input->evbit[0] = BIT_MASK(EV_SW);
+	set_bit(SW_TABLET_MODE, input->swbit);
+
+	error = input_register_device(input);
+	if (error)
+		goto err_free_input;
+
+	ebook_send_state(device);
+
+	if (device->wakeup.flags.valid) {
+		/* Button's GPE is run-wake GPE */
+		acpi_enable_gpe(device->wakeup.gpe_device,
+				device->wakeup.gpe_number);
+		device->wakeup.run_wake_count++;
+		device->wakeup.state.enabled = 1;
+	}
+
+	return 0;
+
+ err_free_input:
+	input_free_device(input);
+ err_free_button:
+	kfree(button);
+	return error;
+}
+
+static int ebook_switch_remove(struct acpi_device *device, int type)
+{
+	struct ebook_switch *button = acpi_driver_data(device);
+
+	input_unregister_device(button->input);
+	kfree(button);
+	return 0;
+}
+
+static struct acpi_driver xo15_ebook_driver = {
+	.name = MODULE_NAME,
+	.class = XO15_EBOOK_CLASS,
+	.ids = ebook_device_ids,
+	.ops = {
+		.add = ebook_switch_add,
+		.resume = ebook_switch_resume,
+		.remove = ebook_switch_remove,
+		.notify = ebook_switch_notify,
+	},
+};
+
+static int __init xo15_ebook_init(void)
+{
+	return acpi_bus_register_driver(&xo15_ebook_driver);
+}
+
+static void __exit xo15_ebook_exit(void)
+{
+	acpi_bus_unregister_driver(&xo15_ebook_driver);
+}
+
+module_init(xo15_ebook_init);
+module_exit(xo15_ebook_exit);
-- 
1.7.3.4
