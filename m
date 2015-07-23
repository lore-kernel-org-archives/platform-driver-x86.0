From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 3/4] toshiba_acpi: Refactor *{get, set} functions return value
Date: Wed, 22 Jul 2015 19:37:53 -0600
Message-ID: <1437615474-27936-8-git-send-email-coproscefalo@gmail.com>
References: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:34136 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753601AbbGWBiO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jul 2015 21:38:14 -0400
In-Reply-To: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch changes the default return value of the driver *{get, set}
functions from 0 (success) to -EIO, since the driver default error
value is -EIO.

All the functions now check for TOS_FAILURE, TOS_NOT_SUPPORTED and
TOS_SUCCESS.

On TOS_FAILURE a pr_err message is printed informing the user of the
error (no change was made to this, except the check was added to the
functions not checking for this).

On TOS_NOT_SUPPORTED we now return -ENODEV immediately (some
functions were returning -EIO)

On TOS_SUCCESS we now return 0, as a side effect, a new success value
was added, since some functions return one instead of zero to
indicate success.

As a special case, the LED functions only check for TOS_FAILURE on
*set with their default return value as LED_OFF, and check for
TOS_FAILURE and TOS_SUCCESS on *get.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 339 ++++++++++++++++++------------------
 1 file changed, 171 insertions(+), 168 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 653d1fd..c099137 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -93,6 +93,7 @@ MODULE_LICENSE("GPL");
 
 /* Return codes */
 #define TOS_SUCCESS			0x0000
+#define TOS_SUCCESS2			0x0001
 #define TOS_OPEN_CLOSE_OK		0x0044
 #define TOS_FAILURE			0x1000
 #define TOS_NOT_SUPPORTED		0x8000
@@ -467,7 +468,8 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
 {
 	struct toshiba_acpi_dev *dev = container_of(cdev,
 			struct toshiba_acpi_dev, led_dev);
-	u32 state, result;
+	u32 result;
+	u32 state;
 
 	/* First request : initialize communication. */
 	if (!sci_open(dev))
@@ -479,8 +481,6 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
 	sci_close(dev);
 	if (result == TOS_FAILURE)
 		pr_err("ACPI call for illumination failed\n");
-	else if (result == TOS_NOT_SUPPORTED)
-		return;
 }
 
 static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
@@ -496,14 +496,12 @@ static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
 	/* Check the illumination */
 	result = sci_read(dev, SCI_ILLUMINATION, &state);
 	sci_close(dev);
-	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call for illumination failed\n");
-		return LED_OFF;
-	} else if (result == TOS_NOT_SUPPORTED) {
-		return LED_OFF;
-	}
+	else if (result == TOS_SUCCESS)
+		return state ? LED_FULL : LED_OFF;
 
-	return state ? LED_FULL : LED_OFF;
+	return LED_OFF;
 }
 
 /* KBD Illumination */
@@ -553,14 +551,14 @@ static int toshiba_kbd_illum_status_set(struct toshiba_acpi_dev *dev, u32 time)
 
 	result = sci_write(dev, SCI_KBD_ILLUM_STATUS, time);
 	sci_close(dev);
-	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to set KBD backlight status failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	}
+	else if (result == TOS_SUCCESS)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_kbd_illum_status_get(struct toshiba_acpi_dev *dev, u32 *time)
@@ -572,50 +570,46 @@ static int toshiba_kbd_illum_status_get(struct toshiba_acpi_dev *dev, u32 *time)
 
 	result = sci_read(dev, SCI_KBD_ILLUM_STATUS, time);
 	sci_close(dev);
-	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to get KBD backlight status failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	}
+	else if (result == TOS_SUCCESS)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 static enum led_brightness toshiba_kbd_backlight_get(struct led_classdev *cdev)
 {
-	struct toshiba_acpi_dev *dev = container_of(cdev,
-			struct toshiba_acpi_dev, kbd_led);
-	u32 state, result;
+	struct toshiba_acpi_dev *dev;
+	u32 result;
+	u32 state;
 
+	dev = container_of(cdev, struct toshiba_acpi_dev, kbd_led);
 	/* Check the keyboard backlight state */
 	result = hci_read(dev, HCI_KBD_ILLUMINATION, &state);
-	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to get the keyboard backlight failed\n");
-		return LED_OFF;
-	} else if (result == TOS_NOT_SUPPORTED) {
-		return LED_OFF;
-	}
+	else if (result == TOS_SUCCESS)
+		return state ? LED_FULL : LED_OFF;
 
