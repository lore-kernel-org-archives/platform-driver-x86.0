From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 13/25] sony-laptop: code style fixes
Date: Fri, 03 Jun 2011 17:45:01 +0200
Message-ID: <4DE9017D.7080508@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:44415 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753327Ab1FCPpF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 11:45:05 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

This patch fixes many style ERROR and WARNING complains by checkpatch 
about the old code.

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
@@ -376,7 +376,8 @@ static void sony_laptop_report_input_eve

  	default:
  		if (event >= ARRAY_SIZE(sony_laptop_input_index)) {
-			dprintk("sony_laptop_report_input_event, event not known: %d\n", event);
+			dprintk("sony_laptop_report_input_event, "
+				"event not known: %d\n", event);
  			break;
  		}
  		if (sony_laptop_input_index[event] != -1) {
@@ -572,12 +573,12 @@ static int sony_pf_add(void)

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
@@ -671,7 +672,8 @@ static struct sony_nc_value sony_nc_valu
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
@@ -691,7 +693,7 @@ static struct sony_nc_value sony_nc_valu
  };

  static acpi_handle sony_nc_acpi_handle;
-static struct acpi_device *sony_nc_acpi_device = NULL;
+static struct acpi_device *sony_nc_acpi_device;

  /*
   * acpi_evaluate_object wrappers
@@ -738,7 +740,8 @@ static int acpi_callsetfunc(acpi_handle
  	if (status == AE_OK) {
  		if (result != NULL) {
  			if (out_obj.type != ACPI_TYPE_INTEGER) {
-				pr_warn("acpi_evaluate_object bad return type\n");
+				pr_warn("acpi_evaluate_object bad "
+					"return type\n");
  				return -1;
  			}
  			*result = out_obj.integer.value;
@@ -951,11 +954,11 @@ static int sony_call_snc_handle_buffer(i
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
@@ -977,8 +980,9 @@ static int boolean_validate(const int di
  /*
   * Sysfs show/store common to all sony_nc_values
   */
-static ssize_t sony_nc_sysfs_show(struct device *dev, struct 
device_attribute *attr,
-			      char *buffer)
+static ssize_t sony_nc_sysfs_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buffer)
  {
  	unsigned int value;
  	struct sony_nc_value *item =
@@ -1019,7 +1023,8 @@ static ssize_t sony_nc_sysfs_store(struc
  	if (value < 0)
  		return value;

-	if (acpi_callsetfunc(sony_nc_acpi_handle, *item->acpiset, value, NULL) 
< 0)
+	if (acpi_callsetfunc(sony_nc_acpi_handle,
+				*item->acpiset, value, NULL) < 0)
  		return -EIO;
  	item->value = value;
  	item->valid = 1;
@@ -2001,7 +2006,8 @@ static int sony_nc_add(struct acpi_devic

  	/* read device status */
  	result = acpi_bus_get_status(device);
-	/* bail IFF the above call was successful and the device is not present */
+	/* bail IFF the above call was successful
+	   and the device is not present */
  	if (!result && !device->status.present) {
  		dprintk("Device not present\n");
  		result = -ENODEV;
@@ -2045,7 +2051,8 @@ static int sony_nc_add(struct acpi_devic
  	}

  	if (acpi_video_backlight_support()) {
-		pr_info("brightness ignored, must be controlled by ACPI video driver\n");
+		pr_info("brightness ignored, must be "
+			"controlled by ACPI video driver\n");
  	} else {
  		sony_nc_backlight_setup();
  	}
@@ -2091,21 +2098,21 @@ static int sony_nc_add(struct acpi_devic

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
  	sony_nc_snc_cleanup(sony_pf_device);

-      outpresent:
+outpresent:
  	sony_pf_remove();

-      outwalk:
+outwalk:
  	return result;
  }

@@ -2117,9 +2124,8 @@ static int sony_nc_remove(struct acpi_de

  	sony_nc_acpi_device = NULL;

-	for (item = sony_nc_values; item->name; ++item) {
+	for (item = sony_nc_values; item->name; ++item)
  		device_remove_file(&sony_pf_device->dev, &item->devattr);
-	}

  	sony_nc_snc_cleanup(sony_pf_device);
  	sony_pf_remove();
@@ -2501,11 +2507,14 @@ static u8 sony_pic_call3(u8 dev, u8 fn,
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
@@ -2619,19 +2628,19 @@ out:
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
@@ -2715,28 +2724,28 @@ int sony_pic_camera_command(int command,
  			__sony_pic_camera_off();
  		break;
  	case SONY_PIC_COMMAND_SETCAMERABRIGHTNESS:
-		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_BRIGHTNESS, value),
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
@@ -3203,7 +3212,8 @@ sony_pic_read_possible_resource(struct a
  	case ACPI_RESOURCE_TYPE_START_DEPENDENT:
  		{
  			/* start IO enumeration */
-			struct sony_pic_ioport *ioport = kzalloc(sizeof(*ioport), GFP_KERNEL);
+			struct sony_pic_ioport *ioport =
+					kzalloc(sizeof(*ioport), GFP_KERNEL);
  			if (!ioport)
  				return AE_ERROR;

@@ -3251,7 +3261,8 @@ sony_pic_read_possible_resource(struct a
  		{
  			struct acpi_resource_io *io = &resource->data.io;
  			struct sony_pic_ioport *ioport =
-				list_first_entry(&dev->ioports, struct sony_pic_ioport, list);
+				list_first_entry(&dev->ioports,
+						struct sony_pic_ioport, list);
  			if (!io) {
  				dprintk("Blank IO resource\n");
  				return AE_OK;
@@ -3259,16 +3270,17 @@ sony_pic_read_possible_resource(struct a

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
@@ -3591,24 +3603,26 @@ static int sony_pic_add(struct acpi_devi
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
@@ -3623,7 +3637,7 @@ static int sony_pic_add(struct acpi_devi
  	/* request IRQ */
  	list_for_each_entry_reverse(irq, &spic_dev.interrupts, list) {
  		if (!request_irq(irq->irq.interrupts[0], sony_pic_irq,
-					IRQF_DISABLED, "sony-laptop", &spic_dev)) {
+				IRQF_DISABLED, "sony-laptop", &spic_dev)) {
  			dprintk("IRQ: %d - triggering: %d - "
  					"polarity: %d - shr: %d\n",
  					irq->irq.interrupts[0],
@@ -3653,7 +3667,8 @@ static int sony_pic_add(struct acpi_devi
  	if (result)
  		goto err_disable_device;

-	result = sysfs_create_group(&sony_pf_device->dev.kobj, 
&spic_attribute_group);
+	result = sysfs_create_group(&sony_pf_device->dev.kobj,
+					&spic_attribute_group);
  	if (result)
  		goto err_remove_pf;
