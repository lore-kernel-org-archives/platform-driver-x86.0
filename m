From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v2 8/8] msi-wmi: Add MSI Wind support
Date: Fri, 30 Nov 2012 18:04:37 +0200
Message-ID: <1354291477-8788-9-git-send-email-maxtram95@gmail.com>
References: <1354291477-8788-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:35414 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030838Ab2K3QFS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 30 Nov 2012 11:05:18 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so258947eaa.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Nov 2012 08:05:18 -0800 (PST)
In-Reply-To: <1354291477-8788-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Add MSI Wind support to msi-wmi driver. MSI Wind has different GUID for
key events, different WMI key scan codes, it does not need filtering
consequent identical events and it does not support backlight control
via MSIWMI_BIOS_GUID WMI. Tested on MSI Wind U100.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 255 ++++++++++++++++++++++++++++-------------
 1 file changed, 177 insertions(+), 78 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index b96766b..31a7221 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -34,29 +34,63 @@ MODULE_AUTHOR("Thomas Renninger <trenn@suse.de>");
 MODULE_DESCRIPTION("MSI laptop WMI hotkeys driver");
 MODULE_LICENSE("GPL");
 
-MODULE_ALIAS("wmi:551A1F84-FBDD-4125-91DB-3EA8F44F1D45");
-MODULE_ALIAS("wmi:B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2");
-
 #define DRV_NAME "msi-wmi"
 
 #define MSIWMI_BIOS_GUID "551A1F84-FBDD-4125-91DB-3EA8F44F1D45"
-#define MSIWMI_EVENT_GUID "B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2"
-
-#define SCANCODE_BASE 0xD0
-#define MSI_WMI_BRIGHTNESSUP   SCANCODE_BASE
-#define MSI_WMI_BRIGHTNESSDOWN (SCANCODE_BASE + 1)
-#define MSI_WMI_VOLUMEUP       (SCANCODE_BASE + 2)
-#define MSI_WMI_VOLUMEDOWN     (SCANCODE_BASE + 3)
-#define MSI_WMI_MUTE           (SCANCODE_BASE + 4)
+#define MSIWMI_MSI_EVENT_GUID "B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2"
+#define MSIWMI_WIND_EVENT_GUID "5B3CC38A-40D9-7245-8AE6-1145B751BE3F"
+
+MODULE_ALIAS("wmi:" MSIWMI_BIOS_GUID);
+MODULE_ALIAS("wmi:" MSIWMI_MSI_EVENT_GUID);
+MODULE_ALIAS("wmi:" MSIWMI_WIND_EVENT_GUID);
+
+enum msi_scancodes {
+	MSI_SCANCODE_BASE	= 0xD0,
+	MSI_KEY_BRIGHTNESSUP	= MSI_SCANCODE_BASE,
+	MSI_KEY_BRIGHTNESSDOWN,
+	MSI_KEY_VOLUMEUP,
+	MSI_KEY_VOLUMEDOWN,
+	MSI_KEY_MUTE,
+};
 static struct key_entry msi_wmi_keymap[] = {
-	{ KE_KEY, MSI_WMI_BRIGHTNESSUP,   {KEY_BRIGHTNESSUP} },
-	{ KE_KEY, MSI_WMI_BRIGHTNESSDOWN, {KEY_BRIGHTNESSDOWN} },
-	{ KE_KEY, MSI_WMI_VOLUMEUP,       {KEY_VOLUMEUP} },
-	{ KE_KEY, MSI_WMI_VOLUMEDOWN,     {KEY_VOLUMEDOWN} },
-	{ KE_KEY, MSI_WMI_MUTE,           {KEY_MUTE} },
-	{ KE_END, 0}
+	{ KE_KEY, MSI_KEY_BRIGHTNESSUP,		{ KEY_BRIGHTNESSUP } },
+	{ KE_KEY, MSI_KEY_BRIGHTNESSDOWN,	{ KEY_BRIGHTNESSDOWN } },
+	{ KE_KEY, MSI_KEY_VOLUMEUP,		{ KEY_VOLUMEUP } },
+	{ KE_KEY, MSI_KEY_VOLUMEDOWN,		{ KEY_VOLUMEDOWN} },
+	{ KE_KEY, MSI_KEY_MUTE,			{ KEY_MUTE } },
+	{ KE_END, 0 }
+};
+static ktime_t *last_pressed;
+
+enum wind_scancodes {
+	/* Fn+F3 touchpad toggle */
+	WIND_KEY_TOUCHPAD	= 0x08,
+	/* Fn+F11 Bluetooth toggle */
+	WIND_KEY_BLUETOOTH	= 0x56,
+	/* Fn+F6 webcam toggle */
+	WIND_KEY_CAMERA		= 0x57,
+	/* Fn+F11 Wi-Fi toggle */
+	WIND_KEY_WLAN		= 0x5f,
+	/* Fn+F10 turbo mode toggle */
+	WIND_KEY_TURBO		= 0x60,
+	/* Fn+F10 ECO mode toggle */
+	WIND_KEY_ECO		= 0x69,
+};
+static struct key_entry wind_wmi_keymap[] = {
+	/* These keys work without WMI. Ignore them to avoid double keycodes */
+	{ KE_IGNORE, WIND_KEY_TOUCHPAD,         { KEY_TOUCHPAD_TOGGLE } },
+	{ KE_IGNORE, WIND_KEY_BLUETOOTH,        { KEY_BLUETOOTH } },
+	{ KE_IGNORE, WIND_KEY_CAMERA,           { KEY_CAMERA } },
+	{ KE_IGNORE, WIND_KEY_WLAN,             { KEY_WLAN } },
+	/* These are unknown WMI events */
+	{ KE_IGNORE, 0x00 },
+	{ KE_IGNORE, 0x62 },
+	{ KE_IGNORE, 0x63 },
+	/* These are keys that should be handled via WMI */
+	{ KE_KEY,    WIND_KEY_TURBO,            { KEY_PROG1 } },
+	{ KE_KEY,    WIND_KEY_ECO,              { KEY_PROG2 } },
+	{ KE_END, 0 }
 };