-	return state ? LED_FULL : LED_OFF;
+	return LED_OFF;
 }
 
 static void toshiba_kbd_backlight_set(struct led_classdev *cdev,
 				     enum led_brightness brightness)
 {
-	struct toshiba_acpi_dev *dev = container_of(cdev,
-			struct toshiba_acpi_dev, kbd_led);
-	u32 state, result;
+	struct toshiba_acpi_dev *dev;
+	u32 result;
+	u32 state;
 
+	dev = container_of(cdev, struct toshiba_acpi_dev, kbd_led);
 	/* Set the keyboard backlight state */
 	state = brightness ? 1 : 0;
 	result = hci_write(dev, HCI_KBD_ILLUMINATION, state);
-	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to set KBD Illumination mode failed\n");
-		return;
-	} else if (result == TOS_NOT_SUPPORTED) {
-		return;
-	}
 }
 
 /* TouchPad support */
@@ -628,14 +622,14 @@ static int toshiba_touchpad_set(struct toshiba_acpi_dev *dev, u32 state)
 
 	result = sci_write(dev, SCI_TOUCHPAD, state);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to set the touchpad failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	}
+	else if (result == TOS_SUCCESS)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *state)
@@ -647,14 +641,14 @@ static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *state)
 
 	result = sci_read(dev, SCI_TOUCHPAD, state);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to query the touchpad failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	}
+	else if (result == TOS_SUCCESS)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 /* Eco Mode support */
@@ -699,12 +693,12 @@ toshiba_eco_mode_get_status(struct led_classdev *cdev)
 	acpi_status status;
 
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
+	if (ACPI_FAILURE(status))
 		pr_err("ACPI call to get ECO led failed\n");
-		return LED_OFF;
-	}
+	else if (out[0] == TOS_SUCCESS)
+		return out[2] ? LED_FULL : LED_OFF;
 
-	return out[2] ? LED_FULL : LED_OFF;
+	return LED_OFF;
 }
 
 static void toshiba_eco_mode_set_status(struct led_classdev *cdev,
@@ -719,10 +713,8 @@ static void toshiba_eco_mode_set_status(struct led_classdev *cdev,
 	/* Switch the Eco Mode led on/off */
 	in[2] = (brightness) ? 1 : 0;
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
+	if (ACPI_FAILURE(status))
 		pr_err("ACPI call to set ECO led failed\n");
-		return;
-	}
 }
 
 /* Accelerometer support */
@@ -754,15 +746,17 @@ static int toshiba_accelerometer_get(struct toshiba_acpi_dev *dev,
 
 	/* Check the Accelerometer status */
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to query the accelerometer failed\n");
-		return -EIO;
+	} else if (out[0] == TOS_NOT_SUPPORTED) {
+		return -ENODEV;
+	} else if (out[0] == TOS_SUCCESS) {
+		*xy = out[2];
+		*z = out[4];
+		return 0;
 	}
 
-	*xy = out[2];
-	*z = out[4];
-
-	return 0;
+	return -EIO;
 }
 
 /* Sleep (Charge and Music) utilities support */
