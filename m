From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 3/5] toshiba_acpi: Refactor *{get, set} functions return value
Date: Fri, 31 Jul 2015 21:58:14 -0600
Message-ID: <1438401496-27744-4-git-send-email-coproscefalo@gmail.com>
References: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch refactors the return value of the driver *{get, set}
functions, since the driver default error value is -EIO.

All the functions now check for TOS_FAILURE, TOS_NOT_SUPPORTED and
TOS_SUCCESS.

On TOS_FAILURE a pr_err message is printed informing the user of the
error (no change was made to this, except the check was added to the
functions not checking for this).

On TOS_NOT_SUPPORTED we now return -ENODEV immediately (some
functions were returning -EIO and some other were not checking)

On TOS_SUCCESS* we now return 0 (as a side effect, a new success value
was added, since some functions return one instead of zero to
indicate success).

As a special case, the LED functions now check for *FAILURE on
*set, and check for TOS_FAILURE and TOS_SUCCESS on *get with their
"default" return value set to LED_OFF.

Also the {lcd, video}_proc* functions were adapted to reflect these
changes to their parent HCI functions.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 177 +++++++++++++++++++++---------------
 1 file changed, 104 insertions(+), 73 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 66b596a..7b16d8d 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -93,6 +93,7 @@ MODULE_LICENSE("GPL");
 
 /* Return codes */
 #define TOS_SUCCESS			0x0000
+#define TOS_SUCCESS2			0x0001
 #define TOS_OPEN_CLOSE_OK		0x0044
 #define TOS_FAILURE			0x1000
 #define TOS_NOT_SUPPORTED		0x8000
@@ -469,7 +470,8 @@ static void toshiba_illumination_set(struct led_classdev *cdev,
 {
 	struct toshiba_acpi_dev *dev = container_of(cdev,
 			struct toshiba_acpi_dev, led_dev);
-	u32 state, result;
+	u32 result;
+	u32 state;
 
 	/* First request : initialize communication. */
 	if (!sci_open(dev))
@@ -503,7 +505,7 @@ static enum led_brightness toshiba_illumination_get(struct led_classdev *cdev)
 	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
 		pr_err("ACPI call for illumination failed\n");
 		return LED_OFF;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	} else if (result != TOS_SUCCESS) {
 		return LED_OFF;
 	}
 
@@ -565,7 +567,7 @@ static int toshiba_kbd_illum_status_set(struct toshiba_acpi_dev *dev, u32 time)
 		return -ENODEV;
 	}
 
-	return 0;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int toshiba_kbd_illum_status_get(struct toshiba_acpi_dev *dev, u32 *time)
@@ -584,21 +586,22 @@ static int toshiba_kbd_illum_status_get(struct toshiba_acpi_dev *dev, u32 *time)
 		return -ENODEV;
 	}
 
-	return 0;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static enum led_brightness toshiba_kbd_backlight_get(struct led_classdev *cdev)
 {
 	struct toshiba_acpi_dev *dev = container_of(cdev,
 			struct toshiba_acpi_dev, kbd_led);
-	u32 state, result;
+	u32 result;
+	u32 state;
 
 	/* Check the keyboard backlight state */
 	result = hci_read(dev, HCI_KBD_ILLUMINATION, &state);
 	if (result == TOS_FAILURE || result == TOS_INPUT_DATA_ERROR) {
 		pr_err("ACPI call to get the keyboard backlight failed\n");
 		return LED_OFF;
-	} else if (result == TOS_NOT_SUPPORTED) {
+	} else if (result != TOS_SUCCESS) {
 		return LED_OFF;
 	}
 
@@ -610,7 +613,8 @@ static void toshiba_kbd_backlight_set(struct led_classdev *cdev,
 {
 	struct toshiba_acpi_dev *dev = container_of(cdev,
 			struct toshiba_acpi_dev, kbd_led);
-	u32 state, result;
+	u32 result;
+	u32 state;
 
 	/* Set the keyboard backlight state */
 	state = brightness ? 1 : 0;
@@ -640,7 +644,7 @@ static int toshiba_touchpad_set(struct toshiba_acpi_dev *dev, u32 state)
 		return -ENODEV;
 	}
 
-	return 0;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *state)
@@ -659,7 +663,7 @@ static int toshiba_touchpad_get(struct toshiba_acpi_dev *dev, u32 *state)
 		return -ENODEV;
 	}
 
-	return 0;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 /* Eco Mode support */
@@ -709,6 +713,8 @@ toshiba_eco_mode_get_status(struct led_classdev *cdev)
 	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
 		pr_err("ACPI call to get ECO led failed\n");
 		return LED_OFF;
+	} else if (out[0] != TOS_SUCCESS) {
+		return LED_OFF;
 	}
 
 	return out[2] ? LED_FULL : LED_OFF;