-static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
 
 static struct backlight_device *backlight;
 
@@ -64,6 +98,38 @@ static int backlight_map[] = { 0x00, 0x33, 0x66, 0x99, 0xCC, 0xFF };
 
 static struct input_dev *msi_wmi_input_dev;
 
+struct msi_wmi_table_entry {
+	const char *guid;
+	struct key_entry *keymap;
+
+	/* Some MSI laptops send lots of identical events for one key press
+	 * within short period of time. Set quirk_last_pressed to true if such
+	 * repeated events need to be filtered. All scan codes must be
+	 * sequential numbers. Set scancode_base to first of them and
+	 * scancode_count to their count
+	 */
+	bool quirk_last_pressed;
+	u32 scancode_base;
+	size_t scancode_count;
+};
+
+static struct msi_wmi_table_entry msi_wmi_table[] = {
+	{
+		.guid			= MSIWMI_MSI_EVENT_GUID,
+		.keymap			= msi_wmi_keymap,
+		.quirk_last_pressed	= true,
+		.scancode_base		= MSI_SCANCODE_BASE,
+		.scancode_count		= ARRAY_SIZE(msi_wmi_keymap)-1,
+	},
+	{
+		.guid			= MSIWMI_WIND_EVENT_GUID,
+		.keymap			= wind_wmi_keymap,
+	},
+	{}
+};
+
+static struct msi_wmi_table_entry *wmi;
+
 static int msi_wmi_query_block(int instance, int *ret)
 {
 	acpi_status status;
@@ -165,11 +231,15 @@ static void msi_wmi_notify(u32 value, void *context)
 		pr_debug("Eventcode: 0x%x\n", eventcode);
 		key = sparse_keymap_entry_from_scancode(msi_wmi_input_dev,
 				eventcode);
-		if (key) {
+		if (!key) {
+			pr_info("Unknown key pressed - %x\n", eventcode);
+			goto msi_wmi_notify_exit;
+		}
+		if (wmi->quirk_last_pressed) {
 			ktime_t diff;
 			cur = ktime_get_real();
 			diff = ktime_sub(cur, last_pressed[key->code -
-					SCANCODE_BASE]);
+					wmi->scancode_base]);
 			/* Ignore event if the same event happened in a 50 ms
 			   timeframe -> Key press may result in 10-20 GPEs */
 			if (ktime_to_us(diff) < 1000 * 50) {
@@ -178,21 +248,19 @@ static void msi_wmi_notify(u32 value, void *context)
 					 key->code, ktime_to_us(diff));
 				goto msi_wmi_notify_exit;
 			}
-			last_pressed[key->code - SCANCODE_BASE] = cur;
-
-			if (key->type == KE_KEY &&
-			/* Brightness is served via acpi video driver */
-			(!acpi_video_backlight_support() ||
-			(key->code != MSI_WMI_BRIGHTNESSUP &&
-			key->code != MSI_WMI_BRIGHTNESSDOWN))) {
-				pr_debug("Send key: 0x%X - "
-					 "Input layer keycode: %d\n",
-					 key->code, key->keycode);
-				sparse_keymap_report_entry(msi_wmi_input_dev,
-						key, 1, true);
-			}
-		} else
-			pr_info("Unknown key pressed - %x\n", eventcode);
+			last_pressed[key->code - wmi->scancode_base] = cur;
+		}
+
+		if (key->type == KE_KEY &&
+		/* Brightness is served via acpi video driver */
+		(!backlight ||
+		(key->keycode != KEY_BRIGHTNESSUP &&
+		key->keycode != KEY_BRIGHTNESSDOWN))) {
+			pr_debug("Send key: 0x%X - Input layer keycode: %d\n",
+				 key->code, key->keycode);
+			sparse_keymap_report_entry(msi_wmi_input_dev,
+					key, 1, true);
+		}
 	} else
 		pr_info("Unknown event received\n");
 
