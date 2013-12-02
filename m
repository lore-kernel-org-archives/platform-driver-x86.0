From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: [PATCH] dell-laptop: Add back rfkill code
Date: Mon, 2 Dec 2013 13:11:05 +0100
Message-ID: <20131202121104.GA5687@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:30539 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753237Ab3LBML6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 2 Dec 2013 07:11:58 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

This is basically a revert of:

commit a6c2390cd6d2083d27a2359658e08f2d3df375ac
Author: Matthew Garrett <mjg@redhat.com>
Date:   Fri Jun 1 12:46:56 2012 -0400

    dell-laptop: Remove rfkill code

Except that patch add whilelist of Dell systems where dell-laptop
specific RFKILL code is needed. For now, patch only add "Dell Latitude
6430U" laptop to whitelist, in the future other systems probably
will be added.

Resolves:
https://bugzilla.redhat.com/show_bug.cgi?id=958826

Reported-and-tested-by: Marco Driusso <marcodriusso@gmail.com>
Reported-and-tested-by: Fabien Archambault <marbolangos@gmail.com>
Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
---
Patch is quite big, but it should probably be addressed to -stable.
I'm leaving that decision up to maintainer.

 drivers/platform/x86/dell-laptop.c | 250 +++++++++++++++++++++++++++++++++++++
 1 file changed, 250 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index bb77e18..e210819 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -21,6 +21,7 @@
 #include <linux/err.h>
 #include <linux/dmi.h>
 #include <linux/io.h>
+#include <linux/rfkill.h>
 #include <linux/power_supply.h>
 #include <linux/acpi.h>
 #include <linux/mm.h>
