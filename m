From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] asus-wmi: add display toggle quirk
Date: Tue, 18 Sep 2012 09:48:52 +0800
Message-ID: <1347932932-20883-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:43568 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756490Ab2IRBs6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Sep 2012 21:48:58 -0400
Received: by oago6 with SMTP id o6so5486926oag.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Sep 2012 18:48:57 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

For machines with AMD graphic chips, it will send out WMI event and ACPI
interrupt at the same time while hitting the hotkey. BIOS will notify the
system the next display output mode throught WMI event code, so that
windows' application can show an OSD to tell the user which mode will be
taken effect. User can hit the display toggle key many times within 2
seconds to choose the mode they want. After 2 seconds, WMI dirver should
send a WMIMethod(SDSP) command to tell the BIOS which mode the user chose.
And then BIOS will raise another ACPI interrupt to tell the system to
really switch the display mode.

In Linux desktop, we don't have this kind of OSD to let users to choose
the mode they want, so we don't need to call WMIMethod(SDSP) to have
another ACPI interrupt. To simplify the problem, we just have to ignore
the WMI event, and let the first ACPI interrupt to send out the key event.

For the need, here comes another quirk to add machines with this kind of
behavior. When the WMI driver receives the display toggle WMI event, and
found the machin is in the list, it will do nothing and let ACPI video
driver to report the key event.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-nb-wmi.c |   26 +++++++++++++++++++++++++-
 drivers/platform/x86/asus-wmi.c    |   19 +++++++++++++++++++
 drivers/platform/x86/asus-wmi.h    |    2 ++
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 6b0ebde..09ac9e4 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -59,6 +59,12 @@ static struct quirk_entry quirk_asus_unknown = {
 	.wapf = 0,
 };
 
+static struct quirk_entry quirk_asus_x55u = {
+	.wapf = 4,
+	.wmi_backlight_power = true,
+	.no_display_toggle = true,
+};
+
 static struct quirk_entry quirk_asus_x401u = {
 	.wapf = 4,
 };
@@ -77,6 +83,15 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X401U"),
 		},
+		.driver_data = &quirk_asus_x55u,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X401A",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X401A"),
+		},
 		.driver_data = &quirk_asus_x401u,
 	},
 	{
@@ -95,6 +110,15 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X501U"),
 		},
+		.driver_data = &quirk_asus_x55u,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X501A",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X501A"),
+		},
 		.driver_data = &quirk_asus_x401u,
 	},
 	{
@@ -131,7 +155,7 @@ static struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "X55U"),
 		},
-		.driver_data = &quirk_asus_x401u,
+		.driver_data = &quirk_asus_x55u,
 	},
 	{
 		.callback = dmi_matched,
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 18f5169..526d713 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1341,6 +1341,22 @@ static void asus_wmi_backlight_exit(struct asus_wmi *asus)
 	asus->backlight_device = NULL;
 }
 
+static int is_display_toggle(int code)
+{
+	if ((code >= 0x61 && code <= 0x67) ||
+	    (code >= 0x8c && code <= 0x93) ||
+	    (code >= 0xa0 && code <= 0xa7) ||
+	    (code >= 0xd0 && code <= 0xd5))
+		return 1;
+
+	return 0;
+}
+
+static void do_nothing(void)
+{
+	return;
+}
+
 static void asus_wmi_notify(u32 value, void *context)
 {
 	struct asus_wmi *asus = context;
@@ -1382,6 +1398,9 @@ static void asus_wmi_notify(u32 value, void *context)
 	if (code == NOTIFY_BRNUP_MIN || code == NOTIFY_BRNDOWN_MIN) {
 		if (!acpi_video_backlight_support())
 			asus_wmi_backlight_notify(asus, orig_code);
+	} else if (is_display_toggle(code) &&
+		   asus->driver->quirks->no_display_toggle) {
+		do_nothing();
 	} else if (!sparse_keymap_report_event(asus->inputdev, code,
 					       key_value, autorelease))
 		pr_info("Unknown key %x pressed\n", code);
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 4c9bd38..10b9758 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -41,12 +41,14 @@ struct quirk_entry {
 	bool store_backlight_power;
 	bool wmi_backlight_power;
 	int wapf;
+	int no_display_toggle;
 };
 
 struct asus_wmi_driver {
 	int			brightness;
 	int			panel_power;
 	int			wlan_ctrl_by_user;
+	int			no_display_toggle;
 
 	const char		*name;
 	struct module		*owner;
-- 
1.7.10.4
