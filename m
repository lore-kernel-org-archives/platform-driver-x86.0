From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v5 11/14] platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver
Date: Fri,  6 Oct 2017 23:59:55 -0500
Message-ID: <d8dca620c4ac7652206d8f4249ab3bbf0785a44a.1507350554.git.mario.limonciello@dell.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507350554.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507350554.git.mario.limonciello@dell.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
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
 drivers/platform/x86/dell-smbios-wmi.c | 229 +++++++++++++++++++++++++++++++++
 4 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/dell-smbios-wmi.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8faf08ebcfee..e7514b616e13 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3980,6 +3980,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/dell-smbios-smm.c
 
+DELL SMBIOS WMI DRIVER
+M:	Mario Limonciello <mario.limonciello@dell.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/dell-smbios-wmi.c
+
 DELL LAPTOP DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
 M:	Pali Rohár <pali.rohar@gmail.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7cc91519bec8..7b0b87777379 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -93,7 +93,21 @@ config ASUS_LAPTOP
 
 config DELL_SMBIOS
 	tristate
-	depends on DELL_SMBIOS_SMM
+	depends on DELL_SMBIOS_WMI || DELL_SMBIOS_SMM
+
+config DELL_SMBIOS_WMI
+	tristate "Dell SMBIOS calling interface (WMI implementation)"
+	depends on ACPI_WMI
+	select DELL_WMI_DESCRIPTOR
+	default ACPI_WMI
+	select DELL_SMBIOS
+	---help---
+	This provides an implementation for the Dell SMBIOS calling interface
+	communicated over ACPI-WMI.
+
+	If you have a Dell computer from >2007 you should say Y or M here.
+	If you aren't sure and this module doesn't work for your computer
+	it just won't load.
 
 config DELL_SMBIOS_SMM
 	tristate "Dell SMBIOS calling interface (SMM implementation)"
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
index 000000000000..3de8abea38f8
--- /dev/null
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -0,0 +1,229 @@
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
+#include "dell-smbios.h"
+#include "dell-wmi-descriptor.h"
+static DEFINE_MUTEX(call_mutex);
+static DEFINE_MUTEX(list_mutex);
+static int wmi_supported;
+
+struct misc_bios_flags_structure {
+	struct dmi_header header;
+	u16 flags0;
+} __packed;
+#define FLAG_HAS_ACPI_WMI 0x02
+
+#define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
+
+struct wmi_extensions {
+	__u32 argattrib;
+	__u32 blength;
+	__u8 data[];
+} __packed;
+
+struct wmi_smbios_buffer {
+	struct calling_interface_buffer std;
+	struct wmi_extensions ext;
+} __packed;
+
+struct wmi_smbios_priv {
+	struct wmi_smbios_buffer *buf;
+	struct list_head list;
+	struct wmi_device *wdev;
+	struct device *child;
+	u32 buffer_size;
+};
+static LIST_HEAD(wmi_list);
+
+static inline struct wmi_smbios_priv *get_first_smbios_priv(void)
+{
+	return list_first_entry_or_null(&wmi_list,
+					struct wmi_smbios_priv,
+					list);
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
+	input.pointer = &priv->buf->std;
+
+	dev_dbg(&wdev->dev, "evaluating: %x/%x [%x,%x,%x,%x]\n",
+		priv->buf->std.class, priv->buf->std.select,
+		priv->buf->std.input[0], priv->buf->std.input[1],
+		priv->buf->std.input[2], priv->buf->std.input[3]);
+
+	status = wmidev_evaluate_method(wdev, 0, 1, &input, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	obj = (union acpi_object *)output.pointer;
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		dev_dbg(&wdev->dev, "received type: %d\n", obj->type);
+		if (obj->type == ACPI_TYPE_INTEGER)
+			dev_dbg(&wdev->dev, "SMBIOS call failed: %llu\n",
+				obj->integer.value);
+		return -EIO;
+	}
+	memcpy(&priv->buf->std, obj->buffer.pointer, obj->buffer.length);
+
+	return 0;
+}
+
+int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
+{
+	struct wmi_smbios_priv *priv;
+	size_t difference;
+	size_t size;
+	int ret;
+
+	priv = get_first_smbios_priv();
+	if (!priv)
+		return -ENODEV;
+
+	size = sizeof(struct calling_interface_buffer);
+	difference = priv->buffer_size - sizeof(u64) - size;
+
+	mutex_lock(&call_mutex);
+	memset(&priv->buf->ext, 0, difference);
+	memcpy(&priv->buf->std, buffer, size);
+	ret = run_smbios_call(priv->wdev);
+	memcpy(buffer, &priv->buf->std, size);
+	mutex_unlock(&call_mutex);
+
+	return ret;
+}
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
+	mutex_lock(&list_mutex);
+	list_add_tail(&priv->list, &wmi_list);
+	mutex_unlock(&list_mutex);
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
+	mutex_lock(&call_mutex);
+	mutex_lock(&list_mutex);
+	list_del(&priv->list);
+	mutex_unlock(&list_mutex);
+	dell_smbios_unregister_device(&wdev->dev);
+	count = get_order(priv->buffer_size);
+	free_pages((unsigned long)priv->buf, count);
+	mutex_unlock(&call_mutex);
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
+	/* 4 bytes header, 8 bytes flags */
+	if (dm->length < 12)
+		return;
+	if (dm->handle != 0xb100)
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
-- 
2.14.1
