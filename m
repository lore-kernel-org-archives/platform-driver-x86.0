From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_acpi: Fix blank screen at boot if transflective backlight is supported
Date: Sun, 15 Nov 2015 20:32:47 -0700
Message-ID: <1447644767-356-1-git-send-email-coproscefalo@gmail.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Fabian Koester <fabian.koester@bringnow.com>, Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

If transflective backlight is supported and the brightness is zero
(lowest brightness level), the set_lcd_brightness function will activate
the transflective backlight, making the LCD appear to be turned off.

This patch fixes the issue by incrementing the brightness level, and
by doing so, avoiding the activation of the tranflective backlight.

Cc: <stable@vger.kernel.org> # 4.3+
Reported-and-tested-by: Fabian Koester <fabian.koester@bringnow.com>
Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 2ca3f91..b6a7dc9 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2634,6 +2634,14 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
 	brightness = __get_lcd_brightness(dev);
 	if (brightness < 0)
 		return 0;
+	/*
+	 * If transflective backlight is supported and the brightness is zero
+	 * (lowest brightness level), the set_lcd_brightness function will
+	 * activate the transflective backlight, making the LCD appear to be
+	 * turned off, simply increment the brightness level to avoid that.
+	 */
+	if (dev->tr_backlight_supported && brightness == 0)
+		brightness++;
 	ret = set_lcd_brightness(dev, brightness);
 	if (ret) {
 		pr_debug("Backlight method is read-only, disabling backlight support\n");
-- 
2.6.2
