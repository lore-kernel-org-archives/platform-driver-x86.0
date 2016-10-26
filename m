From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform: x86: dell-laptop: use brightness_set_blocking for kbd_led_level_set
Date: Wed, 26 Oct 2016 17:17:44 +0200
Message-ID: <20161026151744.16638-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41426 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750857AbcJZPRt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Oct 2016 11:17:49 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

kbd_led_level_set uses dell_smbios call which block, so the kbd_led
classdev should use the brightness_set_blocking callback.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell-laptop.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 3803da1..d43d2d7 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -1869,38 +1869,40 @@ static enum led_brightness kbd_led_level_get(struct led_classdev *led_cdev)
 	return 0;
 }
 
-static void kbd_led_level_set(struct led_classdev *led_cdev,
-			      enum led_brightness value)
+static int kbd_led_level_set(struct led_classdev *led_cdev,
+			     enum led_brightness value)
 {
 	struct kbd_state state;
 	struct kbd_state new_state;
 	u16 num;
+	int ret;
 
 	if (kbd_get_max_level()) {
-		if (kbd_get_state(&state))
-			return;
+		ret = kbd_get_state(&state);
+		if (ret)
+			return ret;
 		new_state = state;
-		if (kbd_set_level(&new_state, value))
-			return;
-		kbd_set_state_safe(&new_state, &state);
-		return;
+		ret = kbd_set_level(&new_state, value);
+		if (ret)
+			return ret;
+		return kbd_set_state_safe(&new_state, &state);
 	}
 
 	if (kbd_get_valid_token_counts()) {
 		for (num = kbd_token_bits; num != 0 && value > 0; --value)
 			num &= num - 1; /* clear the first bit set */
 		if (num == 0)
-			return;
-		kbd_set_token_bit(ffs(num) - 1);
-		return;
+			return 0;
+		return kbd_set_token_bit(ffs(num) - 1);
 	}
 
 	pr_warn("Keyboard brightness level control not supported\n");
+	return -ENXIO;
 }
 
 static struct led_classdev kbd_led = {
 	.name           = "dell::kbd_backlight",
-	.brightness_set = kbd_led_level_set,
+	.brightness_set_blocking = kbd_led_level_set,
 	.brightness_get = kbd_led_level_get,
 	.groups         = kbd_led_groups,
 };
-- 
2.9.3
