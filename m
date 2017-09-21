From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 11/12] platform/x86: dell-wmi-smbios: introduce character device for userspace
Date: Thu, 21 Sep 2017 08:57:16 -0500
Message-ID: <a7829a31691da18e4d28e0760645ca2a3f302b66.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

This userspace character device will be used to perform SMBIOS calls
from any applications sending a properly formatted 4k calling interface
buffer.

This character device is intended to deprecate the dcdbas kernel module
and the interface that it provides to userspace.

It's important for the driver to provide a R/W ioctl to ensure that
two competing userspace processes don't race to provide or read each
others data.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 Documentation/ABI/testing/dell-wmi-smbios |  19 ++++++
 drivers/platform/x86/dell-wmi-smbios.c    | 108 ++++++++++++++++++++++++++----
 drivers/platform/x86/dell-wmi-smbios.h    |   5 ++
 3 files changed, 120 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/ABI/testing/dell-wmi-smbios

diff --git a/Documentation/ABI/testing/dell-wmi-smbios b/Documentation/ABI/testing/dell-wmi-smbios
new file mode 100644
index 000000000000..54dcf73b3031
--- /dev/null
+++ b/Documentation/ABI/testing/dell-wmi-smbios
@@ -0,0 +1,19 @@
+What:		/dev/wmi-dell-wmi-smbios
+Date:		October 2017
+KernelVersion:	4.15
+Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
+Description:
+		Perform an SMBIOS call on a supported Dell machine
+		through the Dell ACPI-WMI interface.
+
+		To make a call prepare a 4k buffer like this:
+		struct buffer {
+			u16 class;
+			u16 select;
+			u32 input[4];
+			u32 output[4];
+			u8 data[4060];
+		} __packed;
+
+		Perform this RW IOCTL to get the result:
+		_IOWR('D', 0, struct calling_interface_buffer)
diff --git a/drivers/platform/x86/dell-wmi-smbios.c b/drivers/platform/x86/dell-wmi-smbios.c
index 9deb851ff517..22e47fba6a59 100644
--- a/drivers/platform/x86/dell-wmi-smbios.c
+++ b/drivers/platform/x86/dell-wmi-smbios.c
@@ -21,6 +21,7 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/wmi.h>
+#include <linux/uaccess.h>
 #include "dell-wmi-smbios.h"
 
 #define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
@@ -34,7 +35,8 @@ struct calling_interface_structure {
 	struct calling_interface_token tokens[];
 } __packed;
 
-static struct calling_interface_buffer *buffer;
+static struct calling_interface_buffer *internal_buffer;
+static struct calling_interface_buffer *sysfs_buffer;
 static DEFINE_MUTEX(buffer_mutex);
 
 static int da_command_address;
@@ -61,13 +63,13 @@ struct calling_interface_buffer *dell_smbios_get_buffer(void)
 {
 	mutex_lock(&buffer_mutex);
 	dell_smbios_clear_buffer();
-	return buffer;
+	return internal_buffer;
 }
 EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
 
 void dell_smbios_clear_buffer(void)
 {
-	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	memset(internal_buffer, 0, sizeof(struct calling_interface_buffer));
 }
 EXPORT_SYMBOL_GPL(dell_smbios_clear_buffer);
 
@@ -107,9 +109,9 @@ int run_wmi_smbios_call(struct calling_interface_buffer *buffer)
 
 void dell_smbios_send_request(int class, int select)
 {
-	buffer->class = class;
-	buffer->select = select;
-	run_wmi_smbios_call(buffer);
+	internal_buffer->class = class;
+	internal_buffer->select = select;
+	run_wmi_smbios_call(internal_buffer);
 }
 EXPORT_SYMBOL_GPL(dell_smbios_send_request);
 
@@ -218,6 +220,68 @@ static const struct attribute_group smbios_attribute_group = {
 	.attrs = smbios_attrs,
 };
 
