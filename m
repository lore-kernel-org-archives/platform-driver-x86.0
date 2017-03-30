From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 09/11] platform/x86: fujitsu-laptop: do not log set_lcd_level() failures in bl_update_status()
Date: Thu, 30 Mar 2017 12:35:07 +0200
Message-ID: <20170330103509.32509-10-kernel@kempniu.pl>
References: <20170330103509.32509-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35505 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933689AbdC3Kf2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Mar 2017 06:35:28 -0400
Received: by mail-lf0-f66.google.com with SMTP id v2so4167091lfi.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Mar 2017 03:35:22 -0700 (PDT)
In-Reply-To: <20170330103509.32509-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Any set_lcd_level() call can fail for one of two reasons: either
requested brightness is outside the allowed range or the ACPI method
used for setting brightness level is not available.  For
bl_update_status(), the first case is handled by backlight core, which
means bl_update_status() will not even be called if requested brightness
is outside the allowed range.  The second case will be logged anyway by
set_lcd_level() itself, so there is no point in generating another
message in bl_update_status().  Remove the superfluous debug message
along with a local variable that is now redundant.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index ed9c37e0591d..78a39b143200 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -442,18 +442,12 @@ static int bl_get_brightness(struct backlight_device *b)
 
 static int bl_update_status(struct backlight_device *b)
 {
-	int ret;
 	if (b->props.power == FB_BLANK_POWERDOWN)
 		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
 	else
 		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
 
-	ret = set_lcd_level(b->props.brightness);
-	if (ret != 0)
-		vdbg_printk(FUJLAPTOP_DBG_ERROR,
-			"Unable to adjust LCD brightness, error code %i\n",
-			ret);
-	return ret;
+	return set_lcd_level(b->props.brightness);
 }
 
 static const struct backlight_ops fujitsu_bl_ops = {
-- 
2.12.1
