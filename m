From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 2/3] toshiba_acpi: Change error checking logic from TCI functions
Date: Mon, 29 Aug 2016 09:37:35 -0600
Message-ID: <20160829153736.18273-3-coproscefalo@gmail.com>
References: <20160829153736.18273-1-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160829153736.18273-1-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently the success/error checking logic is intermixed, making the
code a bit cumbersome to understand.

This patch changes the affected functions to first check for errors
and take appropriate actions, then check for the supported features.

This patch also separates the error check from the acpi_status and
the tci_raw function call error check, as those two are completely
unrelated and were nested in if/else statements.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 226 ++++++++++++++++++++++--------------
 1 file changed, 138 insertions(+), 88 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 54dea64..cc14e80 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -476,10 +476,15 @@ static void toshiba_illumination_available(struct toshiba_acpi_dev *dev)
 
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status))
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to query Illumination support failed\n");
-	else if (out[0] == TOS_SUCCESS)
-		dev->illumination_supported = 1;
+		return;
+	}
+
+	if (out[0] != TOS_SUCCESS)
+		return;
+
+	dev->illumination_supported = 1;
 }
 
 static void toshiba_illumination_set(struct led_classdev *cdev,
@@ -544,24 +549,28 @@ static void toshiba_kbd_illum_available(struct toshiba_acpi_dev *dev)
 	sci_close(dev);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to query kbd illumination support failed\n");
-	} else if (out[0] == TOS_SUCCESS) {
-		/*
-		 * Check for keyboard backlight timeout max value,
-		 * previous kbd backlight implementation set this to
-		 * 0x3c0003, and now the new implementation set this
-		 * to 0x3c001a, use this to distinguish between them.
-		 */
-		if (out[3] == SCI_KBD_TIME_MAX)
-			dev->kbd_type = 2;
-		else
-			dev->kbd_type = 1;
-		/* Get the current keyboard backlight mode */
-		dev->kbd_mode = out[2] & SCI_KBD_MODE_MASK;
-		/* Get the current time (1-60 seconds) */
-		dev->kbd_time = out[2] >> HCI_MISC_SHIFT;
-		/* Flag as supported */
-		dev->kbd_illum_supported = 1;
+		return;
 	}
+
+	if (out[0] != TOS_SUCCESS)
+		return;
+
+	/*
+	 * Check for keyboard backlight timeout max value,
+	 * previous kbd backlight implementation set this to
+	 * 0x3c0003, and now the new implementation set this
+	 * to 0x3c001a, use this to distinguish between them.
+	 */
+	if (out[3] == SCI_KBD_TIME_MAX)
+		dev->kbd_type = 2;
+	else
+		dev->kbd_type = 1;
+	/* Get the current keyboard backlight mode */
+	dev->kbd_mode = out[2] & SCI_KBD_MODE_MASK;
+	/* Get the current time (1-60 seconds) */
+	dev->kbd_time = out[2] >> HCI_MISC_SHIFT;
+	/* Flag as supported */
+	dev->kbd_illum_supported = 1;
 }
 
 static int toshiba_kbd_illum_status_set(struct toshiba_acpi_dev *dev, u32 time)
@@ -680,7 +689,10 @@ static void toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 	status = tci_raw(dev, in, out);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get ECO led failed\n");
-	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
+		return;
+	}
+
+	if (out[0] == TOS_INPUT_DATA_ERROR) {
 		/*
 		 * If we receive 0x8300 (Input Data Error), it means that the
 		 * LED device is present, but that we just screwed the input
@@ -692,10 +704,15 @@ static void toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 		 */
 		in[3] = 1;
 		status = tci_raw(dev, in, out);
-		if (ACPI_FAILURE(status))
+		if (ACPI_FAILURE(status)) {
 			pr_err("ACPI call to get ECO led failed\n");
-		else if (out[0] == TOS_SUCCESS)
-			dev->eco_supported = 1;
+			return;
+		}
+
+		if (out[0] != TOS_SUCCESS)
+			return;
+
+		dev->eco_supported = 1;
 	}
 }
 
@@ -712,10 +729,11 @@ toshiba_eco_mode_get_status(struct led_classdev *cdev)
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get ECO led failed\n");
 		return LED_OFF;
-	} else if (out[0] != TOS_SUCCESS) {
-		return LED_OFF;
 	}
 
+	if (out[0] != TOS_SUCCESS)
+		return LED_OFF;
+
 	return out[2] ? LED_FULL : LED_OFF;
 }
 
