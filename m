From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 06/10] WMI: simplify handling of returned WMI blocks in
	parse_wdg()
Date: Thu, 26 Aug 2010 00:15:09 -0700
Message-ID: <20100826071509.7976.8827.stgit@localhost.localdomain>
References: <20100826071442.7976.93972.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:58101 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752856Ab0HZHPM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 03:15:12 -0400
Received: by mail-pv0-f174.google.com with SMTP id 2so528876pvg.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2010 00:15:12 -0700 (PDT)
In-Reply-To: <20100826071442.7976.93972.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, platform-driver-x86@vger.kernel.org

There is no reason why we allocate memory and copy data into an
intermediate buffer, it is not like we are working with data coming
from userspace.

Signed-off-by: Dmitry Torokhov <dtor@mail.ru>
---

 drivers/platform/x86/wmi.c |   15 ++++-----------
 1 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 4032fa4..e9064fb 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -487,7 +487,7 @@ const struct acpi_buffer *in)
 }
 EXPORT_SYMBOL_GPL(wmi_set_block);
 
-static void wmi_dump_wdg(struct guid_block *g)
+static void wmi_dump_wdg(const struct guid_block *g)
 {
 	char guid_string[37];
 
@@ -824,7 +824,7 @@ static acpi_status parse_wdg(acpi_handle handle)
 {
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	union acpi_object *obj;
-	struct guid_block *gblock;
+	const struct guid_block *gblock;
 	struct wmi_block *wblock;
 	char guid_string[37];
 	acpi_status status;
@@ -844,14 +844,9 @@ static acpi_status parse_wdg(acpi_handle handle)
 		goto out_free_pointer;
 	}
 
+	gblock = (const struct guid_block *)obj->buffer.pointer;
 	total = obj->buffer.length / sizeof(struct guid_block);
 
-	gblock = kmemdup(obj->buffer.pointer, obj->buffer.length, GFP_KERNEL);
-	if (!gblock) {
-		status = AE_NO_MEMORY;
-		goto out_free_pointer;
-	}
-
 	for (i = 0; i < total; i++) {
 		/*
 		  Some WMI devices, like those for nVidia hooks, have a
@@ -872,7 +867,7 @@ static acpi_status parse_wdg(acpi_handle handle)
 		wblock = kzalloc(sizeof(struct wmi_block), GFP_KERNEL);
 		if (!wblock) {
 			status = AE_NO_MEMORY;
-			goto out_free_gblock;
+			goto out_free_pointer;
 		}
 
 		wblock->gblock = gblock[i];
@@ -884,8 +879,6 @@ static acpi_status parse_wdg(acpi_handle handle)
 		list_add_tail(&wblock->list, &wmi_blocks.list);
 	}
 
-out_free_gblock:
-	kfree(gblock);
 out_free_pointer:
 	kfree(out.pointer);
 
