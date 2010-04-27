From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Subject: [PATCH] classmate-laptop: Add RFKILL support.
Date: Tue, 27 Apr 2010 13:15:00 -0300
Message-ID: <1272384900-3982-1-git-send-email-cascardo@holoscopio.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from liberdade.minaslivre.org ([72.232.254.139]:33957 "EHLO
	liberdade.minaslivre.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756218Ab0D0QXN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Apr 2010 12:23:13 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: mjg@redhat.com, don@syst.com.br, johannes@sipsolutions.net, rpurdie@rpsys.net, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>

The RFKILL device shares the same ACPI device used for backlight. So, it
required a new struct sharing both a backlight_device and a rfkill
device.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
---
 drivers/platform/x86/classmate-laptop.c |  170 +++++++++++++++++++++++++++----
 1 files changed, 148 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
index 7f9e5dd..3bf399f 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -24,6 +24,7 @@
 #include <acpi/acpi_drivers.h>
 #include <linux/backlight.h>
 #include <linux/input.h>
+#include <linux/rfkill.h>
 
 MODULE_LICENSE("GPL");
 
@@ -37,7 +38,7 @@ struct cmpc_accel {
 
 #define CMPC_ACCEL_HID		"ACCE0000"
 #define CMPC_TABLET_HID		"TBLT0000"
-#define CMPC_BL_HID		"IPML200"
+#define CMPC_IPML_HID	"IPML200"
 #define CMPC_KEYS_HID		"FnBT0000"
 
 /*
@@ -461,43 +462,168 @@ static const struct backlight_ops cmpc_bl_ops = {
 	.update_status = cmpc_bl_update_status
 };
 
-static int cmpc_bl_add(struct acpi_device *acpi)
+/*
+ * RFKILL code.
+ */
+
+static acpi_status cmpc_get_rfkill_wlan(acpi_handle handle,
+					unsigned long long *value)
 {
-	struct backlight_properties props;
+	union acpi_object param;
+	struct acpi_object_list input;
+	unsigned long long output;
+	acpi_status status;
+
+	param.type = ACPI_TYPE_INTEGER;
+	param.integer.value = 0xC1;
+	input.count = 1;
+	input.pointer = &param;
+	status = acpi_evaluate_integer(handle, "GRDI", &input, &output);
+	if (ACPI_SUCCESS(status))
+		*value = output;
+	return status;
+}
+
+static acpi_status cmpc_set_rfkill_wlan(acpi_handle handle,
+					unsigned long long value)
+{
+	union acpi_object param[2];
+	struct acpi_object_list input;
+	acpi_status status;
+	unsigned long long output;
+
+	param[0].type = ACPI_TYPE_INTEGER;
+	param[0].integer.value = 0xC1;
+	param[1].type = ACPI_TYPE_INTEGER;
+	param[1].integer.value = value;
+	input.count = 2;
+	input.pointer = param;
+	status = acpi_evaluate_integer(handle, "GWRI", &input, &output);
+	return status;
+}
+
+static void cmpc_rfkill_query(struct rfkill *rfkill, void *data)
+{
+	acpi_status status;
+	acpi_handle handle;
+	unsigned long long state;
+	bool blocked;
+
+	handle = data;
+	status = cmpc_get_rfkill_wlan(handle, &state);
+	if (ACPI_SUCCESS(status)) {
+		blocked = state & 1 ? false : true;
+		rfkill_set_sw_state(rfkill, blocked);
+	}
+}
+
+static int cmpc_rfkill_block(void *data, bool blocked)
+{
+	acpi_status status;
+	acpi_handle handle;
+	unsigned long long state;
+
+	handle = data;
+	status = cmpc_get_rfkill_wlan(handle, &state);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+	if (blocked)
+		state &= ~1;
+	else
+		state |= 1;
+	status = cmpc_set_rfkill_wlan(handle, state);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+	return 0;
+}
+
+static const struct rfkill_ops cmpc_rfkill_ops = {
+	.query = cmpc_rfkill_query,
+	.set_block = cmpc_rfkill_block,
+};
+
+/*
+ * Common backlight and rfkill code.
+ */
+
+struct ipml200_dev {
 	struct backlight_device *bd;
+	struct rfkill *rf;
+};
+
+static int cmpc_ipml_add(struct acpi_device *acpi)
+{
+	int retval;
+	struct ipml200_dev *ipml;
+	struct backlight_properties props;
+
+	ipml = kmalloc(sizeof(*ipml), GFP_KERNEL);
+	if (ipml == NULL)
+		return -ENOMEM;
 
 	memset(&props, 0, sizeof(struct backlight_properties));
 	props.max_brightness = 7;
-	bd = backlight_device_register("cmpc_bl", &acpi->dev, acpi->handle,
-				       &cmpc_bl_ops, &props);
-	if (IS_ERR(bd))
-		return PTR_ERR(bd);
-	dev_set_drvdata(&acpi->dev, bd);
+	ipml->bd = backlight_device_register("cmpc_bl", &acpi->dev,
+					     acpi->handle, &cmpc_bl_ops,
+					     &props);
+	if (IS_ERR(ipml->bd)) {
+		retval = PTR_ERR(ipml->bd);
+		goto out_bd;
+	}
+
+	ipml->rf = rfkill_alloc("cmpc_rfkill", &acpi->dev, RFKILL_TYPE_WLAN,
+				&cmpc_rfkill_ops, acpi->handle);
+	/* rfkill_alloc may fail if RFKILL is disabled. We should still work
+	 * anyway. */
+	if (!IS_ERR(ipml->rf)) {
+		retval = rfkill_register(ipml->rf);
+		if (retval) {
+			rfkill_destroy(ipml->rf);
+			ipml->rf = NULL;
+		}
+	} else {
+		ipml->rf = NULL;
+	}
+
+	dev_set_drvdata(&acpi->dev, ipml);
 	return 0;
+
+out_bd:
+	kfree(ipml);
+	return retval;
 }
 
-static int cmpc_bl_remove(struct acpi_device *acpi, int type)
+static int cmpc_ipml_remove(struct acpi_device *acpi, int type)
 {
-	struct backlight_device *bd;
+	struct ipml200_dev *ipml;
+
+	ipml = dev_get_drvdata(&acpi->dev);
+
+	backlight_device_unregister(ipml->bd);
+
+	if (ipml->rf) {
+		rfkill_unregister(ipml->rf);
+		rfkill_destroy(ipml->rf);
+	}
+
+	kfree(ipml);
 
-	bd = dev_get_drvdata(&acpi->dev);
-	backlight_device_unregister(bd);
 	return 0;
 }
 
-static const struct acpi_device_id cmpc_bl_device_ids[] = {
-	{CMPC_BL_HID, 0},
+static const struct acpi_device_id cmpc_ipml_device_ids[] = {
+	{CMPC_IPML_HID, 0},
 	{"", 0}
 };
 
-static struct acpi_driver cmpc_bl_acpi_driver = {
+static struct acpi_driver cmpc_ipml_acpi_driver = {
 	.owner = THIS_MODULE,
 	.name = "cmpc",
 	.class = "cmpc",
-	.ids = cmpc_bl_device_ids,
+	.ids = cmpc_ipml_device_ids,
 	.ops = {
-		.add = cmpc_bl_add,
-		.remove = cmpc_bl_remove
+		.add = cmpc_ipml_add,
+		.remove = cmpc_ipml_remove
 	}
 };
 
@@ -580,7 +706,7 @@ static int cmpc_init(void)
 	if (r)
 		goto failed_keys;
 
-	r = acpi_bus_register_driver(&cmpc_bl_acpi_driver);
+	r = acpi_bus_register_driver(&cmpc_ipml_acpi_driver);
 	if (r)
 		goto failed_bl;
 
@@ -598,7 +724,7 @@ failed_accel:
 	acpi_bus_unregister_driver(&cmpc_tablet_acpi_driver);
 
 failed_tablet:
-	acpi_bus_unregister_driver(&cmpc_bl_acpi_driver);
+	acpi_bus_unregister_driver(&cmpc_ipml_acpi_driver);
 
 failed_bl:
 	acpi_bus_unregister_driver(&cmpc_keys_acpi_driver);
@@ -611,7 +737,7 @@ static void cmpc_exit(void)
 {
 	acpi_bus_unregister_driver(&cmpc_accel_acpi_driver);
 	acpi_bus_unregister_driver(&cmpc_tablet_acpi_driver);
-	acpi_bus_unregister_driver(&cmpc_bl_acpi_driver);
+	acpi_bus_unregister_driver(&cmpc_ipml_acpi_driver);
 	acpi_bus_unregister_driver(&cmpc_keys_acpi_driver);
 }
 
@@ -621,7 +747,7 @@ module_exit(cmpc_exit);
 static const struct acpi_device_id cmpc_device_ids[] = {
 	{CMPC_ACCEL_HID, 0},
 	{CMPC_TABLET_HID, 0},
-	{CMPC_BL_HID, 0},
+	{CMPC_IPML_HID, 0},
 	{CMPC_KEYS_HID, 0},
 	{"", 0}
 };
-- 
1.6.6.1

