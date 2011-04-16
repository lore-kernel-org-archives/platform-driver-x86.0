From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH] sony-laptop: limit brightness range to DSDT provided ones
Date: Sat, 16 Apr 2011 22:04:19 +0900
Message-ID: <1302959059-4810-1-git-send-email-malattia@linux.it>
References: <20110414224210.GA9459@kamineko.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:40119 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751106Ab1DPNVm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 16 Apr 2011 09:21:42 -0400
Received: by pzk9 with SMTP id 9so1371604pzk.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Apr 2011 06:21:41 -0700 (PDT)
In-Reply-To: <20110414224210.GA9459@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

The new style brightness control provides an operating range of 9 values
(seems consistent over a large number of models sharing the same
brightness control methods).
Read and use the minimum and maximum values to limit the backlight
interface between those boundaries.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  126 +++++++++++++++++++++++++++++-------
 1 files changed, 102 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 8f709ae..cd327cf 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -934,6 +934,14 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 /*
  * Backlight device
  */
+struct sony_backlight_props {
+	struct backlight_device *dev;
+	int			handle;
+	u8			offset;
+	u8			maxlvl;
+};
+struct sony_backlight_props sony_bl_props;
+
 static int sony_backlight_update_status(struct backlight_device *bd)
 {
 	return acpi_callsetfunc(sony_nc_acpi_handle, "SBRT",
@@ -953,20 +961,23 @@ static int sony_backlight_get_brightness(struct backlight_device *bd)
 static int sony_nc_get_brightness_ng(struct backlight_device *bd)
 {
 	int result;
-	int *handle = (int *)bl_get_data(bd);
+	struct sony_backlight_props *sdev =
+		(struct sony_backlight_props *)bl_get_data(bd);
 
-	sony_call_snc_handle(*handle, 0x0200, &result);
+	sony_call_snc_handle(sdev->handle, 0x0200, &result);
 
-	return result & 0xff;
+	return (result & 0xff) - sdev->offset;
 }
 
 static int sony_nc_update_status_ng(struct backlight_device *bd)
 {
 	int value, result;
-	int *handle = (int *)bl_get_data(bd);
+	struct sony_backlight_props *sdev =
+		(struct sony_backlight_props *)bl_get_data(bd);
 
-	value = bd->props.brightness;
-	sony_call_snc_handle(*handle, 0x0100 | (value << 16), &result);
+	value = bd->props.brightness + sdev->offset;
+	if (sony_call_snc_handle(sdev->handle, 0x0100 | (value << 16), &result))
+		return -EIO;
 
 	return sony_nc_get_brightness_ng(bd);
 }
@@ -981,8 +992,6 @@ static const struct backlight_ops sony_backlight_ng_ops = {
 	.update_status = sony_nc_update_status_ng,
 	.get_brightness = sony_nc_get_brightness_ng,
 };
-static int backlight_ng_handle;
-static struct backlight_device *sony_backlight_device;
 
 /*
  * New SNC-only Vaios event mapping to driver known keys
@@ -1549,6 +1558,75 @@ static void sony_nc_kbd_backlight_resume(void)
 				&ignore);
 }
 
+static void sony_nc_backlight_ng_read_limits(int handle,
+		struct sony_backlight_props *props)
+{
+	int offset;
+	acpi_status status;
+	u8 brlvl, i;
+	u8 min = 0xff, max = 0x00;
+	struct acpi_object_list params;
+	union acpi_object in_obj;
+	union acpi_object *lvl_enum;
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+
+	props->handle = handle;
+	props->offset = 0;
+	props->maxlvl = 0xff;
+
+	offset = sony_find_snc_handle(handle);
+	if (offset < 0)
+		return;
+
+	/* try to read the boundaries from ACPI tables, if we fail the above
+	 * defaults should be reasonable
+	 */
+	params.count = 1;
+	params.pointer = &in_obj;
+	in_obj.type = ACPI_TYPE_INTEGER;
+	in_obj.integer.value = offset;
+	status = acpi_evaluate_object(sony_nc_acpi_handle, "SN06", &params,
+			&buffer);
+	if (ACPI_FAILURE(status))
+		return;
+
+	lvl_enum = (union acpi_object *) buffer.pointer;
+	if (!lvl_enum) {
+		pr_err(DRV_PFX "No SN06 return object.");
+		return;
+	}
+	if (lvl_enum->type != ACPI_TYPE_BUFFER) {
+		pr_err(DRV_PFX "Invalid SN06 return object 0x%.2x\n",
+				lvl_enum->type);
+		goto out_invalid;
+	}
+
+	/* the buffer lists brightness levels available, brightness levels are
+	 * from 0 to 8 in the array, other values are used by ALS control.
+	 */
+	for (i = 0; i < 9 && i < lvl_enum->buffer.length; i++) {
+
+		brlvl = *(lvl_enum->buffer.pointer + i);
+		dprintk("Brightness level: %d\n", brlvl);
+
+		if (!brlvl)
+			break;
+
+		if (brlvl > max)
+			max = brlvl;
+		if (brlvl < min)
+			min = brlvl;
+	}
+	props->offset = min;
+	props->maxlvl = max;
+	dprintk("Brightness levels: min=%d max=%d\n", props->offset,
+			props->maxlvl);
+
+out_invalid:
+	kfree(buffer.pointer);
+	return;
+}
+
 static void sony_nc_backlight_setup(void)
 {
 	acpi_handle unused;
@@ -1557,14 +1635,14 @@ static void sony_nc_backlight_setup(void)
 	struct backlight_properties props;
 
 	if (sony_find_snc_handle(0x12f) != -1) {
-		backlight_ng_handle = 0x12f;
 		ops = &sony_backlight_ng_ops;
-		max_brightness = 0xff;
+		sony_nc_backlight_ng_read_limits(0x12f, &sony_bl_props);
+		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
 
 	} else if (sony_find_snc_handle(0x137) != -1) {
-		backlight_ng_handle = 0x137;
 		ops = &sony_backlight_ng_ops;
-		max_brightness = 0xff;
+		sony_nc_backlight_ng_read_limits(0x137, &sony_bl_props);
+		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
 
 	} else if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "GBRT",
 						&unused))) {
@@ -1577,22 +1655,22 @@ static void sony_nc_backlight_setup(void)
 	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_PLATFORM;
 	props.max_brightness = max_brightness;
-	sony_backlight_device = backlight_device_register("sony", NULL,
-							  &backlight_ng_handle,
+	sony_bl_props.dev = backlight_device_register("sony", NULL,
+							  &sony_bl_props,
 							  ops, &props);
 
-	if (IS_ERR(sony_backlight_device)) {
+	if (IS_ERR(sony_bl_props.dev)) {
 		pr_warning(DRV_PFX "unable to register backlight device\n");
-		sony_backlight_device = NULL;
+		sony_bl_props.dev = NULL;
 	} else
-		sony_backlight_device->props.brightness =
-		    ops->get_brightness(sony_backlight_device);
+		sony_bl_props.dev->props.brightness =
+		    ops->get_brightness(sony_bl_props.dev);
 }
 
 static void sony_nc_backlight_cleanup(void)
 {
-	if (sony_backlight_device)
-		backlight_device_unregister(sony_backlight_device);
+	if (sony_bl_props.dev)
+		backlight_device_unregister(sony_bl_props.dev);
 }
 
 static int sony_nc_add(struct acpi_device *device)
@@ -2590,7 +2668,7 @@ static long sonypi_misc_ioctl(struct file *fp, unsigned int cmd,
 	mutex_lock(&spic_dev.lock);
 	switch (cmd) {
 	case SONYPI_IOCGBRT:
-		if (sony_backlight_device == NULL) {
+		if (sony_bl_props.dev == NULL) {
 			ret = -EIO;
 			break;
 		}
@@ -2603,7 +2681,7 @@ static long sonypi_misc_ioctl(struct file *fp, unsigned int cmd,
 				ret = -EFAULT;
 		break;
 	case SONYPI_IOCSBRT:
-		if (sony_backlight_device == NULL) {
+		if (sony_bl_props.dev == NULL) {
 			ret = -EIO;
 			break;
 		}
@@ -2617,8 +2695,8 @@ static long sonypi_misc_ioctl(struct file *fp, unsigned int cmd,
 			break;
 		}
 		/* sync the backlight device status */
-		sony_backlight_device->props.brightness =
-		    sony_backlight_get_brightness(sony_backlight_device);
+		sony_bl_props.dev->props.brightness =
+		    sony_backlight_get_brightness(sony_bl_props.dev);
 		break;
 	case SONYPI_IOCGBAT1CAP:
 		if (ec_read16(SONYPI_BAT1_FULL, &val16)) {
-- 
1.7.4.1
