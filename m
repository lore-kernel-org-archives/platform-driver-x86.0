From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 2/2] platform/x86: fujitsu-laptop: simplify brightness key event generation logic
Date: Wed,  1 Mar 2017 07:42:54 +0100
Message-ID: <20170301064254.1311-3-kernel@kempniu.pl>
References: <20170301064254.1311-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36320 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751083AbdCAGoY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2017 01:44:24 -0500
Received: by mail-lf0-f65.google.com with SMTP id g70so1562251lfh.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2017 22:43:03 -0800 (PST)
In-Reply-To: <20170301064254.1311-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Returning early when there is no brightness change allows removal of a
duplicate code block, makes the purpose of the following code clearer
and allows the condition surrounding key event generation to be removed.
Local integer variables can also be declared in a single line.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 40 +++++++++++++----------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index b19f6e1c0173..4a5e7b60a672 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -790,8 +790,7 @@ static int acpi_fujitsu_bl_remove(struct acpi_device *device)
 static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 {
 	struct input_dev *input;
-	int keycode;
-	int oldb, newb;
+	int oldb, newb, keycode;
 
 	input = fujitsu_bl->input;
 
@@ -806,7 +805,6 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 		return;
 	}
 
-	keycode = 0;
 	oldb = fujitsu_bl->brightness_level;
 	get_lcd_level();
 	newb = fujitsu_bl->brightness_level;
@@ -815,30 +813,22 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 		    "brightness button event [%i -> %i (%i)]\n",
 		    oldb, newb, fujitsu_bl->brightness_changed);
 
-	if (oldb < newb) {
-		if (disable_brightness_adjust != 1) {
-			if (use_alt_lcd_levels)
-				set_lcd_level_alt(newb);
-			else
-				set_lcd_level(newb);
-		}
-		keycode = KEY_BRIGHTNESSUP;
-	} else if (oldb > newb) {
-		if (disable_brightness_adjust != 1) {
-			if (use_alt_lcd_levels)
-				set_lcd_level_alt(newb);
-			else
-				set_lcd_level(newb);
-		}
-		keycode = KEY_BRIGHTNESSDOWN;
-	}
+	if (oldb == newb)
+		return;
 
-	if (keycode != 0) {
-		input_report_key(input, keycode, 1);
-		input_sync(input);
-		input_report_key(input, keycode, 0);
-		input_sync(input);
+	if (disable_brightness_adjust != 1) {
+		if (use_alt_lcd_levels)
+			set_lcd_level_alt(newb);
+		else
+			set_lcd_level(newb);
 	}
+
+	keycode = oldb < newb ? KEY_BRIGHTNESSUP : KEY_BRIGHTNESSDOWN;
+
+	input_report_key(input, keycode, 1);
+	input_sync(input);
+	input_report_key(input, keycode, 0);
+	input_sync(input);
 }
 
 /* ACPI device for hotkey handling */
-- 
2.12.0
