From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 10/10] platform/x86: fujitsu-laptop: use device-specific data in remaining module code
Date: Mon, 24 Apr 2017 15:33:34 +0200
Message-ID: <20170424133334.7064-11-kernel@kempniu.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33730 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1171013AbdDXNdt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 09:33:49 -0400
Received: by mail-lf0-f68.google.com with SMTP id 88so16555700lfr.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Apr 2017 06:33:47 -0700 (PDT)
In-Reply-To: <20170424133334.7064-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

To prevent using module-wide data in remaining module code, employ
acpi_driver_data() and dev_get_drvdata() to fetch device-specific data
to work on in each function.  This makes the input local variables in
hotkey-related callbacks redundant, so remove them.  Remove the
module-wide struct fujitsu_laptop as it is now redundant.  Adjust
whitespace to make checkpatch happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 133 +++++++++++++++++-----------------
 1 file changed, 66 insertions(+), 67 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 77082e35f26a..9275f3c829a2 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -154,8 +154,6 @@ struct fujitsu_laptop {
 	int flags_state;
 };
 
-static struct fujitsu_laptop *fujitsu_laptop;
-
 #ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
 static u32 dbg_level = 0x03;
 #endif
@@ -313,9 +311,11 @@ static const struct backlight_ops fujitsu_bl_ops = {
 static ssize_t lid_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
-	if (!(fujitsu_laptop->flags_supported & FLAG_LID))
+	struct fujitsu_laptop *priv = dev_get_drvdata(dev);
+
+	if (!(priv->flags_supported & FLAG_LID))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_laptop->flags_state & FLAG_LID)
+	if (priv->flags_state & FLAG_LID)
 		return sprintf(buf, "open\n");
 	else
 		return sprintf(buf, "closed\n");
@@ -324,9 +324,11 @@ static ssize_t lid_show(struct device *dev, struct device_attribute *attr,
 static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	if (!(fujitsu_laptop->flags_supported & FLAG_DOCK))
+	struct fujitsu_laptop *priv = dev_get_drvdata(dev);
+
+	if (!(priv->flags_supported & FLAG_DOCK))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_laptop->flags_state & FLAG_DOCK)
+	if (priv->flags_state & FLAG_DOCK)
 		return sprintf(buf, "docked\n");
 	else
 		return sprintf(buf, "undocked\n");
@@ -335,9 +337,11 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 static ssize_t radios_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
-	if (!(fujitsu_laptop->flags_supported & FLAG_RFKILL))
+	struct fujitsu_laptop *priv = dev_get_drvdata(dev);
+
+	if (!(priv->flags_supported & FLAG_RFKILL))
 		return sprintf(buf, "unknown\n");
-	if (fujitsu_laptop->flags_state & FLAG_RFKILL)
+	if (priv->flags_state & FLAG_RFKILL)
 		return sprintf(buf, "on\n");
 	else
 		return sprintf(buf, "killed\n");
@@ -598,19 +602,22 @@ static int acpi_fujitsu_laptop_input_setup(struct acpi_device *device)
 	return input_register_device(priv->input);
 }
 
