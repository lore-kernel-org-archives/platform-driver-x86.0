From: Jonathan Woithe <jwoithe@just42.net>
Subject: [PATCH 1/4][RFC v2] fujitsu-laptop: fujitsu-laptop: renames and
 cleanup
Date: Tue, 31 Jan 2017 23:38:29 +1030
Message-ID: <20170131130829.GB6218@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:52678 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752081AbdAaNIi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Jan 2017 08:08:38 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kernel@kempniu.pl
Cc: platform-driver-x86@vger.kernel.org

These cleanups can be made with no changes to the generated code,
save for a single debug string (as shown by "objdump" and "strings").
The main aim is to avoid using misleading names.

1. Rename the following:
 - fujitsu -> fujitsu_bl      (backlight and backlight keys)
 - fujitsu_hotkey -> fujitsu  (hotkeys, rfkill, lid, dock and leds)
 - FUNC_RFKILL -> FUNC_FLAGS  (rfkill, lid, and dock state)

2. Replace some numeric constants with FLAG_* defines.

3. Remove the follwing:
 - #ifdef around LED constants (for easier reading)
 - unused defines (FUJLAPTOP_ERR etc)
 - "_t" suffix from struct tags
 - unneccesary function prototypes
 - blank lines between opening bracket and variable declarations

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Signed-off-by: Jonathan Woithe <jwoithe@just42.net>
---
 drivers/platform/x86/fujitsu-laptop.c | 423 +++++++++++++++++-----------------
 1 file changed, 209 insertions(+), 214 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 82d6771..a3752bb 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -1,9 +1,10 @@
 /*-*-linux-c-*-*/
 
 /*
-  Copyright (C) 2007,2008 Jonathan Woithe <jwoithe@just42.net>
+  Copyright (C) 2007,2008,2017 Jonathan Woithe <jwoithe@just42.net>
   Copyright (C) 2008 Peter Gruber <nokos@gmx.net>
   Copyright (C) 2008 Tony Vroon <tony@linx.net>
+  Copyright (C) 2009 Alan Jenkins <alan-jenkins@tuffmail.co.uk>
   Based on earlier work:
     Copyright (C) 2003 Shane Spencer <shane@bogomip.com>
     Adrian Yee <brewt-fujitsu@brewt.org>
@@ -79,17 +80,17 @@
 #define FUJITSU_LCD_N_LEVELS 8
 
 #define ACPI_FUJITSU_CLASS              "fujitsu"
-#define ACPI_FUJITSU_HID                "FUJ02B1"
-#define ACPI_FUJITSU_DRIVER_NAME	"Fujitsu laptop FUJ02B1 ACPI brightness driver"
-#define ACPI_FUJITSU_DEVICE_NAME        "Fujitsu FUJ02B1"
-#define ACPI_FUJITSU_HOTKEY_HID 	"FUJ02E3"
-#define ACPI_FUJITSU_HOTKEY_DRIVER_NAME "Fujitsu laptop FUJ02E3 ACPI hotkeys driver"
-#define ACPI_FUJITSU_HOTKEY_DEVICE_NAME "Fujitsu FUJ02E3"
+#define ACPI_FUJITSU_LAPTOP_HID         "FUJ02E3"
+#define ACPI_FUJITSU_LAPTOP_DRIVER_NAME "Fujitsu laptop FUJ02E3 ACPI hotkeys driver"
+#define ACPI_FUJITSU_LAPTOP_DEVICE_NAME "Fujitsu FUJ02E3"
+#define ACPI_FUJITSU_BL_HID             "FUJ02B1"
+#define ACPI_FUJITSU_BL_DRIVER_NAME     "Fujitsu laptop FUJ02B1 ACPI brightness driver"
+#define ACPI_FUJITSU_BL_DEVICE_NAME     "Fujitsu FUJ02B1"
 
-#define ACPI_FUJITSU_NOTIFY_CODE1     0x80
+#define ACPI_FUJITSU_BL_NOTIFY_CODE1    0x80
 
 /* FUNC interface - command values */
-#define FUNC_RFKILL	0x1000
+#define FUNC_FLAGS	0x1000
 #define FUNC_LEDS	0x1001
 #define FUNC_BUTTONS	0x1002
 #define FUNC_BACKLIGHT  0x1004
