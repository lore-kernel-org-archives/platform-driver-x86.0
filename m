From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] WMI: fix the incorrect wmi device may be chosen from BIOS's notification if multiple wmi devices exist in a system.
Date: Thu, 19 Jul 2012 09:43:21 +0800
Message-ID: <1342662201-29878-1-git-send-email-alex.hung@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:60567 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751956Ab2GSBn2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 18 Jul 2012 21:43:28 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: alex.hung@canonical.com, mjg@redhat.com, platform-driver-x86@vger.kernel.org

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/wmi.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index a134c26..efc920b 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -114,6 +114,8 @@ static struct acpi_driver acpi_wmi_driver = {
 	},
 };
 
+static struct acpi_device *wmi_device;
+
 /*
  * GUID parsing functions
  */
@@ -652,8 +654,9 @@ acpi_status wmi_get_event_data(u32 event, struct acpi_buffer *out)
 
 	list_for_each(p, &wmi_block_list) {
 		wblock = list_entry(p, struct wmi_block, list);
+		if (wmi_device != NULL && wmi_device->handle != wblock->handle)
+			continue;
 		gblock = &wblock->gblock;
-
 		if ((gblock->flags & ACPI_WMI_EVENT) &&
 			(gblock->notify_id == event))
 			return acpi_evaluate_object(wblock->handle, "_WED",
@@ -900,6 +903,10 @@ static void acpi_wmi_notify(struct acpi_device *device, u32 event)
 		wblock = list_entry(p, struct wmi_block, list);
 		block = &wblock->gblock;
 
+		if (device->handle != wblock->handle)
+			continue;
+		wmi_device = device;
+
 		if ((block->flags & ACPI_WMI_EVENT) &&
 			(block->notify_id == event)) {
 			if (wblock->handler)
-- 
1.7.9.5
