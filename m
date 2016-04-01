From: Oleksij Rempel <linux@rempel-privat.de>
Subject: [PATCH] asus-wmi: provide access to ALS control
Date: Fri,  1 Apr 2016 13:35:21 +0200
Message-ID: <1459510521-4682-1-git-send-email-linux@rempel-privat.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:59882 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751513AbcDALgH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Apr 2016 07:36:07 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Oleksij Rempel <linux@rempel-privat.de>

Asus Zenbook ux31a is providing ACPI0008 interface for ALS
(Ambient Light Sensor), which is accessible for OS => Win 7.
This sensor can be used with iio/acpi-als driver.
Since it is disabled by default, we should use asus-wmi
interface to enable it.

Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
---
 drivers/platform/x86/asus-wmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a96630d..a26dca3 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -114,6 +114,7 @@ MODULE_LICENSE("GPL");
 #define ASUS_WMI_DEVID_LED6		0x00020016
 
 /* Backlight and Brightness */
+#define ASUS_WMI_DEVID_ALS_ENABLE	0x00050001 /* Ambient Light Sensor */
 #define ASUS_WMI_DEVID_BACKLIGHT	0x00050011
 #define ASUS_WMI_DEVID_BRIGHTNESS	0x00050012
 #define ASUS_WMI_DEVID_KBD_BACKLIGHT	0x00050021
@@ -1730,6 +1731,7 @@ ASUS_WMI_CREATE_DEVICE_ATTR(touchpad, 0644, ASUS_WMI_DEVID_TOUCHPAD);
 ASUS_WMI_CREATE_DEVICE_ATTR(camera, 0644, ASUS_WMI_DEVID_CAMERA);
 ASUS_WMI_CREATE_DEVICE_ATTR(cardr, 0644, ASUS_WMI_DEVID_CARDREADER);
 ASUS_WMI_CREATE_DEVICE_ATTR(lid_resume, 0644, ASUS_WMI_DEVID_LID_RESUME);
+ASUS_WMI_CREATE_DEVICE_ATTR(als_enable, 0644, ASUS_WMI_DEVID_ALS_ENABLE);
 
 static ssize_t store_cpufv(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t count)
@@ -1756,6 +1758,7 @@ static struct attribute *platform_attributes[] = {
 	&dev_attr_cardr.attr,
 	&dev_attr_touchpad.attr,
 	&dev_attr_lid_resume.attr,
+	&dev_attr_als_enable.attr,
 	NULL
 };
 
@@ -1776,6 +1779,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 		devid = ASUS_WMI_DEVID_TOUCHPAD;
 	else if (attr == &dev_attr_lid_resume.attr)
 		devid = ASUS_WMI_DEVID_LID_RESUME;
+	else if (attr == &dev_attr_als_enable.attr)
+		devid = ASUS_WMI_DEVID_ALS_ENABLE;
 
 	if (devid != -1)
 		ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
-- 
2.5.0
