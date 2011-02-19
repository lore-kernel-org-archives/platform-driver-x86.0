From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 4/8] sony-laptop: use pr_<level> for messages
Date: Sat, 19 Feb 2011 11:52:28 +0900
Message-ID: <1298083952-22493-5-git-send-email-malattia@linux.it>
References: <1298083952-22493-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:60587
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752679Ab1BSDAR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Feb 2011 22:00:17 -0500
In-Reply-To: <1298083952-22493-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  102 ++++++++++++++++-------------------
 1 files changed, 47 insertions(+), 55 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index ad7c496..1662b05 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -71,8 +71,9 @@
 #endif
 
 #define DRV_PFX			"sony-laptop: "
-#define dprintk(msg...)		do {			\
-	if (debug) printk(KERN_WARNING DRV_PFX  msg);	\
+#define dprintk(msg...)		do {	\
+	if (debug)			\
+		pr_warn(DRV_PFX msg);	\
 } while (0)
 
 #define SONY_LAPTOP_DRIVER_VERSION	"0.6"
@@ -402,7 +403,7 @@ static int sony_laptop_setup_input(struct acpi_device *acpi_device)
 	error = kfifo_alloc(&sony_laptop_input.fifo,
 			    SONY_LAPTOP_BUF_SIZE, GFP_KERNEL);
 	if (error) {
-		printk(KERN_ERR DRV_PFX "kfifo_alloc failed\n");
+		pr_err(DRV_PFX "kfifo_alloc failed\n");
 		goto err_dec_users;
 	}
 
@@ -686,7 +687,7 @@ static int acpi_callgetfunc(acpi_handle handle, char *name, int *result)
 		return 0;
 	}
 
-	printk(KERN_WARNING DRV_PFX "acpi_callreadfunc failed\n");
+	pr_warn(DRV_PFX "acpi_callreadfunc failed\n");
 
 	return -1;
 }
