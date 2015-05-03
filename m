From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 4/4] toshiba_bluetooth: Change BT status message to debug
Date: Sun,  3 May 2015 17:42:09 -0600
Message-ID: <1430696532-12315-5-git-send-email-coproscefalo@gmail.com>
References: <1430696532-12315-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430696532-12315-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The function toshiba_bluetooth_status is currently printing the
status of the device whenever it is queried, but since the
introduction of the rfkill poll code, this value will get printed
everytime the poll occurs.

This patch removes the status message from the *_status function, and
adds a debug message to the *_sync_status function printing the
bluetooth device raw status, killswitch, plug and power states of the
device as well.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index 9867ccd..f84cd6f 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -99,8 +99,6 @@ static int toshiba_bluetooth_status(acpi_handle handle)
 		return -ENXIO;
 	}
 
-	pr_info("Bluetooth status %llu\n", status);
-
 	return status;
 }
 
@@ -156,6 +154,9 @@ static int toshiba_bluetooth_sync_status(struct toshiba_bluetooth_dev *bt_dev)
 	bt_dev->killswitch = (status & BT_KILLSWITCH_MASK) ? true : false;
 	bt_dev->plugged = (status & BT_PLUGGED_MASK) ? true : false;
 	bt_dev->powered = (status & BT_POWER_MASK) ? true : false;
+
+	pr_debug("Bluetooth status %llu killswitch %d plugged %d powered %d\n",
+		 status, bt_dev->killswitch, bt_dev->plugged, bt_dev->powered);
 
 	return 0;
 }
-- 
2.3.6
