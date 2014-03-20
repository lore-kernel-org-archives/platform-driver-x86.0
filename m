From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 07/11] sony-laptop: adjust keyboard backlight values for off/auto/on
Date: Fri, 21 Mar 2014 08:01:18 +0900
Message-ID: <1395356482-7446-8-git-send-email-malattia@linux.it>
References: <1395356482-7446-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:42142 "EHLO
	smtp.taihen.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759458AbaCTXJM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Mar 2014 19:09:12 -0400
In-Reply-To: <1395356482-7446-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <jachirica@gmail.com>, Mattia Dongili <malattia@linux.it>

From: Javier Achirica <jachirica@gmail.com>

Keyboard backlight can be always off, use some automatic trigger
(activity and light sensor), always on.
The behaviour of the driver changes whereby previously when passed 1 it
tried to turn on backlight immediately now it does nothing. This is
however a bug fix since (a) it makes little sense to turn on the
backlight when control is automatic and (b) this behaviour is
consistent with what the windows driver does.

Signed-off-by: Javier Achirica <jachirica@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index ba39a29..48e7e5b 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -129,7 +129,8 @@ static int kbd_backlight = -1;
 module_param(kbd_backlight, int, 0444);
 MODULE_PARM_DESC(kbd_backlight,
 		 "set this to 0 to disable keyboard backlight, "
-		 "1 to enable it (default: no change from current value)");
+		 "1 to enable it with automatic control and 2 to have it always "
+		 "on (default: no change from current value)");
 
 static int kbd_backlight_timeout = -1;
 module_param(kbd_backlight_timeout, int, 0444);
@@ -1772,7 +1773,7 @@ static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
 {
 	int result;
 
-	if (value > 1)
+	if (value > 2)
 		return -EINVAL;
 
 	if (sony_call_snc_handle(kbdbl_ctl->handle,
@@ -1780,8 +1781,10 @@ static ssize_t __sony_nc_kbd_backlight_mode_set(u8 value)
 		return -EIO;
 
 	/* Try to turn the light on/off immediately */
-	sony_call_snc_handle(kbdbl_ctl->handle,
-			(value << 0x10) | (kbdbl_ctl->base + 0x100), &result);
+	if (value != 1)
+		sony_call_snc_handle(kbdbl_ctl->handle,
+				(value << 0x0f) | (kbdbl_ctl->base + 0x100),
+				&result);
 
 	kbdbl_ctl->mode = value;
 
-- 
1.9.0
