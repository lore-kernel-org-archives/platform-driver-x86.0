From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 24/25] sony-laptop: backlight device changes
Date: Fri, 03 Jun 2011 22:10:13 +0200
Message-ID: <4DE93FA5.7000705@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa012-1msr.fastwebnet.it ([62.101.93.132]:51702 "EHLO
	aa012-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755546Ab1FCUKS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 16:10:18 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

On Vaio models equipped with an ALS device, when the video driver 
backlight device is not used, a similar backlight device (based on the 
_BCM method implementation) is created by the sony-laptop driver, using 
the same backlight levels.


Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1038,69 +1038,6 @@ static ssize_t sony_nc_sysfs_store(struc
  	return count;
  }

-
-/*
- * Backlight device
- */
-struct sony_backlight_props {
-	struct backlight_device *dev;
-	int			handle;
-	u8			offset;
-	u8			maxlvl;
-};
-struct sony_backlight_props sony_bl_props;
-
-static int sony_backlight_update_status(struct backlight_device *bd)
-{
-	return acpi_callsetfunc(sony_nc_acpi_handle, "SBRT",
-				bd->props.brightness + 1, NULL);
-}
-
-static int sony_backlight_get_brightness(struct backlight_device *bd)
-{
-	unsigned int value;
-
-	if (acpi_callgetfunc(sony_nc_acpi_handle, "GBRT", &value))
-		return 0;
-	/* brightness levels are 1-based, while backlight ones are 0-based */
-	return value - 1;
-}
-
-static int sony_nc_get_brightness_ng(struct backlight_device *bd)
-{
-	unsigned int result;
-	struct sony_backlight_props *sdev =
-		(struct sony_backlight_props *)bl_get_data(bd);
-
-	sony_call_snc_handle(sdev->handle, 0x0200, &result);
-
-	return (result & 0xff) - sdev->offset;
-}
-
-static int sony_nc_update_status_ng(struct backlight_device *bd)
-{
-	unsigned int value, result;
-	struct sony_backlight_props *sdev =
-		(struct sony_backlight_props *)bl_get_data(bd);
-
-	value = bd->props.brightness + sdev->offset;
-	if (sony_call_snc_handle(sdev->handle, 0x0100 | (value << 16), &result))
-		return -EIO;
-
-	return value;
-}
-
-static const struct backlight_ops sony_backlight_ops = {
-	.options = BL_CORE_SUSPENDRESUME,
-	.update_status = sony_backlight_update_status,
-	.get_brightness = sony_backlight_get_brightness,
-};
-static const struct backlight_ops sony_backlight_ng_ops = {
-	.options = BL_CORE_SUSPENDRESUME,
-	.update_status = sony_nc_update_status_ng,
-	.get_brightness = sony_nc_get_brightness_ng,
-};
-
  /*
   * New SNC-only Vaios event mapping to driver known keys
   */
@@ -2069,6 +2006,44 @@ static int sony_nc_als_managed_set(unsig
  	return ret;
  }

+static unsigned int level;
+static int sony_nc_als_get_brightness(struct backlight_device *bd)
+{
+	if (bd->props.brightness != level)
+		dprintk("bd->props.brightness != level\n");
+
+	return level;
+}
+
+static int sony_nc_als_update_status(struct backlight_device *bd)
+{
+	unsigned int value, result;
+
+	if (als_handle->managed) {
+		if (bd->props.brightness != level) {
+			dprintk("generating ALS event 3 (reason: 2)\n");
+			acpi_bus_generate_proc_event(sony_nc_acpi_device,
+					3, 2);
+			acpi_bus_generate_netlink_event(
+					sony_nc_acpi_device->pnp.device_class,
+					dev_name(&sony_nc_acpi_device->dev),
+					3, 2);
+		}
+	} else {
+		unsigned int cmd;
+
+		value = als_handle->levels[bd->props.brightness];
+		cmd = sony_als_handle == 0x0143 ? 0x3000 : 0x0100;
+		if (sony_call_snc_handle(sony_als_handle,
+					(value << 0x10) | cmd, &result))
+			return -EIO;
+	}
+
+	level = bd->props.brightness;
+
+	return level;
+}
+
  /*	ALS sys interface	*/
  static ssize_t sony_nc_als_power_show(struct device *dev,
  		struct device_attribute *attr, char *buffer)
@@ -2245,7 +2220,6 @@ static ssize_t sony_nc_als_kelvin_show(s
  	return count;
  }

-
  /*	ALS attach/detach functions	*/
  static int sony_nc_als_setup(struct platform_device *pd)
  {
@@ -3742,76 +3716,38 @@ static int sony_nc_odd_cleanup(struct pl
  	return 0;
  }

+/*
+ * Backlight device
+ */
+static struct backlight_device *sony_backlight_device;

-static void sony_nc_backlight_ng_read_limits(int handle,
-		struct sony_backlight_props *props)
+static int sony_backlight_update_status(struct backlight_device *bd)
  {
-	int offset;
-	acpi_status status;
-	u8 brlvl, i;
-	u8 min = 0xff, max = 0x00;
-	struct acpi_object_list params;
-	union acpi_object in_obj;
-	union acpi_object *lvl_enum;
-	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-
-	props->handle = handle;
-	props->offset = 0;
-	props->maxlvl = 0xff;
-
-	offset = sony_find_snc_handle(handle);
-	if (offset < 0)
-		return;
-
-	/* try to read the boundaries from ACPI tables, if we fail the above
-	 * defaults should be reasonable
-	 */
-	params.count = 1;
-	params.pointer = &in_obj;
-	in_obj.type = ACPI_TYPE_INTEGER;
-	in_obj.integer.value = offset;
-	status = acpi_evaluate_object(sony_nc_acpi_handle, "SN06", &params,
-			&buffer);
-	if (ACPI_FAILURE(status))
-		return;
-
-	lvl_enum = (union acpi_object *) buffer.pointer;
-	if (!lvl_enum) {
-		pr_err("No SN06 return object.");
-		return;
-	}
-	if (lvl_enum->type != ACPI_TYPE_BUFFER) {
-		pr_err("Invalid SN06 return object 0x%.2x\n",
-		       lvl_enum->type);
-		goto out_invalid;
-	}
-
-	/* the buffer lists brightness levels available, brightness levels are
-	 * from 0 to 8 in the array, other values are used by ALS control.
-	 */
-	for (i = 0; i < 9 && i < lvl_enum->buffer.length; i++) {
-
-		brlvl = *(lvl_enum->buffer.pointer + i);
-		dprintk("Brightness level: %d\n", brlvl);
-
-		if (!brlvl)
-			break;
+	return acpi_callsetfunc(sony_nc_acpi_handle, "SBRT",
+				bd->props.brightness + 1, NULL);
+}

-		if (brlvl > max)
-			max = brlvl;
-		if (brlvl < min)
-			min = brlvl;
-	}
-	props->offset = min;
-	props->maxlvl = max;
-	dprintk("Brightness levels: min=%d max=%d\n", props->offset,
-			props->maxlvl);
+static int sony_backlight_get_brightness(struct backlight_device *bd)
+{
+	unsigned int value;

-out_invalid:
-	kfree(buffer.pointer);
-	return;
+	if (acpi_callgetfunc(sony_nc_acpi_handle, "GBRT", &value))
+		return 0;
+	/* brightness levels are 1-based, while backlight ones are 0-based */
+	return value - 1;
  }

+static const struct backlight_ops sony_backlight_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = sony_backlight_update_status,
+	.get_brightness = sony_backlight_get_brightness,
+};
+static const struct backlight_ops sony_als_backlight_ops = {
+	.options = BL_CORE_SUSPENDRESUME,
+	.update_status = sony_nc_als_update_status,
+	.get_brightness = sony_nc_als_get_brightness,
+};
+
  static void sony_nc_backlight_setup(void)
  {
  	acpi_handle unused;
@@ -3819,43 +3755,38 @@ static void sony_nc_backlight_setup(void
  	const struct backlight_ops *ops = NULL;
  	struct backlight_properties props;

-	if (sony_find_snc_handle(0x12f) != -1) {
-		ops = &sony_backlight_ng_ops;
-		sony_nc_backlight_ng_read_limits(0x12f, &sony_bl_props);
-		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
-
-	} else if (sony_find_snc_handle(0x137) != -1) {
-		ops = &sony_backlight_ng_ops;
-		sony_nc_backlight_ng_read_limits(0x137, &sony_bl_props);
-		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
-
+	/* do not use SNC GBRT/SBRT controls along with the ALS */
+	if (sony_als_handle != -1) {
+		/* ALS based backlight device */
+		ops = &sony_als_backlight_ops;
+		max_brightness = als_handle->levels_num - 1;
  	} else if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "GBRT",
  						&unused))) {
  		ops = &sony_backlight_ops;
  		max_brightness = SONY_MAX_BRIGHTNESS - 1;
-
-	} else
+	} else {
  		return;
+	}

  	memset(&props, 0, sizeof(struct backlight_properties));
  	props.type = BACKLIGHT_PLATFORM;
  	props.max_brightness = max_brightness;
