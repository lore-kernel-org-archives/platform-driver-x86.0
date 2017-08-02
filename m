From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] platform/x86: wmi: Switch to use new generic UUID API
Date: Wed,  2 Aug 2017 16:28:34 +0300
Message-ID: <20170802132834.8223-1-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:65364 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751910AbdHBN3J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Aug 2017 09:29:09 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There are new types and helpers that are supposed to be used in new code.

As a preparation to get rid of legacy types and API functions do
the conversion here.

While here, update Copyright to reflect this change along with previous
one for the topic.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/wmi.c | 56 ++++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index e32ba575e8d9..7b8fac7067dc 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -7,6 +7,8 @@
  *   Copyright (C) 2001,2002 Richard Russon <ldm@flatcap.org>
  *   Copyright (c) 2001-2007 Anton Altaparmakov
  *   Copyright (C) 2001,2002 Jakob Kemi <jakob.kemi@telia.com>
+ *  ...replaced by generic UUID API:
+ *   Copyright (C) 2016,2017 Intel Corporation.
  *
  *  WMI bus infrastructure by Andrew Lutomirski and Darren Hart:
  *    Copyright (C) 2015 Andrew Lutomirski
@@ -53,7 +55,7 @@ MODULE_LICENSE("GPL");
 static LIST_HEAD(wmi_block_list);
 
 struct guid_block {
-	char guid[16];
+	guid_t guid;
 	union {
 		char object_id[2];
 		struct {
@@ -121,19 +123,19 @@ static struct platform_driver acpi_wmi_driver = {
 
 static bool find_guid(const char *guid_string, struct wmi_block **out)
 {
-	uuid_le guid_input;
+	guid_t guid_input;
 	struct wmi_block *wblock;
 	struct guid_block *block;
 	struct list_head *p;
 
-	if (uuid_le_to_bin(guid_string, &guid_input))
+	if (guid_parse(guid_string, &guid_input))
 		return false;
 
 	list_for_each(p, &wmi_block_list) {
 		wblock = list_entry(p, struct wmi_block, list);
 		block = &wblock->gblock;
 
-		if (memcmp(block->guid, &guid_input, 16) == 0) {
+		if (guid_equal(&block->guid, &guid_input)) {
 			if (out)
 				*out = wblock;
 			return true;
@@ -420,7 +422,7 @@ EXPORT_SYMBOL_GPL(wmi_set_block);
 
 static void wmi_dump_wdg(const struct guid_block *g)
 {
-	pr_info("%pUL:\n", g->guid);
+	pr_info("%pUL:\n", &g->guid);
 	if (g->flags & ACPI_WMI_EVENT)
 		pr_info("\tnotify_id: 0x%02X\n", g->notify_id);
 	else
@@ -480,6 +482,7 @@ static void wmi_notify_debug(u32 value, void *context)
 
 /**
  * wmi_install_notify_handler - Register handler for WMI events
+ * @guid: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
  * @handler: Function to handle notifications
  * @data: Data to be returned to handler when event is fired
  *
@@ -490,20 +493,20 @@ wmi_notify_handler handler, void *data)
 {
 	struct wmi_block *block;
 	acpi_status status = AE_NOT_EXIST;
-	uuid_le guid_input;
+	guid_t guid_input;
 	struct list_head *p;
 
 	if (!guid || !handler)
 		return AE_BAD_PARAMETER;
 
-	if (uuid_le_to_bin(guid, &guid_input))
+	if (guid_parse(guid, &guid_input))
 		return AE_BAD_PARAMETER;
 
 	list_for_each(p, &wmi_block_list) {
 		acpi_status wmi_status;
 		block = list_entry(p, struct wmi_block, list);
 
-		if (memcmp(block->gblock.guid, &guid_input, 16) == 0) {
+		if (guid_equal(&block->gblock.guid, &guid_input)) {
 			if (block->handler &&
 			    block->handler != wmi_notify_debug)
 				return AE_ALREADY_ACQUIRED;
@@ -524,6 +527,7 @@ EXPORT_SYMBOL_GPL(wmi_install_notify_handler);
 
 /**
  * wmi_uninstall_notify_handler - Unregister handler for WMI events
+ * @guid: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
  *
  * Unregister handler for events sent to the ACPI-WMI mapper device.
  */
@@ -531,20 +535,20 @@ acpi_status wmi_remove_notify_handler(const char *guid)
 {
 	struct wmi_block *block;
 	acpi_status status = AE_NOT_EXIST;
-	uuid_le guid_input;
+	guid_t guid_input;
 	struct list_head *p;
 
 	if (!guid)
 		return AE_BAD_PARAMETER;
 
-	if (uuid_le_to_bin(guid, &guid_input))
+	if (guid_parse(guid, &guid_input))
 		return AE_BAD_PARAMETER;
 
 	list_for_each(p, &wmi_block_list) {
 		acpi_status wmi_status;
 		block = list_entry(p, struct wmi_block, list);
 
-		if (memcmp(block->gblock.guid, &guid_input, 16) == 0) {
+		if (guid_equal(&block->gblock.guid, &guid_input)) {
 			if (!block->handler ||
 			    block->handler == wmi_notify_debug)
 				return AE_NULL_ENTRY;
@@ -633,7 +637,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 {
 	struct wmi_block *wblock = dev_to_wblock(dev);
 
-	return sprintf(buf, "wmi:%pUL\n", wblock->gblock.guid);
+	return sprintf(buf, "wmi:%pUL\n", &wblock->gblock.guid);
 }
 static DEVICE_ATTR_RO(modalias);
 
@@ -642,7 +646,7 @@ static ssize_t guid_show(struct device *dev, struct device_attribute *attr,
 {
 	struct wmi_block *wblock = dev_to_wblock(dev);
 
-	return sprintf(buf, "%pUL\n", wblock->gblock.guid);
+	return sprintf(buf, "%pUL\n", &wblock->gblock.guid);
 }
 static DEVICE_ATTR_RO(guid);
 
@@ -725,10 +729,10 @@ static int wmi_dev_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	struct wmi_block *wblock = dev_to_wblock(dev);
 
-	if (add_uevent_var(env, "MODALIAS=wmi:%pUL", wblock->gblock.guid))
+	if (add_uevent_var(env, "MODALIAS=wmi:%pUL", &wblock->gblock.guid))
 		return -ENOMEM;
 
-	if (add_uevent_var(env, "WMI_GUID=%pUL", wblock->gblock.guid))
+	if (add_uevent_var(env, "WMI_GUID=%pUL", &wblock->gblock.guid))
 		return -ENOMEM;
 
 	return 0;
@@ -749,11 +753,11 @@ static int wmi_dev_match(struct device *dev, struct device_driver *driver)
 	const struct wmi_device_id *id = wmi_driver->id_table;
 
 	while (id->guid_string) {
-		uuid_le driver_guid;
+		guid_t driver_guid;
 
-		if (WARN_ON(uuid_le_to_bin(id->guid_string, &driver_guid)))
+		if (WARN_ON(guid_parse(id->guid_string, &driver_guid)))
 			continue;
-		if (!memcmp(&driver_guid, wblock->gblock.guid, 16))
+		if (guid_equal(&driver_guid, &wblock->gblock.guid))
 			return 1;
 
 		id++;
@@ -891,7 +895,7 @@ static int wmi_create_device(struct device *wmi_bus_dev,
 	wblock->dev.dev.bus = &wmi_bus_type;
 	wblock->dev.dev.parent = wmi_bus_dev;
 
-	dev_set_name(&wblock->dev.dev, "%pUL", gblock->guid);
+	dev_set_name(&wblock->dev.dev, "%pUL", &gblock->guid);
 
 	device_initialize(&wblock->dev.dev);
 
@@ -912,12 +916,12 @@ static void wmi_free_devices(struct acpi_device *device)
 }
 
 static bool guid_already_parsed(struct acpi_device *device,
-				const u8 *guid)
+				const guid_t *guid)
 {
 	struct wmi_block *wblock;
 
 	list_for_each_entry(wblock, &wmi_block_list, list) {
-		if (memcmp(wblock->gblock.guid, guid, 16) == 0) {
+		if (guid_equal(&wblock->gblock.guid, guid)) {
 			/*
 			 * Because we historically didn't track the relationship
 			 * between GUIDs and ACPI nodes, we don't know whether
@@ -972,7 +976,7 @@ static int parse_wdg(struct device *wmi_bus_dev, struct acpi_device *device)
 		 * case yet, so for now, we'll just ignore the duplicate
 		 * for device creation.
 		 */
-		if (guid_already_parsed(device, gblock[i].guid))
+		if (guid_already_parsed(device, &gblock[i].guid))
 			continue;
 
 		wblock = kzalloc(sizeof(struct wmi_block), GFP_KERNEL);
@@ -1009,7 +1013,7 @@ static int parse_wdg(struct device *wmi_bus_dev, struct acpi_device *device)
 		retval = device_add(&wblock->dev.dev);
 		if (retval) {
 			dev_err(wmi_bus_dev, "failed to register %pULL\n",
-				wblock->gblock.guid);
+				&wblock->gblock.guid);
 			if (debug_event)
 				wmi_method_enable(wblock, 0);
 			list_del(&wblock->list);
@@ -1124,10 +1128,8 @@ static void acpi_wmi_notify_handler(acpi_handle handle, u32 event,
 		wblock->handler(event, wblock->handler_data);
 	}
 
-	if (debug_event) {
-		pr_info("DEBUG Event GUID: %pUL\n",
-			wblock->gblock.guid);
-	}
+	if (debug_event)
+		pr_info("DEBUG Event GUID: %pUL\n", &wblock->gblock.guid);
 
 	acpi_bus_generate_netlink_event(
 		wblock->acpi_device->pnp.device_class,
-- 
2.13.2
