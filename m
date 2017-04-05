From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 01/11] platform/x86: fujitsu-laptop: only handle backlight when appropriate
Date: Wed,  5 Apr 2017 08:49:00 +0200
Message-ID: <20170405064910.3162-2-kernel@kempniu.pl>
References: <20170405064910.3162-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34897 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753746AbdDEGtQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2017 02:49:16 -0400
Received: by mail-lf0-f65.google.com with SMTP id v2so355187lfi.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Apr 2017 23:49:15 -0700 (PDT)
In-Reply-To: <20170405064910.3162-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

The backlight part of fujitsu-laptop is only used by laptops which are
incapable of using the standard ACPI video interface for handling
brightness changes.  Conversely, on laptops which are capable of using
the latter, no vendor-specific ACPI calls should be made unless
explicitly requested by the user.  Bail out immediately from
acpi_fujitsu_bl_add() unless using the vendor-specific interface was
either explicitly requested by the user or automatically selected by the
kernel.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index f66da4b0c31a..722250d1aa20 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -589,6 +589,9 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	int state = 0;
 	int error;
 
+	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
+		return -ENODEV;
+
 	if (!device)
 		return -EINVAL;
 
@@ -641,11 +644,9 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 		fujitsu_bl->max_brightness = FUJITSU_LCD_N_LEVELS;
 	get_lcd_level();
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		error = fujitsu_backlight_register();
-		if (error)
-			return error;
-	}
+	error = fujitsu_backlight_register();
+	if (error)
+		return error;
 
 	return 0;
 }
-- 
2.12.2
