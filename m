From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 10/14] sony-laptop: code style fixes
Date: Fri, 09 Sep 2011 18:56:40 +0200
Message-ID: <1315587400.3613.98.camel@vesuvio>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:37804 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758481Ab1IIQ4n (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Sep 2011 12:56:43 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

This patch fixes all ERROR and WARNING complains by checkpatch.

Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -63,7 +63,7 @@
 #include <linux/slab.h>
 #include <acpi/acpi_drivers.h>
 #include <acpi/acpi_bus.h>
-#include <asm/uaccess.h>
+#include <linux/uaccess.h>
 #include <linux/sonypi.h>
 #include <linux/sony-laptop.h>
 #include <linux/rfkill.h>
@@ -377,11 +377,13 @@ static void sony_laptop_report_input_eve
 
 	default:
 		if (event >= ARRAY_SIZE(sony_laptop_input_index)) {
-			dprintk("sony_laptop_report_input_event, event not known: %d\n",
event);
+			dprintk("sony_laptop_report_input_event, "
+				"event not known: %d\n", event);
 			break;
 		}
 		if (sony_laptop_input_index[event] != -1) {
-			kp.key =
sony_laptop_input_keycode_map[sony_laptop_input_index[event]];
+			int index = sony_laptop_input_index[event];
+			kp.key = sony_laptop_input_keycode_map[index];
 			if (kp.key != KEY_UNKNOWN)
 				kp.dev = key_dev;
 		}
@@ -565,12 +567,12 @@ static int sony_pf_add(void)
 
 	return 0;
 
-      out_platform_alloced:
+out_platform_alloced:
 	platform_device_put(sony_pf_device);
 	sony_pf_device = NULL;
-      out_platform_registered:
+out_platform_registered:
 	platform_driver_unregister(&sony_pf_driver);
-      out:
+out:
 	atomic_dec(&sony_pf_users);
 	return ret;
 }
@@ -622,7 +624,8 @@ struct sony_nc_value {
 		.acpiset	= _setters, \
 		.validate	= _validate, \
 		.debug		= _debug, \
-		.devattr	= __ATTR(_name, 0, sony_nc_sysfs_show, sony_nc_sysfs_store),
\
+		.devattr	= __ATTR(_name, 0, sony_nc_sysfs_show, \
+						sony_nc_sysfs_store), \
 	}
 
 #define SNC_HANDLE_NULL	{ .name = NULL }
@@ -664,7 +667,8 @@ static struct sony_nc_value sony_nc_valu
 	SNC_HANDLE(brightness_default, snc_brightness_def_get,
 			snc_brightness_def_set, brightness_default_validate, 0),
 	SNC_HANDLE(fnkey, snc_fnkey_get, NULL, NULL, 0),
-	SNC_HANDLE(cdpower, snc_cdpower_get, snc_cdpower_set,
boolean_validate, 0),
+	SNC_HANDLE(cdpower, snc_cdpower_get, snc_cdpower_set,
+			boolean_validate, 0),
 	SNC_HANDLE(audiopower, snc_audiopower_get, snc_audiopower_set,
 			boolean_validate, 0),
 	SNC_HANDLE(lanpower, snc_lanpower_get, snc_lanpower_set,
@@ -684,7 +688,7 @@ static struct sony_nc_value sony_nc_valu
 };
 
 static acpi_handle sony_nc_acpi_handle;
-static struct acpi_device *sony_nc_acpi_device = NULL;
+static struct acpi_device *sony_nc_acpi_device;
 
 /*
  * acpi_evaluate_object wrappers
@@ -731,7 +735,8 @@ static int acpi_callsetfunc(acpi_handle 
 	if (status == AE_OK) {
 		if (result != NULL) {
 			if (out_obj.type != ACPI_TYPE_INTEGER) {
-				pr_warn("acpi_evaluate_object bad return type\n");
+				pr_warn("acpi_evaluate_object bad "
+					"return type\n");
 				return -1;
 			}
 			*result = out_obj.integer.value;
@@ -944,11 +949,11 @@ static int sony_call_snc_handle_buffer(u
 static int brightness_default_validate(const int direction, const int
value)
 {
 	switch (direction) {
-		case SNC_VALIDATE_OUT:
-			return value - 1;
-		case SNC_VALIDATE_IN:
-			if (value >= 0 && value < SONY_MAX_BRIGHTNESS)
-				return value + 1;
+	case SNC_VALIDATE_OUT:
+		return value - 1;
+	case SNC_VALIDATE_IN:
+		if (value >= 0 && value < SONY_MAX_BRIGHTNESS)
+			return value + 1;
 	}
 	return -EINVAL;
 }
@@ -970,8 +975,9 @@ static int boolean_validate(const int di
 /*
  * Sysfs show/store common to all sony_nc_values
  */
