From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 02/10] platform/x86: fujitsu-laptop: replace "hotkey" with "laptop" in symbol names
Date: Wed,  8 Feb 2017 14:46:25 +0100
Message-ID: <20170208134633.5152-3-kernel@kempniu.pl>
References: <20170208134633.5152-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34421 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753007AbdBHOtm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2017 09:49:42 -0500
Received: by mail-lf0-f65.google.com with SMTP id q89so9551398lfi.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Feb 2017 06:49:41 -0800 (PST)
In-Reply-To: <20170208134633.5152-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>

Functions, structures, variables and constants whose names currently
contain the "hotkey" keyword are not only responsible for handling
hotkeys, but also other laptop-related features (rfkill, lid, dock,
LEDs).  Fix their naming by using a consistent "_laptop"/"_LAPTOP"
suffix/infix.  Update comments so that they reflect this change.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
[kempniu: rebase patch, rewrite commit message]
Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 158 +++++++++++++++++-----------------
 1 file changed, 79 insertions(+), 79 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index e1737b9d9d95..70124004b346 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -82,9 +82,9 @@
 #define ACPI_FUJITSU_BL_HID		"FUJ02B1"
 #define ACPI_FUJITSU_BL_DRIVER_NAME	"Fujitsu laptop FUJ02B1 ACPI brightness driver"
 #define ACPI_FUJITSU_BL_DEVICE_NAME	"Fujitsu FUJ02B1"
-#define ACPI_FUJITSU_HOTKEY_HID 	"FUJ02E3"
-#define ACPI_FUJITSU_HOTKEY_DRIVER_NAME "Fujitsu laptop FUJ02E3 ACPI hotkeys driver"
-#define ACPI_FUJITSU_HOTKEY_DEVICE_NAME "Fujitsu FUJ02E3"
+#define ACPI_FUJITSU_LAPTOP_HID		"FUJ02E3"
+#define ACPI_FUJITSU_LAPTOP_DRIVER_NAME	"Fujitsu laptop FUJ02E3 ACPI hotkeys driver"
+#define ACPI_FUJITSU_LAPTOP_DEVICE_NAME	"Fujitsu FUJ02E3"
 
 #define ACPI_FUJITSU_NOTIFY_CODE1     0x80
 
@@ -154,8 +154,8 @@ static struct fujitsu_bl *fujitsu_bl;
 static int use_alt_lcd_levels = -1;
 static int disable_brightness_adjust = -1;
 
-/* Device used to access other hotkeys on the laptop */
-struct fujitsu_hotkey_t {
+/* Device used to access hotkeys and other features on the laptop */
+struct fujitsu_laptop {
 	acpi_handle acpi_handle;
 	struct acpi_device *dev;
 	struct input_dev *input;
@@ -171,9 +171,9 @@ struct fujitsu_hotkey_t {
 	int eco_led_registered;
 };
 
-static struct fujitsu_hotkey_t *fujitsu_hotkey;
+static struct fujitsu_laptop *fujitsu_laptop;
 
-static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event);
+static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event);
 
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 static enum led_brightness logolamp_get(struct led_classdev *cdev);
@@ -239,7 +239,7 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
 	unsigned long long value;
 	acpi_handle handle = NULL;
 
-	status = acpi_get_handle(fujitsu_hotkey->acpi_handle, "FUNC", &handle);
+	status = acpi_get_handle(fujitsu_laptop->acpi_handle, "FUNC", &handle);
 	if (ACPI_FAILURE(status)) {
 		vdbg_printk(FUJLAPTOP_DBG_ERROR,
 				"FUNC interface is not present\n");
@@ -567,9 +567,9 @@ static ssize_t
 show_lid_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_hotkey->rfkill_supported & 0x100))
+	if (!(fujitsu_laptop->rfkill_supported & 0x100))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_hotkey->rfkill_state & 0x100)
+	if (fujitsu_laptop->rfkill_state & 0x100)
 		return sprintf(buf, "open\n");
 	else
 		return sprintf(buf, "closed\n");
@@ -579,9 +579,9 @@ static ssize_t
 show_dock_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_hotkey->rfkill_supported & 0x200))
+	if (!(fujitsu_laptop->rfkill_supported & 0x200))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_hotkey->rfkill_state & 0x200)
+	if (fujitsu_laptop->rfkill_state & 0x200)
 		return sprintf(buf, "docked\n");
 	else
 		return sprintf(buf, "undocked\n");
