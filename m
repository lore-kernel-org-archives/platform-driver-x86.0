From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] acer-wmi: fix memory leaks in WMID_set_capabilities and
	get_wmid_devices
Date: Tue, 06 Jul 2010 10:55:36 +0800
Message-ID: <1278384936.12801.17.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:36057 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752699Ab0GFCz3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 5 Jul 2010 22:55:29 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Thomas Renninger <trenn@suse.de>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, platform-driver-x86@vger.kernel.org

When acpi_evaluate_object() is passed ACPI_ALLOCATE_BUFFER,
the caller must kfree the returned buffer if AE_OK is returned.

The callers of wmi_query_block() pass ACPI_ALLOCATE_BUFFER,
and thus must check its return value before accessing
or kfree() on the buffer.

This patch adds a missing kfree(out.pointer) before exit
WMID_set_capabilities() and get_wmid_devices().

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/acer-wmi.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1ea6c43..fe644c6 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -772,6 +772,7 @@ static acpi_status WMID_set_capabilities(void)
 		obj->buffer.length == sizeof(u32)) {
 		devices = *((u32 *) obj->buffer.pointer);
 	} else {
+		kfree(out.pointer);
 		return AE_ERROR;
 	}
 
@@ -788,6 +789,7 @@ static acpi_status WMID_set_capabilities(void)
 	if (!(devices & 0x20))
 		max_brightness = 0x9;
 
+	kfree(out.pointer);
 	return status;
 }
 
@@ -1095,6 +1097,7 @@ static u32 get_wmid_devices(void)
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	union acpi_object *obj;
 	acpi_status status;
+	u32 devices = 0;
 
 	status = wmi_query_block(WMID_GUID2, 1, &out);
 	if (ACPI_FAILURE(status))
@@ -1103,10 +1106,11 @@ static u32 get_wmid_devices(void)
 	obj = (union acpi_object *) out.pointer;
 	if (obj && obj->type == ACPI_TYPE_BUFFER &&
 		obj->buffer.length == sizeof(u32)) {
-		return *((u32 *) obj->buffer.pointer);
-	} else {
-		return 0;
+		devices = *((u32 *) obj->buffer.pointer);
 	}
+
+	kfree(out.pointer);
+	return devices;
 }
 
 /*
-- 
1.5.4.3
