From: AceLan Kao <acelan.kao@canonical.com>
Subject: [PATCH] dell-laptop: support synaptics touchpad led
Date: Wed,  1 Jun 2011 16:34:48 +0800
Message-ID: <1306917288-8531-1-git-send-email-acelan.kao@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:63958 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1162377Ab1FAIex (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jun 2011 04:34:53 -0400
Received: by pzk9 with SMTP id 9so2409412pzk.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jun 2011 01:34:53 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

The TP-LOCK-LED would bright while TP-disablement.
You can implement 97 command services routing of P/S2 device.
Code like below:
out 0x64,0x97 ;set 0x97 to command port;0x64 is command port
out 0x60,0x01 ;set 0x01 to data port then make LED bright;0x60 is data port
out 0x60,0x02 ;set 0x02 to data port then make LED dark

Before you send the action to the port, you must make sure the Input buffer
is empty (port 0x64).

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/platform/x86/dell-laptop.c |  105 +++++++++++++++++++++++++++++++++---
 1 files changed, 98 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index d3841de..65efa74 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -65,19 +65,14 @@ static int da_command_code;
 static int da_num_tokens;
 static struct calling_interface_token *da_tokens;
 
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
@@ -572,6 +567,45 @@ static const struct backlight_ops dell_ops = {
 	.update_status  = dell_send_intensity,
 };
 
+static void dell_touchpadled_on(void)
+{
+	while (inb(0x64) & 0x02)
+		udelay(100);
+	outb(0x97 , 0x64);
+
+	while (inb(0x64) & 0x02)
+		udelay(100);
+	outb(1, 0x60);
+
+	touchpad_led_status = 1;
+}
+
+static void dell_touchpadled_off(void)
+{
+	while (inb(0x64) & 0x02)
+		udelay(100);
+	outb(0x97 , 0x64);
+
+	while (inb(0x64) & 0x02)
+		udelay(100);
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
@@ -589,6 +623,10 @@ static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
 			schedule_delayed_work(&dell_rfkill_work,
 					      round_jiffies_relative(HZ));
 			break;
+		case 0x1E:	/* F22 */
+			schedule_delayed_work(&dell_touchpadled_update_work,
+					      0);
+			break;
 		}
 		extended = false;
 	}
@@ -596,11 +634,64 @@ static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
 	return false;
 }
 
+static void restore_touchpad_led(void)
+{
+	/*
+	 * We don't want to change the value of touchpad_led_status while
+	 * resuming, so we modify the value here and it'll be changed back
+	 * in the work queue
+	 */
+	touchpad_led_status = 1 - touchpad_led_status;
+	/* The delay is needed to wait the chip wake up */
+	schedule_delayed_work(&dell_touchpadled_update_work, 1000);
+}
+
+static int __devinit dell_laptop_probe(struct platform_device *device)
+{
+	INIT_DELAYED_WORK(&dell_touchpadled_update_work,
+			  dell_touchpadled_update);
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
+	restore_touchpad_led();
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
 	int ret;
 
+	touchpad_led_status = 0;
+
 	if (!dmi_check_system(dell_device_table))
 		return -ENODEV;
 
-- 
1.7.4.1
