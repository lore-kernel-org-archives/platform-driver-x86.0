From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-wmi: control backlight power through WMI, not ACPI
Date: Fri, 18 May 2012 16:10:36 +0800
Message-ID: <1337328636-4196-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:39196 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761378Ab2ERIKm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 May 2012 04:10:42 -0400
Received: by dady13 with SMTP id y13so3523881dad.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 May 2012 01:10:41 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

BugLink: https://bugs.launchpad.net/bugs/1000146

Some h/w that can adjust screen brightness through ACPI functions, but
can't turn on/off the backlight power correctly. So, we list those h/w in
quirks and try to turn on/off the backlight power through WMI.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c  |    7 +++++++
 drivers/platform/x86/asus-wmi.h  |    1 +
 drivers/platform/x86/eeepc-wmi.c |   23 +++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 77aadde..b1b8b0b 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -69,6 +69,7 @@ MODULE_LICENSE("GPL");
 #define NOTIFY_BRNDOWN_MAX		0x2e
 #define NOTIFY_KBD_BRTUP		0xc4
 #define NOTIFY_KBD_BRTDWN		0xc5
+#define NOTIFY_BACKLIGHT_POWER		0xe9
 
 /* WMI Methods */
 #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECification */
@@ -1288,6 +1289,12 @@ static void asus_wmi_notify(u32 value, void *context)
 	if (code == NOTIFY_BRNUP_MIN || code == NOTIFY_BRNDOWN_MIN) {
 		if (!acpi_video_backlight_support())
 			asus_wmi_backlight_notify(asus, orig_code);
+	} else if (asus->driver->quirks->wmi_backlight_power &&
+		   code == NOTIFY_BACKLIGHT_POWER) {
+		static int backlight_power = 1;
+		backlight_power = !backlight_power;
+		asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT,
+				      backlight_power, NULL);
 	} else if (!sparse_keymap_report_event(asus->inputdev, code,
 					       key_value, autorelease))
 		pr_info("Unknown key %x pressed\n", code);
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index d43b667..9c1da8b 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -39,6 +39,7 @@ struct quirk_entry {
 	bool hotplug_wireless;
 	bool scalar_panel_brightness;
 	bool store_backlight_power;
+	bool wmi_backlight_power;
 	int wapf;
 };
 
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 6567613..8d31f4e 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -107,6 +107,11 @@ static struct quirk_entry quirk_asus_et2012_type3 = {
 	.store_backlight_power = true,
 };
 
+static struct quirk_entry quirk_asus_x101ch = {
+	/* We need this when ACPI function doesn't do this well */
+	.wmi_backlight_power = true,
+};
+
 static struct quirk_entry *quirks;
 
 static void et2012_quirks(void)
@@ -157,6 +162,24 @@ static struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_unknown,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK Computer INC. X101CH",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X101CH"),
+		},
+		.driver_data = &quirk_asus_x101ch,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK Computer INC. 1015CX",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "1015CX"),
+		},
+		.driver_data = &quirk_asus_x101ch,
+	},
 	{},
 };
 
-- 
1.7.9.5
