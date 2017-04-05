From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 10/11] platform/x86: fujitsu-laptop: account for backlight power when determining brightness
Date: Wed,  5 Apr 2017 08:49:09 +0200
Message-ID: <20170405064910.3162-11-kernel@kempniu.pl>
References: <20170405064910.3162-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170405064910.3162-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The comment for the get_brightness backlight device callback in
include/linux/backlight.h states that it should "return the current
backlight brightness (accounting for power, fb_blank etc.)".
fujitsu-laptop violates that premise by simply returning the value to
which ACPI function GBLL evaluates to.  Make sure 0 is returned when
backlight power is turned off.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index a797e7890773..f58a33d70be3 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -438,7 +438,7 @@ static int get_max_brightness(void)
 
 static int bl_get_brightness(struct backlight_device *b)
 {
-	return get_lcd_level();
+	return b->props.power == FB_BLANK_POWERDOWN ? 0 : get_lcd_level();
 }
 
 static int bl_update_status(struct backlight_device *b)
-- 
2.12.2
