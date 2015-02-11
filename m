From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 4/6] toshiba_acpi: Add support for Panel Power ON
Date: Tue, 10 Feb 2015 21:09:19 -0700
Message-ID: <1423627761-3415-5-git-send-email-coproscefalo@gmail.com>
References: <1423627761-3415-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423627761-3415-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Toshiba laptops come with a feature called "Panel Open - Power ON",
which makes the laptop turn on whenever the LID is opened.

This patch adds support for such feature, by creating a sysfs entry
named "panel_power_on", accepting only two values, 0 to disable and
1 to enable such feature, however, a reboot is needed on every mode
change.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 100 ++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 13b4a2b..41f58f2 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -121,6 +121,7 @@ MODULE_LICENSE("GPL");
 #define HCI_KBD_ILLUMINATION		0x0095
 #define HCI_ECO_MODE			0x0097
 #define HCI_ACCELEROMETER2		0x00a6
+#define SCI_PANEL_POWER_ON		0x010d
 #define SCI_ILLUMINATION		0x014e
 #define SCI_USB_SLEEP_CHARGE		0x0150
 #define SCI_KBD_ILLUM_STATUS		0x015c
@@ -194,6 +195,7 @@ struct toshiba_acpi_dev {
 	unsigned int usb_rapid_charge_supported:1;
 	unsigned int usb_sleep_music_supported:1;
 	unsigned int kbd_function_keys_supported:1;
+	unsigned int panel_power_on_supported:1;
 	unsigned int sysfs_created:1;
 
 	struct mutex mutex;
@@ -1031,6 +1033,51 @@ static int toshiba_function_keys_set(struct toshiba_acpi_dev *dev, u32 mode)
 	return 0;
 }
 
+/* Panel Power ON */
+static int toshiba_panel_power_on_get(struct toshiba_acpi_dev *dev, u32 *state)
+{
+	u32 result;
+
+	if (!sci_open(dev))
+		return -EIO;
+
+	result = sci_read(dev, SCI_PANEL_POWER_ON, state);
+	sci_close(dev);
+	if (result == TOS_FAILURE) {
+		pr_err("ACPI call to get Panel Power ON failed\n");
+		return -EIO;
+	} else if (result == TOS_NOT_SUPPORTED) {
+		pr_info("Panel Power on not supported\n");
+		return -ENODEV;
+	} else if (result == TOS_INPUT_DATA_ERROR) {
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int toshiba_panel_power_on_set(struct toshiba_acpi_dev *dev, u32 state)
+{
+	u32 result;
+
+	if (!sci_open(dev))
+		return -EIO;
+
+	result = sci_write(dev, SCI_PANEL_POWER_ON, state);
+	sci_close(dev);
+	if (result == TOS_FAILURE) {
+		pr_err("ACPI call to set Panel Power ON failed\n");
+		return -EIO;
+	} else if (result == TOS_NOT_SUPPORTED) {
+		pr_info("Panel Power ON not supported\n");
+		return -ENODEV;
+	} else if (result == TOS_INPUT_DATA_ERROR) {
+		return -EIO;
+	}
+
+	return 0;
+}
+
 /* Bluetooth rfkill handlers */
 
 static u32 hci_get_bt_present(struct toshiba_acpi_dev *dev, bool *present)
@@ -1621,6 +1668,12 @@ static ssize_t toshiba_kbd_function_keys_show(struct device *dev,
 static ssize_t toshiba_kbd_function_keys_store(struct device *dev,
 					       struct device_attribute *attr,
 					       const char *buf, size_t count);
+static ssize_t toshiba_panel_power_on_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf);
+static ssize_t toshiba_panel_power_on_store(struct device *dev,
+					    struct device_attribute *attr,
+					    const char *buf, size_t count);
 
 static DEVICE_ATTR(version, S_IRUGO, toshiba_version_show, NULL);
 static DEVICE_ATTR(fan, S_IRUGO | S_IWUSR,
@@ -1650,6 +1703,9 @@ static DEVICE_ATTR(usb_sleep_music, S_IRUGO | S_IWUSR,
 static DEVICE_ATTR(kbd_function_keys, S_IRUGO | S_IWUSR,
 		   toshiba_kbd_function_keys_show,
 		   toshiba_kbd_function_keys_store);
+static DEVICE_ATTR(panel_power_on, S_IRUGO | S_IWUSR,
+		   toshiba_panel_power_on_show,
+		   toshiba_panel_power_on_store);
 
 static struct attribute *toshiba_attributes[] = {
 	&dev_attr_version.attr,
@@ -1665,6 +1721,7 @@ static struct attribute *toshiba_attributes[] = {
 	&dev_attr_usb_rapid_charge.attr,
 	&dev_attr_usb_sleep_music.attr,
 	&dev_attr_kbd_function_keys.attr,
+	&dev_attr_panel_power_on.attr,
 	NULL,
 };
 
@@ -2152,6 +2209,44 @@ static ssize_t toshiba_kbd_function_keys_store(struct device *dev,
 	return count;
 }
 
+static ssize_t toshiba_panel_power_on_show(struct device *dev,
+					   struct device_attribute *attr,
+					   char *buf)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	u32 state;
+	int ret;
+
+	ret = toshiba_panel_power_on_get(toshiba, &state);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", state);
+}
+
+static ssize_t toshiba_panel_power_on_store(struct device *dev,
+					    struct device_attribute *attr,
+					    const char *buf, size_t count)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	int state;
+	int ret;
+
+	ret = kstrtoint(buf, 0, &state);
+	if (ret)
+		return ret;
+	if (state != 0 && state != 1)
+		return -EINVAL;
+
+	ret = toshiba_panel_power_on_set(toshiba, state);
+	if (ret)
+		return ret;
+
+	pr_info("Reboot for changes to Panel Power ON to take effect");
+
+	return count;
+}
+
 static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 					struct attribute *attr, int idx)
 {
@@ -2179,6 +2274,8 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 		exists = (drv->usb_sleep_music_supported) ? true : false;
 	else if (attr == &dev_attr_kbd_function_keys.attr)
 		exists = (drv->kbd_function_keys_supported) ? true : false;
+	else if (attr == &dev_attr_panel_power_on.attr)
+		exists = (drv->panel_power_on_supported) ? true : false;
 
 	return exists ? attr->mode : 0;
 }
@@ -2600,6 +2697,9 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = toshiba_function_keys_get(dev, &dummy);
 	dev->kbd_function_keys_supported = !ret;
 
+	ret = toshiba_panel_power_on_get(dev, &dummy);
+	dev->panel_power_on_supported = !ret;
+
 	/* Determine whether or not BIOS supports fan and video interfaces */
 
 	ret = get_video_status(dev, &dummy);
-- 
2.2.2
