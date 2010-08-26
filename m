From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] asus-laptop: use attribute group to manage attributes
Date: Thu, 26 Aug 2010 00:12:19 -0700
Message-ID: <20100826071218.GB7788@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:45208 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752713Ab0HZHMY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 03:12:24 -0400
Received: by pvg2 with SMTP id 2so528244pvg.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2010 00:12:23 -0700 (PDT)
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Corentin Chary <corentincj@iksaif.net>, platform-driver-x86@vger.kernel.org

Instead of registering (and removing) every attribute individually
switch to using sysfs attribute group. This makes sure that we
properly unwind and do not try to remove non-existent attributes which
may not be safe to do in the future.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/asus-laptop.c |  111 ++++++++++++++++--------------------
 1 files changed, 50 insertions(+), 61 deletions(-)


diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 56e162b..b5ef470 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1199,82 +1199,70 @@ static void asus_acpi_notify(struct acpi_device *device, u32 event)
 
 static DEVICE_ATTR(infos, S_IRUGO, show_infos, NULL);
 static DEVICE_ATTR(wlan, S_IRUGO | S_IWUSR, show_wlan, store_wlan);
-static DEVICE_ATTR(bluetooth, S_IRUGO | S_IWUSR, show_bluetooth,
-		   store_bluetooth);
+static DEVICE_ATTR(bluetooth, S_IRUGO | S_IWUSR,
+		   show_bluetooth, store_bluetooth);
 static DEVICE_ATTR(display, S_IRUGO | S_IWUSR, show_disp, store_disp);
 static DEVICE_ATTR(ledd, S_IRUGO | S_IWUSR, show_ledd, store_ledd);
 static DEVICE_ATTR(ls_level, S_IRUGO | S_IWUSR, show_lslvl, store_lslvl);
 static DEVICE_ATTR(ls_switch, S_IRUGO | S_IWUSR, show_lssw, store_lssw);
 static DEVICE_ATTR(gps, S_IRUGO | S_IWUSR, show_gps, store_gps);
 
-static void asus_sysfs_exit(struct asus_laptop *asus)
-{
-	struct platform_device *device = asus->platform_device;
-
-	device_remove_file(&device->dev, &dev_attr_infos);
-	device_remove_file(&device->dev, &dev_attr_wlan);
-	device_remove_file(&device->dev, &dev_attr_bluetooth);
-	device_remove_file(&device->dev, &dev_attr_display);
-	device_remove_file(&device->dev, &dev_attr_ledd);
-	device_remove_file(&device->dev, &dev_attr_ls_switch);
-	device_remove_file(&device->dev, &dev_attr_ls_level);
-	device_remove_file(&device->dev, &dev_attr_gps);
-}
+static struct attribute *asus_attributes[] = {
+	&dev_attr_infos.attr,
+	&dev_attr_wlan.attr,
+	&dev_attr_bluetooth.attr,
+	&dev_attr_display.attr,
+	&dev_attr_ledd.attr,
+	&dev_attr_ls_level.attr,
+	&dev_attr_ls_switch.attr,
+	&dev_attr_gps.attr,
+	NULL
+};
 
