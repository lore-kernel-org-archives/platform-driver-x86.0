From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: remove threeg and interface sysfs interfaces
Date: Mon,  5 Oct 2015 18:17:42 +0800
Message-ID: <1444040262-6520-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:35784 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752250AbbJEKSF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 5 Oct 2015 06:18:05 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Martin Kepplinger <martink@posteo.de>

Since v3.0 kernel, acer-wmi driver auto detects internal 3G device and
provides the threeg rfkill interface. So the sysfs interface of 3G is
no longer necessary now.

The 7b8aca65 patch added kernel information log to remind to user space
for the threeg sysfs interface will be removed in 2012, then b58b9ffc patch
updated the interface removing time to 2014.

I think the 3 years lead time is enough for user space application to use
rfkill instead of sysfs interface to control 3G device.

This patch removes code about threeg sysfs interface. And it also removes the
unused interface sysfs that exposes which ACPI-WMI method used by acer-wmi
driver on the machine. The information is already exposed by the acer-wmi
initial log.

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Martin Kepplinger <martink@posteo.de>
Cc: Darren Hart <dvhart@infradead.org>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c | 92 -----------------------------------------
 1 file changed, 92 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index f6b280d..fda70cd 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1661,58 +1661,6 @@ static void acer_rfkill_exit(void)
 	return;
 }
 
-/*
- * sysfs interface
- */
-static ssize_t show_bool_threeg(struct device *dev,
-	struct device_attribute *attr, char *buf)
-{
-	u32 result; \
-	acpi_status status;
-
-	pr_info("This threeg sysfs will be removed in 2014 - used by: %s\n",
-		current->comm);
-	status = get_u32(&result, ACER_CAP_THREEG);
-	if (ACPI_SUCCESS(status))
-		return sprintf(buf, "%u\n", result);
-	return sprintf(buf, "Read error\n");
-}
-
-static ssize_t set_bool_threeg(struct device *dev,
-	struct device_attribute *attr, const char *buf, size_t count)
-{
-	u32 tmp = simple_strtoul(buf, NULL, 10);
-	acpi_status status = set_u32(tmp, ACER_CAP_THREEG);
-	pr_info("This threeg sysfs will be removed in 2014 - used by: %s\n",
-		current->comm);
-	if (ACPI_FAILURE(status))
-		return -EINVAL;
-	return count;
-}
-static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
-	set_bool_threeg);
-
-static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
-	char *buf)
-{
-	pr_info("This interface sysfs will be removed in 2014 - used by: %s\n",
-		current->comm);
-	switch (interface->type) {
-	case ACER_AMW0:
-		return sprintf(buf, "AMW0\n");
-	case ACER_AMW0_V2:
-		return sprintf(buf, "AMW0 v2\n");
-	case ACER_WMID:
-		return sprintf(buf, "WMID\n");
-	case ACER_WMID_v2:
-		return sprintf(buf, "WMID v2\n");
-	default:
-		return sprintf(buf, "Error!\n");
-	}
-}
-
-static DEVICE_ATTR(interface, S_IRUGO, show_interface, NULL);
-
 static void acer_wmi_notify(u32 value, void *context)
 {
 	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -2126,39 +2074,6 @@ static struct platform_driver acer_platform_driver = {
 
 static struct platform_device *acer_platform_device;
 
-static int remove_sysfs(struct platform_device *device)
-{
-	if (has_cap(ACER_CAP_THREEG))
-		device_remove_file(&device->dev, &dev_attr_threeg);
-
-	device_remove_file(&device->dev, &dev_attr_interface);
-
-	return 0;
-}
-
-static int __init create_sysfs(void)
-{
-	int retval = -ENOMEM;
-
-	if (has_cap(ACER_CAP_THREEG)) {
-		retval = device_create_file(&acer_platform_device->dev,
-			&dev_attr_threeg);
-		if (retval)
-			goto error_sysfs;
-	}
-
-	retval = device_create_file(&acer_platform_device->dev,
-		&dev_attr_interface);
-	if (retval)
-		goto error_sysfs;
-
-	return 0;
-
-error_sysfs:
-		remove_sysfs(acer_platform_device);
-	return retval;
-}
-
 static void remove_debugfs(void)
 {
 	debugfs_remove(interface->debug.devices);
@@ -2289,10 +2204,6 @@ static int __init acer_wmi_init(void)
 	if (err)
 		goto error_device_add;
 
-	err = create_sysfs();
-	if (err)
-		goto error_create_sys;
-
 	if (wmi_has_guid(WMID_GUID2)) {
 		interface->debug.wmid_devices = get_wmid_devices();
 		err = create_debugfs();
@@ -2306,8 +2217,6 @@ static int __init acer_wmi_init(void)
 	return 0;
 
 error_create_debugfs:
-	remove_sysfs(acer_platform_device);
-error_create_sys:
 	platform_device_del(acer_platform_device);
 error_device_add:
 	platform_device_put(acer_platform_device);
@@ -2330,7 +2239,6 @@ static void __exit acer_wmi_exit(void)
 	if (has_cap(ACER_CAP_ACCEL))
 		acer_wmi_accel_destroy();
 
-	remove_sysfs(acer_platform_device);
 	remove_debugfs();
 	platform_device_unregister(acer_platform_device);
 	platform_driver_unregister(&acer_platform_driver);
-- 
2.1.4
