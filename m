From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Subject: [PATCH] fujitsu-laptop: use FB_BLANK_* constants
Date: Sun, 18 Jan 2015 01:02:11 +0100
Message-ID: <1421539331-32515-1-git-send-email-kernel@mkarcher.dialup.fu-berlin.de>
References: <1421537580-28554-1-git-send-email-kernel@mkarcher.dialup.fu-berlin.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421537580-28554-1-git-send-email-kernel@mkarcher.dialup.fu-berlin.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michael Karcher <karcher@physik.fu-berlin.de>
List-Id: platform-driver-x86.vger.kernel.org

From: Michael Karcher <karcher@physik.fu-berlin.de>

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
---
 drivers/platform/x86/fujitsu-laptop.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 7c21c1c..2a9afa2 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -64,6 +64,7 @@
 #include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/backlight.h>
+#include <linux/fb.h>
 #include <linux/input.h>
 #include <linux/kfifo.h>
 #include <linux/platform_device.h>
@@ -398,7 +399,7 @@ static int bl_get_brightness(struct backlight_device *b)
 static int bl_update_status(struct backlight_device *b)
 {
 	int ret;
-	if (b->props.power == 4)
+	if (b->props.power == FB_BLANK_POWERDOWN)
 		ret = call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
 	else
 		ret = call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
@@ -1139,9 +1140,9 @@ static int __init fujitsu_init(void)
 
 	if (!acpi_video_backlight_support()) {
 		if (call_fext_func(FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
-			fujitsu->bl_device->props.power = 4;
+			fujitsu->bl_device->props.power = FB_BLANK_POWERDOWN;
 		else
-			fujitsu->bl_device->props.power = 0;
+			fujitsu->bl_device->props.power = FB_BLANK_UNBLANK;
 	}
 
 	pr_info("driver " FUJITSU_DRIVER_VERSION " successfully loaded\n");
-- 
2.1.3
