From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 09/10] platform/x86: fujitsu-laptop: use device-specific data in LED-related code
Date: Mon, 24 Apr 2017 15:33:33 +0200
Message-ID: <20170424133334.7064-10-kernel@kempniu.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34658 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1171329AbdDXNds (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 09:33:48 -0400
Received: by mail-lf0-f68.google.com with SMTP id x72so16554190lfb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Apr 2017 06:33:46 -0700 (PDT)
In-Reply-To: <20170424133334.7064-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

In order to perform their duties, all LED callbacks need a handle to the
FUJ02E3 ACPI device.  If that handle is to be fetched without accessing
module-wide data, it needs to be extracted from data that gets passed to
the LED callbacks as arguments.  However, LED core does not currently
support supplying driver-specific pointers to struct led_classdev
callbacks, so the latter will have to be implemented a bit differently
than backlight device callbacks and platform device attribute callbacks.

As the FUJ02E3 ACPI device is the parent device of all LED class devices
registered by fujitsu-laptop, we can get to the struct acpi_device
representing the former by following the parent link present inside the
struct device belonging to the struct led_classdev passed as an argument
to each LED callback.  Note that acpi_driver_data() is not used to
retrieve the ACPI handle.  Doing that would break cleanup upon module
removal, because the managed LED class device release callback,
devm_led_classdev_release(), would be called after the bus-level device
removal callback, acpi_device_remove(), which sets the driver_data
member of struct acpi_device to NULL and as devm_led_classdev_release()
calls led_classdev_unregister(), which in turn resets the LED's
brightness to LED_OFF, LED callbacks would not be able to retrieve the
ACPI handle needed to perform that operation.  To work around this, the
handle is retrieved directly from struct acpi_device as the latter is
guaranteed to be available upon brightness reset because parent device's
reference count is only decremented once brightness gets reset.

To get rid of module-wide structures defining LED class devices,
allocate them dynamically using devm_kzalloc() and initialize them in
acpi_fujitsu_laptop_leds_register().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 113 ++++++++++++++++------------------
 1 file changed, 53 insertions(+), 60 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index f26abc41266e..77082e35f26a 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -635,6 +635,7 @@ static void fujitsu_laptop_platform_remove(void)
 static int logolamp_set(struct led_classdev *cdev,
 			enum led_brightness brightness)
 {
+	acpi_handle handle = to_acpi_device(cdev->dev->parent)->handle;
 	int poweron = FUNC_LED_ON, always = FUNC_LED_ON;
 	int ret;
 
@@ -644,136 +645,120 @@ static int logolamp_set(struct led_classdev *cdev,
 	if (brightness < LED_FULL)
 		always = FUNC_LED_OFF;
 
-	ret = fext_leds(fujitsu_laptop->handle, 0x1, LOGOLAMP_POWERON, poweron);
+	ret = fext_leds(handle, 0x1, LOGOLAMP_POWERON, poweron);
 	if (ret < 0)
 		return ret;
 
-	return fext_leds(fujitsu_laptop->handle, 0x1, LOGOLAMP_ALWAYS, always);
+	return fext_leds(handle, 0x1, LOGOLAMP_ALWAYS, always);
 }
 
 static enum led_brightness logolamp_get(struct led_classdev *cdev)
 {
+	acpi_handle handle = to_acpi_device(cdev->dev->parent)->handle;
 	int ret;
 
-	ret = fext_leds(fujitsu_laptop->handle, 0x2, LOGOLAMP_ALWAYS, 0x0);
+	ret = fext_leds(handle, 0x2, LOGOLAMP_ALWAYS, 0x0);
 	if (ret == FUNC_LED_ON)
 		return LED_FULL;
 
-	ret = fext_leds(fujitsu_laptop->handle, 0x2, LOGOLAMP_POWERON, 0x0);
+	ret = fext_leds(handle, 0x2, LOGOLAMP_POWERON, 0x0);
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
+	acpi_handle handle = to_acpi_device(cdev->dev->parent)->handle;
+
 	if (brightness >= LED_FULL)
-		return fext_leds(fujitsu_laptop->handle, 0x1, KEYBOARD_LAMPS,
-				 FUNC_LED_ON);
+		return fext_leds(handle, 0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
 	else
-		return fext_leds(fujitsu_laptop->handle, 0x1, KEYBOARD_LAMPS,
-				 FUNC_LED_OFF);
+		return fext_leds(handle, 0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
 }
 
 static enum led_brightness kblamps_get(struct led_classdev *cdev)
 {
+	acpi_handle handle = to_acpi_device(cdev->dev->parent)->handle;
 	enum led_brightness brightness = LED_OFF;
 
-	if (fext_leds(fujitsu_laptop->handle,
-		      0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
+	if (fext_leds(handle, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
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
+	acpi_handle handle = to_acpi_device(cdev->dev->parent)->handle;
+
 	if (brightness >= LED_FULL)
-		return fext_flags(fujitsu_laptop->handle, 0x5, RADIO_LED_ON,
-				  RADIO_LED_ON);
+		return fext_flags(handle, 0x5, RADIO_LED_ON, RADIO_LED_ON);
 	else
-		return fext_flags(fujitsu_laptop->handle, 0x5, RADIO_LED_ON,
-				  0x0);
+		return fext_flags(handle, 0x5, RADIO_LED_ON, 0x0);
 }
 
 static enum led_brightness radio_led_get(struct led_classdev *cdev)
 {
+	acpi_handle handle = to_acpi_device(cdev->dev->parent)->handle;
 	enum led_brightness brightness = LED_OFF;
 
-	if (fext_flags(fujitsu_laptop->handle, 0x4, 0x0, 0x0) & RADIO_LED_ON)
+	if (fext_flags(handle, 0x4, 0x0, 0x0) & RADIO_LED_ON)
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
+	acpi_handle handle = to_acpi_device(cdev->dev->parent)->handle;
 	int curr;
 
-	curr = fext_leds(fujitsu_laptop->handle, 0x2, ECO_LED, 0x0);
+	curr = fext_leds(handle, 0x2, ECO_LED, 0x0);
 	if (brightness >= LED_FULL)
-		return fext_leds(fujitsu_laptop->handle, 0x1, ECO_LED,
-				 curr | ECO_LED_ON);
+		return fext_leds(handle, 0x1, ECO_LED, curr | ECO_LED_ON);
 	else
-		return fext_leds(fujitsu_laptop->handle, 0x1, ECO_LED,
-				 curr & ~ECO_LED_ON);
+		return fext_leds(handle, 0x1, ECO_LED, curr & ~ECO_LED_ON);
 }
 
 static enum led_brightness eco_led_get(struct led_classdev *cdev)
 {
+	acpi_handle handle = to_acpi_device(cdev->dev->parent)->handle;
 	enum led_brightness brightness = LED_OFF;
 
-	if (fext_leds(fujitsu_laptop->handle, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
+	if (fext_leds(handle, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
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
+	struct fujitsu_laptop *priv = acpi_driver_data(device);
+	struct led_classdev *led;
 	int result;
 
-	if (fext_leds(fujitsu_laptop->handle,
-		      0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
-		result = devm_led_classdev_register(&device->dev,
-						    &logolamp_led);
+	if (fext_leds(priv->handle, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
+		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		led->name = "fujitsu::logolamp";
+		led->brightness_set_blocking = logolamp_set;
+		led->brightness_get = logolamp_get;
+		result = devm_led_classdev_register(&device->dev, led);
 		if (result)
 			return result;
 	}
 
-	if ((fext_leds(fujitsu_laptop->handle,
-		       0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
-	    (fext_buttons(fujitsu_laptop->handle, 0x0, 0x0, 0x0) == 0x0)) {
-		result = devm_led_classdev_register(&device->dev, &kblamps_led);
+	if ((fext_leds(priv->handle, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
+	    (fext_buttons(priv->handle, 0x0, 0x0, 0x0) == 0x0)) {
+		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		led->name = "fujitsu::kblamps";
+		led->brightness_set_blocking = kblamps_set;
+		led->brightness_get = kblamps_get;
+		result = devm_led_classdev_register(&device->dev, led);
 		if (result)
 			return result;
 	}
@@ -784,8 +769,13 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	 * to also have an RF LED.  Therefore use bit 24 as an indicator
 	 * that an RF LED is present.
 	 */
-	if (fext_buttons(fujitsu_laptop->handle, 0x0, 0x0, 0x0) & BIT(24)) {
-		result = devm_led_classdev_register(&device->dev, &radio_led);
+	if (fext_buttons(priv->handle, 0x0, 0x0, 0x0) & BIT(24)) {
+		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		led->name = "fujitsu::radio_led";
+		led->brightness_set_blocking = radio_led_set;
+		led->brightness_get = radio_led_get;
+		led->default_trigger = "rfkill-any";
+		result = devm_led_classdev_register(&device->dev, led);
 		if (result)
 			return result;
 	}
@@ -795,10 +785,13 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	 * bit 14 seems to indicate presence of said led as well.
 	 * Confirm by testing the status.
 	 */
-	if ((fext_leds(fujitsu_laptop->handle, 0x0, 0x0, 0x0) & BIT(14)) &&
-	    (fext_leds(fujitsu_laptop->handle,
-		       0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
-		result = devm_led_classdev_register(&device->dev, &eco_led);
+	if ((fext_leds(priv->handle, 0x0, 0x0, 0x0) & BIT(14)) &&
+	    (fext_leds(priv->handle, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
+		led = devm_kzalloc(&device->dev, sizeof(*led), GFP_KERNEL);
+		led->name = "fujitsu::eco_led";
+		led->brightness_set_blocking = eco_led_set;
+		led->brightness_get = eco_led_get;
+		result = devm_led_classdev_register(&device->dev, led);
 		if (result)
 			return result;
 	}
-- 
2.12.2
