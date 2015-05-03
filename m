From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 3/4] toshiba_bluetooth: Adapt *_enable, *_notify and *_resume functions to rfkill
Date: Sun,  3 May 2015 17:42:08 -0600
Message-ID: <1430696532-12315-4-git-send-email-coproscefalo@gmail.com>
References: <1430696532-12315-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:35375 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481AbbECXmY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 May 2015 19:42:24 -0400
In-Reply-To: <1430696532-12315-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch adapts toshiba_bluetooth_enable, toshiba_bt_rfkill_notify
and toshiba_bt_resume functions to rfkill.

The *_enable function was cleaned from code that the rfkill code now
provides, and the other two functions were modified to update the rfkill
switch status, as they were only calling toshiba_bluetooth_enable.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 47 ++++++++++++--------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index a3b2d38..9867ccd 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -107,33 +107,6 @@ static int toshiba_bluetooth_status(acpi_handle handle)
 static int toshiba_bluetooth_enable(acpi_handle handle)
 {
 	acpi_status result;
-	bool killswitch;
-	bool powered;
-	bool plugged;
-	int status;
-
-	/*
-	 * Query ACPI to verify RFKill switch is set to 'on'.
-	 * If not, we return silently, no need to report it as
-	 * an error.
-	 */
-	status = toshiba_bluetooth_status(handle);
-	if (status < 0)
-		return status;
-
-	killswitch = (status & BT_KILLSWITCH_MASK) ? true : false;
-	powered = (status & BT_POWER_MASK) ? true : false;
-	plugged = (status & BT_PLUGGED_MASK) ? true : false;
-
-	if (!killswitch)
-		return 0;
-	/*
-	 * This check ensures to only enable the device if it is powered
-	 * off or detached, as some recent devices somehow pass the killswitch
-	 * test, causing a loop enabling/disabling the device, see bug 93911.
-	 */
-	if (powered || plugged)
-		return 0;
 
 	result = acpi_evaluate_object(handle, "AUSB", NULL, NULL);
 	if (ACPI_FAILURE(result)) {
@@ -233,13 +206,29 @@ static const struct rfkill_ops rfk_ops = {
 /* ACPI driver functions */
 static void toshiba_bt_rfkill_notify(struct acpi_device *device, u32 event)
 {
-	toshiba_bluetooth_enable(device->handle);
+	struct toshiba_bluetooth_dev *bt_dev = acpi_driver_data(device);
+
+	if (toshiba_bluetooth_sync_status(bt_dev))
+		return;
+
+	rfkill_set_hw_state(bt_dev->rfk, !bt_dev->killswitch);
 }
 
 #ifdef CONFIG_PM_SLEEP
 static int toshiba_bt_resume(struct device *dev)
 {
-	return toshiba_bluetooth_enable(to_acpi_device(dev)->handle);
+	struct toshiba_bluetooth_dev *bt_dev;
+	int ret;
+
+	bt_dev = acpi_driver_data(to_acpi_device(dev));
+
+	ret = toshiba_bluetooth_sync_status(bt_dev);
+	if (ret)
+		return ret;
+
+	rfkill_set_hw_state(bt_dev->rfk, !bt_dev->killswitch);
+
+	return 0;
 }
 #endif
 
-- 
2.3.6
