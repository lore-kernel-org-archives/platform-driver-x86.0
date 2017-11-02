From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v3] dell-laptop: Fix keyboard led max_brightness property for Dell Latitude E6410
Date: Thu,  2 Nov 2017 21:25:24 +0100
Message-ID: <1509654324-709-1-git-send-email-pali.rohar@gmail.com>
References: <1508349961-15051-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:54261 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932241AbdKBUZn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2017 16:25:43 -0400
In-Reply-To: <1508349961-15051-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, "Gabriel M. Elder" <gabriel@tekgnowsys.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario.Limonciello@dell.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

This machine reports number of keyboard backlight led levels, instead of
value of the last led level index. Therefore max_brightness properly needs
to be subtracted by 1 to match led max_brightness API.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
Reported-by: Gabriel M. Elder <gabriel@tekgnowsys.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=196913
---
Changes since v2:
* Rename quirk entry to kbd_led_levels_off_1
Changes since v1:
* Update kbd_info.levels at initialization time based on quirk
---
 drivers/platform/x86/dell-laptop.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f42159f..7424e53 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -49,6 +49,7 @@
 
 struct quirk_entry {
 	u8 touchpad_led;
+	u8 kbd_led_levels_off_1;
 
 	int needs_kbd_timeouts;
 	/*
@@ -79,6 +80,10 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
 	.kbd_timeouts = { 0, 5, 15, 60, 5 * 60, 15 * 60, -1 },
 };
 
+static struct quirk_entry quirk_dell_latitude_e6410 = {
+	.kbd_led_levels_off_1 = 1,
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
 
@@ -1200,6 +1214,9 @@ static int kbd_get_info(struct kbd_info *info)
 	units = (buffer->output[2] >> 8) & 0xFF;
 	info->levels = (buffer->output[2] >> 16) & 0xFF;
 
+	if (quirks && quirks->kbd_led_levels_off_1 && info->levels)
+		info->levels--;
+
 	if (units & BIT(0))
 		info->seconds = (buffer->output[3] >> 0) & 0xFF;
 	if (units & BIT(1))
-- 
1.7.9.5
