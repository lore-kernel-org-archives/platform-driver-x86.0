From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/3] toshiba_acpi: Use the Hotkey Event Type function for keymap choosing
Date: Thu, 26 Feb 2015 10:57:13 -0700
Message-ID: <1424973434-3032-3-git-send-email-coproscefalo@gmail.com>
References: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
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
 drivers/platform/x86/toshiba_acpi.c | 51 +++++++++++++------------------------
 1 file changed, 18 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index e6aa8f9..10e0773 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -49,7 +49,6 @@
 #include <linux/workqueue.h>
 #include <linux/i8042.h>
 #include <linux/acpi.h>
-#include <linux/dmi.h>
 #include <linux/uaccess.h>
 
 MODULE_AUTHOR("John Belmonte");
@@ -178,6 +177,7 @@ struct toshiba_acpi_dev {
 	int kbd_mode;
 	int kbd_time;
 	int usbsc_bat_level;
+	int hotkey_event_type;
 
 	unsigned int illumination_supported:1;
 	unsigned int video_supported:1;
@@ -247,29 +247,6 @@ static const struct key_entry toshiba_acpi_keymap[] = {
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
@@ -2460,10 +2437,22 @@ static void toshiba_acpi_process_hotkeys(struct toshiba_acpi_dev *dev)
 
 static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 {
+	const struct key_entry *keymap = NULL;
 	acpi_handle ec_handle;
-	int error;
+	u32  events_type;
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
@@ -2473,7 +2462,9 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	dev->hotkey_dev->phys = "toshiba_acpi/input0";
 	dev->hotkey_dev->id.bustype = BUS_HOST;
 
-	if (dmi_check_system(toshiba_alt_keymap_dmi))
+	if (events_type == HCI_HOTKEY_EVENT_NORMAL)
+		keymap = toshiba_acpi_keymap;
+	else if (events_type == HCI_HOTKEY_EVENT_SPECIAL)
 		keymap = toshiba_acpi_alt_keymap;
 	error = sparse_keymap_setup(dev->hotkey_dev, keymap, NULL);
 	if (error)
@@ -2516,12 +2507,6 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
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
-- 
2.2.2
