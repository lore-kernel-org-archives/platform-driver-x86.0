From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 2/3] asus-wmi: report brightness key events
Date: Fri,  9 Mar 2012 10:17:08 +0800
Message-ID: <1331259429-6216-3-git-send-email-acelan.kao@canonical.com>
References: <1331259429-6216-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:62787 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757812Ab2CICRY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Mar 2012 21:17:24 -0500
Received: by mail-yw0-f46.google.com with SMTP id m54so650244yhm.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Mar 2012 18:17:24 -0800 (PST)
In-Reply-To: <1331259429-6216-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

Some ASUS ET2012 All-in-One machines will handle the brightness events
from BIOS, but we still need the key events to inform X to draw the
brightness OSD.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c  |    8 +++++++-
 drivers/platform/x86/asus-wmi.h  |    1 +
 drivers/platform/x86/eeepc-wmi.c |    7 ++++++-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 48e96f3..80c05ff 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1272,7 +1272,13 @@ static void asus_wmi_notify(u32 value, void *context)
 
 	if (code == NOTIFY_BRNUP_MIN || code == NOTIFY_BRNDOWN_MIN) {
 		if (!acpi_video_backlight_support())
-			asus_wmi_backlight_notify(asus, orig_code);
+		{
+			if (unlikely(asus->driver->need_brightness_event))
+				sparse_keymap_report_event(asus->inputdev,
+					code, key_value, autorelease);
+			else
+				asus_wmi_backlight_notify(asus, orig_code);
+		}
 	} else if (!sparse_keymap_report_event(asus->inputdev, code,
 					       key_value, autorelease))
 		pr_info("Unknown key %x pressed\n", code);
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 45fb62c..d6683ba 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -38,6 +38,7 @@ struct asus_wmi;
 struct asus_wmi_driver {
 	bool			hotplug_wireless;
 	bool			scalar_panel_brightness;
+	bool			need_brightness_event;
 	int			wapf;
 
 	const char		*name;
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index c5f4c64..311f317 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -63,6 +63,8 @@ MODULE_PARM_DESC(hotplug_wireless,
 
 static const struct key_entry eeepc_wmi_keymap[] = {
 	/* Sleep already handled via generic ACPI code */
+	{ KE_KEY, 0x11, { KEY_BRIGHTNESSUP } },
+	{ KE_KEY, 0x20, { KEY_BRIGHTNESSDOWN } },
 	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
 	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
 	{ KE_KEY, 0x32, { KEY_MUTE } },
@@ -167,7 +169,9 @@ static void eeepc_dmi_check(struct asus_wmi_driver *driver)
 		char oemstring[30];
 		while ((dev = dmi_find_device(DMI_DEV_TYPE_OEM_STRING, NULL, dev))) {
 			if (sscanf(dev->name, "AEMS%24c", oemstring) == 1) {
-				if (oemstring[18] == '3')
+				if (oemstring[18] == '1')
+					driver->need_brightness_event = true;
+				else if (oemstring[18] == '3')
 					driver->scalar_panel_brightness = true;
 				break;
 			}
@@ -179,6 +183,7 @@ static void eeepc_wmi_quirks(struct asus_wmi_driver *driver)
 {
 	driver->hotplug_wireless = hotplug_wireless;
 	driver->scalar_panel_brightness = false;
+	driver->need_brightness_event = false;
 	driver->wapf = -1;
 	eeepc_dmi_check(driver);
 }
-- 
1.7.9