@@ -712,7 +713,7 @@ static int acpi_callsetfunc(acpi_handle handle, char *name, int value,
 	if (status == AE_OK) {
 		if (result != NULL) {
 			if (out_obj.type != ACPI_TYPE_INTEGER) {
-				printk(KERN_WARNING DRV_PFX "acpi_evaluate_object bad "
+				pr_warn(DRV_PFX "acpi_evaluate_object bad "
 				       "return type\n");
 				return -1;
 			}
@@ -721,7 +722,7 @@ static int acpi_callsetfunc(acpi_handle handle, char *name, int value,
 		return 0;
 	}
 
-	printk(KERN_WARNING DRV_PFX "acpi_evaluate_object failed\n");
+	pr_warn(DRV_PFX "acpi_evaluate_object failed\n");
 
 	return -1;
 }
@@ -980,7 +981,7 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 				}
 
 				if (!key_event->data)
-					printk(KERN_INFO DRV_PFX
+					pr_info(DRV_PFX
 							"Unknown event: 0x%x 0x%x\n",
 							key_handle,
 							ev);
@@ -1004,7 +1005,7 @@ static acpi_status sony_walk_callback(acpi_handle handle, u32 level,
 	struct acpi_device_info *info;
 
 	if (ACPI_SUCCESS(acpi_get_object_info(handle, &info))) {
-		printk(KERN_WARNING DRV_PFX "method: name: %4.4s, args %X\n",
+		pr_warn(DRV_PFX "method: name: %4.4s, args %X\n",
 			(char *)&info->name, info->param_count);
 
 		kfree(info);
@@ -1045,7 +1046,7 @@ static int sony_nc_resume(struct acpi_device *device)
 		ret = acpi_callsetfunc(sony_nc_acpi_handle, *item->acpiset,
 				       item->value, NULL);
 		if (ret < 0) {
-			printk("%s: %d\n", __func__, ret);
+			pr_err(DRV_PFX "%s: %d\n", __func__, ret);
 			break;
 		}
 	}
@@ -1065,7 +1066,7 @@ static int sony_nc_resume(struct acpi_device *device)
 	/* set the last requested brightness level */
 	if (sony_backlight_device &&
 			sony_backlight_update_status(sony_backlight_device) < 0)
-		printk(KERN_WARNING DRV_PFX "unable to restore brightness level\n");
+		pr_warn(DRV_PFX "unable to restore brightness level\n");
 
 	/* re-read rfkill state */
 	sony_nc_rfkill_update();
@@ -1213,13 +1214,9 @@ static void sony_nc_rfkill_setup(struct acpi_device *device)
 	}
 
 	device_enum = (union acpi_object *) buffer.pointer;
-	if (!device_enum) {
-		pr_err("Invalid SN06 return object\n");
-		goto out_no_enum;
-	}
-	if (device_enum->type != ACPI_TYPE_BUFFER) {
-		pr_err("Invalid SN06 return object type 0x%.2x\n",
-		       device_enum->type);
+	if (!device_enum || device_enum->type != ACPI_TYPE_BUFFER) {
+		pr_err(DRV_PFX "Invalid SN06 return object 0x%.2x\n",
+				device_enum->type);
 		goto out_no_enum;
 	}
 
@@ -1260,8 +1257,8 @@ static int sony_nc_add(struct acpi_device *device)
 	acpi_handle handle;
 	struct sony_nc_value *item;
 
-	printk(KERN_INFO DRV_PFX "%s v%s.\n",
-		SONY_NC_DRIVER_NAME, SONY_LAPTOP_DRIVER_VERSION);
+	pr_info(DRV_PFX "%s v%s.\n", SONY_NC_DRIVER_NAME,
+			SONY_LAPTOP_DRIVER_VERSION);
 
 	sony_nc_acpi_device = device;
 	strcpy(acpi_device_class(device), "sony/hotkey");
@@ -1278,10 +1275,11 @@ static int sony_nc_add(struct acpi_device *device)
 	}
 
 	if (debug) {
-		status = acpi_walk_namespace(ACPI_TYPE_METHOD, sony_nc_acpi_handle,
-					     1, sony_walk_callback, NULL, NULL, NULL);
+		status = acpi_walk_namespace(ACPI_TYPE_METHOD,
+				sony_nc_acpi_handle, 1, sony_walk_callback,
+				NULL, NULL, NULL);
 		if (ACPI_FAILURE(status)) {
-			printk(KERN_WARNING DRV_PFX "unable to walk acpi resources\n");
+			pr_warn(DRV_PFX "unable to walk acpi resources\n");
 			result = -ENODEV;
 			goto outwalk;
 		}
@@ -1303,17 +1301,16 @@ static int sony_nc_add(struct acpi_device *device)
 	/* setup input devices and helper fifo */
 	result = sony_laptop_setup_input(device);
 	if (result) {
-		printk(KERN_ERR DRV_PFX
-				"Unable to create input devices.\n");
+		pr_err(DRV_PFX "Unable to create input devices.\n");
 		goto outwalk;
 	}
 
 	if (acpi_video_backlight_support()) {
-		printk(KERN_INFO DRV_PFX "brightness ignored, must be "
+		pr_info(DRV_PFX "brightness ignored, must be "
 		       "controlled by ACPI video driver\n");
 	} else if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "GBRT",
 						&handle))) {
-							struct backlight_properties props;
+		struct backlight_properties props;
 		memset(&props, 0, sizeof(struct backlight_properties));
 		props.max_brightness = SONY_MAX_BRIGHTNESS - 1;
 		sony_backlight_device = backlight_device_register("sony", NULL,
@@ -1322,7 +1319,7 @@ static int sony_nc_add(struct acpi_device *device)
 								  &props);
 
 		if (IS_ERR(sony_backlight_device)) {
-			printk(KERN_WARNING DRV_PFX "unable to register backlight device\n");
+			pr_warning(DRV_PFX "unable to register backlight device\n");
 			sony_backlight_device = NULL;
 		} else {
 			sony_backlight_device->props.brightness =
@@ -1849,7 +1846,7 @@ out:
 	if (pcidev)
 		pci_dev_put(pcidev);
 
-	printk(KERN_INFO DRV_PFX "detected Type%d model\n",
+	pr_info(DRV_PFX "detected Type%d model\n",
 			dev->model == SONYPI_DEVICE_TYPE1 ? 1 :
 			dev->model == SONYPI_DEVICE_TYPE2 ? 2 : 3);
 }
@@ -1897,7 +1894,7 @@ static int __sony_pic_camera_ready(void)
 static int __sony_pic_camera_off(void)
 {
 	if (!camera) {
-		printk(KERN_WARNING DRV_PFX "camera control not enabled\n");
+		pr_warn(DRV_PFX "camera control not enabled\n");
 		return -ENODEV;
 	}
 
@@ -1917,7 +1914,7 @@ static int __sony_pic_camera_on(void)
 	int i, j, x;
 
 	if (!camera) {
-		printk(KERN_WARNING DRV_PFX "camera control not enabled\n");
+		pr_warn(DRV_PFX "camera control not enabled\n");
 		return -ENODEV;
 	}
 
@@ -1940,7 +1937,7 @@ static int __sony_pic_camera_on(void)
 	}
 
 	if (j == 0) {
-		printk(KERN_WARNING DRV_PFX "failed to power on camera\n");
+		pr_warn(DRV_PFX "failed to power on camera\n");
 		return -ENODEV;
 	}
 
@@ -1996,7 +1993,7 @@ int sony_pic_camera_command(int command, u8 value)
 				ITERATIONS_SHORT);
 		break;
 	default:
-		printk(KERN_ERR DRV_PFX "sony_pic_camera_command invalid: %d\n",
+		pr_err(DRV_PFX "sony_pic_camera_command invalid: %d\n",
 		       command);
 		break;
 	}
@@ -2403,7 +2400,7 @@ static int sonypi_compat_init(void)
 	error =
 	 kfifo_alloc(&sonypi_compat.fifo, SONY_LAPTOP_BUF_SIZE, GFP_KERNEL);
 	if (error) {
-		printk(KERN_ERR DRV_PFX "kfifo_alloc failed\n");
+		pr_err(DRV_PFX "kfifo_alloc failed\n");
 		return error;
 	}
 
@@ -2413,11 +2410,11 @@ static int sonypi_compat_init(void)
 		sonypi_misc_device.minor = minor;
 	error = misc_register(&sonypi_misc_device);
 	if (error) {
-		printk(KERN_ERR DRV_PFX "misc_register failed\n");
+		pr_err(DRV_PFX "misc_register failed\n");
 		goto err_free_kfifo;
 	}
 	if (minor == -1)
-		printk(KERN_INFO DRV_PFX "device allocated minor is %d\n",
+		pr_info(DRV_PFX "device allocated minor is %d\n",
 		       sonypi_misc_device.minor);
 
 	return 0;
@@ -2477,8 +2474,7 @@ sony_pic_read_possible_resource(struct acpi_resource *resource, void *context)
 			}
 			for (i = 0; i < p->interrupt_count; i++) {
 				if (!p->interrupts[i]) {
-					printk(KERN_WARNING DRV_PFX
-							"Invalid IRQ %d\n",
+					pr_warn(DRV_PFX "Invalid IRQ %d\n",
 							p->interrupts[i]);
 					continue;
 				}
@@ -2517,7 +2513,7 @@ sony_pic_read_possible_resource(struct acpi_resource *resource, void *context)
 						ioport->io2.address_length);
 			}
 			else {
-				printk(KERN_ERR DRV_PFX "Unknown SPIC Type, more than 2 IO Ports\n");
+				pr_err(DRV_PFX "Unknown SPIC Type, more than 2 IO Ports\n");
 				return AE_ERROR;
 			}
 			return AE_OK;
@@ -2545,7 +2541,7 @@ static int sony_pic_possible_resources(struct acpi_device *device)
 	dprintk("Evaluating _STA\n");
 	result = acpi_bus_get_status(device);
 	if (result) {
-		printk(KERN_WARNING DRV_PFX "Unable to read status\n");
+		pr_warn(DRV_PFX "Unable to read status\n");
 		goto end;
 	}
 
@@ -2561,8 +2557,7 @@ static int sony_pic_possible_resources(struct acpi_device *device)
 	status = acpi_walk_resources(device->handle, METHOD_NAME__PRS,
 			sony_pic_read_possible_resource, &spic_dev);
 	if (ACPI_FAILURE(status)) {
-		printk(KERN_WARNING DRV_PFX
-				"Failure evaluating %s\n",
+		pr_warn(DRV_PFX "Failure evaluating %s\n",
 				METHOD_NAME__PRS);
 		result = -ENODEV;
 	}
@@ -2676,7 +2671,7 @@ static int sony_pic_enable(struct acpi_device *device,
 
 	/* check for total failure */
 	if (ACPI_FAILURE(status)) {
-		printk(KERN_ERR DRV_PFX "Error evaluating _SRS\n");
+		pr_err(DRV_PFX "Error evaluating _SRS\n");
 		result = -ENODEV;
 		goto end;
 	}
@@ -2768,7 +2763,7 @@ static int sony_pic_remove(struct acpi_device *device, int type)
 	struct sony_pic_irq *irq, *tmp_irq;
 
 	if (sony_pic_disable(device)) {
-		printk(KERN_ERR DRV_PFX "Couldn't disable device.\n");
+		pr_err(DRV_PFX "Couldn't disable device.\n");
 		return -ENXIO;
 	}
 
@@ -2808,8 +2803,8 @@ static int sony_pic_add(struct acpi_device *device)
 	struct sony_pic_ioport *io, *tmp_io;
 	struct sony_pic_irq *irq, *tmp_irq;
 
-	printk(KERN_INFO DRV_PFX "%s v%s.\n",
-		SONY_PIC_DRIVER_NAME, SONY_LAPTOP_DRIVER_VERSION);
+	pr_info(DRV_PFX "%s v%s.\n", SONY_PIC_DRIVER_NAME,
+			SONY_LAPTOP_DRIVER_VERSION);
 
 	spic_dev.acpi_dev = device;
 	strcpy(acpi_device_class(device), "sony/hotkey");
@@ -2819,16 +2814,14 @@ static int sony_pic_add(struct acpi_device *device)
 	/* read _PRS resources */
 	result = sony_pic_possible_resources(device);
 	if (result) {
-		printk(KERN_ERR DRV_PFX
-				"Unable to read possible resources.\n");
+		pr_err(DRV_PFX "Unable to read possible resources.\n");
 		goto err_free_resources;
 	}
 
 	/* setup input devices and helper fifo */
 	result = sony_laptop_setup_input(device);
 	if (result) {
-		printk(KERN_ERR DRV_PFX
-				"Unable to create input devices.\n");
+		pr_err(DRV_PFX "Unable to create input devices.\n");
 		goto err_free_resources;
 	}
 
@@ -2869,7 +2862,7 @@ static int sony_pic_add(struct acpi_device *device)
 		}
 	}
 	if (!spic_dev.cur_ioport) {
-		printk(KERN_ERR DRV_PFX "Failed to request_region.\n");
+		pr_err(DRV_PFX "Failed to request_region.\n");
 		result = -ENODEV;
 		goto err_remove_compat;
 	}
@@ -2889,7 +2882,7 @@ static int sony_pic_add(struct acpi_device *device)
 		}
 	}
 	if (!spic_dev.cur_irq) {
-		printk(KERN_ERR DRV_PFX "Failed to request_irq.\n");
+		pr_err(DRV_PFX "Failed to request_irq.\n");
 		result = -ENODEV;
 		goto err_release_region;
 	}
@@ -2897,7 +2890,7 @@ static int sony_pic_add(struct acpi_device *device)
 	/* set resource status _SRS */
 	result = sony_pic_enable(device, spic_dev.cur_ioport, spic_dev.cur_irq);
 	if (result) {
-		printk(KERN_ERR DRV_PFX "Couldn't enable device.\n");
+		pr_err(DRV_PFX "Couldn't enable device.\n");
 		goto err_free_irq;
 	}
 
@@ -3006,8 +2999,7 @@ static int __init sony_laptop_init(void)
 	if (!no_spic && dmi_check_system(sonypi_dmi_table)) {
 		result = acpi_bus_register_driver(&sony_pic_driver);
 		if (result) {
-			printk(KERN_ERR DRV_PFX
-					"Unable to register SPIC driver.");
+			pr_err(DRV_PFX "Unable to register SPIC driver.");
 			goto out;
 		}
 		spic_drv_registered = 1;
@@ -3015,7 +3007,7 @@ static int __init sony_laptop_init(void)
 
 	result = acpi_bus_register_driver(&sony_nc_driver);
 	if (result) {
-		printk(KERN_ERR DRV_PFX "Unable to register SNC driver.");
+		pr_err(DRV_PFX "Unable to register SNC driver.");
 		goto out_unregister_pic;
 	}
 
-- 
1.7.2.3