@@ -97,7 +98,11 @@
 /* FUNC interface - responses */
 #define UNSUPPORTED_CMD 0x80000000
 
-#if IS_ENABLED(CONFIG_LEDS_CLASS)
+/* FUNC interface - status flags */
+#define FLAG_RFKILL     0x020
+#define FLAG_LID        0x100
+#define FLAG_DOCK       0x200
+
 /* FUNC interface - LED control */
 #define FUNC_LED_OFF	0x1
 #define FUNC_LED_ON	0x30001
@@ -107,7 +112,6 @@
 #define RADIO_LED_ON	0x20
 #define ECO_LED	0x10000
 #define ECO_LED_ON	0x80000
-#endif
 
 /* Hotkey details */
 #define KEY1_CODE	0x410	/* codes for the keys in the GIRB register */
@@ -136,7 +140,7 @@
 #endif
 
 /* Device controlling the backlight and associated keys */
-struct fujitsu_t {
+struct fujitsu_bl {
 	acpi_handle acpi_handle;
 	struct acpi_device *dev;
 	struct input_dev *input;
@@ -150,12 +154,12 @@ struct fujitsu_t {
 	unsigned int brightness_level;
 };
 
-static struct fujitsu_t *fujitsu;
+static struct fujitsu_bl *fujitsu_bl;
 static int use_alt_lcd_levels = -1;
 static int disable_brightness_adjust = -1;
 
-/* Device used to access other hotkeys on the laptop */
-struct fujitsu_hotkey_t {
+/* Device used to access hotkeys and other features on the laptop */
+struct fujitsu_laptop {
 	acpi_handle acpi_handle;
 	struct acpi_device *dev;
 	struct input_dev *input;
@@ -163,17 +167,15 @@ struct fujitsu_hotkey_t {
 	struct platform_device *pf_device;
 	struct kfifo fifo;
 	spinlock_t fifo_lock;
-	int rfkill_supported;
-	int rfkill_state;
+        int flags_supported;
+        int flags_state;
 	int logolamp_registered;
 	int kblamps_registered;
 	int radio_led_registered;
 	int eco_led_registered;
 };
 
-static struct fujitsu_hotkey_t *fujitsu_hotkey;
-
-static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event);
+static struct fujitsu_laptop *fujitsu_laptop;
 
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 static enum led_brightness logolamp_get(struct led_classdev *cdev);
@@ -221,8 +223,6 @@ static struct led_classdev eco_led = {
 static u32 dbg_level = 0x03;
 #endif
 
-static void acpi_fujitsu_notify(struct acpi_device *device, u32 event);
-
 /* Fujitsu ACPI interface function */
 
 static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
@@ -238,7 +238,7 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
 	unsigned long long value;
 	acpi_handle handle = NULL;
 
-	status = acpi_get_handle(fujitsu_hotkey->acpi_handle, "FUNC", &handle);
+	status = acpi_get_handle(fujitsu_laptop->acpi_handle, "FUNC", &handle);
 	if (ACPI_FAILURE(status)) {
 		vdbg_printk(FUJLAPTOP_DBG_ERROR,
 				"FUNC interface is not present\n");
@@ -294,9 +294,9 @@ static int radio_led_set(struct led_classdev *cdev,
 				enum led_brightness brightness)
 {
 	if (brightness >= LED_FULL)
-		return call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, RADIO_LED_ON);
+		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON, RADIO_LED_ON);
 	else
-		return call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
+		return call_fext_func(FUNC_FLAGS, 0x5, RADIO_LED_ON, 0x0);
 }
 
 static int eco_led_set(struct led_classdev *cdev,
@@ -340,7 +340,7 @@ static enum led_brightness radio_led_get(struct led_classdev *cdev)
 {
 	enum led_brightness brightness = LED_OFF;
 
-	if (call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0) & RADIO_LED_ON)
+	if (call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0) & RADIO_LED_ON)
 		brightness = LED_FULL;
 
 	return brightness;
@@ -367,10 +367,10 @@ static int set_lcd_level(int level)
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
@@ -392,10 +392,10 @@ static int set_lcd_level_alt(int level)
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
@@ -416,18 +416,18 @@ static int get_lcd_level(void)
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "get lcd level via GBLL\n");
 
 	status =
-	    acpi_evaluate_integer(fujitsu->acpi_handle, "GBLL", NULL, &state);
+	  acpi_evaluate_integer(fujitsu_bl->acpi_handle, "GBLL", NULL, &state);
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
@@ -438,13 +438,13 @@ static int get_max_brightness(void)
 	vdbg_printk(FUJLAPTOP_DBG_TRACE, "get max lcd level via RBLL\n");
 
 	status =
-	    acpi_evaluate_integer(fujitsu->acpi_handle, "RBLL", NULL, &state);
+	  acpi_evaluate_integer(fujitsu_bl->acpi_handle, "RBLL", NULL, &state);
 	if (ACPI_FAILURE(status))
 		return -1;
 
-	fujitsu->max_brightness = state;
+	fujitsu_bl->max_brightness = state;
 
-	return fujitsu->max_brightness;
+	return fujitsu_bl->max_brightness;
 }
 
 /* Backlight device stuff */
@@ -488,7 +488,6 @@ static ssize_t
 show_max_brightness(struct device *dev,
 		    struct device_attribute *attr, char *buf)
 {
-
 	int ret;
 
 	ret = get_max_brightness();
@@ -502,10 +501,9 @@ static ssize_t
 show_brightness_changed(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-
 	int ret;
 
-	ret = fujitsu->brightness_changed;
+	ret = fujitsu_bl->brightness_changed;
 	if (ret < 0)
 		return ret;
 
@@ -515,7 +513,6 @@ show_brightness_changed(struct device *dev,
 static ssize_t show_lcd_level(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
-
 	int ret;
 
 	ret = get_lcd_level();
@@ -529,11 +526,10 @@ static ssize_t store_lcd_level(struct device *dev,
 			       struct device_attribute *attr, const char *buf,
 			       size_t count)
 {
-
 	int level, ret;
 
 	if (sscanf(buf, "%i", &level) != 1
-	    || (level < 0 || level >= fujitsu->max_brightness))
+	    || (level < 0 || level >= fujitsu_bl->max_brightness))
 		return -EINVAL;
 
 	if (use_alt_lcd_levels)
@@ -561,9 +557,9 @@ static ssize_t
 show_lid_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_hotkey->rfkill_supported & 0x100))
+	if (!(fujitsu_laptop->flags_supported & FLAG_LID))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_hotkey->rfkill_state & 0x100)
+	if (fujitsu_laptop->flags_state & FLAG_LID)
 		return sprintf(buf, "open\n");
 	else
 		return sprintf(buf, "closed\n");
@@ -573,9 +569,9 @@ static ssize_t
 show_dock_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_hotkey->rfkill_supported & 0x200))
