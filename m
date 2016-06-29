From: Matej Groma <matejgroma@gmail.com>
Subject: [PATCH v2] fujitsu-laptop: Unify max brightness of exported leds
Date: Wed, 29 Jun 2016 09:28:03 +0200
Message-ID: <20160629072758.GA2778@Matej-PC.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jwoithe@just42.net, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Exported leds had maximum brightness previously unset, thus having
value 255. Set maximum brightness of leds that can only be turned
off or on to 1, making the behavior more consistent with other leds
having binary state.

Signed-off-by: Matej Groma <matejgroma@gmail.com>
---
Changes from v1:
	made commit message more clear
	rebased on testing

 drivers/platform/x86/fujitsu-laptop.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 6ce8e78..abb7c62 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -192,6 +192,7 @@ static void kblamps_set(struct led_classdev *cdev,

 static struct led_classdev kblamps_led = {
  .name = "fujitsu::kblamps",
+ .max_brightness = 1,
  .brightness_get = kblamps_get,
  .brightness_set = kblamps_set
 };
@@ -202,6 +203,7 @@ static void radio_led_set(struct led_classdev *cdev,

 static struct led_classdev radio_led = {
  .name = "fujitsu::radio_led",
+ .max_brightness = 1,
  .brightness_get = radio_led_get,
  .brightness_set = radio_led_set
 };
@@ -285,7 +287,7 @@ static void logolamp_set(struct led_classdev *cdev,
 static void kblamps_set(struct led_classdev *cdev,
 			       enum led_brightness brightness)
 {
-	if (brightness >= LED_FULL)
+	if (brightness)
 		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
 	else
 		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
@@ -294,7 +296,7 @@ static void kblamps_set(struct led_classdev *cdev,
 static void radio_led_set(struct led_classdev *cdev,
 				enum led_brightness brightness)
 {
-	if (brightness >= LED_FULL)
+	if (brightness)
 		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, RADIO_LED_ON);
 	else
 		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
@@ -332,7 +334,7 @@ static enum led_brightness kblamps_get(struct led_classdev *cdev)
 	enum led_brightness brightness = LED_OFF;

 	if (call_fext_func(FUNC_LEDS, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
-		brightness = LED_FULL;
+		brightness = cdev->max_brightness;

 	return brightness;
 }
@@ -342,7 +344,7 @@ static enum led_brightness radio_led_get(struct led_classdev *cdev)
 	enum led_brightness brightness = LED_OFF;

 	if (call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0) & RADIO_LED_ON)
-		brightness = LED_FULL;
+		brightness = cdev->max_brightness;

 	return brightness;
 }
