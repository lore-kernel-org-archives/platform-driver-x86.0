From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH] msi-laptop: send out touchpad on/off key
Date: Mon,  7 Mar 2011 15:46:28 +0800
Message-ID: <1299483988-19165-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:36186 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097Ab1CGHs1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 7 Mar 2011 02:48:27 -0500
Received: by ywj3 with SMTP id 3so1519221ywj.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Mar 2011 23:48:27 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>

MSI BIOS's raw behavior is send out KEY_TOUCHPAD_TOGGLE key when user
pressed touchpad hotkey.

Actually, we can capture the real touchpad status by read 0xE4 EC address
on MSI netbook/notebook. So, add msi-laptop input device for send out
KEY_TOUCHPAD_ON or KEY_TOUCHPAD_OFF key when user pressed Fn+F3 touchpad
hotkey. It leave userland applications to know the real touchpad status.

Tested on MSI netbook U-100, U-115, U160(N051), U160DX, N014, N034
Tested on MSI notebook CR620

Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Matthew Garrett <mjg@redhat.com>
Cc: Dmitry Torokhov <dtor@mail.ru>
Cc: Corentin Chary <corentincj@iksaif.net>
Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
---
 drivers/platform/x86/msi-laptop.c |   81 ++++++++++++++++++++++++++++++++++++-
 1 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 7e9bb6d..028d2c6 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -60,6 +60,8 @@
 #include <linux/platform_device.h>
 #include <linux/rfkill.h>
 #include <linux/i8042.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
 
 #define MSI_DRIVER_VERSION "0.5"
 
@@ -78,6 +80,9 @@
 #define MSI_STANDARD_EC_SCM_LOAD_ADDRESS	0x2d
 #define MSI_STANDARD_EC_SCM_LOAD_MASK		(1 << 0)
 
+#define MSI_STANDARD_EC_TOUCHPAD_ADDRESS	0xe4
+#define MSI_STANDARD_EC_TOUCHPAD_MASK		(1 << 4)
+
 static int msi_laptop_resume(struct platform_device *device);
 
 #define MSI_STANDARD_EC_DEVICES_EXISTS_ADDRESS	0x2f
@@ -90,6 +95,14 @@ static int auto_brightness;
 module_param(auto_brightness, int, 0);
 MODULE_PARM_DESC(auto_brightness, "Enable automatic brightness control (0: disabled; 1: enabled; 2: don't touch)");
 
+static const struct key_entry msi_laptop_keymap[] = {
+	{KE_KEY, KEY_TOUCHPAD_ON, {KEY_TOUCHPAD_ON} },	/* Touch Pad On */
+	{KE_KEY, KEY_TOUCHPAD_OFF, {KEY_TOUCHPAD_OFF} },/* Touch Pad On */
+	{KE_END, 0}
+};
+
+static struct input_dev *msi_laptop_input_dev;
+
 static bool old_ec_model;
 static int wlan_s, bluetooth_s, threeg_s;
 static int threeg_exists;
@@ -605,6 +618,21 @@ static void msi_update_rfkill(struct work_struct *ignored)
 }
 static DECLARE_DELAYED_WORK(msi_rfkill_work, msi_update_rfkill);
 
+static void msi_send_touchpad_key(struct work_struct *ignored)
+{
+	u8 rdata;
+	int result;
+
+	result = ec_read(MSI_STANDARD_EC_TOUCHPAD_ADDRESS, &rdata);
+	if (result < 0)
+		return;
+
+	sparse_keymap_report_event(msi_laptop_input_dev,
+		(rdata & MSI_STANDARD_EC_TOUCHPAD_MASK) ?
+		KEY_TOUCHPAD_ON : KEY_TOUCHPAD_OFF, 1, true);
+}
+static DECLARE_DELAYED_WORK(msi_touchpad_work, msi_send_touchpad_key);
+
 static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str,
 				struct serio *port)
 {
@@ -613,12 +641,17 @@ static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str,
 	if (str & 0x20)
 		return false;
 
-	/* 0x54 wwan, 0x62 bluetooth, 0x76 wlan*/
+	/* 0x54 wwan, 0x62 bluetooth, 0x76 wlan, 0xE4 touchpad toggle*/
 	if (unlikely(data == 0xe0)) {
 		extended = true;
 		return false;
 	} else if (unlikely(extended)) {
+		extended = false;
 		switch (data) {
+		case 0xE4:
+			schedule_delayed_work(&msi_touchpad_work,
+				round_jiffies_relative(0.5 * HZ));
+			break;
 		case 0x54:
 		case 0x62:
 		case 0x76:
@@ -626,7 +659,6 @@ static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str,
 				round_jiffies_relative(0.5 * HZ));
 			break;
 		}
-		extended = false;
 	}
 
 	return false;
@@ -731,6 +763,42 @@ static int msi_laptop_resume(struct platform_device *device)
 	return 0;
 }
 
+static int __init msi_laptop_input_setup(void)
+{
+	int err;
+
+	msi_laptop_input_dev = input_allocate_device();
+	if (!msi_laptop_input_dev)
+		return -ENOMEM;
+
+	msi_laptop_input_dev->name = "MSI Laptop hotkeys";
+	msi_laptop_input_dev->phys = "msi-laptop/input0";
+	msi_laptop_input_dev->id.bustype = BUS_HOST;
+
+	err = sparse_keymap_setup(msi_laptop_input_dev,
+		msi_laptop_keymap, NULL);
+	if (err)
+		goto err_free_dev;
+
+	err = input_register_device(msi_laptop_input_dev);
+	if (err)
+		goto err_free_keymap;
+
+	return 0;
+
+err_free_keymap:
+	sparse_keymap_free(msi_laptop_input_dev);
+err_free_dev:
+	input_free_device(msi_laptop_input_dev);
+	return err;
+}
+
+static void msi_laptop_input_destroy(void)
+{
+	sparse_keymap_free(msi_laptop_input_dev);
+	input_unregister_device(msi_laptop_input_dev);
+}
+
 static int load_scm_model_init(struct platform_device *sdev)
 {
 	u8 data;
@@ -759,6 +827,11 @@ static int load_scm_model_init(struct platform_device *sdev)
 	if (result < 0)
 		goto fail_rfkill;
 
+	/* setup input device */
+	result = msi_laptop_input_setup();
+	if (result)
+		goto fail_input;
+
 	result = i8042_install_filter(msi_laptop_i8042_filter);
 	if (result) {
 		printk(KERN_ERR
@@ -769,6 +842,9 @@ static int load_scm_model_init(struct platform_device *sdev)
 	return 0;
 
 fail_filter:
+	msi_laptop_input_destroy();
+
+fail_input:
 	rfkill_cleanup();
 
 fail_rfkill:
@@ -885,6 +961,7 @@ static void __exit msi_cleanup(void)
 {
 	if (load_scm_model) {
 		i8042_remove_filter(msi_laptop_i8042_filter);
+		msi_laptop_input_destroy();
 		cancel_delayed_work_sync(&msi_rfkill_work);
 		rfkill_cleanup();
 	}
-- 
1.6.0.2
