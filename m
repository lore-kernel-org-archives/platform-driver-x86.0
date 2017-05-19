From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 7/8] platform/x86: fujitsu-laptop: use device-specific data in LED-related code
Date: Fri, 19 May 2017 09:44:47 +0200
Message-ID: <20170519074448.12716-8-kernel@kempniu.pl>
References: <20170519074448.12716-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34235 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751852AbdESHpM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 May 2017 03:45:12 -0400
Received: by mail-wm0-f65.google.com with SMTP id d127so16390433wmf.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 May 2017 00:45:07 -0700 (PDT)
In-Reply-To: <20170519074448.12716-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

In order to perform their duties, all LED callbacks need a pointer to
the struct acpi_device representing the FUJ02E3 ACPI device.  To limit
the use of the module-wide pointer, the same pointer should be extracted
from data that gets passed to LED callbacks as arguments.  However, LED
core does not currently support supplying driver-specific pointers to
struct led_classdev callbacks, so the latter have to be implemented a
bit differently than backlight device callbacks and platform device
attribute callbacks.  As the FUJ02E3 ACPI device is the parent device of
all LED class devices registered by fujitsu-laptop, struct acpi_device
representing the former can be extracted by following the parent link
present inside the struct device belonging to the struct led_classdev
passed as an argument to each LED callback.