@@ -810,16 +804,14 @@ static int toshiba_usb_sleep_charge_get(struct toshiba_acpi_dev *dev,
 
 	result = sci_read(dev, SCI_USB_SLEEP_CHARGE, mode);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to set USB S&C mode failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	} else if (result == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
-	}
+	else if (result == TOS_SUCCESS)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_usb_sleep_charge_set(struct toshiba_acpi_dev *dev,
@@ -832,16 +824,14 @@ static int toshiba_usb_sleep_charge_set(struct toshiba_acpi_dev *dev,
 
 	result = sci_write(dev, SCI_USB_SLEEP_CHARGE, mode);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to set USB S&C mode failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	} else if (result == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
-	}
+	else if (result == TOS_SUCCESS)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_sleep_functions_status_get(struct toshiba_acpi_dev *dev,
@@ -859,16 +849,14 @@ static int toshiba_sleep_functions_status_get(struct toshiba_acpi_dev *dev,
 	sci_close(dev);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB S&C battery level failed\n");
-		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
 		return -ENODEV;
-	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
+	} else if (out[0] == TOS_SUCCESS) {
+		*mode = out[2];
+		return 0;
 	}
 
-	*mode = out[2];
-
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_sleep_functions_status_set(struct toshiba_acpi_dev *dev,
@@ -885,16 +873,14 @@ static int toshiba_sleep_functions_status_set(struct toshiba_acpi_dev *dev,
 	in[5] = SCI_USB_CHARGE_BAT_LVL;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status)) {
+	if (ACPI_FAILURE(status))
 		pr_err("ACPI call to set USB S&C battery level failed\n");
-		return -EIO;
-	} else if (out[0] == TOS_NOT_SUPPORTED) {
+	else if (out[0] == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
-	}
+	else if (out[0] == TOS_SUCCESS)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
@@ -912,15 +898,14 @@ static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
 	sci_close(dev);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Rapid Charge failed\n");
-		return -EIO;
-	} else if (out[0] == TOS_NOT_SUPPORTED ||
-		   out[0] == TOS_INPUT_DATA_ERROR) {
+	} else if (out[0] == TOS_NOT_SUPPORTED) {
 		return -ENODEV;
+	} else if (out[0] == TOS_SUCCESS || out[0] == TOS_SUCCESS2) {
+		*state = out[2];
+		return 0;
 	}
 
-	*state = out[2];
-
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_usb_rapid_charge_set(struct toshiba_acpi_dev *dev,
@@ -937,16 +922,14 @@ static int toshiba_usb_rapid_charge_set(struct toshiba_acpi_dev *dev,
 	in[5] = SCI_USB_CHARGE_RAPID_DSP;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status)) {
+	if (ACPI_FAILURE(status))
 		pr_err("ACPI call to set USB Rapid Charge failed\n");
-		return -EIO;
-	} else if (out[0] == TOS_NOT_SUPPORTED) {
+	else if (out[0] == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
-	}
+	else if (out[0] == TOS_SUCCESS || out[0] == TOS_SUCCESS2)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_usb_sleep_music_get(struct toshiba_acpi_dev *dev, u32 *state)
@@ -958,16 +941,14 @@ static int toshiba_usb_sleep_music_get(struct toshiba_acpi_dev *dev, u32 *state)
 
 	result = sci_read(dev, SCI_USB_SLEEP_MUSIC, state);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to get Sleep and Music failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	} else if (result == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
-	}
+	else if (result == TOS_SUCCESS)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_usb_sleep_music_set(struct toshiba_acpi_dev *dev, u32 state)
@@ -979,16 +960,14 @@ static int toshiba_usb_sleep_music_set(struct toshiba_acpi_dev *dev, u32 state)
 
 	result = sci_write(dev, SCI_USB_SLEEP_MUSIC, state);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to set Sleep and Music failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	} else if (result == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
-	}
+	else if (result == TOS_SUCCESS)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 /* Keyboard function keys */
@@ -1001,14 +980,14 @@ static int toshiba_function_keys_get(struct toshiba_acpi_dev *dev, u32 *mode)
 
 	result = sci_read(dev, SCI_KBD_FUNCTION_KEYS, mode);
 	sci_close(dev);
-	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to get KBD function keys failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	}
+	else if (result == TOS_SUCCESS || result == TOS_SUCCESS2)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_function_keys_set(struct toshiba_acpi_dev *dev, u32 mode)
@@ -1020,14 +999,14 @@ static int toshiba_function_keys_set(struct toshiba_acpi_dev *dev, u32 mode)
 
 	result = sci_write(dev, SCI_KBD_FUNCTION_KEYS, mode);
 	sci_close(dev);
-	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to set KBD function keys failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	}
+	else if (result == TOS_SUCCESS || result == TOS_SUCCESS2)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 /* Panel Power ON */
@@ -1040,16 +1019,14 @@ static int toshiba_panel_power_on_get(struct toshiba_acpi_dev *dev, u32 *state)
 
 	result = sci_read(dev, SCI_PANEL_POWER_ON, state);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to get Panel Power ON failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	} else if (result == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
-	}
+	else if (result == TOS_SUCCESS)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_panel_power_on_set(struct toshiba_acpi_dev *dev, u32 state)
@@ -1061,16 +1038,14 @@ static int toshiba_panel_power_on_set(struct toshiba_acpi_dev *dev, u32 state)
 
 	result = sci_write(dev, SCI_PANEL_POWER_ON, state);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to set Panel Power ON failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	} else if (result == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
-	}
+	else if (result == TOS_SUCCESS)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 /* USB Three */
@@ -1083,16 +1058,14 @@ static int toshiba_usb_three_get(struct toshiba_acpi_dev *dev, u32 *state)
 
 	result = sci_read(dev, SCI_USB_THREE, state);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to get USB 3 failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	} else if (result == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
-	}
+	else if (result == TOS_SUCCESS || result == TOS_SUCCESS2)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
@@ -1104,16 +1077,14 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
 
 	result = sci_write(dev, SCI_USB_THREE, state);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call to set USB 3 failed\n");
