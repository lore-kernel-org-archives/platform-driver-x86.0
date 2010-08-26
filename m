From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 08/10] WMI: use pr_err() and friends
Date: Thu, 26 Aug 2010 00:15:19 -0700
Message-ID: <20100826071519.7976.45146.stgit@localhost.localdomain>
References: <20100826071442.7976.93972.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:60482 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752959Ab0HZHPX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 03:15:23 -0400
Received: by mail-pz0-f46.google.com with SMTP id 9so501410pzk.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2010 00:15:23 -0700 (PDT)
In-Reply-To: <20100826071442.7976.93972.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, platform-driver-x86@vger.kernel.org

This makes source more concise and easier to read.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/wmi.c |   64 ++++++++++++++++++++------------------------
 1 files changed, 29 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 7b68dce..b4e5bea 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -27,6 +27,8 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -44,8 +46,6 @@ MODULE_LICENSE("GPL");
 
 #define ACPI_WMI_CLASS "wmi"
 
-#define PREFIX "ACPI: WMI: "
-
 static DEFINE_MUTEX(wmi_data_lock);
 static LIST_HEAD(wmi_block_list);
 
@@ -492,25 +492,24 @@ static void wmi_dump_wdg(const struct guid_block *g)
 	char guid_string[37];
 
 	wmi_gtoa(g->guid, guid_string);
-	printk(KERN_INFO PREFIX "%s:\n", guid_string);
-	printk(KERN_INFO PREFIX "\tobject_id: %c%c\n",
-	       g->object_id[0], g->object_id[1]);
-	printk(KERN_INFO PREFIX "\tnotify_id: %02X\n", g->notify_id);
-	printk(KERN_INFO PREFIX "\treserved: %02X\n", g->reserved);
-	printk(KERN_INFO PREFIX "\tinstance_count: %d\n", g->instance_count);
-	printk(KERN_INFO PREFIX "\tflags: %#x", g->flags);
+
+	pr_info("%s:\n", guid_string);
+	pr_info("\tobject_id: %c%c\n", g->object_id[0], g->object_id[1]);
+	pr_info("\tnotify_id: %02X\n", g->notify_id);
+	pr_info("\treserved: %02X\n", g->reserved);
+	pr_info("\tinstance_count: %d\n", g->instance_count);
+	pr_info("\tflags: %#x ", g->flags);
 	if (g->flags) {
-		printk(" ");
 		if (g->flags & ACPI_WMI_EXPENSIVE)
-			printk("ACPI_WMI_EXPENSIVE ");
+			pr_cont("ACPI_WMI_EXPENSIVE ");
 		if (g->flags & ACPI_WMI_METHOD)
-			printk("ACPI_WMI_METHOD ");
+			pr_cont("ACPI_WMI_METHOD ");
 		if (g->flags & ACPI_WMI_STRING)
-			printk("ACPI_WMI_STRING ");
+			pr_cont("ACPI_WMI_STRING ");
 		if (g->flags & ACPI_WMI_EVENT)
-			printk("ACPI_WMI_EVENT ");
+			pr_cont("ACPI_WMI_EVENT ");
 	}
-	printk("\n");
+	pr_cont("\n");
 
 }
 
@@ -522,7 +521,7 @@ static void wmi_notify_debug(u32 value, void *context)
 
 	status = wmi_get_event_data(value, &response);
 	if (status != AE_OK) {
-		printk(KERN_INFO "wmi: bad event status 0x%x\n", status);
+		pr_info("bad event status 0x%x\n", status);
 		return;
 	}
 
@@ -531,22 +530,22 @@ static void wmi_notify_debug(u32 value, void *context)
 	if (!obj)
 		return;
 
