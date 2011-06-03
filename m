From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 16/25] sony-laptop: add HDD shock protection
Date: Fri, 03 Jun 2011 19:45:24 +0200
Message-ID: <4DE91DB4.1050805@absence.it>
References: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa013-1msr.fastwebnet.it ([62.101.93.133]:43978 "EHLO
	aa013-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751976Ab1FCRp2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 13:45:28 -0400
In-Reply-To: <4DE8FC4A.9010401@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Vaio S models can unload the HDD heads by means of the SATA power 
connector and an accelerometer, using the Embedded Controller. This 
patch provides the necessary controls for this functionality and the 
shock event notification to userspace.

Signed-off-by: Marco Chiappero <marco@absence.it>
---

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -140,6 +140,13 @@ MODULE_PARM_DESC(kbd_backlight_timeout,
  		 "1 for 30 seconds, 2 for 60 seconds and 3 to disable timeout "
  		 "(default: 0)");

+static int force_shock_notifications;	/* = 0 */
+module_param(force_shock_notifications, int, 0);
+MODULE_PARM_DESC(force_shock_notifications,
+		"set this to 1 to force the generation of shock protection "
+		"events, even though the notebook do not support head "
+		"unloading for the installed drive drive");
+

  static int sony_rfkill_handle = -1;
  static int sony_nc_get_rfkill_hwblock(void);
@@ -1611,6 +1618,362 @@ static void sony_nc_kbd_backlight_resume
  				(kbdbl_handle->timeout << 0x10), &result);
  }

