From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH][V3] intel-hid: support 5 array button
Date: Tue, 14 Feb 2017 15:20:34 +0800
Message-ID: <1487056834-7050-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:47234 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751937AbdBNHUl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Feb 2017 02:20:41 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, andy@infradead.org

New firmwares include a feature called 5 button array that supports
super key, volume up/down, rotation lock and power button. Support
for this feature is required to fix power button on some recent
systems.

This patch was tested on a Dell Latitude 7480.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/intel-hid.c | 96 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 91 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index cb3ab2b..bcf438f 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -1,5 +1,5 @@
 /*
- *  Intel HID event driver for Windows 8
+ *  Intel HID event & 5 button array driver
  *
  *  Copyright (C) 2015 Alex Hung <alex.hung@canonical.com>
  *  Copyright (C) 2015 Andrew Lutomirski <luto@kernel.org>
@@ -57,8 +57,24 @@ static const struct key_entry intel_hid_keymap[] = {
 	{ KE_END },
 };
 
+/* 5 button array notification value. */
+static const struct key_entry intel_array_keymap[] = {
+	{ KE_KEY,    0xC2, { KEY_LEFTMETA } },                /* Press */
+	{ KE_IGNORE, 0xC3, { KEY_LEFTMETA } },                /* Release */
+	{ KE_KEY,    0xC4, { KEY_VOLUMEUP } },                /* Press */
+	{ KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },                /* Release */
+	{ KE_KEY,    0xC6, { KEY_VOLUMEDOWN } },              /* Press */
+	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },              /* Release */
+	{ KE_SW,     0xC8, { .sw = { SW_ROTATE_LOCK, 1 } } }, /* Press */
+	{ KE_SW,     0xC9, { .sw = { SW_ROTATE_LOCK, 0 } } }, /* Release */
+	{ KE_KEY,    0xCE, { KEY_POWER } },                   /* Press */
+	{ KE_IGNORE, 0xCF, { KEY_POWER } },                   /* Release */
+	{ KE_END },
+};
+
 struct intel_hid_priv {
 	struct input_dev *input_dev;
+	struct input_dev *array;
 };
 
 static int intel_hid_set_enable(struct device *device, int enable)
@@ -78,15 +94,43 @@ static int intel_hid_set_enable(struct device *device, int enable)
 	return 0;
 }
 
+static void intel_button_array_enable(struct device *device, bool enable)
+{
+	struct intel_hid_priv *priv = dev_get_drvdata(device);
+	acpi_handle handle = ACPI_HANDLE(device);
+	unsigned long long button_cap;
+	acpi_status status;
+
+	if (!priv->array)
+		return;
+
+	/* Query supported platform features */
+	status = acpi_evaluate_integer(handle, "BTNC", NULL, &button_cap);
+	if (ACPI_FAILURE(status)) {
+		dev_warn(device, "failed to get button capability\n");
+		return;
+	}
+
+	/* Enable|disable features - power button is always enabled */
+	status = acpi_execute_simple_method(handle, "BTNE",
+					    enable ? button_cap : 1);
+	if (ACPI_FAILURE(status))
+		dev_warn(device, "failed to set button capability\n");
+}
+
 static int intel_hid_pl_suspend_handler(struct device *device)
 {
 	intel_hid_set_enable(device, 0);
+	intel_button_array_enable(device, false);
+
 	return 0;
 }
 
 static int intel_hid_pl_resume_handler(struct device *device)
 {
 	intel_hid_set_enable(device, 1);
+	intel_button_array_enable(device, true);
+
 	return 0;
 }
 
@@ -126,6 +170,27 @@ static int intel_hid_input_setup(struct platform_device *device)
 	return ret;
 }
 
+static int intel_button_array_input_setup(struct platform_device *device)
+{
+	struct intel_hid_priv *priv = dev_get_drvdata(&device->dev);
+	int ret;
+
+	/* Setup input device for 5 button array */
+	priv->array = devm_input_allocate_device(&device->dev);
+	if (!priv->array)
+		return -ENOMEM;
+
+	ret = sparse_keymap_setup(priv->array, intel_array_keymap, NULL);
+	if (ret)
+		return ret;
+
+	priv->array->dev.parent = &device->dev;
+	priv->array->name = "Intel HID 5 button array";
+	priv->array->id.bustype = BUS_HOST;
+
+	return input_register_device(priv->array);
+}
+
 static void intel_hid_input_destroy(struct platform_device *device)
 {
 	struct intel_hid_priv *priv = dev_get_drvdata(&device->dev);
@@ -140,10 +205,11 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	unsigned long long ev_index;
 	acpi_status status;
 
-	/* The platform spec only defines one event code: 0xC0. */
+	/* 0xC0 is for HID events, other values are for 5 button array */
 	if (event != 0xc0) {
-		dev_warn(&device->dev, "received unknown event (0x%x)\n",
-			 event);
+		if (!priv->array ||
+		    !sparse_keymap_report_event(priv->array, event, 1, true))
+			dev_info(&device->dev, "unknown event 0x%x\n", event);
 		return;
 	}
 
@@ -161,8 +227,8 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 static int intel_hid_probe(struct platform_device *device)
 {
 	acpi_handle handle = ACPI_HANDLE(&device->dev);
+	unsigned long long event_cap, mode;
 	struct intel_hid_priv *priv;
-	unsigned long long mode;
 	acpi_status status;
 	int err;
 
@@ -193,6 +259,15 @@ static int intel_hid_probe(struct platform_device *device)
 		return err;
 	}
 
+	/* Setup 5 button array */
+	status = acpi_evaluate_integer(handle, "HEBC", NULL, &event_cap);
+	if (ACPI_SUCCESS(status) && (event_cap & 0x20000)) {
+		dev_info(&device->dev, "platform supports 5 button array\n");
+		err = intel_button_array_input_setup(device);
+		if (err)
+			pr_err("Failed to setup Intel 5 button array hotkeys\n");
+	}
+
 	status = acpi_install_notify_handler(handle,
 					     ACPI_DEVICE_NOTIFY,
 					     notify_handler,
@@ -206,6 +281,16 @@ static int intel_hid_probe(struct platform_device *device)
 	if (err)
 		goto err_remove_notify;
 
+	if (priv->array) {
+		intel_button_array_enable(&device->dev, true);
+
+		/* Call button load method to enable HID power button */
+		status = acpi_evaluate_object(handle, "BTNL", NULL, NULL);
+		if (ACPI_FAILURE(status))
+			dev_warn(&device->dev,
+				 "failed to enable HID power button\n");
+	}
+
 	return 0;
 
 err_remove_notify:
@@ -224,6 +309,7 @@ static int intel_hid_remove(struct platform_device *device)
 	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
 	intel_hid_input_destroy(device);
 	intel_hid_set_enable(&device->dev, 0);
+	intel_button_array_enable(&device->dev, false);
 
 	/*
 	 * Even if we failed to shut off the event stream, we can still
-- 
2.7.4
