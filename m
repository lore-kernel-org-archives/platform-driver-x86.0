From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 07/10] WMI: use separate list head for storing wmi blocks
Date: Thu, 26 Aug 2010 00:15:14 -0700
Message-ID: <20100826071514.7976.77547.stgit@localhost.localdomain>
References: <20100826071442.7976.93972.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:56836 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752946Ab0HZHPS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 03:15:18 -0400
Received: by pwi7 with SMTP id 7so599247pwi.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2010 00:15:17 -0700 (PDT)
In-Reply-To: <20100826071442.7976.93972.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, platform-driver-x86@vger.kernel.org

Do not abuse wmi_block structure to hold the head of list
of blocks, use separate list_head for that.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/wmi.c |   20 +++++++++-----------
 1 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index e9064fb..7b68dce 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -47,6 +47,7 @@ MODULE_LICENSE("GPL");
 #define PREFIX "ACPI: WMI: "
 
 static DEFINE_MUTEX(wmi_data_lock);
+static LIST_HEAD(wmi_block_list);
 
 struct guid_block {
 	char guid[16];
@@ -70,7 +71,6 @@ struct wmi_block {
 	struct device *dev;
 };
 
-static struct wmi_block wmi_blocks;
 
 /*
  * If the GUID data block is marked as expensive, we must enable and
@@ -246,7 +246,7 @@ static bool find_guid(const char *guid_string, struct wmi_block **out)
 	wmi_parse_guid(guid_string, tmp);
 	wmi_swap_bytes(tmp, guid_input);
 
-	list_for_each(p, &wmi_blocks.list) {
+	list_for_each(p, &wmi_block_list) {
 		wblock = list_entry(p, struct wmi_block, list);
 		block = &wblock->gblock;
 
@@ -633,7 +633,7 @@ acpi_status wmi_get_event_data(u32 event, struct acpi_buffer *out)
 	params[0].type = ACPI_TYPE_INTEGER;
 	params[0].integer.value = event;
 
-	list_for_each(p, &wmi_blocks.list) {
+	list_for_each(p, &wmi_block_list) {
 		wblock = list_entry(p, struct wmi_block, list);
 		gblock = &wblock->gblock;
 
@@ -721,7 +721,7 @@ static int wmi_create_devs(void)
 	struct device *guid_dev;
 
 	/* Create devices for all the GUIDs */
-	list_for_each(p, &wmi_blocks.list) {
+	list_for_each(p, &wmi_block_list) {
 		wblock = list_entry(p, struct wmi_block, list);
 
 		guid_dev = kzalloc(sizeof(struct device), GFP_KERNEL);
@@ -758,7 +758,7 @@ static void wmi_remove_devs(void)
 	struct device *guid_dev;
 
 	/* Delete devices for all the GUIDs */
-	list_for_each(p, &wmi_blocks.list) {
+	list_for_each(p, &wmi_block_list) {
 		wblock = list_entry(p, struct wmi_block, list);
 
 		guid_dev = wblock->dev;
@@ -797,7 +797,7 @@ static bool guid_already_parsed(const char *guid_string)
 	struct wmi_block *wblock;
 	struct list_head *p;
 
-	list_for_each(p, &wmi_blocks.list) {
+	list_for_each(p, &wmi_block_list) {
 		wblock = list_entry(p, struct wmi_block, list);
 		gblock = &wblock->gblock;
 
@@ -811,7 +811,7 @@ static void free_wmi_blocks(void)
 {
 	struct wmi_block *wblock, *next;
 
-	list_for_each_entry_safe(wblock, next, &wmi_blocks.list, list) {
+	list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
 		list_del(&wblock->list);
 		kfree(wblock);
 	}
@@ -876,7 +876,7 @@ static acpi_status parse_wdg(acpi_handle handle)
 			wblock->handler = wmi_notify_debug;
 			wmi_method_enable(wblock, 1);
 		}
-		list_add_tail(&wblock->list, &wmi_blocks.list);
+		list_add_tail(&wblock->list, &wmi_block_list);
 	}
 
 out_free_pointer:
@@ -939,7 +939,7 @@ static void acpi_wmi_notify(struct acpi_device *device, u32 event)
 	struct list_head *p;
 	char guid_string[37];
 
-	list_for_each(p, &wmi_blocks.list) {
+	list_for_each(p, &wmi_block_list) {
 		wblock = list_entry(p, struct wmi_block, list);
 		block = &wblock->gblock;
 
@@ -999,8 +999,6 @@ static int __init acpi_wmi_init(void)
 {
 	int result;
 
-	INIT_LIST_HEAD(&wmi_blocks.list);
-
 	if (acpi_disabled)
 		return -ENODEV;
 