@@ -749,10 +767,15 @@ static void toshiba_accelerometer_available(struct toshiba_acpi_dev *dev)
 	 * this call also serves as initialization
 	 */
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status))
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to query the accelerometer failed\n");
-	else if (out[0] == TOS_SUCCESS)
-		dev->accelerometer_supported = 1;
+		return;
+	}
+
+	if (out[0] != TOS_SUCCESS)
+		return;
+
+	dev->accelerometer_supported = 1;
 }
 
 static int toshiba_accelerometer_get(struct toshiba_acpi_dev *dev,
@@ -767,15 +790,18 @@ static int toshiba_accelerometer_get(struct toshiba_acpi_dev *dev,
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to query the accelerometer failed\n");
 		return -EIO;
-	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		return -ENODEV;
-	} else if (out[0] == TOS_SUCCESS) {
-		*xy = out[2];
-		*z = out[4];
-		return 0;
 	}
 
-	return -EIO;
+	if (out[0] == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	if (out[0] != TOS_SUCCESS)
+		return -EIO;
+
+	*xy = out[2];
+	*z = out[4];
+
+	return 0;
 }
 
 /* Sleep (Charge and Music) utilities support */
@@ -795,24 +821,29 @@ static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
 		pr_err("ACPI call to get USB Sleep and Charge mode failed\n");
 		sci_close(dev);
 		return;
-	} else if (out[0] == TOS_NOT_SUPPORTED) {
+	}
+
+	if (out[0] != TOS_SUCCESS) {
 		sci_close(dev);
 		return;
-	} else if (out[0] == TOS_SUCCESS) {
-		dev->usbsc_mode_base = out[4];
 	}
 
+	dev->usbsc_mode_base = out[4];
+
 	in[5] = SCI_USB_CHARGE_BAT_LVL;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Sleep and Charge mode failed\n");
-	} else if (out[0] == TOS_SUCCESS) {
-		dev->usbsc_bat_level = out[2];
-		/* Flag as supported */
-		dev->usb_sleep_charge_supported = 1;
+		return;
 	}
 
+	if (out[0] != TOS_SUCCESS)
+		return;
+
+	dev->usbsc_bat_level = out[2];
+	/* Flag as supported */
+	dev->usb_sleep_charge_supported = 1;
 }
 
 static int toshiba_usb_sleep_charge_get(struct toshiba_acpi_dev *dev,
@@ -866,14 +897,19 @@ static int toshiba_sleep_functions_status_get(struct toshiba_acpi_dev *dev,
 	sci_close(dev);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB S&C battery level failed\n");
-	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		return -ENODEV;
-	} else if (out[0] == TOS_SUCCESS) {
-		*mode = out[2];
-		return 0;
+		return -EIO;
 	}
 
-	return -EIO;
+	if (out[0] == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	if (out[0] != TOS_SUCCESS)
+		return -EIO;
+
+	*mode = out[2];
+
+	return 0;
+
 }
 
 static int toshiba_sleep_functions_status_set(struct toshiba_acpi_dev *dev,
@@ -890,9 +926,12 @@ static int toshiba_sleep_functions_status_set(struct toshiba_acpi_dev *dev,
 	in[5] = SCI_USB_CHARGE_BAT_LVL;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status))
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to set USB S&C battery level failed\n");
-	else if (out[0] == TOS_NOT_SUPPORTED)
+		return -EIO;
+	}
+
+	if (out[0] == TOS_NOT_SUPPORTED)
 		return -ENODEV;
 
 	return out[0] == TOS_SUCCESS ? 0 : -EIO;
@@ -913,14 +952,18 @@ static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
 	sci_close(dev);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get USB Rapid Charge failed\n");
-	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		return -ENODEV;
-	} else if (out[0] == TOS_SUCCESS || out[0] == TOS_SUCCESS2) {
-		*state = out[2];
-		return 0;
+		return -EIO;
 	}
 
-	return -EIO;
+	if (out[0] == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	if (out[0] != TOS_SUCCESS && out[0] != TOS_SUCCESS2)
+		return -EIO;
+
+	*state = out[2];
+
+	return 0;
 }
 
 static int toshiba_usb_rapid_charge_set(struct toshiba_acpi_dev *dev,
@@ -937,9 +980,12 @@ static int toshiba_usb_rapid_charge_set(struct toshiba_acpi_dev *dev,
 	in[5] = SCI_USB_CHARGE_RAPID_DSP;
 	status = tci_raw(dev, in, out);
 	sci_close(dev);
-	if (ACPI_FAILURE(status))
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to set USB Rapid Charge failed\n");
-	else if (out[0] == TOS_NOT_SUPPORTED)
+		return -EIO;
+	}
+
+	if (out[0] == TOS_NOT_SUPPORTED)
 		return -ENODEV;
 
 	return (out[0] == TOS_SUCCESS || out[0] == TOS_SUCCESS2) ? 0 : -EIO;
@@ -1095,14 +1141,18 @@ static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
 	status = tci_raw(dev, in, out);
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get System type failed\n");
-	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		return -ENODEV;
-	} else if (out[0] == TOS_SUCCESS) {
-		*type = out[3];
-		return 0;
+		return -EIO;
 	}
 
