From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 3/5] toshiba_acpi: Move sysfs function and struct declarations further down
Date: Tue, 10 Feb 2015 23:43:58 -0700
Message-ID: <1423637040-6813-4-git-send-email-coproscefalo@gmail.com>
References: <1423637040-6813-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:59395 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbbBKGoJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Feb 2015 01:44:09 -0500
In-Reply-To: <1423637040-6813-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Commit 93f8c16d635e ("toshiba_acpi: Support new keyboard backlight
type") moved all the sysfs structs and function declarations further
up in order to make use of sysfs_update_group, however,
commit 805469053ba9 ("toshiba_acpi: Add keyboard backlight mode
change event") made use of that function unnecesary.

This patch moves all the sysfs structs and function declarations
further down, making the file shorther in lines and better readable.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 196 +++++++++++-------------------------
 1 file changed, 58 insertions(+), 138 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 016d7ab..818d184 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1660,144 +1660,6 @@ static const struct backlight_ops toshiba_backlight_data = {
  * Sysfs files
  */
 static ssize_t toshiba_version_show(struct device *dev,
-				    struct device_attribute *attr, char *buf);
-static ssize_t toshiba_fan_store(struct device *dev,
-				 struct device_attribute *attr,
-				 const char *buf, size_t count);
-static ssize_t toshiba_fan_show(struct device *dev,
-				struct device_attribute *attr, char *buf);
-static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
-					 struct device_attribute *attr,
-					 const char *buf, size_t count);
-static ssize_t toshiba_kbd_bl_mode_show(struct device *dev,
-					struct device_attribute *attr,
-					char *buf);
-static ssize_t toshiba_kbd_type_show(struct device *dev,
-				     struct device_attribute *attr,
-				     char *buf);
-static ssize_t toshiba_available_kbd_modes_show(struct device *dev,
-					struct device_attribute *attr,
-					char *buf);
-static ssize_t toshiba_kbd_bl_timeout_store(struct device *dev,
-					    struct device_attribute *attr,
-					    const char *buf, size_t count);
-static ssize_t toshiba_kbd_bl_timeout_show(struct device *dev,
-					   struct device_attribute *attr,
-					   char *buf);
-static ssize_t toshiba_touchpad_store(struct device *dev,
-				      struct device_attribute *attr,
-				      const char *buf, size_t count);
-static ssize_t toshiba_touchpad_show(struct device *dev,
-				     struct device_attribute *attr,
-				     char *buf);
-static ssize_t toshiba_position_show(struct device *dev,
-				     struct device_attribute *attr,
-				     char *buf);
-static ssize_t toshiba_usb_sleep_charge_show(struct device *dev,
-					     struct device_attribute *attr,
-					     char *buf);
-static ssize_t toshiba_usb_sleep_charge_store(struct device *dev,
-					      struct device_attribute *attr,
-					      const char *buf, size_t count);
-static ssize_t sleep_functions_on_battery_show(struct device *dev,
-					       struct device_attribute *attr,
-					       char *buf);
-static ssize_t sleep_functions_on_battery_store(struct device *dev,
-						struct device_attribute *attr,
-						const char *buf, size_t count);
-static ssize_t toshiba_usb_rapid_charge_show(struct device *dev,
-					     struct device_attribute *attr,
-					     char *buf);
-static ssize_t toshiba_usb_rapid_charge_store(struct device *dev,
-					      struct device_attribute *attr,
-					      const char *buf, size_t count);
-static ssize_t toshiba_usb_sleep_music_show(struct device *dev,
-					    struct device_attribute *attr,
-					    char *buf);
-static ssize_t toshiba_usb_sleep_music_store(struct device *dev,
-					     struct device_attribute *attr,
-					     const char *buf, size_t count);
-static ssize_t toshiba_kbd_function_keys_show(struct device *dev,
-					      struct device_attribute *attr,
-					      char *buf);
-static ssize_t toshiba_kbd_function_keys_store(struct device *dev,
-					       struct device_attribute *attr,
-					       const char *buf, size_t count);
-static ssize_t toshiba_panel_power_on_show(struct device *dev,
-					   struct device_attribute *attr,
-					   char *buf);
-static ssize_t toshiba_panel_power_on_store(struct device *dev,
-					    struct device_attribute *attr,
-					    const char *buf, size_t count);
-static ssize_t toshiba_usb_three_show(struct device *dev,
-				      struct device_attribute *attr,
-				      char *buf);
-static ssize_t toshiba_usb_three_store(struct device *dev,
-				       struct device_attribute *attr,
-				       const char *buf, size_t count);
-
-static DEVICE_ATTR(version, S_IRUGO, toshiba_version_show, NULL);
-static DEVICE_ATTR(fan, S_IRUGO | S_IWUSR,
-		   toshiba_fan_show, toshiba_fan_store);
-static DEVICE_ATTR(kbd_backlight_mode, S_IRUGO | S_IWUSR,
-		   toshiba_kbd_bl_mode_show, toshiba_kbd_bl_mode_store);
-static DEVICE_ATTR(kbd_type, S_IRUGO, toshiba_kbd_type_show, NULL);
-static DEVICE_ATTR(available_kbd_modes, S_IRUGO,
-		   toshiba_available_kbd_modes_show, NULL);
-static DEVICE_ATTR(kbd_backlight_timeout, S_IRUGO | S_IWUSR,
-		   toshiba_kbd_bl_timeout_show, toshiba_kbd_bl_timeout_store);
-static DEVICE_ATTR(touchpad, S_IRUGO | S_IWUSR,
-		   toshiba_touchpad_show, toshiba_touchpad_store);
-static DEVICE_ATTR(position, S_IRUGO, toshiba_position_show, NULL);
-static DEVICE_ATTR(usb_sleep_charge, S_IRUGO | S_IWUSR,
-		   toshiba_usb_sleep_charge_show,
-		   toshiba_usb_sleep_charge_store);
-static DEVICE_ATTR(sleep_functions_on_battery, S_IRUGO | S_IWUSR,
-		   sleep_functions_on_battery_show,
-		   sleep_functions_on_battery_store);
-static DEVICE_ATTR(usb_rapid_charge, S_IRUGO | S_IWUSR,
-		   toshiba_usb_rapid_charge_show,
-		   toshiba_usb_rapid_charge_store);
-static DEVICE_ATTR(usb_sleep_music, S_IRUGO | S_IWUSR,
-		   toshiba_usb_sleep_music_show,
-		   toshiba_usb_sleep_music_store);
-static DEVICE_ATTR(kbd_function_keys, S_IRUGO | S_IWUSR,
-		   toshiba_kbd_function_keys_show,
-		   toshiba_kbd_function_keys_store);
-static DEVICE_ATTR(panel_power_on, S_IRUGO | S_IWUSR,
-		   toshiba_panel_power_on_show,
-		   toshiba_panel_power_on_store);
-static DEVICE_ATTR(usb_three, S_IRUGO | S_IWUSR,
-		   toshiba_usb_three_show, toshiba_usb_three_store);
-
-static struct attribute *toshiba_attributes[] = {
-	&dev_attr_version.attr,
-	&dev_attr_fan.attr,
-	&dev_attr_kbd_backlight_mode.attr,
-	&dev_attr_kbd_type.attr,
-	&dev_attr_available_kbd_modes.attr,
-	&dev_attr_kbd_backlight_timeout.attr,
-	&dev_attr_touchpad.attr,
-	&dev_attr_position.attr,
-	&dev_attr_usb_sleep_charge.attr,
-	&dev_attr_sleep_functions_on_battery.attr,
-	&dev_attr_usb_rapid_charge.attr,
-	&dev_attr_usb_sleep_music.attr,
-	&dev_attr_kbd_function_keys.attr,
-	&dev_attr_panel_power_on.attr,
-	&dev_attr_usb_three.attr,
-	NULL,
-};
-
-static umode_t toshiba_sysfs_is_visible(struct kobject *,
-					struct attribute *, int);
-
-static struct attribute_group toshiba_attr_group = {
-	.is_visible = toshiba_sysfs_is_visible,
-	.attrs = toshiba_attributes,
-};
-
-static ssize_t toshiba_version_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s\n", TOSHIBA_ACPI_VERSION);
@@ -2353,6 +2215,59 @@ static ssize_t toshiba_usb_three_store(struct device *dev,
 	return count;
 }
 
+static DEVICE_ATTR(version, S_IRUGO, toshiba_version_show, NULL);
+static DEVICE_ATTR(fan, S_IRUGO | S_IWUSR,
+		   toshiba_fan_show, toshiba_fan_store);
+static DEVICE_ATTR(kbd_backlight_mode, S_IRUGO | S_IWUSR,
+		   toshiba_kbd_bl_mode_show, toshiba_kbd_bl_mode_store);
+static DEVICE_ATTR(kbd_type, S_IRUGO, toshiba_kbd_type_show, NULL);
+static DEVICE_ATTR(available_kbd_modes, S_IRUGO,
+		   toshiba_available_kbd_modes_show, NULL);
+static DEVICE_ATTR(kbd_backlight_timeout, S_IRUGO | S_IWUSR,
+		   toshiba_kbd_bl_timeout_show, toshiba_kbd_bl_timeout_store);
+static DEVICE_ATTR(touchpad, S_IRUGO | S_IWUSR,
+		   toshiba_touchpad_show, toshiba_touchpad_store);
+static DEVICE_ATTR(position, S_IRUGO, toshiba_position_show, NULL);
+static DEVICE_ATTR(usb_sleep_charge, S_IRUGO | S_IWUSR,
+		   toshiba_usb_sleep_charge_show,
+		   toshiba_usb_sleep_charge_store);
+static DEVICE_ATTR(sleep_functions_on_battery, S_IRUGO | S_IWUSR,
+		   sleep_functions_on_battery_show,
+		   sleep_functions_on_battery_store);
+static DEVICE_ATTR(usb_rapid_charge, S_IRUGO | S_IWUSR,
+		   toshiba_usb_rapid_charge_show,
+		   toshiba_usb_rapid_charge_store);
+static DEVICE_ATTR(usb_sleep_music, S_IRUGO | S_IWUSR,
+		   toshiba_usb_sleep_music_show,
+		   toshiba_usb_sleep_music_store);
+static DEVICE_ATTR(kbd_function_keys, S_IRUGO | S_IWUSR,
+		   toshiba_kbd_function_keys_show,
+		   toshiba_kbd_function_keys_store);
+static DEVICE_ATTR(panel_power_on, S_IRUGO | S_IWUSR,
+		   toshiba_panel_power_on_show,
+		   toshiba_panel_power_on_store);
+static DEVICE_ATTR(usb_three, S_IRUGO | S_IWUSR,
+		   toshiba_usb_three_show, toshiba_usb_three_store);
+
+static struct attribute *toshiba_attributes[] = {
+	&dev_attr_version.attr,
+	&dev_attr_fan.attr,
+	&dev_attr_kbd_backlight_mode.attr,
+	&dev_attr_kbd_type.attr,
+	&dev_attr_available_kbd_modes.attr,
+	&dev_attr_kbd_backlight_timeout.attr,
+	&dev_attr_touchpad.attr,
+	&dev_attr_position.attr,
+	&dev_attr_usb_sleep_charge.attr,
+	&dev_attr_sleep_functions_on_battery.attr,
+	&dev_attr_usb_rapid_charge.attr,
+	&dev_attr_usb_sleep_music.attr,
+	&dev_attr_kbd_function_keys.attr,
+	&dev_attr_panel_power_on.attr,
+	&dev_attr_usb_three.attr,
+	NULL,
+};
+
 static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 					struct attribute *attr, int idx)
 {
@@ -2388,6 +2303,11 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 	return exists ? attr->mode : 0;
 }
 
+static struct attribute_group toshiba_attr_group = {
+	.is_visible = toshiba_sysfs_is_visible,
+	.attrs = toshiba_attributes,
+};
+
 /*
  * Hotkeys
  */
-- 
2.2.2
