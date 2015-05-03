From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2] toshiba_acpi: Remove bluetooth rfkill code
Date: Sun,  3 May 2015 17:42:05 -0600
Message-ID: <1430696532-12315-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:33964 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750933AbbECXmT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 19:42:19 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch removes all bluetooth rfkill related code residing in
the toshiba_acpi driver.

Separate patches will add (and adapt) the code to toshiba_bluetooth
(where it belongs).

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
Changes since v1:
- Merged the two patches into one
- Removed a leftover boolean variable

 drivers/platform/x86/Kconfig        |   1 -
 drivers/platform/x86/toshiba_acpi.c | 124 ------------------------------------
 2 files changed, 125 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f9f205c..822171c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -612,7 +612,6 @@ config ACPI_TOSHIBA
 	select NEW_LEDS
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
-	depends on RFKILL || RFKILL = n
 	depends on SERIO_I8042 || SERIO_I8042 = n
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	select INPUT_POLLDEV
diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 9956b990..8ee7c24 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -41,7 +41,6 @@
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include <linux/backlight.h>
-#include <linux/rfkill.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/leds.h>
@@ -165,7 +164,6 @@ MODULE_LICENSE("GPL");
 struct toshiba_acpi_dev {
 	struct acpi_device *acpi_dev;
 	const char *method_hci;
-	struct rfkill *bt_rfk;
 	struct input_dev *hotkey_dev;
 	struct work_struct hotkey_work;
 	struct backlight_device *backlight_dev;
@@ -202,8 +200,6 @@ struct toshiba_acpi_dev {
 	unsigned int panel_power_on_supported:1;
 	unsigned int usb_three_supported:1;
 	unsigned int sysfs_created:1;
-
-	struct mutex mutex;
 };
 
 static struct toshiba_acpi_dev *toshiba_acpi;
@@ -1212,97 +1208,6 @@ static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
 	return 0;
 }
 
-/* Bluetooth rfkill handlers */
-
-static u32 hci_get_bt_present(struct toshiba_acpi_dev *dev, bool *present)
-{
-	u32 hci_result;
-	u32 value, value2;
-
-	value = 0;
-	value2 = 0;
-	hci_result = hci_read2(dev, HCI_WIRELESS, &value, &value2);
-	if (hci_result == TOS_SUCCESS)
-		*present = (value & HCI_WIRELESS_BT_PRESENT) ? true : false;
-
-	return hci_result;
-}
-
-static u32 hci_get_radio_state(struct toshiba_acpi_dev *dev, bool *radio_state)
-{
-	u32 hci_result;
-	u32 value, value2;
-
-	value = 0;
-	value2 = 0x0001;
-	hci_result = hci_read2(dev, HCI_WIRELESS, &value, &value2);
-
-	*radio_state = value & HCI_WIRELESS_KILL_SWITCH;
-	return hci_result;
-}
-
-static int bt_rfkill_set_block(void *data, bool blocked)
-{
-	struct toshiba_acpi_dev *dev = data;
-	u32 result1, result2;
-	u32 value;
-	int err;
-	bool radio_state;
-
-	value = (blocked == false);
-
-	mutex_lock(&dev->mutex);
-	if (hci_get_radio_state(dev, &radio_state) != TOS_SUCCESS) {
-		err = -EIO;
-		goto out;
-	}
-
-	if (!radio_state) {
-		err = 0;
-		goto out;
-	}
-
-	result1 = hci_write2(dev, HCI_WIRELESS, value, HCI_WIRELESS_BT_POWER);
-	result2 = hci_write2(dev, HCI_WIRELESS, value, HCI_WIRELESS_BT_ATTACH);
-
-	if (result1 != TOS_SUCCESS || result2 != TOS_SUCCESS)
-		err = -EIO;
-	else
-		err = 0;
- out:
-	mutex_unlock(&dev->mutex);
-	return err;
-}
-
-static void bt_rfkill_poll(struct rfkill *rfkill, void *data)
-{
-	bool new_rfk_state;
-	bool value;
-	u32 hci_result;
-	struct toshiba_acpi_dev *dev = data;
-
-	mutex_lock(&dev->mutex);
-
-	hci_result = hci_get_radio_state(dev, &value);
-	if (hci_result != TOS_SUCCESS) {
-		/* Can't do anything useful */
-		mutex_unlock(&dev->mutex);
-		return;
-	}
-
-	new_rfk_state = value;
-
-	mutex_unlock(&dev->mutex);
-
-	if (rfkill_set_hw_state(rfkill, !new_rfk_state))
-		bt_rfkill_set_block(data, true);
-}
-
-static const struct rfkill_ops toshiba_rfk_ops = {
-	.set_block = bt_rfkill_set_block,
-	.poll = bt_rfkill_poll,
-};
-
 static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, bool *enabled)
 {
 	u32 hci_result;
@@ -2692,11 +2597,6 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
 		sparse_keymap_free(dev->hotkey_dev);
 	}
 
-	if (dev->bt_rfk) {
-		rfkill_unregister(dev->bt_rfk);
-		rfkill_destroy(dev->bt_rfk);
-	}
-
 	backlight_device_unregister(dev->backlight_dev);
 
 	if (dev->illumination_supported)
@@ -2733,7 +2633,6 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	const char *hci_method;
 	u32 special_functions;
 	u32 dummy;
-	bool bt_present;
 	int ret = 0;
 
 	if (toshiba_acpi)
@@ -2769,33 +2668,10 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 	if (toshiba_acpi_setup_keyboard(dev))
 		pr_info("Unable to activate hotkeys\n");
 
-	mutex_init(&dev->mutex);
-
 	ret = toshiba_acpi_setup_backlight(dev);
 	if (ret)
 		goto error;
 
-	/* Register rfkill switch for Bluetooth */
-	if (hci_get_bt_present(dev, &bt_present) == TOS_SUCCESS && bt_present) {
-		dev->bt_rfk = rfkill_alloc("Toshiba Bluetooth",
-					   &acpi_dev->dev,
-					   RFKILL_TYPE_BLUETOOTH,
-					   &toshiba_rfk_ops,
-					   dev);
-		if (!dev->bt_rfk) {
-			pr_err("unable to allocate rfkill device\n");
-			ret = -ENOMEM;
-			goto error;
-		}
-
-		ret = rfkill_register(dev->bt_rfk);
-		if (ret) {
-			pr_err("unable to register rfkill device\n");
-			rfkill_destroy(dev->bt_rfk);
-			goto error;
-		}
-	}
-
 	if (toshiba_illumination_available(dev)) {
 		dev->led_dev.name = "toshiba::illumination";
 		dev->led_dev.max_brightness = 1;
-- 
2.3.6
