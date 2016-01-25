From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/3] toshiba_acpi: Add support for cooling method feature
Date: Mon, 25 Jan 2016 11:29:10 -0700
Message-ID: <1453746551-17496-2-git-send-email-coproscefalo@gmail.com>
References: <1453746551-17496-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f193.google.com ([209.85.214.193]:33666 "EHLO
	mail-ob0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757997AbcAYS33 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Jan 2016 13:29:29 -0500
In-Reply-To: <1453746551-17496-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch adds support to query and set the "Cooling Method" feature,
which basically changes how the system fan behaves, depending on the
supported cooling methods.

Depending on the laptop model, these are the (so far...) available
cooling methods:
- Maximum Performance
- Performance
- Battery Optimized

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 7383307..c6f92ec 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -117,6 +117,7 @@ MODULE_LICENSE("GPL");
 #define HCI_LCD_BRIGHTNESS		0x002a
 #define HCI_WIRELESS			0x0056
 #define HCI_ACCELEROMETER		0x006d
+#define HCI_COOLING_METHOD		0x007f
 #define HCI_KBD_ILLUMINATION		0x0095
 #define HCI_ECO_MODE			0x0097
 #define HCI_ACCELEROMETER2		0x00a6
@@ -186,6 +187,7 @@ struct toshiba_acpi_dev {
 	int usbsc_bat_level;
 	int usbsc_mode_base;
 	int hotkey_event_type;
+	int max_cooling_method;
 
 	unsigned int illumination_supported:1;
 	unsigned int video_supported:1;
@@ -205,6 +207,7 @@ struct toshiba_acpi_dev {
 	unsigned int panel_power_on_supported:1;
 	unsigned int usb_three_supported:1;
 	unsigned int wwan_supported:1;
+	unsigned int cooling_method_supported:1;
 	unsigned int sysfs_created:1;
 	unsigned int special_functions;
 
@@ -1194,6 +1197,53 @@ static int toshiba_wwan_set(struct toshiba_acpi_dev *dev, u32 state)
 	return out[0] == TOS_SUCCESS ? 0 : -EIO;
 }
 
+/* Cooling Method */
+static void toshiba_cooling_method_available(struct toshiba_acpi_dev *dev)
+{
+	u32 in[TCI_WORDS] = { HCI_GET, HCI_COOLING_METHOD, 0, 0, 0, 0 };
+	u32 out[TCI_WORDS];
+	acpi_status status;
+
+	dev->cooling_method_supported = 0;
+	dev->max_cooling_method = 0;
+
+	status = tci_raw(dev, in, out);
+	if (ACPI_FAILURE(status))
+		pr_err("ACPI call to get Cooling Method failed\n");
+
+	if (out[0] != TOS_SUCCESS && out[0] != TOS_SUCCESS2)
+		return;
+
+	dev->cooling_method_supported = 1;
+	dev->max_cooling_method = out[3];
+}
+
+static int toshiba_cooling_method_get(struct toshiba_acpi_dev *dev, u32 *state)
+{
+	u32 result = hci_read(dev, HCI_COOLING_METHOD, state);
+
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to get Cooling Method failed\n");
+
+	if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
+}
+
+static int toshiba_cooling_method_set(struct toshiba_acpi_dev *dev, u32 state)
+{
+	u32 result = hci_write(dev, HCI_COOLING_METHOD, state);
+
+	if (result == TOS_FAILURE)
+		pr_err("ACPI call to get Cooling Method failed\n");
+
+	if (result == TOS_NOT_SUPPORTED)
+		return -ENODEV;
+
+	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) ? 0 : -EIO;
+}
+
 /* Transflective Backlight */
 static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, u32 *status)
 {
@@ -2779,6 +2829,8 @@ static void print_supported_features(struct toshiba_acpi_dev *dev)
 		pr_cont(" usb3");
 	if (dev->wwan_supported)
 		pr_cont(" wwan");
+	if (dev->cooling_method_supported)
+		pr_cont(" cooling-method");
 
 	pr_cont("\n");
 }
@@ -2963,6 +3015,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	if (dev->wwan_supported)
 		toshiba_acpi_setup_wwan_rfkill(dev);
 
+	toshiba_cooling_method_available(dev);
+
 	print_supported_features(dev);
 
 	ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,
-- 
2.7.0
