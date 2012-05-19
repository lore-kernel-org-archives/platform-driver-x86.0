From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 03/19] sony-laptop: generalise ACPI calls into SNC functions
Date: Sat, 19 May 2012 22:35:46 +0900
Message-ID: <1337434562-12283-4-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47655 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758354Ab2ESNpQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:16 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

All calls into the SNC device methods have zero or one arguments and
return an integer or a buffer (some functions go as far as returning an
integer _or_ a buffer depending on the input parameter...).
This allows simplifying a couple of code paths and prepares the field
for other users of functions returning buffers.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |  275 +++++++++++++++++-------------------
 1 file changed, 133 insertions(+), 142 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 455beeb..6aefd35 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -691,59 +691,92 @@ static struct acpi_device *sony_nc_acpi_device = NULL;
 
 /*
  * acpi_evaluate_object wrappers
+ * all useful calls into SNC methods take one or zero parameters and return
+ * integers or arrays.
  */
-static int acpi_callgetfunc(acpi_handle handle, char *name, int *result)
+static union acpi_object *__call_snc_method(acpi_handle handle, char *method,
+		u64 *value)
 {
-	struct acpi_buffer output;
-	union acpi_object out_obj;
+	union acpi_object *result = NULL;
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	acpi_status status;
 
-	output.length = sizeof(out_obj);
-	output.pointer = &out_obj;
+	if (value) {
+		struct acpi_object_list params;
+		union acpi_object in;
+		in.type = ACPI_TYPE_INTEGER;
+		in.integer.value = *value;
+		params.count = 1;
+		params.pointer = &in;
+		status = acpi_evaluate_object(handle, method, &params, &output);
+	} else
+		status = acpi_evaluate_object(handle, method, NULL, &output);
 
-	status = acpi_evaluate_object(handle, name, NULL, &output);
-	if ((status == AE_OK) && (out_obj.type == ACPI_TYPE_INTEGER)) {
-		*result = out_obj.integer.value;
-		return 0;
+	if (ACPI_FAILURE(status)) {
+		pr_err("Failed to evaluate [%s]\n", method);
+		return NULL;
 	}
 
-	pr_warn("acpi_callreadfunc failed\n");
+	result = (union acpi_object *) output.pointer;
+	if (!result)
+		dprintk("No return object [%s]\n", method);
 
-	return -1;
+	return result;
 }
 
-static int acpi_callsetfunc(acpi_handle handle, char *name, int value,
-			    int *result)
+static int sony_nc_int_call(acpi_handle handle, char *name, int *value,
+		int *result)
 {
-	struct acpi_object_list params;
-	union acpi_object in_obj;
-	struct acpi_buffer output;
-	union acpi_object out_obj;
-	acpi_status status;
-
-	params.count = 1;
-	params.pointer = &in_obj;
-	in_obj.type = ACPI_TYPE_INTEGER;
-	in_obj.integer.value = value;
+	union acpi_object *object = NULL;
+	if (value) {
+		u64 v = *value;
+		object = __call_snc_method(handle, name, &v);
+	} else
+		object = __call_snc_method(handle, name, NULL);
 
-	output.length = sizeof(out_obj);
-	output.pointer = &out_obj;
+	if (!object)
+		return -EINVAL;
 
-	status = acpi_evaluate_object(handle, name, &params, &output);
-	if (status == AE_OK) {
-		if (result != NULL) {
-			if (out_obj.type != ACPI_TYPE_INTEGER) {
-				pr_warn("acpi_evaluate_object bad return type\n");
-				return -1;
-			}
-			*result = out_obj.integer.value;
-		}
-		return 0;
+	if (object->type != ACPI_TYPE_INTEGER) {
+		pr_warn("Invalid acpi_object: expected 0x%x got 0x%x\n",
+				ACPI_TYPE_INTEGER, object->type);
+		kfree(object);
+		return -EINVAL;
 	}
 
-	pr_warn("acpi_evaluate_object failed\n");
+	if (result)
+		*result = object->integer.value;
 
-	return -1;
+	kfree(object);
+	return 0;
+}
+
+#define MIN(a, b)	(a > b ? b : a)
+static int sony_nc_buffer_call(acpi_handle handle, char *name, u64 *value,
+		void *buffer, size_t buflen)
+{
+	size_t len = len;
+	union acpi_object *object = __call_snc_method(handle, name, value);
+
+	if (!object)
+		return -EINVAL;
+
+	if (object->type == ACPI_TYPE_BUFFER)
+		len = MIN(buflen, object->buffer.length);
+
+	else if (object->type == ACPI_TYPE_INTEGER)
+		len = MIN(buflen, sizeof(object->integer.value));
+
+	else {
+		pr_warn("Invalid acpi_object: expected 0x%x got 0x%x\n",
+				ACPI_TYPE_BUFFER, object->type);
+		kfree(object);
+		return -EINVAL;
+	}
+
+	memcpy(buffer, object->buffer.pointer, len);
+	kfree(object);
+	return 0;
 }
 
 struct sony_nc_handles {
@@ -770,16 +803,17 @@ static ssize_t sony_nc_handles_show(struct device *dev,
 
 static int sony_nc_handles_setup(struct platform_device *pd)
 {
-	int i;
-	int result;
+	int i, r, result, arg;
 
 	handles = kzalloc(sizeof(*handles), GFP_KERNEL);
 	if (!handles)
 		return -ENOMEM;
 
 	for (i = 0; i < ARRAY_SIZE(handles->cap); i++) {
-		if (!acpi_callsetfunc(sony_nc_acpi_handle,
-					"SN00", i + 0x20, &result)) {
+		arg = i + 0x20;
+		r = sony_nc_int_call(sony_nc_acpi_handle, "SN00", &arg,
+					&result);
+		if (!r) {
 			dprintk("caching handle 0x%.4x (offset: 0x%.2x)\n",
 					result, i);
 			handles->cap[i] = result;
@@ -835,16 +869,15 @@ static int sony_find_snc_handle(int handle)
 
 static int sony_call_snc_handle(int handle, int argument, int *result)
 {
-	int ret = 0;
+	int arg, ret = 0;
 	int offset = sony_find_snc_handle(handle);
 
 	if (offset < 0)
 		return -1;
 
-	ret = acpi_callsetfunc(sony_nc_acpi_handle, "SN07", offset | argument,
-			result);
-	dprintk("called SN07 with 0x%.4x (result: 0x%.4x)\n", offset | argument,
-			*result);
+	arg = offset | argument;
+	ret = sony_nc_int_call(sony_nc_acpi_handle, "SN07", &arg, result);
+	dprintk("called SN07 with 0x%.4x (result: 0x%.4x)\n", arg, *result);
 	return ret;
 }
 
@@ -889,14 +922,16 @@ static int boolean_validate(const int direction, const int value)
 static ssize_t sony_nc_sysfs_show(struct device *dev, struct device_attribute *attr,
 			      char *buffer)
 {
-	int value;
+	int value, ret = 0;
 	struct sony_nc_value *item =
 	    container_of(attr, struct sony_nc_value, devattr);
 
 	if (!*item->acpiget)
 		return -EIO;
 
-	if (acpi_callgetfunc(sony_nc_acpi_handle, *item->acpiget, &value) < 0)
+	ret = sony_nc_int_call(sony_nc_acpi_handle, *item->acpiget, NULL,
+				&value);
+	if (ret < 0)
 		return -EIO;
 
 	if (item->validate)
@@ -909,7 +944,7 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 			       struct device_attribute *attr,
 			       const char *buffer, size_t count)
 {
-	int value;
+	int value, ret = 0;
 	struct sony_nc_value *item =
 	    container_of(attr, struct sony_nc_value, devattr);
 
@@ -927,8 +962,11 @@ static ssize_t sony_nc_sysfs_store(struct device *dev,
 	if (value < 0)
 		return value;
 
-	if (acpi_callsetfunc(sony_nc_acpi_handle, *item->acpiset, value, NULL) < 0)
+	ret = sony_nc_int_call(sony_nc_acpi_handle, *item->acpiset, &value,
+			NULL);
+	if (ret < 0)
 		return -EIO;
+
 	item->value = value;
 	item->valid = 1;
 	return count;
@@ -948,15 +986,15 @@ struct sony_backlight_props sony_bl_props;
 
 static int sony_backlight_update_status(struct backlight_device *bd)
 {
-	return acpi_callsetfunc(sony_nc_acpi_handle, "SBRT",
-				bd->props.brightness + 1, NULL);
+	int arg = bd->props.brightness + 1;
+	return sony_nc_int_call(sony_nc_acpi_handle, "SBRT", &arg, NULL);
 }
 
 static int sony_backlight_get_brightness(struct backlight_device *bd)
 {
 	int value;
 
-	if (acpi_callgetfunc(sony_nc_acpi_handle, "GBRT", &value))
+	if (sony_nc_int_call(sony_nc_acpi_handle, "GBRT", NULL, &value))
 		return 0;
 	/* brightness levels are 1-based, while backlight ones are 0-based */
 	return value - 1;
@@ -1142,10 +1180,11 @@ static acpi_status sony_walk_callback(acpi_handle handle, u32 level,
  */
 static int sony_nc_function_setup(struct acpi_device *device)
 {
-	int result;
+	int result, arg;
 
 	/* Enable all events */
-	acpi_callsetfunc(sony_nc_acpi_handle, "SN02", 0xffff, &result);
+	arg = 0xffff;
+	sony_nc_int_call(sony_nc_acpi_handle, "SN02", &arg, &result);
 
 	/* Setup hotkeys */
 	sony_call_snc_handle(0x0100, 0, &result);
@@ -1166,8 +1205,8 @@ static int sony_nc_resume(struct acpi_device *device)
 
 		if (!item->valid)
 			continue;
-		ret = acpi_callsetfunc(sony_nc_acpi_handle, *item->acpiset,
-				       item->value, NULL);
+		ret = sony_nc_int_call(sony_nc_acpi_handle, *item->acpiset,
+				       &item->value, NULL);
 		if (ret < 0) {
 			pr_err("%s: %d\n", __func__, ret);
 			break;
@@ -1176,7 +1215,8 @@ static int sony_nc_resume(struct acpi_device *device)
 
 	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "ECON",
 					 &handle))) {
-		if (acpi_callsetfunc(sony_nc_acpi_handle, "ECON", 1, NULL))
+		int arg = 1;
+		if (sony_nc_int_call(sony_nc_acpi_handle, "ECON", &arg, NULL))
 			dprintk("ECON Method failed\n");
 	}
 
@@ -1314,13 +1354,9 @@ static void sony_nc_rfkill_update(void)
 
 static void sony_nc_rfkill_setup(struct acpi_device *device)
 {
-	int offset;
-	u8 dev_code, i;
-	acpi_status status;
-	struct acpi_object_list params;
-	union acpi_object in_obj;
-	union acpi_object *device_enum;
-	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	u64 offset;
+	int i;
+	unsigned char buffer[32] = { 0 };
 
 	offset = sony_find_snc_handle(0x124);
 	if (offset == -1) {
@@ -1333,59 +1369,34 @@ static void sony_nc_rfkill_setup(struct acpi_device *device)
 		sony_rfkill_handle = 0x124;
 	dprintk("Found rkfill handle: 0x%.4x\n", sony_rfkill_handle);
 
-	/* need to read the whole buffer returned by the acpi call to SN06
-	 * here otherwise we may miss some features
-	 */
-	params.count = 1;
-	params.pointer = &in_obj;
-	in_obj.type = ACPI_TYPE_INTEGER;
-	in_obj.integer.value = offset;
-	status = acpi_evaluate_object(sony_nc_acpi_handle, "SN06", &params,
-			&buffer);
-	if (ACPI_FAILURE(status)) {
-		dprintk("Radio device enumeration failed\n");
+	i = sony_nc_buffer_call(sony_nc_acpi_handle, "SN06", &offset, buffer,
+			32);
+	if (i < 0)
 		return;
-	}
-
-	device_enum = (union acpi_object *) buffer.pointer;
-	if (!device_enum) {
-		pr_err("No SN06 return object.");
-		return;
-	}
-	if (device_enum->type != ACPI_TYPE_BUFFER) {
-		pr_err("Invalid SN06 return object 0x%.2x\n",
-		       device_enum->type);
-		goto out_no_enum;
-	}
 
 	/* the buffer is filled with magic numbers describing the devices
 	 * available, 0xff terminates the enumeration
 	 */
-	for (i = 0; i < device_enum->buffer.length; i++) {
+	for (i = 0; i < ARRAY_SIZE(buffer); i++) {
 
-		dev_code = *(device_enum->buffer.pointer + i);
-		if (dev_code == 0xff)
+		if (buffer[i] == 0xff)
 			break;
 
-		dprintk("Radio devices, looking at 0x%.2x\n", dev_code);
+		dprintk("Radio devices, looking at 0x%.2x\n", buffer[i]);
 
-		if (dev_code == 0 && !sony_rfkill_devices[SONY_WIFI])
+		if (buffer[i] == 0 && !sony_rfkill_devices[SONY_WIFI])
 			sony_nc_setup_rfkill(device, SONY_WIFI);
 
-		if (dev_code == 0x10 && !sony_rfkill_devices[SONY_BLUETOOTH])
+		if (buffer[i] == 0x10 && !sony_rfkill_devices[SONY_BLUETOOTH])
 			sony_nc_setup_rfkill(device, SONY_BLUETOOTH);
 
-		if ((0xf0 & dev_code) == 0x20 &&
+		if ((0xf0 & buffer[i]) == 0x20 &&
 				!sony_rfkill_devices[SONY_WWAN])
 			sony_nc_setup_rfkill(device, SONY_WWAN);
 
-		if (dev_code == 0x30 && !sony_rfkill_devices[SONY_WIMAX])
+		if (buffer[i] == 0x30 && !sony_rfkill_devices[SONY_WIMAX])
 			sony_nc_setup_rfkill(device, SONY_WIMAX);
 	}
-
-out_no_enum:
-	kfree(buffer.pointer);
-	return;
 }
 
 /* Keyboard backlight feature */
@@ -1576,14 +1587,10 @@ static void sony_nc_kbd_backlight_resume(void)
 static void sony_nc_backlight_ng_read_limits(int handle,
 		struct sony_backlight_props *props)
 {
-	int offset;
-	acpi_status status;
-	u8 brlvl, i;
+	u64 offset;
+	int i;
 	u8 min = 0xff, max = 0x00;
-	struct acpi_object_list params;
-	union acpi_object in_obj;
-	union acpi_object *lvl_enum;
-	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	unsigned char buffer[32] = { 0 };
 
 	props->handle = handle;
 	props->offset = 0;
@@ -1596,50 +1603,31 @@ static void sony_nc_backlight_ng_read_limits(int handle,
 	/* try to read the boundaries from ACPI tables, if we fail the above
 	 * defaults should be reasonable
 	 */
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
+	i = sony_nc_buffer_call(sony_nc_acpi_handle, "SN06", &offset, buffer,
+			32);
+	if (i < 0)
 		return;
-	}
-	if (lvl_enum->type != ACPI_TYPE_BUFFER) {
-		pr_err("Invalid SN06 return object 0x%.2x\n",
-		       lvl_enum->type);
-		goto out_invalid;
-	}
 
 	/* the buffer lists brightness levels available, brightness levels are
-	 * from 0 to 8 in the array, other values are used by ALS control.
+	 * from position 0 to 8 in the array, other values are used by ALS
+	 * control.
 	 */
-	for (i = 0; i < 9 && i < lvl_enum->buffer.length; i++) {
+	for (i = 0; i < 9 && i < ARRAY_SIZE(buffer); i++) {
 
-		brlvl = *(lvl_enum->buffer.pointer + i);
-		dprintk("Brightness level: %d\n", brlvl);
+		dprintk("Brightness level: %d\n", buffer[i]);
 
-		if (!brlvl)
+		if (!buffer[i])
 			break;
 
-		if (brlvl > max)
-			max = brlvl;
-		if (brlvl < min)
-			min = brlvl;
+		if (buffer[i] > max)
+			max = buffer[i];
+		if (buffer[i] < min)
+			min = buffer[i];
 	}
 	props->offset = min;
 	props->maxlvl = max;
 	dprintk("Brightness levels: min=%d max=%d\n", props->offset,
 			props->maxlvl);
-
-out_invalid:
-	kfree(buffer.pointer);
-	return;
 }
 
 static void sony_nc_backlight_setup(void)
@@ -1728,7 +1716,8 @@ static int sony_nc_add(struct acpi_device *device)
 
 	if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "ECON",
 					 &handle))) {
-		if (acpi_callsetfunc(sony_nc_acpi_handle, "ECON", 1, NULL))
+		int arg = 1;
+		if (sony_nc_int_call(sony_nc_acpi_handle, "ECON", &arg, NULL))
 			dprintk("ECON Method failed\n");
 	}
 
@@ -2684,7 +2673,8 @@ static long sonypi_misc_ioctl(struct file *fp, unsigned int cmd,
 			ret = -EIO;
 			break;
 		}
-		if (acpi_callgetfunc(sony_nc_acpi_handle, "GBRT", &value)) {
+		if (sony_nc_int_call(sony_nc_acpi_handle, "GBRT", NULL,
+					&value)) {
 			ret = -EIO;
 			break;
 		}
@@ -2701,8 +2691,9 @@ static long sonypi_misc_ioctl(struct file *fp, unsigned int cmd,
 			ret = -EFAULT;
 			break;
 		}
-		if (acpi_callsetfunc(sony_nc_acpi_handle, "SBRT",
-				(val8 >> 5) + 1, NULL)) {
+		value = (val8 >> 5) + 1;
+		if (sony_nc_int_call(sony_nc_acpi_handle, "SBRT", &value,
+					NULL)) {
 			ret = -EIO;
 			break;
 		}
-- 
1.7.10
