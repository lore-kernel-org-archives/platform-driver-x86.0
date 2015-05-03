From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 2/4] toshiba_bluetooth: Add RFKill handler functions
Date: Sun,  3 May 2015 17:42:07 -0600
Message-ID: <1430696532-12315-3-git-send-email-coproscefalo@gmail.com>
References: <1430696532-12315-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:32783 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751252AbbECXmW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 19:42:22 -0400
In-Reply-To: <1430696532-12315-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch adds RFKill handler functions to the driver, allowing it
to register and update the rfkill switch status.

Also, a comment block was moved from the header to the poll function,
as it explains why we need to poll the killswitch on older devices.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/Kconfig             |  1 +
 drivers/platform/x86/toshiba_bluetooth.c | 77 ++++++++++++++++++++++++++++----
 2 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 822171c..399085d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -642,6 +642,7 @@ config ACPI_TOSHIBA
 config TOSHIBA_BT_RFKILL
 	tristate "Toshiba Bluetooth RFKill switch support"
 	depends on ACPI
+	depends on RFKILL || RFKILL = n
 	---help---
 	  This driver adds support for Bluetooth events for the RFKill
 	  switch on modern Toshiba laptops with full ACPI support and
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
2.3.6
