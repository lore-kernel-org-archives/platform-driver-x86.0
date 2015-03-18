From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 4/4] toshiba_bluetooth: Remove BT enable code from *_notify function
Date: Wed, 18 Mar 2015 13:12:59 -0600
Message-ID: <1426705979-11880-6-git-send-email-coproscefalo@gmail.com>
References: <1426705979-11880-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426705979-11880-1-git-send-email-coproscefalo@gmail.com>
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

This patch removes the toshiba_bluetooth_enable call from the
toshiba_bluetooth_notify function, as we do not always need to
re-activate the device everytime we receive an event, we need to act
depending on the status of the BT device.

For now, we simply print the event received and the status of the BT
device, so we can later add code to handle special circumstances
depending on the status of the device.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index 0343d20..07edded 100644
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
@@ -135,7 +140,20 @@ static int toshiba_bluetooth_disable(acpi_handle handle)
 
 static void toshiba_bt_rfkill_notify(struct acpi_device *device, u32 event)
 {
-	toshiba_bluetooth_enable(device->handle);
+	int status;
+
+	pr_info("Received event %x\n", event);
+
+	/* Query the status of the Bluetooth device */
+	status = toshiba_bluetooth_status(device->handle);
+	if (status < 0)
+		return;
+
+	pr_info("Switch status %x\n", status & BT_KILLSWITCH_MASK);
+	pr_info("Power status %x\n", status & BT_POWER_MASK);
+	pr_info("Plug status %x\n", status & BT_PLUGGED_MASK);
+
+	/* TODO: Add event handling here depending on Bluetooth status */
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.2.2
