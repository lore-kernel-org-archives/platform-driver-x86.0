From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2] toshiba_acpi: Remove unneeded u32 variables from *setup_keyboard
Date: Fri, 18 Sep 2015 22:45:34 -0600
Message-ID: <1442637935-5136-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35671 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750949AbbISEpl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Sep 2015 00:45:41 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

The function toshiba_acpi_setup_keyboard currently has two u32 variables
used to store the Hotkey Event Type and the result of the HCI_SYSTEM_EVENT
query.

This patch removes those two variables, as we already have a global
variable named "hotkey_event_type" and the result of the HCI_SYSTEM_EVENT
query can be checked directly from the function.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
Changes since v1:
- Effectively remove unneeded braces to avoid compiler errors

I forgot to respin the patch with the changes when compile tested this
patch, sorry for the noise :-)

 drivers/platform/x86/toshiba_acpi.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 803e967..0824f18 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2381,8 +2381,6 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 {
 	const struct key_entry *keymap = toshiba_acpi_keymap;
 	acpi_handle ec_handle;
-	u32 events_type;
-	u32 hci_result;
 	int error;
 
 	if (wmi_has_guid(TOSHIBA_WMI_EVENT_GUID)) {
@@ -2394,11 +2392,9 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	if (error)
 		return error;
 
-	if (toshiba_hotkey_event_type_get(dev, &events_type))
+	if (toshiba_hotkey_event_type_get(dev, &dev->hotkey_event_type))
 		pr_notice("Unable to query Hotkey Event Type\n");
 
-	dev->hotkey_event_type = events_type;
-
 	dev->hotkey_dev = input_allocate_device();
 	if (!dev->hotkey_dev)
 		return -ENOMEM;
@@ -2407,14 +2403,15 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	dev->hotkey_dev->phys = "toshiba_acpi/input0";
 	dev->hotkey_dev->id.bustype = BUS_HOST;
 
-	if (events_type == HCI_SYSTEM_TYPE1 ||
+	if (dev->hotkey_event_type == HCI_SYSTEM_TYPE1 ||
 	    !dev->kbd_function_keys_supported)
 		keymap = toshiba_acpi_keymap;
-	else if (events_type == HCI_SYSTEM_TYPE2 ||
+	else if (dev->hotkey_event_type == HCI_SYSTEM_TYPE2 ||
 		 dev->kbd_function_keys_supported)
 		keymap = toshiba_acpi_alt_keymap;
 	else
-		pr_info("Unknown event type received %x\n", events_type);
+		pr_info("Unknown event type received %x\n",
+			dev->hotkey_event_type);
 	error = sparse_keymap_setup(dev->hotkey_dev, keymap, NULL);
 	if (error)
 		goto err_free_dev;
@@ -2445,11 +2442,8 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	 */
 	if (acpi_has_method(dev->acpi_dev->handle, "INFO"))
 		dev->info_supported = 1;
-	else {
-		hci_result = hci_write(dev, HCI_SYSTEM_EVENT, 1);
-		if (hci_result == TOS_SUCCESS)
-			dev->system_event_supported = 1;
-	}
+	else if (hci_write(dev, HCI_SYSTEM_EVENT, 1) == TOS_SUCCESS)
+		dev->system_event_supported = 1;
 
 	if (!dev->info_supported && !dev->system_event_supported) {
 		pr_warn("No hotkey query interface found\n");
-- 
2.5.1
