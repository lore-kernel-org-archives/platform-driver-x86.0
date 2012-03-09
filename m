From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 1/3] asus-wmi: add scalar board brightness adj. support
Date: Fri,  9 Mar 2012 10:17:07 +0800
Message-ID: <1331259429-6216-2-git-send-email-acelan.kao@canonical.com>
References: <1331259429-6216-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:62787 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757812Ab2CICRU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Mar 2012 21:17:20 -0500
Received: by yhmm54 with SMTP id m54so650244yhm.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Mar 2012 18:17:19 -0800 (PST)
In-Reply-To: <1331259429-6216-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

Some of the ASUS ET2012 All-in-One machines that use a scalar board
to control the brightness, and it only accepts brightness up or down
comm. So, I introduced a get_scalar_command() function to pass the
command to the scalar board through WMI.

Besides, we have to store the brightness value locally, for we need the
old value to know the brightness is increasing or decreasing.

BTW, since there is no way to retrieve the actual brightness(it would be
a fixed value), and the max brightness value would be fixed to 1, so we
have to keep passing the brightness up/down command when we reached the
max brightness value or 0.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c  |   21 +++++++++++++++++++++
 drivers/platform/x86/asus-wmi.h  |    1 +
 drivers/platform/x86/eeepc-wmi.c |   13 +++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 72d731c..48e96f3 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1116,6 +1116,25 @@ static int read_brightness(struct backlight_device *bd)
 	return retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK;
 }
 
+static u32 get_scalar_command(struct backlight_device *bd)
+{
+	struct asus_wmi *asus = bl_get_data(bd);
+	u32 ctrl_param = 0;
+	static int brightness_old = -1;
+
+	if (brightness_old == -1)
+		brightness_old = bd->props.brightness;
+
+	if ((brightness_old < bd->props.brightness) || bd->props.brightness == read_brightness_max(asus))
+		ctrl_param = 0x00008001;
+	else if ((brightness_old > bd->props.brightness) || bd->props.brightness == 0)
+		ctrl_param = 0x00008000;
+
+	brightness_old = bd->props.brightness;
+
+	return ctrl_param;
+}
+
 static int update_bl_status(struct backlight_device *bd)
 {
 	struct asus_wmi *asus = bl_get_data(bd);
@@ -1123,6 +1142,8 @@ static int update_bl_status(struct backlight_device *bd)
 	int power, err;
 
 	ctrl_param = bd->props.brightness;
+	if (unlikely(asus->driver->scalar_panel_brightness))
+		ctrl_param = get_scalar_command (bd);
 
 	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BRIGHTNESS,
 				    ctrl_param, NULL);
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 8147c10..45fb62c 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -37,6 +37,7 @@ struct asus_wmi;
 
 struct asus_wmi_driver {
 	bool			hotplug_wireless;
+	bool			scalar_panel_brightness;
 	int			wapf;
 
 	const char		*name;
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 9f6e643..c5f4c64 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -161,11 +161,24 @@ static void eeepc_dmi_check(struct asus_wmi_driver *driver)
 		driver->hotplug_wireless = true;
 		pr_info("wlan hotplug enabled\n");
 	}
+
+	if (strncmp(model, "ET2012", 6) == 0) {
+		const struct dmi_device *dev = NULL;
+		char oemstring[30];
+		while ((dev = dmi_find_device(DMI_DEV_TYPE_OEM_STRING, NULL, dev))) {
+			if (sscanf(dev->name, "AEMS%24c", oemstring) == 1) {
+				if (oemstring[18] == '3')
+					driver->scalar_panel_brightness = true;
+				break;
+			}
+		}
+	}
 }
 
 static void eeepc_wmi_quirks(struct asus_wmi_driver *driver)
 {
 	driver->hotplug_wireless = hotplug_wireless;
+	driver->scalar_panel_brightness = false;
 	driver->wapf = -1;
 	eeepc_dmi_check(driver);
 }
-- 
1.7.9
