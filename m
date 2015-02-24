From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] x86: wmi: Remove private %pUL implementation
Date: Tue, 24 Feb 2015 15:15:30 +0100
Message-ID: <1424787330-26770-1-git-send-email-linux@rasmusvillemoes.dk>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:38491 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752942AbbBXOPu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Feb 2015 09:15:50 -0500
Received: by lamq1 with SMTP id q1so25910974lam.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2015 06:15:48 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

The work performed by wmi_gtoa is equivalent to simply sprintf(out,
"%pUL", in), so one could replace its body by this. However, most
users feed the result directly as a %s argument to some other function
which also understands the %p extensions (they all ultimately use
vsnprintf), so we can eliminate some stack buffers and quite a bit of
code by just using %pUL directly.

In wmi_dev_uevent I'm not sure whether there's room for a
nul-terminator in env->buf, so I've just replaced wmi_gtoa with the
equivalent sprintf call.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/platform/x86/wmi.c | 51 ++++++----------------------------------------
 1 file changed, 6 insertions(+), 45 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 737e56d46f61..ebc92e964771 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -195,34 +195,6 @@ static bool wmi_parse_guid(const u8 *src, u8 *dest)
 	return true;
 }
 
-/*
- * Convert a raw GUID to the ACII string representation
- */
-static int wmi_gtoa(const char *in, char *out)
-{
-	int i;
-
-	for (i = 3; i >= 0; i--)
-		out += sprintf(out, "%02X", in[i] & 0xFF);
-
-	out += sprintf(out, "-");
-	out += sprintf(out, "%02X", in[5] & 0xFF);
-	out += sprintf(out, "%02X", in[4] & 0xFF);
-	out += sprintf(out, "-");
-	out += sprintf(out, "%02X", in[7] & 0xFF);
-	out += sprintf(out, "%02X", in[6] & 0xFF);
-	out += sprintf(out, "-");
-	out += sprintf(out, "%02X", in[8] & 0xFF);
-	out += sprintf(out, "%02X", in[9] & 0xFF);
-	out += sprintf(out, "-");
-
-	for (i = 10; i <= 15; i++)
-		out += sprintf(out, "%02X", in[i] & 0xFF);
-
-	*out = '\0';
-	return 0;
-}
-
 static bool find_guid(const char *guid_string, struct wmi_block **out)
 {
 	char tmp[16], guid_input[16];
@@ -458,11 +430,7 @@ EXPORT_SYMBOL_GPL(wmi_set_block);
 
 static void wmi_dump_wdg(const struct guid_block *g)
 {
-	char guid_string[37];
-
-	wmi_gtoa(g->guid, guid_string);
-
-	pr_info("%s:\n", guid_string);
+	pr_info("%pUL:\n", g->guid);
 	pr_info("\tobject_id: %c%c\n", g->object_id[0], g->object_id[1]);
 	pr_info("\tnotify_id: %02X\n", g->notify_id);
 	pr_info("\treserved: %02X\n", g->reserved);
@@ -662,7 +630,6 @@ EXPORT_SYMBOL_GPL(wmi_has_guid);
 static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
-	char guid_string[37];
 	struct wmi_block *wblock;
 
 	wblock = dev_get_drvdata(dev);
@@ -671,9 +638,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 		return strlen(buf);
 	}
 
-	wmi_gtoa(wblock->gblock.guid, guid_string);
-
-	return sprintf(buf, "wmi:%s\n", guid_string);
+	return sprintf(buf, "wmi:%pUL\n", wblock->gblock.guid);
 }
 static DEVICE_ATTR_RO(modalias);
 
@@ -696,7 +661,7 @@ static int wmi_dev_uevent(struct device *dev, struct kobj_uevent_env *env)
 	if (!wblock)
 		return -ENOMEM;
 
-	wmi_gtoa(wblock->gblock.guid, guid_string);
+	sprintf(guid_string, "%pUL", wblock->gblock.guid);
 
 	strcpy(&env->buf[env->buflen - 1], "wmi:");
 	memcpy(&env->buf[env->buflen - 1 + 4], guid_string, 36);
@@ -722,12 +687,9 @@ static struct class wmi_class = {
 static int wmi_create_device(const struct guid_block *gblock,
 			     struct wmi_block *wblock, acpi_handle handle)
 {
-	char guid_string[37];
-
 	wblock->dev.class = &wmi_class;
 
-	wmi_gtoa(gblock->guid, guid_string);
-	dev_set_name(&wblock->dev, "%s", guid_string);
+	dev_set_name(&wblock->dev, "%pUL", gblock->guid);
 
 	dev_set_drvdata(&wblock->dev, wblock);
 
@@ -878,7 +840,6 @@ static void acpi_wmi_notify(struct acpi_device *device, u32 event)
 	struct guid_block *block;
 	struct wmi_block *wblock;
 	struct list_head *p;
-	char guid_string[37];
 
 	list_for_each(p, &wmi_block_list) {
 		wblock = list_entry(p, struct wmi_block, list);
@@ -889,8 +850,8 @@ static void acpi_wmi_notify(struct acpi_device *device, u32 event)
 			if (wblock->handler)
 				wblock->handler(event, wblock->handler_data);
 			if (debug_event) {
-				wmi_gtoa(wblock->gblock.guid, guid_string);
-				pr_info("DEBUG Event GUID: %s\n", guid_string);
+				pr_info("DEBUG Event GUID: %pUL\n",
+					wblock->gblock.guid);
 			}
 
 			acpi_bus_generate_netlink_event(
-- 
2.1.3
