From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] dell-rbtn: add keycode for Dell's toggle switch
Date: Fri, 24 Apr 2015 15:42:07 +0800
Message-ID: <1429861327-28644-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:46806 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752510AbbDXHmR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Apr 2015 03:42:17 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, alex.hung@canonical.com

When Method(CRBT) returns 0 and 1, BIOS will not change hardware pin. As a
result, a keycode KEY_RFKILL is required when wireless hotkey is pressed.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/dell-rbtn.c |   99 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
index 69c17e8..517747b 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -16,22 +16,73 @@
 #include <linux/module.h>
 #include <linux/acpi.h>
 #include <linux/rfkill.h>
+#include <linux/input.h>
 
 /*** helper functions ***/
 
+enum wireless_config_type {
+	DELL_TOGGLE_SWITCH,
+	DELL_SLIDER_SWITCH
+};
+
+static int switch_type;
+static struct input_dev *dellwl_input_dev;
+
+static int dell_wireless_input_setup(void)
+{
+	int err;
+
+	dellwl_input_dev = input_allocate_device();
+	if (!dellwl_input_dev)
+		return -ENOMEM;
+
+	dellwl_input_dev->name = "DELL Wireless hotkeys";
+	dellwl_input_dev->phys = "dellabce/input0";
+	dellwl_input_dev->id.bustype = BUS_HOST;
+	dellwl_input_dev->evbit[0] = BIT(EV_KEY);
+	set_bit(KEY_RFKILL, dellwl_input_dev->keybit);
+
+	err = input_register_device(dellwl_input_dev);
+	if (err)
+		goto err_free_dev;
+
+	return 0;
+
+err_free_dev:
+	input_free_device(dellwl_input_dev);
+	return err;
+}
+
+static void dell_wireless_input_destroy(void)
+{
+	input_unregister_device(dellwl_input_dev);
+}
 static int rbtn_check(struct acpi_device *device)
 {
 	acpi_status status;
 	unsigned long long output;
+	int err = 0;
 
 	status = acpi_evaluate_integer(device->handle, "CRBT", NULL, &output);
+	pr_info("switch type = %x\n", switch_type);
 	if (ACPI_FAILURE(status))
 		return -EINVAL;
 
-	if (output > 3)
-		return -EINVAL;
+	switch (output) {
+	case 0:
+	case 1:
+		switch_type = DELL_TOGGLE_SWITCH;
+		err = dell_wireless_input_setup();
+		break;
+	case 2:
+	case 3:
+		switch_type = DELL_SLIDER_SWITCH;
+		break;
+	default:
+		err = -EINVAL;
+	}
 
-	return 0;
+	return err;
 }
 
 
@@ -198,6 +249,20 @@ EXPORT_SYMBOL_GPL(dell_rbtn_notifier_unregister);
 
 /*** acpi driver functions ***/
 
+static int rbtn_radio_switch_enable(struct acpi_device *device, int enable)
+{
+	acpi_status status;
+	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
+	struct acpi_object_list args = { 1, &arg0 };
+
+	arg0.integer.value = enable;
+	status = acpi_evaluate_object(device->handle, "ARBT", &args, NULL);
+	if (!ACPI_SUCCESS(status))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int rbtn_add(struct acpi_device *device)
 {
 	int ret;
@@ -209,12 +274,27 @@ static int rbtn_add(struct acpi_device *device)
 	if (auto_remove_rfkill && rbtn_chain_head.head)
 		return 0;
 
+
+	ret = rbtn_radio_switch_enable(device, 1);
+	if (ret < 0)
+		return ret;
+
 	return rbtn_enable(device);
 }
 
 static int rbtn_remove(struct acpi_device *device)
 {
+	int ret;
+
+	if (switch_type == DELL_TOGGLE_SWITCH)
+		dell_wireless_input_destroy();
+
 	rbtn_disable(device);
+
+	ret = rbtn_radio_switch_enable(device, 0);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -222,8 +302,17 @@ static void rbtn_notify(struct acpi_device *device, u32 event)
 {
 	struct rfkill *rfkill = device->driver_data;
 
-	if (rfkill && event == 0x80)
-		rbtn_query(rfkill, device);
+	if (event == 0x80) {
+		if (rfkill)
+			rbtn_query(rfkill, device);
+
+		if (switch_type == DELL_TOGGLE_SWITCH) {
+			input_report_key(dellwl_input_dev, KEY_RFKILL, 1);
+			input_sync(dellwl_input_dev);
+			input_report_key(dellwl_input_dev, KEY_RFKILL, 0);
+			input_sync(dellwl_input_dev);
+		}
+	}
 
 	if (!rbtn_chain_head.head && event != 0x80)
 		dev_info(&device->dev, "Received unknown event (0x%x)\n", event);
-- 
1.7.9.5
