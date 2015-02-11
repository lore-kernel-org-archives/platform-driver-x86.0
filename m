From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 5/5] toshiba_acpi: Make use of DEVICE_ATTR_{RO, RW} macros
Date: Tue, 10 Feb 2015 23:44:00 -0700
Message-ID: <1423637040-6813-6-git-send-email-coproscefalo@gmail.com>
References: <1423637040-6813-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:63250 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751853AbbBKGoN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Feb 2015 01:44:13 -0500
In-Reply-To: <1423637040-6813-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch makes use of the DEVICE_ATTR_{RO, RW} macros to simplify
sysfs attributes declarations.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 42 +++++++++++++------------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 0b5614c..eea3447 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1664,6 +1664,7 @@ static ssize_t version_show(struct device *dev,
 {
 	return sprintf(buf, "%s\n", TOSHIBA_ACPI_VERSION);
 }
+static DEVICE_ATTR_RO(version);
 
 static ssize_t fan_store(struct device *dev,
 			 struct device_attribute *attr,
@@ -1703,6 +1704,7 @@ static ssize_t fan_show(struct device *dev,
 
 	return sprintf(buf, "%d\n", value);
 }
+static DEVICE_ATTR_RW(fan);
 
 static ssize_t kbd_backlight_mode_store(struct device *dev,
 					struct device_attribute *attr,
@@ -1773,6 +1775,7 @@ static ssize_t kbd_backlight_mode_show(struct device *dev,
 
 	return sprintf(buf, "%i\n", time & SCI_KBD_MODE_MASK);
 }
+static DEVICE_ATTR_RW(kbd_backlight_mode);
 
 static ssize_t kbd_type_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
@@ -1781,6 +1784,7 @@ static ssize_t kbd_type_show(struct device *dev,
 
 	return sprintf(buf, "%d\n", toshiba->kbd_type);
 }
+static DEVICE_ATTR_RO(kbd_type);
 
 static ssize_t available_kbd_modes_show(struct device *dev,
 					struct device_attribute *attr, 
@@ -1795,6 +1799,7 @@ static ssize_t available_kbd_modes_show(struct device *dev,
 	return sprintf(buf, "%x %x %x\n",
 		       SCI_KBD_MODE_AUTO, SCI_KBD_MODE_ON, SCI_KBD_MODE_OFF);
 }
+static DEVICE_ATTR_RO(available_kbd_modes);
 
 static ssize_t kbd_backlight_timeout_store(struct device *dev,
 					   struct device_attribute *attr,
@@ -1851,6 +1856,7 @@ static ssize_t kbd_backlight_timeout_show(struct device *dev,
 
 	return sprintf(buf, "%i\n", time >> HCI_MISC_SHIFT);
 }
+static DEVICE_ATTR_RW(kbd_backlight_timeout);
 
 static ssize_t touchpad_store(struct device *dev,
 			      struct device_attribute *attr,
@@ -1887,6 +1893,7 @@ static ssize_t touchpad_show(struct device *dev,
 
 	return sprintf(buf, "%i\n", state);
 }
+static DEVICE_ATTR_RW(touchpad);
 
 static ssize_t position_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
@@ -1908,6 +1915,7 @@ static ssize_t position_show(struct device *dev,
 
 	return sprintf(buf, "%d %d %d\n", x, y, z);
 }
+static DEVICE_ATTR_RO(position);
 
 static ssize_t usb_sleep_charge_show(struct device *dev,
 				     struct device_attribute *attr, char *buf)
@@ -1957,6 +1965,7 @@ static ssize_t usb_sleep_charge_store(struct device *dev,
 
 	return count;
 }
+static DEVICE_ATTR_RW(usb_sleep_charge);
 
 static ssize_t sleep_functions_on_battery_show(struct device *dev,
 					       struct device_attribute *attr,
@@ -2018,6 +2027,7 @@ static ssize_t sleep_functions_on_battery_store(struct device *dev,
 
 	return count;
 }
+static DEVICE_ATTR_RW(sleep_functions_on_battery);
 
 static ssize_t usb_rapid_charge_show(struct device *dev,
 				     struct device_attribute *attr, char *buf)
@@ -2053,6 +2063,7 @@ static ssize_t usb_rapid_charge_store(struct device *dev,
 
 	return count;
 }
+static DEVICE_ATTR_RW(usb_rapid_charge);
 
 static ssize_t usb_sleep_music_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
@@ -2088,6 +2099,7 @@ static ssize_t usb_sleep_music_store(struct device *dev,
 
 	return count;
 }
+static DEVICE_ATTR_RW(usb_sleep_music);
 
 static ssize_t kbd_function_keys_show(struct device *dev,
 				      struct device_attribute *attr, char *buf)
@@ -2129,6 +2141,7 @@ static ssize_t kbd_function_keys_store(struct device *dev,
 
 	return count;
 }
+static DEVICE_ATTR_RW(kbd_function_keys);
 
 static ssize_t panel_power_on_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
@@ -2166,6 +2179,7 @@ static ssize_t panel_power_on_store(struct device *dev,
 
 	return count;
 }
+static DEVICE_ATTR_RW(panel_power_on);
 
 static ssize_t usb_three_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
@@ -2207,33 +2221,7 @@ static ssize_t usb_three_store(struct device *dev,
 
 	return count;
 }
-
-static DEVICE_ATTR(version, S_IRUGO, version_show, NULL);
-static DEVICE_ATTR(fan, S_IRUGO | S_IWUSR, fan_show, fan_store);
-static DEVICE_ATTR(kbd_backlight_mode, S_IRUGO | S_IWUSR,
-		   kbd_backlight_mode_show, kbd_backlight_mode_store);
-static DEVICE_ATTR(kbd_type, S_IRUGO, kbd_type_show, NULL);
-static DEVICE_ATTR(available_kbd_modes, S_IRUGO, 
-		   available_kbd_modes_show, NULL);
-static DEVICE_ATTR(kbd_backlight_timeout, S_IRUGO | S_IWUSR,
-		   kbd_backlight_timeout_show, kbd_backlight_timeout_store);
-static DEVICE_ATTR(touchpad, S_IRUGO | S_IWUSR, touchpad_show, touchpad_store);
-static DEVICE_ATTR(position, S_IRUGO, position_show, NULL);
-static DEVICE_ATTR(usb_sleep_charge, S_IRUGO | S_IWUSR,
-		   usb_sleep_charge_show, usb_sleep_charge_store);
-static DEVICE_ATTR(sleep_functions_on_battery, S_IRUGO | S_IWUSR,
-		   sleep_functions_on_battery_show,
-		   sleep_functions_on_battery_store);
-static DEVICE_ATTR(usb_rapid_charge, S_IRUGO | S_IWUSR,
-		   usb_rapid_charge_show, usb_rapid_charge_store);
-static DEVICE_ATTR(usb_sleep_music, S_IRUGO | S_IWUSR,
-		   usb_sleep_music_show, usb_sleep_music_store);
-static DEVICE_ATTR(kbd_function_keys, S_IRUGO | S_IWUSR,
-		   kbd_function_keys_show, kbd_function_keys_store);
-static DEVICE_ATTR(panel_power_on, S_IRUGO | S_IWUSR,
-		   panel_power_on_show, panel_power_on_store);
-static DEVICE_ATTR(usb_three, S_IRUGO | S_IWUSR,
-		   usb_three_show, usb_three_store);
+static DEVICE_ATTR_RW(usb_three);
 
 static struct attribute *toshiba_attributes[] = {
 	&dev_attr_version.attr,
-- 
2.2.2
