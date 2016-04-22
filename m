From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_acpi: Fix regression caused by hotkey enabling value
Date: Fri, 22 Apr 2016 09:29:36 -0600
Message-ID: <1461338976-5194-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34744 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932211AbcDVP3m (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Apr 2016 11:29:42 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Commit 52cbae0127ad ("toshiba_acpi: Change default Hotkey enabling value")
changed the hotkeys enabling value, as it was the same value Windows uses,
however, it turns out that the value tells the EC that the driver will now
take care of the hardware events like the physical RFKill switch or the
pointing device toggle button.

This patch reverts such commit by changing the default hotkey enabling
value to 0x09, which enables hotkey events only, making the hardware
buttons working again.

Fixes bugs 113331 and 114941.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index df1f1a7..01e12d2 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -135,7 +135,7 @@ MODULE_LICENSE("GPL");
 /* Field definitions */
 #define HCI_ACCEL_MASK			0x7fff
 #define HCI_HOTKEY_DISABLE		0x0b
-#define HCI_HOTKEY_ENABLE		0x01
+#define HCI_HOTKEY_ENABLE		0x09
 #define HCI_HOTKEY_SPECIAL_FUNCTIONS	0x10
 #define HCI_LCD_BRIGHTNESS_BITS		3
 #define HCI_LCD_BRIGHTNESS_SHIFT	(16-HCI_LCD_BRIGHTNESS_BITS)
-- 
2.8.1
