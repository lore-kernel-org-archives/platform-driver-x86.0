From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 2/5] toshiba_acpi: Rename hci_{read, write}1 functions
Date: Mon,  4 May 2015 11:15:55 -0600
Message-ID: <1430759758-4026-3-git-send-email-coproscefalo@gmail.com>
References: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430759758-4026-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch simply renames the hci_{read, write}1 functions to
hci_{read, write}.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 44 ++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index e593762..19efb05 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -326,13 +326,13 @@ static acpi_status tci_raw(struct toshiba_acpi_dev *dev,
 }
 
 /*
- * Common hci tasks (get or set one or two value)
+ * Common hci tasks
  *
  * In addition to the ACPI status, the HCI system returns a result which
  * may be useful (such as "not supported").
  */
 
-static u32 hci_write1(struct toshiba_acpi_dev *dev, u32 reg, u32 in1)
+static u32 hci_write(struct toshiba_acpi_dev *dev, u32 reg, u32 in1)
 {
 	u32 in[TCI_WORDS] = { HCI_SET, reg, in1, 0, 0, 0 };
 	u32 out[TCI_WORDS];
@@ -341,7 +341,7 @@ static u32 hci_write1(struct toshiba_acpi_dev *dev, u32 reg, u32 in1)
 	return ACPI_SUCCESS(status) ? out[0] : TOS_FAILURE;
 }
 
-static u32 hci_read1(struct toshiba_acpi_dev *dev, u32 reg, u32 *out1)
+static u32 hci_read(struct toshiba_acpi_dev *dev, u32 reg, u32 *out1)
 {
 	u32 in[TCI_WORDS] = { HCI_GET, reg, 0, 0, 0, 0 };
 	u32 out[TCI_WORDS];
@@ -596,7 +596,7 @@ static enum led_brightness toshiba_kbd_backlight_get(struct led_classdev *cdev)
 	u32 state, result;
 
 	/* Check the keyboard backlight state */
-	result = hci_read1(dev, HCI_KBD_ILLUMINATION, &state);
+	result = hci_read(dev, HCI_KBD_ILLUMINATION, &state);
 	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
 		pr_err("ACPI call to get the keyboard backlight failed\n");
 		return LED_OFF;
@@ -617,7 +617,7 @@ static void toshiba_kbd_backlight_set(struct led_classdev *cdev,
 
 	/* Set the keyboard backlight state */
 	state = brightness ? 1 : 0;
-	result = hci_write1(dev, HCI_KBD_ILLUMINATION, state);
+	result = hci_write(dev, HCI_KBD_ILLUMINATION, state);
 	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
 		pr_err("ACPI call to set KBD Illumination mode failed\n");
 		return;
@@ -1188,7 +1188,7 @@ static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, bool *enabled)
 	u32 hci_result;
 	u32 status;
 
-	hci_result = hci_read1(dev, HCI_TR_BACKLIGHT, &status);
+	hci_result = hci_read(dev, HCI_TR_BACKLIGHT, &status);
 	*enabled = !status;
 	return hci_result == TOS_SUCCESS ? 0 : -EIO;
 }
@@ -1198,7 +1198,7 @@ static int set_tr_backlight_status(struct toshiba_acpi_dev *dev, bool enable)
 	u32 hci_result;
 	u32 value = !enable;
 
-	hci_result = hci_write1(dev, HCI_TR_BACKLIGHT, value);
+	hci_result = hci_write(dev, HCI_TR_BACKLIGHT, value);
 	return hci_result == TOS_SUCCESS ? 0 : -EIO;
 }
 
@@ -1221,7 +1221,7 @@ static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 		brightness++;
 	}
 
-	hci_result = hci_read1(dev, HCI_LCD_BRIGHTNESS, &value);
+	hci_result = hci_read(dev, HCI_LCD_BRIGHTNESS, &value);
 	if (hci_result == TOS_SUCCESS)
 		return brightness + (value >> HCI_LCD_BRIGHTNESS_SHIFT);
 
@@ -1276,7 +1276,7 @@ static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 	}
 
 	value = value << HCI_LCD_BRIGHTNESS_SHIFT;
-	hci_result = hci_write1(dev, HCI_LCD_BRIGHTNESS, value);
+	hci_result = hci_write(dev, HCI_LCD_BRIGHTNESS, value);
 	return hci_result == TOS_SUCCESS ? 0 : -EIO;
 }
 
@@ -1326,7 +1326,7 @@ static int get_video_status(struct toshiba_acpi_dev *dev, u32 *status)
 {
 	u32 hci_result;
 
-	hci_result = hci_read1(dev, HCI_VIDEO_OUT, status);
+	hci_result = hci_read(dev, HCI_VIDEO_OUT, status);
 	return hci_result == TOS_SUCCESS ? 0 : -EIO;
 }
 
