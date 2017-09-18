From: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is not presnt
Date: Mon, 18 Sep 2017 23:00:59 +0300
Message-ID: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:45544 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751457AbdIRUBE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2017 16:01:04 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

My Fujitsu-Siemens Lifebook S6120 doesn't have the FUJ02E3 device,
but it does have FUJ02B1. That means we do register the backlight
device (and it even seems to work), but the code will oops as soon
as we try to set the backlight brightness because it's trying to
call call_fext_func() with a NULL device. Let's just skip those
function calls when the FUJ02E3 device is not present.

Cc: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/platform/x86/fujitsu-laptop.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 85de30f93a9c..56a8195096a2 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -254,10 +254,12 @@ static int bl_update_status(struct backlight_device *b)
 {
 	struct acpi_device *device = bl_get_data(b);
 
-	if (b->props.power == FB_BLANK_POWERDOWN)
-		call_fext_func(fext, FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
-	else
-		call_fext_func(fext, FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
+	if (fext) {
+		if (b->props.power == FB_BLANK_POWERDOWN)
+			call_fext_func(fext, FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
+		else
+			call_fext_func(fext, FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
+	}
 
 	return set_lcd_level(device, b->props.brightness);
 }
-- 
2.13.5
