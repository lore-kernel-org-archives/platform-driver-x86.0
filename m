From: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/2] toshiba_acpi: Cleanup comment blocks and capitalization
Date: Wed, 11 Feb 2015 21:57:07 -0800
Message-ID: <e0769fe6f28b500868c2b1059f74ab1177ff41db.1423720561.git.dvhart@linux.intel.com>
References: <1423720628-26313-1-git-send-email-dvhart@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56560 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbbBLF5T (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 Feb 2015 00:57:19 -0500
In-Reply-To: <1423720628-26313-1-git-send-email-dvhart@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, coproscefalo@gmail.com, Darren Hart <dvhart@linux.intel.com>

Ensure multiline comments start with /* and */ each on its own line.
Capitalize the first word of comments.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 drivers/platform/x86/toshiba_acpi.c | 75 +++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 1cfc443..07be889 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -71,7 +71,8 @@ MODULE_LICENSE("GPL");
 /* Toshiba ACPI method paths */
 #define METHOD_VIDEO_OUT	"\\_SB_.VALX.DSSX"
 
-/* The Toshiba configuration interface is composed of the HCI and the SCI,
+/*
+ * The Toshiba configuration interface is composed of the HCI and the SCI,
  * which are defined as follows:
  *
  * HCI is Toshiba's "Hardware Control Interface" which is supposed to
@@ -286,7 +287,8 @@ static const struct key_entry toshiba_acpi_alt_keymap[] = {
 	{ KE_END, 0 },
 };
 
-/* utility
+/*
+ * Utility
  */
 
 static inline void _set_bit(u32 *word, u32 mask, int value)
@@ -294,7 +296,8 @@ static inline void _set_bit(u32 *word, u32 mask, int value)
 	*word = (*word & ~mask) | (mask * value);
 }
 
-/* acpi interface wrappers
+/*
+ * ACPI interface wrappers
  */
 
 static int write_acpi_int(const char *methodName, int val)
@@ -305,7 +308,8 @@ static int write_acpi_int(const char *methodName, int val)
 	return (status == AE_OK) ? 0 : -EIO;
 }
 
