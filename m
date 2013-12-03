From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] dell-wmi: Add quirk for Dell Inspiron 3138
Date: Tue,  3 Dec 2013 14:50:07 +0800
Message-ID: <1386053407-7972-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:49624 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938Ab3LCGuN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Dec 2013 01:50:13 -0500
Received: by mail-pd0-f172.google.com with SMTP id g10so19599553pdj.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Dec 2013 22:50:13 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

The acpi_video0 interface doesn't not work on Dell Inspiron 3138,
so using the vendor brightness interface, instead of the acpi one.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/dell-laptop.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index c608b1d..9d2a4af 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -62,6 +62,7 @@ struct calling_interface_structure {
 
 struct quirk_entry {
 	u8 touchpad_led;
+	u8 vendor_backlight;
 };
 
 static struct quirk_entry *quirks;
@@ -70,6 +71,10 @@ static struct quirk_entry quirk_dell_vostro_v130 = {
 	.touchpad_led = 1,
 };
 
+static struct quirk_entry quirk_dell_inspiron_3138 = {
+	.vendor_backlight = 1,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	quirks = dmi->driver_data;
@@ -268,6 +273,15 @@ static struct dmi_system_id dell_quirks[] = {
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron 3138",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 3138"),
+		},
+		.driver_data = &quirk_dell_inspiron_3138,
+	},
 	{ }
 };
 
@@ -843,6 +857,9 @@ static int __init dell_init(void)
 				    &dell_debugfs_fops);
 
 #ifdef CONFIG_ACPI
+	if (quirks && quirks->vendor_backlight)
+		acpi_video_dmi_promote_vendor();
+
 	/* In the event of an ACPI backlight being available, don't
 	 * register the platform controller.
 	 */
-- 
1.8.3.2
