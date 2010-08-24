From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 1/3] platform-x86: sync eeepc-laptop and asus-laptop
Date: Tue, 24 Aug 2010 09:30:44 +0200
Message-ID: <1282635046-6366-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:44497 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752138Ab0HXHfA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Aug 2010 03:35:00 -0400
Received: from relay2-v.mail.gandi.net (relay2-v.mail.gandi.net [217.70.178.76])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 302888669A
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Aug 2010 09:31:15 +0200 (CEST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Corentin Chary <corentincj@iksaif.net>

Makes asus-laptop and eeepc-laptop _init/_exit functions
looks exactly the same as they do the same thing.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/asus-laptop.c  |   54 +++++++++++++++++-----------------
 drivers/platform/x86/eeepc-laptop.c |   16 ++++++----
 2 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index b756e07..ffab9b4 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -639,29 +639,29 @@ static int asus_backlight_notify(struct asus_laptop *asus)
 static int asus_backlight_init(struct asus_laptop *asus)
 {
 	struct backlight_device *bd;
-	struct device *dev = &asus->platform_device->dev;
 	struct backlight_properties props;
 
-	if (!acpi_check_handle(asus->handle, METHOD_BRIGHTNESS_GET, NULL) &&
-	    !acpi_check_handle(asus->handle, METHOD_BRIGHTNESS_SET, NULL) &&
-	    lcd_switch_handle) {
-		memset(&props, 0, sizeof(struct backlight_properties));
-		props.max_brightness = 15;
-
-		bd = backlight_device_register(ASUS_LAPTOP_FILE, dev,
-					       asus, &asusbl_ops, &props);
-		if (IS_ERR(bd)) {
-			pr_err("Could not register asus backlight device\n");
-			asus->backlight_device = NULL;
-			return PTR_ERR(bd);
-		}
+	if (acpi_check_handle(asus->handle, METHOD_BRIGHTNESS_GET, NULL) ||
+	    acpi_check_handle(asus->handle, METHOD_BRIGHTNESS_SET, NULL) ||
+	    !lcd_switch_handle)
+		return 0;
 
-		asus->backlight_device = bd;
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.max_brightness = 15;
 
-		bd->props.power = FB_BLANK_UNBLANK;
-		bd->props.brightness = asus_read_brightness(bd);
-		backlight_update_status(bd);
+	bd = backlight_device_register(ASUS_LAPTOP_FILE,
+				       &asus->platform_device->dev, asus,
+				       &asusbl_ops, &props);
+	if (IS_ERR(bd)) {
+		pr_err("Could not register asus backlight device\n");
+		asus->backlight_device = NULL;
+		return PTR_ERR(bd);
 	}
+
+	asus->backlight_device = bd;
+	bd->props.brightness = asus_read_brightness(bd);
+	bd->props.power = FB_BLANK_UNBLANK;
+	backlight_update_status(bd);
 	return 0;
 }
 
@@ -1130,7 +1130,6 @@ static int asus_input_init(struct asus_laptop *asus)
 	input->phys = ASUS_LAPTOP_FILE "/input0";
 	input->id.bustype = BUS_HOST;
 	input->dev.parent = &asus->platform_device->dev;
-	input_set_drvdata(input, asus);
 
 	error = sparse_keymap_setup(input, asus_keymap, NULL);
 	if (error) {
@@ -1159,6 +1158,7 @@ static void asus_input_exit(struct asus_laptop *asus)
 		sparse_keymap_free(asus->inputdev);
 		input_unregister_device(asus->inputdev);
 	}
+	asus->inputdev = NULL;
 }
 
 /*
@@ -1278,19 +1278,19 @@ static int asus_sysfs_init(struct asus_laptop *asus)
 
 static int asus_platform_init(struct asus_laptop *asus)
 {
-	int err;
+	int result;
 
 	asus->platform_device = platform_device_alloc(ASUS_LAPTOP_FILE, -1);
 	if (!asus->platform_device)
 		return -ENOMEM;
 	platform_set_drvdata(asus->platform_device, asus);
 
-	err = platform_device_add(asus->platform_device);
-	if (err)
+	result = platform_device_add(asus->platform_device);
+	if (result)
 		goto fail_platform_device;
 
-	err = asus_sysfs_init(asus);
-	if (err)
+	result = asus_sysfs_init(asus);
+	if (result)
 		goto fail_sysfs;
 	return 0;
 
@@ -1299,7 +1299,7 @@ fail_sysfs:
 	platform_device_del(asus->platform_device);
 fail_platform_device:
 	platform_device_put(asus->platform_device);
-	return err;
+	return result;
 }
 
 static void asus_platform_exit(struct asus_laptop *asus)
@@ -1428,8 +1428,6 @@ static int asus_laptop_get_info(struct asus_laptop *asus)
 	return AE_OK;
 }
 
-static bool asus_device_present;
-
 static int __devinit asus_acpi_init(struct asus_laptop *asus)
 {
 	int result = 0;
@@ -1474,6 +1472,8 @@ static int __devinit asus_acpi_init(struct asus_laptop *asus)
 	return result;
 }
 
+static bool asus_device_present;
+
 static int __devinit asus_acpi_add(struct acpi_device *device)
 {
 	struct asus_laptop *asus;
diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 6b8e062..b2edfdc 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -165,6 +165,7 @@ struct eeepc_laptop {
 	u16 event_count[128];		/* count for each event */
 
 	struct platform_device *platform_device;
+	struct acpi_device *device;		/* the device we are in */
 	struct device *hwmon_device;
 	struct backlight_device *backlight_device;
 
@@ -1193,9 +1194,9 @@ static int eeepc_input_init(struct eeepc_laptop *eeepc)
 	eeepc->inputdev = input;
 	return 0;
 
- err_free_keymap:
+err_free_keymap:
 	sparse_keymap_free(input);
- err_free_dev:
+err_free_dev:
 	input_free_device(input);
 	return error;
 }
