From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: remove useless input argument for internal wmi
Date: Mon,  9 Jan 2012 14:26:44 +0800
Message-ID: <1326090404-25735-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:39007 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753262Ab2AIGaW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Jan 2012 01:30:22 -0500
Received: by obcwo16 with SMTP id wo16so3639357obc.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Jan 2012 22:30:21 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

From: "Lee, Chun-Yi" <jlee@suse.com>

The "wmi_interface *iface" is a useless input argument for internal wmi get/set
functions, remove it to clear up source code.

Tested on Lenovo E520.
Tested on Acer TravelMate 4750.

Tested-by: mr.kobzar <mr.kobzar@gmail.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |   30 ++++++++++++++----------------
 1 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index b848277..88dfecf 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -536,8 +536,7 @@ struct acpi_buffer *result)
 	return status;
 }
 
-static acpi_status AMW0_get_u32(u32 *value, u32 cap,
-struct wmi_interface *iface)
+static acpi_status AMW0_get_u32(u32 *value, u32 cap)
 {
 	int err;
 	u8 result;
@@ -607,7 +606,7 @@ struct wmi_interface *iface)
 	return AE_OK;
 }
 
-static acpi_status AMW0_set_u32(u32 value, u32 cap, struct wmi_interface *iface)
+static acpi_status AMW0_set_u32(u32 value, u32 cap)
 {
 	struct wmab_args args;
 
@@ -799,8 +798,7 @@ WMI_execute_u32(u32 method_id, u32 in, u32 *out)
 	return status;
 }
 
-static acpi_status WMID_get_u32(u32 *value, u32 cap,
-struct wmi_interface *iface)
+static acpi_status WMID_get_u32(u32 *value, u32 cap)
 {
 	acpi_status status;
 	u8 tmp;
@@ -836,7 +834,7 @@ struct wmi_interface *iface)
 	return status;
 }
 
-static acpi_status WMID_set_u32(u32 value, u32 cap, struct wmi_interface *iface)
+static acpi_status WMID_set_u32(u32 value, u32 cap)
 {
 	u32 method_id = 0;
 	char param;
@@ -1126,15 +1124,15 @@ static acpi_status get_u32(u32 *value, u32 cap)
 
 	switch (interface->type) {
 	case ACER_AMW0:
-		status = AMW0_get_u32(value, cap, interface);
+		status = AMW0_get_u32(value, cap);
 		break;
 	case ACER_AMW0_V2:
 		if (cap == ACER_CAP_MAILLED) {
-			status = AMW0_get_u32(value, cap, interface);
+			status = AMW0_get_u32(value, cap);
 			break;
 		}
 	case ACER_WMID:
-		status = WMID_get_u32(value, cap, interface);
+		status = WMID_get_u32(value, cap);
 		break;
 	case ACER_WMID_v2:
 		if (cap & (ACER_CAP_WIRELESS |
@@ -1142,7 +1140,7 @@ static acpi_status get_u32(u32 *value, u32 cap)
 			   ACER_CAP_THREEG))
 			status = wmid_v2_get_u32(value, cap);
 		else if (wmi_has_guid(WMID_GUID2))
-			status = WMID_get_u32(value, cap, interface);
+			status = WMID_get_u32(value, cap);
 		break;
 	}
 
@@ -1156,10 +1154,10 @@ static acpi_status set_u32(u32 value, u32 cap)
 	if (interface->capability & cap) {
 		switch (interface->type) {
 		case ACER_AMW0:
-			return AMW0_set_u32(value, cap, interface);
+			return AMW0_set_u32(value, cap);
 		case ACER_AMW0_V2:
 			if (cap == ACER_CAP_MAILLED)
-				return AMW0_set_u32(value, cap, interface);
+				return AMW0_set_u32(value, cap);
 
 			/*
 			 * On some models, some WMID methods don't toggle
@@ -1169,21 +1167,21 @@ static acpi_status set_u32(u32 value, u32 cap)
 			 */
 			if (cap == ACER_CAP_WIRELESS ||
 				cap == ACER_CAP_BLUETOOTH) {
-				status = WMID_set_u32(value, cap, interface);
+				status = WMID_set_u32(value, cap);
 				if (ACPI_FAILURE(status))
 					return status;
 
-				return AMW0_set_u32(value, cap, interface);
+				return AMW0_set_u32(value, cap);
 			}
 		case ACER_WMID:
-			return WMID_set_u32(value, cap, interface);
+			return WMID_set_u32(value, cap);
 		case ACER_WMID_v2:
 			if (cap & (ACER_CAP_WIRELESS |
 				   ACER_CAP_BLUETOOTH |
 				   ACER_CAP_THREEG))
 				return wmid_v2_set_u32(value, cap);
 			else if (wmi_has_guid(WMID_GUID2))
-				return WMID_set_u32(value, cap, interface);
+				return WMID_set_u32(value, cap);
 		default:
 			return AE_BAD_PARAMETER;
 		}
-- 
1.7.7
