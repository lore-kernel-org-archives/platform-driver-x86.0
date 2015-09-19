From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2] platform/x86: Toshiba WMI Hotkey Driver
Date: Fri, 18 Sep 2015 22:45:35 -0600
Message-ID: <1442637935-5136-2-git-send-email-coproscefalo@gmail.com>
References: <1442637935-5136-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442637935-5136-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Toshiba laptops that feature WMI events for hotkeys were left unsupported
by the toshiba_acpi driver, however, commit a88bc06e5aec ("toshiba_acpi:
Avoid registering input device on WMI event laptops") added hardware
support for such laptops, but the hotkeys are not handled there.

This driver adds support for hotkey monitoring on certain Toshiba laptops
that manage the hotkeys via WMI events instead of the Toshiba
Configuration Interface (TCI).

The toshiba_acpi driver and this one can co-exist, as this only takes
care of hotkeys, while the propper takes care of hardware related stuff.

Currently the driver is under the EXPERIMENTAL flag, as the keymap
and the notify function are incomplete (due to lack of hardware to test).

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
Changes since v1:
- Changed the printed log level of the ACPI event type value from info
  to debug
- Make the input_dev struct declaration static

 MAINTAINERS                        |   6 ++
 drivers/platform/x86/Kconfig       |  18 +++++
 drivers/platform/x86/Makefile      |   1 +
 drivers/platform/x86/toshiba-wmi.c | 138 +++++++++++++++++++++++++++++++++++++
 4 files changed, 163 insertions(+)
 create mode 100644 drivers/platform/x86/toshiba-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 884d398..07f4446 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10318,6 +10318,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/toshiba_haps.c
 
+TOSHIBA WMI HOTKEYS DRIVER
+M:	Azael Avalos <coproscefalo@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/toshiba-wmi.c
+
 TOSHIBA SMM DRIVER
 M:	Jonathan Buzzard <jonathan@buzzard.org.uk>
 W:	http://www.buzzard.org.uk/toshiba/
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index c69bb70..9ae1e89 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -700,6 +700,24 @@ config TOSHIBA_HAPS
 	  If you have a recent Toshiba laptop with a built-in accelerometer
 	  device, say Y.
 
+config TOSHIBA_WMI
+	tristate "Toshiba WMI Hotkeys Driver (EXPERIMENTAL)"
+	default n
+	depends on ACPI_WMI
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	---help---
+	  This driver adds hotkey monitoring support to some Toshiba models
+	  that manage the hotkeys via WMI events.
+
+	  WARNING: This driver is incomplete as it lacks a propper keymap and the
+	  *notify function only prints the ACPI event type value. Be warned that
+	  you will need to provide some information if you have a Toshiba model
+	  with WMI event hotkeys and want to help with the develpment of this
+	  driver.
+
+	  If you have a WMI-based hotkeys Toshiba laptop, say Y or M here.
+
 config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
 	depends on X86 && ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index ada5128..8f077cb 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_ACPI_TOSHIBA)	+= toshiba_acpi.o
 
 obj-$(CONFIG_TOSHIBA_BT_RFKILL)	+= toshiba_bluetooth.o
 obj-$(CONFIG_TOSHIBA_HAPS)	+= toshiba_haps.o
+obj-$(CONFIG_TOSHIBA_HAPS)	+= toshiba-wmi.o
 obj-$(CONFIG_INTEL_SCU_IPC)	+= intel_scu_ipc.o
 obj-$(CONFIG_INTEL_SCU_IPC_UTIL) += intel_scu_ipcutil.o
 obj-$(CONFIG_INTEL_MFLD_THERMAL) += intel_mid_thermal.o
