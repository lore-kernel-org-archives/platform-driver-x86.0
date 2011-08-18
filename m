From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 1/3] acer-wmi: add ACER_WMID_v2 interface flag to represent new notebooks
Date: Thu, 18 Aug 2011 18:47:32 +0800
Message-ID: <1313664454-2762-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:61778 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785Ab1HRKvQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Aug 2011 06:51:16 -0400
Received: by gya6 with SMTP id 6so1368495gya.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Aug 2011 03:51:15 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

There have new acer notebooks' BIOS provide new WMID_GUID3 and
ACERWMID_EVENT_GUID methods.

Some of machines still keep the old WMID_GUID1 method but more and
more machines were already removed old wmi methods from DSDT.

So, this patch add a new ACER_WMID_v2 interface flag to represent
new acer notebooks, the following is definition:

 + ACER_WMID:
        It means this machine only provides WMID_GUID1/2 methods.

 + ACER_WMID_v2:
        It means this machine provide new WMID_GUID3 and WMID_EVENT_GUID
        methods.
        Some ACER_WMID_v2 machines also provide old WMID_GUID1/2 methods,
        but we still query/set communication device's state by new
        WMID_GUID3 method.

Tested on Acer Travelmate 8572
Tested on Acer Aspire 4739Z

Tested-by: AceLan Kao <acelan.kao@canonical.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |  416 ++++++++++++++++++++-------------------
 1 files changed, 213 insertions(+), 203 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index af2bb20..36d2765 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -190,6 +190,7 @@ enum interface_flags {
 	ACER_AMW0,
 	ACER_AMW0_V2,
 	ACER_WMID,
+	ACER_WMID_v2,
 };
 
 #define ACER_DEFAULT_WIRELESS  0
@@ -868,6 +869,177 @@ static acpi_status WMID_set_u32(u32 value, u32 cap, struct wmi_interface *iface)
 	return WMI_execute_u32(method_id, (u32)value, NULL);
 }
 
