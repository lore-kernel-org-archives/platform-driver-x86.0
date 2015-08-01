From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 2/5] toshiba_acpi: Remove "*not supported" feature prints
Date: Fri, 31 Jul 2015 21:58:13 -0600
Message-ID: <1438401496-27744-3-git-send-email-coproscefalo@gmail.com>
References: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently the driver prints "*not supported" if any of the features
queried are in fact not supported, let us print the available
features instead.

This patch removes all instances pr_info printing "*not supported",
and add a new function called "print_supported_features", which will
print the available laptop features.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 72 +++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index d983dc4..66b596a 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -459,7 +459,7 @@ static void toshiba_illumination_available(struct toshiba_acpi_dev *dev)
 	if (ACPI_FAILURE(status))
 		pr_err("ACPI call to query Illumination support failed\n");
 	else if (out[0] == TOS_NOT_SUPPORTED)
-		pr_info("Illumination device not available\n");
+		return;
 	else if (out[0] == TOS_SUCCESS)
 		dev->illumination_supported = 1;
 }
@@ -483,7 +483,6 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
 		pr_err("ACPI call for illumination failed\n");
 		return;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Illumination not supported\n");
 		return;
 	}
 }
@@ -505,7 +504,6 @@ static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
 		pr_err("ACPI call for illumination failed\n");
 		return LED_OFF;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Illumination not supported\n");
 		return LED_OFF;
 	}
 