-	sony_bl_props.dev = backlight_device_register("sony", NULL,
-						      &sony_bl_props,
-						      ops, &props);
+	sony_backlight_device = backlight_device_register("sony", NULL, NULL,
+								ops, &props);

-	if (IS_ERR(sony_bl_props.dev)) {
+	if (IS_ERR(sony_backlight_device)) {
  		pr_warn("unable to register backlight device\n");
-		sony_bl_props.dev = NULL;
-	} else
-		sony_bl_props.dev->props.brightness =
-			ops->get_brightness(sony_bl_props.dev);
+		sony_backlight_device = NULL;
+	} else {
+		sony_backlight_device->props.brightness =
+			ops->get_brightness(sony_backlight_device);
+	}
  }

  static void sony_nc_backlight_cleanup(void)
  {
-	if (sony_bl_props.dev)
-		backlight_device_unregister(sony_bl_props.dev);
+	if (sony_backlight_device)
+		backlight_device_unregister(sony_backlight_device);
  }

  static void sony_nc_snc_setup_handles(struct platform_device *pd)
@@ -5273,7 +5204,7 @@ static long sonypi_misc_ioctl(struct fil
  	mutex_lock(&spic_dev.lock);
  	switch (cmd) {
  	case SONYPI_IOCGBRT:
-		if (sony_bl_props.dev == NULL) {
+		if (sony_backlight_device == NULL) {
  			ret = -EIO;
  			break;
  		}
@@ -5286,7 +5217,7 @@ static long sonypi_misc_ioctl(struct fil
  				ret = -EFAULT;
  		break;
  	case SONYPI_IOCSBRT:
-		if (sony_bl_props.dev == NULL) {
+		if (sony_backlight_device == NULL) {
  			ret = -EIO;
  			break;
  		}
@@ -5300,8 +5231,8 @@ static long sonypi_misc_ioctl(struct fil
  			break;
  		}
  		/* sync the backlight device status */
-		sony_bl_props.dev->props.brightness =
-		    sony_backlight_get_brightness(sony_bl_props.dev);
+		sony_backlight_device->props.brightness =
+		    sony_backlight_get_brightness(sony_backlight_device);
  		break;
  	case SONYPI_IOCGBAT1CAP:
  		if (ec_read16(SONYPI_BAT1_FULL, &val16)) {
