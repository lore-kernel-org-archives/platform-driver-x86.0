From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v5 14/14] platform/x86: dell-smbios-wmi: introduce userspace interface
Date: Fri,  6 Oct 2017 23:59:58 -0500
Message-ID: <cb39307b0d44321cb168331c308e0fbee11b385c.1507350554.git.mario.limonciello@dell.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507350554.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507350554.git.mario.limonciello@dell.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

It's important for the driver to provide a R/W ioctl to ensure that
two competing userspace processes don't race to provide or read each
others data.

This userspace character device will be used to perform SMBIOS calls
from any applications.

It provides an ioctl that will allow passing the WMI calling
interface buffer between userspace and kernel space.

This character device is intended to deprecate the dcdbas kernel module
and the interface that it provides to userspace.

To use the character device the buffer needed for the machine will
also be needed.  This information is exported to a sysfs attribute.

The API for interacting with this interface is defined in documentation
as well as a uapi header provides the format of the structures.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 Documentation/ABI/testing/dell-smbios-wmi          |  41 ++++++++
 .../ABI/testing/sysfs-platform-dell-smbios-wmi     |  10 ++
 MAINTAINERS                                        |   1 +
 drivers/platform/x86/dell-smbios-wmi.c             | 104 ++++++++++++++++++---
 drivers/platform/x86/dell-smbios.h                 |  11 +--
 include/uapi/linux/dell-smbios.h                   |  42 +++++++++
 6 files changed, 188 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/ABI/testing/dell-smbios-wmi
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-smbios-wmi
 create mode 100644 include/uapi/linux/dell-smbios.h

diff --git a/Documentation/ABI/testing/dell-smbios-wmi b/Documentation/ABI/testing/dell-smbios-wmi
new file mode 100644
index 000000000000..e067e955fcc9
--- /dev/null
+++ b/Documentation/ABI/testing/dell-smbios-wmi
@@ -0,0 +1,41 @@
+What:		/dev/wmi/dell-smbios
+Date:		November 2017
+KernelVersion:	4.15
+Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Description:
+		Perform SMBIOS calls on supported Dell machines.
+		through the Dell ACPI-WMI interface.
+
+		IOCTL's and buffer formats are defined in:
+		<uapi/linux/dell-smbios.h>
+
+		1) To perform a call from userspace, you'll need to first
+		determine the minimum size of the calling interface buffer
+		for your machine.
+		Platforms that contain larger buffers can return larger
+		objects from the system firmware.
+		Commonly this size is either 4k or 32k.
+
+		To determine the size of the buffer, refer to:
+		sysfs-platform-dell-smbios-wmi
+
+		2) After you've determined the minimum size of the calling
+		interface buffer, you can allocate a structure that represents
+		the structure documented above.
+
+		3) In the 'length' object store the size of the buffer you
+		determined above and allocated.
+
+		4) In this buffer object, prepare as necessary for the SMBIOS
+		call you're interested in.  Typically SMBIOS buffers have
+		"class", "select", and "input" defined to values that coincide
+		with the data you are interested in.
+		Documenting class/select/input values is outside of the scope
+		of this documentation. Check with the libsmbios project for
+		further documentation on these values.
+
+		6) Run the call by using ioctl() as described in the header.
+
+		7) The output will be returned in the buffer object.
+
+		8) Be sure to free up your allocated object.
diff --git a/Documentation/ABI/testing/sysfs-platform-dell-smbios-wmi b/Documentation/ABI/testing/sysfs-platform-dell-smbios-wmi
new file mode 100644
index 000000000000..6a0513703a3c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-dell-smbios-wmi
@@ -0,0 +1,10 @@
+What:		/sys/devices/platform/<platform>/buffer_size
+Date:		November 2017
+KernelVersion:	4.15
+Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Description:
+		A read-only description of the size of a calling
+		interface buffer that can be passed to Dell
+		firmware.
+
+		Commonly this size is either 4k or 32k.
diff --git a/MAINTAINERS b/MAINTAINERS
index 2a99ee9fd883..4940f3c7481b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3986,6 +3986,7 @@ M:	Mario Limonciello <mario.limonciello@dell.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/dell-smbios-wmi.c
+F:	include/uapi/linux/dell-smbios.h
 
 DELL LAPTOP DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index 3de8abea38f8..2b78aba68755 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/uaccess.h>
 #include <linux/wmi.h>
