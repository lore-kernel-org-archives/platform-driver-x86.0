From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-wmi: control backlight power through WMI, not ACPI
Date: Wed, 16 May 2012 17:39:22 +0800
Message-ID: <1337161162-27792-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:61911 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966479Ab2EPJja (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 May 2012 05:39:30 -0400
Received: by dady13 with SMTP id y13so744407dad.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 May 2012 02:39:29 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

BugLink: https://bugs.launchpad.net/bugs/1000146

Some h/w that can adjust screen brightness through ACPI functions, but
can't turn on/off the backlight power correctly. So, we list those h/w in
quirks and try to turn on/off the backlight power through WMI.
Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c  |    9 ++++++++-
 drivers/platform/x86/asus-wmi.h  |    1 +
 drivers/platform/x86/eeepc-wmi.c |   23 +++++++++++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 77aadde..beda7fc 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -69,6 +69,7 @@ MODULE_LICENSE("GPL");
 #define NOTIFY_BRNDOWN_MAX		0x2e
 #define NOTIFY_KBD_BRTUP		0xc4
 #define NOTIFY_KBD_BRTDWN		0xc5
+#define NOTIFY_BACKLIGHT_POWER		0xe9
 
 /* WMI Methods */
 #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECification */
@@ -1288,6 +1289,11 @@ static void asus_wmi_notify(u32 value, void *context)
 	if (code == NOTIFY_BRNUP_MIN || code == NOTIFY_BRNDOWN_MIN) {
 		if (!acpi_video_backlight_support())
 			asus_wmi_backlight_notify(asus, orig_code);
+	} else if (asus->driver->quirks->wmi_backlight_power &&
+		   code == NOTIFY_BACKLIGHT_POWER) {
+		struct backlight_device *bd = asus->backlight_device;
+		bd->props.power = !bd->props.power;
+		backlight_update_status(bd);
 	} else if (!sparse_keymap_report_event(asus->inputdev, code,
 					       key_value, autorelease))
 		pr_info("Unknown key %x pressed\n", code);
@@ -1681,7 +1687,8 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_rfkill;
 
-	if (!acpi_video_backlight_support()) {
+	if (!acpi_video_backlight_support() ||
+	    asus->driver->quirks->wmi_backlight_power) {
 		err = asus_wmi_backlight_init(asus);
 		if (err && err != -ENODEV)
 			goto fail_backlight;
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