+static acpi_status wmid3_get_device_status(u32 *value, u16 device)
+{
+	struct wmid3_gds_return_value return_value;
+	acpi_status status;
+	union acpi_object *obj;
+	struct wmid3_gds_input_param params = {
+		.function_num = 0x1,
+		.hotkey_number = 0x01,
+		.devices = device,
+	};
+	struct acpi_buffer input = {
+		sizeof(struct wmid3_gds_input_param),
+		&params
+	};
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+
+	status = wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input, &output);
+	if (ACPI_FAILURE(status))
+		return status;
+
+	obj = output.pointer;
+
+	if (!obj)
+		return AE_ERROR;
+	else if (obj->type != ACPI_TYPE_BUFFER) {
+		kfree(obj);
+		return AE_ERROR;
+	}
+	if (obj->buffer.length != 8) {
+		pr_warn("Unknown buffer length %d\n", obj->buffer.length);
+		kfree(obj);
+		return AE_ERROR;
+	}
+
+	return_value = *((struct wmid3_gds_return_value *)obj->buffer.pointer);
+	kfree(obj);
+
+	if (return_value.error_code || return_value.ec_return_value)
+		pr_warn("Get 0x%x Device Status failed: 0x%x - 0x%x\n",
+			device,
+			return_value.error_code,
+			return_value.ec_return_value);
+	else
+		*value = !!(return_value.devices & device);
+
+	return status;
+}
+
+static acpi_status wmid_v2_get_u32(u32 *value, u32 cap)
+{
+	u16 device;
+
+	switch (cap) {
+	case ACER_CAP_WIRELESS:
+		device = ACER_WMID3_GDS_WIRELESS;
+		break;
+	case ACER_CAP_BLUETOOTH:
+		device = ACER_WMID3_GDS_BLUETOOTH;
+		break;
+	case ACER_CAP_THREEG:
+		device = ACER_WMID3_GDS_THREEG;
+		break;
+	default:
+		return AE_ERROR;
+	}
+	return wmid3_get_device_status(value, device);
+}
+
+static acpi_status wmid3_set_device_status(u32 value, u16 device)
+{
+	struct wmid3_gds_return_value return_value;
+	acpi_status status;
+	union acpi_object *obj;
+	u16 devices;
+	struct wmid3_gds_input_param params = {
+		.function_num = 0x1,
+		.hotkey_number = 0x01,
+		.devices = ACER_WMID3_GDS_WIRELESS |
+				ACER_WMID3_GDS_THREEG |
+				ACER_WMID3_GDS_WIMAX |
+				ACER_WMID3_GDS_BLUETOOTH,
+	};
+	struct acpi_buffer input = {
+		sizeof(struct wmid3_gds_input_param),
+		&params
+	};
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer output2 = { ACPI_ALLOCATE_BUFFER, NULL };
+
+	status = wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input, &output);
+	if (ACPI_FAILURE(status))
+		return status;
+
+	obj = output.pointer;
+
+	if (!obj)
+		return AE_ERROR;
+	else if (obj->type != ACPI_TYPE_BUFFER) {
+		kfree(obj);
+		return AE_ERROR;
+	}
+	if (obj->buffer.length != 8) {
+		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
+		kfree(obj);
+		return AE_ERROR;
+	}
+
+	return_value = *((struct wmid3_gds_return_value *)obj->buffer.pointer);
+	kfree(obj);
+
+	if (return_value.error_code || return_value.ec_return_value) {
+		pr_warning("Get Current Device Status failed: "
+			"0x%x - 0x%x\n", return_value.error_code,
+			return_value.ec_return_value);
+		return status;
+	}
+
+	devices = return_value.devices;
+	params.function_num = 0x2;
+	params.hotkey_number = 0x01;
+	params.devices = (value) ? (devices | device) : (devices & ~device);
+
+	status = wmi_evaluate_method(WMID_GUID3, 0, 0x1, &input, &output2);
+	if (ACPI_FAILURE(status))
+		return status;
+
+	obj = output2.pointer;
+
+	if (!obj)
+		return AE_ERROR;
+	else if (obj->type != ACPI_TYPE_BUFFER) {
+		kfree(obj);
+		return AE_ERROR;
+	}
+	if (obj->buffer.length != 4) {
+		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
+		kfree(obj);
+		return AE_ERROR;
+	}
+
+	return_value = *((struct wmid3_gds_return_value *)obj->buffer.pointer);
+	kfree(obj);
+
+	if (return_value.error_code || return_value.ec_return_value)
+		pr_warning("Set Device Status failed: "
+			"0x%x - 0x%x\n", return_value.error_code,
+			return_value.ec_return_value);
+
+	return status;
+}
+
+static acpi_status wmid_v2_set_u32(u32 value, u32 cap)
+{
+	u16 device;
+
+	switch (cap) {
+	case ACER_CAP_WIRELESS:
+		device = ACER_WMID3_GDS_WIRELESS;
+		break;
+	case ACER_CAP_BLUETOOTH:
+		device = ACER_WMID3_GDS_BLUETOOTH;
+		break;
+	case ACER_CAP_THREEG:
+		device = ACER_WMID3_GDS_THREEG;
+		break;
+	default:
+		return AE_ERROR;
+	}
+	return wmid3_set_device_status(value, device);
+}
+
 static void type_aa_dmi_decode(const struct dmi_header *header, void *dummy)
 {
 	struct hotkey_function_type_aa *type_aa;
@@ -913,17 +1085,11 @@ static acpi_status WMID_set_capabilities(void)
 		return AE_ERROR;
 	}
 