+static int dell_wmi_smbios_open(struct inode *inode, struct file *file)
+{
+	return nonseekable_open(inode, file);
+}
+
+static int dell_wmi_smbios_release(struct inode *inode, struct file *file)
+{
+	return 0;
+}
+
+static ssize_t dell_wmi_smbios_read(struct file *file, char __user *data,
+				   size_t len, loff_t *ppos)
+{
+	ssize_t size = sizeof(struct calling_interface_buffer);
+	void *src;
+
+	if (*ppos >= size)
+		return 0;
+	if (len >= size)
+		len = size;
+	if (*ppos + len > size)
+		len = size - *ppos;
+	src = (void __force *) (sysfs_buffer + *ppos);
+	if (copy_to_user(data, src, len))
+		return -EFAULT;
+
+	*ppos += len;
+	return len;
+}
+
+static long dell_wmi_smbios_ioctl(struct file *filp, unsigned int cmd,
+	unsigned long arg)
+{
+	int ret = 0;
+	size_t size;
+
+	if (_IOC_TYPE(cmd) != DELL_WMI_SMBIOS_IOC)
+		return -ENOTTY;
+
+	switch (cmd) {
+	case DELL_WMI_SMBIOS_CMD:
+		size = sizeof(struct calling_interface_buffer);
+		mutex_lock(&buffer_mutex);
+		if (copy_from_user(sysfs_buffer, (void __user *) arg, size)) {
+			ret = -EFAULT;
+			goto fail_smbios_cmd;
+		}
+		ret = run_wmi_smbios_call(sysfs_buffer);
+		if (ret != 0)
+			goto fail_smbios_cmd;
+		if (copy_to_user((void __user *) arg, sysfs_buffer, size))
+			ret = -EFAULT;
+fail_smbios_cmd:
+		mutex_unlock(&buffer_mutex);
+		break;
+	default:
+		pr_err("unsupported ioctl: %d.\n", cmd);
+		ret = -ENOIOCTLCMD;
+	}
+	return ret;
+}
+
 /*
  * Descriptor buffer is 128 byte long and contains:
  *
@@ -306,12 +370,19 @@ static int dell_wmi_smbios_probe(struct wmi_device *wdev)
 	if (ret)
 		return ret;
 
-	buffer = (void *)__get_free_page(GFP_KERNEL);
-	if (!buffer) {
+	internal_buffer = (void *)__get_free_page(GFP_KERNEL);
+	if (!internal_buffer) {
 		ret = -ENOMEM;
-		goto fail_buffer;
+		goto fail_internal_buffer;
 	}
 
+	sysfs_buffer = (void *)__get_free_page(GFP_KERNEL);
+	if (!sysfs_buffer) {
+		ret = -ENOMEM;
+		goto fail_sysfs_buffer;
+	}
+	memset(sysfs_buffer, 0, sizeof(struct calling_interface_buffer));
+
 	ret = sysfs_create_group(&wdev->dev.kobj, &smbios_attribute_group);
 	if (ret)
 		goto fail_create_group;
@@ -320,9 +391,12 @@ static int dell_wmi_smbios_probe(struct wmi_device *wdev)
 	return 0;
 
 fail_create_group:
-	free_page((unsigned long)buffer);
+	free_page((unsigned long)sysfs_buffer);
 
-fail_buffer:
+fail_sysfs_buffer:
+	free_page((unsigned long)internal_buffer);
+
+fail_internal_buffer:
 	kfree(da_tokens);
 	return ret;
 }
@@ -331,7 +405,8 @@ static int dell_wmi_smbios_remove(struct wmi_device *wdev)
 {
 	sysfs_remove_group(&wdev->dev.kobj, &smbios_attribute_group);
 	kfree(da_tokens);
-	free_page((unsigned long)buffer);
+	free_page((unsigned long)internal_buffer);
+	free_page((unsigned long)sysfs_buffer);
 	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
 	return 0;
 }
@@ -341,6 +416,14 @@ static const struct wmi_device_id dell_wmi_smbios_id_table[] = {
 	{ },
 };
 
+static const struct file_operations dell_wmi_smbios_fops = {
+	.owner		= THIS_MODULE,
+	.read		= dell_wmi_smbios_read,
+	.unlocked_ioctl	= dell_wmi_smbios_ioctl,
+	.open		= dell_wmi_smbios_open,
+	.release	= dell_wmi_smbios_release,
+};
+
 static struct wmi_driver dell_wmi_smbios_driver = {
 	.driver = {
 		.name = "dell-wmi-smbios",
@@ -348,6 +431,7 @@ static struct wmi_driver dell_wmi_smbios_driver = {
 	.probe = dell_wmi_smbios_probe,
 	.remove = dell_wmi_smbios_remove,
 	.id_table = dell_wmi_smbios_id_table,
+	.file_operations = &dell_wmi_smbios_fops,
 };
 module_wmi_driver(dell_wmi_smbios_driver);
 
diff --git a/drivers/platform/x86/dell-wmi-smbios.h b/drivers/platform/x86/dell-wmi-smbios.h
index 0521ec5d437b..b8215eb879b2 100644
--- a/drivers/platform/x86/dell-wmi-smbios.h
+++ b/drivers/platform/x86/dell-wmi-smbios.h
@@ -18,6 +18,7 @@
 #define _DELL_WMI_SMBIOS_H_
 
 #include <linux/wmi.h>
+#include <linux/ioctl.h>
 
 struct notifier_block;
 
@@ -40,6 +41,10 @@ struct calling_interface_token {
 	};
 };
 
+#define DELL_WMI_SMBIOS_IOC   'D'
+#define DELL_WMI_SMBIOS_CMD   _IOWR(DELL_WMI_SMBIOS_IOC, 0, \
+				   struct calling_interface_buffer)
+
 int dell_smbios_error(int value);
 
 struct calling_interface_buffer *dell_smbios_get_buffer(void);
-- 
2.14.1