-		return -EIO;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	} else if (result == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
-	}
+	else if (result == TOS_SUCCESS || result == TOS_SUCCESS2)
+		return 0;
 
-	return 0;
+	return -EIO;
 }
 
 /* Hotkey Event type */
@@ -1127,29 +1098,43 @@ static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
 	status = tci_raw(dev, in, out);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get System type failed\n");
-		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
 		return -ENODEV;
+	} else if (out[0] == TOS_SUCCESS) {
+		*type = out[3];
+		return 0;
 	}
 
-	*type = out[3];
-
-	return 0;
+	return -EIO;
 }
 
 /* Transflective Backlight */
 static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, u32 *status)
 {
-	u32 hci_result = hci_read(dev, HCI_TR_BACKLIGHT, status);
+	u32 result = hci_read(dev, HCI_TR_BACKLIGHT, status);
 
-	return hci_result == TOS_SUCCESS ? 0 : -EIO;
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to get Transflective Backlight failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+	else if (result == TOS_SUCCESS)
+		return 0;
+
+	return -EIO;
 }
 
 static int set_tr_backlight_status(struct toshiba_acpi_dev *dev, u32 status)
 {
-	u32 hci_result = hci_write(dev, HCI_TR_BACKLIGHT, !status);
+	u32 result = hci_write(dev, HCI_TR_BACKLIGHT, !status);
 
-	return hci_result == TOS_SUCCESS ? 0 : -EIO;
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to set Transflective Backlight failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+	else if (result == TOS_SUCCESS)
+		return 0;
+
+	return -EIO;
 }
 
 static struct proc_dir_entry *toshiba_proc_dir;
@@ -1157,7 +1142,7 @@ static struct proc_dir_entry *toshiba_proc_dir;
 /* LCD Brightness */
 static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 {
-	u32 hci_result;
+	u32 result;
 	u32 value;
 	int brightness = 0;
 
@@ -1171,8 +1156,12 @@ static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 		brightness++;
 	}
 
-	hci_result = hci_read(dev, HCI_LCD_BRIGHTNESS, &value);
-	if (hci_result == TOS_SUCCESS)
+	result = hci_read(dev, HCI_LCD_BRIGHTNESS, &value);
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to get LCD Brightness failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+	else if (result == TOS_SUCCESS)
 		return brightness + (value >> HCI_LCD_BRIGHTNESS_SHIFT);
 
 	return -EIO;
@@ -1213,7 +1202,7 @@ static int lcd_proc_open(struct inode *inode, struct file *file)
 
 static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 {
-	u32 hci_result;
+	u32 result;
 
 	if (dev->tr_backlight_supported) {
 		int ret = set_tr_backlight_status(dev, !value);
@@ -1225,8 +1214,15 @@ static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 	}
 
 	value = value << HCI_LCD_BRIGHTNESS_SHIFT;
-	hci_result = hci_write(dev, HCI_LCD_BRIGHTNESS, value);
-	return hci_result == TOS_SUCCESS ? 0 : -EIO;
+	result = hci_write(dev, HCI_LCD_BRIGHTNESS, value);
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to set LCD Brightness failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+	else if (result == TOS_SUCCESS)
+		return 0;
+
+	return -EIO;
 }
 
 static int set_lcd_status(struct backlight_device *bd)
@@ -1271,12 +1267,19 @@ static const struct file_operations lcd_proc_fops = {
 	.write		= lcd_proc_write,
 };
 
+/* Video-Out */
 static int get_video_status(struct toshiba_acpi_dev *dev, u32 *status)
 {
-	u32 hci_result;
+	u32 result = hci_read(dev, HCI_VIDEO_OUT, status);
 
-	hci_result = hci_read(dev, HCI_VIDEO_OUT, status);
-	return hci_result == TOS_SUCCESS ? 0 : -EIO;
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to get Video-Out failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+	else if (result == TOS_SUCCESS)
+		return 0;
+
+	return -EIO;
 }
 
 static int video_proc_show(struct seq_file *m, void *v)
-- 
2.4.5
