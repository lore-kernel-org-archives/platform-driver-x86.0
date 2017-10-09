From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v6 13/14] platform/x86: wmi: create character devices when requested by drivers
Date: Mon,  9 Oct 2017 17:51:51 -0500
Message-ID: <897883f9b8c45dc2cb24de1bb4642513734852d3.1507589249.git.mario.limonciello@dell.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507589249.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507589249.git.mario.limonciello@dell.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
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
 MAINTAINERS                |  1 +
 drivers/platform/x86/wmi.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/wmi.h        |  3 ++
 include/uapi/linux/wmi.h   | 19 +++++++++++++
 4 files changed, 92 insertions(+)
 create mode 100644 include/uapi/linux/wmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e7514b616e13..2a99ee9fd883 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -372,6 +372,7 @@ ACPI WMI DRIVER
 L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
 F:	drivers/platform/x86/wmi.c
+F:	include/uapi/linux/wmi.h
 
 AD1889 ALSA SOUND DRIVER
 M:	Thibaut Varene <T-Bone@parisc-linux.org>
diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index bcb41c1c7f52..a22b0d333c8f 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -38,6 +38,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/miscdevice.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
@@ -69,6 +70,7 @@ struct wmi_block {
 	struct wmi_device dev;
 	struct list_head list;
 	struct guid_block gblock;
+	struct miscdevice misc_dev;
 	struct acpi_device *acpi_device;
 	wmi_notify_handler handler;
 	void *handler_data;
@@ -765,12 +767,74 @@ static int wmi_dev_match(struct device *dev, struct device_driver *driver)
 	return 0;
 }
 
+static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct wmi_driver *wdriver = NULL;
+	struct wmi_block *wblock = NULL;
+	const char *driver_name;
+	struct list_head *p;
+	int ret;
+
+	if (_IOC_TYPE(cmd) != WMI_IOC)
+		return -ENOTTY;
+
+	driver_name = filp->f_path.dentry->d_iname;
+
+	list_for_each(p, &wmi_block_list) {
+		wblock = list_entry(p, struct wmi_block, list);
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
+	if (_IOC_NR(cmd) > wblock->gblock.instance_count - 1)
+		return -EINVAL;
+
+	if (!try_module_get(wdriver->driver.owner))
+		return -EBUSY;
+
+	ret = wdriver->unlocked_ioctl(&wblock->dev, cmd, arg);
+	module_put(wdriver->driver.owner);
+
+	return ret;
+}
+
+static const struct file_operations wmi_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= wmi_ioctl,
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
@@ -791,6 +855,11 @@ static int wmi_dev_remove(struct device *dev)
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
index ddee427e0721..259d6ec87dd5 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -18,6 +18,7 @@
 
 #include <linux/device.h>
 #include <linux/acpi.h>
+#include <uapi/linux/wmi.h>
 
 struct wmi_device {
 	struct device dev;
@@ -47,6 +48,8 @@ struct wmi_driver {
 	int (*probe)(struct wmi_device *wdev);
 	int (*remove)(struct wmi_device *wdev);
 	void (*notify)(struct wmi_device *device, union acpi_object *data);
+	long (*unlocked_ioctl)(struct wmi_device *wdev, unsigned int cmd,
+				unsigned long arg);
 };
 
 extern int __must_check __wmi_driver_register(struct wmi_driver *driver,
diff --git a/include/uapi/linux/wmi.h b/include/uapi/linux/wmi.h
new file mode 100644
index 000000000000..2d8285ae4bd1
--- /dev/null
+++ b/include/uapi/linux/wmi.h
@@ -0,0 +1,19 @@
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
+#define WMI_IOC 'W'
+#define WMI_IO(instance)		_IO(WMI_IOC, instance)
+#define WMI_IOR(instance, type)		_IOR(WMI_IOC, instance, type)
+#define WMI_IOW(instance, type)		_IOW(WMI_IOC, instance, type)
+#define WMI_IOWR(instance, type)	_IOWR(WMI_IOC, instance, type)
+
+#endif
-- 
2.14.1
