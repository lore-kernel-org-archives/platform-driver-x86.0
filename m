From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v4 09/14] platform/x86: dell-smbios: Introduce dispatcher for SMM calls
Date: Wed,  4 Oct 2017 17:48:35 -0500
Message-ID: <151b8e5bb0be0a9ef88282581d441a4211465ae7.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1507156392.git.mario.limonciello@dell.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

This splits up the dell-smbios driver into two drivers:
* dell-smbios
* dell-smbios-smm

dell-smbios can operate with multiple different dispatcher drivers to
perform SMBIOS operations.

Also modify the interface that dell-laptop and dell-wmi use align to this
model more closely.  Rather than a single global buffer being allocated
for all drivers, each driver will allocate and be responsible for it's own
buffer. The pointer will be passed to the calling function and each
dispatcher driver will then internally copy it to the proper location to
perform it's call.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 MAINTAINERS                            |   6 ++
 drivers/platform/x86/Kconfig           |  17 ++-
 drivers/platform/x86/Makefile          |   1 +
 drivers/platform/x86/dell-laptop.c     | 191 ++++++++++++++++-----------------
 drivers/platform/x86/dell-smbios-smm.c | 136 +++++++++++++++++++++++
 drivers/platform/x86/dell-smbios-smm.h |  22 ++++
 drivers/platform/x86/dell-smbios.c     | 120 +++++++++++++--------
 drivers/platform/x86/dell-smbios.h     |  13 ++-
 drivers/platform/x86/dell-wmi.c        |   8 +-
 9 files changed, 361 insertions(+), 153 deletions(-)
 create mode 100644 drivers/platform/x86/dell-smbios-smm.c
 create mode 100644 drivers/platform/x86/dell-smbios-smm.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e3f2aea0370..a8fcb4a4e195 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3974,6 +3974,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/dell-smbios.*
 
+DELL SMBIOS SMM DRIVER
+M:	Mario Limonciello <mario.limonciello@dell.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/dell-smbios-smm.*
+
 DELL LAPTOP DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
 M:	Pali Rohár <pali.rohar@gmail.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index bc347c326d87..f0b97cb8e449 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -92,14 +92,27 @@ config ASUS_LAPTOP
 	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
 
 config DELL_SMBIOS
-	tristate
-	select DCDBAS
+	tristate "Dell SMBIOS calling interface"
+	depends on DELL_SMBIOS_SMM
 	---help---
 	This module provides common functions for kernel modules using
 	Dell SMBIOS.
 
 	If you have a Dell laptop, say Y or M here.
 
+config DELL_SMBIOS_SMM
+	tristate "Dell SMBIOS calling interface (SMM implementation)"
+	depends on DCDBAS
+	default DCDBAS
+	select DELL_SMBIOS
+	---help---
+	This provides an implementation for the Dell SMBIOS calling interface
+	communicated over ACPI-WMI.
+
+	If you have a Dell computer from >2007 you should say Y or M here.
+	If you aren't sure and this module doesn't work for your computer
+	it just won't load.
+
 config DELL_LAPTOP
 	tristate "Dell Laptop Extras"
 	depends on DMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 8636f5d3424f..e743615241f8 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
 obj-$(CONFIG_ACPI_CMPC)		+= classmate-laptop.o
 obj-$(CONFIG_COMPAL_LAPTOP)	+= compal-laptop.o
 obj-$(CONFIG_DELL_SMBIOS)	+= dell-smbios.o
+obj-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
 obj-$(CONFIG_DELL_LAPTOP)	+= dell-laptop.o
 obj-$(CONFIG_DELL_WMI)		+= dell-wmi.o
 obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f42159fd2031..c648bbfcc394 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -85,6 +85,7 @@ static struct platform_driver platform_driver = {
 	}
 };
 
+static struct calling_interface_buffer *buffer;
 static struct platform_device *platform_device;
 static struct backlight_device *dell_backlight_device;
 static struct rfkill *wifi_rfkill;
