From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 1/2] asus-wmi: add scalar board brightness adj. support
Date: Thu, 15 Mar 2012 16:51:19 +0800
Message-ID: <1331801480-20664-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:58228 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760782Ab2COIv0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Mar 2012 04:51:26 -0400
Received: by dadp12 with SMTP id p12so4523916dad.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Mar 2012 01:51:26 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

Some ASUS ET2012E/I All-in-One machines that use a scalar board
to control the brightness, and they only accept brightness up and down
command. So, I introduced a get_scalar_command() function to pass the
command to the scalar board through WMI.

Besides, we have to store the brightness value locally, for we need the
old value to know the brightness value is increasing or decreasing.

BTW, since there is no way to retrieve the actual brightness(it would be
a fixed value), and the max brightness value would be fixed to 1, so we
have to keep passing the brightness up/down command when we reached the
max brightness value or 0.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c  |   26 +++++++++++-
 drivers/platform/x86/asus-wmi.h  |    8 +++-
 drivers/platform/x86/eeepc-wmi.c |   81 ++++++++++++++++++++++++++-----------
 3 files changed, 87 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 72d731c..584db8a 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -784,7 +784,7 @@ static int asus_new_rfkill(struct asus_wmi *asus,
 	arfkill->dev_id = dev_id;
 	arfkill->asus = asus;
 
-	if (dev_id == ASUS_WMI_DEVID_WLAN && asus->driver->hotplug_wireless)
+	if (dev_id == ASUS_WMI_DEVID_WLAN && asus->driver->asus_quirks->hotplug_wireless)
 		*rfkill = rfkill_alloc(name, &asus->platform_device->dev, type,
 				       &asus_rfkill_wlan_ops, arfkill);
 	else
@@ -895,7 +895,7 @@ static int asus_wmi_rfkill_init(struct asus_wmi *asus)
 	if (result && result != -ENODEV)
 		goto exit;
 
-	if (!asus->driver->hotplug_wireless)
+	if (!asus->driver->asus_quirks->hotplug_wireless)
 		goto exit;
 
 	result = asus_setup_pci_hotplug(asus);
@@ -1116,13 +1116,31 @@ static int read_brightness(struct backlight_device *bd)
 	return retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK;
 }
 
+static u32 get_scalar_command(struct backlight_device *bd)
+{
+	struct asus_wmi *asus = bl_get_data(bd);
+	u32 ctrl_param = 0;
+
+	if ((asus->driver->brightness_old < bd->props.brightness) || bd->props.brightness == bd->props.max_brightness)
+		ctrl_param = 0x00008001;
+	else if ((asus->driver->brightness_old > bd->props.brightness) || bd->props.brightness == 0)
+		ctrl_param = 0x00008000;
+
+	asus->driver->brightness_old = bd->props.brightness;
+
+	return ctrl_param;
+}
+
 static int update_bl_status(struct backlight_device *bd)
 {
 	struct asus_wmi *asus = bl_get_data(bd);
 	u32 ctrl_param;
 	int power, err;
 
-	ctrl_param = bd->props.brightness;
+	if (unlikely(asus->driver->asus_quirks->scalar_panel_brightness))
+		ctrl_param = get_scalar_command (bd);
+	else
+		ctrl_param = bd->props.brightness;
 
 	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BRIGHTNESS,
 				    ctrl_param, NULL);
@@ -1200,6 +1218,8 @@ static int asus_wmi_backlight_init(struct asus_wmi *asus)
 	bd->props.power = power;
 	backlight_update_status(bd);
 
+	asus->driver->brightness_old = bd->props.brightness;
+
 	return 0;
 }
 
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 8147c10..c593d05 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -35,9 +35,14 @@ struct module;
 struct key_entry;
 struct asus_wmi;
 
