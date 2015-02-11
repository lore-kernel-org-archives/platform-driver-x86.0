From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 4/5] toshiba_acpi: Drop the toshiba_ prefix from sysfs function names
Date: Tue, 10 Feb 2015 23:43:59 -0700
Message-ID: <1423637040-6813-5-git-send-email-coproscefalo@gmail.com>
References: <1423637040-6813-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:44744 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751834AbbBKGoL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Feb 2015 01:44:11 -0500
In-Reply-To: <1423637040-6813-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch removes the toshiba_ prefix from all the sysfs function
names and adapted the code according to coding style.

Also a few functions were renamed to match the sysfs entry, as this
patch is a preparation for the next patch to switch to
DEVICE_ATTR_{RO, RW, WO} macros.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 166 +++++++++++++++++-------------------
 1 file changed, 76 insertions(+), 90 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 818d184..0b5614c 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1659,15 +1659,15 @@ static const struct backlight_ops toshiba_backlight_data = {
 /*
  * Sysfs files
  */
-static ssize_t toshiba_version_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
+static ssize_t version_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s\n", TOSHIBA_ACPI_VERSION);
 }
 
-static ssize_t toshiba_fan_store(struct device *dev,
-				 struct device_attribute *attr,
-				 const char *buf, size_t count)
+static ssize_t fan_store(struct device *dev,
+			 struct device_attribute *attr,
+			 const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 result;
@@ -1690,8 +1690,8 @@ static ssize_t toshiba_fan_store(struct device *dev,
 	return count;
 }
 
-static ssize_t toshiba_fan_show(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t fan_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 value;
@@ -1704,9 +1704,9 @@ static ssize_t toshiba_fan_show(struct device *dev,
 	return sprintf(buf, "%d\n", value);
 }
 
-static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
-					 struct device_attribute *attr,
-					 const char *buf, size_t count)
+static ssize_t kbd_backlight_mode_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	int mode;
@@ -1761,9 +1761,9 @@ static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
 	return count;
 }
 
-static ssize_t toshiba_kbd_bl_mode_show(struct device *dev,
-					struct device_attribute *attr,
-					char *buf)
+static ssize_t kbd_backlight_mode_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 time;
@@ -1774,18 +1774,17 @@ static ssize_t toshiba_kbd_bl_mode_show(struct device *dev,
 	return sprintf(buf, "%i\n", time & SCI_KBD_MODE_MASK);
 }
 
-static ssize_t toshiba_kbd_type_show(struct device *dev,
-				     struct device_attribute *attr,
-				     char *buf)
+static ssize_t kbd_type_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%d\n", toshiba->kbd_type);
 }
 
-static ssize_t toshiba_available_kbd_modes_show(struct device *dev,
-						struct device_attribute *attr,
-						char *buf)
+static ssize_t available_kbd_modes_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 
@@ -1797,9 +1796,9 @@ static ssize_t toshiba_available_kbd_modes_show(struct device *dev,
 		       SCI_KBD_MODE_AUTO, SCI_KBD_MODE_ON, SCI_KBD_MODE_OFF);
 }
 
-static ssize_t toshiba_kbd_bl_timeout_store(struct device *dev,
-					    struct device_attribute *attr,
-					    const char *buf, size_t count)
+static ssize_t kbd_backlight_timeout_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	int time;
@@ -1840,9 +1839,9 @@ static ssize_t toshiba_kbd_bl_timeout_store(struct device *dev,
 	return count;
 }
 
-static ssize_t toshiba_kbd_bl_timeout_show(struct device *dev,
-					   struct device_attribute *attr,
-					   char *buf)
+static ssize_t kbd_backlight_timeout_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 time;
@@ -1853,9 +1852,9 @@ static ssize_t toshiba_kbd_bl_timeout_show(struct device *dev,
 	return sprintf(buf, "%i\n", time >> HCI_MISC_SHIFT);
 }
 
-static ssize_t toshiba_touchpad_store(struct device *dev,
-				      struct device_attribute *attr,
-				      const char *buf, size_t count)
+static ssize_t touchpad_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	int state;
@@ -1875,8 +1874,8 @@ static ssize_t toshiba_touchpad_store(struct device *dev,
 	return count;
 }
 
