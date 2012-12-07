From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v3 12/12] msi-wmi: Add MSI Wind support
Date: Fri,  7 Dec 2012 15:49:22 +0200
Message-ID: <1354888162-12109-13-git-send-email-maxtram95@gmail.com>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62343 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030475Ab2LGNuS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Dec 2012 08:50:18 -0500
Received: by mail-ee0-f46.google.com with SMTP id e53so289080eek.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Dec 2012 05:50:18 -0800 (PST)
In-Reply-To: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Add MSI Wind support to msi-wmi driver. MSI Wind has different GUID for
key events, different WMI key scan codes, it does not need filtering
consecutive identical events and it does not support backlight control
via MSIWMI_BIOS_GUID WMI. Tested on MSI Wind U100.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 65 ++++++++++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 273f647..ddbb0ca 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -37,17 +37,27 @@ MODULE_LICENSE("GPL");
 #define DRV_NAME "msi-wmi"
 
 #define MSIWMI_BIOS_GUID "551A1F84-FBDD-4125-91DB-3EA8F44F1D45"
-#define MSIWMI_EVENT_GUID "B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2"
+#define MSIWMI_MSI_EVENT_GUID "B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2"
+#define MSIWMI_WIND_EVENT_GUID "5B3CC38A-40D9-7245-8AE6-1145B751BE3F"
 
 MODULE_ALIAS("wmi:" MSIWMI_BIOS_GUID);
-MODULE_ALIAS("wmi:" MSIWMI_EVENT_GUID);
+MODULE_ALIAS("wmi:" MSIWMI_MSI_EVENT_GUID);
+MODULE_ALIAS("wmi:" MSIWMI_WIND_EVENT_GUID);
 
 enum msi_scancodes {
+	/* Generic MSI keys (not present on MSI Wind) */
 	MSI_KEY_BRIGHTNESSUP	= 0xD0,
 	MSI_KEY_BRIGHTNESSDOWN,
 	MSI_KEY_VOLUMEUP,
 	MSI_KEY_VOLUMEDOWN,
 	MSI_KEY_MUTE,
+	/* MSI Wind keys */
+	WIND_KEY_TOUCHPAD	= 0x08,	/* Fn+F3 touchpad toggle */
+	WIND_KEY_BLUETOOTH	= 0x56,	/* Fn+F11 Bluetooth toggle */
+	WIND_KEY_CAMERA,		/* Fn+F6 webcam toggle */
+	WIND_KEY_WLAN		= 0x5f,	/* Fn+F11 Wi-Fi toggle */
+	WIND_KEY_TURBO,			/* Fn+F10 turbo mode toggle */
+	WIND_KEY_ECO		= 0x69,	/* Fn+F10 ECO mode toggle */
 };
 static struct key_entry msi_wmi_keymap[] = {
 	{ KE_KEY, MSI_KEY_BRIGHTNESSUP,		{KEY_BRIGHTNESSUP} },
@@ -55,12 +65,33 @@ static struct key_entry msi_wmi_keymap[] = {
 	{ KE_KEY, MSI_KEY_VOLUMEUP,		{KEY_VOLUMEUP} },
 	{ KE_KEY, MSI_KEY_VOLUMEDOWN,		{KEY_VOLUMEDOWN} },
 	{ KE_KEY, MSI_KEY_MUTE,			{KEY_MUTE} },
+
+	/* These keys work without WMI. Ignore them to avoid double keycodes */
+	{ KE_IGNORE, WIND_KEY_TOUCHPAD,		{KEY_TOUCHPAD_TOGGLE} },
+	{ KE_IGNORE, WIND_KEY_BLUETOOTH,	{KEY_BLUETOOTH} },
+	{ KE_IGNORE, WIND_KEY_CAMERA,		{KEY_CAMERA} },
+	{ KE_IGNORE, WIND_KEY_WLAN,		{KEY_WLAN} },
+
+	/* These are unknown WMI events found on MSI Wind */
+	{ KE_IGNORE, 0x00 },
+	{ KE_IGNORE, 0x62 },
+	{ KE_IGNORE, 0x63 },
+
+	/* These are MSI Wind keys that should be handled via WMI */
+	{ KE_KEY, WIND_KEY_TURBO,		{KEY_PROG1} },
+	{ KE_KEY, WIND_KEY_ECO,			{KEY_PROG2} },
+
 	{ KE_END, 0 }
 };
 static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
-static bool quirk_last_pressed;
 
-static const char *event_wmi_guid;
+static const struct {
+	const char *guid;
+	bool quirk_last_pressed;
+} *event_wmi, event_wmis[] = {
+	{ MSIWMI_MSI_EVENT_GUID, true },
+	{ MSIWMI_WIND_EVENT_GUID, false },
+};
 
 static struct backlight_device *backlight;
 
@@ -173,7 +204,7 @@ static void msi_wmi_notify(u32 value, void *context)
 			pr_info("Unknown key pressed - %x\n", eventcode);
 			goto msi_wmi_notify_exit;
 		}
