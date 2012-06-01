From: Marek Vasut <marex@denx.de>
Subject: [PATCH 1/2] ACER: Add support for accelerometer sensor
Date: Fri,  1 Jun 2012 19:11:22 +0200
Message-ID: <1338570683-16491-1-git-send-email-marex@denx.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:44326 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759212Ab2FARLd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jun 2012 13:11:33 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, joeyli <jlee@suse.com>

This device is present on Iconia Tab W500.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: joeyli <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |  138 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index c1a3fd8..edb6bad 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -95,6 +95,7 @@ MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D14026");
 
 enum acer_wmi_event_ids {
 	WMID_HOTKEY_EVENT = 0x1,
+	WMID_ACCEL_EVENT = 0x5,
 };
 
 static const struct key_entry acer_wmi_keymap[] = {
@@ -130,6 +131,7 @@ static const struct key_entry acer_wmi_keymap[] = {
 };
 
 static struct input_dev *acer_wmi_input_dev;
+static struct input_dev *acer_wmi_accel_dev;
 
 struct event_return_value {
 	u8 function;
@@ -200,6 +202,7 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_BLUETOOTH		(1<<2)
 #define ACER_CAP_BRIGHTNESS		(1<<3)
 #define ACER_CAP_THREEG			(1<<4)
+#define ACER_CAP_ACCEL			(1<<5)
 #define ACER_CAP_ANY			(0xFFFFFFFF)
 
 /*
@@ -1375,6 +1378,60 @@ static void acer_backlight_exit(void)
 }
 
 /*
+ * Accelerometer device
+ */
+static acpi_handle gsensor_handle;
+
+static int acer_gsensor_init(void)
+{
+	acpi_status status;
+	struct acpi_buffer output;
+	union acpi_object out_obj;
+
+	output.length = sizeof(out_obj);
+	output.pointer = &out_obj;
+	status = acpi_evaluate_object(gsensor_handle, "_INI", NULL, &output);
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	return 0;
+}
+
+static int acer_gsensor_open(struct input_dev *input)
+{
+	return acer_gsensor_init();
+}
+
+static int acer_gsensor_event(void)
+{
+	acpi_status status;
+	struct acpi_buffer output;
+	union acpi_object out_obj[5];
+
+	if (!has_cap(ACER_CAP_ACCEL))
+		return -1;
+
+	output.length = sizeof(out_obj);
+	output.pointer = out_obj;
+
+	status = acpi_evaluate_object(gsensor_handle, "RDVL", NULL, &output);
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	if (out_obj->package.count != 4)
+		return -1;
+
+	input_report_abs(acer_wmi_accel_dev, ABS_X,
+		(s16)out_obj->package.elements[0].integer.value);
+	input_report_abs(acer_wmi_accel_dev, ABS_Y,
+		(s16)out_obj->package.elements[1].integer.value);
+	input_report_abs(acer_wmi_accel_dev, ABS_Z,
+		(s16)out_obj->package.elements[2].integer.value);
+	input_sync(acer_wmi_accel_dev);
+	return 0;
+}
+
+/*
  * Rfkill devices
  */
 static void acer_rfkill_update(struct work_struct *ignored);
@@ -1649,6 +1706,9 @@ static void acer_wmi_notify(u32 value, void *context)
 						   1, true);
 		}
 		break;
+	case WMID_ACCEL_EVENT:
+		acer_gsensor_event();
+		break;
 	default:
 		pr_warn("Unknown function number - %d - %d\n",
 			return_value.function, return_value.key_num);
@@ -1734,6 +1794,74 @@ static int acer_wmi_enable_lm(void)
 	return status;
 }
 
+static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
+						void *ctx, void **retval)
+{
+	*(acpi_handle *)retval = ah;
+	return AE_OK;
+}
+
+static int __init acer_wmi_get_handle(const char *name, const char *prop,
+					acpi_handle *ah)
+{
+	acpi_status status;
+	acpi_handle handle;
+
+	BUG_ON(!name || !ah);
+
+	handle = 0;
+	status = acpi_get_devices(prop, acer_wmi_get_handle_cb,
+					(void *)name, &handle);
+
+	if (ACPI_SUCCESS(status)) {
+		*ah = handle;
+		return 0;
+	} else {
+		return -ENODEV;
+	}
+}
+
+static int __init acer_wmi_accel_setup(void)
+{
+	int err;
+
+	err = acer_wmi_get_handle("SENR", "BST0001", &gsensor_handle);
+	if (err)
+		return err;
+
+	interface->capability |= ACER_CAP_ACCEL;
+
+	acer_wmi_accel_dev = input_allocate_device();
+	if (!acer_wmi_accel_dev)
+		return -ENOMEM;
+
+	acer_wmi_accel_dev->open = acer_gsensor_open;
+
+	acer_wmi_accel_dev->name = "Acer BMA150 accelerometer";
+	acer_wmi_accel_dev->phys = "wmi/input1";
+	acer_wmi_accel_dev->id.bustype = BUS_HOST;
+	acer_wmi_accel_dev->evbit[0] = BIT_MASK(EV_ABS);
+	input_set_abs_params(acer_wmi_accel_dev, ABS_X, -16384, 16384, 0, 0);
+	input_set_abs_params(acer_wmi_accel_dev, ABS_Y, -16384, 16384, 0, 0);
+	input_set_abs_params(acer_wmi_accel_dev, ABS_Z, -16384, 16384, 0, 0);
+
+	err = input_register_device(acer_wmi_accel_dev);
+	if (err)
+		goto err_free_dev;
+
+	return 0;
+
+err_free_dev:
+	input_free_device(acer_wmi_accel_dev);
+	return err;
+}
+
+static void acer_wmi_accel_destroy(void)
+{
+	input_unregister_device(acer_wmi_accel_dev);
+	input_free_device(acer_wmi_accel_dev);
+}
+
 static int __init acer_wmi_input_setup(void)
 {
 	acpi_status status;
@@ -1889,6 +2017,9 @@ static int acer_platform_resume(struct platform_device *device)
 	if (has_cap(ACER_CAP_BRIGHTNESS))
 		set_u32(data->brightness, ACER_CAP_BRIGHTNESS);
 
+	if (has_cap(ACER_CAP_ACCEL))
+		acer_gsensor_init();
+
 	return 0;
 }
 
@@ -2066,6 +2197,8 @@ static int __init acer_wmi_init(void)
 			return err;
 	}
 
+	acer_wmi_accel_setup();
+
 	err = platform_driver_register(&acer_platform_driver);
 	if (err) {
 		pr_err("Unable to register platform driver\n");
@@ -2109,6 +2242,8 @@ error_device_alloc:
 error_platform_register:
 	if (wmi_has_guid(ACERWMID_EVENT_GUID))
 		acer_wmi_input_destroy();
+	if (has_cap(ACER_CAP_ACCEL))
+		acer_wmi_accel_destroy();
 
 	return err;
 }
@@ -2118,6 +2253,9 @@ static void __exit acer_wmi_exit(void)
 	if (wmi_has_guid(ACERWMID_EVENT_GUID))
 		acer_wmi_input_destroy();
 
+	if (has_cap(ACER_CAP_ACCEL))
+		acer_wmi_accel_destroy();
+
 	remove_sysfs(acer_platform_device);
 	remove_debugfs();
 	platform_device_unregister(acer_platform_device);
-- 
1.7.10
