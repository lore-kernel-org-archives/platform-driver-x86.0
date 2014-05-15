From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] asus-wmi: Add a no backlight quirk
Date: Thu, 15 May 2014 11:39:38 +0200
Message-ID: <1400146779-5607-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:25837 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752889AbaEOJj4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 May 2014 05:39:56 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <matthew.garrett@nebula.com>
Cc: karlitos <karel.macha@karlitos.net>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Some Asus motherboards for desktop PC-s export an acpi-video and
an asus-wmi interface advertising backlight support. Add a quirk to allow
to blacklist these so that desktop environments such as gnome don't start
showing nonsense brightness controls.

https://bugzilla.redhat.com/show_bug.cgi?id=1097436

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 8 ++++++--
 drivers/platform/x86/asus-wmi.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index c5e082f..6f73dc5 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1272,6 +1272,9 @@ static int asus_wmi_backlight_init(struct asus_wmi *asus)
 	int max;
 	int power;
 
+	if (asus->driver->quirks->no_backlight)
+		return -ENODEV;
+
 	max = read_brightness_max(asus);
 
 	if (max == -ENODEV)
@@ -1370,7 +1373,7 @@ static void asus_wmi_notify(u32 value, void *context)
 		code = ASUS_WMI_BRN_DOWN;
 
 	if (code == ASUS_WMI_BRN_DOWN || code == ASUS_WMI_BRN_UP) {
-		if (!acpi_video_backlight_support()) {
+		if (asus->backlight_device) {
 			asus_wmi_backlight_notify(asus, orig_code);
 			goto exit;
 		}
@@ -1773,7 +1776,8 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_rfkill;
 
-	if (asus->driver->quirks->wmi_backlight_power)
+	if (asus->driver->quirks->wmi_backlight_power ||
+			asus->driver->quirks->no_backlight)
 		acpi_video_dmi_promote_vendor();
 	if (!acpi_video_backlight_support()) {
 		pr_info("Disabling ACPI video driver\n");
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 4da4c8b..cc47efe 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -42,6 +42,7 @@ struct quirk_entry {
 	bool scalar_panel_brightness;
 	bool store_backlight_power;
 	bool wmi_backlight_power;
+	bool no_backlight;
 	int wapf;
 	/*
 	 * For machines with AMD graphic chips, it will send out WMI event
-- 
1.9.0
