From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 4/6] toshiba_bluetooth: Adapt *_notify and *_resume functions to rfkill
Date: Mon, 27 Apr 2015 14:32:48 -0600
Message-ID: <1430166770-15060-5-git-send-email-coproscefalo@gmail.com>
References: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:32987 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965074AbbD0UdC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Apr 2015 16:33:02 -0400
In-Reply-To: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch adapts toshiba_bt_rfkill_notify and toshiba_bt_resume
functions to update the rfkill status, as they were only calling
toshiba_bluetooth_enable.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index 875ff6c..9867ccd 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -206,13 +206,29 @@ static const struct rfkill_ops rfk_ops = {
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
2.3.5
