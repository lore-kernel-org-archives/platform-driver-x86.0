From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 6/8] platform/x86: fujitsu-laptop: explicitly pass ACPI device to call_fext_func()
Date: Fri, 19 May 2017 09:44:46 +0200
Message-ID: <20170519074448.12716-7-kernel@kempniu.pl>
References: <20170519074448.12716-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170519074448.12716-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Prepare for not using module-wide data in call_fext_func() by explicitly
passing it a pointer to struct acpi_device while still using a
module-wide pointer in each call.

Doing this enables call_fext_func() to fetch the ACPI handle from its
argument, making the acpi_handle field of struct fujitsu_laptop useless,
so remove that field.  While we are at it, the dev field of the same
structure is assigned in acpi_fujitsu_laptop_add() but not used for
anything, so remove it as well.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 81 ++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 21bd60afea75..b78c97ebfee4 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -143,8 +143,6 @@ static bool disable_brightness_adjust;
 
 /* Device used to access hotkeys and other features on the laptop */
 struct fujitsu_laptop {
-	acpi_handle acpi_handle;
-	struct acpi_device *dev;
 	struct input_dev *input;
 	char phys[32];
 	struct platform_device *pf_device;
@@ -163,7 +161,8 @@ static u32 dbg_level = 0x03;
 
 /* Fujitsu ACPI interface function */
 
-static int call_fext_func(int func, int op, int feature, int state)
+static int call_fext_func(struct acpi_device *device,
+			  int func, int op, int feature, int state)
 {
 	union acpi_object params[4] = {
 		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = func },
@@ -175,8 +174,8 @@ static int call_fext_func(int func, int op, int feature, int state)
 	unsigned long long value;
 	acpi_status status;
 
-	status = acpi_evaluate_integer(fujitsu_laptop->acpi_handle, "FUNC",
-				       &arg_list, &value);
+	status = acpi_evaluate_integer(device->handle, "FUNC", &arg_list,
+				       &value);
 	if (ACPI_FAILURE(status)) {
 		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Failed to evaluate FUNC\n");
 		return -ENODEV;
@@ -276,9 +275,9 @@ static int bl_update_status(struct backlight_device *b)
 	struct acpi_device *device = bl_get_data(b);
 
 	if (b->props.power == FB_BLANK_POWERDOWN)
-		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
+		call_fext_func(fext, FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
 	else
-		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
+		call_fext_func(fext, FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
 
 	return set_lcd_level(device, b->props.brightness);
 }
@@ -618,22 +617,22 @@ static int logolamp_set(struct led_classdev *cdev,
 	if (brightness < LED_FULL)
 		always = FUNC_LED_OFF;
 
-	ret = call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_POWERON, poweron);
+	ret = call_fext_func(fext, FUNC_LEDS, 0x1, LOGOLAMP_POWERON, poweron);
 	if (ret < 0)
 		return ret;
 
-	return call_fext_func(FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, always);
+	return call_fext_func(fext, FUNC_LEDS, 0x1, LOGOLAMP_ALWAYS, always);
 }
 
 static enum led_brightness logolamp_get(struct led_classdev *cdev)
 {
 	int ret;
 
-	ret = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_ALWAYS, 0x0);
+	ret = call_fext_func(fext, FUNC_LEDS, 0x2, LOGOLAMP_ALWAYS, 0x0);
 	if (ret == FUNC_LED_ON)
 		return LED_FULL;
 
-	ret = call_fext_func(FUNC_LEDS, 0x2, LOGOLAMP_POWERON, 0x0);
+	ret = call_fext_func(fext, FUNC_LEDS, 0x2, LOGOLAMP_POWERON, 0x0);
 	if (ret == FUNC_LED_ON)
 		return LED_HALF;
 
@@ -650,10 +649,10 @@ static int kblamps_set(struct led_classdev *cdev,
 		       enum led_brightness brightness)
 {
 	if (brightness >= LED_FULL)
-		return call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
+		return call_fext_func(fext, FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
 				      FUNC_LED_ON);
 	else
-		return call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
+		return call_fext_func(fext, FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
 				      FUNC_LED_OFF);
 }
 
@@ -661,7 +660,8 @@ static enum led_brightness kblamps_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
 
-	if (call_fext_func(FUNC_LEDS, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
+	if (call_fext_func(fext,
+			   FUNC_LEDS, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
@@ -677,17 +677,18 @@ static int radio_led_set(struct led_classdev *cdev,
 			 enum led_brightness brightness)
 {
 	if (brightness >= LED_FULL)
-		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON,
+		return call_fext_func(fext, FUNC_FLAGS, 0x5, RADIO_LED_ON,
 				      RADIO_LED_ON);
 	else
-		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON, 0x0);
+		return call_fext_func(fext, FUNC_FLAGS, 0x5, RADIO_LED_ON,
+				      0x0);
 }
 
 static enum led_brightness radio_led_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
 
-	if (call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0) & RADIO_LED_ON)
+	if (call_fext_func(fext, FUNC_FLAGS, 0x4, 0x0, 0x0) & RADIO_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
@@ -705,12 +706,12 @@ static int eco_led_set(struct led_classdev *cdev,
 {
 	int curr;
 
-	curr = call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0);
+	curr = call_fext_func(fext, FUNC_LEDS, 0x2, ECO_LED, 0x0);
 	if (brightness >= LED_FULL)
-		return call_fext_func(FUNC_LEDS, 0x1, ECO_LED,
+		return call_fext_func(fext, FUNC_LEDS, 0x1, ECO_LED,
 				      curr | ECO_LED_ON);
 	else
-		return call_fext_func(FUNC_LEDS, 0x1, ECO_LED,
+		return call_fext_func(fext, FUNC_LEDS, 0x1, ECO_LED,
 				      curr & ~ECO_LED_ON);
 }
 
@@ -718,7 +719,7 @@ static enum led_brightness eco_led_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
 
-	if (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
+	if (call_fext_func(fext, FUNC_LEDS, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
@@ -734,15 +735,17 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 {
 	int result;
 
-	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
+	if (call_fext_func(fext,
+			   FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
 		result = devm_led_classdev_register(&device->dev,
 						    &logolamp_led);
 		if (result)
 			return result;
 	}
 
-	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
-	    (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
+	if ((call_fext_func(fext,
+			    FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
+	    (call_fext_func(fext, FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
 		result = devm_led_classdev_register(&device->dev, &kblamps_led);
 		if (result)
 			return result;
@@ -754,7 +757,7 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	 * to also have an RF LED.  Therefore use bit 24 as an indicator
 	 * that an RF LED is present.
 	 */
-	if (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
+	if (call_fext_func(fext, FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
 		result = devm_led_classdev_register(&device->dev, &radio_led);
 		if (result)
 			return result;
@@ -765,8 +768,9 @@ static int acpi_fujitsu_laptop_leds_register(struct acpi_device *device)
 	 * bit 14 seems to indicate presence of said led as well.
 	 * Confirm by testing the status.
 	 */
-	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
-	    (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
+	if ((call_fext_func(fext, FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
+	    (call_fext_func(fext,
+			    FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
 		result = devm_led_classdev_register(&device->dev, &eco_led);
 		if (result)
 			return result;
@@ -793,7 +797,6 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	fext = device;
 
 	fujitsu_laptop = priv;
-	fujitsu_laptop->acpi_handle = device->handle;
 	sprintf(acpi_device_name(device), "%s",
 		ACPI_FUJITSU_LAPTOP_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
@@ -812,7 +815,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (error)
 		goto err_free_fifo;
 
-	error = acpi_bus_update_power(fujitsu_laptop->acpi_handle, &state);
+	error = acpi_bus_update_power(device->handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
 		goto err_free_fifo;
@@ -822,8 +825,6 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 		acpi_device_name(device), acpi_device_bid(device),
 		!device->power.state ? "on" : "off");
 
-	fujitsu_laptop->dev = device;
-
 	if (acpi_has_method(device->handle, METHOD_NAME__INI)) {
 		vdbg_printk(FUJLAPTOP_DBG_INFO, "Invoking _INI\n");
 		if (ACPI_FAILURE
@@ -833,13 +834,13 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	}
 
 	i = 0;
-	while (call_fext_func(FUNC_BUTTONS, 0x1, 0x0, 0x0) != 0
+	while (call_fext_func(fext, FUNC_BUTTONS, 0x1, 0x0, 0x0) != 0
 		&& (i++) < MAX_HOTKEY_RINGBUFFER_SIZE)
 		; /* No action, result is discarded */
 	vdbg_printk(FUJLAPTOP_DBG_INFO, "Discarded %i ringbuffer entries\n", i);
 
 	fujitsu_laptop->flags_supported =
-		call_fext_func(FUNC_FLAGS, 0x0, 0x0, 0x0);
+		call_fext_func(fext, FUNC_FLAGS, 0x0, 0x0, 0x0);
 
 	/* Make sure our bitmask of supported functions is cleared if the
 	   RFKILL function block is not implemented, like on the S7020. */
@@ -848,15 +849,16 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 	if (fujitsu_laptop->flags_supported)
 		fujitsu_laptop->flags_state =
-			call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0);
+			call_fext_func(fext, FUNC_FLAGS, 0x4, 0x0, 0x0);
 
 	/* Suspect this is a keymap of the application panel, print it */
-	pr_info("BTNI: [0x%x]\n", call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0));
+	pr_info("BTNI: [0x%x]\n", call_fext_func(fext,
+						 FUNC_BUTTONS, 0x0, 0x0, 0x0));
 
 	/* Sync backlight power status */
 	if (fujitsu_bl && fujitsu_bl->bl_device &&
 	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		if (call_fext_func(FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
+		if (call_fext_func(fext, FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
 			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
 		else
 			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
@@ -942,9 +944,10 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 
 	if (fujitsu_laptop->flags_supported)
 		fujitsu_laptop->flags_state =
-			call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0);
+			call_fext_func(fext, FUNC_FLAGS, 0x4, 0x0, 0x0);
 
-	while ((irb = call_fext_func(FUNC_BUTTONS, 0x1, 0x0, 0x0)) != 0 &&
+	while ((irb = call_fext_func(fext,
+				     FUNC_BUTTONS, 0x1, 0x0, 0x0)) != 0 &&
 	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE) {
 		scancode = irb & 0x4ff;
 		if (sparse_keymap_entry_from_scancode(input, scancode))
@@ -961,7 +964,7 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 	 * handled in software; its state is queried using FUNC_FLAGS
 	 */
 	if ((fujitsu_laptop->flags_supported & BIT(26)) &&
-	    (call_fext_func(FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26)))
+	    (call_fext_func(fext, FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26)))
 		sparse_keymap_report_event(input, BIT(26), 1, true);
 }
 
-- 
2.13.0
