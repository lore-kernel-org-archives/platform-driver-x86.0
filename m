From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 3/4] toshiba_acpi: Refactor *{get, set} functions return value
Date: Mon, 27 Jul 2015 19:22:27 -0600
Message-ID: <1438046548-3081-5-git-send-email-coproscefalo@gmail.com>
References: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438046548-3081-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

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
*set, and check for TOS_FAILURE and TOS_SUCCESS on *get with their
default return value set to LED_OFF.

Also the {lcd, video}_proc* functions were adapted to reflect these
changes to their parent HCI functions.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 432 ++++++++++++++++++------------------
 1 file changed, 217 insertions(+), 215 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index e24f0f5..0034341 100644
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
@@ -1196,14 +1185,15 @@ static int lcd_proc_show(struct seq_file *m, void *v)
 
 	levels = dev->backlight_dev->props.max_brightness + 1;
 	value = get_lcd_brightness(dev->backlight_dev);
-	if (value >= 0) {
-		seq_printf(m, "brightness:              %d\n", value);
-		seq_printf(m, "brightness_levels:       %d\n", levels);
-		return 0;
+	if (value < 0) {
+		pr_err("Error reading LCD brightness\n");
+		return -EIO;
 	}
 
-	pr_err("Error reading LCD brightness\n");
-	return -EIO;
+	seq_printf(m, "brightness:              %d\n", value);
+	seq_printf(m, "brightness_levels:       %d\n", levels);
+
+	return 0;
 }
 
 static int lcd_proc_open(struct inode *inode, struct file *file)
@@ -1213,7 +1203,7 @@ static int lcd_proc_open(struct inode *inode, struct file *file)
 
 static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 {
-	u32 hci_result;
+	u32 result;
 
 	if (dev->tr_backlight_supported) {
 		int ret = set_tr_backlight_status(dev, !value);
@@ -1225,8 +1215,15 @@ static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
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
@@ -1242,24 +1239,22 @@ static ssize_t lcd_proc_write(struct file *file, const char __user *buf,
 	struct toshiba_acpi_dev *dev = PDE_DATA(file_inode(file));
 	char cmd[42];
 	size_t len;
-	int value;
-	int ret;
 	int levels = dev->backlight_dev->props.max_brightness + 1;
+	int value;
 
 	len = min(count, sizeof(cmd) - 1);
 	if (copy_from_user(cmd, buf, len))
 		return -EFAULT;
 	cmd[len] = '\0';
 
-	if (sscanf(cmd, " brightness : %i", &value) == 1 &&
-	    value >= 0 && value < levels) {
-		ret = set_lcd_brightness(dev, value);
-		if (ret == 0)
-			ret = count;
-	} else {
-		ret = -EINVAL;
-	}
-	return ret;
+	if (sscanf(cmd, " brightness : %i", &value) != 1 &&
+	    value < 0 && value > levels)
+		return -EINVAL;
+
+	if (set_lcd_brightness(dev, value))
+		return -EIO;
+
+	return count;
 }
 
 static const struct file_operations lcd_proc_fops = {
@@ -1271,32 +1266,38 @@ static const struct file_operations lcd_proc_fops = {
 	.write		= lcd_proc_write,
 };
 
+/* Video-Out */
 static int get_video_status(struct toshiba_acpi_dev *dev, u32 *status)
 {
-	u32 hci_result;
+	u32 result = hci_read(dev, HCI_VIDEO_OUT, status);
+
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to get Video-Out failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+	else if (result == TOS_SUCCESS)
+		return 0;
 
-	hci_result = hci_read(dev, HCI_VIDEO_OUT, status);
-	return hci_result == TOS_SUCCESS ? 0 : -EIO;
+	return -EIO;
 }
 
 static int video_proc_show(struct seq_file *m, void *v)
 {
 	struct toshiba_acpi_dev *dev = m->private;
 	u32 value;
-	int ret;
 
-	ret = get_video_status(dev, &value);
-	if (!ret) {
-		int is_lcd = (value & HCI_VIDEO_OUT_LCD) ? 1 : 0;
-		int is_crt = (value & HCI_VIDEO_OUT_CRT) ? 1 : 0;
-		int is_tv = (value & HCI_VIDEO_OUT_TV) ? 1 : 0;
+	if (get_video_status(dev, &value))
+		return -EIO;
 
-		seq_printf(m, "lcd_out:                 %d\n", is_lcd);
-		seq_printf(m, "crt_out:                 %d\n", is_crt);
-		seq_printf(m, "tv_out:                  %d\n", is_tv);
-	}
+	int is_lcd = (value & HCI_VIDEO_OUT_LCD) ? 1 : 0;
+	int is_crt = (value & HCI_VIDEO_OUT_CRT) ? 1 : 0;
+	int is_tv = (value & HCI_VIDEO_OUT_TV) ? 1 : 0;
 
-	return ret;
+	seq_printf(m, "lcd_out:                 %d\n", is_lcd);
+	seq_printf(m, "crt_out:                 %d\n", is_crt);
+	seq_printf(m, "tv_out:                  %d\n", is_tv);
+
+	return 0;
 }
 
 static int video_proc_open(struct inode *inode, struct file *file)
@@ -1308,13 +1309,15 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 				size_t count, loff_t *pos)
 {
 	struct toshiba_acpi_dev *dev = PDE_DATA(file_inode(file));
-	char *cmd, *buffer;
-	int ret;
-	int value;
+	unsigned int new_video_out;
+	char *buffer;
+	char *cmd;
 	int remain = count;
 	int lcd_out = -1;
 	int crt_out = -1;
 	int tv_out = -1;
+	int value;
+	int ret;
 	u32 video_out;
 
 	cmd = kmalloc(count + 1, GFP_KERNEL);
@@ -1348,23 +1351,22 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 
 	kfree(cmd);
 
-	ret = get_video_status(dev, &video_out);
-	if (!ret) {
-		unsigned int new_video_out = video_out;
+	if (get_video_status(dev, &video_out))
+		return -EIO;
 
-		if (lcd_out != -1)
-			_set_bit(&new_video_out, HCI_VIDEO_OUT_LCD, lcd_out);
-		if (crt_out != -1)
-			_set_bit(&new_video_out, HCI_VIDEO_OUT_CRT, crt_out);
-		if (tv_out != -1)
-			_set_bit(&new_video_out, HCI_VIDEO_OUT_TV, tv_out);
-		/*
-		 * To avoid unnecessary video disruption, only write the new
-		 * video setting if something changed.
-		 */
-		if (new_video_out != video_out)
-			ret = write_acpi_int(METHOD_VIDEO_OUT, new_video_out);
-	}
+	new_video_out = video_out;
+	if (lcd_out != -1)
+		_set_bit(&new_video_out, HCI_VIDEO_OUT_LCD, lcd_out);
+	if (crt_out != -1)
+		_set_bit(&new_video_out, HCI_VIDEO_OUT_CRT, crt_out);
+	if (tv_out != -1)
+		_set_bit(&new_video_out, HCI_VIDEO_OUT_TV, tv_out);
+	/*
+	 * To avoid unnecessary video disruption, only write the new
+	 * video setting if something changed.
+	 */
+	if (new_video_out != video_out)
+		ret = write_acpi_int(METHOD_VIDEO_OUT, new_video_out);
 
 	return ret ? ret : count;
 }
-- 
2.4.6
