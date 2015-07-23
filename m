From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/4] toshiba_acpi: Remove "*not supported" feature prints
Date: Wed, 22 Jul 2015 19:37:52 -0600
Message-ID: <1437615474-27936-7-git-send-email-coproscefalo@gmail.com>
References: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
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
 drivers/platform/x86/toshiba_acpi.c | 69 +++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 789a17c..653d1fd 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -477,13 +477,10 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
 	state = brightness ? 1 : 0;
 	result = sci_write(dev, SCI_ILLUMINATION, state);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call for illumination failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
 		return;
-	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Illumination not supported\n");
-		return;
-	}
 }
 
 static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
@@ -503,7 +500,6 @@ static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
 		pr_err("ACPI call for illumination failed\n");
 		return LED_OFF;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Illumination not supported\n");
 		return LED_OFF;
 	}
 
@@ -561,7 +557,6 @@ static int toshiba_kbd_illum_status_set(struct toshiba_acpi_dev *dev, u32 time)
 		pr_err("ACPI call to set KBD backlight status failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Keyboard backlight status not supported\n");
 		return -ENODEV;
 	}
 
@@ -581,7 +576,6 @@ static int toshiba_kbd_illum_status_get(struct toshiba_acpi_dev *dev, u32 *time)
 		pr_err("ACPI call to get KBD backlight status failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Keyboard backlight status not supported\n");
 		return -ENODEV;
 	}
 
@@ -600,7 +594,6 @@ static enum led_brightness toshiba_kbd_backlight_get(struct led_classdev *cdev)
 		pr_err("ACPI call to get the keyboard backlight failed\n");
 		return LED_OFF;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Keyboard backlight not supported\n");
 		return LED_OFF;
 	}
 
@@ -621,7 +614,6 @@ static void toshiba_kbd_backlight_set(struct led_classdev *cdev,
 		pr_err("ACPI call to set KBD Illumination mode failed\n");
 		return;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Keyboard backlight not supported\n");
 		return;
 	}
 }
@@ -822,7 +814,6 @@ static int toshiba_usb_sleep_charge_get(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to set USB S&C mode failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -845,7 +836,6 @@ static int toshiba_usb_sleep_charge_set(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to set USB S&C mode failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -871,7 +861,6 @@ static int toshiba_sleep_functions_status_get(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to get USB S&C battery level failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
 		return -ENODEV;
 	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -900,7 +889,6 @@ static int toshiba_sleep_functions_status_set(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to set USB S&C battery level failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("USB Sleep and Charge not supported\n");
 		return -ENODEV;
 	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -927,7 +915,6 @@ static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED ||
 		   out[0] == TOS_INPUT_DATA_ERROR) {
-		pr_info("USB Rapid Charge not supported\n");
 		return -ENODEV;
 	}
 
@@ -954,7 +941,6 @@ static int toshiba_usb_rapid_charge_set(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to set USB Rapid Charge failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("USB Rapid Charge not supported\n");
 		return -ENODEV;
 	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -976,7 +962,6 @@ static int toshiba_usb_sleep_music_get(struct toshiba_acpi_dev *dev, u32 *state)
 		pr_err("ACPI call to get Sleep and Music failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Sleep and Music not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -998,7 +983,6 @@ static int toshiba_usb_sleep_music_set(struct toshiba_acpi_dev *dev, u32 state)
 		pr_err("ACPI call to set Sleep and Music failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Sleep and Music not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1021,7 +1005,6 @@ static int toshiba_function_keys_get(struct toshiba_acpi_dev *dev, u32 *mode)
 		pr_err("ACPI call to get KBD function keys failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("KBD function keys not supported\n");
 		return -ENODEV;
 	}
 
@@ -1041,7 +1024,6 @@ static int toshiba_function_keys_set(struct toshiba_acpi_dev *dev, u32 mode)
 		pr_err("ACPI call to set KBD function keys failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("KBD function keys not supported\n");
 		return -ENODEV;
 	}
 
@@ -1062,7 +1044,6 @@ static int toshiba_panel_power_on_get(struct toshiba_acpi_dev *dev, u32 *state)
 		pr_err("ACPI call to get Panel Power ON failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Panel Power on not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1084,7 +1065,6 @@ static int toshiba_panel_power_on_set(struct toshiba_acpi_dev *dev, u32 state)
 		pr_err("ACPI call to set Panel Power ON failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("Panel Power ON not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1107,7 +1087,6 @@ static int toshiba_usb_three_get(struct toshiba_acpi_dev *dev, u32 *state)
 		pr_err("ACPI call to get USB 3 failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("USB 3 not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1129,7 +1108,6 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
 		pr_err("ACPI call to set USB 3 failed\n");
 		return -EIO;
 	} else if (result == TOS_NOT_SUPPORTED) {
-		pr_info("USB 3 not supported\n");
 		return -ENODEV;
 	} else if (result == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
@@ -1151,7 +1129,6 @@ static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
 		pr_err("ACPI call to get System type failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		pr_info("System type not supported\n");
 		return -ENODEV;
 	}
 
@@ -2597,6 +2574,46 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
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
@@ -2775,6 +2792,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	if (dev->kbd_function_keys_supported && special_functions)
 		toshiba_acpi_enable_special_functions(dev);
 
+	print_supported_features(dev);
+
 	ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,
 				 &toshiba_attr_group);
 	if (ret) {
-- 
2.4.5
