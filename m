From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 3/6] platform/x86: fujitsu-laptop: reorganize LED-related code
Date: Fri,  7 Apr 2017 15:07:10 +0200
Message-ID: <20170407130713.8417-4-kernel@kempniu.pl>
References: <20170407130713.8417-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34256 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756112AbdDGNHU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 09:07:20 -0400
Received: by mail-lf0-f66.google.com with SMTP id z134so1072554lfd.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Apr 2017 06:07:19 -0700 (PDT)
In-Reply-To: <20170407130713.8417-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Move around LED definitions and callbacks to eliminate the need for
forward declarations and ensure code is organized LED-wise, not
action-wise.  Reorder assignments inside designated initializers so that
they are in the same order as struct led_classdev fields in
include/linux/leds.h.  Adjust whitespace to make checkpatch happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 261 ++++++++++++++++------------------
 1 file changed, 124 insertions(+), 137 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 4d13cc03d3b1..da0bd556b0bb 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -161,47 +161,6 @@ struct fujitsu_laptop {
 
 static struct fujitsu_laptop *fujitsu_laptop;
 
-static enum led_brightness logolamp_get(struct led_classdev *cdev);
-static int logolamp_set(struct led_classdev *cdev,
-			       enum led_brightness brightness);
-
-static struct led_classdev logolamp_led = {
- .name = "fujitsu::logolamp",
- .brightness_get = logolamp_get,
- .brightness_set_blocking = logolamp_set
-};
-
-static enum led_brightness kblamps_get(struct led_classdev *cdev);
-static int kblamps_set(struct led_classdev *cdev,
-			       enum led_brightness brightness);
-
-static struct led_classdev kblamps_led = {
- .name = "fujitsu::kblamps",
- .brightness_get = kblamps_get,
- .brightness_set_blocking = kblamps_set
-};
-
-static enum led_brightness radio_led_get(struct led_classdev *cdev);
-static int radio_led_set(struct led_classdev *cdev,
-			       enum led_brightness brightness);
-
-static struct led_classdev radio_led = {
- .name = "fujitsu::radio_led",
- .default_trigger = "rfkill-any",
- .brightness_get = radio_led_get,
- .brightness_set_blocking = radio_led_set
-};
-
-static enum led_brightness eco_led_get(struct led_classdev *cdev);
-static int eco_led_set(struct led_classdev *cdev,
-			       enum led_brightness brightness);
-
-static struct led_classdev eco_led = {
- .name = "fujitsu::eco_led",
- .brightness_get = eco_led_get,
- .brightness_set_blocking = eco_led_set
-};
-
 #ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
 static u32 dbg_level = 0x03;
 #endif
@@ -247,102 +206,6 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
 	return value;
 }
 
