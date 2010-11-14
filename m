From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH] asus-laptop: add wimax and wwan support
Date: Sun, 14 Nov 2010 17:40:12 +0100
Message-ID: <1289752812-8659-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:46462 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756149Ab0KNQoG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 14 Nov 2010 11:44:06 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 4B03B84837
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Nov 2010 17:40:15 +0100 (CET)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentincj@iksaif.net>

Asus UL30A has a 3G chip, but the radio is disabled by default.
The DSDT also reference a WIMAX device, which is not present on this model.

This patch adds two new files: wwan and wimax to control WWAN and
WIMAX devices. It does not use rfkill, because like WLED and BLED,
we don't know yet that the two ACPI functions will always control the
radio, they may control only the leds on some hardware.

We may add rfkill switchs later.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 .../ABI/testing/sysfs-platform-asus-laptop         |   16 +++-
 drivers/platform/x86/asus-laptop.c                 |   96 +++++++++++++++++++-
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-laptop b/Documentation/ABI/testing/sysfs-platform-asus-laptop
index 1d77539..41ff8ae 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-asus-laptop
@@ -47,6 +47,20 @@ Date:		January 2007
 KernelVersion:	2.6.20
 Contact:	"Corentin Chary" <corentincj@iksaif.net>
 Description:
-		Control the bluetooth device. 1 means on, 0 means off.
+		Control the wlan device. 1 means on, 0 means off.
 		This may control the led, the device or both.
 Users:		Lapsus
+
+What:		/sys/devices/platform/asus_laptop/wimax
+Date:		October 2010
+KernelVersion:	2.6.37
+Contact:	"Corentin Chary" <corentincj@iksaif.net>
+Description:
+		Control the wimax device. 1 means on, 0 means off.
+
+What:		/sys/devices/platform/asus_laptop/wwan
+Date:		October 2010
+KernelVersion:	2.6.37
+Contact:	"Corentin Chary" <corentincj@iksaif.net>
+Description:
+		Control the wwan (3G) device. 1 means on, 0 means off.
diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 60a5a5c..f295495 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -81,6 +81,8 @@ MODULE_PARM_DESC(wapf, "WAPF value");
 
 static int wlan_status = 1;
 static int bluetooth_status = 1;
