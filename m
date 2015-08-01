From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 4/5] toshiba_acpi: Remove unnecessary checks and returns in HCI/SCI functions
Date: Fri, 31 Jul 2015 21:58:15 -0600
Message-ID: <1438401496-27744-5-git-send-email-coproscefalo@gmail.com>
References: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

A previous patch added explicit feature checks for support, *SUCCESS*
and *FAILURE to the HCI/SCI *{get, set} functions.

This patch removes some unnedded checks to the driver HCI/SCI
functions given that the default error return value is now set to
-EIO, there is no need to check for other error values other than
the ones currently checking for.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 169 ++++++++++--------------------------
 1 file changed, 44 insertions(+), 125 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 7b16d8d..4802fd7 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -459,8 +459,6 @@ static void toshiba_illumination_available(struct toshiba_acpi_dev *dev)
 	sci_close(dev);
 	if (ACPI_FAILURE(status))
 		pr_err("ACPI call to query Illumination support failed\n");
-	else if (out[0] == TOS_NOT_SUPPORTED)
-		return;
 	else if (out[0] == TOS_SUCCESS)
 		dev->illumination_supported = 1;
 }
@@ -481,12 +479,8 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
 	state = brightness ? 1 : 0;
 	result = sci_write(dev, SCI_ILLUMINATION, state);
 	sci_close(dev);
-	if (result == TOS_FAILURE) {
+	if (result == TOS_FAILURE)
 		pr_err("ACPI call for illumination failed\n");
-		return;
-	} else if (result == TOS_NOT_SUPPORTED) {
-		return;
-	}
 }
 
 static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
@@ -502,7 +496,7 @@ static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
 	/* Check the illumination */
 	result = sci_read(dev, SCI_ILLUMINATION, &state);
 	sci_close(dev);
-	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
+	if (result == TOS_FAILURE) {
 		pr_err("ACPI call for illumination failed\n");
 		return LED_OFF;
 	} else if (result != TOS_SUCCESS) {
@@ -527,10 +521,8 @@ static void toshiba_kbd_illum_available(struct toshiba_acpi_dev *dev)
 
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to query kbd illumination support failed\n");
-	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		return;
 	} else if (out[0] == TOS_SUCCESS) {
 		/*
 		 * Check for keyboard backlight timeout max value,
@@ -560,12 +552,10 @@ static int toshiba_kbd_illum_status_set(struct toshiba_acpi_dev *dev, u32 time)
 
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
 
 	return result == TOS_SUCCESS ? 0 : -EIO;
 }
@@ -579,12 +569,10 @@ static int toshiba_kbd_illum_status_get(struct toshiba_acpi_dev *dev, u32 *time)
 
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
 
 	return result == TOS_SUCCESS ? 0 : -EIO;
 }
@@ -598,7 +586,7 @@ static enum led_brightness toshiba_kbd_backlight_get(struct led_classdev *cdev)
 
 	/* Check the keyboard backlight state */
 	result = hci_read(dev, HCI_KBD_ILLUMINATION, &state);
-	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
+	if (result == TOS_FAILURE) {
 		pr_err("ACPI call to get the keyboard backlight failed\n");
 		return LED_OFF;
 	} else if (result != TOS_SUCCESS) {
@@ -619,12 +607,8 @@ static void toshiba_kbd_backlight_set(struct led_classdev *cdev,
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
@@ -637,12 +621,10 @@ static int toshiba_touchpad_set(struct toshiba_acpi_dev *dev, u32 state)
 
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
 
 	return result == TOS_SUCCESS ? 0 : -EIO;
 }
@@ -656,12 +638,10 @@ static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *state)
 
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
 
 	return result == TOS_SUCCESS ? 0 : -EIO;
 }
@@ -679,8 +659,6 @@ static void toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 	status = tci_raw(dev, in, out);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get ECO led failed\n");
-	} else if (out[0] == TOS_NOT_INSTALLED) {
-		pr_info("ECO led not installed");
 	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
 		/*
 		 * If we receive 0x8300 (Input Data Error), it means that the
@@ -693,7 +671,7 @@ static void toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 		 */
 		in[3] = 1;
 		status = tci_raw(dev, in, out);
-		if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE)
+		if (ACPI_FAILURE(status))
 			pr_err("ACPI call to get ECO led failed\n");
 		else if (out[0] == TOS_SUCCESS)
 			dev->eco_supported = 1;