-static ssize_t sony_nc_sysfs_show(struct device *dev, struct
device_attribute *attr,
-			      char *buffer)
+static ssize_t sony_nc_sysfs_show(struct device *dev,
+			struct device_attribute *attr,
+			char *buffer)
 {
 	unsigned int value;
 	struct sony_nc_value *item =
@@ -1012,7 +1018,8 @@ static ssize_t sony_nc_sysfs_store(struc
 	if (value < 0)
 		return value;
 
-	if (acpi_callsetfunc(sony_nc_acpi_handle, *item->acpiset, value, NULL)
< 0)
+	if (acpi_callsetfunc(sony_nc_acpi_handle,
+				*item->acpiset, value, NULL) < 0)
 		return -EIO;
 	item->value = value;
 	item->valid = 1;
@@ -1290,9 +1297,9 @@ static void sony_nc_rfkill_update(void)
 			continue;
 
 		if (hwblock) {
-			if (rfkill_set_hw_state(sony_rfkill_devices[i], true)) {
-				/* we already know we're blocked */
-			}
+			if (rfkill_set_hw_state(sony_rfkill_devices[i], true))
+				/* we already know we're blocked */ ;
+
 			continue;
 		}
 
@@ -1886,7 +1893,8 @@ static int sony_nc_add(struct acpi_devic
 
 	/* read device status */
 	result = acpi_bus_get_status(device);
-	/* bail IFF the above call was successful and the device is not
present */
+	/* bail IFF the above call was successful
+	   and the device is not present */
 	if (!result && !device->status.present) {
 		dprintk("Device not present\n");
 		result = -ENODEV;
@@ -1930,11 +1938,11 @@ static int sony_nc_add(struct acpi_devic
 		goto outsnc;
 	}
 
-	if (acpi_video_backlight_support()) {
-		pr_info("brightness ignored, must be controlled by ACPI video driver
\n");
-	} else {
+	if (acpi_video_backlight_support())
+		pr_info("brightness ignored, must be "
+			"controlled by ACPI video driver\n");
+	else
 		sony_nc_backlight_setup();
-	}
 
 	/* create sony_pf sysfs attributes related to the SNC device */
 	for (item = sony_nc_values; item->name; ++item) {
@@ -1977,21 +1985,21 @@ static int sony_nc_add(struct acpi_devic
 
 	return 0;
 
-      out_sysfs:
-	for (item = sony_nc_values; item->name; ++item) {
+out_sysfs:
+	for (item = sony_nc_values; item->name; ++item)
 		device_remove_file(&sony_pf_device->dev, &item->devattr);
-	}
+
 	sony_nc_backlight_cleanup();
 
 	sony_laptop_remove_input();
 
-      outsnc:
+outsnc:
 	sony_nc_handles_cleanup(sony_pf_device);
 
-      outpresent:
+outpresent:
 	sony_pf_remove();
 
-      outwalk:
+outwalk:
 	return result;
 }
 
@@ -2004,9 +2012,8 @@ static int sony_nc_remove(struct acpi_de
 
 	sony_nc_acpi_device = NULL;
 
-	for (item = sony_nc_values; item->name; ++item) {
+	for (item = sony_nc_values; item->name; ++item)
 		device_remove_file(&sony_pf_device->dev, &item->devattr);
-	}
 
 	sony_pf_remove();
 	sony_laptop_remove_input();
@@ -2387,11 +2394,14 @@ static u8 sony_pic_call3(u8 dev, u8 fn, 
 {
 	u8 v1;
 
-	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2,
ITERATIONS_LONG);
+	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2,
+			ITERATIONS_LONG);
 	outb(dev, spic_dev.cur_ioport->io1.minimum + 4);
-	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2,
ITERATIONS_LONG);
+	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2,
+			ITERATIONS_LONG);
 	outb(fn, spic_dev.cur_ioport->io1.minimum);
-	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2,
ITERATIONS_LONG);
+	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2,
+			ITERATIONS_LONG);
 	outb(v, spic_dev.cur_ioport->io1.minimum);
 	v1 = inb_p(spic_dev.cur_ioport->io1.minimum);
 	dprintk("sony_pic_call3(0x%.2x - 0x%.2x - 0x%.2x): 0x%.4x\n",
@@ -2505,19 +2515,19 @@ out:
 /* the rest don't need a loop until not 0xff */
 #define SONYPI_CAMERA_AGC			6
 #define SONYPI_CAMERA_AGC_MASK			0x30
-#define SONYPI_CAMERA_SHUTTER_MASK 		0x7
+#define SONYPI_CAMERA_SHUTTER_MASK		0x7
 
 #define SONYPI_CAMERA_SHUTDOWN_REQUEST		7
 #define SONYPI_CAMERA_CONTROL			0x10
 
-#define SONYPI_CAMERA_STATUS 			7
-#define SONYPI_CAMERA_STATUS_READY 		0x2
+#define SONYPI_CAMERA_STATUS			7
+#define SONYPI_CAMERA_STATUS_READY		0x2
 #define SONYPI_CAMERA_STATUS_POSITION		0x4
 
-#define SONYPI_DIRECTION_BACKWARDS 		0x4
+#define SONYPI_DIRECTION_BACKWARDS		0x4
 
-#define SONYPI_CAMERA_REVISION 			8
-#define SONYPI_CAMERA_ROMVERSION 		9
+#define SONYPI_CAMERA_REVISION			8
+#define SONYPI_CAMERA_ROMVERSION		9
 
 static int __sony_pic_camera_ready(void)
 {
@@ -2559,14 +2569,14 @@ static int __sony_pic_camera_on(void)
 
 	for (j = 5; j > 0; j--) {
 
-		for (x = 0; x < 100 && sony_pic_call2(0x91, 0x1); x++)
-			msleep(10);
+		for (x = 0; x < 50 && sony_pic_call2(0x91, 0x1); x++)
+			msleep(20);
 		sony_pic_call1(0x93);
 
-		for (i = 400; i > 0; i--) {
+		for (i = 200; i > 0; i--) {
 			if (__sony_pic_camera_ready())
 				break;
-			msleep(10);
+			msleep(20);
 		}
 		if (i)
 			break;
@@ -2601,28 +2611,28 @@ int sony_pic_camera_command(int command,
 			__sony_pic_camera_off();
 		break;
 	case SONY_PIC_COMMAND_SETCAMERABRIGHTNESS:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_BRIGHTNESS,
value),
-				ITERATIONS_SHORT);
+		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_BRIGHTNESS,
+				value),	ITERATIONS_SHORT);
 		break;
 	case SONY_PIC_COMMAND_SETCAMERACONTRAST:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_CONTRAST, value),
-				ITERATIONS_SHORT);
+		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_CONTRAST,
+				value),	ITERATIONS_SHORT);
 		break;
 	case SONY_PIC_COMMAND_SETCAMERAHUE:
 		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_HUE, value),
 				ITERATIONS_SHORT);
 		break;
 	case SONY_PIC_COMMAND_SETCAMERACOLOR:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_COLOR, value),
