From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 4/4] toshiba_bluetooth: Remove BT enable code from *_notify function
Date: Wed, 25 Mar 2015 14:19:17 -0600
Message-ID: <1427314757-18232-5-git-send-email-coproscefalo@gmail.com>
References: <1427314757-18232-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427314757-18232-1-git-send-email-coproscefalo@gmail.com>
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

This patch acts according to the BT device status, activating the
device only when it is disabled and returning silently if the KS is
activated, this way we retain the previous functionality but without
affecting the newer devices that trigger the enable/disable loop.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index 0343d20..94bec3c 100644
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
@@ -135,7 +140,26 @@ static int toshiba_bluetooth_disable(acpi_handle handle)
 
 static void toshiba_bt_rfkill_notify(struct acpi_device *device, u32 event)
 {
-	toshiba_bluetooth_enable(device->handle);
+	bool killswitch;
+	bool powered;
+	bool plugged;
+	int status;
+
+	/* Query the status of the Bluetooth device */
+	status = toshiba_bluetooth_status(device->handle);
+	if (status < 0)
+		return;
+
+	killswitch = (status & BT_KILLSWITCH_MASK) ? true : false;
+	powered = (status & BT_POWER_MASK) ? true : false;
+	plugged = (status & BT_PLUGGED_MASK) ? true : false;
+
+	/* Verify RFKill switch is set to on, if not, we return silently. */
+	if (!killswitch)
+		return;
+	/* Check if the device is not powered or attached and the KS is off */
+	if (killswitch && (!powered || !plugged))
+		toshiba_bluetooth_enable(device->handle);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.2.2
