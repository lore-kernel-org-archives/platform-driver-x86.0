From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 1/5] toshiba_acpi: Change *available functions return type
Date: Fri, 31 Jul 2015 21:58:12 -0600
Message-ID: <1438401496-27744-2-git-send-email-coproscefalo@gmail.com>
References: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch changes the *available functions return type from int to
void.

The checks for support of their respective features are done inside
such functions and there was no need to return anything as we can
flag the queried feature as supported inside these functions.

The code was adapted accordingly to these changes and two new
variables were created and another was changed from uint to bool.

Also, the function toshiba_acceleremoter_supported was renamed to
toshiba_accelerometer_available to maintain the naming consistency on
the driver.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 129 +++++++++++++++++-------------------
 1 file changed, 62 insertions(+), 67 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index f722898..d983dc4 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -187,7 +187,6 @@ struct toshiba_acpi_dev {
 	unsigned int info_supported:1;
 	unsigned int tr_backlight_supported:1;
 	unsigned int kbd_illum_supported:1;
-	unsigned int kbd_led_registered:1;
 	unsigned int touchpad_supported:1;
 	unsigned int eco_supported:1;
 	unsigned int accelerometer_supported:1;
@@ -198,6 +197,10 @@ struct toshiba_acpi_dev {
 	unsigned int panel_power_on_supported:1;
 	unsigned int usb_three_supported:1;
 	unsigned int sysfs_created:1;
+
+	bool kbd_led_registered;
+	bool illumination_led_registered;
+	bool eco_led_registered;
 };
 
 static struct toshiba_acpi_dev *toshiba_acpi;
@@ -439,26 +442,26 @@ static u32 sci_write(struct toshiba_acpi_dev *dev, u32 reg, u32 in1)
 }
 
 /* Illumination support */
-static int toshiba_illumination_available(struct toshiba_acpi_dev *dev)
+static void toshiba_illumination_available(struct toshiba_acpi_dev *dev)
 {
 	u32 in[TCI_WORDS] = { SCI_GET, SCI_ILLUMINATION, 0, 0, 0, 0 };
 	u32 out[TCI_WORDS];
 	acpi_status status;
 
+	dev->illumination_supported = 0;
+	dev->illumination_led_registered = false;
+
 	if (!sci_open(dev))
-		return 0;
+		return;
 
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status)) {
+	if (ACPI_FAILURE(status))
 		pr_err("ACPI call to query Illumination support failed\n");
-		return 0;
-	} else if (out[0] == TOS_NOT_SUPPORTED) {
+	else if (out[0] == TOS_NOT_SUPPORTED)
 		pr_info("Illumination device not available\n");
-		return 0;
-	}
-
-	return 1;
+	else if (out[0] == TOS_SUCCESS)
+		dev->illumination_supported = 1;
 }
 
 static void toshiba_illumination_set(struct led_classdev *cdev,
@@ -510,41 +513,42 @@ static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
 }
 
 /* KBD Illumination */
-static int toshiba_kbd_illum_available(struct toshiba_acpi_dev *dev)
+static void toshiba_kbd_illum_available(struct toshiba_acpi_dev *dev)
 {
 	u32 in[TCI_WORDS] = { SCI_GET, SCI_KBD_ILLUM_STATUS, 0, 0, 0, 0 };
 	u32 out[TCI_WORDS];
 	acpi_status status;
 
+	dev->kbd_illum_supported = 0;
+	dev->kbd_led_registered = false;
+
 	if (!sci_open(dev))
-		return 0;
+		return;
 
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
 	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
 		pr_err("ACPI call to query kbd illumination support failed\n");
-		return 0;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
 		pr_info("Keyboard illumination not available\n");
-		return 0;
+	} else if (out[0] == TOS_SUCCESS) {
+		/*
+		 * Check for keyboard backlight timeout max value,
+		 * previous kbd backlight implementation set this to
+		 * 0x3c0003, and now the new implementation set this
+		 * to 0x3c001a, use this to distinguish between them.
+		 */
+		if (out[3] == SCI_KBD_TIME_MAX)
+			dev->kbd_type = 2;
+		else
+			dev->kbd_type = 1;
+		/* Get the current keyboard backlight mode */
+		dev->kbd_mode = out[2] & SCI_KBD_MODE_MASK;
+		/* Get the current time (1-60 seconds) */
+		dev->kbd_time = out[2] >> HCI_MISC_SHIFT;
+		/* Flag as supported */
+		dev->kbd_illum_supported = 1;
 	}
