From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 3/3] toshiba_acpi: Fix the enabling of the Special Functions
Date: Fri, 20 Mar 2015 16:55:18 -0600
Message-ID: <1426892118-27678-4-git-send-email-coproscefalo@gmail.com>
References: <1426892118-27678-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:35000 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751196AbbCTWz3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Mar 2015 18:55:29 -0400
In-Reply-To: <1426892118-27678-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Some Toshiba laptops with the "Special Functions" feature enabled
fail to properly enable such feature unless a specific value is
used to enable the hotkey events.

This patch adds a new function called "*_enable_special_functions",
that simply makes a call to the HCI_HOTKEY_EVENT call, but this time
we are using a different parameter to make the "Special Functions"
mode work as expected.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index d7dac48..49ac73a 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -129,6 +129,7 @@ MODULE_LICENSE("GPL");
 #define HCI_ACCEL_MASK			0x7fff
 #define HCI_HOTKEY_DISABLE		0x0b
 #define HCI_HOTKEY_ENABLE		0x09
+#define HCI_HOTKEY_SPECIAL_FUNCTIONS	0x10
 #define HCI_LCD_BRIGHTNESS_BITS		3
 #define HCI_LCD_BRIGHTNESS_SHIFT	(16-HCI_LCD_BRIGHTNESS_BITS)
 #define HCI_LCD_BRIGHTNESS_LEVELS	(1 << HCI_LCD_BRIGHTNESS_BITS)
@@ -2334,6 +2335,20 @@ static int toshiba_acpi_enable_hotkeys(struct toshiba_acpi_dev *dev)
 
 	return 0;
 }
+
+static void toshiba_acpi_enable_special_functions(struct toshiba_acpi_dev *dev)
+{
+	u32 result;
+
+	/*
+	 * Re-activate the hotkeys, but this time, we are using the
+	 * "Special Functions" mode.
+	 */
+	result = hci_write1(dev, HCI_HOTKEY_EVENT,
+			    HCI_HOTKEY_SPECIAL_FUNCTIONS);
+	if (result != TOS_SUCCESS)
+		pr_err("Could not enable the Special Function mode\n");
+}
 
 static bool toshiba_acpi_i8042_filter(unsigned char data, unsigned char str,
 				      struct serio *port)
@@ -2638,6 +2653,7 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 {
 	struct toshiba_acpi_dev *dev;
 	const char *hci_method;
+	u32 special_functions;
 	u32 dummy;
 	bool bt_present;
 	int ret = 0;
@@ -2669,7 +2685,7 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	 * with the new keyboard layout, query for its presence to help
 	 * determine the keymap layout to use.
 	 */
-	ret = toshiba_function_keys_get(dev, &dummy);
+	ret = toshiba_function_keys_get(dev, &special_functions);
 	dev->kbd_function_keys_supported = !ret;
 
 	if (toshiba_acpi_setup_keyboard(dev))
@@ -2761,6 +2777,13 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = get_fan_status(dev, &dummy);
 	dev->fan_supported = !ret;
 
+	/*
+	 * Enable the "Special Functions" mode only if they are
+	 * supported and if they are activated.
+	 */
+	if (dev->kbd_function_keys_supported && special_functions)
+		toshiba_acpi_enable_special_functions(dev);
+
 	ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,
 				 &toshiba_attr_group);
 	if (ret) {
-- 
2.2.2
