From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce userspace interface
Date: Wed,  4 Oct 2017 17:48:39 -0500
Message-ID: <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:6490 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751294AbdJDWsv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2017 18:48:51 -0400
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>

This userspace character device will be used to perform SMBIOS calls
from any applications.

It provides an ioctl that will allow passing the 32k WMI calling
interface buffer between userspace and kernel space.

This character device is intended to deprecate the dcdbas kernel module
and the interface that it provides to userspace.

It's important for the driver to provide a R/W ioctl to ensure that
two competing userspace processes don't race to provide or read each
others data.

The API for interacting with this interface is defined in documentation
as well as a uapi header provides the format of the structures.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 Documentation/ABI/testing/dell-smbios-wmi          | 43 ++++++++++
 .../ABI/testing/sysfs-platform-dell-smbios-wmi     | 10 +++
 MAINTAINERS                                        |  1 +
 drivers/platform/x86/dell-smbios-wmi.c             | 98 ++++++++++++++++++++++
 drivers/platform/x86/dell-smbios-wmi.h             | 10 ---
 include/uapi/linux/dell-smbios-wmi.h               | 25 ++++++
 6 files changed, 177 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/ABI/testing/dell-smbios-wmi
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-smbios-wmi
 create mode 100644 include/uapi/linux/dell-smbios-wmi.h

diff --git a/Documentation/ABI/testing/dell-smbios-wmi b/Documentation/ABI/testing/dell-smbios-wmi
new file mode 100644
index 000000000000..86ded18b41f7
--- /dev/null
+++ b/Documentation/ABI/testing/dell-smbios-wmi
@@ -0,0 +1,43 @@
+What:		/dev/wmi/dell-smbios
+Date:		November 2017
+KernelVersion:	4.15
+Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Description:
+		Perform SMBIOS calls on supported Dell machines.
+		through the Dell ACPI-WMI interface.
+
+		IOCTL's and buffer formats are defined in:
+		<uapi/linux/dell-wmi-smbios.h>
+
+		1) To perform a call from userspace, you'll need to first
+		determine the size of the buffer for your machine.
+		Platforms that contain larger buffers can return larger
+		objects from the system firmware.
+		Commonly this size is either 4k or 32k.
+
+		To determine the size of the buffer, refer to:
+		sysfs-platform-dell-smbios-wmi
+
+		2) After you've determined the size of the calling interface
+		buffer, you can allocate a structure that represents the
+		ioctl struct documented above.
+
+		3) In the 'length' object store the size of the buffer you
+		determined above.
+
+		4) Then use this size to allocate an appropriately sized
+		calling interface buffer to assign to 'buf' object.
+
+		5) In this buf object, prepare as necessary for the SMBIOS
+		call you're interested in.  Typically SMBIOS buffers have
+		"class", "select", and "input" defined to values that coincide
+		with the data you are interested in.
+		Documenting class/select/input values is outside of the scope
+		of this documentation. Check with the libsmbios project for
+		further documentation on these values.
+
+		6) Run the call by using ioctl() as described in the header.
+
+		7) The output will be returned in the buf object.
+
+		8) Be sure to free up both of your allocated objects.
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
index 6db1d84999bc..0dd373cf7280 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3986,6 +3986,7 @@ M:	Mario Limonciello <mario.limonciello@dell.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/dell-smbios-wmi.*
+F:	include/uapi/linux/dell-smbios-wmi.h
 
 DELL LAPTOP DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index 32e4e7dbf575..3156864e65e0 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/uaccess.h>
 #include <linux/wmi.h>
+#include <uapi/linux/dell-smbios-wmi.h>
 #include "dell-smbios-wmi.h"
 #include "dell-wmi-descriptor.h"
 static DEFINE_MUTEX(wmi_mutex);
@@ -107,6 +108,87 @@ void dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_wmi_call);
 