@@ -89,6 +90,9 @@ static struct platform_driver platform_driver = {
 
 static struct platform_device *platform_device;
 static struct backlight_device *dell_backlight_device;
+static struct rfkill *wifi_rfkill;
+static struct rfkill *bluetooth_rfkill;
+static struct rfkill *wwan_rfkill;
 
 static const struct dmi_system_id dell_device_table[] __initconst = {
 	{
@@ -263,6 +267,17 @@ static struct dmi_system_id dell_quirks[] = {
 	{ }
 };
 
+/* List of systems that need Dell specific RFKILL handling */
+static struct dmi_system_id dell_rfkill_whitelist[] = {
+	{
+		.ident = "Dell Latitude 6430U",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude 6430U"),
+		},
+	},
+};
+
 static struct calling_interface_buffer *buffer;
 static struct page *bufferpage;
 static DEFINE_MUTEX(buffer_mutex);
@@ -355,6 +370,94 @@ dell_send_request(struct calling_interface_buffer *buffer, int class,
 	return buffer;
 }
 
+/* Derived from information in DellWirelessCtl.cpp:
+   Class 17, select 11 is radio control. It returns an array of 32-bit values.
+
+   Input byte 0 = 0: Wireless information
+
+   result[0]: return code
+   result[1]:
+     Bit 0:      Hardware switch supported
+     Bit 1:      Wifi locator supported
+     Bit 2:      Wifi is supported
+     Bit 3:      Bluetooth is supported
+     Bit 4:      WWAN is supported
+     Bit 5:      Wireless keyboard supported
+     Bits 6-7:   Reserved
+     Bit 8:      Wifi is installed
+     Bit 9:      Bluetooth is installed
+     Bit 10:     WWAN is installed
+     Bits 11-15: Reserved
+     Bit 16:     Hardware switch is on
+     Bit 17:     Wifi is blocked
+     Bit 18:     Bluetooth is blocked
+     Bit 19:     WWAN is blocked
+     Bits 20-31: Reserved
+   result[2]: NVRAM size in bytes
+   result[3]: NVRAM format version number
+
+   Input byte 0 = 2: Wireless switch configuration
+   result[0]: return code
+   result[1]:
+     Bit 0:      Wifi controlled by switch
+     Bit 1:      Bluetooth controlled by switch
+     Bit 2:      WWAN controlled by switch
+     Bits 3-6:   Reserved
+     Bit 7:      Wireless switch config locked
+     Bit 8:      Wifi locator enabled
+     Bits 9-14:  Reserved
+     Bit 15:     Wifi locator setting locked
+     Bits 16-31: Reserved
+*/
+
+static int dell_rfkill_set(void *data, bool blocked)
+{
+	int disable = blocked ? 1 : 0;
+	unsigned long radio = (unsigned long)data;
+	int hwswitch_bit = (unsigned long)data - 1;
+	int ret = 0;
+
+	get_buffer();
+	dell_send_request(buffer, 17, 11);
+
+	/* If the hardware switch controls this radio, and the hardware
+	   switch is disabled, don't allow changing the software state */
+	if ((hwswitch_state & BIT(hwswitch_bit)) &&
+	    !(buffer->output[1] & BIT(16))) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	buffer->input[0] = (1 | (radio<<8) | (disable << 16));
+	dell_send_request(buffer, 17, 11);
+
+out:
+	release_buffer();
+	return ret;
+}
+
+static void dell_rfkill_query(struct rfkill *rfkill, void *data)
+{
+	int status;
+	int bit = (unsigned long)data + 16;
+	int hwswitch_bit = (unsigned long)data - 1;
+
+	get_buffer();
+	dell_send_request(buffer, 17, 11);
+	status = buffer->output[1];
+	release_buffer();
+
+	rfkill_set_sw_state(rfkill, !!(status & BIT(bit)));
+
+	if (hwswitch_state & (BIT(hwswitch_bit)))
+		rfkill_set_hw_state(rfkill, !(status & BIT(16)));
+}
+
+static const struct rfkill_ops dell_rfkill_ops = {
+	.set_block = dell_rfkill_set,
+	.query = dell_rfkill_query,
+};
+
 static struct dentry *dell_laptop_dir;
 
 static int dell_debugfs_show(struct seq_file *s, void *data)
@@ -424,6 +527,105 @@ static const struct file_operations dell_debugfs_fops = {
 	.release = single_release,
 };
 
+static void dell_update_rfkill(struct work_struct *ignored)
+{
+	if (wifi_rfkill)
+		dell_rfkill_query(wifi_rfkill, (void *)1);
+	if (bluetooth_rfkill)
+		dell_rfkill_query(bluetooth_rfkill, (void *)2);
+	if (wwan_rfkill)
+		dell_rfkill_query(wwan_rfkill, (void *)3);
+}
+static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
+
+static int __init dell_setup_rfkill(void)
+{
+	int status;
+	int ret;
+
+	if (!dmi_check_system(dell_rfkill_whitelist))
+		return 0;
+
+	get_buffer();
+	dell_send_request(buffer, 17, 11);
+	status = buffer->output[1];
+	buffer->input[0] = 0x2;
+	dell_send_request(buffer, 17, 11);
+	hwswitch_state = buffer->output[1];
+	release_buffer();
+
+	if ((status & (1<<2|1<<8)) == (1<<2|1<<8)) {
+		wifi_rfkill = rfkill_alloc("dell-wifi", &platform_device->dev,
+					   RFKILL_TYPE_WLAN,
+					   &dell_rfkill_ops, (void *) 1);
+		if (!wifi_rfkill) {
+			ret = -ENOMEM;
+			goto err_wifi;
+		}
+		ret = rfkill_register(wifi_rfkill);
+		if (ret)
+			goto err_wifi;
+	}
+
+	if ((status & (1<<3|1<<9)) == (1<<3|1<<9)) {
+		bluetooth_rfkill = rfkill_alloc("dell-bluetooth",
+						&platform_device->dev,
+						RFKILL_TYPE_BLUETOOTH,
+						&dell_rfkill_ops, (void *) 2);
+		if (!bluetooth_rfkill) {
+			ret = -ENOMEM;
+			goto err_bluetooth;
+		}
+		ret = rfkill_register(bluetooth_rfkill);
+		if (ret)
+			goto err_bluetooth;
+	}
+
+	if ((status & (1<<4|1<<10)) == (1<<4|1<<10)) {
+		wwan_rfkill = rfkill_alloc("dell-wwan",
+					   &platform_device->dev,
+					   RFKILL_TYPE_WWAN,
+					   &dell_rfkill_ops, (void *) 3);
+		if (!wwan_rfkill) {
+			ret = -ENOMEM;
+			goto err_wwan;
+		}
+		ret = rfkill_register(wwan_rfkill);
+		if (ret)
+			goto err_wwan;
+	}
+
+	return 0;
+err_wwan:
+	rfkill_destroy(wwan_rfkill);
+	if (bluetooth_rfkill)
+		rfkill_unregister(bluetooth_rfkill);
+err_bluetooth:
+	rfkill_destroy(bluetooth_rfkill);
+	if (wifi_rfkill)
+		rfkill_unregister(wifi_rfkill);
+err_wifi:
+	rfkill_destroy(wifi_rfkill);
+
+	return ret;
+}
+
+static void dell_cleanup_rfkill(void)
+{
+	if (wifi_rfkill) {
+		rfkill_unregister(wifi_rfkill);
+		rfkill_destroy(wifi_rfkill);
+	}
+	if (bluetooth_rfkill) {
+		rfkill_unregister(bluetooth_rfkill);
+		rfkill_destroy(bluetooth_rfkill);
+	}
+	if (wwan_rfkill) {
+		rfkill_unregister(wwan_rfkill);
+		rfkill_destroy(wwan_rfkill);
+	}
+}
+
 static int dell_send_intensity(struct backlight_device *bd)
 {
 	int ret = 0;
@@ -515,6 +717,30 @@ static void touchpad_led_exit(void)
 	led_classdev_unregister(&touchpad_led);
 }
 
+static bool dell_laptop_i8042_filter(unsigned char data, unsigned char str,
+			      struct serio *port)
+{
+	static bool extended;
+
+	if (str & 0x20)
+		return false;
+
+	if (unlikely(data == 0xe0)) {
+		extended = true;
+		return false;
+	} else if (unlikely(extended)) {
+		switch (data) {
+		case 0x8:
+			schedule_delayed_work(&dell_rfkill_work,
+					      round_jiffies_relative(HZ));
+			break;
+		}
+		extended = false;
+	}
+
+	return false;
+}
+
 static int __init dell_init(void)
 {
 	int max_intensity = 0;
@@ -557,10 +783,26 @@ static int __init dell_init(void)
 	}
 	buffer = page_address(bufferpage);
 
+	ret = dell_setup_rfkill();
+
+	if (ret) {
+		pr_warn("Unable to setup rfkill\n");
+		goto fail_rfkill;
+	}
+
+	ret = i8042_install_filter(dell_laptop_i8042_filter);
+	if (ret) {
+		pr_warn("Unable to install key filter\n");
+		goto fail_filter;
+	}
+
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_init(&platform_device->dev);
 
 	dell_laptop_dir = debugfs_create_dir("dell_laptop", NULL);
+	if (dell_laptop_dir != NULL)
+		debugfs_create_file("rfkill", 0444, dell_laptop_dir, NULL,
+				    &dell_debugfs_fops);
 
 #ifdef CONFIG_ACPI
 	/* In the event of an ACPI backlight being available, don't
@@ -603,6 +845,11 @@ static int __init dell_init(void)
 	return 0;
 
 fail_backlight:
+	i8042_remove_filter(dell_laptop_i8042_filter);
+	cancel_delayed_work_sync(&dell_rfkill_work);
+fail_filter:
+	dell_cleanup_rfkill();
+fail_rfkill:
 	free_page((unsigned long)bufferpage);
 fail_buffer:
 	platform_device_del(platform_device);
@@ -620,7 +867,10 @@ static void __exit dell_exit(void)
 	debugfs_remove_recursive(dell_laptop_dir);
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_exit();
+	i8042_remove_filter(dell_laptop_i8042_filter);
+	cancel_delayed_work_sync(&dell_rfkill_work);
 	backlight_device_unregister(dell_backlight_device);
+	dell_cleanup_rfkill();
 	if (platform_device) {
 		platform_device_unregister(platform_device);
 		platform_driver_unregister(&platform_driver);
-- 
1.8.3.1
