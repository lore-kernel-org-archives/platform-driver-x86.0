From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_acpi: Fix the kbd_backlight_mode_show printed value
Date: Tue, 16 Aug 2016 12:07:55 -0600
Message-ID: <20160816180755.1845-1-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The mentioned function prints the value in decimal, but the
documentation and its parent function available_kbd_modes_show
are showing the value as hexadecimal.

This patch simply changes the value printed from decimal to hex,
as stated in the documentation and the parent function.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 254a4d5..444f351 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1873,7 +1873,7 @@ static ssize_t kbd_backlight_mode_show(struct device *dev,
 	if (toshiba_kbd_illum_status_get(toshiba, &time) < 0)
 		return -EIO;
 
-	return sprintf(buf, "%i\n", time & SCI_KBD_MODE_MASK);
+	return sprintf(buf, "0x%x\n", time & SCI_KBD_MODE_MASK);
 }
 static DEVICE_ATTR_RW(kbd_backlight_mode);
 
-- 
2.9.2
