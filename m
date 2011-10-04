From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] dell-laptop: support Synaptics/Alps touchpad led
Date: Tue,  4 Oct 2011 13:28:30 +0800
Message-ID: <1317706110-7199-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:34279 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900Ab1JDF2e (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 4 Oct 2011 01:28:34 -0400
Received: by gyg10 with SMTP id 10so120114gyg.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Oct 2011 22:28:34 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

This patch supports Dell laptop with Synaptics and Alps touchpad chip
that with LED to indicate the functionality of touchpad is disabled or
enabled.

The command for touchpad LED is 0x97, and the data 1 means turn on the
touchpad LED, 2 means turn it off.

BTW, I add dell_quirks to white list those machines that supports this
behavior, so that the code won't affect those who don't have a touchpad LED
machine.

We can easily to turn it on/off by
   echo 1 > /sys/class/leds/dell-laptop::touchpad/brightness
   echo 0 > /sys/class/leds/dell-laptop::touchpad/brightness

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/dell-laptop.c |   82 ++++++++++++++++++++++++++++++++++++
 1 files changed, 82 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f31fa4e..e40da74 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -60,6 +60,22 @@ struct calling_interface_structure {
 	struct calling_interface_token tokens[];
 } __packed;
 
+struct quirk_entry {
+	u8 touchpad_led;
+};
+
+static struct quirk_entry *quirks;
+
+static struct quirk_entry quirk_dell_vostro_v130= {
+	.touchpad_led= 1,
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
@@ -149,6 +165,27 @@ static struct dmi_system_id __devinitdata dell_blacklist[] = {
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
@@ -552,6 +589,44 @@ static const struct backlight_ops dell_ops = {
 	.update_status  = dell_send_intensity,
 };
 
+static void touchpad_led_on()
+{
+	int command= 0x97;
+	char data= 1;
+	i8042_command ( &data, command | 1 << 12);
+}
+
+static void touchpad_led_off()
+{
+	int command= 0x97;
+	char data= 2;
+	i8042_command ( &data, command | 1 << 12);
+}
+
+static void touchpad_led_set(struct led_classdev *led_cdev,
+	enum led_brightness value)
+{
+	if (value > 0)
+		touchpad_led_on();
+	else
+		touchpad_led_off();
+}
+
+static struct led_classdev touchpad_led = {
+	.name = "dell-laptop::touchpad",
+	.brightness_set = touchpad_led_set,
+};
+
+static int __devinit touchpad_led_init(struct device *dev)
+{
+	return led_classdev_register(dev, &touchpad_led);
+}
+
+static void touchpad_led_exit(void)
+{
+	led_classdev_unregister(&touchpad_led);
+}
+
 static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
 			      struct serio *port)
 {
@@ -584,6 +659,9 @@ static int __init dell_init(void)
 	if (!dmi_check_system(dell_device_table))
 		return -ENODEV;
 
+	quirks = NULL;
+	dmi_check_system(dell_quirks); /* find if this machine support other functions */
+
 	dmi_walk(find_tokens, NULL);
 
 	if (!da_tokens)  {
@@ -626,6 +704,9 @@ static int __init dell_init(void)
 		goto fail_filter;
 	}
 
+	if(quirks && quirks->touchpad_led)
+		touchpad_led_init(&platform_device->dev);
+
 	dell_laptop_dir = debugfs_create_dir("dell_laptop", NULL);
 	if (dell_laptop_dir != NULL)
 		debugfs_create_file("rfkill", 0444, dell_laptop_dir, NULL,
@@ -692,6 +773,7 @@ fail_platform_driver:
 static void __exit dell_exit(void)
 {
 	debugfs_remove_recursive(dell_laptop_dir);
+	touchpad_led_exit();
 	i8042_remove_filter(dell_laptop_i8042_filter);
 	cancel_delayed_work_sync(&dell_rfkill_work);
 	backlight_device_unregister(dell_backlight_device);
-- 
1.7.5.4