@@ -710,7 +688,7 @@ toshiba_eco_mode_get_status(struct led_classdev *cdev)
 	acpi_status status;
 
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get ECO led failed\n");
 		return LED_OFF;
 	} else if (out[0] != TOS_SUCCESS) {
@@ -732,10 +710,8 @@ static void toshiba_eco_mode_set_status(struct led_classdev *cdev,
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
@@ -752,19 +728,14 @@ static void toshiba_accelerometer_available(struct toshiba_acpi_dev *dev)
 	 * this call also serves as initialization
 	 */
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR)
+	if (ACPI_FAILURE(status))
 		pr_err("ACPI call to query the accelerometer failed\n");
-	else if (out[0] == TOS_DATA_NOT_AVAILABLE ||
-		   out[0] == TOS_NOT_INITIALIZED)
-		pr_err("Accelerometer not initialized\n");
-	else if (out[0] == TOS_NOT_SUPPORTED)
-		return;
 	else if (out[0] == TOS_SUCCESS)
 		dev->accelerometer_supported = 1;
 }
 
 static int toshiba_accelerometer_get(struct toshiba_acpi_dev *dev,
-				      u32 *xy, u32 *z)
+				     u32 *xy, u32 *z)
 {
 	u32 in[TCI_WORDS] = { HCI_GET, HCI_ACCELEROMETER, 0, 1, 0, 0 };
 	u32 out[TCI_WORDS];
@@ -772,7 +743,7 @@ static int toshiba_accelerometer_get(struct toshiba_acpi_dev *dev,
 
 	/* Check the Accelerometer status */
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to query the accelerometer failed\n");
 		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
@@ -815,8 +786,6 @@ static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
 	sci_close(dev);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Sleep and Charge mode failed\n");
-	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		return;
 	} else if (out[0] == TOS_SUCCESS) {
 		dev->usbsc_bat_level = out[2];
 		/* Flag as supported */
@@ -835,14 +804,10 @@ static int toshiba_usb_sleep_charge_get(struct toshiba_acpi_dev *dev,
 
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
 
 	return result == TOS_SUCCESS ? 0 : -EIO;
 }
@@ -857,14 +822,10 @@ static int toshiba_usb_sleep_charge_set(struct toshiba_acpi_dev *dev,
 
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
 
 	return result == TOS_SUCCESS ? 0 : -EIO;
 }
@@ -884,11 +845,8 @@ static int toshiba_sleep_functions_status_get(struct toshiba_acpi_dev *dev,
 	sci_close(dev);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB S&C battery level failed\n");
-		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
 		return -ENODEV;
-	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
-		return -EIO;
 	} else if (out[0] == TOS_SUCCESS) {
 		*mode = out[2];
 		return 0;
@@ -911,14 +869,10 @@ static int toshiba_sleep_functions_status_set(struct toshiba_acpi_dev *dev,
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
 
 	return out[0] == TOS_SUCCESS ? 0 : -EIO;
 }
@@ -938,9 +892,7 @@ static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
 	sci_close(dev);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Rapid Charge failed\n");
-		return -EIO;
-	} else if (out[0] == TOS_NOT_SUPPORTED ||
-		   out[0] == TOS_INPUT_DATA_ERROR) {
+	} else if (out[0] == TOS_NOT_SUPPORTED) {
 		return -ENODEV;
 	} else if (out[0] == TOS_SUCCESS || out[0] == TOS_SUCCESS2) {
 		*state = out[2];
@@ -964,14 +916,10 @@ static int toshiba_usb_rapid_charge_set(struct toshiba_acpi_dev *dev,
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
 
 	return (out[0] == TOS_SUCCESS || out[0] == TOS_SUCCESS2) ? 0 : -EIO;
 }
@@ -985,14 +933,10 @@ static int toshiba_usb_sleep_music_get(struct toshiba_acpi_dev *dev, u32 *state)
 
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
 
 	return result = TOS_SUCCESS ? 0 : -EIO;
 }
@@ -1006,14 +950,10 @@ static int toshiba_usb_sleep_music_set(struct toshiba_acpi_dev *dev, u32 state)
 
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
 
 	return result == TOS_SUCCESS ? 0 : -EIO;
 }
@@ -1028,12 +968,10 @@ static int toshiba_function_keys_get(struct toshiba_acpi_dev *dev, u32 *mode)
 
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
 
 	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
 }
@@ -1047,12 +985,10 @@ static int toshiba_function_keys_set(struct toshiba_acpi_dev *dev, u32 mode)
 
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
 
 	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
 }
@@ -1067,14 +1003,10 @@ static int toshiba_panel_power_on_get(struct toshiba_acpi_dev *dev, u32 *state)
 
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
 
 	return result == TOS_SUCCESS ? 0 : -EIO;
 }
@@ -1088,14 +1020,10 @@ static int toshiba_panel_power_on_set(struct toshiba_acpi_dev *dev, u32 state)
 
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
 
 	return result == TOS_SUCCESS ? 0 : -EIO;
 }
@@ -1110,14 +1038,10 @@ static int toshiba_usb_three_get(struct toshiba_acpi_dev *dev, u32 *state)
 
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
 
 	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
 }
@@ -1131,14 +1055,10 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
 
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
 
 	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) 0 : -EIO;
 }
@@ -1154,7 +1074,6 @@ static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
 	status = tci_raw(dev, in, out);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get System type failed\n");
-		return -EIO;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
 		return -ENODEV;
 	} else if (out[0] == TOS_SUCCESS) {
-- 
2.4.6