-static int fujitsu_laptop_platform_add(void)
+static int fujitsu_laptop_platform_add(struct acpi_device *device)
 {
+	struct fujitsu_laptop *priv = acpi_driver_data(device);
 	int ret;
 
-	fujitsu_laptop->pf_device = platform_device_alloc("fujitsu-laptop", -1);
-	if (!fujitsu_laptop->pf_device)
+	priv->pf_device = platform_device_alloc("fujitsu-laptop", -1);
+	if (!priv->pf_device)
 		return -ENOMEM;
 
-	ret = platform_device_add(fujitsu_laptop->pf_device);
+	platform_set_drvdata(priv->pf_device, priv);
+
+	ret = platform_device_add(priv->pf_device);
 	if (ret)
 		goto err_put_platform_device;
 
-	ret = sysfs_create_group(&fujitsu_laptop->pf_device->dev.kobj,
+	ret = sysfs_create_group(&priv->pf_device->dev.kobj,
 				 &fujitsu_pf_attribute_group);
 	if (ret)
 		goto err_del_platform_device;
@@ -618,18 +625,20 @@ static int fujitsu_laptop_platform_add(void)
 	return 0;
 
 err_del_platform_device:
-	platform_device_del(fujitsu_laptop->pf_device);
+	platform_device_del(priv->pf_device);
 err_put_platform_device:
-	platform_device_put(fujitsu_laptop->pf_device);
+	platform_device_put(priv->pf_device);
 
 	return ret;
 }
 
-static void fujitsu_laptop_platform_remove(void)
+static void fujitsu_laptop_platform_remove(struct acpi_device *device)
 {
-	sysfs_remove_group(&fujitsu_laptop->pf_device->dev.kobj,
+	struct fujitsu_laptop *priv = acpi_driver_data(device);
+
+	sysfs_remove_group(&priv->pf_device->dev.kobj,
 			   &fujitsu_pf_attribute_group);
-	platform_device_unregister(fujitsu_laptop->pf_device);
+	platform_device_unregister(priv->pf_device);
 }
 
 static int logolamp_set(struct led_classdev *cdev,
@@ -813,17 +822,16 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (!priv)
 		return -ENOMEM;
 
-	fujitsu_laptop = priv;
-	fujitsu_laptop->handle = device->handle;
+	priv->handle = device->handle;
 	sprintf(acpi_device_name(device), "%s",
 		ACPI_FUJITSU_LAPTOP_DEVICE_NAME);
 	sprintf(acpi_device_class(device), "%s", ACPI_FUJITSU_CLASS);
 	device->driver_data = priv;
 
 	/* kfifo */
-	spin_lock_init(&fujitsu_laptop->fifo_lock);
-	error = kfifo_alloc(&fujitsu_laptop->fifo, RINGBUFFERSIZE * sizeof(int),
-			GFP_KERNEL);
+	spin_lock_init(&priv->fifo_lock);
+	error = kfifo_alloc(&priv->fifo, RINGBUFFERSIZE * sizeof(int),
+			    GFP_KERNEL);
 	if (error) {
 		pr_err("kfifo_alloc failed\n");
 		goto err_stop;
@@ -833,7 +841,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (error)
 		goto err_free_fifo;
 
-	error = acpi_bus_update_power(fujitsu_laptop->handle, &state);
+	error = acpi_bus_update_power(priv->handle, &state);
 	if (error) {
 		pr_err("Error reading power state\n");
 		goto err_free_fifo;
@@ -843,50 +851,47 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 		acpi_device_name(device), acpi_device_bid(device),
 		!device->power.state ? "on" : "off");
 
-	fujitsu_laptop->dev = device;
+	priv->dev = device;
 
-	if (acpi_has_method(device->handle, METHOD_NAME__INI)) {
+	if (acpi_has_method(priv->handle, METHOD_NAME__INI)) {
 		vdbg_printk(FUJLAPTOP_DBG_INFO, "Invoking _INI\n");
 		if (ACPI_FAILURE
 		    (acpi_evaluate_object
-		     (device->handle, METHOD_NAME__INI, NULL, NULL)))
+		     (priv->handle, METHOD_NAME__INI, NULL, NULL)))
 			pr_err("_INI Method failed\n");
 	}
 
 	i = 0;
-	while (fext_buttons(fujitsu_laptop->handle, 0x1, 0x0, 0x0) != 0 &&
+	while (fext_buttons(priv->handle, 0x1, 0x0, 0x0) != 0 &&
 	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE)
 		; /* No action, result is discarded */
 	vdbg_printk(FUJLAPTOP_DBG_INFO, "Discarded %i ringbuffer entries\n", i);
 
-	fujitsu_laptop->flags_supported = fext_flags(fujitsu_laptop->handle,
-						     0x0, 0x0, 0x0);
+	priv->flags_supported = fext_flags(priv->handle, 0x0, 0x0, 0x0);
 
 	/* Make sure our bitmask of supported functions is cleared if the
 	   RFKILL function block is not implemented, like on the S7020. */
-	if (fujitsu_laptop->flags_supported == UNSUPPORTED_CMD)
-		fujitsu_laptop->flags_supported = 0;
+	if (priv->flags_supported == UNSUPPORTED_CMD)
+		priv->flags_supported = 0;
 
-	if (fujitsu_laptop->flags_supported)
-		fujitsu_laptop->flags_state = fext_flags(fujitsu_laptop->handle,
-							 0x4, 0x0, 0x0);
+	if (priv->flags_supported)
+		priv->flags_state = fext_flags(priv->handle, 0x4, 0x0, 0x0);
 
 	/* Suspect this is a keymap of the application panel, print it */
-	pr_info("BTNI: [0x%x]\n", fext_buttons(fujitsu_laptop->handle,
-					       0x0, 0x0, 0x0));
+	pr_info("BTNI: [0x%x]\n", fext_buttons(priv->handle, 0x0, 0x0, 0x0));
 
 	error = acpi_fujitsu_laptop_leds_register(device);
 	if (error)
 		goto err_free_fifo;
 
-	error = fujitsu_laptop_platform_add();
+	error = fujitsu_laptop_platform_add(device);
 	if (error)
 		goto err_free_fifo;
 
 	return 0;
 
 err_free_fifo:
-	kfifo_free(&fujitsu_laptop->fifo);
+	kfifo_free(&priv->fifo);
 err_stop:
 	return error;
 }
@@ -895,44 +900,42 @@ static int acpi_fujitsu_laptop_remove(struct acpi_device *device)
 {
 	struct fujitsu_laptop *priv = acpi_driver_data(device);
 
-	fujitsu_laptop_platform_remove();
+	fujitsu_laptop_platform_remove(device);
 
 	kfifo_free(&priv->fifo);
 
 	return 0;
 }
 
-static void acpi_fujitsu_laptop_press(int scancode)
+static void acpi_fujitsu_laptop_press(struct acpi_device *device, int scancode)
 {
-	struct input_dev *input = fujitsu_laptop->input;
+	struct fujitsu_laptop *priv = acpi_driver_data(device);
 	int status;
 
-	status = kfifo_in_locked(&fujitsu_laptop->fifo,
-				 (unsigned char *)&scancode, sizeof(scancode),
-				 &fujitsu_laptop->fifo_lock);
+	status = kfifo_in_locked(&priv->fifo, (unsigned char *)&scancode,
+				 sizeof(scancode), &priv->fifo_lock);
 	if (status != sizeof(scancode)) {
 		vdbg_printk(FUJLAPTOP_DBG_WARN,
 			    "Could not push scancode [0x%x]\n", scancode);
 		return;
 	}
-	sparse_keymap_report_event(input, scancode, 1, false);
+	sparse_keymap_report_event(priv->input, scancode, 1, false);
 	vdbg_printk(FUJLAPTOP_DBG_TRACE,
 		    "Push scancode into ringbuffer [0x%x]\n", scancode);
 }
 
-static void acpi_fujitsu_laptop_release(void)
+static void acpi_fujitsu_laptop_release(struct acpi_device *device)
 {
-	struct input_dev *input = fujitsu_laptop->input;
+	struct fujitsu_laptop *priv = acpi_driver_data(device);
 	int scancode, status;
 
 	while (true) {
-		status = kfifo_out_locked(&fujitsu_laptop->fifo,
+		status = kfifo_out_locked(&priv->fifo,
 					  (unsigned char *)&scancode,
-					  sizeof(scancode),
-					  &fujitsu_laptop->fifo_lock);
+					  sizeof(scancode), &priv->fifo_lock);
 		if (status != sizeof(scancode))
 			return;
-		sparse_keymap_report_event(input, scancode, 0, false);
+		sparse_keymap_report_event(priv->input, scancode, 0, false);
 		vdbg_printk(FUJLAPTOP_DBG_TRACE,
 			    "Pop scancode from ringbuffer [0x%x]\n", scancode);
 	}
@@ -940,31 +943,27 @@ static void acpi_fujitsu_laptop_release(void)
 
 static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 {
-	struct input_dev *input;
+	struct fujitsu_laptop *priv = acpi_driver_data(device);
 	int scancode, i = 0;
 	unsigned int irb;
 
-	input = fujitsu_laptop->input;
-
 	if (event != ACPI_FUJITSU_NOTIFY_CODE1) {
 		vdbg_printk(FUJLAPTOP_DBG_WARN,
 			    "Unsupported event [0x%x]\n", event);
-		sparse_keymap_report_event(input, -1, 1, true);
+		sparse_keymap_report_event(priv->input, -1, 1, true);
 		return;
 	}
 
-	if (fujitsu_laptop->flags_supported)
-		fujitsu_laptop->flags_state = fext_flags(fujitsu_laptop->handle,
-							 0x4, 0x0, 0x0);
+	if (priv->flags_supported)
+		priv->flags_state = fext_flags(priv->handle, 0x4, 0x0, 0x0);
 
-	while ((irb = fext_buttons(fujitsu_laptop->handle,
-				   0x1, 0x0, 0x0)) != 0 &&
+	while ((irb = fext_buttons(priv->handle, 0x1, 0x0, 0x0)) != 0 &&
 	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE) {
 		scancode = irb & 0x4ff;
-		if (sparse_keymap_entry_from_scancode(input, scancode))
-			acpi_fujitsu_laptop_press(scancode);
+		if (sparse_keymap_entry_from_scancode(priv->input, scancode))
+			acpi_fujitsu_laptop_press(device, scancode);
 		else if (scancode == 0)
-			acpi_fujitsu_laptop_release();
+			acpi_fujitsu_laptop_release(device);
 		else
 			vdbg_printk(FUJLAPTOP_DBG_WARN,
 				    "Unknown GIRB result [%x]\n", irb);
@@ -974,9 +973,9 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 	 * E736/E746/E756), the touchpad toggle hotkey (Fn+F4) is
 	 * handled in software; its state is queried using FUNC_FLAGS
 	 */
-	if ((fujitsu_laptop->flags_supported & BIT(26)) &&
-	    (fext_flags(fujitsu_laptop->handle, 0x1, 0x0, 0x0) & BIT(26)))
-		sparse_keymap_report_event(input, BIT(26), 1, true);
+	if ((priv->flags_supported & BIT(26)) &&
+	    (fext_flags(priv->handle, 0x1, 0x0, 0x0) & BIT(26)))
+		sparse_keymap_report_event(priv->input, BIT(26), 1, true);
 }
 
 /* Initialization */
-- 
2.12.2
