From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 10/19] sony-laptop: g-shock HD protection function
Date: Sat, 19 May 2012 22:35:53 +0900
Message-ID: <1337434562-12283-11-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47649 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756178Ab2ESNpO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:14 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Marco Chiappero <marco@absence.it>

Vaio S models can unload the HDD heads by means of the SATA power
connector and an accelerometer, using the Embedded Controller.
Some models only provide notifications, others also allow reading of
component vectors of the applied force.

[malattia@linux.it: simplify error handling, set proper return error
codes and fit the general coding style of the sony-laptop driver. Also
make the sysfs interface accept descriptive strings rather than numbers
to signify the value type to be output as the vector components and
added a sysfs file to enumerate the acceptable values. Unloading the
driver also disables the function completely rather than just disabling
notifications.]

Signed-off-by: Marco Chiappero <marco@absence.it>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  376 ++++++++++++++++++++++++++++++++++++
 1 file changed, 376 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 2b72e47..99ce7b6 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -152,6 +152,17 @@ static int sony_nc_thermal_setup(struct platform_device *pd);
 static void sony_nc_thermal_cleanup(struct platform_device *pd);
 static void sony_nc_thermal_resume(void);
 
+struct gsensor_control {
+	int handle;
+	unsigned int attrs_num;
+	bool supports_unloading;
+	struct device_attribute *attrs;
+};
+static struct gsensor_control *gs_ctl;
+static int sony_nc_gsensor_setup(struct platform_device *pd,
+		unsigned int handle);
+static void sony_nc_gsensor_cleanup(struct platform_device *pd);
+
 enum sony_nc_rfkill {
 	SONY_WIFI,
 	SONY_BLUETOOTH,
@@ -1210,6 +1221,12 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 
 			break;
 
+		/* hdd protection event */
+		case 0x0134:
+		case 0x0147:
+			ev_type = 3;
+			break;
+
 		default:
 			dprintk("Unknown event 0x%x for handle 0x%x\n",
 					event, handle);
@@ -1292,6 +1309,13 @@ static void sony_nc_function_setup(struct acpi_device *device,
 				pr_err("couldn't set up thermal profile function (%d)\n",
 						result);
 			break;
+		case 0x0134:
+		case 0x0147:
+			result = sony_nc_gsensor_setup(pf_device, handle);
+			if (result)
+				pr_err("couldn't set up g-shock protection function (%d)\n",
+						result);
+			break;
 		case 0x0124:
 		case 0x0135:
 			sony_nc_rfkill_setup(device);
@@ -1336,6 +1360,10 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 		case 0x0122:
 			sony_nc_thermal_cleanup(pd);
 			break;
+		case 0x0134:
+		case 0x0147:
+			sony_nc_gsensor_cleanup(pd);
+			break;
 		case 0x0124:
 		case 0x0135:
 			sony_nc_rfkill_cleanup();
@@ -2106,6 +2134,354 @@ static void sony_nc_thermal_resume(void)
 		sony_nc_thermal_mode_set(th_handle->mode);
 }
 
+/* GSensor, HDD Shock Protection */
+static int __sony_nc_gsensor_status_set(int enable)
+{
+	unsigned int result, reg, arg;
+
+	/* enable or disable shock notifications */
+	reg = gs_ctl->handle == 0x0134 ? (!enable << 0x08) : (enable << 0x10);
+	if (sony_call_snc_handle(gs_ctl->handle, reg, &result))
+		return -EIO;
+
+	if (!gs_ctl->supports_unloading) {
+		dprintk("g-shock automatic protection not available\n");
+		return 0;
+	}
+
+	/* enable or disable shock protection */
+	reg = gs_ctl->handle == 0x0134 ? 0x0200 : 0x0400;
+	if (sony_call_snc_handle(gs_ctl->handle, reg, &result))
+		return -EIO;
+
+	if (gs_ctl->handle == 0x0134) {
+		/* already set to what we want */
+		if (!!(result & 0x04) == enable)
+			return 0;
+		arg = (result & 0x1B) | (enable << 0x02);
+	} else {
+		/* already set to what we want */
+		if ((result & 0x01) == enable)
+			return 0;
+		arg = enable;
+	}
+
+	if (sony_call_snc_handle(gs_ctl->handle,
+			(arg << 0x10) | 0x0300, &result))
+		return -EIO;
+
+	return 0;
+}
+
+/*
+ * G sensor sys interface
+ */
+static ssize_t sony_nc_gsensor_types_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	return snprintf(buffer, PAGE_SIZE, "raw accel threshold");
+}
+
+static ssize_t sony_nc_gsensor_type_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	unsigned int result;
+
+	if (sony_call_snc_handle(gs_ctl->handle, 0x0200, &result))
+		return -EIO;
+	switch (result & 0x18) {
+	case 0x00:
+		return snprintf(buffer, PAGE_SIZE, "raw\n");
+	case 0x08:
+		return snprintf(buffer, PAGE_SIZE, "accel\n");
+	case 0x10:
+		return snprintf(buffer, PAGE_SIZE, "threshold\n");
+	}
+	return -EINVAL;
+}
+
+static ssize_t sony_nc_gsensor_type_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buffer, size_t count)
+{
+	/* Value types:
+	 * 0x00: raw values
+	 * 0x08: accel values
+	 * 0x10: threshold values
+	 */
+	unsigned int result;
+	unsigned long value;
+	size_t len = count;
+
+	/* skip the newline if present */
+	if (buffer[len - 1] == '\n')
+		len--;
+
+	if (strncmp(buffer, "raw", len) == 0)
+		value = 0x00;
+	else if (strncmp(buffer, "accel", len) == 0)
+		value = 0x08;
+	else if (strncmp(buffer, "threshold", len) == 0)
+		value = 0x10;
+	else
+		return -EINVAL;
+
+	/* retrieve the current state / settings */
+	if (sony_call_snc_handle(gs_ctl->handle, 0x0200, &result))
+		return -EIO;
+
+	/* do nothing if already set to the requested value */
+	if ((result & 0x18) != value)
+		return count;
+
+	/* the last 3 bits need to be preserved */
+	value |= (result & 0x07);
+
+	if (sony_call_snc_handle(gs_ctl->handle,
+				(value << 0x10) | 0x0300, &result))
+		return -EIO;
+
+	return count;
+}
+
+static ssize_t sony_nc_gsensor_axis_show(struct device *dev,
+		struct device_attribute *attr, char *buffer)
+{
+	ssize_t count = 0;
+	unsigned int axis, result;
+
+	/* file being read for axis selection */
+	if (strcmp(attr->attr.name, "gsensor_x_axis") == 0)
+		/* X frontal */
+		axis = 0x400;
+	else if (strcmp(attr->attr.name, "gsensor_y_axis") == 0)
+		/* Y lateral */
+		axis = 0x500;
+	else if (strcmp(attr->attr.name, "gsensor_z_axis") == 0)
+		/* Z vertical */
+		axis = 0x600;
+	else
+		return -EINVAL;
+
+	if (sony_call_snc_handle(gs_ctl->handle, axis, &result))
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
+	if (gs_ctl->handle == 0x0134) {
+		if (sony_call_snc_handle(gs_ctl->handle, 0x0200,
+					&result))
+			return -EIO;
+
+		result = !!(result & 0x04);
+	} else {
+		if (sony_call_snc_handle(gs_ctl->handle, 0x0400,
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
+
+	if (kstrtoul(buffer, 10, &value) || value > 1)
+		return -EINVAL;
+
+	ret = __sony_nc_gsensor_status_set(value);
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
+	if (sony_call_snc_handle(gs_ctl->handle, 0x0200, &result))
+		return -EIO;
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
+	if (kstrtoul(buffer, 10, &value) || value > 2)
+		return -EINVAL;
+
+	/* retrieve the other parameters to be stored as well */
+	if (sony_call_snc_handle(gs_ctl->handle, 0x0200, &result))
+		return -EIO;
+
+	/* preserve only the needed bits */
+	value |= (result & 0x1C);
+
+	if (sony_call_snc_handle(gs_ctl->handle, (value << 0x10) | 0x0300,
+				&result))
+		return -EIO;
+
+	return count;
+}
+
+static int sony_nc_gsensor_setup(struct platform_device *pd,
+		unsigned int handle)
+{
+	int i, result;
+
+	gs_ctl = kzalloc(sizeof(struct gsensor_control), GFP_KERNEL);
+	if (!gs_ctl)
+		return -ENOMEM;
+
+	gs_ctl->handle = handle;
+
+	/* Check support for unloading heads.
+	 * The EC uses pin #11 of the SATA power connector to command the
+	 * immediate idle feature; however some drives do not implement it
+	 * and pin #11 is NC and in this case no automatic protection is
+	 * available.
+	 */
+	if (sony_call_snc_handle(handle, 0x0200, &result))
+		return -EIO;
+
+	if (handle == 0x0134)
+		gs_ctl->supports_unloading = !!(result & 0x20);
+	else
+		gs_ctl->supports_unloading = !!(result & 0x01);
+
+	/* handle 0x0134 has support for tuning sensitivity and reading force
+	 * vector components: we need more sysfs attributes for that one.
+	 */
+	gs_ctl->attrs_num = handle == 0x0134 ? 7 : 1;
+	gs_ctl->attrs = kzalloc(sizeof(struct device_attribute)
+				* gs_ctl->attrs_num, GFP_KERNEL);
+	if (!gs_ctl->attrs) {
+		result = -ENOMEM;
+		goto outnomem;
+	}
+
+	/* enable the HDD protection and notification by default */
+	result = __sony_nc_gsensor_status_set(1);
+	if (result) {
+		pr_warn("failed to enable the HDD shock protection\n");
+		goto outenable;
+	}
+
+	/* activation control	*/
+	sysfs_attr_init(&gs_ctl->attrs[0].attr);
+	gs_ctl->attrs[0].attr.name = "gsensor_protection";
+	gs_ctl->attrs[0].attr.mode = S_IRUGO | S_IWUSR;
+	gs_ctl->attrs[0].show = sony_nc_gsensor_status_show;
+	gs_ctl->attrs[0].store = sony_nc_gsensor_status_store;
+
+	if (gs_ctl->attrs_num > 1) {
+		/* sensitivity selection */
+		sysfs_attr_init(&gs_ctl->attrs[1].attr);
+		gs_ctl->attrs[1].attr.name = "gsensor_sensitivity";
+		gs_ctl->attrs[1].attr.mode = S_IRUGO | S_IWUSR;
+		gs_ctl->attrs[1].show = sony_nc_gsensor_sensitivity_show;
+		gs_ctl->attrs[1].store = sony_nc_gsensor_sensitivity_store;
+		/* x/y/z output selection */
+		sysfs_attr_init(&gs_ctl->attrs[2].attr);
+		gs_ctl->attrs[2].attr.name = "gsensor_value_types";
+		gs_ctl->attrs[2].attr.mode = S_IRUGO;
+		gs_ctl->attrs[2].show = sony_nc_gsensor_types_show;
+
+		/* x/y/z output selection */
+		sysfs_attr_init(&gs_ctl->attrs[3].attr);
+		gs_ctl->attrs[3].attr.name = "gsensor_value_type";
+		gs_ctl->attrs[3].attr.mode = S_IRUGO | S_IWUSR;
+		gs_ctl->attrs[3].show = sony_nc_gsensor_type_show;
+		gs_ctl->attrs[3].store = sony_nc_gsensor_type_store;
+
+		sysfs_attr_init(&gs_ctl->attrs[3].attr);
+		gs_ctl->attrs[4].attr.name = "gsensor_x_axis";
+		gs_ctl->attrs[4].attr.mode = S_IRUGO;
+		gs_ctl->attrs[4].show = sony_nc_gsensor_axis_show;
+
+		sysfs_attr_init(&gs_ctl->attrs[4].attr);
+		gs_ctl->attrs[5].attr.name = "gsensor_y_axis";
+		gs_ctl->attrs[5].attr.mode = S_IRUGO;
+		gs_ctl->attrs[5].show = sony_nc_gsensor_axis_show;
+
+		sysfs_attr_init(&gs_ctl->attrs[5].attr);
+		gs_ctl->attrs[6].attr.name = "gsensor_z_axis";
+		gs_ctl->attrs[6].attr.mode = S_IRUGO;
+		gs_ctl->attrs[6].show = sony_nc_gsensor_axis_show;
+	}
+
+	for (i = 0; i < gs_ctl->attrs_num; i++) {
+		result = device_create_file(&pd->dev, &gs_ctl->attrs[i]);
+		if (result)
+			goto attrserror;
+	}
+
+	return 0;
+
+attrserror:
+	/* disable g-shock on the error path out */
+	__sony_nc_gsensor_status_set(0);
+
+	for (; i > 0; i--)
+		device_remove_file(&pd->dev, &gs_ctl->attrs[i]);
+
+outenable:
+	kfree(gs_ctl->attrs);
+
+outnomem:
+	kfree(gs_ctl);
+	gs_ctl = NULL;
+
+	return result;
+}
+
+static void sony_nc_gsensor_cleanup(struct platform_device *pd)
+{
+	if (gs_ctl) {
+		unsigned int i;
+
+		for (i = 0; i < gs_ctl->attrs_num; i++)
+			device_remove_file(&pd->dev, &gs_ctl->attrs[i]);
+
+		__sony_nc_gsensor_status_set(0);
+
+		kfree(gs_ctl->attrs);
+		kfree(gs_ctl);
+		gs_ctl = NULL;
+	}
+}
+
 static void sony_nc_backlight_ng_read_limits(int handle,
 		struct sony_backlight_props *props)
 {
-- 
1.7.10
