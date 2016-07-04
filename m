From: Matej Groma <matejgroma@gmail.com>
Subject: [PATCH] fujitsu-laptop: Rework brightness of eco led
Date: Mon, 4 Jul 2016 12:04:12 +0200
Message-ID: <20160704100409.GA5578@Matej-PC.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35640 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895AbcGDKER (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jul 2016 06:04:17 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jwoithe@just42.net, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

For the sake of internal consistency, unset maximum brightness of eco
led and make it activatable only on values >= LED_FULL.

Signed-off-by: Matej Groma <matejgroma@gmail.com>
---
Here is a small statistics covering max brightness of platform-x86 leds:
1	other	unset
8	6	7
3/7 leds that have unset max_brightness are activated on nonzero value.
The other 4 are fujitsu-laptop leds. Maybe someone from led subsystem
would be willing to look at this and standardise guidelines on how and
when to use different brightness levels. Hopefully, this could then be
reverted.

 drivers/platform/x86/fujitsu-laptop.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 6ce8e78..61f39ab 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -212,7 +212,6 @@ static void eco_led_set(struct led_classdev *cdev,

 static struct led_classdev eco_led = {
  .name = "fujitsu::eco_led",
- .max_brightness = 1,
  .brightness_get = eco_led_get,
  .brightness_set = eco_led_set
 };
@@ -306,7 +305,7 @@ static void eco_led_set(struct led_classdev *cdev,
 	int curr;

 	curr = call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0);
-	if (brightness)
+	if (brightness >= LED_FULL)
 		call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr | ECO_LED_ON);
 	else
 		call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr & ~ECO_LED_ON);
@@ -352,7 +351,7 @@ static enum led_brightness eco_led_get(struct led_classdev *cdev)
 	enum led_brightness brightness = LED_OFF;

 	if (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
-		brightness = cdev->max_brightness;
+		brightness = LED_FULL;

 	return brightness;
 }
