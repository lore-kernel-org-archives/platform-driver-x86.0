From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 01/10] platform/x86: fujitsu-laptop: introduce fext_*() helper functions
Date: Mon, 24 Apr 2017 15:33:25 +0200
Message-ID: <20170424133334.7064-2-kernel@kempniu.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170424133334.7064-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Stop invoking call_fext_func() directly to improve code clarity and save
some horizontal space.  Adjust whitespace to make checkpatch happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 90 ++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 7f49d92914c9..3f232967af04 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -187,6 +187,26 @@ static int call_fext_func(int func, int op, int feature, int state)
 	return value;
 }
 
+static int fext_backlight(int op, int feature, int state)
+{
+	return call_fext_func(FUNC_BACKLIGHT, op, feature, state);
+}
+
+static int fext_buttons(int op, int feature, int state)
+{
+	return call_fext_func(FUNC_BUTTONS, op, feature, state);
+}
+
+static int fext_flags(int op, int feature, int state)
+{
+	return call_fext_func(FUNC_FLAGS, op, feature, state);
+}
+
+static int fext_leds(int op, int feature, int state)
+{
+	return call_fext_func(FUNC_LEDS, op, feature, state);
+}
+
 /* Hardware access for LCD brightness control */
 
 static int set_lcd_level(int level)
@@ -272,9 +292,9 @@ static int bl_get_brightness(struct backlight_device *b)
 static int bl_update_status(struct backlight_device *b)
 {
 	if (b->props.power == FB_BLANK_POWERDOWN)
-		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
+		fext_backlight(0x1, 0x4, 0x3);
 	else
-		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
+		fext_backlight(0x1, 0x4, 0x0);
 
 	return set_lcd_level(b->props.brightness);
 }
@@ -610,22 +630,22 @@ static int logolamp_set(struct led_classdev *cdev,
 	if (brightness < LED_FULL)
 		always = FUNC_LED_OFF;
 
-	ret = call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, poweron);
+	ret = fext_leds(0x1, LOGOLAMP_POWERON, poweron);
 	if (ret < 0)
 		return ret;
 
-	return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, always);
+	return fext_leds(0x1, LOGOLAMP_ALWAYS, always);
 }
 
 static enum led_brightness logolamp_get(struct led_classdev *cdev)
 {
 	int ret;
 
-	ret = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_ALWAYS, 0x0);
+	ret = fext_leds(0x2, LOGOLAMP_ALWAYS, 0x0);
 	if (ret == FUNC_LED_ON)
 		return LED_FULL;
 
-	ret = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_POWERON, 0x0);
+	ret = fext_leds(0x2, LOGOLAMP_POWERON, 0x0);
 	if (ret == FUNC_LED_ON)
 		return LED_HALF;
 
@@ -642,18 +662,16 @@ static int kblamps_set(struct led_classdev *cdev,
 		       enum led_brightness brightness)
 {
 	if (brightness >= LED_FULL)
-		return call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
-				      FUNC_LED_ON);
+		return fext_leds(0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
 	else
-		return call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
-				      FUNC_LED_OFF);
+		return fext_leds(0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
 }
 
 static enum led_brightness kblamps_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
 