+static int wimax_status = -1;
+static int wwan_status = -1;
 
 module_param(wlan_status, int, 0444);
 MODULE_PARM_DESC(wlan_status, "Set the wireless status on boot "
@@ -92,6 +94,16 @@ MODULE_PARM_DESC(bluetooth_status, "Set the wireless status on boot "
 		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
 		 "default is 1");
 
+module_param(wimax_status, int, 0444);
+MODULE_PARM_DESC(wimax_status, "Set the wireless status on boot "
+		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
+		 "default is 1");
+
+module_param(wwan_status, int, 0444);
+MODULE_PARM_DESC(wwan_status, "Set the wireless status on boot "
+		 "(0 = disabled, 1 = enabled, -1 = don't do anything). "
+		 "default is 1");
+
 /*
  * Some events we use, same for all Asus
  */
@@ -114,6 +126,8 @@ MODULE_PARM_DESC(bluetooth_status, "Set the wireless status on boot "
  */
 #define WL_RSTS		0x01	/* internal Wifi */
 #define BT_RSTS		0x02	/* internal Bluetooth */
+#define WM_RSTS		0x08    /* internal wimax */
+#define WW_RSTS		0x20    /* internal wwan */
 
 /* LED */
 #define METHOD_MLED		"MLED"
@@ -132,6 +146,11 @@ MODULE_PARM_DESC(bluetooth_status, "Set the wireless status on boot "
  */
 #define METHOD_WLAN		"WLED"
 #define METHOD_BLUETOOTH	"BLED"
+
+/* WWAN and WIMAX */
+#define METHOD_WWAN		"GSMC"
+#define METHOD_WIMAX		"WMXC"
+
 #define METHOD_WL_STATUS	"RSTS"
 
 /* Brightness */
@@ -883,6 +902,64 @@ static ssize_t store_bluetooth(struct device *dev,
 }
 
 /*
+ * Wimax
+ */
+static int asus_wimax_set(struct asus_laptop *asus, int status)
+{
+	if (write_acpi_int(asus->handle, METHOD_WIMAX, !!status)) {
+		pr_warning("Error setting wimax status to %d", status);
+		return -EIO;
+	}
+	return 0;
+}
+
+static ssize_t show_wimax(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct asus_laptop *asus = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", asus_wireless_status(asus, WM_RSTS));
+}
+
+static ssize_t store_wimax(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	struct asus_laptop *asus = dev_get_drvdata(dev);
+
+	return sysfs_acpi_set(asus, buf, count, METHOD_WIMAX);
+}
+
+/*
+ * Wwan
+ */
+static int asus_wwan_set(struct asus_laptop *asus, int status)
+{
+	if (write_acpi_int(asus->handle, METHOD_WWAN, !!status)) {
+		pr_warning("Error setting wwan status to %d", status);
+		return -EIO;
+	}
+	return 0;
+}
+
+static ssize_t show_wwan(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct asus_laptop *asus = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", asus_wireless_status(asus, WW_RSTS));
+}
+
+static ssize_t store_wwan(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	struct asus_laptop *asus = dev_get_drvdata(dev);
+
+	return sysfs_acpi_set(asus, buf, count, METHOD_WWAN);
+}
+
+/*
  * Display
  */
 static void asus_set_display(struct asus_laptop *asus, int value)
@@ -1202,6 +1279,8 @@ static DEVICE_ATTR(infos, S_IRUGO, show_infos, NULL);
 static DEVICE_ATTR(wlan, S_IRUGO | S_IWUSR, show_wlan, store_wlan);
 static DEVICE_ATTR(bluetooth, S_IRUGO | S_IWUSR,
 		   show_bluetooth, store_bluetooth);
+static DEVICE_ATTR(wimax, S_IRUGO | S_IWUSR, show_wimax, store_wimax);
+static DEVICE_ATTR(wwan, S_IRUGO | S_IWUSR, show_wwan, store_wwan);
 static DEVICE_ATTR(display, S_IRUGO | S_IWUSR, show_disp, store_disp);
 static DEVICE_ATTR(ledd, S_IRUGO | S_IWUSR, show_ledd, store_ledd);
 static DEVICE_ATTR(ls_level, S_IRUGO | S_IWUSR, show_lslvl, store_lslvl);
@@ -1212,6 +1291,8 @@ static struct attribute *asus_attributes[] = {
 	&dev_attr_infos.attr,
 	&dev_attr_wlan.attr,
 	&dev_attr_bluetooth.attr,
+	&dev_attr_wimax.attr,
+	&dev_attr_wwan.attr,
 	&dev_attr_display.attr,
 	&dev_attr_ledd.attr,
 	&dev_attr_ls_level.attr,
@@ -1239,6 +1320,13 @@ static mode_t asus_sysfs_is_visible(struct kobject *kobj,
 	} else if (attr == &dev_attr_display.attr) {
 		supported = !acpi_check_handle(handle, METHOD_SWITCH_DISPLAY, NULL);
 
+	} else if (attr == &dev_attr_wimax.attr) {
+		supported =
+			!acpi_check_handle(asus->handle, METHOD_WIMAX, NULL);
+
+	} else if (attr == &dev_attr_wwan.attr) {
+		supported = !acpi_check_handle(asus->handle, METHOD_WWAN, NULL);
+
 	} else if (attr == &dev_attr_ledd.attr) {
 		supported = !acpi_check_handle(handle, METHOD_LEDD, NULL);
 
@@ -1397,7 +1484,8 @@ static int asus_laptop_get_info(struct asus_laptop *asus)
 
 	/*
 	 * The HWRS method return informations about the hardware.
-	 * 0x80 bit is for WLAN, 0x100 for Bluetooth.
+	 * 0x80 bit is for WLAN, 0x100 for Bluetooth,
+	 * 0x40 for WWAN, 0x10 for WIMAX.
 	 * The significance of others is yet to be found.
 	 */
 	status =
@@ -1440,6 +1528,12 @@ static int __devinit asus_acpi_init(struct asus_laptop *asus)
 	if (wlan_status >= 0)
 		asus_wlan_set(asus, !!wlan_status);
 
+	if (wimax_status >= 0)
+		asus_wimax_set(asus, !!wimax_status);
+
+	if (wwan_status >= 0)
+		asus_wwan_set(asus, !!wwan_status);
+
 	/* Keyboard Backlight is on by default */
 	if (!acpi_check_handle(asus->handle, METHOD_KBD_LIGHT_SET, NULL))
 		asus_kled_set(asus, 1);
-- 
1.7.3.2