@@ -769,12 +775,15 @@ static int toshiba_accelerometer_get(struct toshiba_acpi_dev *dev,
 	if (ACPI_FAILURE(status) || out[0] == TOS_INPUT_DATA_ERROR) {
 		pr_err("ACPI call to query the accelerometer failed\n");
 		return -EIO;
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
@@ -835,7 +844,7 @@ static int toshiba_usb_sleep_charge_get(struct toshiba_acpi_dev *dev,
 		return -EIO;
 	}
 
-	return 0;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int toshiba_usb_sleep_charge_set(struct toshiba_acpi_dev *dev,
@@ -857,7 +866,7 @@ static int toshiba_usb_sleep_charge_set(struct toshiba_acpi_dev *dev,
 		return -EIO;
 	}
 
-	return 0;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int toshiba_sleep_functions_status_get(struct toshiba_acpi_dev *dev,
@@ -880,11 +889,12 @@ static int toshiba_sleep_functions_status_get(struct toshiba_acpi_dev *dev,
 		return -ENODEV;
 	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
 		return -EIO;
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
@@ -910,7 +920,7 @@ static int toshiba_sleep_functions_status_set(struct toshiba_acpi_dev *dev,
 		return -EIO;
 	}
 
-	return 0;
+	return out[0] == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
@@ -932,11 +942,12 @@ static int toshiba_usb_rapid_charge_get(struct toshiba_acpi_dev *dev,
 	} else if (out[0] == TOS_NOT_SUPPORTED ||
 		   out[0] == TOS_INPUT_DATA_ERROR) {
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
@@ -962,7 +973,7 @@ static int toshiba_usb_rapid_charge_set(struct toshiba_acpi_dev *dev,
 		return -EIO;
 	}
 
-	return 0;
+	return (out[0] == TOS_SUCCESS || out[0] == TOS_SUCCESS2) ? 0 : -EIO;
 }
 
 static int toshiba_usb_sleep_music_get(struct toshiba_acpi_dev *dev, u32 *state)
@@ -983,7 +994,7 @@ static int toshiba_usb_sleep_music_get(struct toshiba_acpi_dev *dev, u32 *state)
 		return -EIO;
 	}
 
-	return 0;
+	return result = TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int toshiba_usb_sleep_music_set(struct toshiba_acpi_dev *dev, u32 state)
@@ -1004,7 +1015,7 @@ static int toshiba_usb_sleep_music_set(struct toshiba_acpi_dev *dev, u32 state)
 		return -EIO;
 	}
 
-	return 0;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 /* Keyboard function keys */
@@ -1024,7 +1035,7 @@ static int toshiba_function_keys_get(struct toshiba_acpi_dev *dev, u32 *mode)
 		return -ENODEV;
 	}
 
-	return 0;
+	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
 }
 
 static int toshiba_function_keys_set(struct toshiba_acpi_dev *dev, u32 mode)
@@ -1043,7 +1054,7 @@ static int toshiba_function_keys_set(struct toshiba_acpi_dev *dev, u32 mode)
 		return -ENODEV;
 	}
 
-	return 0;
+	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
 }
 
 /* Panel Power ON */
@@ -1065,7 +1076,7 @@ static int toshiba_panel_power_on_get(struct toshiba_acpi_dev *dev, u32 *state)
 		return -EIO;
 	}
 
-	return 0;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int toshiba_panel_power_on_set(struct toshiba_acpi_dev *dev, u32 state)
@@ -1086,7 +1097,7 @@ static int toshiba_panel_power_on_set(struct toshiba_acpi_dev *dev, u32 state)
 		return -EIO;
 	}
 
-	return 0;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 /* USB Three */
@@ -1108,7 +1119,7 @@ static int toshiba_usb_three_get(struct toshiba_acpi_dev *dev, u32 *state)
 		return -EIO;
 	}
 
-	return 0;
+	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
 }
 
 static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
@@ -1129,7 +1140,7 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
 		return -EIO;
 	}
 
-	return 0;
+	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
 }
 
 /* Hotkey Event type */
@@ -1146,26 +1157,37 @@ static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
 		return -EIO;
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
+
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to get Transflective Backlight failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
 
