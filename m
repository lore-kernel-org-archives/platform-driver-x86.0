From: Marek Vasut <marex@denx.de>
Subject: [PATCH] ACER: Add support for ambient light sensor
Date: Mon, 28 May 2012 02:25:46 +0200
Message-ID: <1338164746-21675-1-git-send-email-marex@denx.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:35653 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752717Ab2E1AZy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 May 2012 20:25:54 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, joeyli <jlee@suse.com>

This is the ambient light sensor found on Iconia W500.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: joeyli <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |   46 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 2df0673..b8acfb5 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -148,6 +148,7 @@ struct event_return_value {
 #define ACER_WMID3_GDS_WIMAX		(1<<7)	/* WiMAX */
 #define ACER_WMID3_GDS_BLUETOOTH	(1<<11)	/* BT */
 #define ACER_WMID3_GDS_ACCEL		(1<<2)	/* Accelerometer */
+#define ACER_WMID3_GDS_ALS		(1<<8)	/* Ambient light sensor */
 
 struct lm_input_params {
 	u8 function_num;        /* Function Number */
@@ -204,6 +205,7 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_BRIGHTNESS		(1<<3)
 #define ACER_CAP_THREEG			(1<<4)
 #define ACER_CAP_ACCEL			(1<<5)
+#define ACER_CAP_ALS			(1<<6)
 #define ACER_CAP_ANY			(0xFFFFFFFF)
 
 /*
@@ -1156,6 +1158,8 @@ static void type_aa_dmi_decode(const struct dmi_header *header, void *dummy)
 		interface->capability |= ACER_CAP_BLUETOOTH;
 	if (type_aa->others_func_bitmap & ACER_WMID3_GDS_ACCEL)
 		interface->capability |= ACER_CAP_ACCEL;
+	if (type_aa->others_func_bitmap & ACER_WMID3_GDS_ALS)
+		interface->capability |= ACER_CAP_ALS;
 
 	commun_fn_key_number = type_aa->commun_fn_key_number;
 }
@@ -1381,6 +1385,39 @@ static void acer_backlight_exit(void)
 }
 
 /*
+ * Ambient light sensor device
+ */
+#define ACER_ALS_HANDLE	"\\_SB.PCI0.LPC0.ALSD"
+#define ACER_ALS_INIT	"\\_SB.PCI0.LPC0.ALSD._INI"
+#define ACER_ALS_ALI	"\\_SB.PCI0.LPC0.ALSD._ALI"
+static ssize_t acer_als_show(struct device *dev, struct device_attribute *attr,
+			char *buf)
+{
+	acpi_handle handle;
+	acpi_status status;
+	struct acpi_buffer output;
+	union acpi_object out_obj;
+
+	status = acpi_get_handle(NULL, ACER_ALS_HANDLE, &handle);
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	status = acpi_evaluate_object(NULL, ACER_ALS_INIT, NULL, NULL);
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	output.length = sizeof(out_obj);
+	output.pointer = &out_obj;
+	status = acpi_evaluate_object(NULL, ACER_ALS_ALI, NULL, &output);
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
 #define ACER_GSENSOR_HANDLE	"\\_SB.PCI0.LPC0.SENR"
@@ -2020,6 +2057,8 @@ static int remove_sysfs(struct platform_device *device)
 {
 	if (has_cap(ACER_CAP_THREEG))
 		device_remove_file(&device->dev, &dev_attr_threeg);
+	if (has_cap(ACER_CAP_ALS))
+		device_remove_file(&device->dev, &dev_attr_ls_switch);
 
 	device_remove_file(&device->dev, &dev_attr_interface);
 
@@ -2037,6 +2076,13 @@ static int create_sysfs(void)
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
-- 
1.7.10
