From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH] platform/x86: fujitsu-laptop: rework logolamp_set() to properly handle errors
Date: Thu,  5 Jan 2017 14:11:29 +0100
Message-ID: <20170105131129.5750-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:32843 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936161AbdAENMT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Jan 2017 08:12:19 -0500
Received: by mail-lf0-f66.google.com with SMTP id k62so852947lfg.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Jan 2017 05:11:37 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Potential errors returned by some call_fext_func() calls inside
logolamp_set() are currently ignored.  Rework logolamp_set() to properly
handle them.  This causes one more call_fext_func() call to be made in
the LED_OFF case, though one could argue that this is logically the
right thing to do (even though the extra call is not needed to shut the
LED off).

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
This is a follow-up to a recent patch, "platform/x86: fujitsu-laptop:
use brightness_set_blocking for LED-setting callbacks" and thus needs
the latter to be applied first (currently it is already applied in
testing).
    
Instead of sticking "if (ret < 0) return ret;" in two branches I decided
to restructure logolamp_set() for improved clarity and also to make it
resemble logolamp_get() a bit more.

 drivers/platform/x86/fujitsu-laptop.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index b725a907a91f..12f7a8346dd0 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -271,15 +271,19 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
 static int logolamp_set(struct led_classdev *cdev,
 			       enum led_brightness brightness)
 {
-	if (brightness >= LED_FULL) {
-		call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED_ON);
-		return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, FUNC_LED_ON);
-	} else if (brightness >= LED_HALF) {
-		call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED_ON);
-		return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, FUNC_LED_OFF);
-	} else {
-		return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, FUNC_LED_OFF);
+	int ret, poweron = FUNC_LED_OFF, always = FUNC_LED_OFF;
+
+	if (brightness >= LED_HALF) {
+		poweron = FUNC_LED_ON;
+		if (brightness >= LED_FULL)
+			always = FUNC_LED_ON;
 	}
+
+	ret = call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, poweron);
+	if (ret < 0)
+		return ret;
+
+	return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, always);
 }
 
 static int kblamps_set(struct led_classdev *cdev,
-- 
2.11.0
