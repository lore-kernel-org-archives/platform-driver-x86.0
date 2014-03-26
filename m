From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 4/7] toshiba_acpi: Add touchpad enable/disable support-
Date: Tue, 25 Mar 2014 20:38:32 -0600
Message-ID: <1395801515-2333-5-git-send-email-coproscefalo@gmail.com>
References: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:63889 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314AbaCZCjO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Mar 2014 22:39:14 -0400
Received: by mail-oa0-f47.google.com with SMTP id i11so1750407oag.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2014 19:39:14 -0700 (PDT)
In-Reply-To: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Toshiba laptops have two ways of letting userspace
know the touchpad has changed state, one with a
button on top of the touchpad that simply emmits
scancodes whenever enabled/disabled, and another one
by pressing Fn-F9 (touchpad toggle) hotkey.

This patch adds support to enable/disable the touchpad
by exposing the _touchpad_ file in sysfs that simply
makes a call to a SCI register, imitating what
Toshiba provided software does on Windows.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 81 +++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 95ae1ff..08c5376 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -114,6 +114,7 @@ MODULE_LICENSE("GPL");
 #define HCI_KBD_ILLUMINATION		0x0095
 #define SCI_ILLUMINATION		0x014e
 #define SCI_KBD_ILLUM_STATUS		0x015c
+#define SCI_TOUCHPAD			0x050e
 
 /* field definitions */
 #define HCI_HOTKEY_DISABLE		0x0b
@@ -157,6 +158,7 @@ struct toshiba_acpi_dev {
 	unsigned int tr_backlight_supported:1;
 	unsigned int kbd_illum_supported:1;
 	unsigned int kbd_led_registered:1;
+	unsigned int touchpad_supported:1;
 	unsigned int sysfs_created:1;
 
 	struct mutex mutex;
@@ -527,6 +529,47 @@ static void toshiba_kbd_backlight_set(struct led_classdev *cdev,
 		return;
 	}
 }
+ 
+/* TouchPad support */
+static int toshiba_touchpad_set(struct toshiba_acpi_dev *dev, u32 state)
+{
+	u32 result;
+	acpi_status status;
+
+	if (!sci_open(dev))
+		return -EIO;
+
+	status = sci_write(dev, SCI_TOUCHPAD, state, &result);
+	sci_close(dev);
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI call to set the touchpad failed\n");
+		return -EIO;
+	} else if (result == HCI_NOT_SUPPORTED) {
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *state)
+{
+	u32 result;
+	acpi_status status;
+
+	if (!sci_open(dev))
+		return -EIO;
+
+	status = sci_read(dev, SCI_TOUCHPAD, state, &result);
+	sci_close(dev);
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI call to query the touchpad failed\n");
+		return -EIO;
+	} else if (result == HCI_NOT_SUPPORTED) {
+		return -ENODEV;
+	}
+
+	return 0;
+}
 
 /* Bluetooth rfkill handlers */
 
@@ -1130,15 +1173,48 @@ static ssize_t toshiba_kbd_bl_timeout_show(struct device *dev,
 
 	return sprintf(buf, "%i\n", time >> HCI_MISC_SHIFT);
 }
+ 
+static ssize_t toshiba_touchpad_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	int state;
+
+	/* Set the TouchPad on/off, 0 - Disable | 1 - Enable */
+	if (sscanf(buf, "%i", &state) == 1 && (state == 0 || state == 1)) {
+		if (toshiba_touchpad_set(toshiba, state) < 0)
+			return -EIO;
+	}
+
+	return count;
+}
+
+static ssize_t toshiba_touchpad_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	u32 state;
+	int ret;
+
+	ret = toshiba_touchpad_get(toshiba, &state);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%i\n", state);
+}
 
 static DEVICE_ATTR(kbd_backlight_mode, S_IRUGO | S_IWUSR,
 		   toshiba_kbd_bl_mode_show, toshiba_kbd_bl_mode_store);
 static DEVICE_ATTR(kbd_backlight_timeout, S_IRUGO | S_IWUSR,
 		   toshiba_kbd_bl_timeout_show, toshiba_kbd_bl_timeout_store);
+static DEVICE_ATTR(touchpad, S_IRUGO | S_IWUSR,
+		   toshiba_touchpad_show, toshiba_touchpad_store);
 
 static struct attribute *toshiba_attributes[] = {
 	&dev_attr_kbd_backlight_mode.attr,
 	&dev_attr_kbd_backlight_timeout.attr,
+	&dev_attr_touchpad.attr,
 	NULL,
 };
 
@@ -1153,6 +1229,8 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 		exists = (drv->kbd_illum_supported) ? true : false;
 	else if (attr == &dev_attr_kbd_backlight_timeout.attr)
 		exists = (drv->kbd_mode == SCI_KBD_MODE_AUTO) ? true : false;
+	else if (attr == &dev_attr_touchpad.attr)
+		exists = (drv->touchpad_supported) ? true : false;
 
 	return exists ? attr->mode : 0;
 }
@@ -1496,6 +1574,9 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 		if (!led_classdev_register(&dev->acpi_dev->dev, &dev->kbd_led))
 			dev->kbd_led_registered = 1;
 	}
+ 
+	ret = toshiba_touchpad_get(dev, &dummy);
+	dev->touchpad_supported = !ret;
 
 	/* Determine whether or not BIOS supports fan and video interfaces */
 
-- 
1.9.1