@@ -200,10 +268,45 @@ msi_wmi_notify_exit:
 	kfree(response.pointer);
 }
 
+static int __init msi_wmi_backlight_setup(void)
+{
+	int err;
+	struct backlight_properties props;
+
+	if (!wmi_has_guid(MSIWMI_BIOS_GUID) || acpi_video_backlight_support())
+		return -ENODEV;
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
 
+	if (wmi->quirk_last_pressed) {
+		last_pressed = kcalloc(wmi->scancode_count,
+			sizeof(last_pressed[0]), GFP_KERNEL);
+		if (!last_pressed)
+			return -ENOMEM;
+	}
+
 	msi_wmi_input_dev = input_allocate_device();
 	if (!msi_wmi_input_dev)
 		return -ENOMEM;
@@ -212,7 +315,7 @@ static int __init msi_wmi_input_setup(void)
 	msi_wmi_input_dev->phys = "wmi/input0";
 	msi_wmi_input_dev->id.bustype = BUS_HOST;
 
-	err = sparse_keymap_setup(msi_wmi_input_dev, msi_wmi_keymap, NULL);
+	err = sparse_keymap_setup(msi_wmi_input_dev, wmi->keymap, NULL);
 	if (err)
 		goto err_free_dev;
 
@@ -221,8 +324,6 @@ static int __init msi_wmi_input_setup(void)
 	if (err)
 		goto err_free_keymap;
 
-	memset(last_pressed, 0, sizeof(last_pressed));
-
 	return 0;
 
 err_free_keymap:
@@ -235,61 +336,59 @@ err_free_dev:
 static int __init msi_wmi_init(void)
 {
 	int err;
+	bool found = false;
+	size_t i;
+
+	for (i = 0; msi_wmi_table[i].guid; i++) {
+		if (wmi_has_guid(msi_wmi_table[i].guid)) {
+			found = true;
+			wmi = &msi_wmi_table[i];
+
+			err = msi_wmi_input_setup();
+			if (err) {
+				pr_err("Unable to setup input device\n");
+				wmi = NULL;
+				return err;
+			}
 
-	if (!wmi_has_guid(MSIWMI_EVENT_GUID)) {
-		pr_err("This machine doesn't have MSI-hotkeys through WMI\n");
-		return -ENODEV;
-	}
-	err = wmi_install_notify_handler(MSIWMI_EVENT_GUID,
-			msi_wmi_notify, NULL);
-	if (ACPI_FAILURE(err))
-		return -EINVAL;
+			err = wmi_install_notify_handler(wmi->guid,
+				msi_wmi_notify, NULL);
+			if (ACPI_FAILURE(err)) {
+				pr_err("Unable to setup WMI notify handler\n");
+				sparse_keymap_free(msi_wmi_input_dev);
+				input_unregister_device(msi_wmi_input_dev);
+				wmi = NULL;
+				return -EINVAL;
+			}
 
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
-			goto err_free_input;
+			pr_debug("Event handler installed\n");
+			break;
 		}
+	}
 
-		err = bl_get(NULL);
-		if (err < 0)
-			goto err_free_backlight;
+	if (!msi_wmi_backlight_setup()) {
+		found = true;
+		pr_debug("Backlight device created\n");
+	}
 
-		backlight->props.brightness = err;
+	if (!found) {
+		pr_err("This machine doesn't have neither MSI-hotkeys nor backlight through WMI\n");
+		return -ENODEV;
 	}
-	pr_debug("Event handler installed\n");
 
 	return 0;
-
-err_free_backlight:
-	backlight_device_unregister(backlight);
-err_free_input:
-	sparse_keymap_free(msi_wmi_input_dev);
-	input_unregister_device(msi_wmi_input_dev);
-err_uninstall_notifier:
-	wmi_remove_notify_handler(MSIWMI_EVENT_GUID);
-	return err;
 }
 
 static void __exit msi_wmi_exit(void)
 {
-	if (wmi_has_guid(MSIWMI_EVENT_GUID)) {
-		wmi_remove_notify_handler(MSIWMI_EVENT_GUID);
+	kfree(last_pressed);
+	if (wmi) {
+		wmi_remove_notify_handler(wmi->guid);
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
