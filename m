From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v7 14/15] platform/x86: wmi: create userspace interface for drivers
Date: Wed, 11 Oct 2017 11:27:40 -0500
Message-ID: <29fed1b34580dac18350b0fe41de1f0e063e9288.1507733291.git.mario.limonciello@dell.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507733291.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507733291.git.mario.limonciello@dell.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

For WMI operations that are only Set or Query read or write sysfs
attributes created by WMI vendor drivers make sense.

For other WMI operations that are run on Method, there needs to be a
way to guarantee to userspace that the results from the method call
belong to the data request to the method call.  Sysfs attributes don't
work well in this scenario because two userspace processes may be
competing at reading/writing an attribute and step on each other's
data.

When a WMI vendor driver declares an ioctl callback in the wmi_driver
the WMI bus driver will create a character device that maps to that
function.

That character device will correspond to this path:
/dev/wmi/$driver

The WMI bus driver will interpret the IOCTL calls, test them for
a valid instance and pass them on to the vendor driver to run.

This creates an implicit policy that only driver per character
device.  If a module matches multiple GUID's, the wmi_devices
will need to be all handled by the same wmi_driver if the same
character device is used.

The WMI vendor drivers will be responsible for managing access to
this character device and proper locking on it.

When a WMI vendor driver is unloaded the WMI bus driver will clean
up the character device.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 MAINTAINERS                |   1 +
 drivers/platform/x86/wmi.c | 115 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/wmi.h        |   6 +++
 include/uapi/linux/wmi.h   |  24 ++++++++++
 4 files changed, 146 insertions(+)
 create mode 100644 include/uapi/linux/wmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8fd2f0d2ddf6..84afbf8ef7d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -384,6 +384,7 @@ ACPI WMI DRIVER
 L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
 F:	drivers/platform/x86/wmi.c
+F:	include/uapi/linux/wmi.h
 
 AD1889 ALSA SOUND DRIVER
 M:	Thibaut Varene <T-Bone@parisc-linux.org>
diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 63d01f98bf4c..ab5b0d1915ad 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -38,12 +38,15 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/uaccess.h>
 #include <linux/uuid.h>
 #include <linux/wmi.h>
+#include <uapi/linux/wmi.h>
 
 ACPI_MODULE_NAME("wmi");
 MODULE_AUTHOR("Carlos Corbacho");
@@ -69,6 +72,7 @@ struct wmi_block {
 	struct wmi_device dev;
 	struct list_head list;
 	struct guid_block gblock;
+	struct miscdevice misc_dev;
 	struct acpi_device *acpi_device;
 	wmi_notify_handler handler;
 	void *handler_data;
@@ -796,12 +800,118 @@ static int wmi_dev_match(struct device *dev, struct device_driver *driver)
 	return 0;
 }
 
