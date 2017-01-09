From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 2/2] platform/x86: fujitsu-laptop: simplify logolamp_get()
Date: Mon,  9 Jan 2017 14:14:17 +0100
Message-ID: <20170109131417.9677-2-kernel@kempniu.pl>
References: <20170109131417.9677-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:36808 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759463AbdAINO1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Jan 2017 08:14:27 -0500
Received: by mail-lf0-f68.google.com with SMTP id j75so11748251lfe.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Jan 2017 05:14:26 -0800 (PST)
In-Reply-To: <20170109131417.9677-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Now that call_fext_func() is invoked by logolamp_set() for both
LOGOLAMP_POWERON and LOGOLAMP_ALWAYS for every brightness value,
logolamp_get() can be simplified to decrease indentation and number of
local variables.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
Changes from v1:

  - This patch was not present in v1.
    
One thing worth noting is that in case call_fext_func() returns an
error, logolamp_get() will still return LED_OFF, just like the original
version.

 drivers/platform/x86/fujitsu-laptop.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 34b8481fb0ed..7fa082558a42 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -319,17 +319,17 @@ static int eco_led_set(struct led_classdev *cdev,
 
 static enum led_brightness logolamp_get(struct led_classdev *cdev)
 {
-	enum led_brightness brightness = LED_OFF;
-	int poweron, always;
-
-	poweron = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_POWERON, 0x0);
-	if (poweron == FUNC_LED_ON) {
-		brightness = LED_HALF;
-		always = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_ALWAYS, 0x0);
-		if (always == FUNC_LED_ON)
-			brightness = LED_FULL;
-	}
-	return brightness;
+	int ret;
+
+	ret = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_ALWAYS, 0x0);
+	if (ret == FUNC_LED_ON)
+		return LED_FULL;
+
+	ret = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_POWERON, 0x0);
+	if (ret == FUNC_LED_ON)
+		return LED_HALF;
+
+	return LED_OFF;
 }
 
 static enum led_brightness kblamps_get(struct led_classdev *cdev)
-- 
2.11.0
