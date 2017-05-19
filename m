From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 3/8] platform/x86: fujitsu-laptop: use device-specific data in backlight code
Date: Fri, 19 May 2017 09:44:43 +0200
Message-ID: <20170519074448.12716-4-kernel@kempniu.pl>
References: <20170519074448.12716-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33218 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750731AbdESHo6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 May 2017 03:44:58 -0400
Received: by mail-wm0-f65.google.com with SMTP id b84so545943wmh.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 May 2017 00:44:58 -0700 (PDT)
In-Reply-To: <20170519074448.12716-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

To prevent using module-wide data in backlight-related code, employ
acpi_driver_data() and bl_get_data() where possible to fetch
device-specific data to work on in each function.  This makes the input
local variable in acpi_fujitsu_bl_notify() and the acpi_handle field of
struct fujitsu_bl redundant, so remove them.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 75 ++++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 63a9b98967fa..1124070aad2d 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -130,7 +130,6 @@
 
 /* Device controlling the backlight and associated keys */
 struct fujitsu_bl {
-	acpi_handle acpi_handle;
 	struct input_dev *input;
 	char phys[32];
 	struct backlight_device *bl_device;
@@ -189,14 +188,15 @@ static int call_fext_func(int func, int op, int feature, int state)
 
 /* Hardware access for LCD brightness control */
 
-static int set_lcd_level(int level)
+static int set_lcd_level(struct acpi_device *device, int level)
 {
+	struct fujitsu_bl *priv = acpi_driver_data(device);
 	acpi_status status;
 	char *method;
 
 	switch (use_alt_lcd_levels) {
 	case -1:
-		if (acpi_has_method(fujitsu_bl->acpi_handle, "SBL2"))
+		if (acpi_has_method(device->handle, "SBL2"))
 			method = "SBL2";
 		else
 			method = "SBLL";
@@ -212,71 +212,74 @@ static int set_lcd_level(int level)
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "set lcd level via %s [%d]\n",
 		    method, level);
 
-	if (level < 0 || level >= fujitsu_bl->max_brightness)
+	if (level < 0 || level >= priv->max_brightness)
 		return -EINVAL;
 
-	status = acpi_execute_simple_method(fujitsu_bl->acpi_handle, method,
-					    level);
+	status = acpi_execute_simple_method(device->handle, method, level);
 	if (ACPI_FAILURE(status)) {
 		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Failed to evaluate %s\n",
 			    method);
 		return -ENODEV;
 	}
 
-	fujitsu_bl->brightness_level = level;
+	priv->brightness_level = level;
 
 	return 0;
 }
 
-static int get_lcd_level(void)
+static int get_lcd_level(struct acpi_device *device)
 {
+	struct fujitsu_bl *priv = acpi_driver_data(device);
 	unsigned long long state = 0;
 	acpi_status status = AE_OK;
 
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "get lcd level via GBLL\n");
 
-	status = acpi_evaluate_integer(fujitsu_bl->acpi_handle, "GBLL", NULL,
-				       &state);
+	status = acpi_evaluate_integer(device->handle, "GBLL", NULL, &state);
 	if (ACPI_FAILURE(status))
 		return 0;
 
-	fujitsu_bl->brightness_level = state & 0x0fffffff;
+	priv->brightness_level = state & 0x0fffffff;
 
-	return fujitsu_bl->brightness_level;
+	return priv->brightness_level;
 }
 
-static int get_max_brightness(void)
+static int get_max_brightness(struct acpi_device *device)
 {
+	struct fujitsu_bl *priv = acpi_driver_data(device);
 	unsigned long long state = 0;
 	acpi_status status = AE_OK;
 
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "get max lcd level via RBLL\n");
 
-	status = acpi_evaluate_integer(fujitsu_bl->acpi_handle, "RBLL", NULL,
-				       &state);
+	status = acpi_evaluate_integer(device->handle, "RBLL", NULL, &state);
 	if (ACPI_FAILURE(status))
 		return -1;
 
-	fujitsu_bl->max_brightness = state;
+	priv->max_brightness = state;
 
