From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 07/10] platform/x86: fujitsu-laptop: use device-specific data in backlight code
Date: Mon, 24 Apr 2017 15:33:31 +0200
Message-ID: <20170424133334.7064-8-kernel@kempniu.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34638 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1171387AbdDXNdp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 09:33:45 -0400
Received: by mail-lf0-f66.google.com with SMTP id x72so16554081lfb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Apr 2017 06:33:45 -0700 (PDT)
In-Reply-To: <20170424133334.7064-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

To prevent using module-wide data in backlight-related code, employ
acpi_driver_data() and bl_get_data() to fetch device-specific data to
work on in each function.  This makes the input local variable in
acpi_fujitsu_bl_notify() redundant, so remove it.  Remove the
module-wide struct fujitsu_bl as it is now redundant.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 89 ++++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 780e11b43d27..fb46652250c7 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -138,7 +138,6 @@ struct fujitsu_bl {
 	unsigned int brightness_level;
 };
 
-static struct fujitsu_bl *fujitsu_bl;
 static int use_alt_lcd_levels = -1;
 static bool disable_brightness_adjust;
 
@@ -209,14 +208,15 @@ static int fext_leds(acpi_handle handle, int op, int feature, int state)
 
 /* Hardware access for LCD brightness control */
 
-static int set_lcd_level(int level)
+static int set_lcd_level(struct acpi_device *device, int level)
 {
+	struct fujitsu_bl *priv = acpi_driver_data(device);
 	acpi_status status;
 	char *method;
 
 	switch (use_alt_lcd_levels) {
 	case -1:
-		if (acpi_has_method(fujitsu_bl->handle, "SBL2"))
+		if (acpi_has_method(priv->handle, "SBL2"))
 			method = "SBL2";
 		else
 			method = "SBLL";
@@ -232,72 +232,77 @@ static int set_lcd_level(int level)
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "set lcd level via %s [%d]\n",
 		    method, level);
 
-	if (level < 0 || level >= fujitsu_bl->max_brightness)
+	if (level < 0 || level >= priv->max_brightness)
 		return -EINVAL;
 
-	status = acpi_execute_simple_method(fujitsu_bl->handle, method, level);
+	status = acpi_execute_simple_method(priv->handle, method, level);
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
 
-	status = acpi_evaluate_integer(fujitsu_bl->handle, "GBLL", NULL,
-				       &state);
+	status = acpi_evaluate_integer(priv->handle, "GBLL", NULL, &state);
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
 
-	status = acpi_evaluate_integer(fujitsu_bl->handle, "RBLL", NULL,
-				       &state);
+	status = acpi_evaluate_integer(priv->handle, "RBLL", NULL, &state);
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
-	if (fujitsu_bl->fext_handle) {
+	struct acpi_device *device = bl_get_data(b);
+	struct fujitsu_bl *priv = acpi_driver_data(device);
+
+	if (priv->fext_handle) {
 		if (b->props.power == FB_BLANK_POWERDOWN)
-			fext_backlight(fujitsu_bl->fext_handle, 0x1, 0x4, 0x3);
+			fext_backlight(priv->fext_handle, 0x1, 0x4, 0x3);
 		else
-			fext_backlight(fujitsu_bl->fext_handle, 0x1, 0x4, 0x0);
+			fext_backlight(priv->fext_handle, 0x1, 0x4, 0x0);
 	}
 
-	return set_lcd_level(b->props.brightness);
+	return set_lcd_level(device, b->props.brightness);
 }
 
 static const struct backlight_ops fujitsu_bl_ops = {
@@ -393,23 +398,24 @@ static int acpi_fujitsu_bl_input_setup(struct acpi_device *device)
 
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
 	acpi_status status;
 
 	bd = devm_backlight_device_register(&device->dev, "fujitsu-laptop",
-					    &device->dev, NULL,
+					    &device->dev, device,
 					    &fujitsu_bl_ops, &props);
 	if (IS_ERR(bd))
 		return PTR_ERR(bd);
 
-	status = acpi_get_handle(NULL, "\\_SB.FEXT", &fujitsu_bl->fext_handle);
+	status = acpi_get_handle(NULL, "\\_SB.FEXT", &priv->fext_handle);
 	if (ACPI_SUCCESS(status) &&
-	    fext_backlight(fujitsu_bl->fext_handle, 0x2, 0x4, 0x0) == 3)
+	    fext_backlight(priv->fext_handle, 0x2, 0x4, 0x0) == 3)
 		bd->props.power = FB_BLANK_POWERDOWN;
 
 	return 0;
@@ -431,8 +437,7 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	if (!priv)
 		return -ENOMEM;
 
-	fujitsu_bl = priv;
-	fujitsu_bl->handle = device->handle;
+	priv->handle = device->handle;
 	sprintf(acpi_device_name(device), "%s", ACPI_FUJITSU_BL_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
 	device->driver_data = priv;
@@ -441,7 +446,7 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	if (error)
 		return error;
 
-	error = acpi_bus_update_power(fujitsu_bl->handle, &state);
+	error = acpi_bus_update_power(priv->handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
 		return error;
@@ -451,17 +456,17 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	       acpi_device_name(device), acpi_device_bid(device),
 	       !device->power.state ? "on" : "off");
 
-	if (acpi_has_method(device->handle, METHOD_NAME__INI)) {
+	if (acpi_has_method(priv->handle, METHOD_NAME__INI)) {
 		vdbg_printk(FUJLAPTOP_DBG_INFO, "Invoking _INI\n");
 		if (ACPI_FAILURE
 		    (acpi_evaluate_object
-		     (device->handle, METHOD_NAME__INI, NULL, NULL)))
+		     (priv->handle, METHOD_NAME__INI, NULL, NULL)))
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
@@ -474,21 +479,19 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 
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
@@ -497,9 +500,9 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 		return;
 
 	if (!disable_brightness_adjust)
-		set_lcd_level(newb);
+		set_lcd_level(device, newb);
 
-	sparse_keymap_report_event(input, oldb < newb, 1, true);
+	sparse_keymap_report_event(priv->input, oldb < newb, 1, true);
 }
 
 /* ACPI device for hotkey handling */
-- 
2.12.2