@@ -405,7 +406,6 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
 
 static int dell_rfkill_set(void *data, bool blocked)
 {
-	struct calling_interface_buffer *buffer;
 	int disable = blocked ? 1 : 0;
 	unsigned long radio = (unsigned long)data;
 	int hwswitch_bit = (unsigned long)data - 1;
@@ -413,19 +413,21 @@ static int dell_rfkill_set(void *data, bool blocked)
 	int status;
 	int ret;
 
-	buffer = dell_smbios_get_buffer();
-
-	dell_smbios_send_request(17, 11);
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 17;
+	buffer->select = 11;
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 	status = buffer->output[1];
 
 	if (ret != 0)
 		goto out;
 
-	dell_smbios_clear_buffer();
-
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 17;
+	buffer->select = 11;
 	buffer->input[0] = 0x2;
-	dell_smbios_send_request(17, 11);
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 	hwswitch = buffer->output[1];
 
@@ -435,28 +437,29 @@ static int dell_rfkill_set(void *data, bool blocked)
 	    (status & BIT(0)) && !(status & BIT(16)))
 		disable = 1;
 
-	dell_smbios_clear_buffer();
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
 
 	buffer->input[0] = (1 | (radio<<8) | (disable << 16));
-	dell_smbios_send_request(17, 11);
+	buffer->class = 17;
+	buffer->select = 11;
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 
  out:
-	dell_smbios_release_buffer();
 	return dell_smbios_error(ret);
 }
 
