From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 2/2] platform/x86: fujitsu-laptop: simplify brightness key event generation logic
Date: Tue, 17 Jan 2017 12:07:35 +0100
Message-ID: <20170117110735.2543-3-kernel@kempniu.pl>
References: <20170117110735.2543-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170117110735.2543-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Returning early when there is no brightness change allows removal of a
duplicate code block, makes the purpose of the following code clearer
and allows the condition surrounding key event generation to be removed.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 37 +++++++++++++----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 35c1319b7c8e..37b0fcecff51 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -800,7 +800,6 @@ static void acpi_fujitsu_notify(struct acpi_device *device, u32 event)
 		return;
 	}
 
-	keycode = 0;
 	oldb = fujitsu->brightness_level;
 	get_lcd_level();
 	newb = fujitsu->brightness_level;
@@ -809,30 +808,22 @@ static void acpi_fujitsu_notify(struct acpi_device *device, u32 event)
 		    "brightness button event [%i -> %i (%i)]\n",
 		    oldb, newb, fujitsu->brightness_changed);
 
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
2.11.0
