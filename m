From: Mousou Yuu <guogaishiwo@gmail.com>
Subject: [PATCH 1/1] asus-wireless: New driver for asus wireless button
Date: Sat, 19 Dec 2015 09:34:29 +0800
Message-ID: <20151219093429.7ae867dccd81cad37ff51d8f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:37757 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752541AbbLSBec (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Dec 2015 20:34:32 -0500
Received: by mail-wm0-f54.google.com with SMTP id p187so5892312wmp.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Dec 2015 17:34:31 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net

Some asus laptop models (zenbook UX303/U303) have their wireless control
button as a ACPI device, but make all other hotkeys in WMI, so ASUS_NB_WMI
failed to handle it. Maybe it's better to modify ASUS_LAPTOP, but it's
too complex (for me) and device id is different, so a new driver is made.

Signed-off-by: Mousou Yuu <guogaishiwo@gmail.com>
---
 drivers/platform/x86/Kconfig         | 10 ++++
 drivers/platform/x86/Makefile        |  1 +
 drivers/platform/x86/asus-wireless.c | 95 ++++++++++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 drivers/platform/x86/asus-wireless.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1089eaa..2763632 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -542,6 +542,16 @@ config EEEPC_LAPTOP
 	  If you have an Eee PC laptop, say Y or M here. If this driver
 	  doesn't work on your Eee PC, try eeepc-wmi instead.
 
+config ASUS_WIRELESS
+	tristate "ASUS Wireless Radio Control"
+	depends on ACPI
+	depends on INPUT
+	help
+	  This driver is for Asus zenbook UX303/U303 whose wireless
+	  control button can't be driven by ASUS_WMI.
+
+	  If you have one of them, say Y or M here.
+
 config ASUS_WMI
 	tristate "ASUS WMI Driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 3ca78a3..e358e80 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -4,6 +4,7 @@
 #
 obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
 obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
+obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
 obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
 obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
 obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
new file mode 100644
index 0000000..e9299f9
--- /dev/null
+++ b/drivers/platform/x86/asus-wireless.c
@@ -0,0 +1,95 @@
+/*
+ * ASUS wireless (rfkill) hotkey driver for UX303/U303. Original
+ * Windows version is called "ASUS Wireless Radio Control"
+ *
+ * Copyright (C) 2015 Mousou Yuu <guogaishiwo@gmail.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/acpi.h>
+#include <linux/input.h>
+#include <linux/pci_ids.h>
+
+MODULE_AUTHOR("Mousou Yuu <guogaishiwo@gmail.com>");
+MODULE_LICENSE("GPL");
+
+static const struct acpi_device_id device_ids[] = {
+	{"ATK4001", 0},
+	{"ATK4002", 0},
+	{"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, device_ids);
+
+static struct input_dev *switch_dev;
+
+static int aswl_add(struct acpi_device *device)
+{
+	int err;
+
+	switch_dev = input_allocate_device();
+	if (!switch_dev)
+		return  -ENOMEM;
+
+	switch_dev->name = "ASUS Wireless Radio Control";
+	switch_dev->phys = "atk4002/input0";
+	switch_dev->id.bustype = BUS_HOST;
+	switch_dev->id.vendor = PCI_VENDOR_ID_ASUSTEK;
+	set_bit(EV_KEY, switch_dev->evbit);
+	set_bit(KEY_RFKILL, switch_dev->keybit);
+
+	err = input_register_device(switch_dev);
+	if (err) {
+		input_free_device(switch_dev);
+		return err;
+	}
+
+	return 0;
+}
+
+static void aswl_notify(struct acpi_device *device, u32 event)
+{
+	if (event != 0x88) {
+		pr_warn("Unknown event: 0x%x", event);
+		return;
+	}
+	input_report_key(switch_dev, KEY_RFKILL, 1);  /* key pressed */
+	input_report_key(switch_dev, KEY_RFKILL, 0);  /* key released */
+	input_sync(switch_dev);
+}
+
+static int aswl_remove(struct acpi_device *device)
+{
+	input_unregister_device(switch_dev);
+	return 0;
+}
+
+static struct acpi_driver aswl_driver = {
+	.name = "asus-wireless",
+	.class = "hotkey",
+	.ids = device_ids,
+	.ops = {
+		.add = aswl_add,
+		.remove = aswl_remove,
+		.notify = aswl_notify
+	},
+	.owner = THIS_MODULE,
+};
+
+static int __init aswl_init(void)
+{
+	return acpi_bus_register_driver(&aswl_driver);
+}
+
+static void __exit aswl_exit(void)
+{
+	acpi_bus_unregister_driver(&aswl_driver);
+}
+
+module_init(aswl_init);
+module_exit(aswl_exit);
-- 
2.6.4
