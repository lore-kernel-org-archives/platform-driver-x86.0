From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] dell-laptop: support Synaptics/Alps touchpad led
Date: Thu, 18 Aug 2011 17:04:08 +0800
Message-ID: <1313658248-6964-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:46491 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755358Ab1HRJEN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Aug 2011 05:04:13 -0400
Received: by gya6 with SMTP id 6so1329032gya.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Aug 2011 02:04:12 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

This patch can support Dell laptop with Synaptics and Alps touchpad chip
that with LED to indicate the functionality of touchpad is disabled or
enabled.

The following code comes from ODM engineer they say the low level
implementation to turn on/off the touchpad LED is the same for both chips.
out 0x64,0x97 ;set 0x97 to command port;0x64 is command port
out 0x60,0x01 ;set 0x01 to data port then make LED bright;0x60 is data port
out 0x60,0x02 ;set 0x02 to data port then make LED dark

Before you send the action to the port, you must make sure the Input buffer
is empty (port 0x64).

BTW, I add dell_quirks to white list those machines that supports this
behavior, so that the code won't affect those who don't have a touchpad LED
machine.

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/dell-laptop.c |  146 ++++++++++++++++++++++++++++++++++--
 1 files changed, 138 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f31fa4e..b289d24 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -29,6 +29,7 @@
 #include <linux/slab.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
+#include <linux/delay.h>
 #include "../../firmware/dcdbas.h"
 
 #define BRIGHTNESS_TOKEN 0x7d
@@ -60,24 +61,34 @@ struct calling_interface_structure {
 	struct calling_interface_token tokens[];
 } __packed;
 
+struct quirk_entry {
+	u8 touchpad_led;
+};
+
+static struct quirk_entry *quirks;
+
+static struct quirk_entry quirk_dell_vostro_v130 = {
+	.touchpad_led = 1,
+};
+
+static int dmi_matched(const struct dmi_system_id *dmi)
+{
+	quirks = dmi->driver_data;
+	return 1;
+}
+
 static int da_command_address;
 static int da_command_code;
 static int da_num_tokens;
 static struct calling_interface_token *da_tokens;
-
-static struct platform_driver platform_driver = {
-	.driver = {
-		.name = "dell-laptop",
-		.owner = THIS_MODULE,
-	}
-};
-
 static struct platform_device *platform_device;
 static struct backlight_device *dell_backlight_device;
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
 
+static struct delayed_work dell_touchpadled_update_work;
+static int touchpad_led_status;
 static const struct dmi_system_id __initdata dell_device_table[] = {
 	{
 		.ident = "Dell laptop",
@@ -149,6 +160,27 @@ static struct dmi_system_id __devinitdata dell_blacklist[] = {
 	{}
 };
 
+static struct dmi_system_id __devinitdata dell_quirks[] = {
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Vostro V130",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V130"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Vostro V131",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
+};
+
 static struct calling_interface_buffer *buffer;
 static struct page *bufferpage;
 static DEFINE_MUTEX(buffer_mutex);
@@ -552,6 +584,45 @@ static const struct backlight_ops dell_ops = {
 	.update_status  = dell_send_intensity,
 };
 
+static void dell_touchpadled_on()
+{
+	while (inb(0x64) & 0x02)
+		msleep(20);
+	outb(0x97, 0x64);
+
+	while (inb(0x64) & 0x02)
+		msleep(20);
+	outb(1, 0x60);
+
+	touchpad_led_status = 1;
+}
+
+static void dell_touchpadled_off()
+{
+	while (inb(0x64) & 0x02)
+		msleep(20);
+	outb(0x97, 0x64);
+
+	while (inb(0x64) & 0x02)
+		msleep(20);
+	outb(2, 0x60);
+
+	touchpad_led_status = 0;
+}
+
+/*
+ * Called for each KEY_F22 key press event.
+ */
+static void dell_touchpadled_update(struct work_struct *work)
+{
+	touchpad_led_status = 1 - touchpad_led_status;
+
+	if (touchpad_led_status == 1)
+		dell_touchpadled_on();
+	else
+		dell_touchpadled_off();
+}
+
 static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
 			      struct serio *port)
 {
@@ -569,6 +640,12 @@ static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
 			schedule_delayed_work(&dell_rfkill_work,
 					      round_jiffies_relative(HZ));
 			break;
+		case 0x1E:
+			if (quirks && quirks->touchpad_led)
+				schedule_delayed_work(
+						&dell_touchpadled_update_work,
+						0);
+			break;
 		}
 		extended = false;
 	}
@@ -576,6 +653,55 @@ static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
 	return false;
 }
 
+static void restore_touchpad_led()
+{
+	touchpad_led_status = 1 - touchpad_led_status;
+	schedule_delayed_work(&dell_touchpadled_update_work, 1000);
+}
+
+static int __devinit dell_laptop_probe(struct platform_device *device)
+{
+	if (quirks && quirks->touchpad_led)
+		INIT_DELAYED_WORK(&dell_touchpadled_update_work,
+				  dell_touchpadled_update);
+
+	return 0;
+}
+
+static int dell_laptop_remove(struct platform_device *device)
+{
+	return 0;
+}
+
+static int dell_laptop_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int dell_laptop_resume(struct device *dev)
+{
+	if (quirks && quirks->touchpad_led)
+		restore_touchpad_led();
+
+	return 0;
+}
+
+static const struct dev_pm_ops dell_laptop_pm_ops = {
+	.suspend = dell_laptop_suspend,
+	.resume  = dell_laptop_resume,
+	.restore = dell_laptop_resume,
+};
+
+static struct platform_driver platform_driver = {
+	.driver = {
+		.name = "dell-laptop",
+		.owner = THIS_MODULE,
+		.pm    = &dell_laptop_pm_ops,
+	},
+	.probe  = dell_laptop_probe,
+	.remove = dell_laptop_remove,
+};
+
 static int __init dell_init(void)
 {
 	int max_intensity = 0;
@@ -584,6 +710,10 @@ static int __init dell_init(void)
 	if (!dmi_check_system(dell_device_table))
 		return -ENODEV;
 
+	quirks = NULL;
+	/* find if this machine support other functions */
+	dmi_check_system(dell_quirks);
+
 	dmi_walk(find_tokens, NULL);
 
 	if (!da_tokens)  {
-- 
1.7.5.4
