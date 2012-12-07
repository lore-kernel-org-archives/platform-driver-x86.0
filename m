From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v3 10/12] msi-wmi: Make keys and backlight independent
Date: Fri,  7 Dec 2012 15:49:20 +0200
Message-ID: <1354888162-12109-11-git-send-email-maxtram95@gmail.com>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:44205 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030475Ab2LGNuN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Dec 2012 08:50:13 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so188017eaa.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Dec 2012 05:50:12 -0800 (PST)
In-Reply-To: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Introduced function msi_wmi_backlight_setup() that initializes backlight
device. Made driver load and work if only one WMI (only for hotkeys or
only for backlight) is present.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 101 ++++++++++++++++++++++++++---------------
 1 file changed, 64 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 112ec14..3a60619 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -60,6 +60,8 @@ static struct key_entry msi_wmi_keymap[] = {
 };
 static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
 
+static const char *event_wmi_guid;
+
 static struct backlight_device *backlight;
 
 static int backlight_map[] = { 0x00, 0x33, 0x66, 0x99, 0xCC, 0xFF };
@@ -184,7 +186,7 @@ static void msi_wmi_notify(u32 value, void *context)
 
 			if (key->type == KE_KEY &&
 			/* Brightness is served via acpi video driver */
-			(!acpi_video_backlight_support() ||
+			(backlight ||
 			(key->code != MSI_KEY_BRIGHTNESSUP &&
 			key->code != MSI_KEY_BRIGHTNESSDOWN))) {
 				pr_debug("Send key: 0x%X - "
@@ -202,6 +204,31 @@ msi_wmi_notify_exit:
 	kfree(response.pointer);
 }
 
+static int __init msi_wmi_backlight_setup(void)
+{
+	int err;
+	struct backlight_properties props;
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_PLATFORM;
+	props.max_brightness = ARRAY_SIZE(backlight_map) - 1;
+	backlight = backlight_device_register(DRV_NAME, NULL, NULL,
+					      &msi_backlight_ops,
+					      &props);
+	if (IS_ERR(backlight))
+		return PTR_ERR(backlight);
+
+	err = bl_get(NULL);
+	if (err < 0) {
+		backlight_device_unregister(backlight);
+		return err;
+	}
+
+	backlight->props.brightness = err;
+
+	return 0;
+}
+
 static int __init msi_wmi_input_setup(void)
 {
 	int err;
@@ -238,60 +265,60 @@ static int __init msi_wmi_init(void)
 {
 	int err;
 
-	if (!wmi_has_guid(MSIWMI_EVENT_GUID)) {
-		pr_err("This machine doesn't have MSI-hotkeys through WMI\n");
-		return -ENODEV;
-	}
-	err = wmi_install_notify_handler(MSIWMI_EVENT_GUID,
-			msi_wmi_notify, NULL);
-	if (ACPI_FAILURE(err))
-		return -EINVAL;
+	if (wmi_has_guid(MSIWMI_EVENT_GUID)) {
+		err = msi_wmi_input_setup();
+		if (err) {
+			pr_err("Unable to setup input device\n");
+			return err;
+		}
 
-	err = msi_wmi_input_setup();
-	if (err)
-		goto err_uninstall_notifier;
-
-	if (!acpi_video_backlight_support()) {
-		struct backlight_properties props;
-		memset(&props, 0, sizeof(struct backlight_properties));
-		props.type = BACKLIGHT_PLATFORM;
-		props.max_brightness = ARRAY_SIZE(backlight_map) - 1;
-		backlight = backlight_device_register(DRV_NAME, NULL, NULL,
-						      &msi_backlight_ops,
-						      &props);
-		if (IS_ERR(backlight)) {
-			err = PTR_ERR(backlight);
+		err = wmi_install_notify_handler(MSIWMI_EVENT_GUID,
+			msi_wmi_notify, NULL);
+		if (ACPI_FAILURE(err)) {
+			pr_err("Unable to setup WMI notify handler\n");
 			goto err_free_input;
 		}
 
-		err = bl_get(NULL);
-		if (err < 0)
-			goto err_free_backlight;
+		pr_debug("Event handler installed\n");
+		event_wmi_guid = MSIWMI_EVENT_GUID;
+	}
+
+	if (wmi_has_guid(MSIWMI_BIOS_GUID) && !acpi_video_backlight_support()) {
+		err = msi_wmi_backlight_setup();
+		if (err) {
+			pr_err("Unable to setup backlight device\n");
+			goto err_uninstall_handler;
+		}
+		pr_debug("Backlight device created\n");
+	}
 
-		backlight->props.brightness = err;
+	if (!event_wmi_guid && !backlight) {
+		pr_err("This machine doesn't have neither MSI-hotkeys nor backlight through WMI\n");
+		return -ENODEV;
 	}
-	pr_debug("Event handler installed\n");
 
 	return 0;
 
-err_free_backlight:
-	backlight_device_unregister(backlight);
+err_uninstall_handler:
+	if (event_wmi_guid)
+		wmi_remove_notify_handler(event_wmi_guid);
 err_free_input:
-	sparse_keymap_free(msi_wmi_input_dev);
-	input_unregister_device(msi_wmi_input_dev);
-err_uninstall_notifier:
-	wmi_remove_notify_handler(MSIWMI_EVENT_GUID);
+	if (event_wmi_guid) {
+		sparse_keymap_free(msi_wmi_input_dev);
+		input_unregister_device(msi_wmi_input_dev);
+	}
 	return err;
 }
 
 static void __exit msi_wmi_exit(void)
 {
-	if (wmi_has_guid(MSIWMI_EVENT_GUID)) {
-		wmi_remove_notify_handler(MSIWMI_EVENT_GUID);
+	if (event_wmi_guid) {
+		wmi_remove_notify_handler(event_wmi_guid);
 		sparse_keymap_free(msi_wmi_input_dev);
 		input_unregister_device(msi_wmi_input_dev);
-		backlight_device_unregister(backlight);
 	}
+	if (backlight)
+		backlight_device_unregister(backlight);
 }
 
 module_init(msi_wmi_init);
-- 
1.8.0.1