-	if (call_fext_func(FUNC_LEDS, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
+	if (fext_leds(0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
@@ -669,17 +687,16 @@ static int radio_led_set(struct led_classdev *cdev,
 			 enum led_brightness brightness)
 {
 	if (brightness >= LED_FULL)
-		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON,
-				      RADIO_LED_ON);
+		return fext_flags(0x5, RADIO_LED_ON, RADIO_LED_ON);
 	else
-		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON, 0x0);
+		return fext_flags(0x5, RADIO_LED_ON, 0x0);
 }
 
 static enum led_brightness radio_led_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
 
-	if (call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0) & RADIO_LED_ON)
+	if (fext_flags(0x4, 0x0, 0x0) & RADIO_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
@@ -697,20 +714,18 @@ static int eco_led_set(struct led_classdev *cdev,
 {
 	int curr;
 
-	curr = call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0);
+	curr = fext_leds(0x2, ECO_LED, 0x0);
 	if (brightness >= LED_FULL)
-		return call_fext_func(FUNC_LEDS, 0x1, ECO_LED,
-				      curr | ECO_LED_ON);
+		return fext_leds(0x1, ECO_LED, curr | ECO_LED_ON);
 	else
-		return call_fext_func(FUNC_LEDS, 0x1, ECO_LED,
-				      curr & ~ECO_LED_ON);
+		return fext_leds(0x1, ECO_LED, curr & ~ECO_LED_ON);
 }
 
 static enum led_brightness eco_led_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
 
-	if (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
+	if (fext_leds(0x2, ECO_LED, 0x0) & ECO_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
@@ -726,15 +741,15 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 {
 	int result;
 
-	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
+	if (fext_leds(0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
 		result = devm_led_classdev_register(&device->dev,
 						    &logolamp_led);
 		if (result)
 			return result;
 	}
 
-	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
-	    (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
+	if ((fext_leds(0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
+	    (fext_buttons(0x0, 0x0, 0x0) == 0x0)) {
 		result = devm_led_classdev_register(&device->dev, &kblamps_led);
 		if (result)
 			return result;
@@ -746,7 +761,7 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	 * to also have an RF LED.  Therefore use bit 24 as an indicator
 	 * that an RF LED is present.
 	 */
-	if (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
+	if (fext_buttons(0x0, 0x0, 0x0) & BIT(24)) {
 		result = devm_led_classdev_register(&device->dev, &radio_led);
 		if (result)
 			return result;
@@ -757,8 +772,8 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	 * bit 14 seems to indicate presence of said led as well.
 	 * Confirm by testing the status.
 	 */
-	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
-	    (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
+	if ((fext_leds(0x0, 0x0, 0x0) & BIT(14)) &&
+	    (fext_leds(0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
 		result = devm_led_classdev_register(&device->dev, &eco_led);
 		if (result)
 			return result;
@@ -816,13 +831,12 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	}
 
 	i = 0;
-	while (call_fext_func(FUNC_BUTTONS, 0x1, 0x0, 0x0) != 0
-		&& (i++) < MAX_HOTKEY_RINGBUFFER_SIZE)
+	while (fext_buttons(0x1, 0x0, 0x0) != 0 &&
+	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE)
 		; /* No action, result is discarded */
 	vdbg_printk(FUJLAPTOP_DBG_INFO, "Discarded %i ringbuffer entries\n", i);
 
-	fujitsu_laptop->flags_supported =
-		call_fext_func(FUNC_FLAGS, 0x0, 0x0, 0x0);
+	fujitsu_laptop->flags_supported = fext_flags(0x0, 0x0, 0x0);
 
 	/* Make sure our bitmask of supported functions is cleared if the
 	   RFKILL function block is not implemented, like on the S7020. */
@@ -830,16 +844,15 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 		fujitsu_laptop->flags_supported = 0;
 
 	if (fujitsu_laptop->flags_supported)
-		fujitsu_laptop->flags_state =
-			call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0);
+		fujitsu_laptop->flags_state = fext_flags(0x4, 0x0, 0x0);
 
 	/* Suspect this is a keymap of the application panel, print it */
-	pr_info("BTNI: [0x%x]\n", call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0));
+	pr_info("BTNI: [0x%x]\n", fext_buttons(0x0, 0x0, 0x0));
 
 	/* Sync backlight power status */
 	if (fujitsu_bl->bl_device &&
 	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		if (call_fext_func(FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
+		if (fext_backlight(0x2, 0x4, 0x0) == 3)
 			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
 		else
 			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
@@ -924,10 +937,9 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 	}
 
 	if (fujitsu_laptop->flags_supported)
-		fujitsu_laptop->flags_state =
-			call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0);
+		fujitsu_laptop->flags_state = fext_flags(0x4, 0x0, 0x0);
 
-	while ((irb = call_fext_func(FUNC_BUTTONS, 0x1, 0x0, 0x0)) != 0 &&
+	while ((irb = fext_buttons(0x1, 0x0, 0x0)) != 0 &&
 	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE) {
 		scancode = irb & 0x4ff;
 		if (sparse_keymap_entry_from_scancode(input, scancode))
@@ -944,7 +956,7 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 	 * handled in software; its state is queried using FUNC_FLAGS
 	 */
 	if ((fujitsu_laptop->flags_supported & BIT(26)) &&
-	    (call_fext_func(FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26)))
+	    (fext_flags(0x1, 0x0, 0x0) & BIT(26)))
 		sparse_keymap_report_event(input, BIT(26), 1, true);
 }
 
-- 
2.12.2