-	dmi_walk(type_aa_dmi_decode, NULL);
-	if (!has_type_aa) {
-		interface->capability |= ACER_CAP_WIRELESS;
-		if (devices & 0x40)
-			interface->capability |= ACER_CAP_THREEG;
-		if (devices & 0x10)
-			interface->capability |= ACER_CAP_BLUETOOTH;
-	}
-
-	/* WMID always provides brightness methods */
-	interface->capability |= ACER_CAP_BRIGHTNESS;
+	interface->capability |= ACER_CAP_WIRELESS;
+	if (devices & 0x40)
+		interface->capability |= ACER_CAP_THREEG;
+	if (devices & 0x10)
+		interface->capability |= ACER_CAP_BLUETOOTH;
 
 	if (!(devices & 0x20))
 		max_brightness = 0x9;
@@ -936,6 +1102,10 @@ static struct wmi_interface wmid_interface = {
 	.type = ACER_WMID,
 };
 
+static struct wmi_interface wmid_v2_interface = {
+	.type = ACER_WMID_v2,
+};
+
 /*
  * Generic Device (interface-independent)
  */
@@ -956,6 +1126,14 @@ static acpi_status get_u32(u32 *value, u32 cap)
 	case ACER_WMID:
 		status = WMID_get_u32(value, cap, interface);
 		break;
+	case ACER_WMID_v2:
+		if (cap & (ACER_CAP_WIRELESS |
+			   ACER_CAP_BLUETOOTH |
+			   ACER_CAP_THREEG))
+			status = wmid_v2_get_u32(value, cap);
+		else if (wmi_has_guid(WMID_GUID2))
+			status = WMID_get_u32(value, cap, interface);
+		break;
 	}
 
 	return status;
@@ -989,6 +1167,13 @@ static acpi_status set_u32(u32 value, u32 cap)
 			}
 		case ACER_WMID:
 			return WMID_set_u32(value, cap, interface);
+		case ACER_WMID_v2:
+			if (cap & (ACER_CAP_WIRELESS |
+				   ACER_CAP_BLUETOOTH |
+				   ACER_CAP_THREEG))
+				return wmid_v2_set_u32(value, cap);
+			else if (wmi_has_guid(WMID_GUID2))
+				return WMID_set_u32(value, cap, interface);
 		default:
 			return AE_BAD_PARAMETER;
 		}
@@ -1095,186 +1280,6 @@ static void acer_backlight_exit(void)
 	backlight_device_unregister(acer_backlight_device);
 }
 
