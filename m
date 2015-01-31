From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 3/6] toshiba_acpi: Add support for Keyboard functions mode
Date: Sat, 31 Jan 2015 12:41:25 -0700
Message-ID: <1422733288-11733-4-git-send-email-coproscefalo@gmail.com>
References: <1422733288-11733-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422733288-11733-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Recent Toshiba laptops that come with the new keyboard layout have
the Special Functions (hotkeys) enabled by default, which, in order to
access the F{1-12} keys, you need to press the FN-F{1-12} key to
access such key.

This patch adds support to toggle the Keyboard Functions operation
mode by creating the sysfs entry "kbd_functions_keys", accepting only
two parameters, 0 to set the "Normal Operation" mode and 1 to set the
"Special Functions" mode, however, everytime the mode is toggled, a
restart is needed.

In the "Normal Operation" mode, the F{1-12} keys are as usual and
the hotkeys are accessed via FN-F{1-12}.

In the "Special Functions" mode, the F{1-12} keys trigger the hotkey
and the F{1-12} keys are accessed via FN-F{1-12}.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 98 +++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 413af60..c79211a 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -126,6 +126,7 @@ MODULE_LICENSE("GPL");
 #define SCI_KBD_ILLUM_STATUS		0x015c
 #define SCI_USB_SLEEP_MUSIC		0x015e
 #define SCI_TOUCHPAD			0x050e
+#define SCI_KBD_FUNCTION_KEYS		0x0522
 
 /* field definitions */
 #define HCI_ACCEL_MASK			0x7fff
@@ -192,6 +193,7 @@ struct toshiba_acpi_dev {
 	unsigned int usb_sleep_charge_supported:1;
 	unsigned int usb_rapid_charge_supported:1;
 	unsigned int usb_sleep_music_supported:1;
+	unsigned int kbd_function_keys_supported:1;
 	unsigned int sysfs_created:1;
 
 	struct mutex mutex;
@@ -988,6 +990,47 @@ static int toshiba_usb_sleep_music_set(struct toshiba_acpi_dev *dev, u32 state)
 	return 0;
 }
 
+/* Keyboard function keys */
+static int toshiba_function_keys_get(struct toshiba_acpi_dev *dev, u32 *mode)
+{
+	u32 result;
+
+	if (!sci_open(dev))
+		return -EIO;
+
+	result = sci_read(dev, SCI_KBD_FUNCTION_KEYS, mode);
+	sci_close(dev);
+	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
+		pr_err("ACPI call to get KBD function keys failed\n");
+		return -EIO;
+	} else if (result == TOS_NOT_SUPPORTED) {
+		pr_info("KBD function keys not supported\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int toshiba_function_keys_set(struct toshiba_acpi_dev *dev, u32 mode)
+{
+	u32 result;
+
+	if (!sci_open(dev))
+		return -EIO;
+
+	result = sci_write(dev, SCI_KBD_FUNCTION_KEYS, mode);
+	sci_close(dev);
+	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
+		pr_err("ACPI call to set KBD function keys failed\n");
+		return -EIO;
+	} else if (result == TOS_NOT_SUPPORTED) {
+		pr_info("KBD function keys not supported\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 /* Bluetooth rfkill handlers */
 
 static u32 hci_get_bt_present(struct toshiba_acpi_dev *dev, bool *present)
@@ -1572,6 +1615,12 @@ static ssize_t toshiba_usb_sleep_music_show(struct device *dev,
 static ssize_t toshiba_usb_sleep_music_store(struct device *dev,
 					     struct device_attribute *attr,
 					     const char *buf, size_t count);
+static ssize_t toshiba_kbd_function_keys_show(struct device *dev,
+					      struct device_attribute *attr,
+					      char *buf);
+static ssize_t toshiba_kbd_function_keys_store(struct device *dev,
+					       struct device_attribute *attr,
+					       const char *buf, size_t count);
 
 static DEVICE_ATTR(version, S_IRUGO, toshiba_version_show, NULL);
 static DEVICE_ATTR(fan, S_IRUGO | S_IWUSR,
@@ -1598,6 +1647,9 @@ static DEVICE_ATTR(usb_rapid_charge, S_IRUGO | S_IWUSR,
 static DEVICE_ATTR(usb_sleep_music, S_IRUGO | S_IWUSR,
 		   toshiba_usb_sleep_music_show,
 		   toshiba_usb_sleep_music_store);
+static DEVICE_ATTR(kbd_function_keys, S_IRUGO | S_IWUSR,
+		   toshiba_kbd_function_keys_show,
+		   toshiba_kbd_function_keys_store);
 
 static struct attribute *toshiba_attributes[] = {
 	&dev_attr_version.attr,
@@ -1612,6 +1664,7 @@ static struct attribute *toshiba_attributes[] = {
 	&dev_attr_sleep_functions_on_battery.attr,
 	&dev_attr_usb_rapid_charge.attr,
 	&dev_attr_usb_sleep_music.attr,
+	&dev_attr_kbd_function_keys.attr,
 	NULL,
 };
 
@@ -2057,6 +2110,46 @@ static ssize_t toshiba_usb_sleep_music_store(struct device *dev,
 	return count;
 }
 
+static ssize_t toshiba_kbd_function_keys_show(struct device *dev,
+					      struct device_attribute *attr,
+					      char *buf)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	int mode;
+	int ret;
+
+	ret = toshiba_function_keys_get(toshiba, &mode);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", mode);
+}
+
+static ssize_t toshiba_kbd_function_keys_store(struct device *dev,
+					       struct device_attribute *attr,
+					       const char *buf, size_t count)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	int mode;
+	int ret;
+
+	ret = kstrtoint(buf, 0, &mode);
+	if (ret)
+		return ret;
+	/* Check for the function keys mode where:
+	 * 0 - Normal operation (F{1-12} as usual and hotkeys via FN-F{1-12})
+	 * 1 - Special functions (Opposite of the above setting)
+	 */
+	if (mode != 0 && mode != 1)
+		return -EINVAL;
+
+	ret = toshiba_function_keys_set(toshiba, mode);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
 static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 					struct attribute *attr, int idx)
 {
@@ -2082,6 +2175,8 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 		exists = (drv->usb_rapid_charge_supported) ? true : false;
 	else if (attr == &dev_attr_usb_sleep_music.attr)
 		exists = (drv->usb_sleep_music_supported) ? true : false;
+	else if (attr == &dev_attr_kbd_function_keys.attr)
+		exists = (drv->kbd_function_keys_supported) ? true : false;
 
 	return exists ? attr->mode : 0;
 }
@@ -2500,6 +2595,9 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = toshiba_usb_sleep_music_get(dev, &dummy);
 	dev->usb_sleep_music_supported = !ret;
 
+	ret = toshiba_function_keys_get(dev, &dummy);
+	dev->kbd_function_keys_supported = !ret;
+
 	/* Determine whether or not BIOS supports fan and video interfaces */
 
 	ret = get_video_status(dev, &dummy);
-- 
2.2.2
