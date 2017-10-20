From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v11 05/15] platform/x86: dell-wmi-descriptor: split WMI descriptor into it's own driver
Date: Fri, 20 Oct 2017 12:40:20 -0500
Message-ID: <a740a284f62e9fbbefe0f2567e20ccf997d43e25.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa3.dell-outbound.iphmx.com ([68.232.153.94]:42796 "EHLO
        esa3.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753418AbdJTRkg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Oct 2017 13:40:36 -0400
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1508515469.git.mario.limonciello@dell.com>
References: <cover.1508515469.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>

All communication on individual GUIDs should occur in separate drivers.
Allowing a driver to communicate with the bus to another GUID is just
a hack that discourages drivers to adopt the bus model.

The information found from the WMI descriptor driver is now exported
for use by other drivers.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Edward O'Callaghan <quasisec@google.com>
---
 MAINTAINERS                                |   5 +
 drivers/platform/x86/Kconfig               |   5 +
 drivers/platform/x86/Makefile              |   1 +
 drivers/platform/x86/dell-wmi-descriptor.c | 170 +++++++++++++++++++++++++++++
 drivers/platform/x86/dell-wmi-descriptor.h |  21 ++++
 drivers/platform/x86/dell-wmi.c            |  80 +-------------
 6 files changed, 208 insertions(+), 74 deletions(-)
 create mode 100644 drivers/platform/x86/dell-wmi-descriptor.c
 create mode 100644 drivers/platform/x86/dell-wmi-descriptor.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2347e36588dc..f4cf35950b08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4013,6 +4013,11 @@ M:	Pali Rohár <pali.rohar@gmail.com>
 S:	Maintained
 F:	drivers/platform/x86/dell-wmi.c
 
+DELL WMI DESCRIPTOR DRIVER
+M:	Mario Limonciello <mario.limonciello@dell.com>
+S:	Maintained
+F:	drivers/platform/x86/dell-wmi-descriptor.c
+
 DELTA ST MEDIA DRIVER
 M:	Hugues Fruchet <hugues.fruchet@st.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 1f7959ff055c..7722923c968c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -121,6 +121,7 @@ config DELL_WMI
 	depends on DMI
 	depends on INPUT
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	select DELL_WMI_DESCRIPTOR
 	select DELL_SMBIOS
 	select INPUT_SPARSEKMAP
 	---help---
@@ -129,6 +130,10 @@ config DELL_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called dell-wmi.
 
+config DELL_WMI_DESCRIPTOR
+	tristate
+	depends on ACPI_WMI
+
 config DELL_WMI_AIO
 	tristate "WMI Hotkeys for Dell All-In-One series"
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 2b315d0df3b7..8636f5d3424f 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_COMPAL_LAPTOP)	+= compal-laptop.o
 obj-$(CONFIG_DELL_SMBIOS)	+= dell-smbios.o
 obj-$(CONFIG_DELL_LAPTOP)	+= dell-laptop.o
 obj-$(CONFIG_DELL_WMI)		+= dell-wmi.o
+obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
 obj-$(CONFIG_DELL_WMI_AIO)	+= dell-wmi-aio.o
 obj-$(CONFIG_DELL_WMI_LED)	+= dell-wmi-led.o
 obj-$(CONFIG_DELL_SMO8800)	+= dell-smo8800.o