-				ITERATIONS_SHORT);
+		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_COLOR,
+				value),	ITERATIONS_SHORT);
 		break;
 	case SONY_PIC_COMMAND_SETCAMERASHARPNESS:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_SHARPNESS, value),
-				ITERATIONS_SHORT);
+		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_SHARPNESS,
+				value),	ITERATIONS_SHORT);
 		break;
 	case SONY_PIC_COMMAND_SETCAMERAPICTURE:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_PICTURE, value),
-				ITERATIONS_SHORT);
+		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_PICTURE,
+				value),	ITERATIONS_SHORT);
 		break;
 	case SONY_PIC_COMMAND_SETCAMERAAGC:
 		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_AGC, value),
@@ -3089,7 +3099,8 @@ sony_pic_read_possible_resource(struct a
 	case ACPI_RESOURCE_TYPE_START_DEPENDENT:
 		{
 			/* start IO enumeration */
-			struct sony_pic_ioport *ioport = kzalloc(sizeof(*ioport),
GFP_KERNEL);
+			struct sony_pic_ioport *ioport =
+					kzalloc(sizeof(*ioport), GFP_KERNEL);
 			if (!ioport)
 				return AE_ERROR;
 
@@ -3137,7 +3148,8 @@ sony_pic_read_possible_resource(struct a
 		{
 			struct acpi_resource_io *io = &resource->data.io;
 			struct sony_pic_ioport *ioport =
-				list_first_entry(&dev->ioports, struct sony_pic_ioport, list);
+				list_first_entry(&dev->ioports,
+						struct sony_pic_ioport, list);
 			if (!io) {
 				dprintk("Blank IO resource\n");
 				return AE_OK;
@@ -3145,16 +3157,17 @@ sony_pic_read_possible_resource(struct a
 
 			if (!ioport->io1.minimum) {
 				memcpy(&ioport->io1, io, sizeof(*io));
-				dprintk("IO1 at 0x%.4x (0x%.2x)\n", ioport->io1.minimum,
+				dprintk("IO1 at 0x%.4x (0x%.2x)\n",
+						ioport->io1.minimum,
 						ioport->io1.address_length);
-			}
-			else if (!ioport->io2.minimum) {
+			} else if (!ioport->io2.minimum) {
 				memcpy(&ioport->io2, io, sizeof(*io));
-				dprintk("IO2 at 0x%.4x (0x%.2x)\n", ioport->io2.minimum,
+				dprintk("IO2 at 0x%.4x (0x%.2x)\n",
+						ioport->io2.minimum,
 						ioport->io2.address_length);
-			}
-			else {
-				pr_err("Unknown SPIC Type, more than 2 IO Ports\n");
+			} else {
+				pr_err("Unknown SPIC Type, "
+					"more than 2 IO Ports\n");
 				return AE_ERROR;
 			}
 			return AE_OK;
@@ -3477,24 +3490,26 @@ static int sony_pic_add(struct acpi_devi
 			/* Type 1 have 2 ioports */
 			if (io->io2.minimum) {
 				if (request_region(io->io2.minimum,
-						io->io2.address_length,
-						"Sony Programmable I/O Device")) {
-					dprintk("I/O port2: 0x%.4x (0x%.4x) + 0x%.2x\n",
-							io->io2.minimum, io->io2.maximum,
+					io->io2.address_length,
+					"Sony Programmable I/O Device")) {
+					dprintk("I/O port2: 0x%.4x (0x%.4x) "
+							"+ 0x%.2x\n",
+							io->io2.minimum,
+							io->io2.maximum,
 							io->io2.address_length);
 					spic_dev.cur_ioport = io;
 					break;
-				}
-				else {
+				} else {
 					dprintk("Unable to get I/O port2: "
-							"0x%.4x (0x%.4x) + 0x%.2x\n",
-							io->io2.minimum, io->io2.maximum,
+							"0x%.4x (0x%.4x) "
+							"+ 0x%.2x\n",
+							io->io2.minimum,
+							io->io2.maximum,
 							io->io2.address_length);
 					release_region(io->io1.minimum,
 							io->io1.address_length);
 				}
-			}
-			else {
+			} else {
 				spic_dev.cur_ioport = io;
 				break;
 			}
@@ -3509,7 +3524,7 @@ static int sony_pic_add(struct acpi_devi
 	/* request IRQ */
 	list_for_each_entry_reverse(irq, &spic_dev.interrupts, list) {
 		if (!request_irq(irq->irq.interrupts[0], sony_pic_irq,
-					IRQF_DISABLED, "sony-laptop", &spic_dev)) {
+				IRQF_DISABLED, "sony-laptop", &spic_dev)) {
 			dprintk("IRQ: %d - triggering: %d - "
 					"polarity: %d - shr: %d\n",
 					irq->irq.interrupts[0],
@@ -3539,7 +3554,8 @@ static int sony_pic_add(struct acpi_devi
 	if (result)
 		goto err_disable_device;
 
-	result = sysfs_create_group(&sony_pf_device->dev.kobj,
&spic_attribute_group);
+	result = sysfs_create_group(&sony_pf_device->dev.kobj,
+					&spic_attribute_group);
 	if (result)
 		goto err_remove_pf;
 