-static ssize_t toshiba_touchpad_show(struct device *dev,
-				     struct device_attribute *attr, char *buf)
+static ssize_t touchpad_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 state;
@@ -1889,8 +1888,8 @@ static ssize_t toshiba_touchpad_show(struct device *dev,
 	return sprintf(buf, "%i\n", state);
 }
 
-static ssize_t toshiba_position_show(struct device *dev,
-				     struct device_attribute *attr, char *buf)
+static ssize_t position_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 xyval, zval, tmp;
@@ -1910,9 +1909,8 @@ static ssize_t toshiba_position_show(struct device *dev,
 	return sprintf(buf, "%d %d %d\n", x, y, z);
 }
 
-static ssize_t toshiba_usb_sleep_charge_show(struct device *dev,
-					     struct device_attribute *attr,
-					     char *buf)
+static ssize_t usb_sleep_charge_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 mode;
@@ -1925,9 +1923,9 @@ static ssize_t toshiba_usb_sleep_charge_show(struct device *dev,
 	return sprintf(buf, "%x\n", mode & SCI_USB_CHARGE_MODE_MASK);
 }
 
-static ssize_t toshiba_usb_sleep_charge_store(struct device *dev,
-					      struct device_attribute *attr,
-					      const char *buf, size_t count)
+static ssize_t usb_sleep_charge_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 mode;
@@ -2021,9 +2019,8 @@ static ssize_t sleep_functions_on_battery_store(struct device *dev,
 	return count;
 }
 
-static ssize_t toshiba_usb_rapid_charge_show(struct device *dev,
-					     struct device_attribute *attr,
-					     char *buf)
+static ssize_t usb_rapid_charge_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 state;
@@ -2036,9 +2033,9 @@ static ssize_t toshiba_usb_rapid_charge_show(struct device *dev,
 	return sprintf(buf, "%d\n", state);
 }
 
-static ssize_t toshiba_usb_rapid_charge_store(struct device *dev,
-					      struct device_attribute *attr,
-					      const char *buf, size_t count)
+static ssize_t usb_rapid_charge_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	int state;
@@ -2057,9 +2054,8 @@ static ssize_t toshiba_usb_rapid_charge_store(struct device *dev,
 	return count;
 }
 
-static ssize_t toshiba_usb_sleep_music_show(struct device *dev,
-					    struct device_attribute *attr,
-					    char *buf)
+static ssize_t usb_sleep_music_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 state;
@@ -2072,9 +2068,9 @@ static ssize_t toshiba_usb_sleep_music_show(struct device *dev,
 	return sprintf(buf, "%d\n", state);
 }
 
-static ssize_t toshiba_usb_sleep_music_store(struct device *dev,
-					     struct device_attribute *attr,
-					     const char *buf, size_t count)
+static ssize_t usb_sleep_music_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	int state;
@@ -2093,9 +2089,8 @@ static ssize_t toshiba_usb_sleep_music_store(struct device *dev,
 	return count;
 }
 
-static ssize_t toshiba_kbd_function_keys_show(struct device *dev,
-					      struct device_attribute *attr,
-					      char *buf)
+static ssize_t kbd_function_keys_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	int mode;
@@ -2108,9 +2103,9 @@ static ssize_t toshiba_kbd_function_keys_show(struct device *dev,
 	return sprintf(buf, "%d\n", mode);
 }
 
-static ssize_t toshiba_kbd_function_keys_store(struct device *dev,
-					       struct device_attribute *attr,
-					       const char *buf, size_t count)
+static ssize_t kbd_function_keys_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	int mode;
@@ -2135,9 +2130,8 @@ static ssize_t toshiba_kbd_function_keys_store(struct device *dev,
 	return count;
 }
 
-static ssize_t toshiba_panel_power_on_show(struct device *dev,
-					   struct device_attribute *attr,
-					   char *buf)
+static ssize_t panel_power_on_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 state;
@@ -2150,9 +2144,9 @@ static ssize_t toshiba_panel_power_on_show(struct device *dev,
 	return sprintf(buf, "%d\n", state);
 }
 
-static ssize_t toshiba_panel_power_on_store(struct device *dev,
-					    struct device_attribute *attr,
-					    const char *buf, size_t count)
+static ssize_t panel_power_on_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	int state;
@@ -2173,9 +2167,8 @@ static ssize_t toshiba_panel_power_on_store(struct device *dev,
 	return count;
 }
 
