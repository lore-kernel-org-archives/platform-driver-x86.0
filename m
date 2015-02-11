From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 5/6] toshiba_acpi: Add support to enable/disable USB 3
Date: Tue, 10 Feb 2015 21:09:20 -0700
Message-ID: <1423627761-3415-6-git-send-email-coproscefalo@gmail.com>
References: <1423627761-3415-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423627761-3415-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Toshiba laptops that come with USB 3 ports have a feature that lets
them disable USB 3 functionality and act as a regular USB 2 port, and
thus, saving power.

This patch adds support to that feature, by creating a sysfs entry
named "usb_three", acceptig only two parameters, 0 to disable the
USB 3 (acting as a USB 2) and 1 to enable it, however, a reboot is
needed everytime this is toggled.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 103 ++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 41f58f2..09921de 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -126,6 +126,7 @@ MODULE_LICENSE("GPL");
 #define SCI_USB_SLEEP_CHARGE		0x0150
 #define SCI_KBD_ILLUM_STATUS		0x015c
 #define SCI_USB_SLEEP_MUSIC		0x015e
+#define SCI_USB_THREE			0x0169
 #define SCI_TOUCHPAD			0x050e
 #define SCI_KBD_FUNCTION_KEYS		0x0522
 
@@ -196,6 +197,7 @@ struct toshiba_acpi_dev {
 	unsigned int usb_sleep_music_supported:1;
 	unsigned int kbd_function_keys_supported:1;
 	unsigned int panel_power_on_supported:1;
+	unsigned int usb_three_supported:1;
 	unsigned int sysfs_created:1;
 
 	struct mutex mutex;
@@ -1078,6 +1080,51 @@ static int toshiba_panel_power_on_set(struct toshiba_acpi_dev *dev, u32 state)
 	return 0;
 }
 
+/* USB Three */
+static int toshiba_usb_three_get(struct toshiba_acpi_dev *dev, u32 *state)
+{
+	u32 result;
+
+	if (!sci_open(dev))
+		return -EIO;
+
+	result = sci_read(dev, SCI_USB_THREE, state);
+	sci_close(dev);
+	if (result == TOS_FAILURE) {
+		pr_err("ACPI call to get USB 3 failed\n");
+		return -EIO;
+	} else if (result == TOS_NOT_SUPPORTED) {
+		pr_info("USB 3 not supported\n");
+		return -ENODEV;
+	} else if (result == TOS_INPUT_DATA_ERROR) {
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
+{
+	u32 result;
+
+	if (!sci_open(dev))
+		return -EIO;
+
+	result = sci_write(dev, SCI_USB_THREE, state);
+	sci_close(dev);
+	if (result == TOS_FAILURE) {
+		pr_err("ACPI call to set USB 3 failed\n");
+		return -EIO;
+	} else if (result == TOS_NOT_SUPPORTED) {
+		pr_info("USB 3 not supported\n");
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
@@ -1674,6 +1721,12 @@ static ssize_t toshiba_panel_power_on_show(struct device *dev,
 static ssize_t toshiba_panel_power_on_store(struct device *dev,
 					    struct device_attribute *attr,
 					    const char *buf, size_t count);
+static ssize_t toshiba_usb_three_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf);
+static ssize_t toshiba_usb_three_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count);
 
 static DEVICE_ATTR(version, S_IRUGO, toshiba_version_show, NULL);
 static DEVICE_ATTR(fan, S_IRUGO | S_IWUSR,
@@ -1706,6 +1759,8 @@ static DEVICE_ATTR(kbd_function_keys, S_IRUGO | S_IWUSR,
 static DEVICE_ATTR(panel_power_on, S_IRUGO | S_IWUSR,
 		   toshiba_panel_power_on_show,
 		   toshiba_panel_power_on_store);
+static DEVICE_ATTR(usb_three, S_IRUGO | S_IWUSR,
+		   toshiba_usb_three_show, toshiba_usb_three_store);
 
 static struct attribute *toshiba_attributes[] = {
 	&dev_attr_version.attr,
@@ -1722,6 +1777,7 @@ static struct attribute *toshiba_attributes[] = {
 	&dev_attr_usb_sleep_music.attr,
 	&dev_attr_kbd_function_keys.attr,
 	&dev_attr_panel_power_on.attr,
+	&dev_attr_usb_three.attr,
 	NULL,
 };
 
@@ -2247,6 +2303,48 @@ static ssize_t toshiba_panel_power_on_store(struct device *dev,
 	return count;
 }
 
+static ssize_t toshiba_usb_three_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	u32 state;
+	int ret;
+
+	ret = toshiba_usb_three_get(toshiba, &state);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", state);
+}
+
+static ssize_t toshiba_usb_three_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	int state;
+	int ret;
+
+	ret = kstrtoint(buf, 0, &state);
+	if (ret)
+		return ret;
+	/* Check for USB 3 mode where:
+	 * 0 - Disabled (Acts like a USB 2 port, saving power)
+	 * 1 - Enabled
+	 */
+	if (state != 0 && state != 1)
+		return -EINVAL;
+
+	ret = toshiba_usb_three_set(toshiba, state);
+	if (ret)
+		return ret;
+
+	pr_info("Reboot for changes to USB 3 to take effect");
+
+	return count;
+}
+
 static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 					struct attribute *attr, int idx)
 {
@@ -2276,6 +2374,8 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 		exists = (drv->kbd_function_keys_supported) ? true : false;
 	else if (attr == &dev_attr_panel_power_on.attr)
 		exists = (drv->panel_power_on_supported) ? true : false;
+	else if (attr == &dev_attr_usb_three.attr)
+		exists = (drv->usb_three_supported) ? true : false;
 
 	return exists ? attr->mode : 0;
 }
@@ -2700,6 +2800,9 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = toshiba_panel_power_on_get(dev, &dummy);
 	dev->panel_power_on_supported = !ret;
 
+	ret = toshiba_usb_three_get(dev, &dummy);
+	dev->usb_three_supported = !ret;
+
 	/* Determine whether or not BIOS supports fan and video interfaces */
 
 	ret = get_video_status(dev, &dummy);
-- 
2.2.2