diff --git a/drivers/platform/x86/toshiba-wmi.c b/drivers/platform/x86/toshiba-wmi.c
new file mode 100644
index 0000000..e165290
--- /dev/null
+++ b/drivers/platform/x86/toshiba-wmi.c
@@ -0,0 +1,138 @@
+/*
+ * toshiba_wmi.c - Toshiba WMI Hotkey Driver
+ *
+ * Copyright (C) 2015 Azael Avalos <coproscefalo@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/acpi.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+
+MODULE_AUTHOR("Azael Avalos");
+MODULE_DESCRIPTION("Toshiba WMI Hotkey Driver");
+MODULE_LICENSE("GPL");
+
+#define TOSHIBA_WMI_EVENT_GUID	"59142400-C6A3-40FA-BADB-8A2652834100"
+
+MODULE_ALIAS("wmi:"TOSHIBA_WMI_EVENT_GUID);
+
+static struct input_dev *toshiba_wmi_input_dev;
+
+static const struct key_entry toshiba_wmi_keymap[] __initconst = {
+	/* TODO: Add keymap values once found... */
+	/*{ KE_KEY, 0x00, { KEY_ } },*/
+	{ KE_END, 0 }
+};
+
+static void toshiba_wmi_notify(u32 value, void *context)
+{
+	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+
+	status = wmi_get_event_data(value, &response);
+	if (ACPI_FAILURE(status)) {
+		pr_err("Bad event status 0x%x\n", status);
+		return;
+	}
+
+	obj = (union acpi_object *)response.pointer;
+	if (!obj)
+		return;
+
+	/* TODO: Add propper checks once we have data */
+	pr_debug("Unknown event received, obj type %x\n", obj->type);
+
+	kfree(response.pointer);
+}
+
+static int __init toshiba_wmi_input_setup(void)
+{
+	acpi_status status;
+	int err;
+
+	toshiba_wmi_input_dev = input_allocate_device();
+	if (!toshiba_wmi_input_dev)
+		return -ENOMEM;
+
+	toshiba_wmi_input_dev->name = "Toshiba WMI hotkeys";
+	toshiba_wmi_input_dev->phys = "wmi/input0";
+	toshiba_wmi_input_dev->id.bustype = BUS_HOST;
+
+	err = sparse_keymap_setup(toshiba_wmi_input_dev,
+				  toshiba_wmi_keymap, NULL);
+	if (err)
+		goto err_free_dev;
+
+	status = wmi_install_notify_handler(TOSHIBA_WMI_EVENT_GUID,
+					    toshiba_wmi_notify, NULL);
+	if (ACPI_FAILURE(status)) {
+		err = -EIO;
+		goto err_free_keymap;
+	}
+
+	err = input_register_device(toshiba_wmi_input_dev);
+	if (err)
+		goto err_remove_notifier;
+
+	return 0;
+
+ err_remove_notifier:
+	wmi_remove_notify_handler(TOSHIBA_WMI_EVENT_GUID);
+ err_free_keymap:
+	sparse_keymap_free(toshiba_wmi_input_dev);
+ err_free_dev:
+	input_free_device(toshiba_wmi_input_dev);
+	return err;
+}
+
+static void toshiba_wmi_input_destroy(void)
+{
+	wmi_remove_notify_handler(TOSHIBA_WMI_EVENT_GUID);
+	sparse_keymap_free(toshiba_wmi_input_dev);
+	input_unregister_device(toshiba_wmi_input_dev);
+}
+
+static int __init toshiba_wmi_init(void)
+{
+	int ret;
+
+	if (!wmi_has_guid(TOSHIBA_WMI_EVENT_GUID))
+		return -ENODEV;
+
+	ret = toshiba_wmi_input_setup();
+	if (ret) {
+		pr_err("Failed to setup input device\n");
+		return ret;
+	}
+
+	pr_info("Toshiba WMI Hotkey Driver\n");
+
+	return 0;
+}
+
+static void __exit toshiba_wmi_exit(void)
+{
+	if (wmi_has_guid(TOSHIBA_WMI_EVENT_GUID))
+		toshiba_wmi_input_destroy();
+}
+
+module_init(toshiba_wmi_init);
+module_exit(toshiba_wmi_exit);
-- 
2.5.1
