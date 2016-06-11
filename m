From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/3] toshiba_acpi: Remove the position sysfs entry
Date: Sat, 11 Jun 2016 12:52:44 -0600
Message-ID: <20160611185245.14155-2-coproscefalo@gmail.com>
References: <20160611185245.14155-1-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160611185245.14155-1-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Now that we have proper support for the acceleromeer under the IIO
subsystem, the _position_ sysfs file is now deprecated.

This patch removes all code related to the position sysfs entry.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 85014a3..818b960 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1961,32 +1961,6 @@ static ssize_t touchpad_show(struct device *dev,
 }
 static DEVICE_ATTR_RW(touchpad);
 
-static ssize_t position_show(struct device *dev,
-			     struct device_attribute *attr, char *buf)
-{
-	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
-	u32 xyval, zval;
-	int x, y, z;
-	int ret;
-
-	xyval = zval = 0;
-	ret = toshiba_accelerometer_get(toshiba, &xyval, &zval);
-	if (ret < 0)
-		return ret;
-
-	/* Accelerometer values */
-	x = xyval & HCI_ACCEL_MASK;
-	y = (xyval >> HCI_MISC_SHIFT) & HCI_ACCEL_MASK;
-	z = zval & HCI_ACCEL_MASK;
-	/* Movement direction */
-	x *= xyval & HCI_ACCEL_DIRECTION_MASK ? -1 : 1;
-	y *= (xyval >> HCI_MISC_SHIFT) & HCI_ACCEL_DIRECTION_MASK ? -1 : 1;
-	z *= zval & HCI_ACCEL_DIRECTION_MASK ? -1 : 1;
-
-	return sprintf(buf, "%d %d %d\n", x, y, z);
-}
-static DEVICE_ATTR_RO(position);
-
 static ssize_t usb_sleep_charge_show(struct device *dev,
 				     struct device_attribute *attr, char *buf)
 {
@@ -2357,7 +2331,6 @@ static struct attribute *toshiba_attributes[] = {
 	&dev_attr_available_kbd_modes.attr,
 	&dev_attr_kbd_backlight_timeout.attr,
 	&dev_attr_touchpad.attr,
-	&dev_attr_position.attr,
 	&dev_attr_usb_sleep_charge.attr,
 	&dev_attr_sleep_functions_on_battery.attr,
 	&dev_attr_usb_rapid_charge.attr,
@@ -2384,8 +2357,6 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 		exists = (drv->kbd_mode == SCI_KBD_MODE_AUTO) ? true : false;
 	else if (attr == &dev_attr_touchpad.attr)
 		exists = (drv->touchpad_supported) ? true : false;
-	else if (attr == &dev_attr_position.attr)
-		exists = (drv->accelerometer_supported) ? true : false;
 	else if (attr == &dev_attr_usb_sleep_charge.attr)
 		exists = (drv->usb_sleep_charge_supported) ? true : false;
 	else if (attr == &dev_attr_sleep_functions_on_battery.attr)
-- 
2.8.3
