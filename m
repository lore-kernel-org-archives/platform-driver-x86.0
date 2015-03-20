From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 2/3] toshiba_acpi: Use the Hotkey Event Type function for keymap choosing
Date: Fri, 20 Mar 2015 16:55:17 -0600
Message-ID: <1426892118-27678-3-git-send-email-coproscefalo@gmail.com>
References: <1426892118-27678-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426892118-27678-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

With the previous patch adding support to "Hotkey Event Type", we can
now use the type to distinguish which keymap to use.

This patch changes the toshiba_acpi_setup_keyboard function to make
use of the hotkey event type to choose the correct keymap without the
need to use the DMI matching list.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 70 +++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index c4edae3..d7dac48 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -49,7 +49,6 @@
 #include <linux/workqueue.h>
 #include <linux/i8042.h>
 #include <linux/acpi.h>
-#include <linux/dmi.h>
 #include <linux/uaccess.h>
 
 MODULE_AUTHOR("John Belmonte");
@@ -177,6 +176,7 @@ struct toshiba_acpi_dev {
 	int kbd_mode;
 	int kbd_time;
 	int usbsc_bat_level;
+	int hotkey_event_type;
 
 	unsigned int illumination_supported:1;
 	unsigned int video_supported:1;
@@ -246,29 +246,6 @@ static const struct key_entry toshiba_acpi_keymap[] = {
 	{ KE_END, 0 },
 };
 
-/* alternative keymap */
-static const struct dmi_system_id toshiba_alt_keymap_dmi[] = {
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Satellite M840"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Qosmio X75-A"),
-		},
-	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TECRA A50-A"),
-		},
-	},
-	{}
-};
-
 static const struct key_entry toshiba_acpi_alt_keymap[] = {
 	{ KE_KEY, 0x157, { KEY_MUTE } },
 	{ KE_KEY, 0x102, { KEY_ZOOMOUT } },
@@ -2459,10 +2436,22 @@ static void toshiba_acpi_process_hotkeys(struct toshiba_acpi_dev *dev)
 
 static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 {
+	const struct key_entry *keymap = toshiba_acpi_keymap;
 	acpi_handle ec_handle;
-	int error;
+	u32 events_type;
 	u32 hci_result;
-	const struct key_entry *keymap = toshiba_acpi_keymap;
+	int error;
+
+	error = toshiba_acpi_enable_hotkeys(dev);
+	if (error)
+		return error;
+
+	error = toshiba_hotkey_event_type_get(dev, &events_type);
+	if (error) {
+		pr_err("Unable to query Hotkey Event Type\n");
+		return error;
+	}
+	dev->hotkey_event_type = events_type;
 
 	dev->hotkey_dev = input_allocate_device();
 	if (!dev->hotkey_dev)
@@ -2472,8 +2461,14 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	dev->hotkey_dev->phys = "toshiba_acpi/input0";
 	dev->hotkey_dev->id.bustype = BUS_HOST;
 
-	if (dmi_check_system(toshiba_alt_keymap_dmi))
+	if (events_type == HCI_SYSTEM_TYPE1 ||
+	    !dev->kbd_function_keys_supported)
+		keymap = toshiba_acpi_keymap;
+	else if (events_type == HCI_SYSTEM_TYPE2 ||
+		 dev->kbd_function_keys_supported)
 		keymap = toshiba_acpi_alt_keymap;
+	else
+		pr_info("Unknown event type received %x\n", events_type);
 	error = sparse_keymap_setup(dev->hotkey_dev, keymap, NULL);
 	if (error)
 		goto err_free_dev;
@@ -2515,12 +2510,6 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 		goto err_remove_filter;
 	}
 
-	error = toshiba_acpi_enable_hotkeys(dev);
-	if (error) {
-		pr_info("Unable to enable hotkeys\n");
-		goto err_remove_filter;
-	}
-
 	error = input_register_device(dev->hotkey_dev);
 	if (error) {
 		pr_info("Unable to register input device\n");
@@ -2673,6 +2662,16 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	acpi_dev->driver_data = dev;
 	dev_set_drvdata(&acpi_dev->dev, dev);
 
+	/* Query the BIOS for supported features */
+
+	/*
+	 * The "Special Functions" are always supported by the laptops
+	 * with the new keyboard layout, query for its presence to help
+	 * determine the keymap layout to use.
+	 */
+	ret = toshiba_function_keys_get(dev, &dummy);
+	dev->kbd_function_keys_supported = !ret;
+
 	if (toshiba_acpi_setup_keyboard(dev))
 		pr_info("Unable to activate hotkeys\n");
 
@@ -2750,17 +2749,12 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	ret = toshiba_usb_sleep_music_get(dev, &dummy);
 	dev->usb_sleep_music_supported = !ret;
 
-	ret = toshiba_function_keys_get(dev, &dummy);
-	dev->kbd_function_keys_supported = !ret;
-
 	ret = toshiba_panel_power_on_get(dev, &dummy);
 	dev->panel_power_on_supported = !ret;
 
 	ret = toshiba_usb_three_get(dev, &dummy);
 	dev->usb_three_supported = !ret;
 
-	/* Determine whether or not BIOS supports fan and video interfaces */
-
 	ret = get_video_status(dev, &dummy);
 	dev->video_supported = !ret;
 
-- 
2.2.2