-	return -EIO;
+	if (out[0] == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	if (out[0] != TOS_SUCCESS)
+		return -EIO;
+
+	*type = out[3];
+
+	return 0;
 }
 
 /* Wireless status (RFKill, WLAN, BT, WWAN) */
@@ -1152,7 +1202,6 @@ static void toshiba_wwan_available(struct toshiba_acpi_dev *dev)
 	 */
 	in[3] = HCI_WIRELESS_WWAN;
 	status = tci_raw(dev, in, out);
-
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get WWAN status failed\n");
 		return;
@@ -1172,7 +1221,6 @@ static int toshiba_wwan_set(struct toshiba_acpi_dev *dev, u32 state)
 
 	in[3] = HCI_WIRELESS_WWAN_STATUS;
 	status = tci_raw(dev, in, out);
-
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to set WWAN status failed\n");
 		return -EIO;
@@ -1191,7 +1239,6 @@ static int toshiba_wwan_set(struct toshiba_acpi_dev *dev, u32 state)
 	 */
 	in[3] = HCI_WIRELESS_WWAN_POWER;
 	status = tci_raw(dev, in, out);
-
 	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to set WWAN power failed\n");
 		return -EIO;
@@ -1214,8 +1261,10 @@ static void toshiba_cooling_method_available(struct toshiba_acpi_dev *dev)
 	dev->max_cooling_method = 0;
 
 	status = tci_raw(dev, in, out);
-	if (ACPI_FAILURE(status))
+	if (ACPI_FAILURE(status)) {
 		pr_err("ACPI call to get Cooling Method failed\n");
+		return;
+	}
 
 	if (out[0] != TOS_SUCCESS && out[0] != TOS_SUCCESS2)
 		return;
@@ -1299,10 +1348,10 @@ static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 		pr_err("ACPI call to get LCD Brightness failed\n");
 	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	if (result == TOS_SUCCESS)
-		return brightness + (value >> HCI_LCD_BRIGHTNESS_SHIFT);
 
-	return -EIO;
+	return result == TOS_SUCCESS ?
+			brightness + (value >> HCI_LCD_BRIGHTNESS_SHIFT) :
+			-EIO;
 }
 
 static int get_lcd_brightness(struct backlight_device *bd)
@@ -1323,15 +1372,15 @@ static int lcd_proc_show(struct seq_file *m, void *v)
 
 	levels = dev->backlight_dev->props.max_brightness + 1;
 	value = get_lcd_brightness(dev->backlight_dev);
-	if (value >= 0) {
-		seq_printf(m, "brightness:              %d\n", value);
-		seq_printf(m, "brightness_levels:       %d\n", levels);
-		return 0;
+	if (value < 0) {
+		pr_err("Error reading LCD brightness\n");
+		return value;
 	}
 
-	pr_err("Error reading LCD brightness\n");
+	seq_printf(m, "brightness:              %d\n", value);
+	seq_printf(m, "brightness_levels:       %d\n", levels);
 
-	return -EIO;
+	return 0;
 }
 
 static int lcd_proc_open(struct inode *inode, struct file *file)
@@ -1419,20 +1468,21 @@ static int get_video_status(struct toshiba_acpi_dev *dev, u32 *status)
 static int video_proc_show(struct seq_file *m, void *v)
 {
 	struct toshiba_acpi_dev *dev = m->private;
+	int is_lcd, is_crt, is_tv;
 	u32 value;
 
-	if (!get_video_status(dev, &value)) {
-		int is_lcd = (value & HCI_VIDEO_OUT_LCD) ? 1 : 0;
-		int is_crt = (value & HCI_VIDEO_OUT_CRT) ? 1 : 0;
-		int is_tv = (value & HCI_VIDEO_OUT_TV) ? 1 : 0;
+	if (get_video_status(dev, &value))
+		return -EIO;
 
-		seq_printf(m, "lcd_out:                 %d\n", is_lcd);
-		seq_printf(m, "crt_out:                 %d\n", is_crt);
-		seq_printf(m, "tv_out:                  %d\n", is_tv);
-		return 0;
-	}
+	is_lcd = (value & HCI_VIDEO_OUT_LCD) ? 1 : 0;
+	is_crt = (value & HCI_VIDEO_OUT_CRT) ? 1 : 0;
+	is_tv = (value & HCI_VIDEO_OUT_TV) ? 1 : 0;
+
+	seq_printf(m, "lcd_out:                 %d\n", is_lcd);
+	seq_printf(m, "crt_out:                 %d\n", is_crt);
+	seq_printf(m, "tv_out:                  %d\n", is_tv);
 
-	return -EIO;
+	return 0;
 }
 
 static int video_proc_open(struct inode *inode, struct file *file)
-- 
2.9.3
