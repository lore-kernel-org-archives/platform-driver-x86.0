From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v4 11/14] platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver
Date: Wed,  4 Oct 2017 17:48:37 -0500
Message-ID: <8b37d47244fbba75ea264d06d4e7966a1f8f8f7a.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The dell-smbios stack only currently uses an SMI interface which grants
direct access to physical memory to the firmware SMM methods via a pointer.

This dispatcher driver adds a WMI-ACPI interface that is detected by WMI
probe and preferred over the SMI interface in dell-smbios.

Changing this to operate over WMI-ACPI will use an ACPI OperationRegion
for a buffer of data storage when SMM calls are performed.

This is a safer approach to use in kernel drivers as the SMM will
only have access to that OperationRegion.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 MAINTAINERS                            |   6 +
 drivers/platform/x86/Kconfig           |  16 ++-
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/dell-smbios-wmi.c | 215 +++++++++++++++++++++++++++++++++
 drivers/platform/x86/dell-smbios-wmi.h |  28 +++++
 5 files changed, 265 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/dell-smbios-wmi.c
 create mode 100644 drivers/platform/x86/dell-smbios-wmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a8fcb4a4e195..0357e9b1cfaf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3980,6 +3980,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/dell-smbios-smm.*
 
+DELL SMBIOS WMI DRIVER
+M:	Mario Limonciello <mario.limonciello@dell.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/dell-smbios-wmi.*
+
 DELL LAPTOP DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
 M:	Pali Rohár <pali.rohar@gmail.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f0b97cb8e449..ef597f440d2e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -93,13 +93,27 @@ config ASUS_LAPTOP
 
 config DELL_SMBIOS
 	tristate "Dell SMBIOS calling interface"
-	depends on DELL_SMBIOS_SMM
+	depends on DELL_SMBIOS_WMI || DELL_SMBIOS_SMM
 	---help---
 	This module provides common functions for kernel modules using
 	Dell SMBIOS.
 
 	If you have a Dell laptop, say Y or M here.
 
+config DELL_SMBIOS_WMI
+	tristate "Dell SMBIOS calling interface (WMI implementation)"
+	depends on ACPI_WMI
+	depends on DELL_WMI_DESCRIPTOR
+	default ACPI_WMI
+	select DELL_SMBIOS
+	---help---
+	This provides an implementation for the Dell SMBIOS calling interface
+	communicated over ACPI-WMI.
+
+	If you have a Dell computer from >2007 you should say Y or M here.
+	If you aren't sure and this module doesn't work for your computer
+	it just won't load.
+
 config DELL_SMBIOS_SMM
 	tristate "Dell SMBIOS calling interface (SMM implementation)"
 	depends on DCDBAS
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e743615241f8..1c4234861de0 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
 obj-$(CONFIG_ACPI_CMPC)		+= classmate-laptop.o
 obj-$(CONFIG_COMPAL_LAPTOP)	+= compal-laptop.o
 obj-$(CONFIG_DELL_SMBIOS)	+= dell-smbios.o
+obj-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
 obj-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
 obj-$(CONFIG_DELL_LAPTOP)	+= dell-laptop.o
 obj-$(CONFIG_DELL_WMI)		+= dell-wmi.o
diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
new file mode 100644
index 000000000000..32e4e7dbf575
--- /dev/null
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -0,0 +1,215 @@
+/*
+ *  WMI methods for use with dell-smbios
+ *
+ *  Copyright (c) 2017 Dell Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/dmi.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/uaccess.h>
+#include <linux/wmi.h>
+#include "dell-smbios-wmi.h"
+#include "dell-wmi-descriptor.h"
+static DEFINE_MUTEX(wmi_mutex);
+static int wmi_supported;
+
+struct misc_bios_flags_structure {
+	struct dmi_header header;
+	u32 flags0;
+} __packed;
+#define FLAG_HAS_ACPI_WMI 0x02
+
+#define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
+
+struct wmi_smbios_priv {
+	struct wmi_calling_interface_buffer *buf;
+	struct list_head list;
+	struct wmi_device *wdev;
+	struct device *child;
+	u32 buffer_size;
+};
+static LIST_HEAD(wmi_list);
+
+static struct wmi_device *get_first_wmi_device(void)
+{
+	struct wmi_smbios_priv *priv;
+
+	priv = list_first_entry_or_null(&wmi_list,
+					struct wmi_smbios_priv,
+					list);
+	return priv ? priv->wdev : NULL;
+}
+
+static int run_smbios_call(struct wmi_device *wdev)
+{
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	struct wmi_smbios_priv *priv;
+	struct acpi_buffer input;
+	union acpi_object *obj;
+	acpi_status status;
+
+	priv = dev_get_drvdata(&wdev->dev);
+	input.length = priv->buffer_size;
+	input.pointer = priv->buf;
+
+	status = wmidev_evaluate_method(wdev, 0, 1, &input, &output);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%x/%x [%x,%x,%x,%x] call failed\n",
+			priv->buf->class, priv->buf->select,
+			priv->buf->input[0], priv->buf->input[1],
+			priv->buf->input[2], priv->buf->input[3]);
+			return -EIO;
+	}
+	obj = (union acpi_object *)output.pointer;
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		if (obj->type == ACPI_TYPE_INTEGER)
+			pr_err("SMBIOS call failed: %llu\n",
+				obj->integer.value);
+		else
+			pr_err("invalid type: %d\n", obj->type);
+		return -EIO;
+	}
+	memcpy(priv->buf, obj->buffer.pointer, input.length);
+
+	return 0;
+}
+
+void dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
+{
+	struct wmi_smbios_priv *priv;
+	struct wmi_device *wdev;
+	size_t difference;
+	size_t size;
+	u8 *start;
+
+	wdev = get_first_wmi_device();
+	if (!wdev) {
+		pr_info("No WMI devices bound");
+		return;
+	}
+	priv = dev_get_drvdata(&wdev->dev);
+	size = sizeof(struct calling_interface_buffer);
+	difference = priv->buffer_size - size;
+	start = (u8 *) priv->buf + size;
+	mutex_lock(&wmi_mutex);
+	memset(start, 0, difference);
+	memcpy(priv->buf, buffer, size);
+	run_smbios_call(wdev);
+	memcpy(buffer, priv->buf, size);
+	mutex_unlock(&wmi_mutex);
+}
+EXPORT_SYMBOL_GPL(dell_smbios_wmi_call);
+
+static int dell_smbios_wmi_probe(struct wmi_device *wdev)
+{
+	struct wmi_smbios_priv *priv;
+	int count;
+	int ret;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(struct wmi_smbios_priv),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* WMI buffer size will be either 4k or 32k depending on machine */
+	if (!dell_wmi_get_size(&priv->buffer_size))
+		return -EINVAL;
+
+	count = get_order(priv->buffer_size);
+	priv->buf = (void *)__get_free_pages(GFP_KERNEL, count);
+	if (!priv->buf)
+		return -ENOMEM;
+
+	/* ID is used by dell-smbios to set priority of drivers */
+	wdev->dev.id = 1;
+	ret = dell_smbios_register_device(&wdev->dev, &dell_smbios_wmi_call);
+	if (ret)
+		goto fail_register;
+
+	priv->wdev = wdev;
+	dev_set_drvdata(&wdev->dev, priv);
+	list_add_tail(&priv->list, &wmi_list);
+
+	return 0;
+
+fail_register:
+	free_pages((unsigned long)priv->buf, count);
+	return ret;
+}
+
+static int dell_smbios_wmi_remove(struct wmi_device *wdev)
+{
+	struct wmi_smbios_priv *priv = dev_get_drvdata(&wdev->dev);
+	int count;
+
+	list_del(&priv->list);
+	dell_smbios_unregister_device(&wdev->dev);
+	count = get_order(priv->buffer_size);
+	free_pages((unsigned long)priv->buf, count);
+	return 0;
+}
+
+static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
+	{ .guid_string = DELL_WMI_SMBIOS_GUID },
+	{ },
+};
+
+static void __init parse_b1_table(const struct dmi_header *dm)
+{
+	struct misc_bios_flags_structure *flags =
+	container_of(dm, struct misc_bios_flags_structure, header);
+
+	/* 4 bytes header, and one word of flags */
+	if (dm->length < 12)
+		return;
+	if ((flags->flags0 & FLAG_HAS_ACPI_WMI))
+		wmi_supported = 1;
+}
+
+static void __init find_b1(const struct dmi_header *dm, void *dummy)
+{
+	switch (dm->type) {
+	case 0xb1: /* misc bios flags */
+		parse_b1_table(dm);
+		break;
+	}
+}
+
+static struct wmi_driver dell_smbios_wmi_driver = {
+	.driver = {
+		.name = "dell-smbios",
+	},
+	.probe = dell_smbios_wmi_probe,
+	.remove = dell_smbios_wmi_remove,
+	.id_table = dell_smbios_wmi_id_table,
+};
+
+static int __init init_dell_smbios_wmi(void)
+{
+	dmi_walk(find_b1, NULL);
+
+	if (!wmi_supported)
+		return -ENODEV;
+
+	return wmi_driver_register(&dell_smbios_wmi_driver);
+}
+
+static void __exit exit_dell_smbios_wmi(void)
+{
+	wmi_driver_unregister(&dell_smbios_wmi_driver);
+}
+
+module_init(init_dell_smbios_wmi);
+module_exit(exit_dell_smbios_wmi);
+
+MODULE_ALIAS("wmi:" DELL_WMI_SMBIOS_GUID);
+MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
+MODULE_DESCRIPTION("Dell SMBIOS communications over WMI");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/dell-smbios-wmi.h b/drivers/platform/x86/dell-smbios-wmi.h
new file mode 100644
index 000000000000..5dd91d8ff3d8
--- /dev/null
+++ b/drivers/platform/x86/dell-smbios-wmi.h
@@ -0,0 +1,28 @@
+/*
+ *  WMI methods for use with dell-smbios
+ *
+ *  Copyright (c) 2017 Dell Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+
+#ifndef _DELL_SMBIOS_WMI_H_
+#define _DELL_SMBIOS_WMI_H_
+
+#include "dell-smbios.h"
+
+struct wmi_calling_interface_buffer {
+	u16 class;
+	u16 select;
+	u32 input[4];
+	u32 output[4];
+	u32 argattrib;
+	u32 blength;
+	u8 *data;
+} __packed;
+
+void dell_smbios_wmi_call(struct calling_interface_buffer *buffer);
+
+#endif
-- 
2.14.1
