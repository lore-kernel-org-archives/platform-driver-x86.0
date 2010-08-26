From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 10/10] WMI: embed struct device directly into wmi_block
Date: Thu, 26 Aug 2010 00:15:30 -0700
Message-ID: <20100826071530.7976.85287.stgit@localhost.localdomain>
References: <20100826071442.7976.93972.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:38467 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753007Ab0HZHPe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 03:15:34 -0400
Received: by pxi10 with SMTP id 10so511603pxi.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2010 00:15:33 -0700 (PDT)
In-Reply-To: <20100826071442.7976.93972.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, platform-driver-x86@vger.kernel.org

Instead of creating wmi_blocks and then register corresponding devices
on a separate pass do it all in one shot, since lifetime rules for both
objects are the same. This also takes care of leaking devices when
device_create fails for one of them.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/wmi.c |  176 ++++++++++++++++----------------------------
 1 files changed, 65 insertions(+), 111 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 781321b..f822ff0 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -68,7 +68,7 @@ struct wmi_block {
 	acpi_handle handle;
 	wmi_notify_handler handler;
 	void *handler_data;
-	struct device *dev;
+	struct device dev;
 };
 
 
@@ -110,7 +110,7 @@ static struct acpi_driver acpi_wmi_driver = {
 		.add = acpi_wmi_add,
 		.remove = acpi_wmi_remove,
 		.notify = acpi_wmi_notify,
-		},
+	},
 };
 
 /*
@@ -705,7 +705,9 @@ static int wmi_dev_uevent(struct device *dev, struct kobj_uevent_env *env)
 
 static void wmi_dev_free(struct device *dev)
 {
-	kfree(dev);
+	struct wmi_block *wmi_block = container_of(dev, struct wmi_block, dev);
+
+	kfree(wmi_block);
 }
 
 static struct class wmi_class = {
@@ -715,104 +717,60 @@ static struct class wmi_class = {
 	.dev_attrs = wmi_dev_attrs,
 };
 
-static int wmi_create_devs(void)
+static struct wmi_block *wmi_create_device(const struct guid_block *gblock,
+					   acpi_handle handle)
 {
-	int result;
-	char guid_string[37];
-	struct guid_block *gblock;
 	struct wmi_block *wblock;
-	struct list_head *p;
-	struct device *guid_dev;
+	int error;
+	char guid_string[37];
 
-	/* Create devices for all the GUIDs */
-	list_for_each(p, &wmi_block_list) {
-		wblock = list_entry(p, struct wmi_block, list);
+	wblock = kzalloc(sizeof(struct wmi_block), GFP_KERNEL);
+	if (!wblock) {
+		error = -ENOMEM;
+		goto err_out;
+	}
 
-		guid_dev = kzalloc(sizeof(struct device), GFP_KERNEL);
-		if (!guid_dev)
-			return -ENOMEM;
+	wblock->handle = handle;
+	wblock->gblock = *gblock;
 
-		wblock->dev = guid_dev;
+	wblock->dev.class = &wmi_class;
 
-		guid_dev->class = &wmi_class;
-		dev_set_drvdata(guid_dev, wblock);
+	wmi_gtoa(gblock->guid, guid_string);
+	dev_set_name(&wblock->dev, guid_string);
 
-		gblock = &wblock->gblock;
+	dev_set_drvdata(&wblock->dev, wblock);
 
-		wmi_gtoa(gblock->guid, guid_string);
-		dev_set_name(guid_dev, guid_string);
+	error = device_register(&wblock->dev);
+	if (error)
+		goto err_free;
 
-		result = device_register(guid_dev);
-		if (result)
-			return result;
-	}
+	list_add_tail(&wblock->list, &wmi_block_list);
+	return wblock;
 
-	return 0;
+err_free:
+	kfree(wblock);
+err_out:
+	return ERR_PTR(error);
 }
 
-static void wmi_remove_devs(void)
+static void wmi_free_devices(void)
 {
-	struct guid_block *gblock;
-	struct wmi_block *wblock;
-	struct list_head *p;
-	struct device *guid_dev;
+	struct wmi_block *wblock, *next;
 
 	/* Delete devices for all the GUIDs */
-	list_for_each(p, &wmi_block_list) {
-		wblock = list_entry(p, struct wmi_block, list);
-
-		guid_dev = wblock->dev;
-		gblock = &wblock->gblock;
-
-		device_unregister(guid_dev);
-	}
-}
-
-static void wmi_class_exit(void)
-{
-	wmi_remove_devs();
-	class_unregister(&wmi_class);
-}
-
-static int wmi_class_init(void)
-{
-	int ret;
-
-	ret = class_register(&wmi_class);
-	if (ret)
-		return ret;
-
-	ret = wmi_create_devs();
-	if (ret)
-		wmi_class_exit();
-
-	return ret;
+	list_for_each_entry_safe(wblock, next, &wmi_block_list, list)
+		device_unregister(&wblock->dev);
 }
 
 static bool guid_already_parsed(const char *guid_string)
 {
-	struct guid_block *gblock;
 	struct wmi_block *wblock;
-	struct list_head *p;
-
-	list_for_each(p, &wmi_block_list) {
-		wblock = list_entry(p, struct wmi_block, list);
-		gblock = &wblock->gblock;
 
-		if (strncmp(gblock->guid, guid_string, 16) == 0)
+	list_for_each_entry(wblock, &wmi_block_list, list)
+		if (strncmp(wblock->gblock.guid, guid_string, 16) == 0)
 			return true;
-	}
-	return false;
-}
 
