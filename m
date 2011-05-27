From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: support integer return type from WMI methods
Date: Fri, 27 May 2011 14:52:14 +0800
Message-ID: <1306479134-7936-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:62074 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751537Ab1E0Gxw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 May 2011 02:53:52 -0400
Received: by vws1 with SMTP id 1so1133249vws.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 May 2011 23:53:51 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Acer WMID_GUID1/2 method's return value was declared to integer
type on Gateway notebook.
So, add this patch for support integer return type.

Reference: bko#33032
	https://bugzilla.kernel.org/show_bug.cgi?id=33032

Tested on Gateway NV5909H laptop

Tested-by: Filipus Klutiero <chealer@gmail.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/acer-wmi.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 64b7e20..36e6ab4 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -754,6 +754,8 @@ WMI_execute_u32(u32 method_id, u32 in, u32 *out)
 		(obj->buffer.length == sizeof(u32) ||
 		obj->buffer.length == sizeof(u64))) {
 		tmp = *((u32 *) obj->buffer.pointer);
+	} else if (obj->type == ACPI_TYPE_INTEGER) {
+		tmp = (u32) obj->integer.value;
 	} else {
 		tmp = 0;
 	}
@@ -884,6 +886,8 @@ static acpi_status WMID_set_capabilities(void)
 		(obj->buffer.length == sizeof(u32) ||
 		obj->buffer.length == sizeof(u64))) {
 		devices = *((u32 *) obj->buffer.pointer);
+	} else if (obj->type == ACPI_TYPE_INTEGER) {
+		devices = (u32) obj->integer.value;
 	} else {
 		kfree(out.pointer);
 		return AE_ERROR;
@@ -1589,6 +1593,8 @@ static u32 get_wmid_devices(void)
 		(obj->buffer.length == sizeof(u32) ||
 		obj->buffer.length == sizeof(u64))) {
 		devices = *((u32 *) obj->buffer.pointer);
+	} else if (obj->type == ACPI_TYPE_INTEGER) {
+		devices = (u32) obj->integer.value;
 	}
 
 	kfree(out.pointer);
-- 
1.6.0.2
