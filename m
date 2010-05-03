From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/3] X86 platform wmi: Introduce debug param to log all WMI events
Date: Mon,  3 May 2010 15:30:15 +0200
Message-ID: <1272893417-3481-1-git-send-email-trenn@suse.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56343 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759385Ab0ECNa1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 May 2010 09:30:27 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, Thomas Renninger <trenn@suse.de>

To give people easily an idea what could be WMI driven on their system.
Introduces:
wmi.debug=[01]

Tested on an acer:
ACPI: WMI: DEBUG Event INTEGER_TYPE - 65535

Situation where a driver registers for specific event and debug
handler gets overridden and set again if the registering driver gets
unloaded again is untested, but should work.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: platform-driver-x86@vger.kernel.org
CC: mjg59@srcf.ucam.org
CC: corentin.chary@gmail.com
---
 drivers/platform/x86/wmi.c |   58 +++++++++++++++++++++++++++++++++++++------
 1 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 39ec5b6..e4e4a48 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -81,6 +81,11 @@ static struct wmi_block wmi_blocks;
 #define ACPI_WMI_STRING      0x4	/* GUID takes & returns a string */
 #define ACPI_WMI_EVENT       0x8	/* GUID is an event */
 
+static int debug_event;
+module_param(debug_event, bool, 0444);
+MODULE_PARM_DESC(debug_event,
+		 "Log WMI Events [0/1]");
+
 static int acpi_wmi_remove(struct acpi_device *device, int type);
 static int acpi_wmi_add(struct acpi_device *device);
 static void acpi_wmi_notify(struct acpi_device *device, u32 event);
@@ -477,6 +482,37 @@ const struct acpi_buffer *in)
 }
 EXPORT_SYMBOL_GPL(wmi_set_block);
 
+static void wmi_notify_debug(u32 value, void *context)
+{
+	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+
+	wmi_get_event_data(value, &response);
+
+	obj = (union acpi_object *)response.pointer;
+
+	if (!obj)
+		return;
+
+	printk(KERN_INFO PREFIX "DEBUG Event ");
+	switch(obj->type) {
+	case ACPI_TYPE_BUFFER:
+		printk("BUFFER_TYPE - length %d\n", obj->buffer.length);
+		break;
+	case ACPI_TYPE_STRING:
+		printk("STRING_TYPE - %s\n", obj->string.pointer);
+		break;
+	case ACPI_TYPE_INTEGER:
+		printk("INTEGER_TYPE - %llu\n", obj->integer.value);
+		break;
+	case ACPI_TYPE_PACKAGE:
+		printk("PACKAGE_TYPE - %d elements\n", obj->package.count);
+		break;
+	default:
+		printk("object type 0x%X\n", obj->type);
+	}
+}
+
 /**
  * wmi_install_notify_handler - Register handler for WMI events
  * @handler: Function to handle notifications
@@ -496,7 +532,7 @@ wmi_notify_handler handler, void *data)
 	if (!find_guid(guid, &block))
 		return AE_NOT_EXIST;
 
-	if (block->handler)
+	if (block->handler && block->handler != wmi_notify_debug)
 		return AE_ALREADY_ACQUIRED;
 
 	block->handler = handler;
@@ -516,7 +552,7 @@ EXPORT_SYMBOL_GPL(wmi_install_notify_handler);
 acpi_status wmi_remove_notify_handler(const char *guid)
 {
 	struct wmi_block *block;
-	acpi_status status;
+	acpi_status status = AE_OK;
 
 	if (!guid)
 		return AE_BAD_PARAMETER;
@@ -524,14 +560,16 @@ acpi_status wmi_remove_notify_handler(const char *guid)
 	if (!find_guid(guid, &block))
 		return AE_NOT_EXIST;
 
-	if (!block->handler)
+	if (!block->handler || block->handler == wmi_notify_debug)
 		return AE_NULL_ENTRY;
 
-	status = wmi_method_enable(block, 0);
-
-	block->handler = NULL;
-	block->handler_data = NULL;
-
+	if (debug_event) {
+		block->handler = wmi_notify_debug;
+	} else {
+		status = wmi_method_enable(block, 0);
+		block->handler = NULL;
+		block->handler_data = NULL;
+	}
 	return status;
 }
 EXPORT_SYMBOL_GPL(wmi_remove_notify_handler);
@@ -782,6 +820,10 @@ static __init acpi_status parse_wdg(acpi_handle handle)
 
 		wblock->gblock = gblock[i];
 		wblock->handle = handle;
+		if (debug_event) {
+			wblock->handler = wmi_notify_debug;
+			status = wmi_method_enable(wblock, 1);
+		}
 		list_add_tail(&wblock->list, &wmi_blocks.list);
 	}
 
-- 
1.6.3