-
-	/*
-	 * Check for keyboard backlight timeout max value,
-	 * previous kbd backlight implementation set this to
-	 * 0x3c0003, and now the new implementation set this
-	 * to 0x3c001a, use this to distinguish between them.
-	 */
-	if (out[3] == SCI_KBD_TIME_MAX)
-		dev->kbd_type = 2;
-	else
-		dev->kbd_type = 1;
-	/* Get the current keyboard backlight mode */
-	dev->kbd_mode = out[2] & SCI_KBD_MODE_MASK;
-	/* Get the current time (1-60 seconds) */
-	dev->kbd_time = out[2] >> HCI_MISC_SHIFT;
-
-	return 1;
 }
 
 static int toshiba_kbd_illum_status_set(struct toshiba_acpi_dev *dev, u32 time)
@@ -665,12 +669,15 @@ static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *state)
 }
 
 /* Eco Mode support */
-static int toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
+static void toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 {
 	acpi_status status;
 	u32 in[TCI_WORDS] = { HCI_GET, HCI_ECO_MODE, 0, 0, 0, 0 };
 	u32 out[TCI_WORDS];
 
+	dev->eco_supported = 0;
+	dev->eco_led_registered = false;
+
 	status = tci_raw(dev, in, out);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get ECO led failed\n");
@@ -691,10 +698,8 @@ static int toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 		if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE)
 			pr_err("ACPI call to get ECO led failed\n");
 		else if (out[0] == TOS_SUCCESS)
-			return 1;
+			dev->eco_supported = 1;
 	}
-
-	return 0;
 }
 
 static enum led_brightness
@@ -734,30 +739,28 @@ static void toshiba_eco_mode_set_status(struct led_classdev *cdev,
 }
 
 /* Accelerometer support */
-static int toshiba_accelerometer_supported(struct toshiba_acpi_dev *dev)
+static void toshiba_accelerometer_available(struct toshiba_acpi_dev *dev)
 {
 	u32 in[TCI_WORDS] = { HCI_GET, HCI_ACCELEROMETER2, 0, 0, 0, 0 };
 	u32 out[TCI_WORDS];
 	acpi_status status;
 
+	dev->accelerometer_supported = 0;
+
 	/*
 	 * Check if the accelerometer call exists,
 	 * this call also serves as initialization
 	 */
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
+	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR)
 		pr_err("ACPI call to query the accelerometer failed\n");
