From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] dell-laptop: Use bool type in struct quirk_entry for true/false fields
Date: Sat, 11 Nov 2017 23:20:23 +0100
Message-ID: <1510438823-28161-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:51221 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751905AbdKKWUj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Nov 2017 17:20:39 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

In struct quirk_entry some boolean fields used int, some u8 type. Change
them all to bool type.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-laptop.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 7424e53..de7d04b 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -48,10 +48,10 @@
 #define KBD_LED_AC_TOKEN 0x0451
 
 struct quirk_entry {
-	u8 touchpad_led;
-	u8 kbd_led_levels_off_1;
+	bool touchpad_led;
+	bool kbd_led_levels_off_1;
 
-	int needs_kbd_timeouts;
+	bool needs_kbd_timeouts;
 	/*
 	 * Ordered list of timeouts expressed in seconds.
 	 * The list must end with -1
@@ -62,7 +62,7 @@ struct quirk_entry {
 static struct quirk_entry *quirks;
 
 static struct quirk_entry quirk_dell_vostro_v130 = {
-	.touchpad_led = 1,
+	.touchpad_led = true,
 };
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
@@ -76,12 +76,12 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
  * is used then BIOS silently set timeout to 0 without any error message.
  */
 static struct quirk_entry quirk_dell_xps13_9333 = {
-	.needs_kbd_timeouts = 1,
+	.needs_kbd_timeouts = true,
 	.kbd_timeouts = { 0, 5, 15, 60, 5 * 60, 15 * 60, -1 },
 };
 
 static struct quirk_entry quirk_dell_latitude_e6410 = {
-	.kbd_led_levels_off_1 = 1,
+	.kbd_led_levels_off_1 = true,
 };
 
 static struct platform_driver platform_driver = {
-- 
1.7.9.5