@@ -591,9 +591,9 @@ static ssize_t
 show_radios_state(struct device *dev,
 			struct device_attribute *attr, char *buf)
 {
-	if (!(fujitsu_hotkey->rfkill_supported & 0x20))
+	if (!(fujitsu_laptop->rfkill_supported & 0x20))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_hotkey->rfkill_state & 0x20)
+	if (fujitsu_laptop->rfkill_state & 0x20)
 		return sprintf(buf, "on\n");
 	else
 		return sprintf(buf, "killed\n");
@@ -840,7 +840,7 @@ static void acpi_fujitsu_bl_notify(struct acpi_device *device, u32 event)
 
 /* ACPI device for hotkey handling */
 
-static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
+static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 {
 	int result = 0;
 	int state = 0;
@@ -851,32 +851,32 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
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
@@ -894,7 +894,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 	if (error)
 		goto err_free_input_dev;
 
-	error = acpi_bus_update_power(fujitsu_hotkey->acpi_handle, &state);
+	error = acpi_bus_update_power(fujitsu_laptop->acpi_handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
 		goto err_unregister_input_dev;
@@ -904,7 +904,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 		acpi_device_name(device), acpi_device_bid(device),
 		!device->power.state ? "on" : "off");
 
-	fujitsu_hotkey->dev = device;
+	fujitsu_laptop->dev = device;
 
 	if (acpi_has_method(device->handle, METHOD_NAME__INI)) {
 		vdbg_printk(FUJLAPTOP_DBG_INFO, "Invoking _INI\n");
@@ -920,16 +920,16 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 		; /* No action, result is discarded */
 	vdbg_printk(FUJLAPTOP_DBG_INFO, "Discarded %i ringbuffer entries\n", i);
 
-	fujitsu_hotkey->rfkill_supported =
+	fujitsu_laptop->rfkill_supported =
 		call_fext_func(FUNC_RFKILL, 0x0, 0x0, 0x0);
 
 	/* Make sure our bitmask of supported functions is cleared if the
 	   RFKILL function block is not implemented, like on the S7020. */
-	if (fujitsu_hotkey->rfkill_supported == UNSUPPORTED_CMD)
-		fujitsu_hotkey->rfkill_supported = 0;
+	if (fujitsu_laptop->rfkill_supported == UNSUPPORTED_CMD)
+		fujitsu_laptop->rfkill_supported = 0;
 
-	if (fujitsu_hotkey->rfkill_supported)
-		fujitsu_hotkey->rfkill_state =
+	if (fujitsu_laptop->rfkill_supported)
+		fujitsu_laptop->rfkill_state =
 			call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0);
 
 	/* Suspect this is a keymap of the application panel, print it */
@@ -940,7 +940,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&logolamp_led);
 		if (result == 0) {
-			fujitsu_hotkey->logolamp_registered = 1;
+			fujitsu_laptop->logolamp_registered = 1;
 		} else {
 			pr_err("Could not register LED handler for logo lamp, error %i\n",
 			       result);
@@ -952,7 +952,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&kblamps_led);
 		if (result == 0) {
-			fujitsu_hotkey->kblamps_registered = 1;
+			fujitsu_laptop->kblamps_registered = 1;
 		} else {
 			pr_err("Could not register LED handler for keyboard lamps, error %i\n",
 			       result);
@@ -969,7 +969,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&radio_led);
 		if (result == 0) {
-			fujitsu_hotkey->radio_led_registered = 1;
+			fujitsu_laptop->radio_led_registered = 1;
 		} else {
 			pr_err("Could not register LED handler for radio LED, error %i\n",
 			       result);
@@ -986,7 +986,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
 		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
 						&eco_led);
 		if (result == 0) {
-			fujitsu_hotkey->eco_led_registered = 1;
+			fujitsu_laptop->eco_led_registered = 1;
 		} else {
 			pr_err("Could not register LED handler for eco LED, error %i\n",
 			       result);
@@ -1002,47 +1002,47 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
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
 
-static void acpi_fujitsu_hotkey_press(int keycode)
+static void acpi_fujitsu_laptop_press(int keycode)
 {
-	struct input_dev *input = fujitsu_hotkey->input;
+	struct input_dev *input = fujitsu_laptop->input;
 	int status;
 
-	status = kfifo_in_locked(&fujitsu_hotkey->fifo,
+	status = kfifo_in_locked(&fujitsu_laptop->fifo,
 				 (unsigned char *)&keycode, sizeof(keycode),
-				 &fujitsu_hotkey->fifo_lock);
+				 &fujitsu_laptop->fifo_lock);
 	if (status != sizeof(keycode)) {
 		vdbg_printk(FUJLAPTOP_DBG_WARN,
 			    "Could not push keycode [0x%x]\n", keycode);
@@ -1054,16 +1054,16 @@ static void acpi_fujitsu_hotkey_press(int keycode)
 		    "Push keycode into ringbuffer [%d]\n", keycode);
 }
 
-static void acpi_fujitsu_hotkey_release(void)
+static void acpi_fujitsu_laptop_release(void)
 {
-	struct input_dev *input = fujitsu_hotkey->input;
+	struct input_dev *input = fujitsu_laptop->input;
 	int keycode, status;
 
 	while (true) {
-		status = kfifo_out_locked(&fujitsu_hotkey->fifo,
+		status = kfifo_out_locked(&fujitsu_laptop->fifo,
 					  (unsigned char *)&keycode,
 					  sizeof(keycode),
-					  &fujitsu_hotkey->fifo_lock);
+					  &fujitsu_laptop->fifo_lock);
 		if (status != sizeof(keycode))
 			return;
 		input_report_key(input, keycode, 0);
@@ -1073,14 +1073,14 @@ static void acpi_fujitsu_hotkey_release(void)
 	}
 }
 
-static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
+static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 {
 	struct input_dev *input;
 	int keycode;
 	unsigned int irb = 1;
 	int i;
 
-	input = fujitsu_hotkey->input;
+	input = fujitsu_laptop->input;
 
 	if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
 		keycode = KEY_UNKNOWN;
@@ -1093,8 +1093,8 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
 		return;
 	}
 
-	if (fujitsu_hotkey->rfkill_supported)
-		fujitsu_hotkey->rfkill_state =
+	if (fujitsu_laptop->rfkill_supported)
+		fujitsu_laptop->rfkill_state =
 			call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0);
 
 	i = 0;
