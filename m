From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [RESEND][PATCH 3/5] acer-wmi: fix obj is NULL but dereferenced
Date: Fri, 14 Dec 2012 16:10:07 +0800
Message-ID: <1355472609-9957-3-git-send-email-jlee@suse.com>
References: <1355472609-9957-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:46368 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752643Ab2LNILf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 14 Dec 2012 03:11:35 -0500
Received: by mail-ie0-f174.google.com with SMTP id c11so5409105ieb.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Dec 2012 00:11:34 -0800 (PST)
In-Reply-To: <1355472609-9957-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Fengguang Wu run coccinelle and warns about:
  drivers/platform/x86/acer-wmi.c:1200:17-21: ERROR: obj is NULL but dereferenced.
  drivers/platform/x86/acer-wmi.c:891:17-21: ERROR: obj is NULL but dereferenced.
  drivers/platform/x86/acer-wmi.c:1953:17-21: ERROR: obj is NULL but dereferenced.

It causes by the code in patch 987dfbaa65b2c3568b85e29d2598da08a011ee09 doesn't check
obj variable should not be NULL. There have risk for dereference a NULL obj, so add
this patch to fix.

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |   46 +++++++++++++++++++++-----------------
 1 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 07d5f96..11fe00b 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -884,7 +884,7 @@ WMI_execute_u32(u32 method_id, u32 in, u32 *out)
 	struct acpi_buffer input = { (acpi_size) sizeof(u32), (void *)(&in) };
 	struct acpi_buffer result = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
-	u32 tmp;
+	u32 tmp = 0;
 	acpi_status status;
 
 	status = wmi_evaluate_method(WMID_GUID1, 1, method_id, &input, &result);
@@ -893,14 +893,14 @@ WMI_execute_u32(u32 method_id, u32 in, u32 *out)
 		return status;
 
 	obj = (union acpi_object *) result.pointer;
-	if (obj && obj->type == ACPI_TYPE_BUFFER &&
-		(obj->buffer.length == sizeof(u32) ||
-		obj->buffer.length == sizeof(u64))) {
-		tmp = *((u32 *) obj->buffer.pointer);
-	} else if (obj->type == ACPI_TYPE_INTEGER) {
-		tmp = (u32) obj->integer.value;
-	} else {
-		tmp = 0;
+	if (obj) {
+		if (obj->type == ACPI_TYPE_BUFFER &&
+			(obj->buffer.length == sizeof(u32) ||
+			obj->buffer.length == sizeof(u64))) {
+			tmp = *((u32 *) obj->buffer.pointer);
+		} else if (obj->type == ACPI_TYPE_INTEGER) {
+			tmp = (u32) obj->integer.value;
+		}
 	}
 
 	if (out)
@@ -1202,12 +1202,14 @@ static acpi_status WMID_set_capabilities(void)
 		return status;
 
 	obj = (union acpi_object *) out.pointer;
-	if (obj && obj->type == ACPI_TYPE_BUFFER &&
-		(obj->buffer.length == sizeof(u32) ||
-		obj->buffer.length == sizeof(u64))) {
-		devices = *((u32 *) obj->buffer.pointer);
-	} else if (obj->type == ACPI_TYPE_INTEGER) {
-		devices = (u32) obj->integer.value;
+	if (obj) {
+		if (obj->type == ACPI_TYPE_BUFFER &&
+			(obj->buffer.length == sizeof(u32) ||
+			obj->buffer.length == sizeof(u64))) {
+			devices = *((u32 *) obj->buffer.pointer);
+		} else if (obj->type == ACPI_TYPE_INTEGER) {
+			devices = (u32) obj->integer.value;
+		}
 	} else {
 		kfree(out.pointer);
 		return AE_ERROR;
@@ -1955,12 +1957,14 @@ static u32 get_wmid_devices(void)
 		return 0;
 
 	obj = (union acpi_object *) out.pointer;
-	if (obj && obj->type == ACPI_TYPE_BUFFER &&
-		(obj->buffer.length == sizeof(u32) ||
-		obj->buffer.length == sizeof(u64))) {
-		devices = *((u32 *) obj->buffer.pointer);
-	} else if (obj->type == ACPI_TYPE_INTEGER) {
-		devices = (u32) obj->integer.value;
+	if (obj) {
+		if (obj->type == ACPI_TYPE_BUFFER &&
+			(obj->buffer.length == sizeof(u32) ||
+			obj->buffer.length == sizeof(u64))) {
+			devices = *((u32 *) obj->buffer.pointer);
+		} else if (obj->type == ACPI_TYPE_INTEGER) {
+			devices = (u32) obj->integer.value;
+		}
 	}
 
 	kfree(out.pointer);
-- 
1.6.0.2
