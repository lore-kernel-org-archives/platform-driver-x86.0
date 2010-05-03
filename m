From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/2] X86 platform wmi: Also log GUID string when an event happens and debug is set
Date: Mon,  3 May 2010 11:10:08 +0200
Message-ID: <1272877808-13468-2-git-send-email-trenn@suse.de>
References: <1272877808-13468-1-git-send-email-trenn@suse.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47747 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752776Ab0ECJKW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 May 2010 05:10:22 -0400
In-Reply-To: <1272877808-13468-1-git-send-email-trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, Thomas Renninger <trenn@suse.de>

Output in log with debug=1:
ACPI: WMI: DEBUG Event INTEGER_TYPE - 65535
ACPI: WMI: DEBUG Event GUID: CC1A61AC-4256-41A3-B9E0-05A445ADE2F5

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: platform-driver-x86@vger.kernel.org
CC: mjg59@srcf.ucam.org
CC: corentin.chary@gmail.com
---
 drivers/platform/x86/wmi.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index dbd7281..73ccce2 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -882,6 +882,7 @@ static void acpi_wmi_notify(struct acpi_device *device, u32 event)
 	struct guid_block *block;
 	struct wmi_block *wblock;
 	struct list_head *p;
+	char guid_string[37];
 
 	list_for_each(p, &wmi_blocks.list) {
 		wblock = list_entry(p, struct wmi_block, list);
@@ -891,6 +892,11 @@ static void acpi_wmi_notify(struct acpi_device *device, u32 event)
 			(block->notify_id == event)) {
 			if (wblock->handler)
 				wblock->handler(event, wblock->handler_data);
+			if (debug) {
+				wmi_gtoa(wblock->gblock.guid, guid_string);
+				printk(KERN_INFO PREFIX "DEBUG Event GUID:"
+				       " %s\n", guid_string);
+			}
 
 			acpi_bus_generate_netlink_event(
 				device->pnp.device_class, dev_name(&device->dev),
-- 
1.6.3

