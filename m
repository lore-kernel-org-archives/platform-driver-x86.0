From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 6/7] toshiba_acpi: Add accelerometer support
Date: Tue, 25 Mar 2014 20:38:34 -0600
Message-ID: <1395801515-2333-7-git-send-email-coproscefalo@gmail.com>
References: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f52.google.com ([209.85.219.52]:38217 "EHLO
	mail-oa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314AbaCZCjR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Mar 2014 22:39:17 -0400
Received: by mail-oa0-f52.google.com with SMTP id l6so1753439oag.39
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2014 19:39:16 -0700 (PDT)
In-Reply-To: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Recent Toshiba laptops now come equiped with a built in
accelerometer (TOS620A) device, but such device does not
expose the axes information, however, HCI calls 0x006d
and 0x00a6 can be used to query such info.

This patch adds support to read the axes values by
exposing them through the _position_ sysfs file.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 80 +++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index c8e8bfb..c971b0f 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -97,6 +97,8 @@ MODULE_LICENSE("GPL");
 #define HCI_FAILURE			0x1000
 #define HCI_NOT_SUPPORTED		0x8000
 #define HCI_EMPTY			0x8c00
+#define HCI_DATA_NOT_AVAILABLE		0x8d20
+#define HCI_NOT_INITIALIZED		0x8d50
 #define SCI_OPEN_CLOSE_OK		0x0044
 #define SCI_ALREADY_OPEN		0x8100
 #define SCI_NOT_OPENED			0x8200
@@ -111,13 +113,16 @@ MODULE_LICENSE("GPL");
 #define HCI_HOTKEY_EVENT		0x001e
 #define HCI_LCD_BRIGHTNESS		0x002a
 #define HCI_WIRELESS			0x0056
+#define HCI_ACCELEROMETER		0x006d
 #define HCI_KBD_ILLUMINATION		0x0095
 #define HCI_ECO_MODE			0x0097
+#define HCI_ACCELEROMETER2		0x00a6
 #define SCI_ILLUMINATION		0x014e
 #define SCI_KBD_ILLUM_STATUS		0x015c
 #define SCI_TOUCHPAD			0x050e
 
 /* field definitions */
+#define HCI_ACCEL_MASK			0x7fff
 #define HCI_HOTKEY_DISABLE		0x0b
 #define HCI_HOTKEY_ENABLE		0x09
 #define HCI_LCD_BRIGHTNESS_BITS		3
@@ -162,6 +167,7 @@ struct toshiba_acpi_dev {
 	unsigned int kbd_led_registered:1;
 	unsigned int touchpad_supported:1;
 	unsigned int eco_supported:1;
+	unsigned int accelerometer_supported:1;
 	unsigned int sysfs_created:1;
 
 	struct mutex mutex;
@@ -624,6 +630,52 @@ static void toshiba_eco_mode_set_status(struct led_classdev *cdev,
 		return;
 	}
 }
+ 
+/* Accelerometer support */
+static int toshiba_accelerometer_supported(struct toshiba_acpi_dev *dev)
+{
+	u32 in[HCI_WORDS] = { HCI_GET, HCI_ACCELEROMETER2, 0, 0, 0, 0 };
+	u32 out[HCI_WORDS];
+	acpi_status status;
+
+	/* Check if the accelerometer call exists,
+	 * this call also serves as initialization
+	 */
+	status = hci_raw(dev, in, out);
+	if (ACPI_FAILURE(status) || out[0] == SCI_INPUT_DATA_ERROR) {
+		pr_err("ACPI call to query the accelerometer failed\n");
+		return -EIO;
+	} else if (out[0] == HCI_DATA_NOT_AVAILABLE ||
+		   out[0] == HCI_NOT_INITIALIZED) {
+		pr_err("Accelerometer not initialized\n");
+		return -EIO;
+	} else if (out[0] == HCI_NOT_SUPPORTED) {
+		pr_info("Accelerometer not supported\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int toshiba_accelerometer_get(struct toshiba_acpi_dev *dev,
+				      u32 *xy, u32 *z)
+{
+	u32 in[HCI_WORDS] = { HCI_GET, HCI_ACCELEROMETER, 0, 1, 0, 0 };
+	u32 out[HCI_WORDS];
+	acpi_status status;
+
+	/* Check the Accelerometer status */
+	status = hci_raw(dev, in, out);
+	if (ACPI_FAILURE(status) || out[0] == SCI_INPUT_DATA_ERROR) {
+		pr_err("ACPI call to query the accelerometer failed\n");
+		return -EIO;
+	}
+
+	*xy = out[2];
+	*z = out[4];
+
+	return 0;
+}
 
 /* Bluetooth rfkill handlers */
 
@@ -1257,6 +1309,27 @@ static ssize_t toshiba_touchpad_show(struct device *dev,
 
 	return sprintf(buf, "%i\n", state);
 }
+ 
+static ssize_t toshiba_position_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	u32 xyval, zval, tmp;
+	u16 x, y, z;
+	int ret;
+
+	xyval = zval = 0;
+	ret = toshiba_accelerometer_get(toshiba, &xyval, &zval);
+	if (ret < 0)
+		return ret;
+
+	x = xyval & HCI_ACCEL_MASK;
+	tmp = xyval >> HCI_MISC_SHIFT;
+	y = tmp & HCI_ACCEL_MASK;
+	z = zval & HCI_ACCEL_MASK;
+
+	return sprintf(buf, "%d %d %d\n", x, y, z);
+}
 
 static DEVICE_ATTR(kbd_backlight_mode, S_IRUGO | S_IWUSR,
 		   toshiba_kbd_bl_mode_show, toshiba_kbd_bl_mode_store);
@@ -1264,11 +1337,13 @@ static DEVICE_ATTR(kbd_backlight_timeout, S_IRUGO | S_IWUSR,
 		   toshiba_kbd_bl_timeout_show, toshiba_kbd_bl_timeout_store);
 static DEVICE_ATTR(touchpad, S_IRUGO | S_IWUSR,
 		   toshiba_touchpad_show, toshiba_touchpad_store);
+static DEVICE_ATTR(position, S_IRUGO, toshiba_position_show, NULL);
 
 static struct attribute *toshiba_attributes[] = {
 	&dev_attr_kbd_backlight_mode.attr,
 	&dev_attr_kbd_backlight_timeout.attr,
 	&dev_attr_touchpad.attr,
+	&dev_attr_position.attr,
 	NULL,
 };
 
@@ -1285,6 +1360,8 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 		exists = (drv->kbd_mode == SCI_KBD_MODE_AUTO) ? true : false;
 	else if (attr == &dev_attr_touchpad.attr)
 		exists = (drv->touchpad_supported) ? true : false;
+	else if (attr == &dev_attr_position.attr)
+		exists = (drv->accelerometer_supported) ? true : false;
 
 	return exists ? attr->mode : 0;
 }
@@ -1643,6 +1720,9 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
  
 	ret = toshiba_touchpad_get(dev, &dummy);
 	dev->touchpad_supported = !ret;
+ 
+	ret = toshiba_accelerometer_supported(dev);
+	dev->accelerometer_supported = !ret;
 
 	/* Determine whether or not BIOS supports fan and video interfaces */
 
-- 
1.9.1