+static long match_ioctl(struct file *filp, unsigned int cmd, unsigned long arg,
+			int compat)
+{
+	struct wmi_ioctl_buffer __user *input =
+		(struct wmi_ioctl_buffer __user *) arg;
+	struct wmi_driver *wdriver = NULL;
+	struct wmi_block *wblock = NULL;
+	struct wmi_block *next = NULL;
+	const char *driver_name;
+	u64 size;
+	int ret;
+
+	if (_IOC_TYPE(cmd) != WMI_IOC)
+		return -ENOTTY;
+
+	driver_name = filp->f_path.dentry->d_iname;
+
+	list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
+		wdriver = container_of(wblock->dev.dev.driver,
+					struct wmi_driver, driver);
+		if (!wdriver)
+			continue;
+		if (strcmp(driver_name, wdriver->driver.name) == 0)
+			break;
+	}
+
+	if (!wdriver)
+		return -ENODEV;
+
+	/* make sure we're not calling a higher instance than exists*/
+	if (_IOC_NR(cmd) >= wblock->gblock.instance_count)
+		return -EINVAL;
+
+	/* check that required buffer size was declared by driver */
+	if (!wblock->req_buf_size) {
+		dev_err(&wblock->dev.dev, "Required buffer size not set\n");
+		return -EINVAL;
+	}
+	if (get_user(size, &input->length)) {
+		dev_dbg(&wblock->dev.dev, "Read length from user failed\n");
+		return -EFAULT;
+	}
+	/* if it's too small, abort */
+	if (size < wblock->req_buf_size) {
+		dev_err(&wblock->dev.dev,
+			"Buffer %lld too small, need at least %lld\n",
+			size, wblock->req_buf_size);
+		return -EINVAL;
+	}
+	/* if it's too big, warn, driver will only use what is needed */
+	if (size > wblock->req_buf_size)
+		dev_warn(&wblock->dev.dev,
+			"Buffer %lld is bigger than required %lld\n",
+			size, wblock->req_buf_size);
+
+	if (!try_module_get(wdriver->driver.owner))
+		return -EBUSY;
+	if (compat) {
+		if (wdriver->compat_ioctl)
+			ret = wdriver->compat_ioctl(&wblock->dev, cmd, arg);
+		else
+			ret = -ENODEV;
+	} else
+		ret = wdriver->unlocked_ioctl(&wblock->dev, cmd, arg);
+	module_put(wdriver->driver.owner);
+
+	return ret;
+}
+static long wmi_unlocked_ioctl(struct file *filp, unsigned int cmd,
+			       unsigned long arg)
+{
+	return match_ioctl(filp, cmd, arg, 0);
+}
+
+static long wmi_compat_ioctl(struct file *filp, unsigned int cmd,
+			     unsigned long arg)
+{
+	return match_ioctl(filp, cmd, arg, 1);
+}
+
+static const struct file_operations wmi_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= wmi_unlocked_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = wmi_compat_ioctl,
+#endif
+};
+
 static int wmi_dev_probe(struct device *dev)
 {
 	struct wmi_block *wblock = dev_to_wblock(dev);
 	struct wmi_driver *wdriver =
 		container_of(dev->driver, struct wmi_driver, driver);
 	int ret = 0;
+	char *buf;
+
+	/* driver wants a character device made */
+	if (wdriver->unlocked_ioctl) {
+		buf = kmalloc(strlen(wdriver->driver.name) + 4, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+		sprintf(buf, "wmi/%s", wdriver->driver.name);
+		wblock->misc_dev.minor = MISC_DYNAMIC_MINOR;
+		wblock->misc_dev.name = buf;
+		wblock->misc_dev.fops = &wmi_fops;
+		ret = misc_register(&wblock->misc_dev);
+		if (ret) {
+			dev_warn(dev, "failed to register char dev: %d", ret);
+			kfree(buf);
+			return -ENOMEM;
+		}
+	}
 
 	if (ACPI_FAILURE(wmi_method_enable(wblock, 1)))
 		dev_warn(dev, "failed to enable device -- probing anyway\n");
@@ -822,6 +932,11 @@ static int wmi_dev_remove(struct device *dev)
 		container_of(dev->driver, struct wmi_driver, driver);
 	int ret = 0;
 
+	if (wdriver->unlocked_ioctl) {
+		misc_deregister(&wblock->misc_dev);
+		kfree(wblock->misc_dev.name);
+	}
+
 	if (wdriver->remove)
 		ret = wdriver->remove(dev_to_wdev(dev));
 
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index a9a72a4c5ed8..1f52dc49a896 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -50,6 +50,12 @@ struct wmi_driver {
 	int (*probe)(struct wmi_device *wdev);
 	int (*remove)(struct wmi_device *wdev);
 	void (*notify)(struct wmi_device *device, union acpi_object *data);
+	long (*unlocked_ioctl)(struct wmi_device *wdev, unsigned int cmd,
+				unsigned long arg);
+#ifdef CONFIG_COMPAT
+	long (*compat_ioctl)(struct wmi_device *wdev, unsigned int cmd,
+				unsigned long arg);
+#endif
 };
 
 extern int __must_check __wmi_driver_register(struct wmi_driver *driver,
diff --git a/include/uapi/linux/wmi.h b/include/uapi/linux/wmi.h
new file mode 100644
index 000000000000..d93b4f56add4
--- /dev/null
+++ b/include/uapi/linux/wmi.h
@@ -0,0 +1,24 @@
+/*
+ *  User API methods for ACPI-WMI mapping driver
+ *
+ *  Copyright (C) 2017 Dell, Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+#ifndef _UAPI_LINUX_WMI_H
+#define _UAPI_LINUX_WMI_H
+
+/* WMI bus will filter all WMI vendor driver requests through this IOC */
+#define WMI_IOC 'W'
+
+/* All ioctl requests through WMI should declare their size followed by
+ * relevant data objects
+ */
+struct wmi_ioctl_buffer {
+	__u64	length;
+	__u8	data[];
+};
+
+#endif
-- 
2.14.1
