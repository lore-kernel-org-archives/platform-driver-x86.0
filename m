From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 11/11] platform/x86: fujitsu-laptop: remove redundant fields from struct fujitsu_bl
Date: Wed,  5 Apr 2017 08:49:10 +0200
Message-ID: <20170405064910.3162-12-kernel@kempniu.pl>
References: <20170405064910.3162-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34964 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754406AbdDEGtY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2017 02:49:24 -0400
Received: by mail-lf0-f65.google.com with SMTP id v2so355554lfi.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Apr 2017 23:49:23 -0700 (PDT)
In-Reply-To: <20170405064910.3162-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

The dev field of struct fujitsu_bl is assigned in acpi_fujitsu_bl_add(),
but never used afterwards.  brightness_changed is set in get_lcd_level()
and then its value is only printed in a debug message, so it does not
influence execution flow.  Remove both fields as they are redundant.
Update the aforementioned debug message.  Adjust whitespace to make
checkpatch happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index f58a33d70be3..9fd5b98aeef8 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -135,13 +135,10 @@
 /* Device controlling the backlight and associated keys */
 struct fujitsu_bl {
 	acpi_handle acpi_handle;
-	struct acpi_device *dev;
 	struct input_dev *input;
 	char phys[32];
 	struct backlight_device *bl_device;
-
 	unsigned int max_brightness;
-	unsigned int brightness_changed;
 	unsigned int brightness_level;
 };
 
@@ -409,11 +406,6 @@ static int get_lcd_level(void)
 
 	fujitsu_bl->brightness_level = state & 0x0fffffff;
 
-	if (state & 0x80000000)
-		fujitsu_bl->brightness_changed = 1;
-	else
-		fujitsu_bl->brightness_changed = 0;
-
 	return fujitsu_bl->brightness_level;
 }
 
@@ -592,8 +584,6 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	       acpi_device_name(device), acpi_device_bid(device),
 	       !device->power.state ? "on" : "off");
 
-	fujitsu_bl->dev = device;
-
 	if (acpi_has_method(device->handle, METHOD_NAME__INI)) {
 		vdbg_printk(FUJLAPTOP_DBG_INFO, "Invoking _INI\n");
 		if (ACPI_FAILURE
@@ -633,9 +623,8 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 	get_lcd_level();
 	newb = fujitsu_bl->brightness_level;
 
-	vdbg_printk(FUJLAPTOP_DBG_TRACE,
-		    "brightness button event [%i -> %i (%i)]\n",
-		    oldb, newb, fujitsu_bl->brightness_changed);
+	vdbg_printk(FUJLAPTOP_DBG_TRACE, "brightness button event [%i -> %i]\n",
+		    oldb, newb);
 
 	if (oldb == newb)
 		return;
-- 
2.12.2