@@ -530,7 +528,7 @@ static void toshiba_kbd_illum_available(struct toshiba_acpi_dev *dev)
 	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
 		pr_err("ACPI call to query kbd illumination support failed\n");
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("Keyboard illumination not available\n");
+		return;
 	} else if (out[0] == TOS_SUCCESS) {
 		/*
 		 * Check for keyboard backlight timeout max value,
@@ -564,7 +562,6 @@ static int toshiba_kbd_illum_status_set(struct toshiba_acpi_dev *dev, u32 time)
 		pr_err("ACPI call to set KBD backlight status failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Keyboard backlight status not supported\n");
 		return -ENODEV;
 	}
 
@@ -584,7 +581,6 @@ static int toshiba_kbd_illum_status_get(struct toshiba_acpi_dev *dev, u32 *time)
 		pr_err("ACPI call to get KBD backlight status failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Keyboard backlight status not supported\n");
 		return -ENODEV;
 	}
 
@@ -603,7 +599,6 @@ static enum led_brightness toshiba_kbd_backlight_get(struct led_classdev *cdev)
 		pr_err("ACPI call to get the keyboard backlight failed\n");
 		return LED_OFF;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Keyboard backlight not supported\n");
 		return LED_OFF;
 	}
 
@@ -624,7 +619,6 @@ static void toshiba_kbd_backlight_set(struct led_classdev *cdev,
 		pr_err("ACPI call to set KBD Illumination mode failed\n");
 		return;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Keyboard backlight not supported\n");
 		return;
 	}
 }
@@ -758,7 +752,7 @@ static void toshiba_accelerometer_available(struct toshiba_acpi_dev *dev)
 		   out[0] == TOS_NOT_INITIALIZED)
 		pr_err("Accelerometer not initialized\n");
 	else if (out[0] == TOS_NOT_SUPPORTED)
-		pr_info("Accelerometer not supported\n");
+		return;
 	else if (out[0] == TOS_SUCCESS)
 		dev->accelerometer_supported = 1;
 }
@@ -801,7 +795,6 @@ static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
 		sci_close(dev);
 		return;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
 		sci_close(dev);
 		return;
 	} else if (out[0] == TOS_SUCCESS) {
@@ -814,7 +807,7 @@ static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Sleep and Charge mode failed\n");
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
+		return;
 	} else if (out[0] == TOS_SUCCESS) {
 		dev->usbsc_bat_level = out[2];
 		/* Flag as supported */
@@ -837,7 +830,6 @@ static int toshiba_usb_sleep_charge_get(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to set USB S&C mode failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -860,7 +852,6 @@ static int toshiba_usb_sleep_charge_set(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to set USB S&C mode failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -886,7 +877,6 @@ static int toshiba_sleep_functions_status_get(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to get USB S&C battery level failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
 		return -ENODEV;
 	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -915,7 +905,6 @@ static int toshiba_sleep_functions_status_set(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to set USB S&C battery level failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
 		return -ENODEV;
 	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -942,7 +931,6 @@ static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED ||
 		   out[0] == TOS_INPUT_DATA_ERROR) {
-		pr_info("USB Rapid Charge not supported\n");
 		return -ENODEV;
 	}
 
@@ -969,7 +957,6 @@ static int toshiba_usb_rapid_charge_set(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to set USB Rapid Charge failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("USB Rapid Charge not supported\n");
 		return -ENODEV;
 	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -991,7 +978,6 @@ static int toshiba_usb_sleep_music_get(struct toshiba_acpi_dev *dev, u32 *state)
 		pr_err("ACPI call to get Sleep and Music failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Sleep and Music not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1013,7 +999,6 @@ static int toshiba_usb_sleep_music_set(struct toshiba_acpi_dev *dev, u32 state)
 		pr_err("ACPI call to set Sleep and Music failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Sleep and Music not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1036,7 +1021,6 @@ static int toshiba_function_keys_get(struct toshiba_acpi_dev *dev, u32 *mode)
 		pr_err("ACPI call to get KBD function keys failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("KBD function keys not supported\n");
 		return -ENODEV;
 	}
 
@@ -1056,7 +1040,6 @@ static int toshiba_function_keys_set(struct toshiba_acpi_dev *dev, u32 mode)
 		pr_err("ACPI call to set KBD function keys failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("KBD function keys not supported\n");
 		return -ENODEV;
 	}
 
@@ -1077,7 +1060,6 @@ static int toshiba_panel_power_on_get(struct toshiba_acpi_dev *dev, u32 *state)
 		pr_err("ACPI call to get Panel Power ON failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Panel Power on not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1099,7 +1081,6 @@ static int toshiba_panel_power_on_set(struct toshiba_acpi_dev *dev, u32 state)
 		pr_err("ACPI call to set Panel Power ON failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Panel Power ON not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1122,7 +1103,6 @@ static int toshiba_usb_three_get(struct toshiba_acpi_dev *dev, u32 *state)
 		pr_err("ACPI call to get USB 3 failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("USB 3 not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1144,7 +1124,6 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
 		pr_err("ACPI call to set USB 3 failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("USB 3 not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1166,7 +1145,6 @@ static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to get System type failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("System type not supported\n");
 		return -ENODEV;
 	}
 
@@ -2609,6 +2587,46 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 	return 0;
 }
 
+static void print_supported_features(struct toshiba_acpi_dev *dev)
+{
+	pr_info("Supported laptop features:");
+
+	if (dev->hotkey_dev)
+		pr_cont(" hotkeys");
+	if (dev->backlight_dev)
+		pr_cont(" backlight");
+	if (dev->video_supported)
+		pr_cont(" video-out");
+	if (dev->fan_supported)
+		pr_cont(" fan");
+	if (dev->tr_backlight_supported)
+		pr_cont(" transflective-backlight");
+	if (dev->illumination_supported)
+		pr_cont(" illumination");
+	if (dev->kbd_illum_supported)
+		pr_cont(" keyboard-backlight");
+	if (dev->touchpad_supported)
+		pr_cont(" touchpad");
+	if (dev->eco_supported)
+		pr_cont(" eco-led");
+	if (dev->accelerometer_supported)
+		pr_cont(" accelerometer-axes");
+	if (dev->usb_sleep_charge_supported)
+		pr_cont(" usb-sleep-charge");
+	if (dev->usb_rapid_charge_supported)
+		pr_cont(" usb-rapid-charge");
+	if (dev->usb_sleep_music_supported)
+		pr_cont(" usb-sleep-music");
+	if (dev->kbd_function_keys_supported)
+		pr_cont(" special-function-keys");
+	if (dev->panel_power_on_supported)
+		pr_cont(" panel-power-on");
+	if (dev->usb_three_supported)
+		pr_cont(" usb3");
+
+	pr_cont("\n");
+}
+
 static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
 {
 	struct toshiba_acpi_dev *dev = acpi_driver_data(acpi_dev);
@@ -2780,6 +2798,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = get_fan_status(dev, &dummy);
 	dev->fan_supported = !ret;
 
+	print_supported_features(dev);
+
 	/*
 	 * Enable the "Special Functions" mode only if they are
 	 * supported and if they are activated.
-- 
2.4.6
