From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/2] toshiba_acpi: Add extra check to backlight code
Date: Mon,  4 Aug 2014 09:21:01 -0600
Message-ID: <1407165662-1971-2-git-send-email-coproscefalo@gmail.com>
References: <1407165662-1971-1-git-send-email-coproscefalo@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1407165662-1971-1-git-send-email-coproscefalo@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Some Toshiba models (most notably Qosmios) come with an
incomplete backlight method where the AML code doesn't
check for write or read commands and always returns
HCI_SUCCESS and the actual brightness (and in some
cases the max brightness), thus allowing the backlight
interface to be registered without write support.

This patch changes the set_lcd_brightness function,
checking the returned values for values greater than
zero to avoid registering a broken backlight interface.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 76441dc..1ed2ffc 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -872,7 +872,9 @@ static int lcd_proc_open(struct inode *inode, struct file *file)
 
 static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 {
-	u32 hci_result;
+	u32 in[HCI_WORDS] = { HCI_SET, HCI_LCD_BRIGHTNESS, 0, 0, 0, 0 };
+	u32 out[HCI_WORDS];
+	acpi_status status;
 
 	if (dev->tr_backlight_supported) {
 		bool enable = !value;
@@ -883,9 +885,20 @@ static int set_lcd_brightness(struct toshiba_acpi_dev *dev, int value)
 			value--;
 	}
 
-	value = value << HCI_LCD_BRIGHTNESS_SHIFT;
-	hci_write1(dev, HCI_LCD_BRIGHTNESS, value, &hci_result);
-	return hci_result == HCI_SUCCESS ? 0 : -EIO;
+	in[2] = value << HCI_LCD_BRIGHTNESS_SHIFT;
+	status = hci_raw(dev, in, out);
+	if (ACPI_FAILURE(status) || out[0] == HCI_FAILURE) {
+		pr_err("ACPI call to set brightness failed");
+		return -EIO;
+	}
+	/* Extra check for "incomplete" backlight method, where the AML code
+	 * doesn't check for HCI_SET or HCI_GET and returns HCI_SUCCESS,
+	 * the actual brightness, and in some cases the max brightness.
+	 */
+	if (out[2] > 0  || out[3] == 0xE000)
+		return -ENODEV;
+
+	return out[0] == HCI_SUCCESS ? 0 : -EIO;
 }
 
 static int set_lcd_status(struct backlight_device *bd)
-- 
2.0.0
