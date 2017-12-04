From: Peter Hutterer <peter.hutterer@who-t.net>
Subject: [PATCH] asus-wireless: send an EV_SYN/SYN_REPORT between state
 changes
Date: Mon, 4 Dec 2017 10:26:17 +1000
Message-ID: <20171204002617.GA11430@jelly>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Sending the switch state change twice within the same frame is invalid evdev
protocol and only works if the client handles keys immediately as well.
Processing events immediately is incorrect, it forces a fake order of events
that does not exist on the device.

Recent versions of libinput changed to only process the device state and
SYN_REPORT time, so now the key event is lost.

https://bugs.freedesktop.org/show_bug.cgi?id=104041

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
---
 drivers/platform/x86/asus-wireless.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
index f3796164329e..d4aeac3477f5 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -118,6 +118,7 @@ static void asus_wireless_notify(struct acpi_device *adev, u32 event)
 		return;
 	}
 	input_report_key(data->idev, KEY_RFKILL, 1);
+	input_sync(data->idev);
 	input_report_key(data->idev, KEY_RFKILL, 0);
 	input_sync(data->idev);
 }
-- 
2.13.6