To get rid of module-wide structures defining LED class devices,
allocate them dynamically using devm_kzalloc() and initialize them in
acpi_fujitsu_laptop_leds_register().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 102 +++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 50 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index b78c97ebfee4..3d33be9f88f6 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -608,6 +608,7 @@ static void fujitsu_laptop_platform_remove(void)
 static int logolamp_set(struct led_classdev *cdev,
 			enum led_brightness brightness)
 {
+	struct acpi_device *device = to_acpi_device(cdev->dev->parent);
 	int poweron = FUNC_LED_ON, always = FUNC_LED_ON;
 	int ret;
 
@@ -617,136 +618,128 @@ static int logolamp_set(struct led_classdev *cdev,
 	if (brightness < LED_FULL)
 		always = FUNC_LED_OFF;
 
-	ret = call_fext_func(fext, FUNC_LEDS, 0x1, LOGOLAMP_POWERON, poweron);
+	ret = call_fext_func(device, FUNC_LEDS, 0x1, LOGOLAMP_POWERON, poweron);
 	if (ret < 0)
 		return ret;
 
-	return call_fext_func(fext, FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, always);
+	return call_fext_func(device, FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, always);
 }
 
 static enum led_brightness logolamp_get(struct led_classdev *cdev)
 {
+	struct acpi_device *device = to_acpi_device(cdev->dev->parent);
 	int ret;
 
-	ret = call_fext_func(fext, FUNC_LEDS, 0x2, LOGOLAMP_ALWAYS, 0x0);
+	ret = call_fext_func(device, FUNC_LEDS, 0x2, LOGOLAMP_ALWAYS, 0x0);
 	if (ret == FUNC_LED_ON)
 		return LED_FULL;
 
-	ret = call_fext_func(fext, FUNC_LEDS, 0x2, LOGOLAMP_POWERON, 0x0);
+	ret = call_fext_func(device, FUNC_LEDS, 0x2, LOGOLAMP_POWERON, 0x0);
 	if (ret == FUNC_LED_ON)
 		return LED_HALF;
 
 	return LED_OFF;
 }
 
-static struct led_classdev logolamp_led = {
-	.name = "fujitsu::logolamp",
-	.brightness_set_blocking = logolamp_set,
-	.brightness_get = logolamp_get
-};
-
 static int kblamps_set(struct led_classdev *cdev,
 		       enum led_brightness brightness)
 {
+	struct acpi_device *device = to_acpi_device(cdev->dev->parent);
+
 	if (brightness >= LED_FULL)
-		return call_fext_func(fext, FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
+		return call_fext_func(device, FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
 				      FUNC_LED_ON);
 	else
-		return call_fext_func(fext, FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
+		return call_fext_func(device, FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
 				      FUNC_LED_OFF);
 }
 
 static enum led_brightness kblamps_get(struct led_classdev *cdev)
 {
+	struct acpi_device *device = to_acpi_device(cdev->dev->parent);
 	enum led_brightness brightness = LED_OFF;
 
-	if (call_fext_func(fext,
+	if (call_fext_func(device,
 			   FUNC_LEDS, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
 }
 
-static struct led_classdev kblamps_led = {
-	.name = "fujitsu::kblamps",
-	.brightness_set_blocking = kblamps_set,
-	.brightness_get = kblamps_get
-};
-
 static int radio_led_set(struct led_classdev *cdev,
 			 enum led_brightness brightness)
 {
+	struct acpi_device *device = to_acpi_device(cdev->dev->parent);
+
 	if (brightness >= LED_FULL)
-		return call_fext_func(fext, FUNC_FLAGS, 0x5, RADIO_LED_ON,
+		return call_fext_func(device, FUNC_FLAGS, 0x5, RADIO_LED_ON,
 				      RADIO_LED_ON);
 	else
-		return call_fext_func(fext, FUNC_FLAGS, 0x5, RADIO_LED_ON,
+		return call_fext_func(device, FUNC_FLAGS, 0x5, RADIO_LED_ON,
 				      0x0);
 }
 
 static enum led_brightness radio_led_get(struct led_classdev *cdev)
 {
+	struct acpi_device *device = to_acpi_device(cdev->dev->parent);
 	enum led_brightness brightness = LED_OFF;
 
-	if (call_fext_func(fext, FUNC_FLAGS, 0x4, 0x0, 0x0) & RADIO_LED_ON)
+	if (call_fext_func(device, FUNC_FLAGS, 0x4, 0x0, 0x0) & RADIO_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
 }
 
-static struct led_classdev radio_led = {
-	.name = "fujitsu::radio_led",
-	.brightness_set_blocking = radio_led_set,
-	.brightness_get = radio_led_get,
-	.default_trigger = "rfkill-any"
-};
-
 static int eco_led_set(struct led_classdev *cdev,
 		       enum led_brightness brightness)
 {
+	struct acpi_device *device = to_acpi_device(cdev->dev->parent);
 	int curr;
 
-	curr = call_fext_func(fext, FUNC_LEDS, 0x2, ECO_LED, 0x0);
+	curr = call_fext_func(device, FUNC_LEDS, 0x2, ECO_LED, 0x0);
 	if (brightness >= LED_FULL)
-		return call_fext_func(fext, FUNC_LEDS, 0x1, ECO_LED,
+		return call_fext_func(device, FUNC_LEDS, 0x1, ECO_LED,
 				      curr | ECO_LED_ON);
 	else
-		return call_fext_func(fext, FUNC_LEDS, 0x1, ECO_LED,
+		return call_fext_func(device, FUNC_LEDS, 0x1, ECO_LED,
 				      curr & ~ECO_LED_ON);
 }
 
 static enum led_brightness eco_led_get(struct led_classdev *cdev)
 {
+	struct acpi_device *device = to_acpi_device(cdev->dev->parent);
 	enum led_brightness brightness = LED_OFF;
 
-	if (call_fext_func(fext, FUNC_LEDS, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
+	if (call_fext_func(device, FUNC_LEDS, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
 }
 
-static struct led_classdev eco_led = {
-	.name = "fujitsu::eco_led",
-	.brightness_set_blocking = eco_led_set,
-	.brightness_get = eco_led_get
-};
-
 static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 {
+	struct led_classdev *led;
 	int result;
 
-	if (call_fext_func(fext,
+	if (call_fext_func(device,
 			   FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
-		result = devm_led_classdev_register(&device->dev,
-						    &logolamp_led);
+		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		led->name = "fujitsu::logolamp";
+		led->brightness_set_blocking = logolamp_set;
+		led->brightness_get = logolamp_get;
+		result = devm_led_classdev_register(&device->dev, led);
 		if (result)
 			return result;
 	}
 
-	if ((call_fext_func(fext,
+	if ((call_fext_func(device,
 			    FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
-	    (call_fext_func(fext, FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
-		result = devm_led_classdev_register(&device->dev, &kblamps_led);
+	    (call_fext_func(device, FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
+		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		led->name = "fujitsu::kblamps";
+		led->brightness_set_blocking = kblamps_set;
+		led->brightness_get = kblamps_get;
+		result = devm_led_classdev_register(&device->dev, led);
 		if (result)
 			return result;
 	}
@@ -757,8 +750,13 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	 * to also have an RF LED.  Therefore use bit 24 as an indicator
 	 * that an RF LED is present.
 	 */
-	if (call_fext_func(fext, FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
-		result = devm_led_classdev_register(&device->dev, &radio_led);
+	if (call_fext_func(device, FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
+		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		led->name = "fujitsu::radio_led";
+		led->brightness_set_blocking = radio_led_set;
+		led->brightness_get = radio_led_get;
+		led->default_trigger = "rfkill-any";
+		result = devm_led_classdev_register(&device->dev, led);
 		if (result)
 			return result;
 	}
@@ -768,10 +766,14 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	 * bit 14 seems to indicate presence of said led as well.
 	 * Confirm by testing the status.
 	 */
-	if ((call_fext_func(fext, FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
-	    (call_fext_func(fext,
+	if ((call_fext_func(device, FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
+	    (call_fext_func(device,
 			    FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
-		result = devm_led_classdev_register(&device->dev, &eco_led);
+		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		led->name = "fujitsu::eco_led";
+		led->brightness_set_blocking = eco_led_set;
+		led->brightness_get = eco_led_get;
+		result = devm_led_classdev_register(&device->dev, led);
 		if (result)
 			return result;
 	}
-- 
2.13.0
