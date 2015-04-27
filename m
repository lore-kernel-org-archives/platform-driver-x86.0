From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/6] toshiba_bluetooth: Add RFKill handler functions
Date: Mon, 27 Apr 2015 14:32:46 -0600
Message-ID: <1430166770-15060-3-git-send-email-coproscefalo@gmail.com>
References: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:35952 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965128AbbD0Uc7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Apr 2015 16:32:59 -0400
In-Reply-To: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch adds RFKill handler functions to the driver, allowing it
to register and update the rfkill switch.

Also, a comment block was moved from the header to the poll function,
as it explains why we need to poll the killswitch on older devices.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 77 ++++++++++++++++++++++++++++----
 1 file changed, 68 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index a619ba6..a3b2d38 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -10,12 +10,6 @@
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
- *
- * Note the Toshiba Bluetooth RFKill switch seems to be a strange
- * fish. It only provides a BT event when the switch is flipped to
- * the 'on' position. When flipping it to 'off', the USB device is
- * simply pulled away underneath us, without any BT event being
- * delivered.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -25,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/types.h>
 #include <linux/acpi.h>
+#include <linux/rfkill.h>
 
 #define BT_KILLSWITCH_MASK	0x01
 #define BT_PLUGGED_MASK		0x40
@@ -36,6 +31,7 @@ MODULE_LICENSE("GPL");
 
 struct toshiba_bluetooth_dev {
 	struct acpi_device *acpi_dev;
+	struct rfkill *rfk;
 
 	bool killswitch;
 	bool plugged;
@@ -191,6 +187,49 @@ static int toshiba_bluetooth_sync_status(struct toshiba_bluetooth_dev *bt_dev)
 	return 0;
 }
 
+/* RFKill handlers */
+static int bt_rfkill_set_block(void *data, bool blocked)
+{
+	struct toshiba_bluetooth_dev *bt_dev = data;
+	int ret;
+
+	ret = toshiba_bluetooth_sync_status(bt_dev);
+	if (ret)
+		return ret;
+
+	if (!bt_dev->killswitch)
+		return 0;
+
+	if (blocked)
+		ret = toshiba_bluetooth_disable(bt_dev->acpi_dev->handle);
+	else
+		ret = toshiba_bluetooth_enable(bt_dev->acpi_dev->handle);
+
+	return ret;
+}
+
+static void bt_rfkill_poll(struct rfkill *rfkill, void *data)
+{
+	struct toshiba_bluetooth_dev *bt_dev = data;
+
+	if (toshiba_bluetooth_sync_status(bt_dev))
+		return;
+
+	/*
+	 * Note the Toshiba Bluetooth RFKill switch seems to be a strange
+	 * fish. It only provides a BT event when the switch is flipped to
+	 * the 'on' position. When flipping it to 'off', the USB device is
+	 * simply pulled away underneath us, without any BT event being
+	 * delivered.
+	 */
+	rfkill_set_hw_state(bt_dev->rfk, !bt_dev->killswitch);
+}
+
+static const struct rfkill_ops rfk_ops = {
+	.set_block = bt_rfkill_set_block,
+	.poll = bt_rfkill_poll,
+};
+
 /* ACPI driver functions */
 static void toshiba_bt_rfkill_notify(struct acpi_device *device, u32 event)
 {
@@ -228,10 +267,25 @@ static int toshiba_bt_rfkill_add(struct acpi_device *device)
 		return result;
 	}
 
-	/* Enable the BT device */
-	result = toshiba_bluetooth_enable(device->handle);
-	if (result)
+	bt_dev->rfk = rfkill_alloc("Toshiba Bluetooth",
+				   &device->dev,
+				   RFKILL_TYPE_BLUETOOTH,
+				   &rfk_ops,
+				   bt_dev);
+	if (!bt_dev->rfk) {
+		pr_err("Unable to allocate rfkill device\n");
+		kfree(bt_dev);
+		return -ENOMEM;
+	}
+
+	rfkill_set_hw_state(bt_dev->rfk, !bt_dev->killswitch);
+
+	result = rfkill_register(bt_dev->rfk);
+	if (result) {
+		pr_err("Unable to register rfkill device\n");
+		rfkill_destroy(bt_dev->rfk);
 		kfree(bt_dev);
+	}
 
 	return result;
 }
@@ -241,6 +295,11 @@ static int toshiba_bt_rfkill_remove(struct acpi_device *device)
 	struct toshiba_bluetooth_dev *bt_dev = acpi_driver_data(device);
 
 	/* clean up */
+	if (bt_dev->rfk) {
+		rfkill_unregister(bt_dev->rfk);
+		rfkill_destroy(bt_dev->rfk);
+	}
+
 	kfree(bt_dev);
 
 	return toshiba_bluetooth_disable(device->handle);
-- 
2.3.5
