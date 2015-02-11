From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/5] toshiba_acpi: Clean file according to coding style
Date: Tue, 10 Feb 2015 23:43:56 -0700
Message-ID: <1423637040-6813-2-git-send-email-coproscefalo@gmail.com>
References: <1423637040-6813-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423637040-6813-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch simply cleans the the driver out of 2 errors and 17
warnings according to "checkpatch -f", no functionality was changed,
simply a cleanup.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 38 ++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 52e4647..016d7ab 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -57,7 +57,7 @@
 #include <linux/i8042.h>
 #include <linux/acpi.h>
 #include <linux/dmi.h>
-#include <asm/uaccess.h>
+#include <linux/uaccess.h>
 
 MODULE_AUTHOR("John Belmonte");
 MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
@@ -288,7 +288,7 @@ static const struct key_entry toshiba_acpi_alt_keymap[] = {
 /* utility
  */
 
-static __inline__ void _set_bit(u32 * word, u32 mask, int value)
+static inline void _set_bit(u32 *word, u32 mask, int value)
 {
 	*word = (*word & ~mask) | (mask * value);
 }
@@ -331,9 +331,8 @@ static acpi_status tci_raw(struct toshiba_acpi_dev *dev,
 				      (char *)dev->method_hci, &params,
 				      &results);
 	if ((status == AE_OK) && (out_objs->package.count <= TCI_WORDS)) {
-		for (i = 0; i < out_objs->package.count; ++i) {
+		for (i = 0; i < out_objs->package.count; ++i)
 			out[i] = out_objs->package.elements[i].integer.value;
-		}
 	}
 
 	return status;
@@ -359,6 +358,7 @@ static u32 hci_read1(struct toshiba_acpi_dev *dev, u32 reg, u32 *out1)
 	u32 in[TCI_WORDS] = { HCI_GET, reg, 0, 0, 0, 0 };
 	u32 out[TCI_WORDS];
 	acpi_status status = tci_raw(dev, in, out);
+
 	if (ACPI_FAILURE(status))
 		return TOS_FAILURE;
 
@@ -376,11 +376,13 @@ static u32 hci_write2(struct toshiba_acpi_dev *dev, u32 reg, u32 in1, u32 in2)
 	return ACPI_SUCCESS(status) ? out[0] : TOS_FAILURE;
 }
 
-static u32 hci_read2(struct toshiba_acpi_dev *dev, u32 reg, u32 *out1, u32 *out2)
+static u32 hci_read2(struct toshiba_acpi_dev *dev,
+		     u32 reg, u32 *out1, u32 *out2)
 {
 	u32 in[TCI_WORDS] = { HCI_GET, reg, *out1, *out2, 0, 0 };
 	u32 out[TCI_WORDS];
 	acpi_status status = tci_raw(dev, in, out);
+
 	if (ACPI_FAILURE(status))
 		return TOS_FAILURE;
 
@@ -455,6 +457,7 @@ static u32 sci_read(struct toshiba_acpi_dev *dev, u32 reg, u32 *out1)
 	u32 in[TCI_WORDS] = { SCI_GET, reg, 0, 0, 0, 0 };
 	u32 out[TCI_WORDS];
 	acpi_status status = tci_raw(dev, in, out);
+
 	if (ACPI_FAILURE(status))
 		return TOS_FAILURE;
 
@@ -713,7 +716,8 @@ static int toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 	return 1;
 }
 
-static enum led_brightness toshiba_eco_mode_get_status(struct led_classdev *cdev)
+static enum led_brightness
+toshiba_eco_mode_get_status(struct led_classdev *cdev)
 {
 	struct toshiba_acpi_dev *dev = container_of(cdev,
 			struct toshiba_acpi_dev, eco_led);
@@ -1235,7 +1239,7 @@ static int set_tr_backlight_status(struct toshiba_acpi_dev *dev, bool enable)
 	return hci_result == TOS_SUCCESS ? 0 : -EIO;
 }
 
-static struct proc_dir_entry *toshiba_proc_dir /*= 0*/ ;
+static struct proc_dir_entry *toshiba_proc_dir /*= 0*/;
 
 static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 {
@@ -1246,6 +1250,7 @@ static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 	if (dev->tr_backlight_supported) {
 		bool enabled;
 		int ret = get_tr_backlight_status(dev, &enabled);
+
 		if (ret)
 			return ret;
 		if (enabled)
@@ -1263,6 +1268,7 @@ static int __get_lcd_brightness(struct toshiba_acpi_dev *dev)
 static int get_lcd_brightness(struct backlight_device *bd)
 {
 	struct toshiba_acpi_dev *dev = bl_get_data(bd);
+
 	return __get_lcd_brightness(dev);
 }
 
@@ -1299,6 +1305,7 @@ static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 	if (dev->tr_backlight_supported) {
 		bool enable = !value;
 		int ret = set_tr_backlight_status(dev, enable);
+
 		if (ret)
 			return ret;
 		if (value)
@@ -1313,6 +1320,7 @@ static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 static int set_lcd_status(struct backlight_device *bd)
 {
 	struct toshiba_acpi_dev *dev = bl_get_data(bd);
+
 	return set_lcd_brightness(dev, bd->props.brightness);
 }
 
@@ -1370,6 +1378,7 @@ static int video_proc_show(struct seq_file *m, void *v)
 		int is_lcd = (value & HCI_VIDEO_OUT_LCD) ? 1 : 0;
 		int is_crt = (value & HCI_VIDEO_OUT_CRT) ? 1 : 0;
 		int is_tv = (value & HCI_VIDEO_OUT_TV) ? 1 : 0;
+
 		seq_printf(m, "lcd_out:                 %d\n", is_lcd);
 		seq_printf(m, "crt_out:                 %d\n", is_crt);
 		seq_printf(m, "tv_out:                  %d\n", is_tv);
@@ -1422,8 +1431,7 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 		do {
 			++buffer;
 			--remain;
-		}
-		while (remain && *(buffer - 1) != ';');
+		} while (remain && *(buffer - 1) != ';');
 	}
 
 	kfree(cmd);
@@ -1431,6 +1439,7 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 	ret = get_video_status(dev, &video_out);
 	if (!ret) {
 		unsigned int new_video_out = video_out;
+
 		if (lcd_out != -1)
 			_set_bit(&new_video_out, HCI_VIDEO_OUT_LCD, lcd_out);
 		if (crt_out != -1)
@@ -1500,10 +1509,10 @@ static ssize_t fan_proc_write(struct file *file, const char __user *buf,
 	if (sscanf(cmd, " force_on : %i", &value) == 1 &&
 	    value >= 0 && value <= 1) {
 		hci_result = hci_write1(dev, HCI_FAN, value);
-		if (hci_result != TOS_SUCCESS)
-			return -EIO;
-		else
+		if (hci_result == TOS_SUCCESS)
 			dev->force_fan = value;
+		else
+			return -EIO;
 	} else {
 		return -EINVAL;
 	}
@@ -1568,11 +1577,10 @@ static ssize_t keys_proc_write(struct file *file, const char __user *buf,
 		return -EFAULT;
 	cmd[len] = '\0';
 
-	if (sscanf(cmd, " hotkey_ready : %i", &value) == 1 && value == 0) {
+	if (sscanf(cmd, " hotkey_ready : %i", &value) == 1 && value == 0)
 		dev->key_event_valid = 0;
-	} else {
+	else
 		return -EINVAL;
-	}
 
 	return count;
 }
-- 
2.2.2
