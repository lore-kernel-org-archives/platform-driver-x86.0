From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2] toshiba_acpi: Adapt /proc/acpi/toshiba/keys to TOS1900 devices
Date: Wed, 22 Jul 2015 18:09:10 -0600
Message-ID: <1437610153-26382-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:34207 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750779AbbGWAJZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jul 2015 20:09:25 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Since the introduction of TOS1900 devices support to the driver, the
"keys" entry under the proc directory was broken, given that it only
handled TOS620X devices accordingly.

This patch adapts the code to show the hotkey values of TOS1900
devices too, and in case some programs are still using that interface,
hotkeys reporting should now work on these devices.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
Changes since v1:
- No changes were made, this is simply a resend

 drivers/platform/x86/toshiba_acpi.c | 56 +++++++++++++------------------------
 1 file changed, 20 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 0aaf3ed..649786d 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1495,32 +1495,10 @@ static const struct file_operations fan_proc_fops = {
 static int keys_proc_show(struct seq_file *m, void *v)
 {
 	struct toshiba_acpi_dev *dev = m->private;
-	u32 hci_result;
-	u32 value;
-
-	if (!dev->key_event_valid && dev->system_event_supported) {
-		hci_result = hci_read(dev, HCI_SYSTEM_EVENT, &value);
-		if (hci_result == TOS_SUCCESS) {
-			dev->key_event_valid = 1;
-			dev->last_key_event = value;
-		} else if (hci_result == TOS_FIFO_EMPTY) {
-			/* Better luck next time */
-		} else if (hci_result == TOS_NOT_SUPPORTED) {
-			/*
-			 * This is a workaround for an unresolved issue on
-			 * some machines where system events sporadically
-			 * become disabled.
-			 */
-			hci_result = hci_write(dev, HCI_SYSTEM_EVENT, 1);
-			pr_notice("Re-enabled hotkeys\n");
-		} else {
-			pr_err("Error reading hotkey status\n");
-			return -EIO;
-		}
-	}
 
 	seq_printf(m, "hotkey_ready:            %d\n", dev->key_event_valid);
 	seq_printf(m, "hotkey:                  0x%04x\n", dev->last_key_event);
+
 	return 0;
 }
 
@@ -2432,22 +2410,28 @@ static void toshiba_acpi_report_hotkey(struct toshiba_acpi_dev *dev,
 
 static void toshiba_acpi_process_hotkeys(struct toshiba_acpi_dev *dev)
 {
-	u32 hci_result, value;
-	int retries = 3;
-	int scancode;
-
 	if (dev->info_supported) {
-		scancode = toshiba_acpi_query_hotkey(dev);
-		if (scancode < 0)
+		int scancode = toshiba_acpi_query_hotkey(dev);
+
+		if (scancode < 0) {
 			pr_err("Failed to query hotkey event\n");
-		else if (scancode != 0)
+		} else if (scancode != 0) {
 			toshiba_acpi_report_hotkey(dev, scancode);
+			dev->key_event_valid = 1;
+			dev->last_key_event = scancode;
+		}
 	} else if (dev->system_event_supported) {
+		u32 result;
+		u32 value;
+		int retries = 3;
+
 		do {
-			hci_result = hci_read(dev, HCI_SYSTEM_EVENT, &value);
-			switch (hci_result) {
+			result = hci_read(dev, HCI_SYSTEM_EVENT, &value);
+			switch (result) {
 			case TOS_SUCCESS:
 				toshiba_acpi_report_hotkey(dev, (int)value);
+				dev->key_event_valid = 1;
+				dev->last_key_event = value;
 				break;
 			case TOS_NOT_SUPPORTED:
 				/*
@@ -2455,15 +2439,15 @@ static void toshiba_acpi_process_hotkeys(struct toshiba_acpi_dev *dev)
 				 * issue on some machines where system events
 				 * sporadically become disabled.
 				 */
-				hci_result =
-					hci_write(dev, HCI_SYSTEM_EVENT, 1);
-				pr_notice("Re-enabled hotkeys\n");
+				result = hci_write(dev, HCI_SYSTEM_EVENT, 1);
+				if (result == TOS_SUCCESS)
+					pr_notice("Re-enabled hotkeys\n");
 				/* Fall through */
 			default:
 				retries--;
 				break;
 			}
-		} while (retries && hci_result != TOS_FIFO_EMPTY);
+		} while (retries && result != TOS_FIFO_EMPTY);
 	}
 }
 
-- 
2.4.5
