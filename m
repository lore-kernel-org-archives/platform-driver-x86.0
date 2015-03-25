From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 2/4] toshiba_bluetooth: Clean up *_add function and disable BT device at removal
Date: Wed, 25 Mar 2015 14:19:15 -0600
Message-ID: <1427314757-18232-3-git-send-email-coproscefalo@gmail.com>
References: <1427314757-18232-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33129 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752929AbbCYUT0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Mar 2015 16:19:26 -0400
In-Reply-To: <1427314757-18232-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch cleans the toshiba_bluetooth_add function by using the
recently introduced function toshiba_bluetooth_present, simplifying
its code and returning appropriate error values.

Also, disables the BT device at the removal of the driver, by using
the function toshiba_bluetooth_disable.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index b479a70..b8404c7 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -62,6 +62,11 @@ static int toshiba_bluetooth_present(acpi_handle handle)
 	acpi_status result;
 	u64 bt_present;
 
+	/*
+	 * Some Toshiba laptops may have a fake TOS6205 device in
+	 * their ACPI BIOS, so query the _STA method to see if there
+	 * is really anything there.
+	 */
 	result = acpi_evaluate_integer(handle, "_STA", NULL, &bt_present);
 	if (ACPI_FAILURE(result)) {
 		pr_err("ACPI call to query Bluetooth presence failed");
@@ -150,23 +155,18 @@ static int toshiba_bt_resume(struct device *dev)
 
 static int toshiba_bt_rfkill_add(struct acpi_device *device)
 {
-	acpi_status status;
-	u64 bt_present;
-	int result = -ENODEV;
+	int result;
 
-	/*
-	 * Some Toshiba laptops may have a fake TOS6205 device in
-	 * their ACPI BIOS, so query the _STA method to see if there
-	 * is really anything there, before trying to enable it.
-	 */
-	status = acpi_evaluate_integer(device->handle, "_STA", NULL,
-				       &bt_present);
+	result = toshiba_bluetooth_present(device->handle);
+	if (result)
+		return result;
 
-	if (!ACPI_FAILURE(status) && bt_present) {
-		pr_info("Detected Toshiba ACPI Bluetooth device - "
-			"installing RFKill handler\n");
-		result = toshiba_bluetooth_enable(device->handle);
-	}
+	pr_info("Toshiba ACPI Bluetooth device driver\n");
+
+	/* Enable the BT device */
+	result = toshiba_bluetooth_enable(device->handle);
+	if (result)
+		return result;
 
 	return result;
 }
@@ -174,7 +174,7 @@ static int toshiba_bt_rfkill_add(struct acpi_device *device)
 static int toshiba_bt_rfkill_remove(struct acpi_device *device)
 {
 	/* clean up */
-	return 0;
+	return toshiba_bluetooth_disable(device->handle);
 }
 
 module_acpi_driver(toshiba_bt_rfkill_driver);
-- 
2.2.2
