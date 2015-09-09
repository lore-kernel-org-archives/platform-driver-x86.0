From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/2] toshiba_acpi: Unify hotkey enabling functions
Date: Wed,  9 Sep 2015 11:28:19 -0600
Message-ID: <1441819700-11678-2-git-send-email-coproscefalo@gmail.com>
References: <1441819700-11678-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:32783 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754911AbbIIR2Z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Sep 2015 13:28:25 -0400
In-Reply-To: <1441819700-11678-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Currently the driver has two functions enabling hotkeys support,
but these two functions can be merged into one.

This patch merges these two functions, moving some checks to the
*enable_hotkeys function, simplifying code in the process.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index f2372f4..5510d3f 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -198,6 +198,7 @@ struct toshiba_acpi_dev {
 	unsigned int panel_power_on_supported:1;
 	unsigned int usb_three_supported:1;
 	unsigned int sysfs_created:1;
+	unsigned int special_functions;
 
 	bool kbd_led_registered;
 	bool illumination_led_registered;
@@ -2253,7 +2254,16 @@ static int toshiba_acpi_enable_hotkeys(struct toshiba_acpi_dev *dev)
 	if (ACPI_FAILURE(status))
 		return -ENODEV;
 
-	result = hci_write(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_ENABLE);
+	/*
+	 * Enable the "Special Functions" mode only if they are
+	 * supported and if they are activated.
+	 */
+	if (dev->kbd_function_keys_supported && dev->special_functions)
+		result = hci_write(dev, HCI_HOTKEY_EVENT,
+				   HCI_HOTKEY_SPECIAL_FUNCTIONS);
+	else
+		result = hci_write(dev, HCI_HOTKEY_EVENT, HCI_HOTKEY_ENABLE);
+
 	if (result == TOS_FAILURE)
 		return -EIO;
 	else if (result == TOS_NOT_SUPPORTED)
@@ -2262,20 +2272,6 @@ static int toshiba_acpi_enable_hotkeys(struct toshiba_acpi_dev *dev)
 	return 0;
 }
 
-static void toshiba_acpi_enable_special_functions(struct toshiba_acpi_dev *dev)
-{
-	u32 result;
-
-	/*
-	 * Re-activate the hotkeys, but this time, we are using the
-	 * "Special Functions" mode.
-	 */
-	result = hci_write(dev, HCI_HOTKEY_EVENT,
-			   HCI_HOTKEY_SPECIAL_FUNCTIONS);
-	if (result != TOS_SUCCESS)
-		pr_err("Could not enable the Special Function mode\n");
-}
-
 static bool toshiba_acpi_i8042_filter(unsigned char data, unsigned char str,
 				      struct serio *port)
 {
@@ -2631,7 +2627,6 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 {
 	struct toshiba_acpi_dev *dev;
 	const char *hci_method;
-	u32 special_functions;
 	u32 dummy;
 	int ret = 0;
 
@@ -2673,7 +2668,7 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	 * with the new keyboard layout, query for its presence to help
 	 * determine the keymap layout to use.
 	 */
-	ret = toshiba_function_keys_get(dev, &special_functions);
+	ret = toshiba_function_keys_get(dev, &dev->special_functions);
 	dev->kbd_function_keys_supported = !ret;
 
 	if (toshiba_acpi_setup_keyboard(dev))
@@ -2748,13 +2743,6 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 
 	print_supported_features(dev);
 
-	/*
-	 * Enable the "Special Functions" mode only if they are
-	 * supported and if they are activated.
-	 */
-	if (dev->kbd_function_keys_supported && special_functions)
-		toshiba_acpi_enable_special_functions(dev);
-
 	ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,
 				 &toshiba_attr_group);
 	if (ret) {
-- 
2.5.1
