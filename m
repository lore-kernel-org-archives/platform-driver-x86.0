From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 1/2] platform/x86: fujitsu-laptop: decrease indentation in acpi_fujitsu_notify()
Date: Tue, 17 Jan 2017 12:07:34 +0100
Message-ID: <20170117110735.2543-2-kernel@kempniu.pl>
References: <20170117110735.2543-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36425 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750919AbdAQLQJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Jan 2017 06:16:09 -0500
Received: by mail-lf0-f66.google.com with SMTP id h65so15737279lfi.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jan 2017 03:16:08 -0800 (PST)
In-Reply-To: <20170117110735.2543-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

acpi_fujitsu_notify() is pretty deeply nested, which hurts readability.
Strip off one level of indentation by returning early when the event
code supplied as argument is not ACPI_FUJITSU_NOTIFY_CODE1.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
Changes introduced by this patch are best viewed when whitespace changes
are ignored.

 drivers/platform/x86/fujitsu-laptop.c | 64 ++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 96f8163d5002..35c1319b7c8e 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -789,40 +789,42 @@ static void acpi_fujitsu_notify(struct acpi_device *device, u32 event)
 
 	input = fujitsu->input;
 
-	switch (event) {
-	case ACPI_FUJITSU_NOTIFY_CODE1:
-		keycode = 0;
-		oldb = fujitsu->brightness_level;
-		get_lcd_level();
-		newb = fujitsu->brightness_level;
-
-		vdbg_printk(FUJLAPTOP_DBG_TRACE,
-			    "brightness button event [%i -> %i (%i)]\n",
-			    oldb, newb, fujitsu->brightness_changed);
-
-		if (oldb < newb) {
-			if (disable_brightness_adjust != 1) {
-				if (use_alt_lcd_levels)
-					set_lcd_level_alt(newb);
-				else
-					set_lcd_level(newb);
-			}
-			keycode = KEY_BRIGHTNESSUP;
-		} else if (oldb > newb) {
-			if (disable_brightness_adjust != 1) {
-				if (use_alt_lcd_levels)
-					set_lcd_level_alt(newb);
-				else
-					set_lcd_level(newb);
-			}
-			keycode = KEY_BRIGHTNESSDOWN;
-		}
-		break;
-	default:
+	if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
 		keycode = KEY_UNKNOWN;
 		vdbg_printk(FUJLAPTOP_DBG_WARN,
 			    "unsupported event [0x%x]\n", event);
-		break;
+		input_report_key(input, keycode, 1);
+		input_sync(input);
+		input_report_key(input, keycode, 0);
+		input_sync(input);
+		return;
+	}
+
+	keycode = 0;
+	oldb = fujitsu->brightness_level;
+	get_lcd_level();
+	newb = fujitsu->brightness_level;
+
+	vdbg_printk(FUJLAPTOP_DBG_TRACE,
+		    "brightness button event [%i -> %i (%i)]\n",
+		    oldb, newb, fujitsu->brightness_changed);
+
+	if (oldb < newb) {
+		if (disable_brightness_adjust != 1) {
+			if (use_alt_lcd_levels)
+				set_lcd_level_alt(newb);
+			else
+				set_lcd_level(newb);
+		}
+		keycode = KEY_BRIGHTNESSUP;
+	} else if (oldb > newb) {
+		if (disable_brightness_adjust != 1) {
+			if (use_alt_lcd_levels)
+				set_lcd_level_alt(newb);
+			else
+				set_lcd_level(newb);
+		}
+		keycode = KEY_BRIGHTNESSDOWN;
 	}
 
 	if (keycode != 0) {
-- 
2.11.0
