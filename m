From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] dell-laptop: Fix keyboard led max_brightness property for Dell Latitude E6410
Date: Sun, 15 Oct 2017 18:03:14 +0200
Message-ID: <1508083394-22823-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33258 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751386AbdJOQDp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 15 Oct 2017 12:03:45 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

This machine reports number of keyboard backlight led levels, instead of
value of the last led level index. Therefore max_brightness properly needs
to be subtracted by 1 to match led max_brightness API.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
Reported-by: Gabriel M. Elder <gabriel@tekgnowsys.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=196913
---

Hi! I have not tested this patch yet, but I'm sending it, so other people
including Gabriel can test or review it.

If you have better idea how to call that quirk variable, then fell free
to rename it. I'm not happy with "kbd_led_num_of_levels_instead_of_last_index"
but I have nothing better in my mind.

---
 drivers/platform/x86/dell-laptop.c |   25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f42159f..81f14ea 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -49,6 +49,7 @@
 
 struct quirk_entry {
 	u8 touchpad_led;
+	u8 kbd_led_num_of_levels_instead_of_last_index;
 
 	int needs_kbd_timeouts;
 	/*
@@ -79,6 +80,10 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
 	.kbd_timeouts = { 0, 5, 15, 60, 5 * 60, 15 * 60, -1 },
 };
 
+static struct quirk_entry quirk_dell_latitude_e6410 = {
+	.kbd_led_num_of_levels_instead_of_last_index = 1,
+};
+
 static struct platform_driver platform_driver = {
 	.driver = {
 		.name = "dell-laptop",
@@ -280,6 +285,15 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
 		},
 		.driver_data = &quirk_dell_xps13_9333,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Latitude E6410",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6410"),
+		},
+		.driver_data = &quirk_dell_latitude_e6410,
+	},
 	{ }
 };
 
@@ -1216,8 +1230,15 @@ static int kbd_get_info(struct kbd_info *info)
 
 static unsigned int kbd_get_max_level(void)
 {
-	if (kbd_info.levels != 0)
-		return kbd_info.levels;
+	u8 levels = kbd_info.levels;
+
+	if (quirks && quirks->kbd_led_num_of_levels_instead_of_last_index) {
+		if (levels > 1)
+			return levels - 1;
+	} else {
+		if (levels > 0)
+			return levels;
+	}
 	if (kbd_mode_levels_count > 0)
 		return kbd_mode_levels_count - 1;
 	return 0;
-- 
1.7.9.5
