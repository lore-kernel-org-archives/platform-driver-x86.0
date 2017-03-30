From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 08/11] platform/x86: fujitsu-laptop: ignore errors when setting backlight power
Date: Thu, 30 Mar 2017 12:35:06 +0200
Message-ID: <20170330103509.32509-9-kernel@kempniu.pl>
References: <20170330103509.32509-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170330103509.32509-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Not all Fujitsu laptops support controlling backlight power through the
FUJ02E3 ACPI device.  Remove the debug message informing about a failed
attempt to set backlight power as it may be confusing and the return
value of call_fext_func() is logged anyway.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 84c2bd55526f..ed9c37e0591d 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -444,13 +444,9 @@ static int bl_update_status(struct backlight_device *b)
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
2.12.1