+static long dell_smbios_wmi_ioctl(struct file *filp, unsigned int cmd,
+	unsigned long arg)
+{
+	void __user *p = (void __user *) arg;
+	struct wmi_smbios_ioctl *input;
+	struct wmi_smbios_priv *priv;
+	struct wmi_device *wdev;
+	size_t ioctl_size;
+	int ret = 0;
+
+	switch (cmd) {
+	/* we only operate on first instance */
+	case DELL_WMI_SMBIOS_CMD:
+		wdev = get_first_wmi_device();
+		if (!wdev) {
+			pr_err("No WMI devices bound\n");
+			return -ENODEV;
+		}
+		ioctl_size = sizeof(struct wmi_smbios_ioctl);
+		priv = dev_get_drvdata(&wdev->dev);
+		input = kmalloc(ioctl_size, GFP_KERNEL);
+		if (!input)
+			return -ENOMEM;
+		mutex_lock(&wmi_mutex);
+		if (!access_ok(VERIFY_READ, p, ioctl_size)) {
+			pr_err("Unsafe userspace pointer passed\n");
+			return -EFAULT;
+		}
+		if (copy_from_user(input, p, ioctl_size)) {
+			ret = -EFAULT;
+			goto fail_smbios_cmd;
+		}
+		if (input->length != priv->buffer_size) {
+			pr_err("Got buffer size %d expected %d\n",
+				input->length, priv->buffer_size);
+			ret = -EINVAL;
+			goto fail_smbios_cmd;
+		}
+		if (!access_ok(VERIFY_WRITE, input->buf, priv->buffer_size)) {
+			pr_err("Unsafe userspace pointer passed\n");
+			ret = -EFAULT;
+			goto fail_smbios_cmd;
+		}
+		if (copy_from_user(priv->buf, input->buf, priv->buffer_size)) {
+			ret = -EFAULT;
+			goto fail_smbios_cmd;
+		}
+		ret = run_smbios_call(wdev);
+		if (ret != 0)
+			goto fail_smbios_cmd;
+		if (copy_to_user(input->buf, priv->buf, priv->buffer_size))
+			ret = -EFAULT;
+fail_smbios_cmd:
+		kfree(input);
+		mutex_unlock(&wmi_mutex);
+		break;
+	default:
+		pr_err("unsupported ioctl: %d.\n", cmd);
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
+static DEVICE_ATTR_RO(buffer_size);
+
+static struct attribute *smbios_wmi_attrs[] = {
+	&dev_attr_buffer_size.attr,
+	NULL
+};
+
+static const struct attribute_group smbios_wmi_attribute_group = {
+	.attrs = smbios_wmi_attrs,
+};
+
 static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 {
 	struct wmi_smbios_priv *priv;
@@ -127,6 +209,11 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 	if (!priv->buf)
 		return -ENOMEM;
 
+	ret = sysfs_create_group(&wdev->dev.kobj,
+				 &smbios_wmi_attribute_group);
+	if (ret)
+		goto fail_create_group;
+
 	/* ID is used by dell-smbios to set priority of drivers */
 	wdev->dev.id = 1;
 	ret = dell_smbios_register_device(&wdev->dev, &dell_smbios_wmi_call);
@@ -140,6 +227,10 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
 	return 0;
 
 fail_register:
+	sysfs_remove_group(&wdev->dev.kobj,
+			   &smbios_wmi_attribute_group);
+
+fail_create_group:
 	free_pages((unsigned long)priv->buf, count);
 	return ret;
 }
@@ -151,6 +242,7 @@ static int dell_smbios_wmi_remove(struct wmi_device *wdev)
 
 	list_del(&priv->list);
 	dell_smbios_unregister_device(&wdev->dev);
+	sysfs_remove_group(&wdev->dev.kobj, &smbios_wmi_attribute_group);
 	count = get_order(priv->buffer_size);
 	free_pages((unsigned long)priv->buf, count);
 	return 0;
@@ -161,6 +253,11 @@ static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
 	{ },
 };
 
+static const struct file_operations dell_smbios_wmi_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= dell_smbios_wmi_ioctl,
+};
+
 static void __init parse_b1_table(const struct dmi_header *dm)
 {
 	struct misc_bios_flags_structure *flags =
@@ -189,6 +286,7 @@ static struct wmi_driver dell_smbios_wmi_driver = {
 	.probe = dell_smbios_wmi_probe,
 	.remove = dell_smbios_wmi_remove,
 	.id_table = dell_smbios_wmi_id_table,
+	.file_operations = &dell_smbios_wmi_fops,
 };
 
 static int __init init_dell_smbios_wmi(void)
diff --git a/drivers/platform/x86/dell-smbios-wmi.h b/drivers/platform/x86/dell-smbios-wmi.h
index 5dd91d8ff3d8..40a3666ea87a 100644
--- a/drivers/platform/x86/dell-smbios-wmi.h
+++ b/drivers/platform/x86/dell-smbios-wmi.h
@@ -13,16 +13,6 @@
 
 #include "dell-smbios.h"
 
-struct wmi_calling_interface_buffer {
-	u16 class;
-	u16 select;
-	u32 input[4];
-	u32 output[4];
-	u32 argattrib;
-	u32 blength;
-	u8 *data;
-} __packed;
-
 void dell_smbios_wmi_call(struct calling_interface_buffer *buffer);
 
 #endif
diff --git a/include/uapi/linux/dell-smbios-wmi.h b/include/uapi/linux/dell-smbios-wmi.h
new file mode 100644
index 000000000000..0d0d09b04021
--- /dev/null
+++ b/include/uapi/linux/dell-smbios-wmi.h
@@ -0,0 +1,25 @@
+#ifndef _UAPI_DELL_SMBIOS_WMI_H_
+#define _UAPI_DELL_SMBIOS_WMI_H_
+
+#include <linux/ioctl.h>
+#include <linux/wmi.h>
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
+struct wmi_smbios_ioctl {
+	u32 length;
+	struct wmi_calling_interface_buffer *buf;
+};
+
+/* only offers on the single instance */
+#define DELL_WMI_SMBIOS_CMD		WMI_IOWR(0)
+
+#endif /* _UAPI_DELL_WMI_SMBIOS_H_ */
-- 
2.14.1