@@ -1206,6 +1207,7 @@ static void eeepc_input_exit(struct eeepc_laptop *eeepc)
 		sparse_keymap_free(eeepc->inputdev);
 		input_unregister_device(eeepc->inputdev);
 	}
+	eeepc->inputdev = NULL;
 }
 
 /*
@@ -1326,16 +1328,15 @@ static void cmsg_quirks(struct eeepc_laptop *eeepc)
 	cmsg_quirk(eeepc, CM_ASL_TPD, "TPD");
 }
 
-static int eeepc_acpi_init(struct eeepc_laptop *eeepc,
-			   struct acpi_device *device)
+static int __devinit eeepc_acpi_init(struct eeepc_laptop *eeepc)
 {
 	unsigned int init_flags;
 	int result;
 
-	result = acpi_bus_get_status(device);
+	result = acpi_bus_get_status(eeepc->device);
 	if (result)
 		return result;
-	if (!device->status.present) {
+	if (!eeepc->device->status.present) {
 		pr_err("Hotkey device not present, aborting\n");
 		return -ENODEV;
 	}
@@ -1384,12 +1385,13 @@ static int __devinit eeepc_acpi_add(struct acpi_device *device)
 	strcpy(acpi_device_name(device), EEEPC_ACPI_DEVICE_NAME);
 	strcpy(acpi_device_class(device), EEEPC_ACPI_CLASS);
 	device->driver_data = eeepc;
+	eeepc->device = device;
 
 	eeepc->hotplug_disabled = hotplug_disabled;
 
 	eeepc_dmi_check(eeepc);
 
-	result = eeepc_acpi_init(eeepc, device);
+	result = eeepc_acpi_init(eeepc);
 	if (result)
 		goto fail_platform;
 	eeepc_enable_camera(eeepc);
-- 
1.7.1
