From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 1/2] platform/x86: fujitsu-laptop: rework logolamp_set() to properly handle errors
Date: Mon,  9 Jan 2017 14:14:16 +0100
Message-ID: <20170109131417.9677-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Potential errors returned by some call_fext_func() calls inside
logolamp_set() are currently ignored.  Rework logolamp_set() to properly
handle them.  This causes one more call_fext_func() call to be made in
the LED_OFF case, though one could argue that this is logically the
right thing to do (even though the extra call is not needed to shut the
LED off).

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
Changes from v1:

  - Decrease indentation by rearranging logical conditions.
  - Split variable declarations into two lines.

 drivers/platform/x86/fujitsu-laptop.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index b725a907a91f..34b8481fb0ed 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -271,15 +271,20 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
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
-	}
+	int poweron = FUNC_LED_ON, always = FUNC_LED_ON;
+	int ret;
+
+	if (brightness < LED_HALF)
+		poweron = FUNC_LED_OFF;
+
+	if (brightness < LED_FULL)
+		always = FUNC_LED_OFF;
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
