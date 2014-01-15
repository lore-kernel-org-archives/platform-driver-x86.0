From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] hp-wireless: new driver for hp wireless button for Windows 8
Date: Wed, 15 Jan 2014 14:29:41 +0800
Message-ID: <1389767381-10211-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:36043 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750764AbaAOG3t (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Jan 2014 01:29:49 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/Kconfig       |  11 +++
 drivers/platform/x86/Makefile      |   1 +
 drivers/platform/x86/hp-wireless.c | 145 +++++++++++++++++++++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 drivers/platform/x86/hp-wireless.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 36a9e60..6bd5b03 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -208,6 +208,17 @@ config HP_ACCEL
 	  To compile this driver as a module, choose M here: the module will
 	  be called hp_accel.
 
+config HP_WIRELESS
+	tristate "HP WIRELESS"
+	depends on ACPI
+	depends on INPUT
+	help
+	 This driver provides supports for new HP wireless button for Windows 8.
+	 On such systems the driver should load automatically (via ACPI alias).
+
+	 To compile this driver as a module, choose M here: the module will
+	 be called hp-wireless.
+
 config HP_WMI
 	tristate "HP WMI extras"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 5dbe193..2f6c4d2 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_DELL_WMI_AIO)	+= dell-wmi-aio.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
 obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
+obj-$(CONFIG_HP_WIRELESS)	+= hp-wireless.o
 obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
 obj-$(CONFIG_AMILO_RFKILL)	+= amilo-rfkill.o
 obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
new file mode 100644
index 0000000..6fbc4f2
--- /dev/null
+++ b/drivers/platform/x86/hp-wireless.c
@@ -0,0 +1,145 @@
+/*
+ *  hp-wireless button for Windows 8
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
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/platform_device.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/acpi.h>
+#include <acpi/acpi_bus.h>
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alex Hung");
+MODULE_ALIAS("acpi*:HPQ6001:*");
+
+static struct input_dev *hpwl_input_dev;
+
+static const struct key_entry hp_wireless_keymap[] = {
+	{ KE_KEY, 0x80, { KEY_RFKILL } },
+};
+
+static const struct acpi_device_id hpwl_ids[] = {
+	{"HPQ6001", 0},
+	{"", 0},
+};
+
+static int hp_wireless_input_setup(void)
+{
+	int err;
+
+	hpwl_input_dev = input_allocate_device();
+	if (!hpwl_input_dev)
+		return -ENOMEM;
+
+	hpwl_input_dev->name = "HP Wireless hotkeys";
+	hpwl_input_dev->phys = "hpq6001/input0";
+	hpwl_input_dev->id.bustype = BUS_HOST;
+
+	err = sparse_keymap_setup(hpwl_input_dev, hp_wireless_keymap, NULL);
+	if (err)
+		goto err_free_dev;
+
+	err = input_register_device(hpwl_input_dev);
+	if (err)
+		goto err_free_keymap;
+
+	return 0;
+
+err_free_keymap:
+	sparse_keymap_free(hpwl_input_dev);
+err_free_dev:
+	input_free_device(hpwl_input_dev);
+	return err;
+}
+
+static void hp_wireless_input_destroy(void)
+{
+	sparse_keymap_free(hpwl_input_dev);
+	input_unregister_device(hpwl_input_dev);
+}
+
+static void hpwl_notify(struct acpi_device *acpi_dev, u32 event)
+{
+	const struct key_entry *key;
+
+	if (event != 0x80) {
+		pr_info("Received unknown event (0x%x)\n", event);
+		return;
+	}
+
+	key = sparse_keymap_entry_from_scancode(hpwl_input_dev, event);
+	if (key)
+		sparse_keymap_report_entry(hpwl_input_dev, key, 1, true);
+	else
+		pr_info("Unknown hotkey pressed\n");
+}
+
+static int hpwl_add(struct acpi_device *device)
+{
+	int err;
+
+	err = hp_wireless_input_setup();
+	return err;
+}
+
+static int hpwl_remove(struct acpi_device *device)
+{
+	hp_wireless_input_destroy();
+	return 0;
+}
+
+static struct acpi_driver hpwl_driver = {
+	.name	= "hp-wireless",
+	.owner	= THIS_MODULE,
+	.ids	= hpwl_ids,
+	.ops	= {
+		.add	= hpwl_add,
+		.remove	= hpwl_remove,
+		.notify	= hpwl_notify,
+	},
+};
+
+static int __init hpwl_init(void)
+{
+	int err;
+
+	pr_info("Initializing HPQ6001 module\n");
+	err = acpi_bus_register_driver(&hpwl_driver);
+	if (err) {
+		pr_err("Unable to register HP wireless control driver.\n");
+		goto error_acpi_register;
+	}
+
+	return 0;
+
+error_acpi_register:
+	return err;
+}
+
+static void __exit hpwl_exit(void)
+{
+	pr_info("Exiting HPQ6001 module\n");
+	acpi_bus_unregister_driver(&hpwl_driver);
+}
+
+module_init(hpwl_init);
+module_exit(hpwl_exit);
-- 
1.8.1.2
