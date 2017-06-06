From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH] platform/x86/acer-wmi: Detect RF Button capability
Date: Tue,  6 Jun 2017 13:07:22 -0700
Message-ID: <20170606200722.4240-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35434 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751239AbdFFUHu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jun 2017 16:07:50 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

If a machine reports a RF Button in the communication button device
bitmap, we need to remove it before calling Get Device Status otherwise
it will return the "Undefined device" (0xE2) error code.

Although this may be a BIOS bug, we don't really need to get or set the
RF Button status. The status indicator LED embedded in the button is
controlled by firmware logic, depending on the status of the wireless
radios present on the machine (WiFi || WWAN).

This commit fixes the wireless status indicator LED on the Acer
TravelMate P648-G2-MG, and cleans the following message from the kernel
log: "Get Current Device Status failed: 0xe2 - 0x0".

Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/acer-wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 79fa5ab3fd00..3b381178039b 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -149,6 +149,8 @@ struct event_return_value {
 #define ACER_WMID3_GDS_THREEG		(1<<6)	/* 3G */
 #define ACER_WMID3_GDS_WIMAX		(1<<7)	/* WiMAX */
 #define ACER_WMID3_GDS_BLUETOOTH	(1<<11)	/* BT */
+#define ACER_WMID3_GDS_RFBTN		(1<<14)	/* RF Button */
+
 #define ACER_WMID3_GDS_TOUCHPAD		(1<<1)	/* Touchpad */
 
 /* Hotkey Customized Setting and Acer Application Status.
@@ -221,6 +223,7 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_BRIGHTNESS		(1<<3)
 #define ACER_CAP_THREEG			(1<<4)
 #define ACER_CAP_ACCEL			(1<<5)
+#define ACER_CAP_RFBTN			(1<<6)
 #define ACER_CAP_ANY			(0xFFFFFFFF)
 
 /*
@@ -1264,6 +1267,10 @@ static void __init type_aa_dmi_decode(const struct dmi_header *header, void *d)
 		interface->capability |= ACER_CAP_THREEG;
 	if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_BLUETOOTH)
 		interface->capability |= ACER_CAP_BLUETOOTH;
+	if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_RFBTN) {
+		interface->capability |= ACER_CAP_RFBTN;
+		commun_func_bitmap &= ~ACER_WMID3_GDS_RFBTN;
+	}
 
 	commun_fn_key_number = type_aa->commun_fn_key_number;
 }
-- 
2.11.0
