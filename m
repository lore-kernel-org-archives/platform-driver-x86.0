From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v3 3/3] toshiba_bluetooth: Fix enabling/disabling loop on recent devices
Date: Thu, 26 Mar 2015 14:56:07 -0600
Message-ID: <1427403367-18996-4-git-send-email-coproscefalo@gmail.com>
References: <1427403367-18996-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427403367-18996-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Bug 93911 reported a broken handling of the BT device, causing the
driver to get stuck in a loop enabling/disabling the device whenever
the device is deactivated by the kill switch as follows:

1. The user activated the kill switch, causing the system to generate
   a 0x90 (status change) event and disabling the BT device.
2. The driver catches the event and re-enables the BT device.
3. The system detects the device being activated, but since the kill
   switch is activated, disables the BT device (again) and generates
   a 0x90 event (again).
4. Repeat from 2.

This patch adds an extra check to verify the status of the BT device,
returning silently if it is already activated.

Also, checks and returns appropriate error values while evaluating
the AUSB and BTPO methods.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 50 +++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index b8404c7..2498007 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -2,6 +2,7 @@
  * Toshiba Bluetooth Enable Driver
  *
  * Copyright (C) 2009 Jes Sorensen <Jes.Sorensen@gmail.com>
+ * Copyright (C) 2015 Azael Avalos <coproscefalo@gmail.com>
  *
  * Thanks to Matthew Garrett for background info on ACPI innards which
  * normal people aren't meant to understand :-)
@@ -25,6 +26,10 @@
 #include <linux/types.h>
 #include <linux/acpi.h>
 
+#define BT_KILLSWITCH_MASK	0x01
+#define BT_PLUGGED_MASK		0x40
+#define BT_POWER_MASK		0x80
+
 MODULE_AUTHOR("Jes Sorensen <Jes.Sorensen@gmail.com>");
 MODULE_DESCRIPTION("Toshiba Laptop ACPI Bluetooth Enable Driver");
 MODULE_LICENSE("GPL");
@@ -97,29 +102,48 @@ static int toshiba_bluetooth_status(acpi_handle handle)
 
 static int toshiba_bluetooth_enable(acpi_handle handle)
 {
-	acpi_status res1, res2;
-	u64 result;
+	acpi_status result;
+	bool killswitch;
+	bool powered;
+	bool plugged;
+	int status;
 
 	/*
 	 * Query ACPI to verify RFKill switch is set to 'on'.
 	 * If not, we return silently, no need to report it as
 	 * an error.
 	 */
-	res1 = acpi_evaluate_integer(handle, "BTST", NULL, &result);
-	if (ACPI_FAILURE(res1))
-		return res1;
-	if (!(result & 0x01))
-		return 0;
+	status = toshiba_bluetooth_status(handle);
+	if (status < 0)
+		return status;
+
+	killswitch = (status & BT_KILLSWITCH_MASK) ? true : false;
+	powered = (status & BT_POWER_MASK) ? true : false;
+	plugged = (status & BT_PLUGGED_MASK) ? true : false;
 
-	pr_info("Re-enabling Toshiba Bluetooth\n");
-	res1 = acpi_evaluate_object(handle, "AUSB", NULL, NULL);
-	res2 = acpi_evaluate_object(handle, "BTPO", NULL, NULL);
-	if (!ACPI_FAILURE(res1) || !ACPI_FAILURE(res2))
+	if (!killswitch)
+		return 0;
+	/*
+	 * This check ensures to only enable the device if it is powered
+	 * off or detached, as some recent devices somehow pass the killswitch
+	 * test, causing a loop enabling/disabling the device, see bug 93911.
+	 */
+	if (powered || plugged)
 		return 0;
 
-	pr_warn("Failed to re-enable Toshiba Bluetooth\n");
+	result = acpi_evaluate_object(handle, "AUSB", NULL, NULL);
+	if (ACPI_FAILURE(result)) {
+		pr_err("Could not attach USB Bluetooth device\n");
+		return -ENXIO;
+	}
 
-	return -ENODEV;
+	result = acpi_evaluate_object(handle, "BTPO", NULL, NULL);
+	if (ACPI_FAILURE(result)) {
+		pr_err("Could not power ON Bluetooth device\n");
+		return -ENXIO;
+	}
+
+	return 0;
 }
 
 static int toshiba_bluetooth_disable(acpi_handle handle)
-- 
2.2.2