-static acpi_status wmid3_get_device_status(u32 *value, u16 device)
-{
-	struct wmid3_gds_return_value return_value;
-	acpi_status status;
-	union acpi_object *obj;
-	struct wmid3_gds_input_param params = {
-		.function_num = 0x1,
-		.hotkey_number = 0x01,
-		.devices = device,
-	};
-	struct acpi_buffer input = {
-		sizeof(struct wmid3_gds_input_param),
-		&params
-	};
-	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-
-	status = wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input, &output);
-	if (ACPI_FAILURE(status))
-		return status;
-
-	obj = output.pointer;
-
-	if (!obj)
-		return AE_ERROR;
-	else if (obj->type != ACPI_TYPE_BUFFER) {
-		kfree(obj);
-		return AE_ERROR;
-	}
-	if (obj->buffer.length != 8) {
-		pr_warn("Unknown buffer length %d\n", obj->buffer.length);
-		kfree(obj);
-		return AE_ERROR;
-	}
-
-	return_value = *((struct wmid3_gds_return_value *)obj->buffer.pointer);
-	kfree(obj);
-
-	if (return_value.error_code || return_value.ec_return_value)
-		pr_warn("Get Device Status failed: 0x%x - 0x%x\n",
-			return_value.error_code,
-			return_value.ec_return_value);
-	else
-		*value = !!(return_value.devices & device);
-
-	return status;
-}
-
-static acpi_status get_device_status(u32 *value, u32 cap)
-{
-	if (wmi_has_guid(WMID_GUID3)) {
-		u16 device;
-
-		switch (cap) {
-		case ACER_CAP_WIRELESS:
-			device = ACER_WMID3_GDS_WIRELESS;
-			break;
-		case ACER_CAP_BLUETOOTH:
-			device = ACER_WMID3_GDS_BLUETOOTH;
-			break;
-		case ACER_CAP_THREEG:
-			device = ACER_WMID3_GDS_THREEG;
-			break;
-		default:
-			return AE_ERROR;
-		}
-		return wmid3_get_device_status(value, device);
-
-	} else {
-		return get_u32(value, cap);
-	}
-}
-
-static acpi_status wmid3_set_device_status(u32 value, u16 device)
-{
-	struct wmid3_gds_return_value return_value;
-	acpi_status status;
-	union acpi_object *obj;
-	u16 devices;
-	struct wmid3_gds_input_param params = {
-		.function_num = 0x1,
-		.hotkey_number = 0x01,
-		.devices = ACER_WMID3_GDS_WIRELESS |
-				ACER_WMID3_GDS_THREEG |
-				ACER_WMID3_GDS_WIMAX |
-				ACER_WMID3_GDS_BLUETOOTH,
-	};
-	struct acpi_buffer input = {
-		sizeof(struct wmid3_gds_input_param),
-		&params
-	};
-	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-	struct acpi_buffer output2 = { ACPI_ALLOCATE_BUFFER, NULL };
-
-	status = wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input, &output);
-	if (ACPI_FAILURE(status))
-		return status;
-
-	obj = output.pointer;
-
-	if (!obj)
-		return AE_ERROR;
-	else if (obj->type != ACPI_TYPE_BUFFER) {
-		kfree(obj);
-		return AE_ERROR;
-	}
-	if (obj->buffer.length != 8) {
-		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
-		kfree(obj);
-		return AE_ERROR;
-	}
-
-	return_value = *((struct wmid3_gds_return_value *)obj->buffer.pointer);
-	kfree(obj);
-
-	if (return_value.error_code || return_value.ec_return_value) {
-		pr_warning("Get Current Device Status failed: "
-			"0x%x - 0x%x\n", return_value.error_code,
-			return_value.ec_return_value);
-		return status;
-	}
-
-	devices = return_value.devices;
-	params.function_num = 0x2;
-	params.hotkey_number = 0x01;
-	params.devices = (value) ? (devices | device) : (devices & ~device);
-
-	status = wmi_evaluate_method(WMID_GUID3, 0, 0x1, &input, &output2);
-	if (ACPI_FAILURE(status))
-		return status;
-
-	obj = output2.pointer;
-
-	if (!obj)
-		return AE_ERROR;
-	else if (obj->type != ACPI_TYPE_BUFFER) {
-		kfree(obj);
-		return AE_ERROR;
-	}
-	if (obj->buffer.length != 4) {
-		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
-		kfree(obj);
-		return AE_ERROR;
-	}
-
-	return_value = *((struct wmid3_gds_return_value *)obj->buffer.pointer);
-	kfree(obj);
-
-	if (return_value.error_code || return_value.ec_return_value)
-		pr_warning("Set Device Status failed: "
-			"0x%x - 0x%x\n", return_value.error_code,
-			return_value.ec_return_value);
-
-	return status;
-}
-
-static acpi_status set_device_status(u32 value, u32 cap)
-{
-	if (wmi_has_guid(WMID_GUID3)) {
-		u16 device;
-
-		switch (cap) {
-		case ACER_CAP_WIRELESS:
-			device = ACER_WMID3_GDS_WIRELESS;
-			break;
-		case ACER_CAP_BLUETOOTH:
-			device = ACER_WMID3_GDS_BLUETOOTH;
-			break;
-		case ACER_CAP_THREEG:
-			device = ACER_WMID3_GDS_THREEG;
-			break;
-		default:
-			return AE_ERROR;
-		}
-		return wmid3_set_device_status(value, device);
-
-	} else {
-		return set_u32(value, cap);
-	}
-}
-
 /*
  * Rfkill devices
  */
