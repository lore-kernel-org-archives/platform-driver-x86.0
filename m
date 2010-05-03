From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 3/3] X86 platfrom wmi: Add debug facility to dump WMI data in a readable way
Date: Mon,  3 May 2010 15:30:17 +0200
Message-ID: <1272893417-3481-3-git-send-email-trenn@suse.de>
References: <1272893417-3481-1-git-send-email-trenn@suse.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56345 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759387Ab0ECNa1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 May 2010 09:30:27 -0400
In-Reply-To: <1272893417-3481-1-git-send-email-trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, Thomas Renninger <trenn@suse.de>

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: platform-driver-x86@vger.kernel.org
CC: mjg59@srcf.ucam.org
CC: corentin.chary@gmail.com
---
 drivers/platform/x86/wmi.c |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index d48bcdb..c1fa40d 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -86,6 +86,11 @@ module_param(debug_event, bool, 0444);
 MODULE_PARM_DESC(debug_event,
 		 "Log WMI Events [0/1]");
 
+static int debug_dump_wdg;
+module_param(debug_dump_wdg, bool, 0444);
+MODULE_PARM_DESC(debug_dump_wdg,
+		 "Dump available WMI interfaces [0/1]");
+
 static int acpi_wmi_remove(struct acpi_device *device, int type);
 static int acpi_wmi_add(struct acpi_device *device);
 static void acpi_wmi_notify(struct acpi_device *device, u32 event);
@@ -482,6 +487,33 @@ const struct acpi_buffer *in)
 }
 EXPORT_SYMBOL_GPL(wmi_set_block);
 
+static void wmi_dump_wdg(struct guid_block *g)
+{
+	char guid_string[37];
+
+	wmi_gtoa(g->guid, guid_string);
+	printk(KERN_INFO PREFIX "%s:\n", guid_string);
+	printk(KERN_INFO PREFIX "\tobject_id: %c%c\n",
+	       g->object_id[0], g->object_id[1]);
+	printk(KERN_INFO PREFIX "\tnotify_id: %02X\n", g->notify_id);
+	printk(KERN_INFO PREFIX "\treserved: %02X\n", g->reserved);
+	printk(KERN_INFO PREFIX "\tinstance_count: %d\n", g->instance_count);
+	printk(KERN_INFO PREFIX "\tflags: %#x", g->flags);
+	if (g->flags) {
+		printk(" ");
+		if (g->flags & ACPI_WMI_EXPENSIVE)
+			printk("ACPI_WMI_EXPENSIVE ");
+		if (g->flags & ACPI_WMI_METHOD)
+			printk("ACPI_WMI_METHOD ");
+		if (g->flags & ACPI_WMI_STRING)
+			printk("ACPI_WMI_STRING ");
+		if (g->flags & ACPI_WMI_EVENT)
+			printk("ACPI_WMI_EVENT ");
+	}
+	printk("\n");
+
+}
+
 static void wmi_notify_debug(u32 value, void *context)
 {
 	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -814,6 +846,9 @@ static __init acpi_status parse_wdg(acpi_handle handle)
 				guid_string);
 			continue;
 		}
+		if (debug_dump_wdg)
+			wmi_dump_wdg(&gblock[i]);
+
 		wblock = kzalloc(sizeof(struct wmi_block), GFP_KERNEL);
 		if (!wblock)
 			return AE_NO_MEMORY;
-- 
1.6.3

