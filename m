From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 1/4] toshiba_bluetooth: Add a container struct named toshiba_bluetooth_dev
Date: Sun,  3 May 2015 17:42:06 -0600
Message-ID: <1430696532-12315-2-git-send-email-coproscefalo@gmail.com>
References: <1430696532-12315-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:33221 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398AbbECXmV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 19:42:21 -0400
In-Reply-To: <1430696532-12315-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch adds a struct named toshiba_bluetooth_dev, which will be
used to contain the acpi_device struct and bluetooth status booleans.

This struct will also be used by later patches to store the rfkill
struct as well.

Also, a helper function named toshiba_bluetooth_sync_status was added
to be also used by upcomming patches.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 47 +++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index 2498007..a619ba6 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -34,6 +34,14 @@ MODULE_AUTHOR("Jes Sorensen <Jes.Sorensen@gmail.com>");
 MODULE_DESCRIPTION("Toshiba Laptop ACPI Bluetooth Enable Driver");
 MODULE_LICENSE("GPL");
 
+struct toshiba_bluetooth_dev {
+	struct acpi_device *acpi_dev;
+
+	bool killswitch;
+	bool plugged;
+	bool powered;
+};
+
 static int toshiba_bt_rfkill_add(struct acpi_device *device);
 static int toshiba_bt_rfkill_remove(struct acpi_device *device);
 static void toshiba_bt_rfkill_notify(struct acpi_device *device, u32 event);
@@ -165,6 +173,25 @@ static int toshiba_bluetooth_disable(acpi_handle handle)
 	return 0;
 }
 
+/* Helper function */
+static int toshiba_bluetooth_sync_status(struct toshiba_bluetooth_dev *bt_dev)
+{
+	int status;
+
+	status = toshiba_bluetooth_status(bt_dev->acpi_dev->handle);
+	if (status < 0) {
+		pr_err("Could not sync bluetooth device status\n");
+		return status;
+	}
+
+	bt_dev->killswitch = (status & BT_KILLSWITCH_MASK) ? true : false;
+	bt_dev->plugged = (status & BT_PLUGGED_MASK) ? true : false;
+	bt_dev->powered = (status & BT_POWER_MASK) ? true : false;
+
+	return 0;
+}
+
+/* ACPI driver functions */
 static void toshiba_bt_rfkill_notify(struct acpi_device *device, u32 event)
 {
 	toshiba_bluetooth_enable(device->handle);
@@ -179,6 +206,7 @@ static int toshiba_bt_resume(struct device *dev)
 
 static int toshiba_bt_rfkill_add(struct acpi_device *device)
 {
+	struct toshiba_bluetooth_dev *bt_dev;
 	int result;
 
 	result = toshiba_bluetooth_present(device->handle);
@@ -187,17 +215,34 @@ static int toshiba_bt_rfkill_add(struct acpi_device *device)
 
 	pr_info("Toshiba ACPI Bluetooth device driver\n");
 
+	bt_dev = kzalloc(sizeof(*bt_dev), GFP_KERNEL);
+	if (!bt_dev)
+		return -ENOMEM;
+	bt_dev->acpi_dev = device;
+	device->driver_data = bt_dev;
+	dev_set_drvdata(&device->dev, bt_dev);
+
+	result = toshiba_bluetooth_sync_status(bt_dev);
+	if (result) {
+		kfree(bt_dev);
+		return result;
+	}
+
 	/* Enable the BT device */
 	result = toshiba_bluetooth_enable(device->handle);
 	if (result)
-		return result;
+		kfree(bt_dev);
 
 	return result;
 }
 
 static int toshiba_bt_rfkill_remove(struct acpi_device *device)
 {
+	struct toshiba_bluetooth_dev *bt_dev = acpi_driver_data(device);
+
 	/* clean up */
+	kfree(bt_dev);
+
 	return toshiba_bluetooth_disable(device->handle);
 }
 
-- 
2.3.6
