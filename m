From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 5/7] toshiba_acpi: Add ECO mode led support
Date: Tue, 25 Mar 2014 20:38:33 -0600
Message-ID: <1395801515-2333-6-git-send-email-coproscefalo@gmail.com>
References: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:55998 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751314AbaCZCjP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Mar 2014 22:39:15 -0400
Received: by mail-oa0-f44.google.com with SMTP id n16so1755971oag.17
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2014 19:39:15 -0700 (PDT)
In-Reply-To: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Newer Toshiba laptops now come with a feature called
ECO Mode, where the system is put in low power consupmtion
state and a green (world shaped with leaves) icon illuminates
indicating that the system is in such power state.

This patch adds support to turn on/off the ECO led by
creating and registering the toshiba::eco_mode led.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 66 +++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 08c5376..c8e8bfb 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -112,6 +112,7 @@ MODULE_LICENSE("GPL");
 #define HCI_LCD_BRIGHTNESS		0x002a
 #define HCI_WIRELESS			0x0056
 #define HCI_KBD_ILLUMINATION		0x0095
+#define HCI_ECO_MODE			0x0097
 #define SCI_ILLUMINATION		0x014e
 #define SCI_KBD_ILLUM_STATUS		0x015c
 #define SCI_TOUCHPAD			0x050e
@@ -142,6 +143,7 @@ struct toshiba_acpi_dev {
 	struct backlight_device *backlight_dev;
 	struct led_classdev led_dev;
 	struct led_classdev kbd_led;
+	struct led_classdev eco_led;
 
 	int force_fan;
 	int last_key_event;
@@ -159,6 +161,7 @@ struct toshiba_acpi_dev {
 	unsigned int kbd_illum_supported:1;
 	unsigned int kbd_led_registered:1;
 	unsigned int touchpad_supported:1;
+	unsigned int eco_supported:1;
 	unsigned int sysfs_created:1;
 
 	struct mutex mutex;
@@ -571,6 +574,57 @@ static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *state)
 	return 0;
 }
 
+/* Eco Mode support */
+static int toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
+{
+	acpi_status status;
+	u32 in[HCI_WORDS] = { HCI_GET, HCI_ECO_MODE, 0, 1, 0, 0 };
+	u32 out[HCI_WORDS];
+
+	status = hci_raw(dev, in, out);
+	if (ACPI_FAILURE(status) || out[0] == SCI_INPUT_DATA_ERROR) {
+		pr_info("ACPI call to get ECO led failed\n");
+		return 0;
+	}
+
+	return 1;
+}
+
+static enum led_brightness toshiba_eco_mode_get_status(struct led_classdev *cdev)
+{
+	struct toshiba_acpi_dev *dev = container_of(cdev,
+			struct toshiba_acpi_dev, eco_led);
+	u32 in[HCI_WORDS] = { HCI_GET, HCI_ECO_MODE, 0, 1, 0, 0 };
+	u32 out[HCI_WORDS];
+	acpi_status status;
+
+	status = hci_raw(dev, in, out);
+	if (ACPI_FAILURE(status) || out[0] == SCI_INPUT_DATA_ERROR) {
+		pr_err("ACPI call to get ECO led failed\n");
+		return LED_OFF;
+	}
+
+	return out[2] ? LED_FULL : LED_OFF;
+}
+
+static void toshiba_eco_mode_set_status(struct led_classdev *cdev,
+				     enum led_brightness brightness)
+{
+	struct toshiba_acpi_dev *dev = container_of(cdev,
+			struct toshiba_acpi_dev, eco_led);
+	u32 in[HCI_WORDS] = { HCI_SET, HCI_ECO_MODE, 0, 1, 0, 0 };
+	u32 out[HCI_WORDS];
+	acpi_status status;
+
+	/* Switch the Eco Mode led on/off */
+	in[2] = (brightness) ? 1 : 0;
+	status = hci_raw(dev, in, out);
+	if (ACPI_FAILURE(status) || out[0] == SCI_INPUT_DATA_ERROR) {
+		pr_err("ACPI call to set ECO led failed\n");
+		return;
+	}
+}
+
 /* Bluetooth rfkill handlers */
 
 static u32 hci_get_bt_present(struct toshiba_acpi_dev *dev, bool *present)
@@ -1469,6 +1523,9 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
  
 	if (dev->kbd_led_registered)
 		led_classdev_unregister(&dev->kbd_led);
+ 
+	if (dev->eco_supported)
+		led_classdev_unregister(&dev->eco_led);
 
 	if (toshiba_acpi)
 		toshiba_acpi = NULL;
@@ -1556,6 +1613,15 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 			dev->illumination_supported = 1;
 	}
  
+	if (toshiba_eco_mode_available(dev)) {
+		dev->eco_led.name = "toshiba::eco_mode";
+		dev->eco_led.max_brightness = 1;
+		dev->eco_led.brightness_set = toshiba_eco_mode_set_status;
+		dev->eco_led.brightness_get = toshiba_eco_mode_get_status;
+		if (!led_classdev_register(&dev->acpi_dev->dev, &dev->eco_led))
+			dev->eco_supported = 1;
+	}
+ 
 	ret = toshiba_kbd_illum_status_get(dev, &dummy);
 	if (!ret) {
 		dev->kbd_time = dummy >> HCI_MISC_SHIFT;
-- 
1.9.1