-		if (quirk_last_pressed) {
+		if (event_wmi->quirk_last_pressed) {
 			size_t key_index = key - msi_wmi_keymap;
 			ktime_t diff;
 			cur = ktime_get_real();
@@ -266,15 +297,19 @@ err_free_dev:
 static int __init msi_wmi_init(void)
 {
 	int err;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(event_wmis); i++) {
+		if (!wmi_has_guid(event_wmis[i].guid))
+			continue;
 
-	if (wmi_has_guid(MSIWMI_EVENT_GUID)) {
 		err = msi_wmi_input_setup();
 		if (err) {
 			pr_err("Unable to setup input device\n");
 			return err;
 		}
 
-		err = wmi_install_notify_handler(MSIWMI_EVENT_GUID,
+		err = wmi_install_notify_handler(event_wmis[i].guid,
 			msi_wmi_notify, NULL);
 		if (ACPI_FAILURE(err)) {
 			pr_err("Unable to setup WMI notify handler\n");
@@ -282,8 +317,8 @@ static int __init msi_wmi_init(void)
 		}
 
 		pr_debug("Event handler installed\n");
-		event_wmi_guid = MSIWMI_EVENT_GUID;
-		quirk_last_pressed = true;
+		event_wmi = &event_wmis[i];
+		break;
 	}
 
 	if (wmi_has_guid(MSIWMI_BIOS_GUID) && !acpi_video_backlight_support()) {
@@ -295,7 +330,7 @@ static int __init msi_wmi_init(void)
 		pr_debug("Backlight device created\n");
 	}
 
-	if (!event_wmi_guid && !backlight) {
+	if (!event_wmi && !backlight) {
 		pr_err("This machine doesn't have neither MSI-hotkeys nor backlight through WMI\n");
 		return -ENODEV;
 	}
@@ -303,10 +338,10 @@ static int __init msi_wmi_init(void)
 	return 0;
 
 err_uninstall_handler:
-	if (event_wmi_guid)
-		wmi_remove_notify_handler(event_wmi_guid);
+	if (event_wmi)
+		wmi_remove_notify_handler(event_wmi->guid);
 err_free_input:
-	if (event_wmi_guid) {
+	if (event_wmi) {
 		sparse_keymap_free(msi_wmi_input_dev);
 		input_unregister_device(msi_wmi_input_dev);
 	}
@@ -315,8 +350,8 @@ err_free_input:
 
 static void __exit msi_wmi_exit(void)
 {
-	if (event_wmi_guid) {
-		wmi_remove_notify_handler(event_wmi_guid);
+	if (event_wmi) {
+		wmi_remove_notify_handler(event_wmi->guid);
 		sparse_keymap_free(msi_wmi_input_dev);
 		input_unregister_device(msi_wmi_input_dev);
 	}
-- 
1.8.0.1