-/* Perform a raw configuration call.  Here we don't care about input or output
+/*
+ * Perform a raw configuration call.  Here we don't care about input or output
  * buffer format.
  */
 static acpi_status tci_raw(struct toshiba_acpi_dev *dev,
@@ -339,7 +343,8 @@ static acpi_status tci_raw(struct toshiba_acpi_dev *dev,
 	return status;
 }
 
-/* common hci tasks (get or set one or two value)
+/*
+ * Common hci tasks (get or set one or two value)
  *
  * In addition to the ACPI status, the HCI system returns a result which
  * may be useful (such as "not supported").
@@ -393,7 +398,8 @@ static u32 hci_read2(struct toshiba_acpi_dev *dev,
 	return out[0];
 }
 
-/* common sci tasks
+/*
+ * Common sci tasks
  */
 
 static int sci_open(struct toshiba_acpi_dev *dev)
@@ -414,7 +420,8 @@ static int sci_open(struct toshiba_acpi_dev *dev)
 		pr_info("Toshiba SCI already opened\n");
 		return 1;
 	} else if (out[0] == TOS_NOT_SUPPORTED) {
-		/* Some BIOSes do not have the SCI open/close functions
+		/*
+		 * Some BIOSes do not have the SCI open/close functions
 		 * implemented and return 0x8000 (Not Supported), failing to
 		 * register some supported features.
 		 *
@@ -567,10 +574,11 @@ static int toshiba_kbd_illum_available(struct toshiba_acpi_dev *dev)
 		return 0;
 	}
 
-	/* Check for keyboard backlight timeout max value,
+	/*
+	 * Check for keyboard backlight timeout max value,
 	 * previous kbd backlight implementation set this to
 	 * 0x3c0003, and now the new implementation set this
-	 * to 0x3c001a, use this to distinguish between them
+	 * to 0x3c001a, use this to distinguish between them.
 	 */
 	if (out[3] == SCI_KBD_TIME_MAX)
 		dev->kbd_type = 2;
@@ -714,7 +722,8 @@ static int toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 	} else if (out[0] == TOS_NOT_INSTALLED) {
 		pr_info("ECO led not installed");
 	} else if (out[0] == TOS_INPUT_DATA_ERROR) {
-		/* If we receive 0x8300 (Input Data Error), it means that the
+		/*
+		 * If we receive 0x8300 (Input Data Error), it means that the
 		 * LED device is present, but that we just screwed the input
 		 * parameters.
 		 *
@@ -776,7 +785,8 @@ static int toshiba_accelerometer_supported(struct toshiba_acpi_dev *dev)
 	u32 out[TCI_WORDS];
 	acpi_status status;
 
-	/* Check if the accelerometer call exists,
+	/*
+	 * Check if the accelerometer call exists,
 	 * this call also serves as initialization
 	 */
 	status = tci_raw(dev, in, out);
@@ -1433,9 +1443,9 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 
 	buffer = cmd;
 
-	/* scan expression.  Multiple expressions may be delimited with ;
-	 *
-	 *  NOTE: to keep scanning simple, invalid fields are ignored
+	/*
+	 * Scan expression.  Multiple expressions may be delimited with ;
+	 * NOTE: To keep scanning simple, invalid fields are ignored.
 	 */
 	while (remain) {
 		if (sscanf(buffer, " lcd_out : %i", &value) == 1)
@@ -1444,7 +1454,7 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 			crt_out = value & 1;
 		else if (sscanf(buffer, " tv_out : %i", &value) == 1)
 			tv_out = value & 1;
-		/* advance to one character past the next ; */
+		/* Advance to one character past the next ; */
 		do {
 			++buffer;
 			--remain;
@@ -1463,7 +1473,8 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
 			_set_bit(&new_video_out, HCI_VIDEO_OUT_CRT, crt_out);
 		if (tv_out != -1)
 			_set_bit(&new_video_out, HCI_VIDEO_OUT_TV, tv_out);
-		/* To avoid unnecessary video disruption, only write the new
+		/*
+		 * To avoid unnecessary video disruption, only write the new
 		 * video setting if something changed. */
 		if (new_video_out != video_out)
 			ret = write_acpi_int(METHOD_VIDEO_OUT, new_video_out);
@@ -1558,11 +1569,13 @@ static int keys_proc_show(struct seq_file *m, void *v)
 			dev->key_event_valid = 1;
 			dev->last_key_event = value;
 		} else if (hci_result == TOS_FIFO_EMPTY) {
-			/* better luck next time */
+			/* Better luck next time */
 		} else if (hci_result == TOS_NOT_SUPPORTED) {
-			/* This is a workaround for an unresolved issue on
+			/*
+			 * This is a workaround for an unresolved issue on
 			 * some machines where system events sporadically
-			 * become disabled. */
+			 * become disabled.
+			 */
 			hci_result = hci_write1(dev, HCI_SYSTEM_EVENT, 1);
 			pr_notice("Re-enabled hotkeys\n");
 		} else {
@@ -1631,7 +1644,8 @@ static const struct file_operations version_proc_fops = {
 	.release	= single_release,
 };
 
-/* proc and module init
+/*
+ * Proc and module init
  */
 
 #define PROC_TOSHIBA		"toshiba"
@@ -1749,7 +1763,8 @@ static ssize_t kbd_backlight_mode_store(struct device *dev,
 			return -EINVAL;
 	}
 
-	/* Set the Keyboard Backlight Mode where:
+	/*
+	 * Set the Keyboard Backlight Mode where:
 	 *	Auto - KBD backlight turns off automatically in given time
 	 *	FN-Z - KBD backlight "toggles" when hotkey pressed
 	 *	ON   - KBD backlight is always on
@@ -1960,7 +1975,8 @@ static ssize_t usb_sleep_charge_store(struct device *dev,
 	ret = kstrtoint(buf, 0, &state);
 	if (ret)
 		return ret;
-	/* Check for supported values, where:
+	/*
+	 * Check for supported values, where:
 	 * 0 - Disabled
 	 * 1 - Alternate (Non USB conformant devices that require more power)
 	 * 2 - Auto (USB conformant devices)
@@ -2022,7 +2038,8 @@ static ssize_t sleep_functions_on_battery_store(struct device *dev,
 	if (ret)
 		return ret;
 
-	/* Set the status of the function:
+	/*
+	 * Set the status of the function:
 	 * 0 - Disabled
 	 * 1-100 - Enabled
 	 */
@@ -2143,7 +2160,8 @@ static ssize_t kbd_function_keys_store(struct device *dev,
 	ret = kstrtoint(buf, 0, &mode);
 	if (ret)
 		return ret;
-	/* Check for the function keys mode where:
+	/*
+	 * Check for the function keys mode where:
 	 * 0 - Normal operation (F{1-12} as usual and hotkeys via FN-F{1-12})
 	 * 1 - Special functions (Opposite of the above setting)
 	 */
@@ -2223,7 +2241,8 @@ static ssize_t usb_three_store(struct device *dev,
 	ret = kstrtoint(buf, 0, &state);
 	if (ret)
 		return ret;
-	/* Check for USB 3 mode where:
+	/*
+	 * Check for USB 3 mode where:
 	 * 0 - Disabled (Acts like a USB 2 port, saving power)
 	 * 1 - Enabled
 	 */
@@ -2375,7 +2394,7 @@ static void toshiba_acpi_report_hotkey(struct toshiba_acpi_dev *dev,
 	if (scancode == 0x100)
 		return;
 
-	/* act on key press; ignore key release */
+	/* Act on key press; ignore key release */
 	if (scancode & 0x80)
 		return;
 
@@ -2411,7 +2430,7 @@ static void toshiba_acpi_process_hotkeys(struct toshiba_acpi_dev *dev)
 				hci_result =
 					hci_write1(dev, HCI_SYSTEM_EVENT, 1);
 				pr_notice("Re-enabled hotkeys\n");
-				/* fall through */
+				/* Fall through */
 			default:
 				retries--;
 				break;
@@ -2533,7 +2552,7 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 	props.type = BACKLIGHT_PLATFORM;
 	props.max_brightness = HCI_LCD_BRIGHTNESS_LEVELS - 1;
 
-	/* adding an extra level and having 0 change to transflective mode */
+	/* Adding an extra level and having 0 change to transflective mode */
 	if (dev->tr_backlight_supported)
 		props.max_brightness++;
 
-- 
2.1.4