@@ -1432,7 +1432,7 @@ static int get_fan_status(struct toshiba_acpi_dev *dev, u32 *status)
 {
 	u32 hci_result;
 
-	hci_result = hci_read1(dev, HCI_FAN, status);
+	hci_result = hci_read(dev, HCI_FAN, status);
 	return hci_result == TOS_SUCCESS ? 0 : -EIO;
 }
 
@@ -1472,7 +1472,7 @@ static ssize_t fan_proc_write(struct file *file, const char __user *buf,
 
 	if (sscanf(cmd, " force_on : %i", &value) == 1 &&
 	    value >= 0 && value <= 1) {
-		hci_result = hci_write1(dev, HCI_FAN, value);
+		hci_result = hci_write(dev, HCI_FAN, value);
 		if (hci_result == TOS_SUCCESS)
 			dev->force_fan = value;
 		else
@@ -1500,7 +1500,7 @@ static int keys_proc_show(struct seq_file *m, void *v)
 	u32 value;
 
 	if (!dev->key_event_valid && dev->system_event_supported) {
-		hci_result = hci_read1(dev, HCI_SYSTEM_EVENT, &value);
+		hci_result = hci_read(dev, HCI_SYSTEM_EVENT, &value);
 		if (hci_result == TOS_SUCCESS) {
 			dev->key_event_valid = 1;
 			dev->last_key_event = value;
@@ -1512,7 +1512,7 @@ static int keys_proc_show(struct seq_file *m, void *v)
 			 * some machines where system events sporadically
 			 * become disabled.
 			 */
-			hci_result = hci_write1(dev, HCI_SYSTEM_EVENT, 1);
+			hci_result = hci_write(dev, HCI_SYSTEM_EVENT, 1);
 			pr_notice("Re-enabled hotkeys\n");
 		} else {
 			pr_err("Error reading hotkey status\n");
@@ -1649,7 +1649,7 @@ static ssize_t fan_store(struct device *dev,
 	if (state != 0 && state != 1)
 		return -EINVAL;
 
-	result = hci_write1(toshiba, HCI_FAN, state);
+	result = hci_write(toshiba, HCI_FAN, state);
 	if (result == TOS_FAILURE)
 		return -EIO;
 	else if (result == TOS_NOT_SUPPORTED)
@@ -2271,7 +2271,7 @@ static int toshiba_acpi_enable_hotkeys(struct toshiba_acpi_dev *dev)
 	if (ACPI_FAILURE(status))
 		return -ENODEV;
 
-	result = hci_write1(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_ENABLE);
+	result = hci_write(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_ENABLE);
 	if (result == TOS_FAILURE)
 		return -EIO;
 	else if (result == TOS_NOT_SUPPORTED)
@@ -2288,8 +2288,8 @@ static void toshiba_acpi_enable_special_functions(struct toshiba_acpi_dev *dev)
 	 * Re-activate the hotkeys, but this time, we are using the
 	 * "Special Functions" mode.
 	 */
-	result = hci_write1(dev, HCI_HOTKEY_EVENT,
-			    HCI_HOTKEY_SPECIAL_FUNCTIONS);
+	result = hci_write(dev, HCI_HOTKEY_EVENT,
+			   HCI_HOTKEY_SPECIAL_FUNCTIONS);
 	if (result != TOS_SUCCESS)
 		pr_err("Could not enable the Special Function mode\n");
 }
@@ -2370,7 +2370,7 @@ static void toshiba_acpi_process_hotkeys(struct toshiba_acpi_dev *dev)
 			toshiba_acpi_report_hotkey(dev, scancode);
 	} else if (dev->system_event_supported) {
 		do {
-			hci_result = hci_read1(dev, HCI_SYSTEM_EVENT, &value);
+			hci_result = hci_read(dev, HCI_SYSTEM_EVENT, &value);
 			switch (hci_result) {
 			case TOS_SUCCESS:
 				toshiba_acpi_report_hotkey(dev, (int)value);
@@ -2382,7 +2382,7 @@ static void toshiba_acpi_process_hotkeys(struct toshiba_acpi_dev *dev)
 				 * sporadically become disabled.
 				 */
 				hci_result =
-					hci_write1(dev, HCI_SYSTEM_EVENT, 1);
+					hci_write(dev, HCI_SYSTEM_EVENT, 1);
 				pr_notice("Re-enabled hotkeys\n");
 				/* Fall through */
 			default:
@@ -2459,7 +2459,7 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	if (acpi_has_method(dev->acpi_dev->handle, "INFO"))
 		dev->info_supported = 1;
 	else {
-		hci_result = hci_write1(dev, HCI_SYSTEM_EVENT, 1);
+		hci_result = hci_write(dev, HCI_SYSTEM_EVENT, 1);
 		if (hci_result == TOS_SUCCESS)
 			dev->system_event_supported = 1;
 	}
@@ -2784,7 +2784,7 @@ static int toshiba_acpi_suspend(struct device *device)
 	u32 result;
 
 	if (dev->hotkey_dev)
-		result = hci_write1(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_DISABLE);
+		result = hci_write(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_DISABLE);
 
 	return 0;
 }
-- 
2.3.6