-	return hci_result == TOS_SUCCESS ? 0 : -EIO;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int set_tr_backlight_status(struct toshiba_acpi_dev *dev, u32 status)
 {
-	u32 hci_result = hci_write(dev, HCI_TR_BACKLIGHT, !status);
+	u32 result = hci_write(dev, HCI_TR_BACKLIGHT, !status);
+
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to set Transflective Backlight failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
 
-	return hci_result == TOS_SUCCESS ? 0 : -EIO;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static struct proc_dir_entry *toshiba_proc_dir;
@@ -1173,7 +1195,7 @@ static struct proc_dir_entry *toshiba_proc_dir;
 /* LCD Brightness */
 static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 {
-	u32 hci_result;
+	u32 result;
 	u32 value;
 	int brightness = 0;
 
@@ -1187,8 +1209,12 @@ static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 		brightness++;
 	}
 
-	hci_result = hci_read(dev, HCI_LCD_BRIGHTNESS, &value);
-	if (hci_result == TOS_SUCCESS)
+	result = hci_read(dev, HCI_LCD_BRIGHTNESS, &value);
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to get LCD Brightness failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+	if (result == TOS_SUCCESS)
 		return brightness + (value >> HCI_LCD_BRIGHTNESS_SHIFT);
 
 	return -EIO;
@@ -1204,8 +1230,8 @@ static int get_lcd_brightness(struct backlight_device *bd)
 static int lcd_proc_show(struct seq_file *m, void *v)
 {
 	struct toshiba_acpi_dev *dev = m->private;
-	int value;
 	int levels;
+	int value;
 
 	if (!dev->backlight_dev)
 		return -ENODEV;
@@ -1219,6 +1245,7 @@ static int lcd_proc_show(struct seq_file *m, void *v)
 	}
 
 	pr_err("Error reading LCD brightness\n");
+
 	return -EIO;
 }
 
@@ -1229,7 +1256,7 @@ static int lcd_proc_open(struct inode *inode, struct file *file)
 
 static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 {
-	u32 hci_result;
+	u32 result;
 
 	if (dev->tr_backlight_supported) {
 		int ret = set_tr_backlight_status(dev, !value);
@@ -1241,8 +1268,13 @@ static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 	}
 
 	value = value << HCI_LCD_BRIGHTNESS_SHIFT;
-	hci_result = hci_write(dev, HCI_LCD_BRIGHTNESS, value);
-	return hci_result == TOS_SUCCESS ? 0 : -EIO;
+	result = hci_write(dev, HCI_LCD_BRIGHTNESS, value);
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to set LCD Brightness failed\n");
+	else if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int set_lcd_status(struct backlight_device *bd)
@@ -1258,24 +1290,22 @@ static ssize_t lcd_proc_write(struct file *file, const char __user *buf,
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
@@ -1287,22 +1317,25 @@ static const struct file_operations lcd_proc_fops = {
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
 
-	hci_result = hci_read(dev, HCI_VIDEO_OUT, status);
-	return hci_result == TOS_SUCCESS ? 0 : -EIO;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int video_proc_show(struct seq_file *m, void *v)
 {
 	struct toshiba_acpi_dev *dev = m->private;
 	u32 value;
-	int ret;
 
-	ret = get_video_status(dev, &value);
-	if (!ret) {
+	if (!get_video_status(dev, &value)) {
 		int is_lcd = (value & HCI_VIDEO_OUT_LCD) ? 1 : 0;
 		int is_crt = (value & HCI_VIDEO_OUT_CRT) ? 1 : 0;
 		int is_tv = (value & HCI_VIDEO_OUT_TV) ? 1 : 0;
@@ -1310,9 +1343,10 @@ static int video_proc_show(struct seq_file *m, void *v)
 		seq_printf(m, "lcd_out:                 %d\n", is_lcd);
 		seq_printf(m, "crt_out:                 %d\n", is_crt);
 		seq_printf(m, "tv_out:                  %d\n", is_tv);
+		return 0;
 	}
 
-	return ret;
+	return -EIO;
 }
 
 static int video_proc_open(struct inode *inode, struct file *file)
@@ -1324,13 +1358,14 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 				size_t count, loff_t *pos)
 {
 	struct toshiba_acpi_dev *dev = PDE_DATA(file_inode(file));
-	char *cmd, *buffer;
-	int ret;
-	int value;
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
@@ -1382,7 +1417,7 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 			ret = write_acpi_int(METHOD_VIDEO_OUT, new_video_out);
 	}
 
-	return ret ? ret : count;
+	return ret ? -EIO : count;
 }
 
 static const struct file_operations video_proc_fops = {
@@ -1403,10 +1438,8 @@ static int get_fan_status(struct toshiba_acpi_dev *dev, u32 *status)
 		pr_err("ACPI call to get Fan status failed\n");
 	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	else if (result == TOS_SUCCESS)
-		return 0;
 
-	return -EIO;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int set_fan_status(struct toshiba_acpi_dev *dev, u32 status)
@@ -1417,10 +1450,8 @@ static int set_fan_status(struct toshiba_acpi_dev *dev, u32 status)
 		pr_err("ACPI call to set Fan status failed\n");
 	else if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-	else if (result == TOS_SUCCESS)
-		return 0;
 
-	return -EIO;
+	return result == TOS_SUCCESS ? 0 : -EIO;
 }
 
 static int fan_proc_show(struct seq_file *m, void *v)
-- 
2.4.6
