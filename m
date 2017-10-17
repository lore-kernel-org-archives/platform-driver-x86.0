From: Guillaume =?utf-8?Q?Dou=C3=A9zan-Grard?= <gdouezangrard@gmail.com>
Subject: [PATCH 1/4] platform/x86: topstar-laptop: non-functional changes
Date: Tue, 17 Oct 2017 18:17:45 +0200
Message-ID: <8e9fbd23704ec4294e86bd6293749e162ffb6255.1508255487.git.gdouezangrard@gmail.com>
References: <cover.1508255487.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:55582 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934114AbdJQQRs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2017 12:17:48 -0400
Content-Disposition: inline
In-Reply-To: <cover.1508255487.git.gdouezangrard@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Minor consistency changes to prepare further addition of platform device
and LED.

More precisely:

* more consistent naming (module description, header text, devices names
and programming constructs),

* clear separation between systems (ACPI events and input handling),

* copyright and module authors update.

Signed-off-by: Guillaume Douézan-Grard <gdouezangrard@gmail.com>
---
 drivers/platform/x86/topstar-laptop.c | 185 ++++++++++++++++++++--------------
 1 file changed, 110 insertions(+), 75 deletions(-)

diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index 1032c00b907b..d3197302aa91 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -1,10 +1,11 @@
 /*
- * ACPI driver for Topstar notebooks (hotkeys support only)
+ * Topstar Laptop ACPI Extras
  *
  * Copyright (c) 2009 Herton Ronaldo Krzesinski <herton@mandriva.com.br>
+ * Copyright (c) 2017 Guillaume Douézan-Grard
  *
  * Implementation inspired by existing x86 platform drivers, in special
- * asus/eepc/fujitsu-laptop, thanks to their authors
+ * asus/eepc/fujitsu-laptop, thanks to their authors.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -21,12 +22,17 @@
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 
-#define ACPI_TOPSTAR_CLASS "topstar"
+#define TOPSTAR_LAPTOP_CLASS "topstar"
 
-struct topstar_hkey {
-	struct input_dev *inputdev;
+struct topstar_laptop {
+	struct acpi_device *device;
+	struct input_dev *input;
 };
 
+/*
+ * Input
+ */
+
 static const struct key_entry topstar_keymap[] = {
 	{ KE_KEY, 0x80, { KEY_BRIGHTNESSUP } },
 	{ KE_KEY, 0x81, { KEY_BRIGHTNESSDOWN } },
@@ -57,32 +63,60 @@ static const struct key_entry topstar_keymap[] = {
 	{ KE_END, 0 }
 };
 
-static void acpi_topstar_notify(struct acpi_device *device, u32 event)
+static void topstar_input_notify(struct topstar_laptop *topstar, int event)
 {
-	static bool dup_evnt[2];
-	bool *dup;
-	struct topstar_hkey *hkey = acpi_driver_data(device);
+	if (!sparse_keymap_report_event(topstar->input, event, 1, true))
+		pr_info("Unknown key %x pressed\n", event);
+}
 
-	/* 0x83 and 0x84 key events comes duplicated... */
-	if (event == 0x83 || event == 0x84) {
-		dup = &dup_evnt[event - 0x83];
-		if (*dup) {
-			*dup = false;
-			return;
-		}
-		*dup = true;
+static int topstar_input_init(struct topstar_laptop *topstar)
+{
+	struct input_dev *input;
+	int err;
+
+	input = input_allocate_device();
+	if (!input)
+		return -ENOMEM;
+
+	input->name = "Topstar Laptop Extra Buttons";
+	input->phys = TOPSTAR_LAPTOP_CLASS "/input0";
+	input->id.bustype = BUS_HOST;
+
+	err = sparse_keymap_setup(input, topstar_keymap, NULL);
+	if (err) {
+		pr_err("Unable to setup input device keymap\n");
+		goto err_input;
+	}
+
+	err = input_register_device(input);
+	if (err) {
+		pr_err("Unable to register input device\n");
+		goto err_input;
 	}
 
-	if (!sparse_keymap_report_event(hkey->inputdev, event, 1, true))
-		pr_info("unknown event = 0x%02x\n", event);
+	topstar->input = input;
+	return 0;
+
+err_input:
+	input_free_device(input);
+	return err;
+}
+
+static void topstar_input_exit(struct topstar_laptop *topstar)
+{
+	input_unregister_device(topstar->input);
 }
 
-static int acpi_topstar_fncx_switch(struct acpi_device *device, bool state)
+/*
+ * ACPI
+ */
+
+static int topstar_acpi_fncx_switch(struct acpi_device *device, bool state)
 {
 	acpi_status status;
 
 	status = acpi_execute_simple_method(device->handle, "FNCX",
-						state ? 0x86 : 0x87);
+			state ? 0x86 : 0x87);
 	if (ACPI_FAILURE(status)) {
 		pr_err("Unable to switch FNCX notifications\n");
 		return -ENODEV;
@@ -91,73 +125,74 @@ static int acpi_topstar_fncx_switch(struct acpi_device *device, bool state)
 	return 0;
 }
 
-static int acpi_topstar_init_hkey(struct topstar_hkey *hkey)
+static int topstar_acpi_init(struct topstar_laptop *topstar)
 {
-	struct input_dev *input;
-	int error;
-
-	input = input_allocate_device();
-	if (!input)
-		return -ENOMEM;
+	return topstar_acpi_fncx_switch(topstar->device, true);
+}
 
-	input->name = "Topstar Laptop extra buttons";
-	input->phys = "topstar/input0";
-	input->id.bustype = BUS_HOST;
+static void topstar_acpi_exit(struct topstar_laptop *topstar)
+{
+	topstar_acpi_fncx_switch(topstar->device, false);
+}
 
-	error = sparse_keymap_setup(input, topstar_keymap, NULL);
-	if (error) {
-		pr_err("Unable to setup input device keymap\n");
-		goto err_free_dev;
-	}
+static void topstar_acpi_notify(struct acpi_device *device, u32 event)
+{
+	struct topstar_laptop *topstar = acpi_driver_data(device);
+	static bool dup_evnt[2];
+	bool *dup;
 
-	error = input_register_device(input);
-	if (error) {
-		pr_err("Unable to register input device\n");
-		goto err_free_dev;
+	/* 0x83 and 0x84 key events comes duplicated... */
+	if (event == 0x83 || event == 0x84) {
+		dup = &dup_evnt[event - 0x83];
+		if (*dup) {
+			*dup = false;
+			return;
+		}
+		*dup = true;
 	}
 
-	hkey->inputdev = input;
-	return 0;
-
- err_free_dev:
-	input_free_device(input);
-	return error;
+	topstar_input_notify(topstar, event);
 }
 
-static int acpi_topstar_add(struct acpi_device *device)
+static int topstar_acpi_add(struct acpi_device *device)
 {
-	struct topstar_hkey *tps_hkey;
+	struct topstar_laptop *topstar;
+	int err;
 
-	tps_hkey = kzalloc(sizeof(struct topstar_hkey), GFP_KERNEL);
-	if (!tps_hkey)
+	topstar = kzalloc(sizeof(struct topstar_laptop), GFP_KERNEL);
+	if (!topstar)
 		return -ENOMEM;
 
-	strcpy(acpi_device_name(device), "Topstar TPSACPI");
-	strcpy(acpi_device_class(device), ACPI_TOPSTAR_CLASS);
+	strcpy(acpi_device_name(device), "Topstar Laptop ACPI");
+	strcpy(acpi_device_class(device), TOPSTAR_LAPTOP_CLASS);
+	device->driver_data = topstar;
+	topstar->device = device;
 
-	if (acpi_topstar_fncx_switch(device, true))
-		goto add_err;
+	err = topstar_acpi_init(topstar);
+	if (err)
+		goto err_acpi;
 
-	if (acpi_topstar_init_hkey(tps_hkey))
-		goto add_err;
+	err = topstar_input_init(topstar);
+	if (err)
+		goto err_acpi_input;
 
-	device->driver_data = tps_hkey;
 	return 0;
 
-add_err:
-	kfree(tps_hkey);
-	return -ENODEV;
+err_acpi_input:
+	topstar_acpi_exit(topstar);
+err_acpi:
+	kfree(topstar);
+	return err;
 }
 
-static int acpi_topstar_remove(struct acpi_device *device)
+static int topstar_acpi_remove(struct acpi_device *device)
 {
-	struct topstar_hkey *tps_hkey = acpi_driver_data(device);
-
-	acpi_topstar_fncx_switch(device, false);
+	struct topstar_laptop *topstar = acpi_driver_data(device);
 
-	input_unregister_device(tps_hkey->inputdev);
-	kfree(tps_hkey);
+	topstar_input_exit(topstar);
+	topstar_acpi_exit(topstar);
 
+	kfree(topstar);
 	return 0;
 }
 
@@ -168,18 +203,18 @@ static const struct acpi_device_id topstar_device_ids[] = {
 };
 MODULE_DEVICE_TABLE(acpi, topstar_device_ids);
 
-static struct acpi_driver acpi_topstar_driver = {
-	.name = "Topstar laptop ACPI driver",
-	.class = ACPI_TOPSTAR_CLASS,
+static struct acpi_driver topstar_acpi_driver = {
+	.name = "Topstar Laptop ACPI Driver",
+	.class = TOPSTAR_LAPTOP_CLASS,
 	.ids = topstar_device_ids,
 	.ops = {
-		.add = acpi_topstar_add,
-		.remove = acpi_topstar_remove,
-		.notify = acpi_topstar_notify,
+		.add = topstar_acpi_add,
+		.remove = topstar_acpi_remove,
+		.notify = topstar_acpi_notify,
 	},
 };
-module_acpi_driver(acpi_topstar_driver);
+module_acpi_driver(topstar_acpi_driver);
 
-MODULE_AUTHOR("Herton Ronaldo Krzesinski");
-MODULE_DESCRIPTION("Topstar Laptop ACPI Extras driver");
+MODULE_AUTHOR("Herton Ronaldo Krzesinski, Guillaume Douézan-Grard");
+MODULE_DESCRIPTION("Topstar Laptop ACPI Extras");
 MODULE_LICENSE("GPL");
-- 
2.14.1
