From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] acer-wmi: support Lenovo ideapad S205 wifi switch
Date: Sat, 30 Jul 2011 17:00:45 +0800
Message-ID: <1312016445-19472-1-git-send-email-jlee@suse.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:61743 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750816Ab1G3JDs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 30 Jul 2011 05:03:48 -0400
Received: by fxh19 with SMTP id 19so2962979fxh.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Jul 2011 02:03:47 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

The AMW0 function in acer-wmi works on Lenovo ideapad S205 for control
the wifi hardware state. We also found there have a 0x78 EC register
exposes the state of wifi hardware switch on the machine.

So, add this patch to support Lenovo ideapad S205 wifi hardware switch
in acer-wmi driver.

Reference: bko#37892
	https://bugzilla.kernel.org/show_bug.cgi?id=37892

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Cc: Thomas Renninger <trenn@suse.de>
Tested-by: Florian Heyer <heyho@flanto.de>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |   28 ++++++++++++++++++++++++++--
 1 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index fa71530..af2bb20 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -305,6 +305,10 @@ static struct quirk_entry quirk_fujitsu_amilo_li_1718 = {
 	.wireless = 2,
 };
 
+static struct quirk_entry quirk_lenovo_ideapad_s205 = {
+	.wireless = 3,
+};
+
 /* The Aspire One has a dummy ACPI-WMI interface - disable it */
 static struct dmi_system_id __devinitdata acer_blacklist[] = {
 	{
@@ -451,6 +455,15 @@ static struct dmi_system_id acer_quirks[] = {
 		},
 		.driver_data = &quirk_medion_md_98300,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Lenovo Ideapad S205",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "10382LG"),
+		},
+		.driver_data = &quirk_lenovo_ideapad_s205,
+	},
 	{}
 };
 
@@ -543,6 +556,12 @@ struct wmi_interface *iface)
 				return AE_ERROR;
 			*value = result & 0x1;
 			return AE_OK;
+		case 3:
+			err = ec_read(0x78, &result);
+			if (err)
+				return AE_ERROR;
+			*value = result & 0x1;
+			return AE_OK;
 		default:
 			err = ec_read(0xA, &result);
 			if (err)
@@ -1267,8 +1286,13 @@ static void acer_rfkill_update(struct work_struct *ignored)
 	acpi_status status;
 
 	status = get_u32(&state, ACER_CAP_WIRELESS);
-	if (ACPI_SUCCESS(status))
-		rfkill_set_sw_state(wireless_rfkill, !state);
+	if (ACPI_SUCCESS(status)) {
+		if (quirks->wireless == 3) {
+			rfkill_set_hw_state(wireless_rfkill, !state);
+		} else {
+			rfkill_set_sw_state(wireless_rfkill, !state);
+		}
+	}
 
 	if (has_cap(ACER_CAP_BLUETOOTH)) {
 		status = get_u32(&state, ACER_CAP_BLUETOOTH);
-- 
1.6.0.2
