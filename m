From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 11/14] platform/x86: wmi: create character devices when requested by drivers
Date: Tue, 26 Sep 2017 13:50:09 -0500
Message-ID: <b762b16cdec0a5582a3964efd49adc3e60a0e236.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

For WMI operations that are only Set or Query read or write sysfs
attributes created by WMI vendor drivers make sense.

For other WMI operations that are run on Method, there needs to be a
way to guarantee to userspace that the results from the method call
belong to the data request to the method call.  Sysfs attributes don't
work well in this scenario because two userspace processes may be
competing at reading/writing an attribute and step on each other's
data.

When a WMI vendor driver declares a set of functions in a
file_operations object the WMI bus driver will create a character
device that maps to those file operations.

The WMI vendor drivers will be responsible for managing access to
this character device and proper locking on it.

When a WMI vendor driver is unloaded the WMI bus driver will clean
up the character device.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/wmi.c | 98 +++++++++++++++++++++++++++++++++++++++++++---
 include/linux/wmi.h        |  1 +
 2 files changed, 94 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 7a05843aff19..5495360ad2da 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -34,7 +34,9 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -50,6 +52,9 @@ MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("ACPI-WMI Mapping Driver");
 MODULE_LICENSE("GPL");
 
+#define WMI_MAX_DEVS  MINORMASK
+static DEFINE_IDR(wmi_idr);
+static DEFINE_MUTEX(wmi_minor_lock);
 static LIST_HEAD(wmi_block_list);
 
 struct guid_block {
@@ -69,6 +74,8 @@ struct wmi_block {
 	struct wmi_device dev;
 	struct list_head list;
 	struct guid_block gblock;
+	struct cdev *cdev;
+	int minor;
 	struct acpi_device *acpi_device;
 	wmi_notify_handler handler;
 	void *handler_data;
@@ -86,6 +93,7 @@ struct wmi_block {
 #define ACPI_WMI_STRING      0x4	/* GUID takes & returns a string */
 #define ACPI_WMI_EVENT       0x8	/* GUID is an event */
 
+static dev_t wmi_devt;
 static bool debug_event;
 module_param(debug_event, bool, 0444);
 MODULE_PARM_DESC(debug_event,
@@ -762,21 +770,88 @@ static int wmi_dev_match(struct device *dev, struct device_driver *driver)
 	return 0;
 }
 
+static struct class wmi_bus_class = {
+	.name = "wmi_bus",
+};
+
+static int wmi_minor_get(struct wmi_block *wblock)
+{
+	int ret;
+
+	mutex_lock(&wmi_minor_lock);
+	ret = idr_alloc(&wmi_idr, wblock, 0, WMI_MAX_DEVS, GFP_KERNEL);
+	if (ret >= 0)
+		wblock->minor = ret;
+	else if (ret == -ENOSPC)
+		dev_err(&wblock->dev.dev, "too many wmi devices\n");
+
+	mutex_unlock(&wmi_minor_lock);
+	return ret;
+}
+
+static void wmi_minor_free(struct wmi_block *wblock)
+{
+	mutex_lock(&wmi_minor_lock);
+	idr_remove(&wmi_idr, wblock->minor);
+	mutex_unlock(&wmi_minor_lock);
+}
+
+
 static int wmi_dev_probe(struct device *dev)
 {
 	struct wmi_block *wblock = dev_to_wblock(dev);
 	struct wmi_driver *wdriver =
 		container_of(dev->driver, struct wmi_driver, driver);
-	int ret = 0;
+	struct device *clsdev;
+	int ret = 0, devno;
 
 	if (ACPI_FAILURE(wmi_method_enable(wblock, 1)))
 		dev_warn(dev, "failed to enable device -- probing anyway\n");
 
+	/* driver wants a character device made */
+	if (wdriver->file_operations) {
+		dev->devt = wmi_devt;
+		wblock->cdev = cdev_alloc();
+		if (!wblock->cdev) {
+			dev_err(dev, "failed to allocate cdev\n");
+			return -ENOMEM;
+		}
+		cdev_init(wblock->cdev, wdriver->file_operations);
+		wblock->cdev->owner = wdriver->file_operations->owner;
+		ret = wmi_minor_get(wblock);
+		if (ret < 0)
+			return ret;
+		devno = MKDEV(MAJOR(wmi_devt), wblock->minor);
+		ret = cdev_add(wblock->cdev, devno, 1);
+		if (ret) {
+			dev_err(dev, "unable to create device %d:%d\n",
+			MAJOR(wmi_devt), wblock->minor);
+			goto err_probe_cdev;
+		}
+		clsdev = device_create(&wmi_bus_class, dev,
+				       MKDEV(MAJOR(wmi_devt), wblock->minor),
+				       NULL, "wmi-%s", wdriver->driver.name);
+
+		if (IS_ERR(clsdev)) {
+			dev_err(dev, "unable to create device %d:%d\n",
+			MAJOR(wmi_devt), wblock->minor);
+			ret = PTR_ERR(clsdev);
+			goto err_probe_class;
+		}
+	}
+
 	if (wdriver->probe) {
 		ret = wdriver->probe(dev_to_wdev(dev));
 		if (ret != 0 && ACPI_FAILURE(wmi_method_enable(wblock, 0)))
 			dev_warn(dev, "failed to disable device\n");
 	}
+	return ret;
+
+err_probe_class:
+	cdev_del(wblock->cdev);
+
+err_probe_cdev:
+	wmi_minor_free(wblock);
 
 	return ret;
 }
@@ -788,6 +863,13 @@ static int wmi_dev_remove(struct device *dev)
 		container_of(dev->driver, struct wmi_driver, driver);
 	int ret = 0;
 
+	if (wdriver->file_operations) {
+		device_destroy(&wmi_bus_class,
+			       MKDEV(MAJOR(wmi_devt), wblock->minor));
+		cdev_del(wblock->cdev);
+		wmi_minor_free(wblock);
+	}
+
 	if (wdriver->remove)
 		ret = wdriver->remove(dev_to_wdev(dev));
 
@@ -797,10 +879,6 @@ static int wmi_dev_remove(struct device *dev)
 	return ret;
 }
 
-static struct class wmi_bus_class = {
-	.name = "wmi_bus",
-};
-
 static struct bus_type wmi_bus_type = {
 	.name = "wmi",
 	.dev_groups = wmi_groups,
@@ -1250,8 +1328,17 @@ static int __init acpi_wmi_init(void)
 		goto err_unreg_bus;
 	}
 
+	error = alloc_chrdev_region(&wmi_devt, 0, WMI_MAX_DEVS, "wmi");
+	if (error < 0) {
+		pr_err("unable to allocate char dev region\n");
+		goto err_unreg_platform;
+	}
+
 	return 0;
 
+err_unreg_platform:
+	platform_driver_unregister(&acpi_wmi_driver);
+
 err_unreg_bus:
 	bus_unregister(&wmi_bus_type);
 
@@ -1263,6 +1350,7 @@ static int __init acpi_wmi_init(void)
 
 static void __exit acpi_wmi_exit(void)
 {
+	unregister_chrdev_region(wmi_devt, WMI_MAX_DEVS);
 	platform_driver_unregister(&acpi_wmi_driver);
 	bus_unregister(&wmi_bus_type);
 	class_unregister(&wmi_bus_class);
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index cd0d7734dc49..6899ddb6cd30 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -41,6 +41,7 @@ struct wmi_device_id {
 struct wmi_driver {
 	struct device_driver driver;
 	const struct wmi_device_id *id_table;
+	const struct file_operations *file_operations;
 
 	int (*probe)(struct wmi_device *wdev);
 	int (*remove)(struct wmi_device *wdev);
-- 
2.14.1