-	return fujitsu_bl->max_brightness;
+	return priv->max_brightness;
 }
 
 /* Backlight device stuff */
 
 static int bl_get_brightness(struct backlight_device *b)
 {
-	return b->props.power == FB_BLANK_POWERDOWN ? 0 : get_lcd_level();
+	struct acpi_device *device = bl_get_data(b);
+
+	return b->props.power == FB_BLANK_POWERDOWN ? 0 : get_lcd_level(device);
 }
 
 static int bl_update_status(struct backlight_device *b)
 {
+	struct acpi_device *device = bl_get_data(b);
+
 	if (b->props.power == FB_BLANK_POWERDOWN)
 		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x3);
 	else
 		call_fext_func(FUNC_BACKLIGHT, 0x1, 0x4, 0x0);
 
-	return set_lcd_level(b->props.brightness);
+	return set_lcd_level(device, b->props.brightness);
 }
 
 static const struct backlight_ops fujitsu_bl_ops = {
@@ -372,20 +375,21 @@ static int acpi_fujitsu_bl_input_setup(struct acpi_device *device)
 
 static int fujitsu_backlight_register(struct acpi_device *device)
 {
+	struct fujitsu_bl *priv = acpi_driver_data(device);
 	const struct backlight_properties props = {
-		.brightness = fujitsu_bl->brightness_level,
-		.max_brightness = fujitsu_bl->max_brightness - 1,
+		.brightness = priv->brightness_level,
+		.max_brightness = priv->max_brightness - 1,
 		.type = BACKLIGHT_PLATFORM
 	};
 	struct backlight_device *bd;
 
 	bd = devm_backlight_device_register(&device->dev, "fujitsu-laptop",
-					    &device->dev, NULL,
+					    &device->dev, device,
 					    &fujitsu_bl_ops, &props);
 	if (IS_ERR(bd))
 		return PTR_ERR(bd);
 
-	fujitsu_bl->bl_device = bd;
+	priv->bl_device = bd;
 
 	return 0;
 }
@@ -407,7 +411,6 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 		return -ENOMEM;
 
 	fujitsu_bl = priv;
-	fujitsu_bl->acpi_handle = device->handle;
 	sprintf(acpi_device_name(device), "%s", ACPI_FUJITSU_BL_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
 	device->driver_data = priv;
@@ -416,7 +419,7 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	if (error)
 		return error;
 
-	error = acpi_bus_update_power(fujitsu_bl->acpi_handle, &state);
+	error = acpi_bus_update_power(device->handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
 		return error;
@@ -434,9 +437,9 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 			pr_err("_INI Method failed\n");
 	}
 
-	if (get_max_brightness() <= 0)
-		fujitsu_bl->max_brightness = FUJITSU_LCD_N_LEVELS;
-	get_lcd_level();
+	if (get_max_brightness(device) <= 0)
+		priv->max_brightness = FUJITSU_LCD_N_LEVELS;
+	get_lcd_level(device);
 
 	error = fujitsu_backlight_register(device);
 	if (error)
@@ -449,21 +452,19 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 
 static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 {
-	struct input_dev *input;
+	struct fujitsu_bl *priv = acpi_driver_data(device);
 	int oldb, newb;
 
-	input = fujitsu_bl->input;
-
 	if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
 		vdbg_printk(FUJLAPTOP_DBG_WARN,
 			    "unsupported event [0x%x]\n", event);
-		sparse_keymap_report_event(input, -1, 1, true);
+		sparse_keymap_report_event(priv->input, -1, 1, true);
 		return;
 	}
 
-	oldb = fujitsu_bl->brightness_level;
-	get_lcd_level();
-	newb = fujitsu_bl->brightness_level;
+	oldb = priv->brightness_level;
+	get_lcd_level(device);
+	newb = priv->brightness_level;
 
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "brightness button event [%i -> %i]\n",
 		    oldb, newb);
@@ -472,9 +473,9 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 		return;
 
 	if (!disable_brightness_adjust)
-		set_lcd_level(newb);
+		set_lcd_level(device, newb);
 
-	sparse_keymap_report_event(input, oldb < newb, 1, true);
+	sparse_keymap_report_event(priv->input, oldb < newb, 1, true);
 }
 
 /* ACPI device for hotkey handling */
-- 
2.13.0