-		return -EIO;
-	} else if (out[0] == TOS_DATA_NOT_AVAILABLE ||
-		   out[0] == TOS_NOT_INITIALIZED) {
+	else if (out[0] == TOS_DATA_NOT_AVAILABLE ||
+		   out[0] == TOS_NOT_INITIALIZED)
 		pr_err("Accelerometer not initialized\n");
-		return -EIO;
-	} else if (out[0] == TOS_NOT_SUPPORTED) {
+	else if (out[0] == TOS_NOT_SUPPORTED)
 		pr_info("Accelerometer not supported\n");
-		return -ENODEV;
-	}
-
-	return 0;
+	else if (out[0] == TOS_SUCCESS)
+		dev->accelerometer_supported = 1;
 }
 
 static int toshiba_accelerometer_get(struct toshiba_acpi_dev *dev,
@@ -787,7 +790,6 @@ static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
 	u32 out[TCI_WORDS];
 	acpi_status status;
 
-	/* Set the feature to "not supported" in case of error */
 	dev->usb_sleep_charge_supported = 0;
 
 	if (!sci_open(dev))
@@ -808,25 +810,17 @@ static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
 
 	in[5] = SCI_USB_CHARGE_BAT_LVL;
 	status = tci_raw(dev, in, out);
+	sci_close(dev);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Sleep and Charge mode failed\n");
-		sci_close(dev);
-		return;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
 		pr_info("USB Sleep and Charge not supported\n");
-		sci_close(dev);
-		return;
 	} else if (out[0] == TOS_SUCCESS) {
 		dev->usbsc_bat_level = out[2];
-		/*
-		 * If we reach this point, it means that the laptop has support
-		 * for this feature and all values are initialized.
-		 * Set it as supported.
-		 */
+		/* Flag as supported */
 		dev->usb_sleep_charge_supported = 1;
 	}
 
-	sci_close(dev);
 }
 
 static int toshiba_usb_sleep_charge_get(struct toshiba_acpi_dev *dev,
@@ -2639,13 +2633,13 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
 
 	backlight_device_unregister(dev->backlight_dev);
 
-	if (dev->illumination_supported)
+	if (dev->illumination_led_registered)
 		led_classdev_unregister(&dev->led_dev);
 
 	if (dev->kbd_led_registered)
 		led_classdev_unregister(&dev->kbd_led);
 
-	if (dev->eco_supported)
+	if (dev->eco_led_registered)
 		led_classdev_unregister(&dev->eco_led);
 
 	if (toshiba_acpi)
@@ -2727,25 +2721,27 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	if (ret)
 		goto error;
 
-	if (toshiba_illumination_available(dev)) {
+	toshiba_illumination_available(dev);
+	if (dev->illumination_supported) {
 		dev->led_dev.name = "toshiba::illumination";
 		dev->led_dev.max_brightness = 1;
 		dev->led_dev.brightness_set = toshiba_illumination_set;
 		dev->led_dev.brightness_get = toshiba_illumination_get;
 		if (!led_classdev_register(&acpi_dev->dev, &dev->led_dev))
-			dev->illumination_supported = 1;
+			dev->illumination_led_registered = true;
 	}
 
-	if (toshiba_eco_mode_available(dev)) {
+	toshiba_eco_mode_available(dev);
+	if (dev->eco_supported) {
 		dev->eco_led.name = "toshiba::eco_mode";
 		dev->eco_led.max_brightness = 1;
 		dev->eco_led.brightness_set = toshiba_eco_mode_set_status;
 		dev->eco_led.brightness_get = toshiba_eco_mode_get_status;
 		if (!led_classdev_register(&dev->acpi_dev->dev, &dev->eco_led))
-			dev->eco_supported = 1;
+			dev->eco_led_registered = true;
 	}
 
-	dev->kbd_illum_supported = toshiba_kbd_illum_available(dev);
+	toshiba_kbd_illum_available(dev);
 	/*
 	 * Only register the LED if KBD illumination is supported
 	 * and the keyboard backlight operation mode is set to FN-Z
@@ -2756,14 +2752,13 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 		dev->kbd_led.brightness_set = toshiba_kbd_backlight_set;
 		dev->kbd_led.brightness_get = toshiba_kbd_backlight_get;
 		if (!led_classdev_register(&dev->acpi_dev->dev, &dev->kbd_led))
-			dev->kbd_led_registered = 1;
+			dev->kbd_led_registered = true;
 	}
 
 	ret = toshiba_touchpad_get(dev, &dummy);
 	dev->touchpad_supported = !ret;
 
-	ret = toshiba_accelerometer_supported(dev);
-	dev->accelerometer_supported = !ret;
+	toshiba_accelerometer_available(dev);
 
 	toshiba_usb_sleep_charge_available(dev);
 
-- 
2.4.6
