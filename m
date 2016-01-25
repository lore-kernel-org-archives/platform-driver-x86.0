From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/2] toshiba_acpi: Add sysfs entries for the Cooling Method feature
Date: Mon, 25 Jan 2016 11:29:11 -0700
Message-ID: <1453746551-17496-3-git-send-email-coproscefalo@gmail.com>
References: <1453746551-17496-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453746551-17496-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch adds the sysfs entry

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index c6f92ec..5ace1e0 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2289,6 +2289,54 @@ static ssize_t usb_three_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(usb_three);
 
+static ssize_t cooling_method_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	int state;
+	int ret;
+
+	ret = toshiba_cooling_method_get(toshiba, &state);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d %d\n", state, toshiba->max_cooling_method);
+}
+
+static ssize_t cooling_method_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
+	int state;
+	int ret;
+
+	ret = kstrtoint(buf, 0, &state);
+	if (ret)
+		return ret;
+
+	/*
+	 * Check for supported values
+	 * Depending on the laptop model, some only support these two:
+	 * 0 - Maximum Performance
+	 * 1 - Battery Optimized
+	 *
+	 * While some others support all three methods:
+	 * 0 - Maximum Performance
+	 * 1 - Performance
+	 * 2 - Battery Optimized
+	 */
+	if (state < 0 || state > toshiba->max_cooling_method)
+		return -EINVAL;
+
+	ret = toshiba_cooling_method_set(toshiba, state);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_RW(cooling_method);
+
 static struct attribute *toshiba_attributes[] = {
 	&dev_attr_version.attr,
 	&dev_attr_fan.attr,
@@ -2305,6 +2353,7 @@ static struct attribute *toshiba_attributes[] = {
 	&dev_attr_kbd_function_keys.attr,
 	&dev_attr_panel_power_on.attr,
 	&dev_attr_usb_three.attr,
+	&dev_attr_cooling_method.attr,
 	NULL,
 };
 
@@ -2339,6 +2388,8 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 		exists = (drv->panel_power_on_supported) ? true : false;
 	else if (attr == &dev_attr_usb_three.attr)
 		exists = (drv->usb_three_supported) ? true : false;
+	else if (attr == &dev_attr_cooling_method.attr)
+		exists = (drv->cooling_method_supported) ? true : false;
 
 	return exists ? attr->mode : 0;
 }
-- 
2.7.0
