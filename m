From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 01/10] platform/x86: fujitsu-laptop: clearly denote backlight-related symbols
Date: Wed,  8 Feb 2017 14:46:24 +0100
Message-ID: <20170208134633.5152-2-kernel@kempniu.pl>
References: <20170208134633.5152-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208134633.5152-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>

Unify naming for all backlight-related functions, structures, variables
and constants by using a consistent "_bl"/"_BL" suffix/infix.  Adjust
indentation to make checkpatch happy.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
[kempniu: rebase patch, rewrite commit message]
Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 214 +++++++++++++++++-----------------
 1 file changed, 107 insertions(+), 107 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 2b218b1d13e5..e1737b9d9d95 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -78,10 +78,10 @@
 
 #define FUJITSU_LCD_N_LEVELS 8
 
-#define ACPI_FUJITSU_CLASS              "fujitsu"
-#define ACPI_FUJITSU_HID                "FUJ02B1"
-#define ACPI_FUJITSU_DRIVER_NAME	"Fujitsu laptop FUJ02B1 ACPI brightness driver"
-#define ACPI_FUJITSU_DEVICE_NAME        "Fujitsu FUJ02B1"
+#define ACPI_FUJITSU_CLASS		"fujitsu"
+#define ACPI_FUJITSU_BL_HID		"FUJ02B1"
+#define ACPI_FUJITSU_BL_DRIVER_NAME	"Fujitsu laptop FUJ02B1 ACPI brightness driver"
+#define ACPI_FUJITSU_BL_DEVICE_NAME	"Fujitsu FUJ02B1"
 #define ACPI_FUJITSU_HOTKEY_HID 	"FUJ02E3"
 #define ACPI_FUJITSU_HOTKEY_DRIVER_NAME "Fujitsu laptop FUJ02E3 ACPI hotkeys driver"
 #define ACPI_FUJITSU_HOTKEY_DEVICE_NAME "Fujitsu FUJ02E3"
@@ -136,7 +136,7 @@
 #endif
 
 /* Device controlling the backlight and associated keys */
-struct fujitsu_t {
+struct fujitsu_bl {
 	acpi_handle acpi_handle;
 	struct acpi_device *dev;
 	struct input_dev *input;
@@ -150,7 +150,7 @@ struct fujitsu_t {
 	unsigned int brightness_level;
 };
 
-static struct fujitsu_t *fujitsu;
+static struct fujitsu_bl *fujitsu_bl;
 static int use_alt_lcd_levels = -1;
 static int disable_brightness_adjust = -1;
 
@@ -222,7 +222,7 @@ static struct led_classdev eco_led = {
 static u32 dbg_level = 0x03;
 #endif
 
-static void acpi_fujitsu_notify(struct acpi_device *device, u32 event);
+static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event);
 
 /* Fujitsu ACPI interface function */
 
@@ -373,10 +373,10 @@ static int set_lcd_level(int level)
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "set lcd level via SBLL [%d]\n",
 		    level);
 
-	if (level < 0 || level >= fujitsu->max_brightness)
+	if (level < 0 || level >= fujitsu_bl->max_brightness)
 		return -EINVAL;
 
-	status = acpi_get_handle(fujitsu->acpi_handle, "SBLL", &handle);
+	status = acpi_get_handle(fujitsu_bl->acpi_handle, "SBLL", &handle);
 	if (ACPI_FAILURE(status)) {
 		vdbg_printk(FUJLAPTOP_DBG_ERROR, "SBLL not present\n");
 		return -ENODEV;
@@ -398,10 +398,10 @@ static int set_lcd_level_alt(int level)
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "set lcd level via SBL2 [%d]\n",
 		    level);
 
-	if (level < 0 || level >= fujitsu->max_brightness)
+	if (level < 0 || level >= fujitsu_bl->max_brightness)
 		return -EINVAL;
 
-	status = acpi_get_handle(fujitsu->acpi_handle, "SBL2", &handle);
+	status = acpi_get_handle(fujitsu_bl->acpi_handle, "SBL2", &handle);
 	if (ACPI_FAILURE(status)) {
 		vdbg_printk(FUJLAPTOP_DBG_ERROR, "SBL2 not present\n");
 		return -ENODEV;
@@ -421,19 +421,19 @@ static int get_lcd_level(void)
 
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "get lcd level via GBLL\n");
 
-	status =
-	    acpi_evaluate_integer(fujitsu->acpi_handle, "GBLL", NULL, &state);
+	status = acpi_evaluate_integer(fujitsu_bl->acpi_handle, "GBLL", NULL,
+				       &state);
 	if (ACPI_FAILURE(status))
 		return 0;
 
-	fujitsu->brightness_level = state & 0x0fffffff;
+	fujitsu_bl->brightness_level = state & 0x0fffffff;
 
 	if (state & 0x80000000)
-		fujitsu->brightness_changed = 1;
+		fujitsu_bl->brightness_changed = 1;
 	else
-		fujitsu->brightness_changed = 0;
+		fujitsu_bl->brightness_changed = 0;
 
-	return fujitsu->brightness_level;
+	return fujitsu_bl->brightness_level;
 }
 
 static int get_max_brightness(void)
