From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/3] toshiba_acpi: Update and fix USB Sleep and Charge modes
Date: Fri, 27 Mar 2015 15:09:24 -0600
Message-ID: <1427490565-6363-2-git-send-email-coproscefalo@gmail.com>
References: <1427490565-6363-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:34761 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753176AbbC0VJe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 Mar 2015 17:09:34 -0400
In-Reply-To: <1427490565-6363-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch fixes the USB Sleep and Charge mode on certain models
where the value returned by the BIOS is different, and thus, making
this feature not to work for those models.

Also, the "Typical" charging mode was added as a supported mode.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 61 +++++++++++++++++++++++++++++++------
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 17a259e..595f12c 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -150,9 +150,10 @@ MODULE_LICENSE("GPL");
 #define SCI_KBD_MODE_OFF		0x10
 #define SCI_KBD_TIME_MAX		0x3c001a
 #define SCI_USB_CHARGE_MODE_MASK	0xff
-#define SCI_USB_CHARGE_DISABLED		0x30000
-#define SCI_USB_CHARGE_ALTERNATE	0x30009
-#define SCI_USB_CHARGE_AUTO		0x30021
+#define SCI_USB_CHARGE_DISABLED		0x00
+#define SCI_USB_CHARGE_ALTERNATE	0x09
+#define SCI_USB_CHARGE_TYPICAL		0x11
+#define SCI_USB_CHARGE_AUTO		0x21
 #define SCI_USB_CHARGE_BAT_MASK		0x7
 #define SCI_USB_CHARGE_BAT_LVL_OFF	0x1
 #define SCI_USB_CHARGE_BAT_LVL_ON	0x4
@@ -177,6 +178,7 @@ struct toshiba_acpi_dev {
 	int kbd_mode;
 	int kbd_time;
 	int usbsc_bat_level;
+	int usbsc_mode_base;
 	int hotkey_event_type;
 
 	unsigned int illumination_supported:1;
@@ -800,6 +802,44 @@ static int toshiba_accelerometer_get(struct toshiba_acpi_dev *dev,
 }
 
 /* Sleep (Charge and Music) utilities support */
+static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
+{
+	u32 in[TCI_WORDS] = { SCI_GET, SCI_USB_SLEEP_CHARGE, 0, 0, 0, 0 };
+	u32 out[TCI_WORDS];
+	acpi_status status;
+
+	if (!sci_open(dev))
+		return;
+
+	status = tci_raw(dev, in, out);
+	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+		pr_err("ACPI call to get USB S&C mode failed\n");
+		sci_close(dev);
+		return;
+	} else if (out[0] == TOS_NOT_SUPPORTED) {
+		pr_info("USB Sleep and Charge not supported\n");
+		sci_close(dev);
+		return;
+	}
+	dev->usbsc_mode_base = out[4];
+
+	in[5] = SCI_USB_CHARGE_BAT_LVL;
+	status = tci_raw(dev, in, out);
+	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
+		pr_err("ACPI call to get USB S&C battery level failed\n");
+		sci_close(dev);
+		return;
+	} else if (out[0] == TOS_NOT_SUPPORTED) {
+		pr_info("USB Sleep and Charge not supported\n");
+		sci_close(dev);
+		return;
+	}
+	dev->usbsc_bat_level = out[2];
+	dev->usb_sleep_charge_supported = 1;
+
+	sci_close(dev);
+}
+
 static int toshiba_usb_sleep_charge_get(struct toshiba_acpi_dev *dev,
 					u32 *mode)
 {
@@ -1976,17 +2016,21 @@ static ssize_t usb_sleep_charge_store(struct device *dev,
 	 * 0 - Disabled
 	 * 1 - Alternate (Non USB conformant devices that require more power)
 	 * 2 - Auto (USB conformant devices)
+	 * 3 - Typical
 	 */
-	if (state != 0 && state != 1 && state != 2)
+	if (state != 0 && state != 1 && state != 2 && state != 3)
 		return -EINVAL;
 
 	/* Set the USB charging mode to internal value */
+	mode = toshiba->usbsc_mode_base;
 	if (state == 0)
-		mode = SCI_USB_CHARGE_DISABLED;
+		mode |= SCI_USB_CHARGE_DISABLED;
 	else if (state == 1)
-		mode = SCI_USB_CHARGE_ALTERNATE;
+		mode |= SCI_USB_CHARGE_ALTERNATE;
 	else if (state == 2)
-		mode = SCI_USB_CHARGE_AUTO;
+		mode |= SCI_USB_CHARGE_AUTO;
+	else if (state == 3)
+		mode |= SCI_USB_CHARGE_TYPICAL;
 
 	ret = toshiba_usb_sleep_charge_set(toshiba, mode);
 	if (ret)
@@ -2756,8 +2800,7 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = toshiba_accelerometer_supported(dev);
 	dev->accelerometer_supported = !ret;
 
-	ret = toshiba_usb_sleep_charge_get(dev, &dummy);
-	dev->usb_sleep_charge_supported = !ret;
+	toshiba_usb_sleep_charge_available(dev);
 
 	ret = toshiba_usb_rapid_charge_get(dev, &dummy);
 	dev->usb_rapid_charge_supported = !ret;
-- 
2.2.2
