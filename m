From: Matej Groma <matejgroma@gmail.com>
Subject: [PATCH] fujitsu-laptop: Unify max brightness of exported leds
Date: Thu, 23 Jun 2016 19:52:53 +0200
Message-ID: <20160623175250.GA22215@Matej-PC.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36194 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141AbcFWRw5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 13:52:57 -0400
Received: by mail-wm0-f65.google.com with SMTP id c82so12870071wme.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2016 10:52:57 -0700 (PDT)
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jwoithe@just42.net
Cc: platform-driver-x86@vger.kernel.org

Set maximum brightness of leds that can only be turned off or on to 1.

Signed-off-by: Matej Groma <matejgroma@gmail.com>
---
Tested on Lifebook E756.

 drivers/platform/x86/fujitsu-laptop.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index ce41bc3..5542342 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -199,6 +199,7 @@ static void kblamps_set(struct led_classdev *cdev,

 static struct led_classdev kblamps_led = {
  .name = "fujitsu::kblamps",
+ .max_brightness = 1,
  .brightness_get = kblamps_get,
  .brightness_set = kblamps_set
 };
@@ -209,6 +210,7 @@ static void radio_led_set(struct led_classdev *cdev,

 static struct led_classdev radio_led = {
  .name = "fujitsu::radio_led",
+ .max_brightness = 1,
  .brightness_get = radio_led_get,
  .brightness_set = radio_led_set
 };
@@ -281,7 +283,7 @@ static void logolamp_set(struct led_classdev *cdev,
 static void kblamps_set(struct led_classdev *cdev,
 			       enum led_brightness brightness)
 {
-	if (brightness >= LED_FULL)
+	if (brightness)
 		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
 	else
 		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
@@ -290,7 +292,7 @@ static void kblamps_set(struct led_classdev *cdev,
 static void radio_led_set(struct led_classdev *cdev,
 				enum led_brightness brightness)
 {
-	if (brightness >= LED_FULL)
+	if (brightness)
 		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, RADIO_LED_ON);
 	else
 		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
@@ -316,7 +318,7 @@ static enum led_brightness kblamps_get(struct led_classdev *cdev)
 	enum led_brightness brightness = LED_OFF;

 	if (call_fext_func(FUNC_LEDS, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
-		brightness = LED_FULL;
+		brightness = cdev->max_brightness;

 	return brightness;
 }
@@ -326,7 +328,7 @@ static enum led_brightness radio_led_get(struct led_classdev *cdev)
 	enum led_brightness brightness = LED_OFF;

 	if (call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0) & RADIO_LED_ON)
-		brightness = LED_FULL;
+		brightness = cdev->max_brightness;

 	return brightness;
 }
