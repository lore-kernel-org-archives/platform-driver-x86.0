From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/6] toshiba_acpi: Add fan entry to sysfs
Date: Sat, 31 Jan 2015 12:41:24 -0700
Message-ID: <1422733288-11733-3-git-send-email-coproscefalo@gmail.com>
References: <1422733288-11733-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422733288-11733-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch adds a fan entry to sysfs, enabling the user to get and
set the fan status.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 51 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 334b65e..413af60 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1516,6 +1516,11 @@ static const struct backlight_ops toshiba_backlight_data = {
  */
 static ssize_t toshiba_version_show(struct device *dev,
 				    struct device_attribute *attr, char *buf);
+static ssize_t toshiba_fan_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count);
+static ssize_t toshiba_fan_show(struct device *dev,
+				struct device_attribute *attr, char *buf);
 static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
 					 struct device_attribute *attr,
 					 const char *buf, size_t count);
@@ -1569,6 +1574,8 @@ static ssize_t toshiba_usb_sleep_music_store(struct device *dev,
 					     const char *buf, size_t count);
 
 static DEVICE_ATTR(version, S_IRUGO, toshiba_version_show, NULL);
+static DEVICE_ATTR(fan, S_IRUGO | S_IWUSR,
+		   toshiba_fan_show, toshiba_fan_store);
 static DEVICE_ATTR(kbd_backlight_mode, S_IRUGO | S_IWUSR,
 		   toshiba_kbd_bl_mode_show, toshiba_kbd_bl_mode_store);
 static DEVICE_ATTR(kbd_type, S_IRUGO, toshiba_kbd_type_show, NULL);
@@ -1594,6 +1601,7 @@ static DEVICE_ATTR(usb_sleep_music, S_IRUGO | S_IWUSR,
 
 static struct attribute *toshiba_attributes[] = {
 	&dev_attr_version.attr,
+	&dev_attr_fan.attr,
 	&dev_attr_kbd_backlight_mode.attr,
 	&dev_attr_kbd_type.attr,
 	&dev_attr_available_kbd_modes.attr,
@@ -1621,6 +1629,45 @@ static ssize_t toshiba_version_show(struct device *dev,
 	return sprintf(buf, "%s\n", TOSHIBA_ACPI_VERSION);
 }
 
+static ssize_t toshiba_fan_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	u32 result;
+	int state;
+	int ret;
+
+	ret = kstrtoint(buf, 0, &state);
+	if (ret)
+		return ret;
+
+	if (state != 0 && state != 1)
+		return -EINVAL;
+
+	result = hci_write1(toshiba, HCI_FAN, state);
+	if (result == TOS_FAILURE)
+		return -EIO;
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	return count;
+}
+
+static ssize_t toshiba_fan_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	u32 value;
+	int ret;
+
+	ret = get_fan_status(toshiba, &value);
+	if (ret)
+		return ret;
+
+	return sprintf(buf, "%d\n", value);
+}
+
 static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
 					 struct device_attribute *attr,
 					 const char *buf, size_t count)
@@ -2017,7 +2064,9 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 	struct toshiba_acpi_dev *drv = dev_get_drvdata(dev);
 	bool exists = true;
 
-	if (attr == &dev_attr_kbd_backlight_mode.attr)
+	if (attr == &dev_attr_fan.attr)
+		exists = (drv->fan_supported) ? true : false;
+	else if (attr == &dev_attr_kbd_backlight_mode.attr)
 		exists = (drv->kbd_illum_supported) ? true : false;
 	else if (attr == &dev_attr_kbd_backlight_timeout.attr)
 		exists = (drv->kbd_mode == SCI_KBD_MODE_AUTO) ? true : false;
-- 
2.2.2
