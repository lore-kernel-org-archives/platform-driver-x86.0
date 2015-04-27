From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 5/6] toshiba_bluetooth: Change BT status message to debug
Date: Mon, 27 Apr 2015 14:32:49 -0600
Message-ID: <1430166770-15060-6-git-send-email-coproscefalo@gmail.com>
References: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:33016 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965298AbbD0UdE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Apr 2015 16:33:04 -0400
In-Reply-To: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

The function toshiba_bluetooth_status s currently printing the status
of the device whenever it is queried, but since the introduction of
the rfkill poll code, this value will get printed everytime the poll
occurs.

This patch changes the level of the printed message from info to
debug, and also adds a few more debug messages printing the
killswitch, plug and power status of the device as well.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index 9867ccd..93b9688 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -99,7 +99,7 @@ static int toshiba_bluetooth_status(acpi_handle handle)
 		return -ENXIO;
 	}
 
-	pr_info("Bluetooth status %llu\n", status);
+	pr_debug("Bluetooth status %llu\n", status);
 
 	return status;
 }
@@ -157,6 +157,10 @@ static int toshiba_bluetooth_sync_status(struct toshiba_bluetooth_dev *bt_dev)
 	bt_dev->plugged = (status & BT_PLUGGED_MASK) ? true : false;
 	bt_dev->powered = (status & BT_POWER_MASK) ? true : false;
 
+	pr_debug("killswitch %d\n", bt_dev->killswitch);
+	pr_debug("plugged %d\n", bt_dev->plugged);
+	pr_debug("powered %d\n", bt_dev->powered);
+
 	return 0;
 }
 
-- 
2.3.5