-static int asus_sysfs_init(struct asus_laptop *asus)
+static mode_t asus_sysfs_is_visible(struct kobject *kobj,
+				    struct attribute *attr,
+				    int idx)
 {
-	struct platform_device *device = asus->platform_device;
-	int err;
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct platform_device *pdev = to_platform_device(dev);
+	struct asus_laptop *asus = platform_get_drvdata(pdev);
+	acpi_handle handle = asus->handle;
+	bool supported;
 
-	err = device_create_file(&device->dev, &dev_attr_infos);
-	if (err)
-		return err;
+	if (attr == &dev_attr_wlan.attr) {
+		supported = !acpi_check_handle(handle, METHOD_WLAN, NULL);
 
-	if (!acpi_check_handle(asus->handle, METHOD_WLAN, NULL)) {
-		err = device_create_file(&device->dev, &dev_attr_wlan);
-		if (err)
-			return err;
-	}
+	} else if (attr == &dev_attr_bluetooth.attr) {
+		supported = !acpi_check_handle(handle, METHOD_BLUETOOTH, NULL);
 
-	if (!acpi_check_handle(asus->handle, METHOD_BLUETOOTH, NULL)) {
-		err = device_create_file(&device->dev, &dev_attr_bluetooth);
-		if (err)
-			return err;
-	}
+	} else if (attr == &dev_attr_display.attr) {
+		supported = !acpi_check_handle(handle, METHOD_SWITCH_DISPLAY, NULL);
 
-	if (!acpi_check_handle(asus->handle, METHOD_SWITCH_DISPLAY, NULL)) {
-		err = device_create_file(&device->dev, &dev_attr_display);
-		if (err)
-			return err;
-	}
+	} else if (attr == &dev_attr_ledd.attr) {
+		supported = !acpi_check_handle(handle, METHOD_LEDD, NULL);
 
-	if (!acpi_check_handle(asus->handle, METHOD_LEDD, NULL)) {
-		err = device_create_file(&device->dev, &dev_attr_ledd);
-		if (err)
-			return err;
-	}
+	} else if (attr == &dev_attr_ls_switch.attr ||
+		   attr == &dev_attr_ls_level.attr) {
+		supported = !acpi_check_handle(handle, METHOD_ALS_CONTROL, NULL) &&
+			    !acpi_check_handle(handle, METHOD_ALS_LEVEL, NULL);
 
-	if (!acpi_check_handle(asus->handle, METHOD_ALS_CONTROL, NULL) &&
-	    !acpi_check_handle(asus->handle, METHOD_ALS_LEVEL, NULL)) {
-		err = device_create_file(&device->dev, &dev_attr_ls_switch);
-		if (err)
-			return err;
-		err = device_create_file(&device->dev, &dev_attr_ls_level);
-		if (err)
-			return err;
+	} else if (attr == &dev_attr_gps.attr) {
+		supported = !acpi_check_handle(handle, METHOD_GPS_ON, NULL) &&
+			    !acpi_check_handle(handle, METHOD_GPS_OFF, NULL) &&
+			    !acpi_check_handle(handle, METHOD_GPS_STATUS, NULL);
+	} else {
+		supported = true;
 	}
 
-	if (!acpi_check_handle(asus->handle, METHOD_GPS_ON, NULL) &&
-	    !acpi_check_handle(asus->handle, METHOD_GPS_OFF, NULL) &&
-	    !acpi_check_handle(asus->handle, METHOD_GPS_STATUS, NULL)) {
-		err = device_create_file(&device->dev, &dev_attr_gps);
-		if (err)
-			return err;
-	}
-
-	return err;
+	return supported ? attr->mode : 0;
 }
 
+
+static const struct attribute_group asus_attr_group = {
+	.is_visible	= asus_sysfs_is_visible,
+	.attrs		= asus_attributes,
+};
+
 static int asus_platform_init(struct asus_laptop *asus)
 {
 	int err;
@@ -1288,13 +1276,14 @@ static int asus_platform_init(struct asus_laptop *asus)
 	if (err)
 		goto fail_platform_device;
 
-	err = asus_sysfs_init(asus);
+	err = sysfs_create_group(&asus->platform_device->dev.kobj,
+				 &asus_attr_group);
 	if (err)
 		goto fail_sysfs;
+
 	return 0;
 
 fail_sysfs:
-	asus_sysfs_exit(asus);
 	platform_device_del(asus->platform_device);
 fail_platform_device:
 	platform_device_put(asus->platform_device);
@@ -1303,7 +1292,7 @@ fail_platform_device:
 
 static void asus_platform_exit(struct asus_laptop *asus)
 {
-	asus_sysfs_exit(asus);
+	sysfs_remove_group(&asus->platform_device->dev.kobj, &asus_attr_group);
 	platform_device_unregister(asus->platform_device);
 }
 