diff --git a/drivers/platform/x86/dell-wmi-descriptor.c b/drivers/platform/x86/dell-wmi-descriptor.c
new file mode 100644
index 000000000000..3204c408e261
--- /dev/null
+++ b/drivers/platform/x86/dell-wmi-descriptor.c
@@ -0,0 +1,170 @@
+/*
+ * Dell WMI descriptor driver
+ *
+ * Copyright (C) 2017 Dell Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify it
+ *  under the terms of the GNU General Public License version 2 as published
+ *  by the Free Software Foundation.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+#include "dell-wmi-descriptor.h"
+
+struct descriptor_priv {
+	struct list_head list;
+	u32 interface_version;
+	u32 size;
+};
+static LIST_HEAD(wmi_list);
+static DEFINE_MUTEX(list_mutex);
+
+bool dell_wmi_get_interface_version(u32 *version)
+{
+	struct descriptor_priv *priv;
+	bool ret = false;
+
+	mutex_lock(&list_mutex);
+	priv = list_first_entry_or_null(&wmi_list,
+					struct descriptor_priv,
+					list);
+	if (priv) {
+		*version = priv->interface_version;
+		ret = true;
+	}
+	mutex_unlock(&list_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dell_wmi_get_interface_version);
+
+bool dell_wmi_get_size(u32 *size)
+{
+	struct descriptor_priv *priv;
+	bool ret = false;
+
+	mutex_lock(&list_mutex);
+	priv = list_first_entry_or_null(&wmi_list,
+					struct descriptor_priv,
+					list);
+	if (priv) {
+		*size = priv->size;
+		ret = true;
+	}
+	mutex_unlock(&list_mutex);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dell_wmi_get_size);
+
+/*
+ * Descriptor buffer is 128 byte long and contains:
+ *
+ *       Name             Offset  Length  Value
+ * Vendor Signature          0       4    "DELL"
+ * Object Signature          4       4    " WMI"
+ * WMI Interface Version     8       4    <version>
+ * WMI buffer length        12       4    <length>
+ */
+static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
+{
+	union acpi_object *obj = NULL;
+	struct descriptor_priv *priv;
+	u32 *buffer;
+	int ret;
+
+	obj = wmidev_block_query(wdev, 0);
+	if (!obj) {
+		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
+		ret = -EIO;
+		goto out;
+	}
+
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Although it's not technically a failure, this would lead to
+	 * unexpected behavior
+	 */
+	if (obj->buffer.length != 128) {
+		dev_err(&wdev->dev,
+			"Dell descriptor buffer has unexpected length (%d)\n",
+			obj->buffer.length);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	buffer = (u32 *)obj->buffer.pointer;
+
+	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
+		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
+			buffer);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (buffer[2] != 0 && buffer[2] != 1)
+		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)\n",
+			(unsigned long) buffer[2]);
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(struct descriptor_priv),
+	GFP_KERNEL);
+
+	priv->interface_version = buffer[2];
+	priv->size = buffer[3];
+	ret = 0;
+	dev_set_drvdata(&wdev->dev, priv);
+	mutex_lock(&list_mutex);
+	list_add_tail(&priv->list, &wmi_list);
+	mutex_unlock(&list_mutex);
+
+	dev_dbg(&wdev->dev, "Detected Dell WMI interface version %lu and buffer size %lu\n",
+		(unsigned long) priv->interface_version,
+		(unsigned long) priv->size);
+
+out:
+	kfree(obj);
+	return ret;
+}
+
+static int dell_wmi_descriptor_remove(struct wmi_device *wdev)
+{
+	struct descriptor_priv *priv = dev_get_drvdata(&wdev->dev);
+
+	mutex_lock(&list_mutex);
+	list_del(&priv->list);
+	mutex_unlock(&list_mutex);
+	return 0;
+}
+
+static const struct wmi_device_id dell_wmi_descriptor_id_table[] = {
+	{ .guid_string = DELL_WMI_DESCRIPTOR_GUID },
+	{ },
+};
+
+static struct wmi_driver dell_wmi_descriptor_driver = {
+	.driver = {
+		.name = "dell-wmi-descriptor",
+	},
+	.probe = dell_wmi_descriptor_probe,
+	.remove = dell_wmi_descriptor_remove,
+	.id_table = dell_wmi_descriptor_id_table,
+};
+
+module_wmi_driver(dell_wmi_descriptor_driver);
+
+MODULE_ALIAS("wmi:" DELL_WMI_DESCRIPTOR_GUID);
+MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
+MODULE_DESCRIPTION("Dell WMI descriptor driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/dell-wmi-descriptor.h b/drivers/platform/x86/dell-wmi-descriptor.h
new file mode 100644
index 000000000000..5f7b69c2c83a
--- /dev/null
+++ b/drivers/platform/x86/dell-wmi-descriptor.h
@@ -0,0 +1,21 @@
+/*
+ *  Dell WMI descriptor driver
+ *
+ *  Copyright (c) 2017 Dell Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+
+#ifndef _DELL_WMI_DESCRIPTOR_H_
+#define _DELL_WMI_DESCRIPTOR_H_
+
+#include <linux/wmi.h>
+
+#define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
+
+bool dell_wmi_get_interface_version(u32 *version);
+bool dell_wmi_get_size(u32 *size);
+
+#endif
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index da4f629d0831..6d657eb97672 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -39,6 +39,7 @@
 #include <linux/wmi.h>
 #include <acpi/video.h>
 #include "dell-smbios.h"
+#include "dell-wmi-descriptor.h"
 
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
 MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
@@ -46,7 +47,6 @@ MODULE_DESCRIPTION("Dell laptop WMI hotkeys driver");
 MODULE_LICENSE("GPL");
 
 #define DELL_EVENT_GUID "9DBB5994-A997-11DA-B012-B622A1EF5492"
-#define DELL_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
 
 static bool wmi_requires_smbios_request;
 
@@ -617,75 +617,6 @@ static void dell_wmi_input_destroy(struct wmi_device *wdev)
 	input_unregister_device(priv->input_dev);
 }
 
-/*
- * Descriptor buffer is 128 byte long and contains:
- *
- *       Name             Offset  Length  Value
- * Vendor Signature          0       4    "DELL"
- * Object Signature          4       4    " WMI"
- * WMI Interface Version     8       4    <version>
- * WMI buffer length        12       4    <length>
- */
-static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
-{
-	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
-	union acpi_object *obj = NULL;
-	struct wmi_device *desc_dev;
-	u32 *buffer;
-	int ret;
-
-	desc_dev = wmidev_get_other_guid(wdev, DELL_DESCRIPTOR_GUID);
-	if (!desc_dev) {
-		dev_err(&wdev->dev, "Dell WMI descriptor does not exist\n");
-		return -ENODEV;
-	}
-
-	obj = wmidev_block_query(desc_dev, 0);
-	if (!obj) {
-		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
-		ret = -EIO;
-		goto out;
-	}
-
-	if (obj->type != ACPI_TYPE_BUFFER) {
-		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
-		ret = -EINVAL;
-		goto out;
-	}
-
-	if (obj->buffer.length != 128) {
-		dev_err(&wdev->dev,
-			"Dell descriptor buffer has invalid length (%d)\n",
-			obj->buffer.length);
-		ret = -EINVAL;
-		goto out;
-	}
-
-	buffer = (u32 *)obj->buffer.pointer;
-
-	if (strncmp(obj->string.pointer, "DELL WMI", 8) != 0) {
-		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
-			buffer);
-		ret = -EINVAL;
-		goto out;
-	}
-
-	if (buffer[2] != 0 && buffer[2] != 1)
-		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)\n",
-			(unsigned long) buffer[2]);
-
-	priv->interface_version = buffer[2];
-	ret = 0;
-
-	dev_info(&wdev->dev, "Detected Dell WMI interface version %u\n",
-		priv->interface_version);
-
-out:
-	kfree(obj);
-	put_device(&desc_dev->dev);
-	return ret;
-}
-
 /*
  * According to Dell SMBIOS documentation:
  *
@@ -721,7 +652,9 @@ static int dell_wmi_events_set_enabled(bool enable)
 static int dell_wmi_probe(struct wmi_device *wdev)
 {
 	struct dell_wmi_priv *priv;
-	int err;
+
+	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
+		return -ENODEV;
 
 	priv = devm_kzalloc(
 		&wdev->dev, sizeof(struct dell_wmi_priv), GFP_KERNEL);
@@ -729,9 +662,8 @@ static int dell_wmi_probe(struct wmi_device *wdev)
 		return -ENOMEM;
 	dev_set_drvdata(&wdev->dev, priv);
 
-	err = dell_wmi_check_descriptor_buffer(wdev);
-	if (err)
-		return err;
+	if (!dell_wmi_get_interface_version(&priv->interface_version))
+		return -EPROBE_DEFER;
 
 	return dell_wmi_input_setup(wdev);
 }
-- 
2.14.1
