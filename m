From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/1] toshiba_acpi: Remove unused wireless defines
Date: Wed, 22 Jul 2015 19:37:47 -0600
Message-ID: <1437615474-27936-2-git-send-email-coproscefalo@gmail.com>
References: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437615474-27936-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Commit 2b74103547b4 ("toshiba_acpi: Remove bluetooth rfkill code")
removed bluetooth related code, however, the wireless defines were
not removed and are being unused.

This patch simply removes those defines as there is no code using
them.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index b550be2..6013a11 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -113,7 +113,6 @@ MODULE_LICENSE("GPL");
 #define HCI_VIDEO_OUT			0x001c
 #define HCI_HOTKEY_EVENT		0x001e
 #define HCI_LCD_BRIGHTNESS		0x002a
-#define HCI_WIRELESS			0x0056
 #define HCI_ACCELEROMETER		0x006d
 #define HCI_KBD_ILLUMINATION		0x0095
 #define HCI_ECO_MODE			0x0097
@@ -142,10 +141,6 @@ MODULE_LICENSE("GPL");
 #define HCI_VIDEO_OUT_LCD		0x1
 #define HCI_VIDEO_OUT_CRT		0x2
 #define HCI_VIDEO_OUT_TV		0x4
-#define HCI_WIRELESS_KILL_SWITCH	0x01
-#define HCI_WIRELESS_BT_PRESENT		0x0f
-#define HCI_WIRELESS_BT_ATTACH		0x40
-#define HCI_WIRELESS_BT_POWER		0x80
 #define SCI_KBD_MODE_MASK		0x1f
 #define SCI_KBD_MODE_FNZ		0x1
 #define SCI_KBD_MODE_AUTO		0x2
-- 
2.4.5
