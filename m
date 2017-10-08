From: Christos Gkekas <chris.gekas@gmail.com>
Subject: [PATCH] intel-oaktrail: Clean up dead code
Date: Sun,  8 Oct 2017 23:57:49 +0100
Message-ID: <1507503469-22507-1-git-send-email-chris.gekas@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35588 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751001AbdJHW5y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 8 Oct 2017 18:57:54 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Christos Gkekas <chris.gekas@gmail.com>

A couple of macros are unused and need to be removed.
Also variable percent is unsigned so checking whether it is less than
zero is redundant.

Signed-off-by: Christos Gkekas <chris.gekas@gmail.com>
---
 drivers/platform/x86/intel_oaktrail.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_oaktrail.c b/drivers/platform/x86/intel_oaktrail.c
index 5747f63..0614d2b 100644
--- a/drivers/platform/x86/intel_oaktrail.c
+++ b/drivers/platform/x86/intel_oaktrail.c
@@ -68,12 +68,10 @@
  */
 #define OT_EC_DEVICE_STATE_ADDRESS	0xD6
 
-#define OT_EC_CAMERA_MASK	(1 << 0)
 #define OT_EC_BT_MASK		(1 << 1)
 #define OT_EC_GPS_MASK		(1 << 2)
 #define OT_EC_WIFI_MASK		(1 << 3)
 #define OT_EC_WWAN_MASK		(1 << 4)
-#define OT_EC_TS_MASK		(1 << 5)
 
 /*
  * This is the address in EC space and commands used to control LCD backlight:
@@ -228,7 +226,7 @@ static int get_backlight_brightness(struct backlight_device *b)
 static int set_backlight_brightness(struct backlight_device *b)
 {
 	u8 percent = (u8) b->props.brightness;
-	if (percent < 0 || percent > OT_EC_BL_BRIGHTNESS_MAX)
+	if (percent > OT_EC_BL_BRIGHTNESS_MAX)
 		return -EINVAL;
 
 	ec_write(OT_EC_BL_BRIGHTNESS_ADDRESS, percent);
-- 
2.7.4
