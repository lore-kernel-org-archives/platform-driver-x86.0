From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 2/3] toshiba_acpi: Remove the position sysfs entry
Date: Sun, 19 Jun 2016 17:27:02 -0600
Message-ID: <20160619232703.8820-2-coproscefalo@gmail.com>
References: <20160619232703.8820-1-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f195.google.com ([209.85.214.195]:33414 "EHLO
	mail-ob0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751405AbcFSX1I (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 19 Jun 2016 19:27:08 -0400
In-Reply-To: <20160619232703.8820-1-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Now that we have proper support for the acceleromeer under the IIO
subsystem, the _position_ sysfs file is now deprecated.

This patch removes all code related to the position sysfs entry.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 7949929..a9760d2 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1961,28 +1961,6 @@ static ssize_t touchpad_show(struct device *dev,
 }
 static DEVICE_ATTR_RW(touchpad);
 
-static ssize_t position_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
-{
-	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
-	u32 xyval, zval, tmp;
-	u16 x, y, z;
-	int ret;
-
-	xyval = zval = 0;
-	ret = toshiba_accelerometer_get(toshiba, &xyval, &zval);
-	if (ret < 0)
-		return ret;
-
-	x = xyval & HCI_ACCEL_MASK;
-	tmp = xyval >> HCI_MISC_SHIFT;
-	y = tmp & HCI_ACCEL_MASK;
-	z = zval & HCI_ACCEL_MASK;
-
-	return sprintf(buf, "%d %d %d\n", x, y, z);
-}
-static DEVICE_ATTR_RO(position);
-
 static ssize_t usb_sleep_charge_show(struct device *dev,
 				     struct device_attribute *attr, char *buf)
 {
@@ -2353,7 +2331,6 @@ static struct attribute *toshiba_attributes[] = {
 	&dev_attr_available_kbd_modes.attr,
 	&dev_attr_kbd_backlight_timeout.attr,
 	&dev_attr_touchpad.attr,
-	&dev_attr_position.attr,
 	&dev_attr_usb_sleep_charge.attr,
 	&dev_attr_sleep_functions_on_battery.attr,
 	&dev_attr_usb_rapid_charge.attr,
@@ -2380,8 +2357,6 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 		exists = (drv->kbd_mode == SCI_KBD_MODE_AUTO) ? true : false;
 	else if (attr == &dev_attr_touchpad.attr)
 		exists = (drv->touchpad_supported) ? true : false;
-	else if (attr == &dev_attr_position.attr)
-		exists = (drv->accelerometer_supported) ? true : false;
 	else if (attr == &dev_attr_usb_sleep_charge.attr)
 		exists = (drv->usb_sleep_charge_supported) ? true : false;
 	else if (attr == &dev_attr_sleep_functions_on_battery.attr)
-- 
2.8.4