+#include <uapi/linux/dell-smbios.h>
 #include "dell-smbios.h"
 #include "dell-wmi-descriptor.h"
 static DEFINE_MUTEX(call_mutex);
@@ -29,19 +30,9 @@ struct misc_bios_flags_structure {
 
 #define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
 
-struct wmi_extensions {
-	__u32 argattrib;
-	__u32 blength;
-	__u8 data[];
-} __packed;
-
-struct wmi_smbios_buffer {
-	struct calling_interface_buffer std;
-	struct wmi_extensions ext;
-} __packed;
-
 struct wmi_smbios_priv {
 	struct wmi_smbios_buffer *buf;
+	struct device_attribute buffer_size_attr;
 	struct list_head list;
 	struct wmi_device *wdev;
 	struct device *child;
@@ -113,6 +104,78 @@ int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
 	return ret;
 }
 
+static long dell_smbios_wmi_ioctl(struct wmi_device *wdev, unsigned int cmd,
+				  unsigned long arg)
+{
+	struct wmi_smbios_buffer __user *input =
+					(struct wmi_smbios_buffer __user *) arg;
+	struct wmi_smbios_priv *priv;
+	int ret = 0;
+	size_t size;
+
+	switch (cmd) {
+	case DELL_WMI_SMBIOS_CMD:
+		priv = dev_get_drvdata(&wdev->dev);
+		if (!priv)
+			return -ENODEV;
+		size = sizeof(struct wmi_smbios_buffer);
+		mutex_lock(&call_mutex);
+		if (copy_from_user(priv->buf, input, size)) {
+			dev_dbg(&wdev->dev, "Copy %lu from user failed\n",
+				size);
+			ret = -EFAULT;
+			goto fail_smbios_cmd;
+		}
+		if (priv->buf->length < priv->buffer_size) {
+			dev_err(&wdev->dev,
+				"Buffer %lld too small, need at least %d\n",
+				priv->buf->length, priv->buffer_size);
+			ret = -EINVAL;
+			goto fail_smbios_cmd;
+		}
+		if (dell_smbios_call_filter(&wdev->dev, &priv->buf->std)) {
+			dev_err(&wdev->dev, "Invalid call %d/%d:%8x\n",
+				priv->buf->std.class, priv->buf->std.select,
+				priv->buf->std.input[0]);
+			ret = -EFAULT;
+			goto fail_smbios_cmd;
+		}
+		size = priv->buffer_size - sizeof(struct wmi_smbios_buffer);
+		if (copy_from_user(priv->buf->ext.data,
+				   input->ext.data, size)) {
+			dev_dbg(&wdev->dev, "Copy %lu from user failed\n",
+				size);
+			ret = -EFAULT;
+			goto fail_smbios_cmd;
+		}
+		ret = run_smbios_call(priv->wdev);
+		if (ret != 0)
+			goto fail_smbios_cmd;
+		if (copy_to_user(input, priv->buf, priv->buffer_size)) {
+			dev_dbg(&wdev->dev, "Copy %d to user failed\n",
+			priv->buffer_size);
+			ret = -EFAULT;
+		}
+fail_smbios_cmd:
+		mutex_unlock(&call_mutex);
+		break;
+	default:
+		dev_dbg(&wdev->dev, "unsupported ioctl: %d [%d, %d, %d, %d].\n",
+			cmd, _IOC_DIR(cmd), _IOC_TYPE(cmd), _IOC_NR(cmd),
+			_IOC_SIZE(cmd));
+		ret = -ENOIOCTLCMD;
+	}
+	return ret;
+}
+
+static ssize_t buffer_size_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct wmi_smbios_priv *priv = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", priv->buffer_size);
+}
+
 static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 {
 	struct wmi_smbios_priv *priv;
@@ -127,12 +190,23 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 	/* WMI buffer size will be either 4k or 32k depending on machine */
 	if (!dell_wmi_get_size(&priv->buffer_size))
 		return -EINVAL;
+	/* add in the length object we will use internally with ioctl */
+	priv->buffer_size += sizeof(u64);
 
 	count = get_order(priv->buffer_size);
 	priv->buf = (void *)__get_free_pages(GFP_KERNEL, count);
 	if (!priv->buf)
 		return -ENOMEM;
 
+	sysfs_attr_init(&priv->buffer_size_attr);
+	priv->buffer_size_attr.attr.name = "buffer_size";
+	priv->buffer_size_attr.attr.mode = 0444;
+	priv->buffer_size_attr.show = buffer_size_show;
+
+	ret = device_create_file(&wdev->dev, &priv->buffer_size_attr);
+	if (ret)
+		goto fail_create_sysfs;
+
 	/* ID is used by dell-smbios to set priority of drivers */
 	wdev->dev.id = 1;
 	ret = dell_smbios_register_device(&wdev->dev, &dell_smbios_wmi_call);
@@ -148,6 +222,9 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 	return 0;
 
 fail_register:
+	device_remove_file(&wdev->dev, &priv->buffer_size_attr);
+
+fail_create_sysfs:
 	free_pages((unsigned long)priv->buf, count);
 	return ret;
 }
