From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 3/4] acer-wmi: allow 64-bits return buffer from WMI methods
Date: Sun, 22 May 2011 07:33:53 +0800
Message-ID: <1306020834-5186-4-git-send-email-jlee@novell.com>
References: <1306020834-5186-1-git-send-email-jlee@novell.com>
 <1306020834-5186-2-git-send-email-jlee@novell.com>
 <1306020834-5186-3-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:35579 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757263Ab1EUXfZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 May 2011 19:35:25 -0400
Received: by pvg12 with SMTP id 12so2149707pvg.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 May 2011 16:35:25 -0700 (PDT)
In-Reply-To: <1306020834-5186-3-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Acer WMID_GUID1/2 method's return buffer was declared to 64-bits
on some Acer notebook, but WMI method only use 32-bits in return
buffer.
So, add this patch for allow 64-bits return buffer.

Reference: bko#34142
	https://bugzilla.kernel.org/show_bug.cgi?id=34142

Tested on Acer Travelmate 5735Z-452G32Mnss

Tested-by: Melchior FRANZ <melchior.franz@gmail.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/acer-wmi.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 6c4716d..73a7b63 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -737,7 +737,8 @@ WMI_execute_u32(u32 method_id, u32 in, u32 *out)
 
 	obj = (union acpi_object *) result.pointer;
 	if (obj && obj->type == ACPI_TYPE_BUFFER &&
-		obj->buffer.length == sizeof(u32)) {
+		(obj->buffer.length == sizeof(u32) ||
+		obj->buffer.length == sizeof(u64))) {
 		tmp = *((u32 *) obj->buffer.pointer);
 	} else {
 		tmp = 0;
@@ -866,7 +867,8 @@ static acpi_status WMID_set_capabilities(void)
 
 	obj = (union acpi_object *) out.pointer;
 	if (obj && obj->type == ACPI_TYPE_BUFFER &&
-		obj->buffer.length == sizeof(u32)) {
+		(obj->buffer.length == sizeof(u32) ||
+		obj->buffer.length == sizeof(u64))) {
 		devices = *((u32 *) obj->buffer.pointer);
 	} else {
 		kfree(out.pointer);
@@ -1509,7 +1511,8 @@ static u32 get_wmid_devices(void)
 
 	obj = (union acpi_object *) out.pointer;
 	if (obj && obj->type == ACPI_TYPE_BUFFER &&
-		obj->buffer.length == sizeof(u32)) {
+		(obj->buffer.length == sizeof(u32) ||
+		obj->buffer.length == sizeof(u64))) {
 		devices = *((u32 *) obj->buffer.pointer);
 	}
 
-- 
1.6.0.2