@@ -1301,8 +1306,7 @@ static void acer_rfkill_update(struct work_struct *ignored)
 	}
 
 	if (has_cap(ACER_CAP_THREEG) && wmi_has_guid(WMID_GUID3)) {
-		status = wmid3_get_device_status(&state,
-				ACER_WMID3_GDS_THREEG);
+		status = get_u32(&state, ACER_WMID3_GDS_THREEG);
 		if (ACPI_SUCCESS(status))
 			rfkill_set_sw_state(threeg_rfkill, !state);
 	}
@@ -1316,7 +1320,7 @@ static int acer_rfkill_set(void *data, bool blocked)
 	u32 cap = (unsigned long)data;
 
 	if (rfkill_inited) {
-		status = set_device_status(!blocked, cap);
+		status = set_u32(!blocked, cap);
 		if (ACPI_FAILURE(status))
 			return -ENODEV;
 	}
@@ -1343,7 +1347,7 @@ static struct rfkill *acer_rfkill_register(struct device *dev,
 	if (!rfkill_dev)
 		return ERR_PTR(-ENOMEM);
 
-	status = get_device_status(&state, cap);
+	status = get_u32(&state, cap);
 
 	err = rfkill_register(rfkill_dev);
 	if (err) {
@@ -1428,11 +1432,7 @@ static ssize_t show_bool_threeg(struct device *dev,
 
 	pr_info("This threeg sysfs will be removed in 2012"
 		" - used by: %s\n", current->comm);
-	if (wmi_has_guid(WMID_GUID3))
-		status = wmid3_get_device_status(&result,
-				ACER_WMID3_GDS_THREEG);
-	else
-		status = get_u32(&result, ACER_CAP_THREEG);
+	status = get_u32(&result, ACER_CAP_THREEG);
 	if (ACPI_SUCCESS(status))
 		return sprintf(buf, "%u\n", result);
 	return sprintf(buf, "Read error\n");
@@ -1464,6 +1464,8 @@ static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
 		return sprintf(buf, "AMW0 v2\n");
 	case ACER_WMID:
 		return sprintf(buf, "WMID\n");
+	case ACER_WMID_v2:
+		return sprintf(buf, "WMID v2\n");
 	default:
 		return sprintf(buf, "Error!\n");
 	}
@@ -1883,12 +1885,20 @@ static int __init acer_wmi_init(void)
 	if (!wmi_has_guid(AMW0_GUID1) && wmi_has_guid(WMID_GUID1))
 		interface = &wmid_interface;
 
+	if (wmi_has_guid(WMID_GUID3))
+		interface = &wmid_v2_interface;
+
+	if (interface)
+		dmi_walk(type_aa_dmi_decode, NULL);
+
 	if (wmi_has_guid(WMID_GUID2) && interface) {
-		if (ACPI_FAILURE(WMID_set_capabilities())) {
+		if (!has_type_aa && ACPI_FAILURE(WMID_set_capabilities())) {
 			pr_err("Unable to detect available WMID devices\n");
 			return -ENODEV;
 		}
-	} else if (!wmi_has_guid(WMID_GUID2) && interface) {
+		/* WMID always provides brightness methods */
+		interface->capability |= ACER_CAP_BRIGHTNESS;
+	} else if (!wmi_has_guid(WMID_GUID2) && interface && !has_type_aa) {
 		pr_err("No WMID device detection method found\n");
 		return -ENODEV;
 	}
@@ -1912,7 +1922,7 @@ static int __init acer_wmi_init(void)
 
 	set_quirks();
 
-	if (acpi_video_backlight_support() && has_cap(ACER_CAP_BRIGHTNESS)) {
+	if (acpi_video_backlight_support()) {
 		interface->capability &= ~ACER_CAP_BRIGHTNESS;
 		pr_info("Brightness must be controlled by "
 		       "generic video driver\n");
-- 
1.6.0.2
