From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] wmi: fix a memory leak in wmi_notify_debug
Date: Mon, 28 Jun 2010 09:30:45 +0800
Message-ID: <1277688645.22992.2.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:34732 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751885Ab0F1B2d (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Jun 2010 21:28:33 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Thomas Renninger <trenn@suse.de>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org

When acpi_evaluate_object() is passed ACPI_ALLOCATE_BUFFER,
the caller must kfree the returned buffer if AE_OK is returned.

The callers of wmi_get_event_data() pass ACPI_ALLOCATE_BUFFER,
and thus must check its return value before accessing
or kfree() on the buffer.

This patch adds return value checking for wmi_get_event_data()
and adds a missing kfree(obj) in the end of wmi_notify_debug

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/wmi.c |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index e4eaa14..5bb0ae1 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -518,8 +518,13 @@ static void wmi_notify_debug(u32 value, void *context)
 {
 	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
+	acpi_status status;
 
-	wmi_get_event_data(value, &response);
+	status = wmi_get_event_data(value, &response);
+	if (status != AE_OK) {
+		printk(KERN_INFO "wmi: bad event status 0x%x\n", status);
+		return;
+	}
 
 	obj = (union acpi_object *)response.pointer;
 
@@ -543,6 +548,7 @@ static void wmi_notify_debug(u32 value, void *context)
 	default:
 		printk("object type 0x%X\n", obj->type);
 	}
+	kfree(obj);
 }
 
 /**
-- 
1.5.4.3