+struct quirk_entry {
+	bool hotplug_wireless;
+	bool scalar_panel_brightness;
+};
+
 struct asus_wmi_driver {
-	bool			hotplug_wireless;
 	int			wapf;
+	int			brightness_old;
 
 	const char		*name;
 	struct module		*owner;
@@ -47,6 +52,7 @@ struct asus_wmi_driver {
 	const struct key_entry	*keymap;
 	const char		*input_name;
 	const char		*input_phys;
+	struct quirk_entry	*asus_quirks;
 	/* Returns new code, value, and autorelease values in arguments.
 	 * Return ASUS_WMI_KEY_IGNORE in code if event should be ignored. */
 	void (*key_filter) (struct asus_wmi_driver *driver, int *code,
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 9f6e643..83c33a6 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -48,6 +48,7 @@ MODULE_LICENSE("GPL");
 
 MODULE_ALIAS("wmi:"EEEPC_WMI_EVENT_GUID);
 
+static struct asus_wmi_driver *asus_wmi;
 static bool hotplug_wireless;
 
 module_param(hotplug_wireless, bool, 0444);
@@ -87,6 +88,58 @@ static const struct key_entry eeepc_wmi_keymap[] = {
 	{ KE_END, 0},
 };
 
+static struct quirk_entry quirk_asus_unknown = {
+};
+
+static struct quirk_entry quirk_asus_1000h = {
+	.hotplug_wireless = true,
+};
+
+static struct quirk_entry quirk_asus_et2012_type3 = {
+	.scalar_panel_brightness = true,
+};
+
+static int dmi_matched(const struct dmi_system_id *dmi)
+{
+	char *model;
+	asus_wmi->asus_quirks = dmi->driver_data;
+
+	model = (char *)dmi->matches[1].substr;
+	if (unlikely(strncmp(model, "ET2012", 6) == 0)) {
+		const struct dmi_device *dev = NULL;
+		char oemstring[30];
+		while ((dev = dmi_find_device(DMI_DEV_TYPE_OEM_STRING, NULL, dev))) {
+			if (sscanf(dev->name, "AEMS%24c", oemstring) == 1) {
+				if (oemstring[18] == '3')
+					asus_wmi->asus_quirks = &quirk_asus_et2012_type3;
+				break;
+			}
+		}
+	}
+	return 1;
+}
+
+static struct dmi_system_id __devinitdata asus_quirks[] = {
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK Computer INC. 1000H",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "1000H"),
+		},
+		.driver_data = &quirk_asus_1000h,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUSTeK Computer INC. ET2012E/I",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ET2012"),
+		},
+		.driver_data = &quirk_asus_unknown,
+	},
+};
+
 static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
 				 unsigned int *value, bool *autorelease)
 {
@@ -141,33 +194,13 @@ static int eeepc_wmi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void eeepc_dmi_check(struct asus_wmi_driver *driver)
-{
-	const char *model;
-
-	model = dmi_get_system_info(DMI_PRODUCT_NAME);
-	if (!model)
-		return;
-
-	/*
-	 * Whitelist for wlan hotplug
-	 *
-	 * Asus 1000H needs the current hotplug code to handle
-	 * Fn+F2 correctly. We may add other Asus here later, but
-	 * it seems that most of the laptops supported by asus-wmi
-	 * don't need to be on this list
-	 */
-	if (strcmp(model, "1000H") == 0) {
-		driver->hotplug_wireless = true;
-		pr_info("wlan hotplug enabled\n");
-	}
-}
-
 static void eeepc_wmi_quirks(struct asus_wmi_driver *driver)
 {
-	driver->hotplug_wireless = hotplug_wireless;
+	asus_wmi = driver;
 	driver->wapf = -1;
-	eeepc_dmi_check(driver);
+	driver->asus_quirks = &quirk_asus_unknown;
+	driver->asus_quirks->hotplug_wireless = hotplug_wireless;
+	dmi_check_system(asus_quirks);
 }
 
 static struct asus_wmi_driver asus_wmi_driver = {
-- 
1.7.9.1