@@ -162,6 +239,7 @@ static int dell_smbios_wmi_remove(struct wmi_device *wdev)
 	list_del(&priv->list);
 	mutex_unlock(&list_mutex);
 	dell_smbios_unregister_device(&wdev->dev);
+	device_remove_file(&wdev->dev, &priv->buffer_size_attr);
 	count = get_order(priv->buffer_size);
 	free_pages((unsigned long)priv->buf, count);
 	mutex_unlock(&call_mutex);
@@ -203,6 +281,10 @@ static struct wmi_driver dell_smbios_wmi_driver = {
 	.probe = dell_smbios_wmi_probe,
 	.remove = dell_smbios_wmi_remove,
 	.id_table = dell_smbios_wmi_id_table,
+	.unlocked_ioctl = dell_smbios_wmi_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = dell_smbios_wmi_ioctl,
+#endif
 };
 
 static int __init init_dell_smbios_wmi(void)
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index c743c58831e5..04995136114c 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -17,19 +17,10 @@
 #define _DELL_SMBIOS_H_
 
 #include <linux/device.h>
+#include <uapi/linux/dell-smbios.h>
 
 struct notifier_block;
 
-/* This structure will be modified by the firmware when we enter
- * system management mode, hence the volatiles */
-
-struct calling_interface_buffer {
-	u16 class;
-	u16 select;
-	volatile u32 input[4];
-	volatile u32 output[4];
-} __packed;
-
 struct calling_interface_token {
 	u16 tokenID;
 	u16 location;
diff --git a/include/uapi/linux/dell-smbios.h b/include/uapi/linux/dell-smbios.h
new file mode 100644
index 000000000000..8ce142b95f15
--- /dev/null
+++ b/include/uapi/linux/dell-smbios.h
@@ -0,0 +1,42 @@
+/*
+ *  User API for WMI methods for use with dell-smbios
+ *
+ *  Copyright (c) 2017 Dell Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+
+#ifndef _UAPI_DELL_SMBIOS_H_
+#define _UAPI_DELL_SMBIOS_H_
+
+#include <linux/ioctl.h>
+#include <linux/wmi.h>
+
+/* This structure may be modified by the firmware when we enter
+ * system management mode through SMM, hence the volatiles
+ */
+struct calling_interface_buffer {
+	__u16 class;
+	__u16 select;
+	volatile __u32 input[4];
+	volatile __u32 output[4];
+} __packed;
+
+struct wmi_extensions {
+	__u32 argattrib;
+	__u32 blength;
+	__u8 data[];
+} __packed;
+
+struct wmi_smbios_buffer {
+	__u64 length;
+	struct calling_interface_buffer std;
+	struct wmi_extensions		ext;
+} __packed;
+
+/* SMBIOS calling IOCTL command */
+#define DELL_WMI_SMBIOS_CMD	WMI_IOWR(0, struct wmi_smbios_buffer)
+
+#endif /* _UAPI_DELL_SMBIOS_H_ */
-- 
2.14.1