@@ -1128,16 +1128,16 @@ static void acpi_fujitsu_hotkey_notify(struct acpi_device *device, u32 event)
 		}
 
 		if (keycode > 0)
-			acpi_fujitsu_hotkey_press(keycode);
+			acpi_fujitsu_laptop_press(keycode);
 		else if (keycode == 0)
-			acpi_fujitsu_hotkey_release();
+			acpi_fujitsu_laptop_release();
 	}
 
 	/* On some models (first seen on the Skylake-based Lifebook
 	 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
 	 * handled in software; its state is queried using FUNC_RFKILL
 	 */
-	if ((fujitsu_hotkey->rfkill_supported & BIT(26)) &&
+	if ((fujitsu_laptop->rfkill_supported & BIT(26)) &&
 	    (call_fext_func(FUNC_RFKILL, 0x1, 0x0, 0x0) & BIT(26))) {
 		keycode = KEY_TOUCHPAD_TOGGLE;
 		input_report_key(input, keycode, 1);
@@ -1166,25 +1166,25 @@ static struct acpi_driver acpi_fujitsu_bl_driver = {
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
 	{ACPI_FUJITSU_BL_HID, 0},
-	{ACPI_FUJITSU_HOTKEY_HID, 0},
+	{ACPI_FUJITSU_LAPTOP_HID, 0},
 	{"", 0}
 };
 MODULE_DEVICE_TABLE(acpi, fujitsu_ids);
@@ -1255,18 +1255,18 @@ static int __init fujitsu_init(void)
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
@@ -1281,9 +1281,9 @@ static int __init fujitsu_init(void)
 
 	return 0;
 
-fail_hotkey1:
-	kfree(fujitsu_hotkey);
-fail_hotkey:
+fail_laptop1:
+	kfree(fujitsu_laptop);
+fail_laptop:
 	platform_driver_unregister(&fujitsupf_driver);
 fail_backlight:
 	backlight_device_unregister(fujitsu_bl->bl_device);
@@ -1304,9 +1304,9 @@ static int __init fujitsu_init(void)
 
 static void __exit fujitsu_cleanup(void)
 {
-	acpi_bus_unregister_driver(&acpi_fujitsu_hotkey_driver);
+	acpi_bus_unregister_driver(&acpi_fujitsu_laptop_driver);
 
-	kfree(fujitsu_hotkey);
+	kfree(fujitsu_laptop);
 
 	platform_driver_unregister(&fujitsupf_driver);
 
-- 
2.11.1
