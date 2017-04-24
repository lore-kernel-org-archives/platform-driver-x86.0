From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 03/10] platform/x86: fujitsu-laptop: explicitly pass ACPI handle to call_fext_func()
Date: Mon, 24 Apr 2017 15:33:27 +0200
Message-ID: <20170424133334.7064-4-kernel@kempniu.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34609 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1171242AbdDXNdn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 09:33:43 -0400
Received: by mail-lf0-f65.google.com with SMTP id x72so16553940lfb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Apr 2017 06:33:42 -0700 (PDT)
In-Reply-To: <20170424133334.7064-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Prepare for not using module-wide data in call_fext_func() by explicitly
passing it an ACPI handle to the FUJ02E3 device while still using the
module-wide handle in each call to fext_*() helper functions.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 97 ++++++++++++++++++++---------------
 1 file changed, 56 insertions(+), 41 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 3695e8075aa6..ea3210ee83ec 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -163,7 +163,8 @@ static u32 dbg_level = 0x03;
 
 /* Fujitsu ACPI interface function */
 
-static int call_fext_func(int func, int op, int feature, int state)
+static int call_fext_func(acpi_handle handle,
+			  int func, int op, int feature, int state)
 {
 	union acpi_object params[4] = {
 		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = func },
@@ -175,8 +176,7 @@ static int call_fext_func(int func, int op, int feature, int state)
 	unsigned long long value;
 	acpi_status status;
 
-	status = acpi_evaluate_integer(fujitsu_laptop->handle, "FUNC",
-				       &arg_list, &value);
+	status = acpi_evaluate_integer(handle, "FUNC", &arg_list, &value);
 	if (ACPI_FAILURE(status)) {
 		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Failed to evaluate FUNC\n");
 		return -ENODEV;
@@ -187,24 +187,24 @@ static int call_fext_func(int func, int op, int feature, int state)
 	return value;
 }
 
-static int fext_backlight(int op, int feature, int state)
+static int fext_backlight(acpi_handle handle, int op, int feature, int state)
 {
-	return call_fext_func(FUNC_BACKLIGHT, op, feature, state);
+	return call_fext_func(handle, FUNC_BACKLIGHT, op, feature, state);
 }
 
-static int fext_buttons(int op, int feature, int state)
+static int fext_buttons(acpi_handle handle, int op, int feature, int state)
 {
-	return call_fext_func(FUNC_BUTTONS, op, feature, state);
+	return call_fext_func(handle, FUNC_BUTTONS, op, feature, state);
 }
 
-static int fext_flags(int op, int feature, int state)
+static int fext_flags(acpi_handle handle, int op, int feature, int state)
 {
-	return call_fext_func(FUNC_FLAGS, op, feature, state);
+	return call_fext_func(handle, FUNC_FLAGS, op, feature, state);
 }
 
-static int fext_leds(int op, int feature, int state)
+static int fext_leds(acpi_handle handle, int op, int feature, int state)
 {
-	return call_fext_func(FUNC_LEDS, op, feature, state);
+	return call_fext_func(handle, FUNC_LEDS, op, feature, state);
 }
 
 /* Hardware access for LCD brightness control */
@@ -291,9 +291,9 @@ static int bl_get_brightness(struct backlight_device *b)
 static int bl_update_status(struct backlight_device *b)
 {
 	if (b->props.power == FB_BLANK_POWERDOWN)
-		fext_backlight(0x1, 0x4, 0x3);
+		fext_backlight(fujitsu_laptop->handle, 0x1, 0x4, 0x3);
 	else
-		fext_backlight(0x1, 0x4, 0x0);
+		fext_backlight(fujitsu_laptop->handle, 0x1, 0x4, 0x0);
 
 	return set_lcd_level(b->props.brightness);
 }
@@ -629,22 +629,22 @@ static int logolamp_set(struct led_classdev *cdev,
 	if (brightness < LED_FULL)
 		always = FUNC_LED_OFF;
 
-	ret = fext_leds(0x1, LOGOLAMP_POWERON, poweron);
+	ret = fext_leds(fujitsu_laptop->handle, 0x1, LOGOLAMP_POWERON, poweron);
 	if (ret < 0)
 		return ret;
 
-	return fext_leds(0x1, LOGOLAMP_ALWAYS, always);
+	return fext_leds(fujitsu_laptop->handle, 0x1, LOGOLAMP_ALWAYS, always);
 }
 
 static enum led_brightness logolamp_get(struct led_classdev *cdev)
 {
 	int ret;
 
-	ret = fext_leds(0x2, LOGOLAMP_ALWAYS, 0x0);
+	ret = fext_leds(fujitsu_laptop->handle, 0x2, LOGOLAMP_ALWAYS, 0x0);
 	if (ret == FUNC_LED_ON)
 		return LED_FULL;
 
-	ret = fext_leds(0x2, LOGOLAMP_POWERON, 0x0);
+	ret = fext_leds(fujitsu_laptop->handle, 0x2, LOGOLAMP_POWERON, 0x0);
 	if (ret == FUNC_LED_ON)
 		return LED_HALF;
 
@@ -661,16 +661,19 @@ static int kblamps_set(struct led_classdev *cdev,
 		       enum led_brightness brightness)
 {
 	if (brightness >= LED_FULL)
-		return fext_leds(0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
+		return fext_leds(fujitsu_laptop->handle, 0x1, KEYBOARD_LAMPS,
+				 FUNC_LED_ON);
 	else
-		return fext_leds(0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
+		return fext_leds(fujitsu_laptop->handle, 0x1, KEYBOARD_LAMPS,
+				 FUNC_LED_OFF);
 }
 
 static enum led_brightness kblamps_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
 
-	if (fext_leds(0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
+	if (fext_leds(fujitsu_laptop->handle,
+		      0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
@@ -686,16 +689,18 @@ static int radio_led_set(struct led_classdev *cdev,
 			 enum led_brightness brightness)
 {
 	if (brightness >= LED_FULL)
-		return fext_flags(0x5, RADIO_LED_ON, RADIO_LED_ON);
+		return fext_flags(fujitsu_laptop->handle, 0x5, RADIO_LED_ON,
+				  RADIO_LED_ON);
 	else
-		return fext_flags(0x5, RADIO_LED_ON, 0x0);
+		return fext_flags(fujitsu_laptop->handle, 0x5, RADIO_LED_ON,
+				  0x0);
 }
 
 static enum led_brightness radio_led_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
 
-	if (fext_flags(0x4, 0x0, 0x0) & RADIO_LED_ON)
+	if (fext_flags(fujitsu_laptop->handle, 0x4, 0x0, 0x0) & RADIO_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
@@ -713,18 +718,20 @@ static int eco_led_set(struct led_classdev *cdev,
 {
 	int curr;
 
-	curr = fext_leds(0x2, ECO_LED, 0x0);
+	curr = fext_leds(fujitsu_laptop->handle, 0x2, ECO_LED, 0x0);
 	if (brightness >= LED_FULL)
-		return fext_leds(0x1, ECO_LED, curr | ECO_LED_ON);
+		return fext_leds(fujitsu_laptop->handle, 0x1, ECO_LED,
+				 curr | ECO_LED_ON);
 	else
-		return fext_leds(0x1, ECO_LED, curr & ~ECO_LED_ON);
+		return fext_leds(fujitsu_laptop->handle, 0x1, ECO_LED,
+				 curr & ~ECO_LED_ON);
 }
 
 static enum led_brightness eco_led_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
 
-	if (fext_leds(0x2, ECO_LED, 0x0) & ECO_LED_ON)
+	if (fext_leds(fujitsu_laptop->handle, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
@@ -740,15 +747,17 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 {
 	int result;
 
-	if (fext_leds(0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
+	if (fext_leds(fujitsu_laptop->handle,
+		      0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
 		result = devm_led_classdev_register(&device->dev,
 						    &logolamp_led);
 		if (result)
 			return result;
 	}
 
-	if ((fext_leds(0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
-	    (fext_buttons(0x0, 0x0, 0x0) == 0x0)) {
+	if ((fext_leds(fujitsu_laptop->handle,
+		       0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
+	    (fext_buttons(fujitsu_laptop->handle, 0x0, 0x0, 0x0) == 0x0)) {
 		result = devm_led_classdev_register(&device->dev, &kblamps_led);
 		if (result)
 			return result;
@@ -760,7 +769,7 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	 * to also have an RF LED.  Therefore use bit 24 as an indicator
 	 * that an RF LED is present.
 	 */
-	if (fext_buttons(0x0, 0x0, 0x0) & BIT(24)) {
+	if (fext_buttons(fujitsu_laptop->handle, 0x0, 0x0, 0x0) & BIT(24)) {
 		result = devm_led_classdev_register(&device->dev, &radio_led);
 		if (result)
 			return result;
@@ -771,8 +780,9 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	 * bit 14 seems to indicate presence of said led as well.
 	 * Confirm by testing the status.
 	 */
-	if ((fext_leds(0x0, 0x0, 0x0) & BIT(14)) &&
-	    (fext_leds(0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
+	if ((fext_leds(fujitsu_laptop->handle, 0x0, 0x0, 0x0) & BIT(14)) &&
+	    (fext_leds(fujitsu_laptop->handle,
+		       0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
 		result = devm_led_classdev_register(&device->dev, &eco_led);
 		if (result)
 			return result;
@@ -830,12 +840,13 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	}
 
 	i = 0;
-	while (fext_buttons(0x1, 0x0, 0x0) != 0 &&
+	while (fext_buttons(fujitsu_laptop->handle, 0x1, 0x0, 0x0) != 0 &&
 	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE)
 		; /* No action, result is discarded */
 	vdbg_printk(FUJLAPTOP_DBG_INFO, "Discarded %i ringbuffer entries\n", i);
 
-	fujitsu_laptop->flags_supported = fext_flags(0x0, 0x0, 0x0);
+	fujitsu_laptop->flags_supported = fext_flags(fujitsu_laptop->handle,
+						     0x0, 0x0, 0x0);
 
 	/* Make sure our bitmask of supported functions is cleared if the
 	   RFKILL function block is not implemented, like on the S7020. */
@@ -843,15 +854,17 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 		fujitsu_laptop->flags_supported = 0;
 
 	if (fujitsu_laptop->flags_supported)
-		fujitsu_laptop->flags_state = fext_flags(0x4, 0x0, 0x0);
+		fujitsu_laptop->flags_state = fext_flags(fujitsu_laptop->handle,
+							 0x4, 0x0, 0x0);
 
 	/* Suspect this is a keymap of the application panel, print it */
-	pr_info("BTNI: [0x%x]\n", fext_buttons(0x0, 0x0, 0x0));
+	pr_info("BTNI: [0x%x]\n", fext_buttons(fujitsu_laptop->handle,
+					       0x0, 0x0, 0x0));
 
 	/* Sync backlight power status */
 	if (fujitsu_bl->bl_device &&
 	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		if (fext_backlight(0x2, 0x4, 0x0) == 3)
+		if (fext_backlight(fujitsu_laptop->handle, 0x2, 0x4, 0x0) == 3)
 			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
 		else
 			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
@@ -936,9 +949,11 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 	}
 
 	if (fujitsu_laptop->flags_supported)
-		fujitsu_laptop->flags_state = fext_flags(0x4, 0x0, 0x0);
+		fujitsu_laptop->flags_state = fext_flags(fujitsu_laptop->handle,
+							 0x4, 0x0, 0x0);
 
-	while ((irb = fext_buttons(0x1, 0x0, 0x0)) != 0 &&
+	while ((irb = fext_buttons(fujitsu_laptop->handle,
+				   0x1, 0x0, 0x0)) != 0 &&
 	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE) {
 		scancode = irb & 0x4ff;
 		if (sparse_keymap_entry_from_scancode(input, scancode))
@@ -955,7 +970,7 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 	 * handled in software; its state is queried using FUNC_FLAGS
 	 */
 	if ((fujitsu_laptop->flags_supported & BIT(26)) &&
-	    (fext_flags(0x1, 0x0, 0x0) & BIT(26)))
+	    (fext_flags(fujitsu_laptop->handle, 0x1, 0x0, 0x0) & BIT(26)))
 		sparse_keymap_report_event(input, BIT(26), 1, true);
 }
 
-- 
2.12.2
