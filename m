From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: replaced the hard coded bitmap by the communication devices bitmap from SMBIOS
Date: Thu,  6 Oct 2011 19:06:13 +0800
Message-ID: <1317899173-8536-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:57923 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935288Ab1JFLG0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Oct 2011 07:06:26 -0400
Received: by ywb5 with SMTP id 5so2447241ywb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Oct 2011 04:06:26 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Before set communication devices state, we need query out all devices state to set
the states bitmap. That will be better use the devices bitmap in SMBIOS type Aah
instead of hardcode in driver.

Tested on Acer Travelmate 8572.

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 5130c63..9fb9486 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -206,6 +206,7 @@ static int threeg = -1;
 static int force_series;
 static bool ec_raw_mode;
 static bool has_type_aa;
+static u16 commun_func_bitmap;
 
 module_param(mailled, int, 0444);
 module_param(brightness, int, 0444);
@@ -946,10 +947,7 @@ static acpi_status wmid3_set_device_status(u32 value, u16 device)
 	struct wmid3_gds_input_param params = {
 		.function_num = 0x1,
 		.hotkey_number = 0x01,
-		.devices = ACER_WMID3_GDS_WIRELESS |
-				ACER_WMID3_GDS_THREEG |
-				ACER_WMID3_GDS_WIMAX |
-				ACER_WMID3_GDS_BLUETOOTH,
+		.devices = commun_func_bitmap,
 	};
 	struct acpi_buffer input = {
 		sizeof(struct wmid3_gds_input_param),
@@ -1053,6 +1051,7 @@ static void type_aa_dmi_decode(const struct dmi_header *header, void *dummy)
 
 	pr_info("Function bitmap for Communication Button: 0x%x\n",
 		type_aa->commun_func_bitmap);
+	commun_func_bitmap = type_aa->commun_func_bitmap;
 
 	if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_WIRELESS)
 		interface->capability |= ACER_CAP_WIRELESS;
-- 
1.6.0.2