-	printk(KERN_INFO PREFIX "DEBUG Event ");
+	pr_info("DEBUG Event ");
 	switch(obj->type) {
 	case ACPI_TYPE_BUFFER:
-		printk("BUFFER_TYPE - length %d\n", obj->buffer.length);
+		pr_cont("BUFFER_TYPE - length %d\n", obj->buffer.length);
 		break;
 	case ACPI_TYPE_STRING:
-		printk("STRING_TYPE - %s\n", obj->string.pointer);
+		pr_cont("STRING_TYPE - %s\n", obj->string.pointer);
 		break;
 	case ACPI_TYPE_INTEGER:
-		printk("INTEGER_TYPE - %llu\n", obj->integer.value);
+		pr_cont("INTEGER_TYPE - %llu\n", obj->integer.value);
 		break;
 	case ACPI_TYPE_PACKAGE:
-		printk("PACKAGE_TYPE - %d elements\n", obj->package.count);
+		pr_cont("PACKAGE_TYPE - %d elements\n", obj->package.count);
 		break;
 	default:
-		printk("object type 0x%X\n", obj->type);
+		pr_cont("object type 0x%X\n", obj->type);
 	}
 	kfree(obj);
 }
@@ -857,8 +856,7 @@ static acpi_status parse_wdg(acpi_handle handle)
 		*/
 		if (guid_already_parsed(gblock[i].guid) == true) {
 			wmi_gtoa(gblock[i].guid, guid_string);
-			printk(KERN_INFO PREFIX "Skipping duplicate GUID %s\n",
-				guid_string);
+			pr_info("Skipping duplicate GUID %s\n", guid_string);
 			continue;
 		}
 		if (debug_dump_wdg)
@@ -949,8 +947,7 @@ static void acpi_wmi_notify(struct acpi_device *device, u32 event)
 				wblock->handler(event, wblock->handler_data);
 			if (debug_event) {
 				wmi_gtoa(wblock->gblock.guid, guid_string);
-				printk(KERN_INFO PREFIX "DEBUG Event GUID:"
-				       " %s\n", guid_string);
+				pr_info("DEBUG Event GUID: %s\n", guid_string);
 			}
 
 			acpi_bus_generate_netlink_event(
@@ -979,7 +976,7 @@ static int acpi_wmi_add(struct acpi_device *device)
 						    &acpi_wmi_ec_space_handler,
 						    NULL, NULL);
 	if (ACPI_FAILURE(status)) {
-		printk(KERN_ERR PREFIX "Error installing EC region handler\n");
+		pr_err("Error installing EC region handler\n");
 		return -ENODEV;
 	}
 
@@ -988,7 +985,7 @@ static int acpi_wmi_add(struct acpi_device *device)
 		acpi_remove_address_space_handler(device->handle,
 						  ACPI_ADR_SPACE_EC,
 						  &acpi_wmi_ec_space_handler);
-		printk(KERN_ERR PREFIX "Failed to parse WDG method\n");
+		pr_err("Failed to parse WDG method\n");
 		return -ENODEV;
 	}
 
@@ -1003,9 +1000,8 @@ static int __init acpi_wmi_init(void)
 		return -ENODEV;
 
 	result = acpi_bus_register_driver(&acpi_wmi_driver);
-
 	if (result < 0) {
-		printk(KERN_INFO PREFIX "Error loading mapper\n");
+		pr_err("Error loading mapper\n");
 		return -ENODEV;
 	}
 
@@ -1015,20 +1011,18 @@ static int __init acpi_wmi_init(void)
 		return result;
 	}
 
-	printk(KERN_INFO PREFIX "Mapper loaded\n");
+	pr_info("Mapper loaded\n");
 
-	return result;
+	return 0;
 }
 
 static void __exit acpi_wmi_exit(void)
 {
 	wmi_class_exit();
-
 	acpi_bus_unregister_driver(&acpi_wmi_driver);
-
 	free_wmi_blocks();
 
-	printk(KERN_INFO PREFIX "Mapper unloaded\n");
+	pr_info("Mapper unloaded\n");
 }
 
 subsys_initcall(acpi_wmi_init);