-/* Must be called with the buffer held */
 static void dell_rfkill_update_sw_state(struct rfkill *rfkill, int radio,
-					int status,
-					struct calling_interface_buffer *buffer)
+					int status)
 {
 	if (status & BIT(0)) {
 		/* Has hw-switch, sync sw_state to BIOS */
 		int block = rfkill_blocked(rfkill);
-		dell_smbios_clear_buffer();
+		memset(buffer, 0, sizeof(struct calling_interface_buffer));
+		buffer->class = 17;
+		buffer->select = 11;
 		buffer->input[0] = (1 | (radio << 8) | (block << 16));
-		dell_smbios_send_request(17, 11);
+		dell_smbios_call(buffer);
 	} else {
 		/* No hw-switch, sync BIOS state to sw_state */
 		rfkill_set_sw_state(rfkill, !!(status & BIT(radio + 16)));
@@ -472,32 +475,30 @@ static void dell_rfkill_update_hw_state(struct rfkill *rfkill, int radio,
 
 static void dell_rfkill_query(struct rfkill *rfkill, void *data)
 {
-	struct calling_interface_buffer *buffer;
 	int radio = ((unsigned long)data & 0xF);
 	int hwswitch;
 	int status;
 	int ret;
 
-	buffer = dell_smbios_get_buffer();
-
-	dell_smbios_send_request(17, 11);
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 17;
+	buffer->select = 11;
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 	status = buffer->output[1];
 
 	if (ret != 0 || !(status & BIT(0))) {
-		dell_smbios_release_buffer();
 		return;
 	}
 
-	dell_smbios_clear_buffer();
-
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 17;
+	buffer->select = 11;
 	buffer->input[0] = 0x2;
-	dell_smbios_send_request(17, 11);
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 	hwswitch = buffer->output[1];
 
-	dell_smbios_release_buffer();
-
 	if (ret != 0)
 		return;
 
@@ -513,27 +514,26 @@ static struct dentry *dell_laptop_dir;
 
 static int dell_debugfs_show(struct seq_file *s, void *data)
 {
-	struct calling_interface_buffer *buffer;
 	int hwswitch_state;
 	int hwswitch_ret;
 	int status;
 	int ret;
 
-	buffer = dell_smbios_get_buffer();
-
-	dell_smbios_send_request(17, 11);
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 17;
+	buffer->select = 11;
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 	status = buffer->output[1];
 
-	dell_smbios_clear_buffer();
-
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 17;
+	buffer->select = 11;
 	buffer->input[0] = 0x2;
-	dell_smbios_send_request(17, 11);
+	dell_smbios_call(buffer);
 	hwswitch_ret = buffer->output[0];
 	hwswitch_state = buffer->output[1];
 
-	dell_smbios_release_buffer();
-
 	seq_printf(s, "return:\t%d\n", ret);
 	seq_printf(s, "status:\t0x%X\n", status);
 	seq_printf(s, "Bit 0 : Hardware switch supported:   %lu\n",
@@ -613,24 +613,25 @@ static const struct file_operations dell_debugfs_fops = {
 
 static void dell_update_rfkill(struct work_struct *ignored)
 {
-	struct calling_interface_buffer *buffer;
 	int hwswitch = 0;
 	int status;
 	int ret;
 
-	buffer = dell_smbios_get_buffer();
-
-	dell_smbios_send_request(17, 11);
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 17;
+	buffer->select = 11;
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 	status = buffer->output[1];
 
 	if (ret != 0)
-		goto out;
-
-	dell_smbios_clear_buffer();
+		return;
 
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 17;
+	buffer->select = 11;
 	buffer->input[0] = 0x2;
-	dell_smbios_send_request(17, 11);
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 
 	if (ret == 0 && (status & BIT(0)))
@@ -638,21 +639,17 @@ static void dell_update_rfkill(struct work_struct *ignored)
 
 	if (wifi_rfkill) {
 		dell_rfkill_update_hw_state(wifi_rfkill, 1, status, hwswitch);
-		dell_rfkill_update_sw_state(wifi_rfkill, 1, status, buffer);
+		dell_rfkill_update_sw_state(wifi_rfkill, 1, status);
 	}
 	if (bluetooth_rfkill) {
 		dell_rfkill_update_hw_state(bluetooth_rfkill, 2, status,
 					    hwswitch);
-		dell_rfkill_update_sw_state(bluetooth_rfkill, 2, status,
-					    buffer);
+		dell_rfkill_update_sw_state(bluetooth_rfkill, 2, status);
 	}
 	if (wwan_rfkill) {
 		dell_rfkill_update_hw_state(wwan_rfkill, 3, status, hwswitch);
-		dell_rfkill_update_sw_state(wwan_rfkill, 3, status, buffer);
+		dell_rfkill_update_sw_state(wwan_rfkill, 3, status);
 	}
-
- out:
-	dell_smbios_release_buffer();
 }
 static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);
 
@@ -696,7 +693,6 @@ static struct notifier_block dell_laptop_rbtn_notifier = {
 
 static int __init dell_setup_rfkill(void)
 {
-	struct calling_interface_buffer *buffer;
 	int status, ret, whitelisted;
 	const char *product;
 
@@ -712,11 +708,12 @@ static int __init dell_setup_rfkill(void)
 	if (!force_rfkill && !whitelisted)
 		return 0;
 
-	buffer = dell_smbios_get_buffer();
-	dell_smbios_send_request(17, 11);
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 17;
+	buffer->select = 11;
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 	status = buffer->output[1];
-	dell_smbios_release_buffer();
 
 	/* dell wireless info smbios call is not supported */
 	if (ret != 0)
@@ -869,7 +866,6 @@ static void dell_cleanup_rfkill(void)
 
 static int dell_send_intensity(struct backlight_device *bd)
 {
-	struct calling_interface_buffer *buffer;
 	struct calling_interface_token *token;
 	int ret;
 
@@ -877,24 +873,22 @@ static int dell_send_intensity(struct backlight_device *bd)
 	if (!token)
 		return -ENODEV;
 
-	buffer = dell_smbios_get_buffer();
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
 	buffer->input[0] = token->location;
 	buffer->input[1] = bd->props.brightness;
-
+	buffer->class = 1;
 	if (power_supply_is_system_supplied() > 0)
-		dell_smbios_send_request(1, 2);
+		buffer->select = 2;
 	else
-		dell_smbios_send_request(1, 1);
-
+		buffer->select = 1;
+	dell_smbios_call(buffer);
 	ret = dell_smbios_error(buffer->output[0]);
 
-	dell_smbios_release_buffer();
 	return ret;
 }
 
 static int dell_get_intensity(struct backlight_device *bd)
 {
-	struct calling_interface_buffer *buffer;
 	struct calling_interface_token *token;
 	int ret;
 
@@ -902,20 +896,20 @@ static int dell_get_intensity(struct backlight_device *bd)
 	if (!token)
 		return -ENODEV;
 
-	buffer = dell_smbios_get_buffer();
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
 	buffer->input[0] = token->location;
-
+	buffer->class = 0;
 	if (power_supply_is_system_supplied() > 0)
-		dell_smbios_send_request(0, 2);
+		buffer->select = 2;
 	else
-		dell_smbios_send_request(0, 1);
+		buffer->select = 1;
+	dell_smbios_call(buffer);
 
 	if (buffer->output[0])
 		ret = dell_smbios_error(buffer->output[0]);
 	else
 		ret = buffer->output[1];
 
-	dell_smbios_release_buffer();
 	return ret;
 }
 
@@ -1179,14 +1173,14 @@ static DEFINE_MUTEX(kbd_led_mutex);
 
 static int kbd_get_info(struct kbd_info *info)
 {
-	struct calling_interface_buffer *buffer;
 	u8 units;
 	int ret;
 
-	buffer = dell_smbios_get_buffer();
-
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 4;
+	buffer->select = 11;
 	buffer->input[0] = 0x0;
-	dell_smbios_send_request(4, 11);
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 
 	if (ret) {
@@ -1210,7 +1204,6 @@ static int kbd_get_info(struct kbd_info *info)
 		info->days = (buffer->output[3] >> 24) & 0xFF;
 
  out:
-	dell_smbios_release_buffer();
 	return ret;
 }
 
@@ -1269,13 +1262,13 @@ static int kbd_set_level(struct kbd_state *state, u8 level)
 
 static int kbd_get_state(struct kbd_state *state)
 {
-	struct calling_interface_buffer *buffer;
 	int ret;
 
-	buffer = dell_smbios_get_buffer();
-
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 4;
+	buffer->select = 11;
 	buffer->input[0] = 0x1;
-	dell_smbios_send_request(4, 11);
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 
 	if (ret) {
@@ -1297,16 +1290,16 @@ static int kbd_get_state(struct kbd_state *state)
 	state->timeout_unit_ac = (buffer->output[2] >> 30) & 0x3;
 
  out:
-	dell_smbios_release_buffer();
 	return ret;
 }
 
 static int kbd_set_state(struct kbd_state *state)
 {
-	struct calling_interface_buffer *buffer;
 	int ret;
 
-	buffer = dell_smbios_get_buffer();
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 4;
+	buffer->select = 11;
 	buffer->input[0] = 0x2;
 	buffer->input[1] = BIT(state->mode_bit) & 0xFFFF;
 	buffer->input[1] |= (state->triggers & 0xFF) << 16;
@@ -1316,9 +1309,8 @@ static int kbd_set_state(struct kbd_state *state)
 	buffer->input[2] |= (state->level & 0xFF) << 16;
 	buffer->input[2] |= (state->timeout_value_ac & 0x3F) << 24;
 	buffer->input[2] |= (state->timeout_unit_ac & 0x3) << 30;
-	dell_smbios_send_request(4, 11);
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
-	dell_smbios_release_buffer();
 
 	return dell_smbios_error(ret);
 }
@@ -1345,7 +1337,6 @@ static int kbd_set_state_safe(struct kbd_state *state, struct kbd_state *old)
 
 static int kbd_set_token_bit(u8 bit)
 {
-	struct calling_interface_buffer *buffer;
 	struct calling_interface_token *token;
 	int ret;
 
@@ -1356,19 +1347,19 @@ static int kbd_set_token_bit(u8 bit)
 	if (!token)
 		return -EINVAL;
 
-	buffer = dell_smbios_get_buffer();
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
 	buffer->input[0] = token->location;
 	buffer->input[1] = token->value;
-	dell_smbios_send_request(1, 0);
+	buffer->class = 1;
+	buffer->select = 0;
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
-	dell_smbios_release_buffer();
 
 	return dell_smbios_error(ret);
 }
 
 static int kbd_get_token_bit(u8 bit)
 {
-	struct calling_interface_buffer *buffer;
 	struct calling_interface_token *token;
 	int ret;
 	int val;
@@ -1380,12 +1371,14 @@ static int kbd_get_token_bit(u8 bit)
 	if (!token)
 		return -EINVAL;
 
-	buffer = dell_smbios_get_buffer();
+
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 0;
+	buffer->select = 0;
 	buffer->input[0] = token->location;
-	dell_smbios_send_request(0, 0);
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
 	val = buffer->output[1];
-	dell_smbios_release_buffer();
 
 	if (ret)
 		return dell_smbios_error(ret);
@@ -2102,7 +2095,6 @@ static struct notifier_block dell_laptop_notifier = {
 
 int dell_micmute_led_set(int state)
 {
-	struct calling_interface_buffer *buffer;
 	struct calling_interface_token *token;
 
 	if (state == 0)
@@ -2115,11 +2107,12 @@ int dell_micmute_led_set(int state)
 	if (!token)
 		return -ENODEV;
 
-	buffer = dell_smbios_get_buffer();
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	buffer->class = 1;
+	buffer->select = 0;
 	buffer->input[0] = token->location;
 	buffer->input[1] = token->value;
-	dell_smbios_send_request(1, 0);
-	dell_smbios_release_buffer();
+	dell_smbios_call(buffer);
 
 	return state;
 }
@@ -2127,7 +2120,6 @@ EXPORT_SYMBOL_GPL(dell_micmute_led_set);
 
 static int __init dell_init(void)
 {
-	struct calling_interface_buffer *buffer;
 	struct calling_interface_token *token;
 	int max_intensity = 0;
 	int ret;
@@ -2158,6 +2150,10 @@ static int __init dell_init(void)
 		goto fail_rfkill;
 	}
 
+	buffer = (void *)get_zeroed_page(GFP_KERNEL);
+	if (!buffer)
+		goto fail_buffer;
+
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_init(&platform_device->dev);
 
@@ -2175,12 +2171,12 @@ static int __init dell_init(void)
 
 	token = dell_smbios_find_token(BRIGHTNESS_TOKEN);
 	if (token) {
-		buffer = dell_smbios_get_buffer();
 		buffer->input[0] = token->location;
-		dell_smbios_send_request(0, 2);
+		buffer->class = 0;
+		buffer->select = 2;
+		dell_smbios_call(buffer);
 		if (buffer->output[0] == 0)
 			max_intensity = buffer->output[3];
-		dell_smbios_release_buffer();
 	}
 
 	if (max_intensity) {
@@ -2214,6 +2210,8 @@ static int __init dell_init(void)
 fail_get_brightness:
 	backlight_device_unregister(dell_backlight_device);
 fail_backlight:
+	free_page((unsigned long)buffer);
+fail_buffer:
 	dell_cleanup_rfkill();
 fail_rfkill:
 	platform_device_del(platform_device);
@@ -2233,6 +2231,7 @@ static void __exit dell_exit(void)
 		touchpad_led_exit();
 	kbd_led_exit();
 	backlight_device_unregister(dell_backlight_device);
+	free_page((unsigned long)buffer);
 	dell_cleanup_rfkill();
 	if (platform_device) {
 		platform_device_unregister(platform_device);
diff --git a/drivers/platform/x86/dell-smbios-smm.c b/drivers/platform/x86/dell-smbios-smm.c
new file mode 100644
index 000000000000..2e1c5d2dfd61
--- /dev/null
+++ b/drivers/platform/x86/dell-smbios-smm.c
@@ -0,0 +1,136 @@
+/*
+ *  SMI methods for use with dell-smbios
+ *
+ *  Copyright (c) Red Hat <mjg@redhat.com>
+ *  Copyright (c) 2014 Gabriele Mazzotta <gabriele.mzt@gmail.com>
+ *  Copyright (c) 2014 Pali Rohár <pali.rohar@gmail.com>
+ *  Copyright (c) 2017 Dell Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/gfp.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include "../../firmware/dcdbas.h"
+#include "dell-smbios.h"
+
+static int da_command_address;
+static int da_command_code;
+static struct calling_interface_buffer *buffer;
+struct platform_device *platform_device;
+static DEFINE_MUTEX(smm_mutex);
+
+static const struct dmi_system_id dell_device_table[] __initconst = {
+	{
+		.ident = "Dell laptop",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "8"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "9"), /*Laptop*/
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /*Notebook*/
+		},
+	},
+	{
+		.ident = "Dell Computer Corporation",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Computer Corporation"),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "8"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, dell_device_table);
+
+void dell_smbios_smm_call(struct calling_interface_buffer *input)
+{
+	struct smi_cmd command;
+	size_t size;
+
+	size = sizeof(struct calling_interface_buffer);
+	command.magic = SMI_CMD_MAGIC;
+	command.command_address = da_command_address;
+	command.command_code = da_command_code;
+	command.ebx = virt_to_phys(buffer);
+	command.ecx = 0x42534931;
+
+	mutex_lock(&smm_mutex);
+	memcpy(buffer, input, size);
+	dcdbas_smi_request(&command);
+	memcpy(input, buffer, size);
+	mutex_unlock(&smm_mutex);
+}
+EXPORT_SYMBOL_GPL(dell_smbios_smm_call);
+
+static int __init dell_smbios_smm_init(void)
+{
+	int ret;
+	/*
+	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
+	 * is passed to SMI handler.
+	 */
+	buffer = (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
+	if (!buffer)
+		return -ENOMEM;
+	dell_smbios_get_smm_address(&da_command_address, &da_command_code);
+
+	platform_device = platform_device_alloc("dell-smbios", 1);
+	if (!platform_device) {
+		ret = -ENOMEM;
+		goto fail_platform_device_alloc;
+	}
+
+	ret = platform_device_add(platform_device);
+	if (ret)
+		goto fail_platform_device_add;
+
+	ret = dell_smbios_register_device(&platform_device->dev,
+					  &dell_smbios_smm_call);
+	if (ret)
+		goto fail_register;
+
+	return 0;
+
+fail_register:
+	platform_device_del(platform_device);
+
+fail_platform_device_add:
+	platform_device_put(platform_device);
+
+fail_platform_device_alloc:
+	free_page((unsigned long)buffer);
+	return ret;
+}
+
+static void __exit dell_smbios_smm_exit(void)
+{
+	if (platform_device) {
+		dell_smbios_unregister_device(&platform_device->dev);
+		platform_device_unregister(platform_device);
+		free_page((unsigned long)buffer);
+	}
+}
+
+subsys_initcall(dell_smbios_smm_init);
+module_exit(dell_smbios_smm_exit);
+
+MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
+MODULE_AUTHOR("Gabriele Mazzotta <gabriele.mzt@gmail.com>");
+MODULE_AUTHOR("Pali Rohár <pali.rohar@gmail.com>");
+MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
+MODULE_DESCRIPTION("Dell SMBIOS communications over SMI");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/dell-smbios-smm.h b/drivers/platform/x86/dell-smbios-smm.h
new file mode 100644
index 000000000000..3bbf716a1bdb
--- /dev/null
+++ b/drivers/platform/x86/dell-smbios-smm.h
@@ -0,0 +1,22 @@
+/*
+ *  SMI methods for use with dell-smbios
+ *
+ *  Copyright (c) Red Hat <mjg@redhat.com>
+ *  Copyright (c) 2014 Gabriele Mazzotta <gabriele.mzt@gmail.com>
+ *  Copyright (c) 2014 Pali Rohár <pali.rohar@gmail.com>
+ *  Copyright (c) 2017 Dell Inc.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 as
+ *  published by the Free Software Foundation.
+ */
+
+#ifndef _DELL_SMBIOS_SMI_H_
+#define _DELL_SMBIOS_SMI_H_
+
+#include "dell-smbios.h"
+
+void dell_smbios_smm_call(struct calling_interface_buffer *input);
+//extern struct platform_driver dell_smbios_smm_platform_driver;
+
+#endif
diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 7275d1d48190..cdfea9e9610b 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -18,11 +18,9 @@
 #include <linux/module.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
-#include <linux/gfp.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/io.h>
-#include "../../firmware/dcdbas.h"
 #include <linux/platform_device.h>
 #include "dell-smbios.h"
 
@@ -34,14 +32,27 @@ struct calling_interface_structure {
 	struct calling_interface_token tokens[];
 } __packed;
 
-static struct calling_interface_buffer *buffer;
-static DEFINE_MUTEX(buffer_mutex);
-
 static int da_command_address;
 static int da_command_code;
 static int da_num_tokens;
 static struct platform_device *platform_device;
 static struct calling_interface_token *da_tokens;
+static DEFINE_MUTEX(smbios_mutex);
+
+struct smbios_device {
+	struct list_head list;
+	struct device *device;
+	void (*call_fn)(struct calling_interface_buffer *);
+};
+
+static LIST_HEAD(smbios_device_list);
+
+void dell_smbios_get_smm_address(int *address, int *code)
+{
+	*address = da_command_address;
+	*code = da_command_code;
+}
+EXPORT_SYMBOL_GPL(dell_smbios_get_smm_address);
 
 int dell_smbios_error(int value)
 {
@@ -58,42 +69,64 @@ int dell_smbios_error(int value)
 }
 EXPORT_SYMBOL_GPL(dell_smbios_error);
 
-struct calling_interface_buffer *dell_smbios_get_buffer(void)
-{
-	mutex_lock(&buffer_mutex);
-	dell_smbios_clear_buffer();
-	return buffer;
-}
-EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
-
-void dell_smbios_clear_buffer(void)
+int dell_smbios_register_device(struct device *d, void *call_fn)
 {
-	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	struct smbios_device *priv;
+
+	pr_debug("Added device: %s:%s\n", d->driver->name, dev_name(d));
+	priv = devm_kzalloc(d, sizeof(struct smbios_device), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	get_device(d);
+	priv->device = d;
+	priv->call_fn = call_fn;
+	mutex_lock(&smbios_mutex);
+	list_add_tail(&priv->list, &smbios_device_list);
+	mutex_unlock(&smbios_mutex);
+	return 0;
 }
-EXPORT_SYMBOL_GPL(dell_smbios_clear_buffer);
+EXPORT_SYMBOL_GPL(dell_smbios_register_device);
 
-void dell_smbios_release_buffer(void)
+void dell_smbios_unregister_device(struct device *d)
 {
-	mutex_unlock(&buffer_mutex);
+	struct smbios_device *priv;
+
+	pr_debug("Remove device: %s:%s\n", d->driver->name, dev_name(d));
+	mutex_lock(&smbios_mutex);
+	list_for_each_entry(priv, &smbios_device_list, list) {
+		if (priv->device == d) {
+			list_del(&priv->list);
+			put_device(d);
+			break;
+		}
+	};
+	mutex_unlock(&smbios_mutex);
 }
-EXPORT_SYMBOL_GPL(dell_smbios_release_buffer);
+EXPORT_SYMBOL_GPL(dell_smbios_unregister_device);
 
-void dell_smbios_send_request(int class, int select)
+void dell_smbios_call(struct calling_interface_buffer *buffer)
 {
-	struct smi_cmd command;
-
-	command.magic = SMI_CMD_MAGIC;
-	command.command_address = da_command_address;
-	command.command_code = da_command_code;
-	command.ebx = virt_to_phys(buffer);
-	command.ecx = 0x42534931;
-
-	buffer->class = class;
-	buffer->select = select;
-
-	dcdbas_smi_request(&command);
+	void (*call_fn)(struct calling_interface_buffer *) = NULL;
+	struct smbios_device *priv;
+	int id = 0;
+
+	mutex_lock(&smbios_mutex);
+	list_for_each_entry(priv, &smbios_device_list, list) {
+		if (priv->device->id >= id) {
+			pr_debug("Setting %s (ID: %d)\n",
+				 dev_name(priv->device), priv->device->id);
+			call_fn = priv->call_fn;
+			id = priv->device->id;
+		}
+	};
+
+	if (call_fn)
+		call_fn(buffer);
+	else
+		pr_err("No dell-smbios drivers are loaded\n");
+	mutex_unlock(&smbios_mutex);
 }
-EXPORT_SYMBOL_GPL(dell_smbios_send_request);
+EXPORT_SYMBOL_GPL(dell_smbios_call);
 
 struct calling_interface_token *dell_smbios_find_token(int tokenid)
 {
@@ -224,15 +257,6 @@ static int __init dell_smbios_init(void)
 		return -ENODEV;
 	}
 
-	/*
-	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
-	 * is passed to SMI handler.
-	 */
-	buffer = (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
-	if (!buffer) {
-		ret = -ENOMEM;
-		goto fail_buffer;
-	}
 	ret = platform_driver_register(&platform_driver);
 	if (ret)
 		goto fail_platform_driver;
@@ -262,17 +286,19 @@ static int __init dell_smbios_init(void)
 	platform_driver_unregister(&platform_driver);
 
 fail_platform_driver:
-	free_page((unsigned long)buffer);
-
-fail_buffer:
 	kfree(da_tokens);
 	return ret;
 }
 
 static void __exit dell_smbios_exit(void)
 {
-	kfree(da_tokens);
-	free_page((unsigned long)buffer);
+	if (platform_device) {
+		sysfs_remove_group(&platform_device->dev.kobj,
+				   &smbios_attribute_group);
+		platform_device_unregister(platform_device);
+		platform_driver_unregister(&platform_driver);
+		kfree(da_tokens);
+	}
 }
 
 subsys_initcall(dell_smbios_init);
diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
index 45cbc2292cd3..33eb8633a1c1 100644
--- a/drivers/platform/x86/dell-smbios.h
+++ b/drivers/platform/x86/dell-smbios.h
@@ -16,6 +16,8 @@
 #ifndef _DELL_SMBIOS_H_
 #define _DELL_SMBIOS_H_
 
+#include <linux/device.h>
+
 struct notifier_block;
 
 /* This structure will be modified by the firmware when we enter
@@ -37,12 +39,13 @@ struct calling_interface_token {
 	};
 };
 
-int dell_smbios_error(int value);
 
-struct calling_interface_buffer *dell_smbios_get_buffer(void);
-void dell_smbios_clear_buffer(void);
-void dell_smbios_release_buffer(void);
-void dell_smbios_send_request(int class, int select);
+int dell_smbios_register_device(struct device *d, void *call_fn);
+void dell_smbios_unregister_device(struct device *d);
+
+void dell_smbios_get_smm_address(int *address, int *command);
+int dell_smbios_error(int value);
+void dell_smbios_call(struct calling_interface_buffer *buffer);
 
 struct calling_interface_token *dell_smbios_find_token(int tokenid);
 
diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 90d7e8e55e9b..5e04e202d928 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -641,13 +641,15 @@ static int dell_wmi_events_set_enabled(bool enable)
 	struct calling_interface_buffer *buffer;
 	int ret;
 
-	buffer = dell_smbios_get_buffer();
+	buffer = (void *)get_zeroed_page(GFP_KERNEL);
+	buffer->class = 17;
+	buffer->select = 3;
 	buffer->input[0] = 0x10000;
 	buffer->input[1] = 0x51534554;
 	buffer->input[3] = enable;
-	dell_smbios_send_request(17, 3);
+	dell_smbios_call(buffer);
 	ret = buffer->output[0];
-	dell_smbios_release_buffer();
+	free_page((unsigned long)buffer);
 
 	return dell_smbios_error(ret);
 }
-- 
2.14.1