-static ssize_t toshiba_usb_three_show(struct device *dev,
-				      struct device_attribute *attr,
-				      char *buf)
+static ssize_t usb_three_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	u32 state;
@@ -2188,9 +2181,9 @@ static ssize_t toshiba_usb_three_show(struct device *dev,
 	return sprintf(buf, "%d\n", state);
 }
 
-static ssize_t toshiba_usb_three_store(struct device *dev,
-				       struct device_attribute *attr,
-				       const char *buf, size_t count)
+static ssize_t usb_three_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
 {
 	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
 	int state;
@@ -2215,39 +2208,32 @@ static ssize_t toshiba_usb_three_store(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(version, S_IRUGO, toshiba_version_show, NULL);
-static DEVICE_ATTR(fan, S_IRUGO | S_IWUSR,
-		   toshiba_fan_show, toshiba_fan_store);
+static DEVICE_ATTR(version, S_IRUGO, version_show, NULL);
+static DEVICE_ATTR(fan, S_IRUGO | S_IWUSR, fan_show, fan_store);
 static DEVICE_ATTR(kbd_backlight_mode, S_IRUGO | S_IWUSR,
-		   toshiba_kbd_bl_mode_show, toshiba_kbd_bl_mode_store);
-static DEVICE_ATTR(kbd_type, S_IRUGO, toshiba_kbd_type_show, NULL);
-static DEVICE_ATTR(available_kbd_modes, S_IRUGO,
-		   toshiba_available_kbd_modes_show, NULL);
+		   kbd_backlight_mode_show, kbd_backlight_mode_store);
+static DEVICE_ATTR(kbd_type, S_IRUGO, kbd_type_show, NULL);
+static DEVICE_ATTR(available_kbd_modes, S_IRUGO,
+		   available_kbd_modes_show, NULL);
 static DEVICE_ATTR(kbd_backlight_timeout, S_IRUGO | S_IWUSR,
-		   toshiba_kbd_bl_timeout_show, toshiba_kbd_bl_timeout_store);
-static DEVICE_ATTR(touchpad, S_IRUGO | S_IWUSR,
-		   toshiba_touchpad_show, toshiba_touchpad_store);
-static DEVICE_ATTR(position, S_IRUGO, toshiba_position_show, NULL);
+		   kbd_backlight_timeout_show, kbd_backlight_timeout_store);
+static DEVICE_ATTR(touchpad, S_IRUGO | S_IWUSR, touchpad_show, touchpad_store);
+static DEVICE_ATTR(position, S_IRUGO, position_show, NULL);
 static DEVICE_ATTR(usb_sleep_charge, S_IRUGO | S_IWUSR,
-		   toshiba_usb_sleep_charge_show,
-		   toshiba_usb_sleep_charge_store);
+		   usb_sleep_charge_show, usb_sleep_charge_store);
 static DEVICE_ATTR(sleep_functions_on_battery, S_IRUGO | S_IWUSR,
 		   sleep_functions_on_battery_show,
 		   sleep_functions_on_battery_store);
 static DEVICE_ATTR(usb_rapid_charge, S_IRUGO | S_IWUSR,
-		   toshiba_usb_rapid_charge_show,
-		   toshiba_usb_rapid_charge_store);
+		   usb_rapid_charge_show, usb_rapid_charge_store);
 static DEVICE_ATTR(usb_sleep_music, S_IRUGO | S_IWUSR,
-		   toshiba_usb_sleep_music_show,
-		   toshiba_usb_sleep_music_store);
+		   usb_sleep_music_show, usb_sleep_music_store);
 static DEVICE_ATTR(kbd_function_keys, S_IRUGO | S_IWUSR,
-		   toshiba_kbd_function_keys_show,
-		   toshiba_kbd_function_keys_store);
+		   kbd_function_keys_show, kbd_function_keys_store);
 static DEVICE_ATTR(panel_power_on, S_IRUGO | S_IWUSR,
-		   toshiba_panel_power_on_show,
-		   toshiba_panel_power_on_store);
+		   panel_power_on_show, panel_power_on_store);
 static DEVICE_ATTR(usb_three, S_IRUGO | S_IWUSR,
-		   toshiba_usb_three_show, toshiba_usb_three_store);
+		   usb_three_show, usb_three_store);
 
 static struct attribute *toshiba_attributes[] = {
 	&dev_attr_version.attr,
-- 
2.2.2
