From: Marek Vasut <marex@denx.de>
Subject: [PATCH 2/2] ACER: Add support for ambient light sensor
Date: Fri,  1 Jun 2012 19:11:23 +0200
Message-ID: <1338570683-16491-2-git-send-email-marex@denx.de>
References: <1338570683-16491-1-git-send-email-marex@denx.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:36026 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759212Ab2FARLf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jun 2012 13:11:35 -0400
In-Reply-To: <1338570683-16491-1-git-send-email-marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, joeyli <jlee@suse.com>

This is the ambient light sensor found on Iconia W500.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: joeyli <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |   86 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index edb6bad..a58c415 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -203,6 +203,7 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_BRIGHTNESS		(1<<3)
 #define ACER_CAP_THREEG			(1<<4)
 #define ACER_CAP_ACCEL			(1<<5)
+#define ACER_CAP_ALS			(1<<6)
 #define ACER_CAP_ANY			(0xFFFFFFFF)
 
 /*
@@ -1378,6 +1379,63 @@ static void acer_backlight_exit(void)
 }
 
 /*
+ * Ambient light sensor device
+ */
+static acpi_handle alsd_handle;
+
+static int acer_als_init(void)
+{
+	union acpi_object in_obj;
+	struct acpi_object_list params;
+	struct acpi_buffer out;
+	union acpi_object out_obj;
+	acpi_status status;
+
+	status = acpi_evaluate_object(alsd_handle, "_INI", NULL, NULL);
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	params.count = 1;
+	params.pointer = &in_obj;
+	in_obj.type = ACPI_TYPE_INTEGER;
+	/*
+	 * Unknown argument of both GLOV and GUPV, set to 5.
+	 * GLOV - G? Lower Value ?
+	 * GUPV - G? Upper Value ?
+	 */
+	in_obj.integer.value = 5;
+	out.length = sizeof(out_obj);
+	out.pointer = &out_obj;
+
+	acpi_evaluate_object(alsd_handle, "GLOV", &params, &out);
+	acpi_evaluate_object(alsd_handle, "GUPV", &params, &out);
+
+	return 0;
+}
+
+static ssize_t acer_als_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	acpi_status status;
+	struct acpi_buffer output;
+	union acpi_object out_obj;
+
+	status = acpi_evaluate_object(alsd_handle, "S3WK", NULL, NULL);
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	output.length = sizeof(out_obj);
+	output.pointer = &out_obj;
+	status = acpi_evaluate_object(alsd_handle, "_ALI", NULL, &output);
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	return sprintf(buf, "%d\n", (u16)out_obj.integer.value);
+}
+
+static DEVICE_ATTR(ls_switch, S_IRUGO, acer_als_show, NULL);
+
+/*
  * Accelerometer device
  */
 static acpi_handle gsensor_handle;
@@ -1856,6 +1914,21 @@ err_free_dev:
 	return err;
 }
 
+static int __init acer_wmi_alsd_setup(void)
+{
+	int err;
+
+	err = acer_wmi_get_handle("ALSD", "ACPI0008", &alsd_handle);
+	if (err)
+		return err;
+
+	interface->capability |= ACER_CAP_ALS;
+
+	acer_als_init();
+
+	return 0;
+}
+
 static void acer_wmi_accel_destroy(void)
 {
 	input_unregister_device(acer_wmi_accel_dev);
@@ -2020,6 +2093,9 @@ static int acer_platform_resume(struct platform_device *device)
 	if (has_cap(ACER_CAP_ACCEL))
 		acer_gsensor_init();
 
+	if (has_cap(ACER_CAP_ALS))
+		acer_als_init();
+
 	return 0;
 }
 
@@ -2052,6 +2128,8 @@ static int remove_sysfs(struct platform_device *device)
 {
 	if (has_cap(ACER_CAP_THREEG))
 		device_remove_file(&device->dev, &dev_attr_threeg);
+	if (has_cap(ACER_CAP_ALS))
+		device_remove_file(&device->dev, &dev_attr_ls_switch);
 
 	device_remove_file(&device->dev, &dev_attr_interface);
 
@@ -2069,6 +2147,13 @@ static int create_sysfs(void)
 			goto error_sysfs;
 	}
 
+	if (has_cap(ACER_CAP_ALS)) {
+		retval = device_create_file(&acer_platform_device->dev,
+			&dev_attr_ls_switch);
+		if (retval)
+			goto error_sysfs;
+	}
+
 	retval = device_create_file(&acer_platform_device->dev,
 		&dev_attr_interface);
 	if (retval)
@@ -2198,6 +2283,7 @@ static int __init acer_wmi_init(void)
 	}
 
 	acer_wmi_accel_setup();
+	acer_wmi_alsd_setup();
 
 	err = platform_driver_register(&acer_platform_driver);
 	if (err) {
-- 
1.7.10
