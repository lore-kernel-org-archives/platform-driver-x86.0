From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 1/3] platform/x86: Toshiba HDD Active Protection Sensor
Date: Thu, 14 Aug 2014 09:53:08 -0600
Message-ID: <1408031590-2727-2-git-send-email-coproscefalo@gmail.com>
References: <1408031590-2727-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:55968 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755588AbaHNPxk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Aug 2014 11:53:40 -0400
Received: by mail-ob0-f173.google.com with SMTP id vb8so1122922obc.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Aug 2014 08:53:39 -0700 (PDT)
In-Reply-To: <1408031590-2727-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garret <matthew.garret@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This driver adds support for the built-in accelereometer found
on recent Toshiba laptops with HID TOS620A.

This driver receives ACPI notify events 0x80 when the sensor
detects a sudden move or a harsh vibration, as well as an
ACPI notify event 0x81 whenever the movement or vibration has
been stabilized.

Also provides sysfs entries to get/set the desired protection
level and reseting the HDD protection interface.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_haps.c | 269 ++++++++++++++++++++++++++++++++++++
 1 file changed, 269 insertions(+)
 create mode 100644 drivers/platform/x86/toshiba_haps.c

diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/toshiba_haps.c
new file mode 100644
index 0000000..71e9e9e
--- /dev/null
+++ b/drivers/platform/x86/toshiba_haps.c
@@ -0,0 +1,269 @@
+/*
+ * Toshiba HDD Active Protection Sensor (HAPS) driver
+ *
+ * Copyright (C) 2014 Azael Avalos <coproscefalo@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ * 
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/acpi.h>
+
+MODULE_AUTHOR("Azael Avalos <coproscefalo@gmail.com>");
+MODULE_DESCRIPTION("Toshiba HDD Active Protection Sensor");
+MODULE_LICENSE("GPL");
+
+struct toshiba_haps_dev {
+	struct acpi_device *acpi_dev;
+
+	int protection_level;
+};
+
+static struct toshiba_haps_dev *toshiba_haps;
+
+/* HAPS functions */
+static int toshiba_haps_reset_protection(acpi_handle handle)
+{
+	acpi_status status;
+
+	status = acpi_evaluate_object(handle, "RSSS", NULL, NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_err("Unable to reset the HDD protection\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int toshiba_haps_protection_level(acpi_handle handle, int level)
+{
+	acpi_status status;
+
+	status = acpi_execute_simple_method(handle, "PTLV", level);
+	if (ACPI_FAILURE(status)) {
+		pr_err("Error while setting the protection level\n");
+		return -EIO;
+	}
+
+	pr_info("HDD protection level set to: %d\n", level);
+
+	return 0;
+}
+
+/* sysfs files */
+static ssize_t protection_level_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct toshiba_haps_dev *haps = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%i\n", haps->protection_level);
+}
+
+static ssize_t protection_level_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct toshiba_haps_dev *haps = dev_get_drvdata(dev);
+	int level, ret;
+
+	if (sscanf(buf, "%d", &level) != 1 || level < 0 || level > 3)
+		return -EINVAL;
+
+	/* Set the sensor level.
+	 * Acceptable levels are:
+	 * 0 - Disabled | 1 - Low | 2 - Medium | 3 - High
+	 */
+	ret = toshiba_haps_protection_level(haps->acpi_dev->handle, level);
+	if (ret != 0)
+		return ret;
+
+	haps->protection_level = level;
+
+	return count;
+}
+
+static ssize_t reset_protection_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct toshiba_haps_dev *haps = dev_get_drvdata(dev);
+	int reset, ret;
+
+	if (sscanf(buf, "%d", &reset) != 1 || reset != 1)
+		return -EINVAL;
+
+	/* Reset the protection interface */
+	ret = toshiba_haps_reset_protection(haps->acpi_dev->handle);
+	if (ret != 0)
+		return ret;
+
+	return count;
+}
+
+static DEVICE_ATTR(protection_level, S_IRUGO | S_IWUSR,
+		   protection_level_show, protection_level_store);
+static DEVICE_ATTR(reset_protection, S_IWUSR, NULL, reset_protection_store);
+
+static struct attribute *haps_attributes[] = {
+	&dev_attr_protection_level.attr,
+	&dev_attr_reset_protection.attr,
+	NULL,
+};
+
+static struct attribute_group haps_attr_group = {
+	.attrs = haps_attributes,
+};
+
+/*
+ * ACPI stuff
+ */
+static void toshiba_haps_notify(struct acpi_device *device, u32 event)
+{
+	pr_info("Received event: 0x%x", event);
+
+	acpi_bus_generate_netlink_event(device->pnp.device_class,
+					dev_name(&device->dev),
+					event, 0);
+}
+
+static int toshiba_haps_remove(struct acpi_device *device)
+{
+	sysfs_remove_group(&device->dev.kobj, &haps_attr_group);
+
+	if (toshiba_haps)
+		toshiba_haps = NULL;
+
+	return 0;
+}
+
+/* Helper function */
+static int toshiba_haps_available(acpi_handle handle)
+{
+	acpi_status status;
+	u64 hdd_present;
+
+	/*
+	 * A non existent device as well as having (only)
+	 * Solid State Drives can cause the call to fail.
+	 */
+	status = acpi_evaluate_integer(handle, "_STA", NULL,
+				       &hdd_present);
+	if (ACPI_FAILURE(status) || !hdd_present) {
+		pr_info("HDD protection not available or using SSD\n");
+		return 0;
+	}
+
+	return 1;
+}
+
+static int toshiba_haps_add(struct acpi_device *acpi_dev)
+{
+	struct toshiba_haps_dev *haps;
+	int ret;
+
+	if (toshiba_haps)
+		return -EBUSY;
+
+	if (!toshiba_haps_available(acpi_dev->handle))
+		return -ENODEV;
+
+	pr_info("Toshiba HDD Active Protection Sensor device\n");
+
+	haps = kzalloc(sizeof(struct toshiba_haps_dev), GFP_KERNEL);
+	if (!haps)
+		return -ENOMEM;
+
+	haps->acpi_dev = acpi_dev;
+	haps->protection_level = 2;
+	acpi_dev->driver_data = haps;
+	dev_set_drvdata(&acpi_dev->dev, haps);
+
+	/* Set the protection level, currently at level 2 (Medium) */
+	ret = toshiba_haps_protection_level(acpi_dev->handle, 2);
+	if (ret != 0)
+		return ret;
+
+	ret = sysfs_create_group(&acpi_dev->dev.kobj, &haps_attr_group);
+	if (ret)
+		return ret;
+
+	toshiba_haps = haps;
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int toshiba_haps_suspend(struct device *device)
+{
+	struct toshiba_haps_dev *haps;
+	int ret;
+
+	haps = acpi_driver_data(to_acpi_device(device));
+
+	/* Deactivate the protection on suspend */
+	ret = toshiba_haps_protection_level(haps->acpi_dev->handle, 0);
+
+	return ret;
+}
+
+static int toshiba_haps_resume(struct device *device)
+{
+	struct toshiba_haps_dev *haps;
+	int ret;
+
+	haps = acpi_driver_data(to_acpi_device(device));
+
+	/* Set the stored protection level */
+	ret = toshiba_haps_protection_level(haps->acpi_dev->handle,
+					    haps->protection_level);
+
+	/* Reset the protection on resume */
+	ret = toshiba_haps_reset_protection(haps->acpi_dev->handle);
+	if (ret != 0)
+		return ret;
+
+	return ret;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(toshiba_haps_pm,
+			 toshiba_haps_suspend, toshiba_haps_resume);
+
+static const struct acpi_device_id haps_device_ids[] = {
+	{"TOS620A", 0},
+	{"", 0},
+};
+MODULE_DEVICE_TABLE(acpi, haps_device_ids);
+
+static struct acpi_driver toshiba_haps_driver = {
+	.name = "Toshiba HAPS",
+	.owner = THIS_MODULE,
+	.ids = haps_device_ids,
+	.flags = ACPI_DRIVER_ALL_NOTIFY_EVENTS,
+	.ops = {
+		.add =		toshiba_haps_add,
+		.remove =	toshiba_haps_remove,
+		.notify =	toshiba_haps_notify,
+	},
+	.drv.pm = &toshiba_haps_pm,
+};
+
+module_acpi_driver(toshiba_haps_driver);
-- 
2.0.0
