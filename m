From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 1/3] toshiba_bluetooth: Add three new functions to the driver
Date: Thu, 26 Mar 2015 14:56:05 -0600
Message-ID: <1427403367-18996-2-git-send-email-coproscefalo@gmail.com>
References: <1427403367-18996-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:33773 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753058AbbCZU4U (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Mar 2015 16:56:20 -0400
In-Reply-To: <1427403367-18996-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch introduces three new functions, which are going to be used
by the next patches.

The functions introduced are toshiba_bluetooth_present,
toshiba_bluetooth_status and toshiba_bluetooth_disable, which queries
the presence of the device, queries the status and disables the
device respectively.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 51 ++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index 2cb1ea6..b479a70 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -57,6 +57,38 @@ static struct acpi_driver toshiba_bt_rfkill_driver = {
 	.drv.pm =	&toshiba_bt_pm,
 };
 
+static int toshiba_bluetooth_present(acpi_handle handle)
+{
+	acpi_status result;
+	u64 bt_present;
+
+	result = acpi_evaluate_integer(handle, "_STA", NULL, &bt_present);
+	if (ACPI_FAILURE(result)) {
+		pr_err("ACPI call to query Bluetooth presence failed");
+		return -ENXIO;
+	} else if (!bt_present) {
+		pr_info("Bluetooth device not present\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int toshiba_bluetooth_status(acpi_handle handle)
+{
+	acpi_status result;
+	u64 status;
+
+	result = acpi_evaluate_integer(handle, "BTST", NULL, &status);
+	if (ACPI_FAILURE(result)) {
+		pr_err("Could not get Bluetooth device status\n");
+		return -ENXIO;
+	}
+
+	pr_info("Bluetooth status %llu\n", status);
+
+	return status;
+}
 
 static int toshiba_bluetooth_enable(acpi_handle handle)
 {
@@ -85,6 +117,25 @@ static int toshiba_bluetooth_enable(acpi_handle handle)
 	return -ENODEV;
 }
 
+static int toshiba_bluetooth_disable(acpi_handle handle)
+{
+	acpi_status result;
+
+	result = acpi_evaluate_object(handle, "BTPF", NULL, NULL);
+	if (ACPI_FAILURE(result)) {
+		pr_err("Could not power OFF Bluetooth device\n");
+		return -ENXIO;
+	}
+
+	result = acpi_evaluate_object(handle, "DUSB", NULL, NULL);
+	if (ACPI_FAILURE(result)) {
+		pr_err("Could not detach USB Bluetooth device\n");
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
 static void toshiba_bt_rfkill_notify(struct acpi_device *device, u32 event)
 {
 	toshiba_bluetooth_enable(device->handle);
-- 
2.2.2
