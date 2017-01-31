From: Jonathan Woithe <jwoithe@just42.net>
Subject: [PATCH 2/4][RFC v2] fujitsu-laptop: fujitsu-laptop: restructure
 initialisation
Date: Tue, 31 Jan 2017 23:39:04 +1030
Message-ID: <20170131130904.GC6218@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:52682 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751882AbdAaNJM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Jan 2017 08:09:12 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kernel@kempniu.pl
Cc: platform-driver-x86@vger.kernel.org

Don't register backlight and platform devices on non-fujitsu hardware
 - bail out instead.

Register the backlight driver _after_ the main acpi driver.  The
backlight device needs the main device in order to get and set its power
state. This also allows us to move the keycodes and platform device from
"struct fujitsu_bl" to the main "struct fujitsu".

Similarly, the platform device interface is now exported to userspace
_after_ the acpi devices have been initialized.  This closes a gap
during initialization where userspace would read undefined values,
and where writes from userspace might provoke undefined behaviour.

While we're at it, make sure the platform driver is registered before
the platform device.

Also replace kmalloc() + memset() with kzalloc().

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Signed-off-by: Jonathan Woithe <jwoithe@just42.net>
---
 drivers/platform/x86/fujitsu-laptop.c | 222 +++++++++++++++-------------------
 1 file changed, 98 insertions(+), 124 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index a3752bb..c410047 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -146,9 +146,6 @@ struct fujitsu_bl {
 	struct input_dev *input;
 	char phys[32];
 	struct backlight_device *bl_device;
-	struct platform_device *pf_device;
-	int keycode1, keycode2, keycode3, keycode4, keycode5;
-
 	unsigned int max_brightness;
 	unsigned int brightness_changed;
 	unsigned int brightness_level;
@@ -167,7 +164,8 @@ struct fujitsu_laptop {
 	struct platform_device *pf_device;
 	struct kfifo fifo;
 	spinlock_t fifo_lock;
-        int flags_supported;
+	int keycode1, keycode2, keycode3, keycode4, keycode5;
+	int flags_supported;
         int flags_state;
 	int logolamp_registered;
 	int kblamps_registered;
@@ -634,25 +632,25 @@ static void __init dmi_check_cb_common(const struct dmi_system_id *id)
 static int __init dmi_check_cb_s6410(const struct dmi_system_id *id)
 {
 	dmi_check_cb_common(id);
-	fujitsu_bl->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
-	fujitsu_bl->keycode2 = KEY_HELP;	/* "Mobility Center" */
+	fujitsu_laptop->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
+	fujitsu_laptop->keycode2 = KEY_HELP;		/* "Mobility Center" */
 	return 1;
 }
 
 static int __init dmi_check_cb_s6420(const struct dmi_system_id *id)
 {
 	dmi_check_cb_common(id);
-	fujitsu_bl->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
-	fujitsu_bl->keycode2 = KEY_HELP;	/* "Mobility Center" */
+	fujitsu_laptop->keycode1 = KEY_SCREENLOCK;	/* "Lock" */
+	fujitsu_laptop->keycode2 = KEY_HELP;		/* "Mobility Center" */
 	return 1;
 }
 
 static int __init dmi_check_cb_p8010(const struct dmi_system_id *id)
 {
 	dmi_check_cb_common(id);
-	fujitsu_bl->keycode1 = KEY_HELP;	/* "Support" */
-	fujitsu_bl->keycode3 = KEY_SWITCHVIDEOMODE;	/* "Presentation" */
-	fujitsu_bl->keycode4 = KEY_WWW;		/* "Internet" */
+	fujitsu_laptop->keycode1 = KEY_HELP;		/* "Support" */
+	fujitsu_laptop->keycode3 = KEY_SWITCHVIDEOMODE;	/* "Presentation" */
+	fujitsu_laptop->keycode4 = KEY_WWW;		/* "Internet" */
 	return 1;
 }
 
@@ -685,6 +683,7 @@ static const struct dmi_system_id fujitsu_laptop_dmi_table[] __initconst = {
 
 static int acpi_fujitsu_bl_add(struct acpi_device *device)
 {
+	int result = 0;
 	int state = 0;
 	struct input_dev *input;
 	int error;
@@ -692,6 +691,9 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	if (!device)
 		return -EINVAL;
 
+	fujitsu_bl = kzalloc(sizeof(struct fujitsu_bl), GFP_KERNEL);
+	if (!fujitsu_bl)
+		return -ENOMEM;
 	fujitsu_bl->acpi_handle = device->handle;
 	sprintf(acpi_device_name(device), "%s", ACPI_FUJITSU_BL_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
@@ -700,7 +702,7 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 	fujitsu_bl->input = input = input_allocate_device();
 	if (!input) {
 		error = -ENOMEM;
-		goto err_stop;
+		goto err_free;
 	}
 
 	snprintf(fujitsu_bl->phys, sizeof(fujitsu_bl->phys),
@@ -751,14 +753,35 @@ static int acpi_fujitsu_bl_add(struct acpi_device *device)
 		fujitsu_bl->max_brightness = FUJITSU_LCD_N_LEVELS;
 	get_lcd_level();
 
-	return 0;
+	/* Register backlight stuff */
+
+	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+		struct backlight_properties props;
+
+		memset(&props, 0, sizeof(struct backlight_properties));
+		props.type = BACKLIGHT_PLATFORM;
+		props.max_brightness = fujitsu_bl->max_brightness - 1;
+		fujitsu_bl->bl_device = backlight_device_register("fujitsu-laptop",
+							         NULL, NULL,
+							         &fujitsubl_ops,
+							         &props);
+		if (IS_ERR(fujitsu_bl->bl_device)) {
+			result = PTR_ERR(fujitsu_bl->bl_device);
+			fujitsu_bl->bl_device = NULL;
+			goto err_unregister_input_dev;
+		}
+		fujitsu_bl->bl_device->props.brightness = fujitsu_bl->brightness_level;
+	}
+
+	return result;
 
 err_unregister_input_dev:
 	input_unregister_device(input);
 	input = NULL;
 err_free_input_dev:
 	input_free_device(input);
-err_stop:
+err_free:
+	kfree(fujitsu_bl);
 	return error;
 }
 
@@ -767,9 +790,13 @@ static int acpi_fujitsu_bl_remove(struct acpi_device *device)
 	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
 	struct input_dev *input = fujitsu_bl->input;
 
+	if (fujitsu_bl->bl_device)
+		backlight_device_unregister(fujitsu_bl->bl_device);
+
 	input_unregister_device(input);
 
-	fujitsu_bl->acpi_handle = NULL;
+	kfree(fujitsu_bl);
+	fujitsu_bl = NULL;
 
 	return 0;
 }
@@ -841,19 +868,28 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (!device)
 		return -EINVAL;
 
+	fujitsu_laptop = kzalloc(sizeof(struct fujitsu_laptop), GFP_KERNEL);
+	if (!fujitsu_laptop)
+		return -ENOMEM;
 	fujitsu_laptop->acpi_handle = device->handle;
 	sprintf(acpi_device_name(device), "%s",
 		ACPI_FUJITSU_LAPTOP_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
 	device->driver_data = fujitsu_laptop;
 
+	fujitsu_laptop->keycode1 = KEY_PROG1;
+	fujitsu_laptop->keycode2 = KEY_PROG2;
+	fujitsu_laptop->keycode3 = KEY_PROG3;
+	fujitsu_laptop->keycode4 = KEY_PROG4;
+	dmi_check_system(fujitsu_laptop_dmi_table);
+
 	/* kfifo */
 	spin_lock_init(&fujitsu_laptop->fifo_lock);
 	error = kfifo_alloc(&fujitsu_laptop->fifo, RINGBUFFERSIZE * sizeof(int),
 			GFP_KERNEL);
 	if (error) {
 		pr_err("kfifo_alloc failed\n");
-		goto err_stop;
+		goto err_free;
 	}
 
 	fujitsu_laptop->input = input = input_allocate_device();
@@ -872,11 +908,11 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	input->dev.parent = &device->dev;
 
 	set_bit(EV_KEY, input->evbit);
-	set_bit(fujitsu_bl->keycode1, input->keybit);
-	set_bit(fujitsu_bl->keycode2, input->keybit);
-	set_bit(fujitsu_bl->keycode3, input->keybit);
-	set_bit(fujitsu_bl->keycode4, input->keybit);
-	set_bit(fujitsu_bl->keycode5, input->keybit);
+	set_bit(fujitsu_laptop->keycode1, input->keybit);
+	set_bit(fujitsu_laptop->keycode2, input->keybit);
+	set_bit(fujitsu_laptop->keycode3, input->keybit);
+	set_bit(fujitsu_laptop->keycode4, input->keybit);
+	set_bit(fujitsu_laptop->keycode5, input->keybit);
 	set_bit(KEY_TOUCHPAD_TOGGLE, input->keybit);
 	set_bit(KEY_UNKNOWN, input->keybit);
 
@@ -927,7 +963,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 #if IS_ENABLED(CONFIG_LEDS_CLASS)
 	if (call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & LOGOLAMP_POWERON) {
-		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
+		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
 						&logolamp_led);
 		if (result == 0) {
 			fujitsu_laptop->logolamp_registered = 1;
@@ -939,7 +975,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
 	   (call_fext_func(FUNC_BUTTONS, 0x0, 0x0, 0x0) == 0x0)) {
-		result = led_classdev_register(&fujitsu_bl->pf_device->dev,
+		result = led_classdev_register(&fujitsu_laptop->pf_device->dev,
 						&kblamps_led);
 		if (result == 0) {
 			fujitsu_laptop->kblamps_registered = 1;
@@ -993,7 +1029,8 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	input_free_device(input);
 err_free_fifo:
 	kfifo_free(&fujitsu_laptop->fifo);
-err_stop:
+err_free:
+	kfree(fujitsu_laptop);
 	return error;
 }
 
@@ -1020,7 +1057,8 @@ static int acpi_fujitsu_laptop_remove(struct acpi_device *device)
 
 	kfifo_free(&fujitsu_laptop->fifo);
 
-	fujitsu_laptop->acpi_handle = NULL;
+	kfree(fujitsu_laptop);
+	fujitsu_laptop = NULL;
 
 	return 0;
 }
@@ -1046,19 +1084,19 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 				&& (i++) < MAX_HOTKEY_RINGBUFFER_SIZE) {
 			switch (irb & 0x4ff) {
 			case KEY1_CODE:
-				keycode = fujitsu_bl->keycode1;
+				keycode = fujitsu_laptop->keycode1;
 				break;
 			case KEY2_CODE:
-				keycode = fujitsu_bl->keycode2;
+				keycode = fujitsu_laptop->keycode2;
 				break;
 			case KEY3_CODE:
-				keycode = fujitsu_bl->keycode3;
+				keycode = fujitsu_laptop->keycode3;
 				break;
 			case KEY4_CODE:
-				keycode = fujitsu_bl->keycode4;
+				keycode = fujitsu_laptop->keycode4;
 				break;
 			case KEY5_CODE:
-				keycode = fujitsu_bl->keycode5;
+				keycode = fujitsu_laptop->keycode5;
 				break;
 			case 0:
 				keycode = 0;
@@ -1171,134 +1209,70 @@ MODULE_DEVICE_TABLE(acpi, fujitsu_ids);
 
 static int __init fujitsu_init(void)
 {
-	int ret, result;
+	int ret;
 
 	if (acpi_disabled)
 		return -ENODEV;
 
-	fujitsu_bl = kzalloc(sizeof(struct fujitsu_bl), GFP_KERNEL);
-	if (!fujitsu_bl)
-		return -ENOMEM;
-	fujitsu_bl->keycode1 = KEY_PROG1;
-	fujitsu_bl->keycode2 = KEY_PROG2;
-	fujitsu_bl->keycode3 = KEY_PROG3;
-	fujitsu_bl->keycode4 = KEY_PROG4;
-	fujitsu_bl->keycode5 = KEY_RFKILL;
-	dmi_check_system(fujitsu_laptop_dmi_table);
-
-	result = acpi_bus_register_driver(&acpi_fujitsu_bl_driver);
-	if (result < 0) {
+	ret = acpi_bus_register_driver(&acpi_fujitsu_laptop_driver);
+	if (ret < 0)
+		goto err_stop;
+	if (!fujitsu_laptop) {
 		ret = -ENODEV;
-		goto fail_acpi;
+		goto err_unregister_acpi1;
 	}
 
 	/* Register platform stuff */
 
-	fujitsu_bl->pf_device = platform_device_alloc("fujitsu-laptop", -1);
-	if (!fujitsu_bl->pf_device) {
-		ret = -ENOMEM;
-		goto fail_platform_driver;
-	}
-
-	ret = platform_device_add(fujitsu_bl->pf_device);
-	if (ret)
-		goto fail_platform_device1;
-
-	ret =
-	    sysfs_create_group(&fujitsu_bl->pf_device->dev.kobj,
-			       &fujitsu_pf_attribute_group);
-	if (ret)
-		goto fail_platform_device2;
-
-	/* Register backlight stuff */
-
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		struct backlight_properties props;
-
-		memset(&props, 0, sizeof(struct backlight_properties));
-		props.type = BACKLIGHT_PLATFORM;
-		props.max_brightness = fujitsu_bl->max_brightness - 1;
-		fujitsu_bl->bl_device = backlight_device_register("fujitsu-laptop",
-							         NULL, NULL,
-							         &fujitsubl_ops,
-							         &props);
-		if (IS_ERR(fujitsu_bl->bl_device)) {
-			ret = PTR_ERR(fujitsu_bl->bl_device);
-			fujitsu_bl->bl_device = NULL;
-			goto fail_sysfs_group;
-		}
-		fujitsu_bl->bl_device->props.brightness = fujitsu_bl->brightness_level;
-	}
-
 	ret = platform_driver_register(&fujitsu_pf_driver);
 	if (ret)
-		goto fail_backlight;
+		goto err_unregister_acpi2;
 
-	/* Register laptop driver */
-
-	fujitsu_laptop = kzalloc(sizeof(struct fujitsu_laptop), GFP_KERNEL);
-	if (!fujitsu_laptop) {
+	fujitsu_laptop->pf_device = platform_device_alloc("fujitsu-laptop", -1);
+	if (!fujitsu_laptop->pf_device) {
 		ret = -ENOMEM;
-		goto fail_laptop;
-	}
-
-	result = acpi_bus_register_driver(&acpi_fujitsu_laptop_driver);
-	if (result < 0) {
-		ret = -ENODEV;
-		goto fail_laptop1;
+		goto err_free_platform_driver;
 	}
+	ret = platform_device_add(fujitsu_laptop->pf_device);
+	if (ret)
+		goto err_free_platform_device1;
 
-	/* Sync backlight power status (needs FUJ02E3 device, hence deferred) */
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
-		if (call_fext_func(FUNC_BACKLIGHT, 0x2, 0x4, 0x0) == 3)
-			fujitsu_bl->bl_device->props.power = FB_BLANK_POWERDOWN;
-		else
-			fujitsu_bl->bl_device->props.power = FB_BLANK_UNBLANK;
-	}
+	ret = sysfs_create_group(&fujitsu_laptop->pf_device->dev.kobj,
+				 &fujitsu_pf_attribute_group);
+	if (ret)
+		goto err_free_platform_device2;
 
 	pr_info("driver " FUJITSU_DRIVER_VERSION " successfully loaded\n");
 
 	return 0;
 
-fail_laptop1:
-	kfree(fujitsu_laptop);
-fail_laptop:
+err_free_platform_device2:
+	platform_device_del(fujitsu_laptop->pf_device);
+err_free_platform_device1:
+	platform_device_put(fujitsu_laptop->pf_device);
+err_free_platform_driver:
 	platform_driver_unregister(&fujitsu_pf_driver);
-fail_backlight:
-	backlight_device_unregister(fujitsu_bl->bl_device);
-fail_sysfs_group:
-	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
-			   &fujitsu_pf_attribute_group);
-fail_platform_device2:
-	platform_device_del(fujitsu_bl->pf_device);
-fail_platform_device1:
-	platform_device_put(fujitsu_bl->pf_device);
-fail_platform_driver:
+err_unregister_acpi2:
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
-fail_acpi:
-	kfree(fujitsu_bl);
+err_unregister_acpi1:
+	acpi_bus_unregister_driver(&acpi_fujitsu_laptop_driver);
+err_stop:
 
 	return ret;
 }
 
 static void __exit fujitsu_cleanup(void)
 {
-	acpi_bus_unregister_driver(&acpi_fujitsu_laptop_driver);
-
-	kfree(fujitsu_laptop);
+	platform_device_unregister(fujitsu_laptop->pf_device);
 
-	platform_driver_unregister(&fujitsu_pf_driver);
-
-	backlight_device_unregister(fujitsu_bl->bl_device);
-
-	sysfs_remove_group(&fujitsu_bl->pf_device->dev.kobj,
+	sysfs_remove_group(&fujitsu_laptop->pf_device->dev.kobj,
 			   &fujitsu_pf_attribute_group);
 
-	platform_device_unregister(fujitsu_bl->pf_device);
+	platform_driver_unregister(&fujitsu_pf_driver);
 
 	acpi_bus_unregister_driver(&acpi_fujitsu_bl_driver);
 
-	kfree(fujitsu_bl);
+	acpi_bus_unregister_driver(&acpi_fujitsu_laptop_driver);
 
 	pr_info("driver unloaded\n");
 }
-- 
2.8.2
