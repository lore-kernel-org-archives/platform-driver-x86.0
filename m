From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] toshiba_acpi: Only register backlight device when interface is read/write
Date: Thu, 19 Apr 2012 11:23:50 -0500
Message-ID: <1334852630-8829-1-git-send-email-seth.forshee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:56002 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754215Ab2DSQX7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 Apr 2012 12:23:59 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org
Cc: Seth Forshee <seth.forshee@canonical.com>, Akio Idehara <zbe64533@gmail.com>

Currently the backlight device is registered unconditionally, but many
(probably most) Toshibas either don't support HCI_LCD_BRIGHTNESS or only
support reading from it. This patch adds a test of HCI_LCD_BRIGHTNESS
during initialization and only registers the backlight device if this
interface supports both reads and writes.

Cc: Akio Idehara <zbe64533@gmail.com>
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
Matthew,

Please consider applying this as a fix for 3.4.

This is certainly going to conflict with Akio's tr_backlight patch, but
I made no attempt at merging the two since the tr_backlight patch is not
applied yet and is probably 3.5 material anyway. I'm more than happy to
work with Akio to fix up the conflicts.

 drivers/platform/x86/toshiba_acpi.c |   77 ++++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index ee79ce6..33ee2e8 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -480,9 +480,8 @@ static const struct rfkill_ops toshiba_rfk_ops = {
 
 static struct proc_dir_entry *toshiba_proc_dir /*= 0*/ ;
 
-static int get_lcd(struct backlight_device *bd)
+static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 {
-	struct toshiba_acpi_dev *dev = bl_get_data(bd);
 	u32 hci_result;
 	u32 value;
 
@@ -493,6 +492,12 @@ static int get_lcd(struct backlight_device *bd)
 	return -EIO;
 }
 
+static int get_lcd_brightness(struct backlight_device *bd)
+{
+	struct toshiba_acpi_dev *dev = bl_get_data(bd);
+	return __get_lcd_brightness(dev);
+}
+
 static int lcd_proc_show(struct seq_file *m, void *v)
 {
 	struct toshiba_acpi_dev *dev = m->private;
@@ -501,7 +506,7 @@ static int lcd_proc_show(struct seq_file *m, void *v)
 	if (!dev->backlight_dev)
 		return -ENODEV;
 
-	value = get_lcd(dev->backlight_dev);
+	value = get_lcd_brightness(dev->backlight_dev);
 	if (value >= 0) {
 		seq_printf(m, "brightness:              %d\n", value);
 		seq_printf(m, "brightness_levels:       %d\n",
@@ -518,7 +523,7 @@ static int lcd_proc_open(struct inode *inode, struct file *file)
 	return single_open(file, lcd_proc_show, PDE(inode)->data);
 }
 
-static int set_lcd(struct toshiba_acpi_dev *dev, int value)
+static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 {
 	u32 hci_result;
 
@@ -530,7 +535,7 @@ static int set_lcd(struct toshiba_acpi_dev *dev, int value)
 static int set_lcd_status(struct backlight_device *bd)
 {
 	struct toshiba_acpi_dev *dev = bl_get_data(bd);
-	return set_lcd(dev, bd->props.brightness);
+	return set_lcd_brightness(dev, bd->props.brightness);
 }
 
 static ssize_t lcd_proc_write(struct file *file, const char __user *buf,
@@ -549,7 +554,7 @@ static ssize_t lcd_proc_write(struct file *file, const char __user *buf,
 
 	if (sscanf(cmd, " brightness : %i", &value) == 1 &&
 	    value >= 0 && value < HCI_LCD_BRIGHTNESS_LEVELS) {
-		ret = set_lcd(dev, value);
+		ret = set_lcd_brightness(dev, value);
 		if (ret == 0)
 			ret = count;
 	} else {
@@ -860,8 +865,8 @@ static void remove_toshiba_proc_entries(struct toshiba_acpi_dev *dev)
 }
 
 static const struct backlight_ops toshiba_backlight_data = {
-        .get_brightness = get_lcd,
-        .update_status  = set_lcd_status,
+	.get_brightness = get_lcd_brightness,
+	.update_status  = set_lcd_status,
 };
 
 static bool toshiba_acpi_i8042_filter(unsigned char data, unsigned char str,
@@ -1020,6 +1025,45 @@ static int __devinit toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	return error;
 }
 
+static int __devinit toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
+{
+	struct backlight_properties props;
+	int brightness;
+	int ret;
+
+	/*
+	 * Some machines don't support the backlight methods at all, and
+	 * others support it read-only. Either of these is pretty useless,
+	 * so only register the backlight device if the backlight method
+	 * supports both reads and writes.
+	 */
+	brightness = __get_lcd_brightness(dev);
+	if (brightness < 0)
+		return 0;
+	ret = set_lcd_brightness(dev, brightness);
+	if (ret) {
+		pr_debug("Backlight method is read-only, disabling backlight support\n");
+		return 0;
+	}
+
+	props.type = BACKLIGHT_PLATFORM;
+	props.max_brightness = HCI_LCD_BRIGHTNESS_LEVELS - 1;
+	dev->backlight_dev = backlight_device_register("toshiba",
+						       &dev->acpi_dev->dev,
+						       dev,
+						       &toshiba_backlight_data,
+						       &props);
+	if (IS_ERR(dev->backlight_dev)) {
+		ret = PTR_ERR(dev->backlight_dev);
+		pr_err("Could not register toshiba backlight device\n");
+		dev->backlight_dev = NULL;
+		return ret;
+	}
+
+	dev->backlight_dev->props.brightness = brightness;
+	return 0;
+}
+
 static int toshiba_acpi_remove(struct acpi_device *acpi_dev, int type)
 {
 	struct toshiba_acpi_dev *dev = acpi_driver_data(acpi_dev);
@@ -1078,7 +1122,6 @@ static int __devinit toshiba_acpi_add(struct acpi_device *acpi_dev)
 	u32 dummy;
 	bool bt_present;
 	int ret = 0;
-	struct backlight_properties props;
 
 	if (toshiba_acpi)
 		return -EBUSY;
@@ -1104,21 +1147,9 @@ static int __devinit toshiba_acpi_add(struct acpi_device *acpi_dev)
 
 	mutex_init(&dev->mutex);
 
-	props.type = BACKLIGHT_PLATFORM;
-	props.max_brightness = HCI_LCD_BRIGHTNESS_LEVELS - 1;
-	dev->backlight_dev = backlight_device_register("toshiba",
-						       &acpi_dev->dev,
-						       dev,
-						       &toshiba_backlight_data,
-						       &props);
-	if (IS_ERR(dev->backlight_dev)) {
-		ret = PTR_ERR(dev->backlight_dev);
-
-		pr_err("Could not register toshiba backlight device\n");
-		dev->backlight_dev = NULL;
+	ret = toshiba_acpi_setup_backlight(dev);
+	if (ret)
 		goto error;
-	}
-	dev->backlight_dev->props.brightness = get_lcd(dev->backlight_dev);
 
 	/* Register rfkill switch for Bluetooth */
 	if (hci_get_bt_present(dev, &bt_present) == HCI_SUCCESS && bt_present) {
-- 
1.7.9.5
