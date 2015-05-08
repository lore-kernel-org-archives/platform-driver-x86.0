From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_bluetooth: Fix build warning
Date: Fri,  8 May 2015 10:15:29 -0600
Message-ID: <1431101729-4372-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35978 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753114AbbEHQPf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 8 May 2015 12:15:35 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch fixes the build warning caused by the BT status variable,
it was previously printing a u64 value, but since it was moved to
another function, the value is now an int, and thus causing such
warning.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index 220645a..c5e4508 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -155,7 +155,7 @@ static int toshiba_bluetooth_sync_status(struct toshiba_bluetooth_dev *bt_dev)
 	bt_dev->plugged = (status & BT_PLUGGED_MASK) ? true : false;
 	bt_dev->powered = (status & BT_POWER_MASK) ? true : false;
 
-	pr_debug("Bluetooth status %llu killswitch %d plugged %d powered %d\n",
+	pr_debug("Bluetooth status %d killswitch %d plugged %d powered %d\n",
 		 status, bt_dev->killswitch, bt_dev->plugged, bt_dev->powered);
 
 	return 0;
-- 
2.3.6
