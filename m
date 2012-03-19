From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 1/2] acer-wmi: Detect communication hot key number
Date: Mon, 19 Mar 2012 17:37:32 +0800
Message-ID: <1332149854-2576-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:41217 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754173Ab2CSJjT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 05:39:19 -0400
Received: by yenl12 with SMTP id l12so5219538yen.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Mar 2012 02:39:18 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

From: "Lee, Chun-Yi" <jlee@suse.com>

Currently we set a fixed hot key number to 0x01 for communction button,
but, actually, the key number is different on each acer laptop and it was
reported by SMBIOS.

So, add this patch to get the communication hot key number from Acer
OEM-specific SMBIOS Type AA.

Tested on Acer TravelMate 4750

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 1e5290b..e1266b5 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -171,6 +171,11 @@ struct hotkey_function_type_aa {
 	u8 length;
 	u16 handle;
 	u16 commun_func_bitmap;
+	u16 application_func_bitmap;
+	u16 media_func_bitmap;
+	u16 display_func_bitmap;
+	u16 others_func_bitmap;
+	u8 commun_fn_key_number;
 } __attribute__((packed));
 
 /*
@@ -207,6 +212,7 @@ static int force_series;
 static bool ec_raw_mode;
 static bool has_type_aa;
 static u16 commun_func_bitmap;
+static u8 commun_fn_key_number;
 
 module_param(mailled, int, 0444);
 module_param(brightness, int, 0444);
@@ -914,7 +920,7 @@ static acpi_status wmid3_get_device_status(u32 *value, u16 device)
 	union acpi_object *obj;
 	struct wmid3_gds_input_param params = {
 		.function_num = 0x1,
-		.hotkey_number = 0x01,
+		.hotkey_number = commun_fn_key_number,
 		.devices = device,
 	};
 	struct acpi_buffer input = {
@@ -983,7 +989,7 @@ static acpi_status wmid3_set_device_status(u32 value, u16 device)
 	u16 devices;
 	struct wmid3_gds_input_param params = {
 		.function_num = 0x1,
-		.hotkey_number = 0x01,
+		.hotkey_number = commun_fn_key_number,
 		.devices = commun_func_bitmap,
 	};
 	struct acpi_buffer input = {
@@ -1023,7 +1029,7 @@ static acpi_status wmid3_set_device_status(u32 value, u16 device)
 
 	devices = return_value.devices;
 	params.function_num = 0x2;
-	params.hotkey_number = 0x01;
+	params.hotkey_number = commun_fn_key_number;
 	params.devices = (value) ? (devices | device) : (devices & ~device);
 
 	status = wmi_evaluate_method(WMID_GUID3, 0, 0x1, &input, &output2);
@@ -1096,6 +1102,8 @@ static void type_aa_dmi_decode(const struct dmi_header *header, void *dummy)
 		interface->capability |= ACER_CAP_THREEG;
 	if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_BLUETOOTH)
 		interface->capability |= ACER_CAP_BLUETOOTH;
+
+	commun_fn_key_number = type_aa->commun_fn_key_number;
 }
 
 static acpi_status WMID_set_capabilities(void)
-- 
1.7.7
