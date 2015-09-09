From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 2/2] toshiba_acpi: Change default Hotkey enabling value
Date: Wed,  9 Sep 2015 11:28:20 -0600
Message-ID: <1441819700-11678-3-git-send-email-coproscefalo@gmail.com>
References: <1441819700-11678-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441819700-11678-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The driver currently uses the hotkey enabling value of 0x09 to enable
hotkey events, but windows uses a different value (0x01).

All Toshiba laptops accept the following "hotkey" parameters:
0x01 - Enable hotkey and system events.
0x03 - Enable system events only.
0x09 - Enable hotkey events only.
0x0b - Disable (hotkey and system) events.

This patch changes the default hotkey enabling value from 0x09 to 0x01,
enabling both the hotkey and system events.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 5510d3f..803e967 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -131,7 +131,7 @@ MODULE_LICENSE("GPL");
 /* Field definitions */
 #define HCI_ACCEL_MASK			0x7fff
 #define HCI_HOTKEY_DISABLE		0x0b
-#define HCI_HOTKEY_ENABLE		0x09
+#define HCI_HOTKEY_ENABLE		0x01
 #define HCI_HOTKEY_SPECIAL_FUNCTIONS	0x10
 #define HCI_LCD_BRIGHTNESS_BITS		3
 #define HCI_LCD_BRIGHTNESS_SHIFT	(16-HCI_LCD_BRIGHTNESS_BITS)
-- 
2.5.1
