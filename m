From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v4 12/14] platform/x86: wmi: create character devices when requested by drivers
Date: Wed,  4 Oct 2017 17:48:38 -0500
Message-ID: <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
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

When a WMI vendor driver declares an ioctl in a file_operations object
the WMI bus driver will create a character device that maps to those
file operations.

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
 drivers/platform/x86/wmi.c | 67 +++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/wmi.h        |  2 ++
 include/uapi/linux/wmi.h   | 10 +++++++
 4 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/linux/wmi.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0357e9b1cfaf..6db1d84999bc 100644
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
index bcb41c1c7f52..5aef052b4aab 100644
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
@@ -765,22 +767,80 @@ static int wmi_dev_match(struct device *dev, struct device_driver *driver)
 	return 0;
 }
 
+static long wmi_ioctl(struct file *filp, unsigned int cmd,
+		      unsigned long arg)
+{
+	struct wmi_driver *wdriver;
+	struct wmi_block *wblock;
+	const char *driver_name;
+	struct list_head *p;
+	bool found = false;
+
+	if (_IOC_TYPE(cmd) != WMI_IOC)
+		return -ENOTTY;
+
+	driver_name = filp->f_path.dentry->d_iname;
+
+	list_for_each(p, &wmi_block_list) {
+		wblock = list_entry(p, struct wmi_block, list);
+		wdriver = container_of(wblock->dev.dev.driver,
+			struct wmi_driver, driver);
+		if (strcmp(driver_name, wdriver->driver.name) == 0) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found ||
+	    !wdriver->file_operations ||
+	    !wdriver->file_operations->unlocked_ioctl)
+		return -ENODEV;
+
+	/* make sure we're not calling a higher instance */
+	if (_IOC_NR(cmd) > wblock->gblock.instance_count)
+		return -EINVAL;
+
+	return wdriver->file_operations->unlocked_ioctl(filp, cmd, arg);
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
 
 	if (ACPI_FAILURE(wmi_method_enable(wblock, 1)))
 		dev_warn(dev, "failed to enable device -- probing anyway\n");
 
+	/* driver wants a character device made */
+	if (wdriver->file_operations) {
+		buf = kmalloc(strlen(wdriver->driver.name) + 4, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+		strcpy(buf, "wmi/");
+		strcpy(buf + 4, wdriver->driver.name);
+		wblock->misc_dev.minor = MISC_DYNAMIC_MINOR;
+		wblock->misc_dev.name = buf;
+		wblock->misc_dev.fops = &wmi_fops;
+		ret = misc_register(&wblock->misc_dev);
+		if (ret) {
+			dev_warn(dev, "failed to register char dev: %d", ret);
+			kfree(buf);
+		}
+	}
+
 	if (wdriver->probe) {
 		ret = wdriver->probe(dev_to_wdev(dev));
 		if (ret != 0 && ACPI_FAILURE(wmi_method_enable(wblock, 0)))
 			dev_warn(dev, "failed to disable device\n");
 	}
-
 	return ret;
 }
 
@@ -791,6 +851,11 @@ static int wmi_dev_remove(struct device *dev)
 		container_of(dev->driver, struct wmi_driver, driver);
 	int ret = 0;
 
+	if (wdriver->file_operations) {
+		kfree(wblock->misc_dev.name);
+		misc_deregister(&wblock->misc_dev);
+	}
+
 	if (wdriver->remove)
 		ret = wdriver->remove(dev_to_wdev(dev));
 
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index ddee427e0721..c84db3e8038d 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -18,6 +18,7 @@
 
 #include <linux/device.h>
 #include <linux/acpi.h>
+#include <uapi/linux/wmi.h>
 
 struct wmi_device {
 	struct device dev;
@@ -43,6 +44,7 @@ struct wmi_device_id {
 struct wmi_driver {
 	struct device_driver driver;
 	const struct wmi_device_id *id_table;
+	const struct file_operations *file_operations;
 
 	int (*probe)(struct wmi_device *wdev);
 	int (*remove)(struct wmi_device *wdev);
diff --git a/include/uapi/linux/wmi.h b/include/uapi/linux/wmi.h
new file mode 100644
index 000000000000..6a811ead7db8
--- /dev/null
+++ b/include/uapi/linux/wmi.h
@@ -0,0 +1,10 @@
+#ifndef _UAPI_LINUX_WMI_H
+#define _UAPI_LINUX_WMI_H
+
+#define WMI_IOC 'W'
+#define WMI_IO(instance)	_IO(WMI_IOC, instance)
+#define WMI_IOR(instance)	_IOR(WMI_IOC, instance, void*)
+#define WMI_IOW(instance)	_IOW(WMI_IOC, instance, void*)
+#define WMI_IOWR(instance)	_IOWR(WMI_IOC, instance, void*)
+
+#endif
-- 
2.14.1