-static void free_wmi_blocks(void)
-{
-	struct wmi_block *wblock, *next;
-
-	list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
-		list_del(&wblock->list);
-		kfree(wblock);
-	}
+	return false;
 }
 
 /*
@@ -826,19 +784,19 @@ static acpi_status parse_wdg(acpi_handle handle)
 	struct wmi_block *wblock;
 	char guid_string[37];
 	acpi_status status;
+	int retval;
 	u32 i, total;
 
 	status = acpi_evaluate_object(handle, "_WDG", NULL, &out);
-
 	if (ACPI_FAILURE(status))
-		return status;
+		return -ENXIO;
 
 	obj = (union acpi_object *) out.pointer;
 	if (!obj)
-		return AE_ERROR;
+		return -ENXIO;
 
 	if (obj->type != ACPI_TYPE_BUFFER) {
-		status = AE_ERROR;
+		retval = -ENXIO;
 		goto out_free_pointer;
 	}
 
@@ -858,31 +816,29 @@ static acpi_status parse_wdg(acpi_handle handle)
 			pr_info("Skipping duplicate GUID %s\n", guid_string);
 			continue;
 		}
+
 		if (debug_dump_wdg)
 			wmi_dump_wdg(&gblock[i]);
 
-		wblock = kzalloc(sizeof(struct wmi_block), GFP_KERNEL);
-		if (!wblock) {
-			status = AE_NO_MEMORY;
-			goto out_free_pointer;
+		wblock = wmi_create_device(&gblock[i], handle);
+		if (IS_ERR(wblock)) {
+			retval = PTR_ERR(wblock);
+			wmi_free_devices();
+			break;
 		}
 
-		wblock->gblock = gblock[i];
-		wblock->handle = handle;
 		if (debug_event) {
 			wblock->handler = wmi_notify_debug;
 			wmi_method_enable(wblock, 1);
 		}
-		list_add_tail(&wblock->list, &wmi_block_list);
 	}
 
+	retval = 0;
+
 out_free_pointer:
 	kfree(out.pointer);
 
-	if (ACPI_FAILURE(status))
-		free_wmi_blocks();
-
-	return status;
+	return retval;
 }
 
 /*
@@ -961,6 +917,7 @@ static int acpi_wmi_remove(struct acpi_device *device, int type)
 {
 	acpi_remove_address_space_handler(device->handle,
 				ACPI_ADR_SPACE_EC, &acpi_wmi_ec_space_handler);
+	wmi_free_devices();
 
 	return 0;
 }
@@ -968,7 +925,7 @@ static int acpi_wmi_remove(struct acpi_device *device, int type)
 static int acpi_wmi_add(struct acpi_device *device)
 {
 	acpi_status status;
-	int result = 0;
+	int error;
 
 	status = acpi_install_address_space_handler(device->handle,
 						    ACPI_ADR_SPACE_EC,
@@ -979,47 +936,44 @@ static int acpi_wmi_add(struct acpi_device *device)
 		return -ENODEV;
 	}
 
-	status = parse_wdg(device->handle);
-	if (ACPI_FAILURE(status)) {
+	error = parse_wdg(device->handle);
+	if (error) {
 		acpi_remove_address_space_handler(device->handle,
 						  ACPI_ADR_SPACE_EC,
 						  &acpi_wmi_ec_space_handler);
 		pr_err("Failed to parse WDG method\n");
-		return -ENODEV;
+		return error;
 	}
 
-	return result;
+	return 0;
 }
 
 static int __init acpi_wmi_init(void)
 {
-	int result;
+	int error;
 
 	if (acpi_disabled)
 		return -ENODEV;
 
-	result = acpi_bus_register_driver(&acpi_wmi_driver);
-	if (result < 0) {
-		pr_err("Error loading mapper\n");
-		return -ENODEV;
-	}
+	error = class_register(&wmi_class);
+	if (error)
+		return error;
 
-	result = wmi_class_init();
-	if (result) {
-		acpi_bus_unregister_driver(&acpi_wmi_driver);
-		return result;
+	error = acpi_bus_register_driver(&acpi_wmi_driver);
+	if (error) {
+		pr_err("Error loading mapper\n");
+		class_unregister(&wmi_class);
+		return error;
 	}
 
 	pr_info("Mapper loaded\n");
-
 	return 0;
 }
 
 static void __exit acpi_wmi_exit(void)
 {
-	wmi_class_exit();
 	acpi_bus_unregister_driver(&acpi_wmi_driver);
-	free_wmi_blocks();
+	class_unregister(&wmi_class);
 
 	pr_info("Mapper unloaded\n");
 }