+	if (!(fujitsu_laptop->flags_supported & FLAG_DOCK))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_hotkey->rfkill_state & 0x200)
+	if (fujitsu_laptop->flags_state & FLAG_DOCK)
 		return sprintf(buf, "docked\n");
 	else
 		return sprintf(buf, "undocked\n");
@@ -585,9 +581,9 @@ static ssize_t
 show_radios_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_hotkey->rfkill_supported & 0x20))
+	if (!(fujitsu_laptop->flags_supported & FLAG_RFKILL))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_hotkey->rfkill_state & 0x20)
+	if (fujitsu_laptop->flags_state & FLAG_RFKILL)
 		return sprintf(buf, "on\n");
 	else
 		return sprintf(buf, "killed\n");
@@ -601,7 +597,7 @@ static DEVICE_ATTR(lid, 0444, show_lid_state, ignore_store);
 static DEVICE_ATTR(dock, 0444, show_dock_state, ignore_store);
 static DEVICE_ATTR(radios, 0444, show_radios_state, ignore_store);
 
-static struct attribute *fujitsupf_attributes[] = {
+static struct attribute *fujitsu_pf_attributes[] = {
 	&dev_attr_brightness_changed.attr,
 	&dev_attr_max_brightness.attr,
 	&dev_attr_lcd_level.attr,
@@ -611,11 +607,11 @@ static struct attribute *fujitsupf_attributes[] = {
 	NULL
 };
 
-static struct attribute_group fujitsupf_attribute_group = {
-	.attrs = fujitsupf_attributes
+static struct attribute_group fujitsu_pf_attribute_group = {
+	.attrs = fujitsu_pf_attributes
 };
 
-static struct platform_driver fujitsupf_driver = {
+static struct platform_driver fujitsu_pf_driver = {
 	.driver = {
 		   .name = "fujitsu-laptop",
 		   }
@@ -638,29 +634,29 @@ static void __init dmi_check_cb_common(const struct dmi_system_id *id)
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
+	fujitsu_bl->keycode1 = KEY_HELP;	/* "Support" */
+	fujitsu_bl->keycode3 = KEY_SWITCHVIDEOMODE;	/* "Presentation" */
+	fujitsu_bl->keycode4 = KEY_WWW;		/* "Internet" */
 	return 1;
 }
 
-static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
+static const struct dmi_system_id fujitsu_laptop_dmi_table[] __initconst = {
 	{
 	 .ident = "Fujitsu Siemens S6410",
 	 .matches = {
@@ -687,7 +683,7 @@ static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
 
 /* ACPI device for LCD brightness control */
 
-static int acpi_fujitsu_add(struct acpi_device *device)
+static int acpi_fujitsu_bl_add(struct acpi_device *device)
 {
 	int state = 0;
 	struct input_dev *input;
@@ -696,22 +692,22 @@ static int acpi_fujitsu_add(struct acpi_device *device)
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
@@ -724,7 +720,7 @@ static int acpi_fujitsu_add(struct acpi_device *device)
 	if (error)
 		goto err_free_input_dev;
 
-	error = acpi_bus_update_power(fujitsu->acpi_handle, &state);
+	error = acpi_bus_update_power(fujitsu_bl->acpi_handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
 		goto err_unregister_input_dev;
@@ -734,7 +730,7 @@ static int acpi_fujitsu_add(struct acpi_device *device)
 	       acpi_device_name(device), acpi_device_bid(device),
 	       !device->power.state ? "on" : "off");
 
-	fujitsu->dev = device;
+	fujitsu_bl->dev = device;
 
 	if (acpi_has_method(device->handle, METHOD_NAME__INI)) {
 		vdbg_printk(FUJLAPTOP_DBG_INFO, "Invoking _INI\n");
@@ -752,7 +748,7 @@ static int acpi_fujitsu_add(struct acpi_device *device)
 		    use_alt_lcd_levels, disable_brightness_adjust);
 
 	if (get_max_brightness() <= 0)
-		fujitsu->max_brightness = FUJITSU_LCD_N_LEVELS;
+		fujitsu_bl->max_brightness = FUJITSU_LCD_N_LEVELS;
 	get_lcd_level();
 
 	return 0;
@@ -766,38 +762,38 @@ static int acpi_fujitsu_add(struct acpi_device *device)
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
-	case ACPI_FUJITSU_NOTIFY_CODE1:
+	case ACPI_FUJITSU_BL_NOTIFY_CODE1:
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
@@ -834,7 +830,7 @@ static void acpi_fujitsu_notify(struct acpi_device *device, u32 event)
 
 /* ACPI device for hotkey handling */
 
-static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
+static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 {
 	int result = 0;
 	int state = 0;
@@ -845,42 +841,42 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 	if (!device)
 		return -EINVAL;
 
-	fujitsu_hotkey->acpi_handle = device->handle;
+	fujitsu_laptop->acpi_handle = device->handle;
 	sprintf(acpi_device_name(device), "%s",
-		ACPI_FUJITSU_HOTKEY_DEVICE_NAME);
+		ACPI_FUJITSU_LAPTOP_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
-	device->driver_data = fujitsu_hotkey;
+	device->driver_data = fujitsu_laptop;
 
 	/* kfifo */
-	spin_lock_init(&fujitsu_hotkey->fifo_lock);
-	error = kfifo_alloc(&fujitsu_hotkey->fifo, RINGBUFFERSIZE * sizeof(int),
+	spin_lock_init(&fujitsu_laptop->fifo_lock);
+	error = kfifo_alloc(&fujitsu_laptop->fifo, RINGBUFFERSIZE * sizeof(int),
 			GFP_KERNEL);
 	if (error) {
 		pr_err("kfifo_alloc failed\n");
 		goto err_stop;
 	}
 
-	fujitsu_hotkey->input = input = input_allocate_device();
+	fujitsu_laptop->input = input = input_allocate_device();
 	if (!input) {
 		error = -ENOMEM;
 		goto err_free_fifo;
 	}
 
-	snprintf(fujitsu_hotkey->phys, sizeof(fujitsu_hotkey->phys),
+	snprintf(fujitsu_laptop->phys, sizeof(fujitsu_laptop->phys),
 		 "%s/video/input0", acpi_device_hid(device));
 
 	input->name = acpi_device_name(device);
-	input->phys = fujitsu_hotkey->phys;
+	input->phys = fujitsu_laptop->phys;
 	input->id.bustype = BUS_HOST;
 	input->id.product = 0x06;
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
 
@@ -888,7 +884,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 	if (error)
 		goto err_free_input_dev;
 
-	error = acpi_bus_update_power(fujitsu_hotkey->acpi_handle, &state);
+	error = acpi_bus_update_power(fujitsu_laptop->acpi_handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
 		goto err_unregister_input_dev;
@@ -898,7 +894,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 		acpi_device_name(device), acpi_device_bid(device),
 		!device->power.state ? "on" : "off");
 
-	fujitsu_hotkey->dev = device;
+	fujitsu_laptop->dev = device;
 
 	if (acpi_has_method(device->handle, METHOD_NAME__INI)) {
 		vdbg_printk(FUJLAPTOP_DBG_INFO, "Invoking _INI\n");
@@ -914,27 +910,27 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 		; /* No action, result is discarded */
 	vdbg_printk(FUJLAPTOP_DBG_INFO, "Discarded %i ringbuffer entries\n", i);
 
-	fujitsu_hotkey->rfkill_supported =
-		call_fext_func(FUNC_RFKILL, 0x0, 0x0, 0x0);
+	fujitsu_laptop->flags_supported =
+		call_fext_func(FUNC_FLAGS, 0x0, 0x0, 0x0);
 
 	/* Make sure our bitmask of supported functions is cleared if the
 	   RFKILL function block is not implemented, like on the S7020. */
-	if (fujitsu_hotkey->rfkill_supported == UNSUPPORTED_CMD)
-		fujitsu_hotkey->rfkill_supported = 0;
+	if (fujitsu_laptop->flags_supported == UNSUPPORTED_CMD)
+		fujitsu_laptop->flags_supported = 0;
 
-	if (fujitsu_hotkey->rfkill_supported)
-		fujitsu_hotkey->rfkill_state =
-			call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0);
+	if (fujitsu_laptop->flags_supported)
+		fujitsu_laptop->flags_state =
+			call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0);
 
 	/* Suspect this is a keymap of the application panel, print it */
 	pr_info("BTNI: [0x%x]\n", call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0));
 
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
-		result = led_classdev_register(&fujitsu->pf_device->dev,
+		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&logolamp_led);
 		if (result == 0) {
-			fujitsu_hotkey->logolamp_registered = 1;
+			fujitsu_laptop->logolamp_registered = 1;
 		} else {
 			pr_err("Could not register LED handler for logo lamp, error %i\n",
 			       result);
@@ -943,10 +939,10 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 
 	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
 	   (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
-		result = led_classdev_register(&fujitsu->pf_device->dev,
+		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&kblamps_led);
 		if (result == 0) {
-			fujitsu_hotkey->kblamps_registered = 1;
+			fujitsu_laptop->kblamps_registered = 1;
 		} else {
 			pr_err("Could not register LED handler for keyboard lamps, error %i\n",
 			       result);
@@ -960,10 +956,10 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 	 * that an RF LED is present.
 	 */
 	if (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) & BIT(24)) {
-		result = led_classdev_register(&fujitsu->pf_device->dev,
+		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&radio_led);
 		if (result == 0) {
-			fujitsu_hotkey->radio_led_registered = 1;
+			fujitsu_laptop->radio_led_registered = 1;
 		} else {
 			pr_err("Could not register LED handler for radio LED, error %i\n",
 			       result);
@@ -977,10 +973,10 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 	*/
 	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
 	   (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
-		result = led_classdev_register(&fujitsu->pf_device->dev,
+		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&eco_led);
 		if (result == 0) {
-			fujitsu_hotkey->eco_led_registered = 1;
+			fujitsu_laptop->eco_led_registered = 1;
 		} else {
 			pr_err("Could not register LED handler for eco LED, error %i\n",
 			       result);
@@ -996,73 +992,73 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 err_free_input_dev:
 	input_free_device(input);
 err_free_fifo:
-	kfifo_free(&fujitsu_hotkey->fifo);
+	kfifo_free(&fujitsu_laptop->fifo);
 err_stop:
 	return error;
 }
 
-static int acpi_fujitsu_hotkey_remove(struct acpi_device *device)
+static int acpi_fujitsu_laptop_remove(struct acpi_device *device)
 {
-	struct fujitsu_hotkey_t *fujitsu_hotkey = acpi_driver_data(device);
-	struct input_dev *input = fujitsu_hotkey->input;
+	struct fujitsu_laptop *fujitsu_laptop = acpi_driver_data(device);
+	struct input_dev *input = fujitsu_laptop->input;
 
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
-	if (fujitsu_hotkey->logolamp_registered)
+	if (fujitsu_laptop->logolamp_registered)
 		led_classdev_unregister(&logolamp_led);
 
-	if (fujitsu_hotkey->kblamps_registered)
+	if (fujitsu_laptop->kblamps_registered)
 		led_classdev_unregister(&kblamps_led);
 
-	if (fujitsu_hotkey->radio_led_registered)
+	if (fujitsu_laptop->radio_led_registered)
 		led_classdev_unregister(&radio_led);
 
-	if (fujitsu_hotkey->eco_led_registered)
+	if (fujitsu_laptop->eco_led_registered)
 		led_classdev_unregister(&eco_led);
 #endif
 
 	input_unregister_device(input);
 
-	kfifo_free(&fujitsu_hotkey->fifo);
+	kfifo_free(&fujitsu_laptop->fifo);
 
-	fujitsu_hotkey->acpi_handle = NULL;
+	fujitsu_laptop->acpi_handle = NULL;
 
 	return 0;
 }
 
-static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
+static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 {
 	struct input_dev *input;
 	int keycode, keycode_r;
 	unsigned int irb = 1;
 	int i, status;
 
-	input = fujitsu_hotkey->input;
+	input = fujitsu_laptop->input;
 
-	if (fujitsu_hotkey->rfkill_supported)
-		fujitsu_hotkey->rfkill_state =
-			call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0);
+	if (fujitsu_laptop->flags_supported)
+		fujitsu_laptop->flags_state =
+			call_fext_func(FUNC_FLAGS, 0x4, 0x0, 0x0);
 
 	switch (event) {
-	case ACPI_FUJITSU_NOTIFY_CODE1:
+	case ACPI_FUJITSU_BL_NOTIFY_CODE1:
 		i = 0;
 		while ((irb =
 			call_fext_func(FUNC_BUTTONS, 0x1, 0x0, 0x0)) != 0
 				&& (i++) < MAX_HOTKEY_RINGBUFFER_SIZE) {
 			switch (irb & 0x4ff) {
 			case KEY1_CODE:
-				keycode = fujitsu->keycode1;
+				keycode = fujitsu_bl->keycode1;
 				break;
 			case KEY2_CODE:
-				keycode = fujitsu->keycode2;
+				keycode = fujitsu_bl->keycode2;
 				break;
 			case KEY3_CODE:
-				keycode = fujitsu->keycode3;
+				keycode = fujitsu_bl->keycode3;
 				break;
 			case KEY4_CODE:
-				keycode = fujitsu->keycode4;
+				keycode = fujitsu_bl->keycode4;
 				break;
 			case KEY5_CODE:
-				keycode = fujitsu->keycode5;
+				keycode = fujitsu_bl->keycode5;
 				break;
 			case 0:
 				keycode = 0;
@@ -1077,10 +1073,10 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
 				vdbg_printk(FUJLAPTOP_DBG_TRACE,
 					"Push keycode into ringbuffer [%d]\n",
 					keycode);
-				status = kfifo_in_locked(&fujitsu_hotkey->fifo,
+				status = kfifo_in_locked(&fujitsu_laptop->fifo,
 						   (unsigned char *)&keycode,
 						   sizeof(keycode),
-						   &fujitsu_hotkey->fifo_lock);
+						   &fujitsu_laptop->fifo_lock);
 				if (status != sizeof(keycode)) {
 					vdbg_printk(FUJLAPTOP_DBG_WARN,
 					    "Could not push keycode [0x%x]\n",
@@ -1092,10 +1088,10 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
 			} else if (keycode == 0) {
 				while ((status =
 					kfifo_out_locked(
-					 &fujitsu_hotkey->fifo,
+					 &fujitsu_laptop->fifo,
 					 (unsigned char *) &keycode_r,
 					 sizeof(keycode_r),
-					 &fujitsu_hotkey->fifo_lock))
+					 &fujitsu_laptop->fifo_lock))
 					 == sizeof(keycode_r)) {
 					input_report_key(input, keycode_r, 0);
 					input_sync(input);
@@ -1108,10 +1104,10 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
 
 		/* On some models (first seen on the Skylake-based Lifebook
 		 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
-		 * handled in software; its state is queried using FUNC_RFKILL
+		 * handled in software; its state is queried using FUNC_FLAGS
 		 */
-		if ((fujitsu_hotkey->rfkill_supported & BIT(26)) &&
-		    (call_fext_func(FUNC_RFKILL, 0x1, 0x0, 0x0) & BIT(26))) {
+		if ((fujitsu_laptop->flags_supported & BIT(26)) &&
+		    (call_fext_func(FUNC_FLAGS, 0x1, 0x0, 0x0) & BIT(26))) {
 			keycode = KEY_TOUCHPAD_TOGGLE;
 			input_report_key(input, keycode, 1);
 			input_sync(input);
@@ -1134,63 +1130,63 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
 
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
 
-static const struct acpi_device_id fujitsu_hotkey_device_ids[] = {
-	{ACPI_FUJITSU_HOTKEY_HID, 0},
+static const struct acpi_device_id fujitsu_laptop_device_ids[] = {
+	{ACPI_FUJITSU_LAPTOP_HID, 0},
 	{"", 0},
 };
 
-static struct acpi_driver acpi_fujitsu_hotkey_driver = {
-	.name = ACPI_FUJITSU_HOTKEY_DRIVER_NAME,
+static struct acpi_driver acpi_fujitsu_laptop_driver = {
+	.name = ACPI_FUJITSU_LAPTOP_DRIVER_NAME,
 	.class = ACPI_FUJITSU_CLASS,
-	.ids = fujitsu_hotkey_device_ids,
+	.ids = fujitsu_laptop_device_ids,
 	.ops = {
-		.add = acpi_fujitsu_hotkey_add,
-		.remove = acpi_fujitsu_hotkey_remove,
-		.notify = acpi_fujitsu_hotkey_notify,
+		.add = acpi_fujitsu_laptop_add,
+		.remove = acpi_fujitsu_laptop_remove,
+		.notify = acpi_fujitsu_laptop_notify,
 		},
 };
 
 static const struct acpi_device_id fujitsu_ids[] __used = {
-	{ACPI_FUJITSU_HID, 0},
-	{ACPI_FUJITSU_HOTKEY_HID, 0},
+	{ACPI_FUJITSU_LAPTOP_HID, 0},
+	{ACPI_FUJITSU_BL_HID, 0},
 	{"", 0}
 };
 MODULE_DEVICE_TABLE(acpi, fujitsu_ids);
 
 static int __init fujitsu_init(void)
 {
-	int ret, result, max_brightness;
+	int ret, result;
 
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
-	dmi_check_system(fujitsu_dmi_table);
-
-	result = acpi_bus_register_driver(&acpi_fujitsu_driver);
+	fujitsu_bl->keycode1 = KEY_PROG1;
+	fujitsu_bl->keycode2 = KEY_PROG2;
+	fujitsu_bl->keycode3 = KEY_PROG3;
+	fujitsu_bl->keycode4 = KEY_PROG4;
+	fujitsu_bl->keycode5 = KEY_RFKILL;
+	dmi_check_system(fujitsu_laptop_dmi_table);
+
+	result = acpi_bus_register_driver(&acpi_fujitsu_bl_driver);
 	if (result < 0) {
 		ret = -ENODEV;
 		goto fail_acpi;
@@ -1198,19 +1194,19 @@ static int __init fujitsu_init(void)
 
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
-			       &fujitsupf_attribute_group);
+	    sysfs_create_group(&fujitsu_bl->pf_device->dev.kobj,
+			       &fujitsu_pf_attribute_group);
 	if (ret)
 		goto fail_platform_device2;
 
@@ -1220,90 +1216,89 @@ static int __init fujitsu_init(void)
 		struct backlight_properties props;
 
 		memset(&props, 0, sizeof(struct backlight_properties));
-		max_brightness = fujitsu->max_brightness;
 		props.type = BACKLIGHT_PLATFORM;
-		props.max_brightness = max_brightness - 1;
-		fujitsu->bl_device = backlight_device_register("fujitsu-laptop",
-							       NULL, NULL,
-							       &fujitsubl_ops,
-							       &props);
-		if (IS_ERR(fujitsu->bl_device)) {
-			ret = PTR_ERR(fujitsu->bl_device);
-			fujitsu->bl_device = NULL;
+		props.max_brightness = fujitsu_bl->max_brightness - 1;
+		fujitsu_bl->bl_device = backlight_device_register("fujitsu-laptop",
+							         NULL, NULL,
+							         &fujitsubl_ops,
+							         &props);
+		if (IS_ERR(fujitsu_bl->bl_device)) {
+			ret = PTR_ERR(fujitsu_bl->bl_device);
+			fujitsu_bl->bl_device = NULL;
 			goto fail_sysfs_group;
 		}
-		fujitsu->bl_device->props.brightness = fujitsu->brightness_level;
+		fujitsu_bl->bl_device->props.brightness = fujitsu_bl->brightness_level;
 	}
 
-	ret = platform_driver_register(&fujitsupf_driver);
+	ret = platform_driver_register(&fujitsu_pf_driver);
 	if (ret)
 		goto fail_backlight;
 
-	/* Register hotkey driver */
+	/* Register laptop driver */
 
-	fujitsu_hotkey = kzalloc(sizeof(struct fujitsu_hotkey_t), GFP_KERNEL);
-	if (!fujitsu_hotkey) {
+	fujitsu_laptop = kzalloc(sizeof(struct fujitsu_laptop), GFP_KERNEL);
+	if (!fujitsu_laptop) {
 		ret = -ENOMEM;
-		goto fail_hotkey;
+		goto fail_laptop;
 	}
 
-	result = acpi_bus_register_driver(&acpi_fujitsu_hotkey_driver);
+	result = acpi_bus_register_driver(&acpi_fujitsu_laptop_driver);
 	if (result < 0) {
 		ret = -ENODEV;
-		goto fail_hotkey1;
+		goto fail_laptop1;
 	}
 
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
 
 	return 0;
 
-fail_hotkey1:
-	kfree(fujitsu_hotkey);
-fail_hotkey:
-	platform_driver_unregister(&fujitsupf_driver);
+fail_laptop1:
+	kfree(fujitsu_laptop);
+fail_laptop:
+	platform_driver_unregister(&fujitsu_pf_driver);
 fail_backlight:
-	backlight_device_unregister(fujitsu->bl_device);
+	backlight_device_unregister(fujitsu_bl->bl_device);
 fail_sysfs_group:
-	sysfs_remove_group(&fujitsu->pf_device->dev.kobj,
-			   &fujitsupf_attribute_group);
+	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
+			   &fujitsu_pf_attribute_group);
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
 
 static void __exit fujitsu_cleanup(void)
 {
-	acpi_bus_unregister_driver(&acpi_fujitsu_hotkey_driver);
+	acpi_bus_unregister_driver(&acpi_fujitsu_laptop_driver);
 
-	kfree(fujitsu_hotkey);
+	kfree(fujitsu_laptop);
 
-	platform_driver_unregister(&fujitsupf_driver);
+	platform_driver_unregister(&fujitsu_pf_driver);
 
-	backlight_device_unregister(fujitsu->bl_device);
+	backlight_device_unregister(fujitsu_bl->bl_device);
 
-	sysfs_remove_group(&fujitsu->pf_device->dev.kobj,
-			   &fujitsupf_attribute_group);
+	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
+			   &fujitsu_pf_attribute_group);
 
-	platform_device_unregister(fujitsu->pf_device);
+	platform_device_unregister(fujitsu_bl->pf_device);
 
-	acpi_bus_unregister_driver(&acpi_fujitsu_driver);
+	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
 
-	kfree(fujitsu);
+	kfree(fujitsu_bl);
 
 	pr_info("driver unloaded\n");
 }
-- 
2.8.2
