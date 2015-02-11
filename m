From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 1/6] toshiba_acpi: Add version entry to sysfs
Date: Tue, 10 Feb 2015 21:09:16 -0700
Message-ID: <1423627761-3415-2-git-send-email-coproscefalo@gmail.com>
References: <1423627761-3415-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423627761-3415-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch adds a new entry to the sysfs, showing the version of the
driver.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 4e8a8cf..334b65e 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1514,6 +1514,8 @@ static const struct backlight_ops toshiba_backlight_data = {
 /*
  * Sysfs files
  */
+static ssize_t toshiba_version_show(struct device *dev,
+				    struct device_attribute *attr, char *buf);
 static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
 					 struct device_attribute *attr,
 					 const char *buf, size_t count);
@@ -1566,6 +1568,7 @@ static ssize_t toshiba_usb_sleep_music_store(struct device *dev,
 					     struct device_attribute *attr,
 					     const char *buf, size_t count);
 
+static DEVICE_ATTR(version, S_IRUGO, toshiba_version_show, NULL);
 static DEVICE_ATTR(kbd_backlight_mode, S_IRUGO | S_IWUSR,
 		   toshiba_kbd_bl_mode_show, toshiba_kbd_bl_mode_store);
 static DEVICE_ATTR(kbd_type, S_IRUGO, toshiba_kbd_type_show, NULL);
@@ -1590,6 +1593,7 @@ static DEVICE_ATTR(usb_sleep_music, S_IRUGO | S_IWUSR,
 		   toshiba_usb_sleep_music_store);
 
 static struct attribute *toshiba_attributes[] = {
+	&dev_attr_version.attr,
 	&dev_attr_kbd_backlight_mode.attr,
 	&dev_attr_kbd_type.attr,
 	&dev_attr_available_kbd_modes.attr,
@@ -1611,6 +1615,12 @@ static struct attribute_group toshiba_attr_group = {
 	.attrs = toshiba_attributes,
 };
 
+static ssize_t toshiba_version_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%s\n", TOSHIBA_ACPI_VERSION);
+}
+
 static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
 					 struct device_attribute *attr,
 					 const char *buf, size_t count)
-- 
2.2.2
