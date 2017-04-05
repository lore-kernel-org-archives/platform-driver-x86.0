From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 08/11] platform/x86: fujitsu-laptop: ignore errors when setting backlight power
Date: Wed,  5 Apr 2017 08:49:07 +0200
Message-ID: <20170405064910.3162-9-kernel@kempniu.pl>
References: <20170405064910.3162-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34955 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754396AbdDEGt1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2017 02:49:27 -0400
Received: by mail-lf0-f68.google.com with SMTP id v2so355502lfi.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Apr 2017 23:49:26 -0700 (PDT)
In-Reply-To: <20170405064910.3162-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Not all Fujitsu laptops support controlling backlight power through the
FUJ02E3 ACPI device.  Remove the debug message informing about a failed
attempt to set backlight power as it may be confusing and the return
value of call_fext_func() is logged anyway.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index a3e9efd1ac88..0cd58c96938c 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -445,13 +445,9 @@ static int bl_update_status(struct backlight_device *b)
 {
 	int ret;
 	if (b->props.power == FB_BLANK_POWERDOWN)
-		ret = call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
+		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
 	else
-		ret = call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
-	if (ret != 0)
-		vdbg_printk(FUJLAPTOP_DBG_ERROR,
-			"Unable to adjust backlight power, error code %i\n",
-			ret);
+		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
 
 	ret = set_lcd_level(b->props.brightness);
 	if (ret != 0)
-- 
2.12.2