@@ -443,14 +443,14 @@ static int get_max_brightness(void)
 
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "get max lcd level via RBLL\n");
 
-	status =
-	    acpi_evaluate_integer(fujitsu->acpi_handle, "RBLL", NULL, &state);
+	status = acpi_evaluate_integer(fujitsu_bl->acpi_handle, "RBLL", NULL,
+				       &state);
 	if (ACPI_FAILURE(status))
 		return -1;
 
-	fujitsu->max_brightness = state;
+	fujitsu_bl->max_brightness = state;
 
-	return fujitsu->max_brightness;
+	return fujitsu_bl->max_brightness;
 }
 
 /* Backlight device stuff */
@@ -483,7 +483,7 @@ static int bl_update_status(struct backlight_device *b)
 	return ret;
 }
 
-static const struct backlight_ops fujitsubl_ops = {
+static const struct backlight_ops fujitsu_bl_ops = {
 	.get_brightness = bl_get_brightness,
 	.update_status = bl_update_status,
 };
@@ -511,7 +511,7 @@ show_brightness_changed(struct device *dev,
 
 	int ret;
 
-	ret = fujitsu->brightness_changed;
+	ret = fujitsu_bl->brightness_changed;
 	if (ret < 0)
 		return ret;
 
@@ -539,7 +539,7 @@ static ssize_t store_lcd_level(struct device *dev,
 	int level, ret;
 
 	if (sscanf(buf, "%i", &level) != 1
-	    || (level < 0 || level >= fujitsu->max_brightness))
+	    || (level < 0 || level >= fujitsu_bl->max_brightness))
 		return -EINVAL;
 
 	if (use_alt_lcd_levels)
@@ -644,25 +644,25 @@ static void __init dmi_check_cb_common(const struct dmi_system_id *id)
 static int __init dmi_check_cb_s6410(const struct dmi_system_id *id)
 {
 	dmi_check_cb_common(id);
-	fujitsu->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
-	fujitsu->keycode2 = KEY_HELP;	/* "Mobility Center" */
+	fujitsu_bl->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
+	fujitsu_bl->keycode2 = KEY_HELP;	/* "Mobility Center" */
 	return 1;
 }
 
 static int __init dmi_check_cb_s6420(const struct dmi_system_id *id)
 {
 	dmi_check_cb_common(id);
-	fujitsu->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
-	fujitsu->keycode2 = KEY_HELP;	/* "Mobility Center" */
+	fujitsu_bl->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
+	fujitsu_bl->keycode2 = KEY_HELP;	/* "Mobility Center" */
 	return 1;
 }
 
 static int __init dmi_check_cb_p8010(const struct dmi_system_id *id)
 {
 	dmi_check_cb_common(id);
-	fujitsu->keycode1 = KEY_HELP;	/* "Support" */
-	fujitsu->keycode3 = KEY_SWITCHVIDEOMODE;	/* "Presentation" */
-	fujitsu->keycode4 = KEY_WWW;	/* "Internet" */
+	fujitsu_bl->keycode1 = KEY_HELP;		/* "Support" */
+	fujitsu_bl->keycode3 = KEY_SWITCHVIDEOMODE;	/* "Presentation" */
+	fujitsu_bl->keycode4 = KEY_WWW;			/* "Internet" */
 	return 1;
 }
 
@@ -693,7 +693,7 @@ static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
 
 /* ACPI device for LCD brightness control */
 
-static int acpi_fujitsu_add(struct acpi_device *device)
+static int acpi_fujitsu_bl_add(struct acpi_device *device)
 {
 	int state = 0;
 	struct input_dev *input;
@@ -702,22 +702,22 @@ static int acpi_fujitsu_add(struct acpi_device *device)
 	if (!device)
 		return -EINVAL;
 
-	fujitsu->acpi_handle = device->handle;
-	sprintf(acpi_device_name(device), "%s", ACPI_FUJITSU_DEVICE_NAME);
+	fujitsu_bl->acpi_handle = device->handle;
+	sprintf(acpi_device_name(device), "%s", ACPI_FUJITSU_BL_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
-	device->driver_data = fujitsu;
+	device->driver_data = fujitsu_bl;
 
-	fujitsu->input = input = input_allocate_device();
+	fujitsu_bl->input = input = input_allocate_device();
 	if (!input) {
 		error = -ENOMEM;
 		goto err_stop;
 	}
 
-	snprintf(fujitsu->phys, sizeof(fujitsu->phys),
+	snprintf(fujitsu_bl->phys, sizeof(fujitsu_bl->phys),
 		 "%s/video/input0", acpi_device_hid(device));
 
 	input->name = acpi_device_name(device);
-	input->phys = fujitsu->phys;
+	input->phys = fujitsu_bl->phys;
 	input->id.bustype = BUS_HOST;
 	input->id.product = 0x06;
 	input->dev.parent = &device->dev;
@@ -730,7 +730,7 @@ static int acpi_fujitsu_add(struct acpi_device *device)
 	if (error)
 		goto err_free_input_dev;
 
-	error = acpi_bus_update_power(fujitsu->acpi_handle, &state);
+	error = acpi_bus_update_power(fujitsu_bl->acpi_handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
 		goto err_unregister_input_dev;
@@ -740,7 +740,7 @@ static int acpi_fujitsu_add(struct acpi_device *device)
 	       acpi_device_name(device), acpi_device_bid(device),
 	       !device->power.state ? "on" : "off");
 
-	fujitsu->dev = device;
+	fujitsu_bl->dev = device;
 
 	if (acpi_has_method(device->handle, METHOD_NAME__INI)) {
 		vdbg_printk(FUJLAPTOP_DBG_INFO, "Invoking _INI\n");
@@ -758,7 +758,7 @@ static int acpi_fujitsu_add(struct acpi_device *device)
 		    use_alt_lcd_levels, disable_brightness_adjust);
 
 	if (get_max_brightness() <= 0)
-		fujitsu->max_brightness = FUJITSU_LCD_N_LEVELS;
+		fujitsu_bl->max_brightness = FUJITSU_LCD_N_LEVELS;
 	get_lcd_level();
 
 	return 0;
@@ -772,38 +772,38 @@ static int acpi_fujitsu_add(struct acpi_device *device)
 	return error;
 }
 
-static int acpi_fujitsu_remove(struct acpi_device *device)
+static int acpi_fujitsu_bl_remove(struct acpi_device *device)
 {
-	struct fujitsu_t *fujitsu = acpi_driver_data(device);
-	struct input_dev *input = fujitsu->input;
+	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
+	struct input_dev *input = fujitsu_bl->input;
 
 	input_unregister_device(input);
 
-	fujitsu->acpi_handle = NULL;
+	fujitsu_bl->acpi_handle = NULL;
 
 	return 0;
 }
 
 /* Brightness notify */
 
-static void acpi_fujitsu_notify(struct acpi_device *device, u32 event)
+static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 {
 	struct input_dev *input;
 	int keycode;
 	int oldb, newb;
 
-	input = fujitsu->input;
+	input = fujitsu_bl->input;
 
 	switch (event) {
 	case ACPI_FUJITSU_NOTIFY_CODE1:
 		keycode = 0;
-		oldb = fujitsu->brightness_level;
+		oldb = fujitsu_bl->brightness_level;
 		get_lcd_level();
-		newb = fujitsu->brightness_level;
+		newb = fujitsu_bl->brightness_level;
 
 		vdbg_printk(FUJLAPTOP_DBG_TRACE,
 			    "brightness button event [%i -> %i (%i)]\n",
-			    oldb, newb, fujitsu->brightness_changed);
+			    oldb, newb, fujitsu_bl->brightness_changed);
 
 		if (oldb < newb) {
 			if (disable_brightness_adjust != 1) {
@@ -882,11 +882,11 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 	input->dev.parent = &device->dev;
 
 	set_bit(EV_KEY, input->evbit);
-	set_bit(fujitsu->keycode1, input->keybit);
-	set_bit(fujitsu->keycode2, input->keybit);
-	set_bit(fujitsu->keycode3, input->keybit);
-	set_bit(fujitsu->keycode4, input->keybit);
-	set_bit(fujitsu->keycode5, input->keybit);
+	set_bit(fujitsu_bl->keycode1, input->keybit);
+	set_bit(fujitsu_bl->keycode2, input->keybit);
+	set_bit(fujitsu_bl->keycode3, input->keybit);
+	set_bit(fujitsu_bl->keycode4, input->keybit);
+	set_bit(fujitsu_bl->keycode5, input->keybit);
 	set_bit(KEY_TOUCHPAD_TOGGLE, input->keybit);
 	set_bit(KEY_UNKNOWN, input->keybit);
 
@@ -937,7 +937,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
-		result = led_classdev_register(&fujitsu->pf_device->dev,
+		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&logolamp_led);
 		if (result == 0) {
 			fujitsu_hotkey->logolamp_registered = 1;
@@ -949,7 +949,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 
 	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
 	   (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
-		result = led_classdev_register(&fujitsu->pf_device->dev,
+		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&kblamps_led);
 		if (result == 0) {
 			fujitsu_hotkey->kblamps_registered = 1;
@@ -966,7 +966,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 	 * that an RF LED is present.
 	 */
 	if (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
-		result = led_classdev_register(&fujitsu->pf_device->dev,
+		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&radio_led);
 		if (result == 0) {
 			fujitsu_hotkey->radio_led_registered = 1;
@@ -983,7 +983,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 	*/
 	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
 	   (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
-		result = led_classdev_register(&fujitsu->pf_device->dev,
+		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&eco_led);
 		if (result == 0) {
 			fujitsu_hotkey->eco_led_registered = 1;
@@ -1103,19 +1103,19 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
 			&& (i++) < MAX_HOTKEY_RINGBUFFER_SIZE) {
 		switch (irb & 0x4ff) {
 		case KEY1_CODE:
-			keycode = fujitsu->keycode1;
+			keycode = fujitsu_bl->keycode1;
 			break;
 		case KEY2_CODE:
-			keycode = fujitsu->keycode2;
+			keycode = fujitsu_bl->keycode2;
 			break;
 		case KEY3_CODE:
-			keycode = fujitsu->keycode3;
+			keycode = fujitsu_bl->keycode3;
 			break;
 		case KEY4_CODE:
-			keycode = fujitsu->keycode4;
+			keycode = fujitsu_bl->keycode4;
 			break;
 		case KEY5_CODE:
-			keycode = fujitsu->keycode5;
+			keycode = fujitsu_bl->keycode5;
 			break;
 		case 0:
 			keycode = 0;
@@ -1150,19 +1150,19 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
 
 /* Initialization */
 
-static const struct acpi_device_id fujitsu_device_ids[] = {
-	{ACPI_FUJITSU_HID, 0},
+static const struct acpi_device_id fujitsu_bl_device_ids[] = {
+	{ACPI_FUJITSU_BL_HID, 0},
 	{"", 0},
 };
 
-static struct acpi_driver acpi_fujitsu_driver = {
-	.name = ACPI_FUJITSU_DRIVER_NAME,
+static struct acpi_driver acpi_fujitsu_bl_driver = {
+	.name = ACPI_FUJITSU_BL_DRIVER_NAME,
 	.class = ACPI_FUJITSU_CLASS,
-	.ids = fujitsu_device_ids,
+	.ids = fujitsu_bl_device_ids,
 	.ops = {
-		.add = acpi_fujitsu_add,
-		.remove = acpi_fujitsu_remove,
-		.notify = acpi_fujitsu_notify,
+		.add = acpi_fujitsu_bl_add,
+		.remove = acpi_fujitsu_bl_remove,
+		.notify = acpi_fujitsu_bl_notify,
 		},
 };
 
@@ -1183,7 +1183,7 @@ static struct acpi_driver acpi_fujitsu_hotkey_driver = {
 };
 
 static const struct acpi_device_id fujitsu_ids[] __used = {
-	{ACPI_FUJITSU_HID, 0},
+	{ACPI_FUJITSU_BL_HID, 0},
 	{ACPI_FUJITSU_HOTKEY_HID, 0},
 	{"", 0}
 };
@@ -1196,17 +1196,17 @@ static int __init fujitsu_init(void)
 	if (acpi_disabled)
 		return -ENODEV;
 
-	fujitsu = kzalloc(sizeof(struct fujitsu_t), GFP_KERNEL);
-	if (!fujitsu)
+	fujitsu_bl = kzalloc(sizeof(struct fujitsu_bl), GFP_KERNEL);
+	if (!fujitsu_bl)
 		return -ENOMEM;
-	fujitsu->keycode1 = KEY_PROG1;
-	fujitsu->keycode2 = KEY_PROG2;
-	fujitsu->keycode3 = KEY_PROG3;
-	fujitsu->keycode4 = KEY_PROG4;
-	fujitsu->keycode5 = KEY_RFKILL;
+	fujitsu_bl->keycode1 = KEY_PROG1;
+	fujitsu_bl->keycode2 = KEY_PROG2;
+	fujitsu_bl->keycode3 = KEY_PROG3;
+	fujitsu_bl->keycode4 = KEY_PROG4;
+	fujitsu_bl->keycode5 = KEY_RFKILL;
 	dmi_check_system(fujitsu_dmi_table);
 
-	result = acpi_bus_register_driver(&acpi_fujitsu_driver);
+	result = acpi_bus_register_driver(&acpi_fujitsu_bl_driver);
 	if (result < 0) {
 		ret = -ENODEV;
 		goto fail_acpi;
@@ -1214,18 +1214,18 @@ static int __init fujitsu_init(void)
 
 	/* Register platform stuff */
 
-	fujitsu->pf_device = platform_device_alloc("fujitsu-laptop", -1);
-	if (!fujitsu->pf_device) {
+	fujitsu_bl->pf_device = platform_device_alloc("fujitsu-laptop", -1);
+	if (!fujitsu_bl->pf_device) {
 		ret = -ENOMEM;
 		goto fail_platform_driver;
 	}
 
-	ret = platform_device_add(fujitsu->pf_device);
+	ret = platform_device_add(fujitsu_bl->pf_device);
 	if (ret)
 		goto fail_platform_device1;
 
 	ret =
-	    sysfs_create_group(&fujitsu->pf_device->dev.kobj,
+	    sysfs_create_group(&fujitsu_bl->pf_device->dev.kobj,
 			       &fujitsupf_attribute_group);
 	if (ret)
 		goto fail_platform_device2;
@@ -1236,19 +1236,19 @@ static int __init fujitsu_init(void)
 		struct backlight_properties props;
 
 		memset(&props, 0, sizeof(struct backlight_properties));
-		max_brightness = fujitsu->max_brightness;
+		max_brightness = fujitsu_bl->max_brightness;
 		props.type = BACKLIGHT_PLATFORM;
 		props.max_brightness = max_brightness - 1;
-		fujitsu->bl_device = backlight_device_register("fujitsu-laptop",
-							       NULL, NULL,
-							       &fujitsubl_ops,
-							       &props);
-		if (IS_ERR(fujitsu->bl_device)) {
-			ret = PTR_ERR(fujitsu->bl_device);
-			fujitsu->bl_device = NULL;
+		fujitsu_bl->bl_device = backlight_device_register("fujitsu-laptop",
+								  NULL, NULL,
+								  &fujitsu_bl_ops,
+								  &props);
+		if (IS_ERR(fujitsu_bl->bl_device)) {
+			ret = PTR_ERR(fujitsu_bl->bl_device);
+			fujitsu_bl->bl_device = NULL;
 			goto fail_sysfs_group;
 		}
-		fujitsu->bl_device->props.brightness = fujitsu->brightness_level;
+		fujitsu_bl->bl_device->props.brightness = fujitsu_bl->brightness_level;
 	}
 
 	ret = platform_driver_register(&fujitsupf_driver);
@@ -1272,9 +1272,9 @@ static int __init fujitsu_init(void)
 	/* Sync backlight power status (needs FUJ02E3 device, hence deferred) */
 	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
 		if (call_fext_func(FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
-			fujitsu->bl_device->props.power = FB_BLANK_POWERDOWN;
+			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
 		else
-			fujitsu->bl_device->props.power = FB_BLANK_UNBLANK;
+			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
 	}
 
 	pr_info("driver " FUJITSU_DRIVER_VERSION " successfully loaded\n");
@@ -1286,18 +1286,18 @@ static int __init fujitsu_init(void)
 fail_hotkey:
 	platform_driver_unregister(&fujitsupf_driver);
 fail_backlight:
-	backlight_device_unregister(fujitsu->bl_device);
+	backlight_device_unregister(fujitsu_bl->bl_device);
 fail_sysfs_group:
-	sysfs_remove_group(&fujitsu->pf_device->dev.kobj,
+	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
 			   &fujitsupf_attribute_group);
 fail_platform_device2:
-	platform_device_del(fujitsu->pf_device);
+	platform_device_del(fujitsu_bl->pf_device);
 fail_platform_device1:
-	platform_device_put(fujitsu->pf_device);
+	platform_device_put(fujitsu_bl->pf_device);
 fail_platform_driver:
-	acpi_bus_unregister_driver(&acpi_fujitsu_driver);
+	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
 fail_acpi:
-	kfree(fujitsu);
+	kfree(fujitsu_bl);
 
 	return ret;
 }
@@ -1310,16 +1310,16 @@ static void __exit fujitsu_cleanup(void)
 
 	platform_driver_unregister(&fujitsupf_driver);
 
-	backlight_device_unregister(fujitsu->bl_device);
+	backlight_device_unregister(fujitsu_bl->bl_device);
 
-	sysfs_remove_group(&fujitsu->pf_device->dev.kobj,
+	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
 			   &fujitsupf_attribute_group);
 
-	platform_device_unregister(fujitsu->pf_device);
+	platform_device_unregister(fujitsu_bl->pf_device);
 
-	acpi_bus_unregister_driver(&acpi_fujitsu_driver);
+	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
 
-	kfree(fujitsu);
+	kfree(fujitsu_bl);
 
 	pr_info("driver unloaded\n");
 }
-- 
2.11.1