-/* LED class callbacks */
-
-static int logolamp_set(struct led_classdev *cdev,
-			       enum led_brightness brightness)
-{
-	int poweron = FUNC_LED_ON, always = FUNC_LED_ON;
-	int ret;
-
-	if (brightness < LED_HALF)
-		poweron = FUNC_LED_OFF;
-
-	if (brightness < LED_FULL)
-		always = FUNC_LED_OFF;
-
-	ret = call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, poweron);
-	if (ret < 0)
-		return ret;
-
-	return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, always);
-}
-
-static int kblamps_set(struct led_classdev *cdev,
-			       enum led_brightness brightness)
-{
-	if (brightness >= LED_FULL)
-		return call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
-	else
-		return call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
-}
-
-static int radio_led_set(struct led_classdev *cdev,
-				enum led_brightness brightness)
-{
-	if (brightness >= LED_FULL)
-		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON, RADIO_LED_ON);
-	else
-		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON, 0x0);
-}
-
-static int eco_led_set(struct led_classdev *cdev,
-				enum led_brightness brightness)
-{
-	int curr;
-
-	curr = call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0);
-	if (brightness >= LED_FULL)
-		return call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr | ECO_LED_ON);
-	else
-		return call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr & ~ECO_LED_ON);
-}
-
-static enum led_brightness logolamp_get(struct led_classdev *cdev)
-{
-	int ret;
-
-	ret = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_ALWAYS, 0x0);
-	if (ret == FUNC_LED_ON)
-		return LED_FULL;
-
-	ret = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_POWERON, 0x0);
-	if (ret == FUNC_LED_ON)
-		return LED_HALF;
-
-	return LED_OFF;
-}
-
-static enum led_brightness kblamps_get(struct led_classdev *cdev)
-{
-	enum led_brightness brightness = LED_OFF;
-
-	if (call_fext_func(FUNC_LEDS, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
-		brightness = LED_FULL;
-
-	return brightness;
-}
-
-static enum led_brightness radio_led_get(struct led_classdev *cdev)
-{
-	enum led_brightness brightness = LED_OFF;
-
-	if (call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0) & RADIO_LED_ON)
-		brightness = LED_FULL;
-
-	return brightness;
-}
-
-static enum led_brightness eco_led_get(struct led_classdev *cdev)
-{
-	enum led_brightness brightness = LED_OFF;
-
-	if (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
-		brightness = LED_FULL;
-
-	return brightness;
-}
-
 /* Hardware access for LCD brightness control */
 
 static int set_lcd_level(int level)
@@ -754,6 +617,130 @@ static void fujitsu_laptop_platform_remove(void)
 	platform_device_unregister(fujitsu_laptop->pf_device);
 }
 
+static int logolamp_set(struct led_classdev *cdev,
+			enum led_brightness brightness)
+{
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
+}
+
+static enum led_brightness logolamp_get(struct led_classdev *cdev)
+{
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
+}
+
+static struct led_classdev logolamp_led = {
+	.name = "fujitsu::logolamp",
+	.brightness_set_blocking = logolamp_set,
+	.brightness_get = logolamp_get
+};
+
+static int kblamps_set(struct led_classdev *cdev,
+		       enum led_brightness brightness)
+{
+	if (brightness >= LED_FULL)
+		return call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
+				      FUNC_LED_ON);
+	else
+		return call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
+				      FUNC_LED_OFF);
+}
+
+static enum led_brightness kblamps_get(struct led_classdev *cdev)
+{
+	enum led_brightness brightness = LED_OFF;
+
+	if (call_fext_func(FUNC_LEDS, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
+		brightness = LED_FULL;
+
+	return brightness;
+}
+
+static struct led_classdev kblamps_led = {
+	.name = "fujitsu::kblamps",
+	.brightness_set_blocking = kblamps_set,
+	.brightness_get = kblamps_get
+};
+
+static int radio_led_set(struct led_classdev *cdev,
+			 enum led_brightness brightness)
+{
+	if (brightness >= LED_FULL)
+		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON,
+				      RADIO_LED_ON);
+	else
+		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON, 0x0);
+}
+
+static enum led_brightness radio_led_get(struct led_classdev *cdev)
+{
+	enum led_brightness brightness = LED_OFF;
+
+	if (call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0) & RADIO_LED_ON)
+		brightness = LED_FULL;
+
+	return brightness;
+}
+
+static struct led_classdev radio_led = {
+	.name = "fujitsu::radio_led",
+	.brightness_set_blocking = radio_led_set,
+	.brightness_get = radio_led_get,
+	.default_trigger = "rfkill-any"
+};
+
+static int eco_led_set(struct led_classdev *cdev,
+		       enum led_brightness brightness)
+{
+	int curr;
+
+	curr = call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0);
+	if (brightness >= LED_FULL)
+		return call_fext_func(FUNC_LEDS, 0x1, ECO_LED,
+				      curr | ECO_LED_ON);
+	else
+		return call_fext_func(FUNC_LEDS, 0x1, ECO_LED,
+				      curr & ~ECO_LED_ON);
+}
+
+static enum led_brightness eco_led_get(struct led_classdev *cdev)
+{
+	enum led_brightness brightness = LED_OFF;
+
+	if (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
+		brightness = LED_FULL;
+
+	return brightness;
+}
+
+static struct led_classdev eco_led = {
+	.name = "fujitsu::eco_led",
+	.brightness_set_blocking = eco_led_set,
+	.brightness_get = eco_led_get
+};
+
 static int acpi_fujitsu_laptop_leds_register(void)
 {
 	int result = 0;
-- 
2.12.2
