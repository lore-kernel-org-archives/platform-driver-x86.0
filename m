From: Zhang Xianwei <zhang.xianwei8@zte.com.cn>
Subject: [PATCH] platform/x86: thinkpad_acpi: Change the keymap for Favorites hotkey
Date: Thu, 11 Oct 2018 13:59:31 +0800
Message-ID: <1539237571-28926-1-git-send-email-zhang.xianwei8@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ibm-acpi@hmh.eng.br, dvhart@infradead.org, andy@infradead.org
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, zhong.weidong@zte.com.cn, zhang.xianwei8@zte.com.cn
List-Id: platform-driver-x86.vger.kernel.org

The keycode KEY_FAVORITES(0x16c) used in thinkpad_acpi driver is too
big (out of range > 255) for xorg to handle.
xkeyboard-config has already mapped KEY_BOOKMARKS(156) to
XF86Favorites:

keycodes/evdev:
    <I164> = 164;   // #define KEY_BOOKMARKS           156

symbols/inet:
    key <I164>   {      [ XF86Favorites         ]       };

So change the keymap to KEY_BOOKMARKS for Favorites hotkey.

Signed-off-by: Zhang Xianwei <zhang.xianwei8@zte.com.cn>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index fde08a9..a86cf47 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3457,7 +3457,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN, KEY_UNKNOWN,
 		KEY_UNKNOWN,
 
-		KEY_FAVORITES,       /* Favorite app, 0x311 */
+		KEY_BOOKMARKS,       /* Favorite app, 0x311 */
 		KEY_RESERVED,        /* Clipping tool */
 		KEY_CALC,            /* Calculator (above numpad, P52) */
 		KEY_BLUETOOTH,       /* Bluetooth */
-- 
2.9.5
