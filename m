From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH 3/3] asus-wmi: store backlight power status for AIO machine
Date: Fri,  9 Mar 2012 10:17:09 +0800
Message-ID: <1331259429-6216-4-git-send-email-acelan.kao@canonical.com>
References: <1331259429-6216-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:63089 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757812Ab2CICRa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 8 Mar 2012 21:17:30 -0500
Received: by gghe5 with SMTP id e5so656902ggh.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Mar 2012 18:17:29 -0800 (PST)
In-Reply-To: <1331259429-6216-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Corentin Chary <corentincj@iksaif.net>

Due to some implementation reasons, ASUS ET2012 All-in-One machines
can't report the correct backlight power status, it will always return
1. To track the backlight power status correctly, we have to store the
status by ourselves.

BTW, by the BIOS design, the backlight power will be turn on/off
sequently, no matter what the value of the parameter will be.
More over, the brightness adjustment command will turn on the backlight
power. Those behaviors will make us fail to track the backlight power
status.
For example, While we are trying to turn on the backlight power,
we will send out the brightness adjustment command and then trying to
figure out if we have to turn on the backlight power, then send out
the command. But, the real case is that, the backlight power turns on
while sending the brightness adjustment command, and then we send out
the command to turn on the backlight power, it actually will turn off
the backlight power and the backlight power status we recorded becomes
wrong. So, we have to seperate these two commands by a if statement.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/asus-wmi.c  |   32 +++++++++++++++++++-------------
 drivers/platform/x86/asus-wmi.h  |    2 ++
 drivers/platform/x86/eeepc-wmi.c |   10 ++++++++--
 3 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 80c05ff..35e1a96 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1075,7 +1075,11 @@ static int asus_wmi_hwmon_init(struct asus_wmi *asus)
  */
 static int read_backlight_power(struct asus_wmi *asus)
 {
-	int ret = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_BACKLIGHT);
+	int ret;
+	if (unlikely(asus->driver->store_backlight_power))
+		ret = !asus->driver->panel_power;
+	else
+		ret = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_BACKLIGHT);
 
 	if (ret < 0)
 		return ret;
@@ -1139,23 +1143,22 @@ static int update_bl_status(struct backlight_device *bd)
 {
 	struct asus_wmi *asus = bl_get_data(bd);
 	u32 ctrl_param;
-	int power, err;
-
-	ctrl_param = bd->props.brightness;
-	if (unlikely(asus->driver->scalar_panel_brightness))
-		ctrl_param = get_scalar_command (bd);
-
-	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BRIGHTNESS,
-				    ctrl_param, NULL);
-
-	if (err < 0)
-		return err;
+	int power, err = 0;
 
 	power = read_backlight_power(asus);
-	if (power != -ENODEV && bd->props.power != power) {
+	if (unlikely(power != -ENODEV && bd->props.power != power)) {
 		ctrl_param = !!(bd->props.power == FB_BLANK_UNBLANK);
 		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT,
 					    ctrl_param, NULL);
+		if (asus->driver->store_backlight_power)
+			asus->driver->panel_power = bd->props.power;
+	} else {
+		ctrl_param = bd->props.brightness;
+		if (unlikely(asus->driver->scalar_panel_brightness))
+			ctrl_param = get_scalar_command (bd);
+
+		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BRIGHTNESS,
+					    ctrl_param, NULL);
 	}
 	return err;
 }
@@ -1217,6 +1220,9 @@ static int asus_wmi_backlight_init(struct asus_wmi *asus)
 
 	asus->backlight_device = bd;
 
+	if (asus->driver->store_backlight_power)
+		asus->driver->panel_power = power;
+
 	bd->props.brightness = read_brightness(bd);
 	bd->props.power = power;
 	backlight_update_status(bd);
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index d6683ba..0203b9f 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -39,6 +39,8 @@ struct asus_wmi_driver {
 	bool			hotplug_wireless;
 	bool			scalar_panel_brightness;
 	bool			need_brightness_event;
+	bool			store_backlight_power;
+	int			panel_power;
 	int			wapf;
 
 	const char		*name;
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 311f317..568c293 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -32,6 +32,7 @@
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/dmi.h>
+#include <linux/fb.h>
 #include <acpi/acpi_bus.h>
 
 #include "asus-wmi.h"
@@ -169,10 +170,13 @@ static void eeepc_dmi_check(struct asus_wmi_driver *driver)
 		char oemstring[30];
 		while ((dev = dmi_find_device(DMI_DEV_TYPE_OEM_STRING, NULL, dev))) {
 			if (sscanf(dev->name, "AEMS%24c", oemstring) == 1) {
-				if (oemstring[18] == '1')
+				if (oemstring[18] == '1') {
 					driver->need_brightness_event = true;
-				else if (oemstring[18] == '3')
+					driver->store_backlight_power = true;
+				} else if (oemstring[18] == '3') {
 					driver->scalar_panel_brightness = true;
+					driver->store_backlight_power = true;
+				}
 				break;
 			}
 		}
@@ -184,6 +188,8 @@ static void eeepc_wmi_quirks(struct asus_wmi_driver *driver)
 	driver->hotplug_wireless = hotplug_wireless;
 	driver->scalar_panel_brightness = false;
 	driver->need_brightness_event = false;
+	driver->store_backlight_power = false;
+	driver->panel_power = FB_BLANK_UNBLANK;
 	driver->wapf = -1;
 	eeepc_dmi_check(driver);
 }
-- 
1.7.9