+/*	GSensor, HDD Shock Protection	*/
+enum axis {
+	X_AXIS = 4,	/* frontal  */
+	Y_AXIS,		/* lateral  */
+	Z_AXIS		/* vertical */
+};
+
+struct gsensor_control {
+	unsigned int attrs_num;
+	struct device_attribute *attrs;
+};
+static struct gsensor_control *gs_handle;
+static int sony_gs_handle = -1;
+
+/* the EC uses pin #11 of the SATA power connector to command the
+   immediate idle feature; however some drives do not implement it
+   and pin #11 is NC. Let's verify, otherwise no automatic
+   protection is possible by the hardware
+*/
+static int sony_nc_gsensor_support_get(unsigned int *support)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(sony_gs_handle, 0x0200, &result))
+		return -EIO;
+
+	*support = sony_gs_handle == 0x0134
+			? !!(result & 0x20)
+			: !!(result & 0x01);
+
+	return 0;
+}
+
+static int sony_nc_gsensor_status_set(int value)
+{
+	unsigned int result, capable, reg, arg;
+	bool update = false;
+
+	if (sony_nc_gsensor_support_get(&capable))
+		return -EIO;
+
+	if (!capable)
+		pr_warn("hardware protection not available, the HDD"
+			       " do not support this feature\n");
+
+	/* do not return immediately even though there is no HW
+	 * capability, userspace can thus receive the shock
+	 * notifications and call the ATA7 immediate idle command to
+	 * unload the heads. Just return after enabling notifications
+	*/
+	reg = sony_gs_handle == 0x0134 ? (!value << 0x08) : (value << 0x10);
+
+	if (sony_call_snc_handle(sony_gs_handle, reg, &result))
+		return -EIO;
+
+	if (!capable)
+		return 0;
+
+	/* if the requested protection setting is different
+	   from the current one
+	*/
+	reg = sony_gs_handle == 0x0134 ? 0x0200 : 0x0400;
+	if (sony_call_snc_handle(sony_gs_handle, reg, &result))
+		return -EIO;
+
+	if (sony_gs_handle == 0x0134) {
+		if (!!(result & 0x04) != value) {
+			arg = (result & 0x1B) | (value << 0x02);
+			update = true;
+		}
+	} else {
+		if ((result & 0x01) != value) {
+			arg = value;
+			update = true;
+		}
+	}
+
+	if (update && sony_call_snc_handle(sony_gs_handle,
+			(arg << 0x10) | 0x0300, &result))
+		return -EIO;
+
+	return 0;
+}
+
+static int sony_nc_gsensor_axis_get(enum axis name)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(sony_gs_handle, name << 0x08, &result))
+		return -EIO;
+
+	return result;
+}
+
+/*			G sensor sys interface			*/
+static ssize_t sony_nc_gsensor_type_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int result;
+
+	if (sony_call_snc_handle(sony_gs_handle, 0x0200, &result))
+		return -EIO;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", (result >> 0x03) & 0x03);
+
+	return count;
+}
+
+static ssize_t sony_nc_gsensor_type_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	/*
+	 *  axis out type control file:
+	 *  0: raw values, 1: acc values 2: threshold values
+	 */
+	unsigned int result;
+	unsigned long value;
+
+	/* sanity checks and conversion */
+	if (count > 31 || strict_strtoul(buffer, 10, &value) || value > 2)
+		return -EINVAL;
+
+	value <<= 0x03;
+
+	/* retrieve the current state / settings */
+	if (sony_call_snc_handle(sony_gs_handle, 0x0200, &result))
+		return -EIO;
+
+	if ((result & 0x18) != value) {
+		/* the last 3 bits need to be preserved */
+		value |= (result & 0x07);
+
+		if (sony_call_snc_handle(sony_gs_handle,
+				(value << 0x10) | 0x0300, &result))
+				return -EIO;
+	}
+
+	return count;
+}
+
+static ssize_t sony_nc_gsensor_axis_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int result;
+	enum axis arg;
+
+	/* file being read for axis selection */
+	if (!strcmp(attr->attr.name, "gsensor_xval"))
+		arg = X_AXIS;
+	else if (!strcmp(attr->attr.name, "gsensor_yval"))
+		arg = Y_AXIS;
+	else if (!strcmp(attr->attr.name, "gsensor_zval"))
+		arg = Z_AXIS;
+	else
+		return count;
+
+	result = sony_nc_gsensor_axis_get(arg);
+	if (result < 0)
+		return -EIO;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", result);
+
+	return count;
+}
+
+static ssize_t sony_nc_gsensor_status_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int result;
+
+	if (sony_gs_handle == 0x0134) {
+		if (sony_call_snc_handle(sony_gs_handle, 0x0200,
+					&result))
+			return -EIO;
+
+		result = !!(result & 0x04);
+	} else {
+		if (sony_call_snc_handle(sony_gs_handle, 0x0400,
+					&result))
+			return -EIO;
+
+		result &= 0x01;
+	}
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", result);
+
+	return count;
+}
+
+static ssize_t sony_nc_gsensor_status_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	int ret;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+	if (strict_strtoul(buffer, 10, &value) || value > 1)
+		return -EINVAL;
+
+	ret = sony_nc_gsensor_status_set(value);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t sony_nc_gsensor_sensitivity_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int result;
+
+	if (sony_call_snc_handle(sony_gs_handle, 0x0200, &result))
+		return -EINVAL;
+
+	count = snprintf(buffer, PAGE_SIZE, "%d\n", result & 0x03);
+	return count;
+}
+
+static ssize_t sony_nc_gsensor_sensitivity_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	unsigned int result;
+	unsigned long value;
+
+	if (count > 31)
+		return -EINVAL;
+	if (strict_strtoul(buffer, 10, &value) || value > 2)
+		return -EINVAL;
+
+	/* retrieve the other parameters to be stored as well */
+	if (sony_call_snc_handle(sony_gs_handle, 0x0200, &result))
+		return -EIO;
+	value |= (result & 0x1C); /* preserve only the needed bits */
+
+	if (sony_call_snc_handle(sony_gs_handle, (value << 0x10)
+		| 0x0300, &result))
+		return -EIO;
+
+	return count;
+}
+
+static int sony_nc_gsensor_setup(struct platform_device *pd)
+{
+	int i, enable, support;
+
+	gs_handle = kzalloc(sizeof(struct gsensor_control), GFP_KERNEL);
+
+	if (!gs_handle)
+		return -ENOMEM;
+
+	gs_handle->attrs_num = sony_gs_handle == 0x0134	? 6 : 1;
+
+	gs_handle->attrs = kzalloc(sizeof(struct device_attribute)
+				* gs_handle->attrs_num, GFP_KERNEL);
+	if (!gs_handle->attrs)
+		goto memerror;
+
+	/* check the storing device support */
+	if (sony_nc_gsensor_support_get(&support))
+		return -EIO;
+
+	/* enable the HDD protection and notification by default
+	   when hardware driven protection is possible */
+	enable = support ? 1 : force_shock_notifications;
+	if (sony_nc_gsensor_status_set(enable))
+		if (enable)
+			pr_warn("failed to enable the HDD shock protection\n");
+
+	/* activation control	*/
+	sysfs_attr_init(&gs_handle->attrs[0].attr);
+	gs_handle->attrs[0].attr.name = "gsensor_protection";
+	gs_handle->attrs[0].attr.mode = S_IRUGO | S_IWUSR;
+	gs_handle->attrs[0].show = sony_nc_gsensor_status_show;
+	gs_handle->attrs[0].store = sony_nc_gsensor_status_store;
+
+	if (gs_handle->attrs_num > 1) {
+		/* sensitivity selection */
+		sysfs_attr_init(&gs_handle->attrs[1].attr);
+		gs_handle->attrs[1].attr.name = "gsensor_sensitivity";
+		gs_handle->attrs[1].attr.mode = S_IRUGO | S_IWUSR;
+		gs_handle->attrs[1].show = sony_nc_gsensor_sensitivity_show;
+		gs_handle->attrs[1].store = sony_nc_gsensor_sensitivity_store;
+		/* x/y/z output selection */
+		sysfs_attr_init(&gs_handle->attrs[2].attr);
+		gs_handle->attrs[2].attr.name = "gsensor_val_type";
+		gs_handle->attrs[2].attr.mode = S_IRUGO | S_IWUSR;
+		gs_handle->attrs[2].show = sony_nc_gsensor_type_show;
+		gs_handle->attrs[2].store = sony_nc_gsensor_type_store;
+
+		sysfs_attr_init(&gs_handle->attrs[3].attr);
+		gs_handle->attrs[3].attr.name = "gsensor_xval";
+		gs_handle->attrs[3].attr.mode = S_IRUGO;
+		gs_handle->attrs[3].show = sony_nc_gsensor_axis_show;
+
+		sysfs_attr_init(&gs_handle->attrs[4].attr);
+		gs_handle->attrs[4].attr.name = "gsensor_yval";
+		gs_handle->attrs[4].attr.mode = S_IRUGO;
+		gs_handle->attrs[4].show = sony_nc_gsensor_axis_show;
+
+		sysfs_attr_init(&gs_handle->attrs[5].attr);
+		gs_handle->attrs[5].attr.name = "gsensor_zval";
+		gs_handle->attrs[5].attr.mode = S_IRUGO;
+		gs_handle->attrs[5].show = sony_nc_gsensor_axis_show;
+	}
+
+	for (i = 0; i < gs_handle->attrs_num; i++) {
+		if (device_create_file(&pd->dev, &gs_handle->attrs[i]))
+			goto attrserror;
+	}
+
+	return 0;
+
+attrserror:
+	for (; i > 0; i--)
+		device_remove_file(&pd->dev, &gs_handle->attrs[i]);
+
+	kfree(gs_handle->attrs);
+memerror:
+	kfree(gs_handle);
+	gs_handle = NULL;
+
+	return -1;
+}
+
+static int sony_nc_gsensor_cleanup(struct platform_device *pd)
+{
+	if (sony_gs_handle != -1) {
+		unsigned int i, result, reg;
+
+		for (i = 0; i < gs_handle->attrs_num; i++)
+			device_remove_file(&pd->dev, &gs_handle->attrs[i]);
+
+		/* disable the event generation,
+		 * preserve any other setting
+		 */
+		reg = sony_gs_handle == 0x0134 ? 0x0100 : 0x0000;
+
+		sony_call_snc_handle(sony_gs_handle, reg, &result);
+
+		kfree(gs_handle->attrs);
+		kfree(gs_handle);
+		gs_handle = NULL;
+	}
+
+	return 0;
+}
+/*			end G sensor code			*/
+
  static struct device_attribute *bcare_attrs;
  static int sony_bc_handle = -1;

@@ -2057,6 +2420,11 @@ static void sony_nc_snc_setup_handles(st
  			sony_kbd_handle = handle;
  			ret = sony_nc_kbd_backlight_setup(pd);
  			break;
+		case 0x0134:
+		case 0x0147:
+			sony_gs_handle = handle;
+			ret = sony_nc_gsensor_setup(pd);
+			break;
  		case 0x0124:
  		case 0x0135:
  			sony_rfkill_handle = handle;
@@ -2101,6 +2469,10 @@ static void sony_nc_snc_cleanup_handles(
  		case 0x0143:
  			sony_nc_kbd_backlight_cleanup(pd);
  			break;
+		case 0x0134:
+		case 0x0147:
+			sony_nc_gsensor_cleanup(pd);
+			break;
  		case 0x0124:
  		case 0x0135:
  			sony_nc_rfkill_cleanup();
@@ -2288,6 +2660,13 @@ static void sony_nc_notify(struct acpi_d
  			ev = 2;
  			break;

+		case 0x0134:
+		case 0x0147:
+			ev = 4;
+			value = 1;
+			/* hdd protection event, notify userspace */
+			break;
+
  		default:
  			value = event;
  			dprintk("Unknowk event for handle: 0x%x\n", handle);
