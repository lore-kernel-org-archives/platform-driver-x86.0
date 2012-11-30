From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v2 3/8] msi-laptop: merge quirk tables to one
Date: Fri, 30 Nov 2012 18:04:32 +0200
Message-ID: <1354291477-8788-4-git-send-email-maxtram95@gmail.com>
References: <1354291477-8788-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62761 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933192Ab2K3QFH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 30 Nov 2012 11:05:07 -0500
Received: by mail-ee0-f46.google.com with SMTP id e53so380947eek.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Nov 2012 08:05:06 -0800 (PST)
In-Reply-To: <1354291477-8788-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

From: Lee, Chun-Yi <jlee@suse.com>

This patch introduced a quirk_entry struct, then we merged all quirk
tables to msi_dmi_table. Then we can more easily to set different quirk
attributes for different machine.

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>

Changed this patch so that it could be applied before MSI Wind U100
support patch. Changed rfkill logic for ec_read_only quirk support.
Removed delays if ec_delay = false.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/platform/x86/msi-laptop.c | 196 ++++++++++++++++++++++++--------------
 1 file changed, 127 insertions(+), 69 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 7ba107a..0bf94b5 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -108,23 +108,38 @@ static const struct key_entry msi_laptop_keymap[] = {
 
 static struct input_dev *msi_laptop_input_dev;
 
-static bool old_ec_model;
 static int wlan_s, bluetooth_s, threeg_s;
 static int threeg_exists;
-
-/* Some MSI 3G netbook only have one fn key to control Wlan/Bluetooth/3G,
- * those netbook will load the SCM (windows app) to disable the original
- * Wlan/Bluetooth control by BIOS when user press fn key, then control
- * Wlan/Bluetooth/3G by SCM (software control by OS). Without SCM, user
- * cann't on/off 3G module on those 3G netbook.
- * On Linux, msi-laptop driver will do the same thing to disable the
- * original BIOS control, then might need use HAL or other userland
- * application to do the software control that simulate with SCM.
- * e.g. MSI N034 netbook
- */
-static bool load_scm_model;
 static struct rfkill *rfk_wlan, *rfk_bluetooth, *rfk_threeg;
 
+/* MSI laptop quirks */
+struct quirk_entry {
+	bool old_ec_model;
+
+	/* Some MSI 3G netbook only have one fn key to control
+	 * Wlan/Bluetooth/3G, those netbook will load the SCM (windows app) to
+	 * disable the original Wlan/Bluetooth control by BIOS when user press
+	 * fn key, then control Wlan/Bluetooth/3G by SCM (software control by
+	 * OS). Without SCM, user cann't on/off 3G module on those 3G netbook.
+	 * On Linux, msi-laptop driver will do the same thing to disable the
+	 * original BIOS control, then might need use HAL or other userland
+	 * application to do the software control that simulate with SCM.
+	 * e.g. MSI N034 netbook
+	 */
+	bool load_scm_model;
+
+	/* Some MSI laptops need delay before reading from EC */
+	bool ec_delay;
+
+	/* Some MSI Wind netbooks (e.g. MSI Wind U100) need loading SCM to get
+	 * some features working (e.g. ECO mode), but we cannot change
+	 * Wlan/Bluetooth state in software and we can only read its state.
+	 */
+	bool ec_read_only;
+};
+
+static struct quirk_entry *quirks;
+
 /* Hardware access */
 
 static int set_lcd_level(int level)
@@ -195,6 +210,9 @@ static ssize_t set_device_state(const char *buf, size_t count, u8 mask)
 	if (sscanf(buf, "%i", &status) != 1 || (status < 0 || status > 1))
 		return -EINVAL;
 
+	if (quirks->ec_read_only)
+		return -EOPNOTSUPP;
+
 	/* read current device state */
 	result = ec_read(MSI_STANDARD_EC_COMMAND_ADDRESS, &rdata);
 	if (result < 0)
@@ -293,7 +311,7 @@ static ssize_t show_wlan(struct device *dev,
 
 	int ret, enabled = 0;
 
-	if (old_ec_model) {
+	if (quirks->old_ec_model) {
 		ret = get_wireless_state(&enabled, NULL);
 	} else {
 		ret = get_wireless_state_ec_standard();
@@ -317,7 +335,7 @@ static ssize_t show_bluetooth(struct device *dev,
 
 	int ret, enabled = 0;
 
-	if (old_ec_model) {
+	if (quirks->old_ec_model) {
 		ret = get_wireless_state(NULL, &enabled);
 	} else {
 		ret = get_wireless_state_ec_standard();
@@ -342,7 +360,7 @@ static ssize_t show_threeg(struct device *dev,
 	int ret;
 
 	/* old msi ec not support 3G */
-	if (old_ec_model)
+	if (quirks->old_ec_model)
 		return -ENODEV;
 
 	ret = get_wireless_state_ec_standard();
@@ -448,9 +466,26 @@ static struct platform_device *msipf_device;
 
 /* Initialization */
 
-static int dmi_check_cb(const struct dmi_system_id *id)
+static struct quirk_entry quirk_old_ec_model = {
+	.old_ec_model = true,
+};
+
+static struct quirk_entry quirk_load_scm_model = {
+	.load_scm_model = true,
+	.ec_delay = true,
+};
+
+static struct quirk_entry quirk_load_scm_ro_model = {
+	.load_scm_model = true,
+	.ec_read_only = true,
+};
+
+static int dmi_check_cb(const struct dmi_system_id *dmi)
 {
-	pr_info("Identified laptop model '%s'\n", id->ident);
+	pr_info("Identified laptop model '%s'\n", dmi->ident);
+
+	quirks = dmi->driver_data;
+
 	return 1;
 }
 
@@ -464,6 +499,7 @@ static struct dmi_system_id __initdata msi_dmi_table[] = {
 			DMI_MATCH(DMI_CHASSIS_VENDOR,
 				  "MICRO-STAR INT'L CO.,LTD")
 		},
+		.driver_data = &quirk_old_ec_model,
 		.callback = dmi_check_cb
 	},
 	{
@@ -474,6 +510,7 @@ static struct dmi_system_id __initdata msi_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "0581"),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1058")
 		},
+		.driver_data = &quirk_old_ec_model,
 		.callback = dmi_check_cb
 	},
 	{
@@ -484,6 +521,7 @@ static struct dmi_system_id __initdata msi_dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "MSI"),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1412")
 		},
+		.driver_data = &quirk_old_ec_model,
 		.callback = dmi_check_cb
 	},
 	{
@@ -495,12 +533,9 @@ static struct dmi_system_id __initdata msi_dmi_table[] = {
 			DMI_MATCH(DMI_CHASSIS_VENDOR,
 				  "MICRO-STAR INT'L CO.,LTD")
 		},
+		.driver_data = &quirk_old_ec_model,
 		.callback = dmi_check_cb
 	},
-	{ }
-};
-
-static struct dmi_system_id __initdata msi_load_scm_models_dmi_table[] = {
 	{
 		.ident = "MSI N034",
 		.matches = {
@@ -510,6 +545,7 @@ static struct dmi_system_id __initdata msi_load_scm_models_dmi_table[] = {
 			DMI_MATCH(DMI_CHASSIS_VENDOR,
 			"MICRO-STAR INTERNATIONAL CO., LTD")
 		},
+		.driver_data = &quirk_load_scm_model,
 		.callback = dmi_check_cb
 	},
 	{
@@ -521,6 +557,7 @@ static struct dmi_system_id __initdata msi_load_scm_models_dmi_table[] = {
 			DMI_MATCH(DMI_CHASSIS_VENDOR,
 			"MICRO-STAR INTERNATIONAL CO., LTD")
 		},
+		.driver_data = &quirk_load_scm_model,
 		.callback = dmi_check_cb
 	},
 	{
@@ -530,6 +567,7 @@ static struct dmi_system_id __initdata msi_load_scm_models_dmi_table[] = {
 				"MICRO-STAR INTERNATIONAL CO., LTD"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "MS-N014"),
 		},
+		.driver_data = &quirk_load_scm_model,
 		.callback = dmi_check_cb
 	},
 	{
@@ -539,6 +577,7 @@ static struct dmi_system_id __initdata msi_load_scm_models_dmi_table[] = {
 				"Micro-Star International"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "CR620"),
 		},
+		.driver_data = &quirk_load_scm_model,
 		.callback = dmi_check_cb
 	},
 	{
@@ -548,6 +587,7 @@ static struct dmi_system_id __initdata msi_load_scm_models_dmi_table[] = {
 				"Micro-Star International Co., Ltd."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "U270 series"),
 		},
+		.driver_data = &quirk_load_scm_model,
 		.callback = dmi_check_cb
 	},
 	{ }
@@ -560,32 +600,26 @@ static int rfkill_bluetooth_set(void *data, bool blocked)
 	 * blocked == false is on
 	 * blocked == true is off
 	 */
-	if (blocked)
-		set_device_state("0", 0, MSI_STANDARD_EC_BLUETOOTH_MASK);
-	else
-		set_device_state("1", 0, MSI_STANDARD_EC_BLUETOOTH_MASK);
+	int result = set_device_state(blocked ? "0" : "1", 0,
+			MSI_STANDARD_EC_BLUETOOTH_MASK);
 
-	return 0;
+	return min(result, 0);
 }
 
 static int rfkill_wlan_set(void *data, bool blocked)
 {
-	if (blocked)
-		set_device_state("0", 0, MSI_STANDARD_EC_WLAN_MASK);
-	else
-		set_device_state("1", 0, MSI_STANDARD_EC_WLAN_MASK);
+	int result = set_device_state(blocked ? "0" : "1", 0,
+			MSI_STANDARD_EC_WLAN_MASK);
 
-	return 0;
+	return min(result, 0);
 }
 
 static int rfkill_threeg_set(void *data, bool blocked)
 {
-	if (blocked)
-		set_device_state("0", 0, MSI_STANDARD_EC_3G_MASK);
-	else
-		set_device_state("1", 0, MSI_STANDARD_EC_3G_MASK);
+	int result = set_device_state(blocked ? "0" : "1", 0,
+			MSI_STANDARD_EC_3G_MASK);
 
-	return 0;
+	return min(result, 0);
 }
 
 static const struct rfkill_ops rfkill_bluetooth_ops = {
@@ -618,18 +652,27 @@ static void rfkill_cleanup(void)
 	}
 }
 
+static bool msi_rfkill_set_state(struct rfkill *rfkill, bool blocked)
+{
+	if (quirks->ec_read_only)
+		return rfkill_set_hw_state(rfkill, blocked);
+	else
+		return rfkill_set_sw_state(rfkill, blocked);
+}
+
 static void msi_update_rfkill(struct work_struct *ignored)
 {
 	get_wireless_state_ec_standard();
 
 	if (rfk_wlan)
-		rfkill_set_sw_state(rfk_wlan, !wlan_s);
+		msi_rfkill_set_state(rfk_wlan, !wlan_s);
 	if (rfk_bluetooth)
-		rfkill_set_sw_state(rfk_bluetooth, !bluetooth_s);
+		msi_rfkill_set_state(rfk_bluetooth, !bluetooth_s);
 	if (rfk_threeg)
-		rfkill_set_sw_state(rfk_threeg, !threeg_s);
+		msi_rfkill_set_state(rfk_threeg, !threeg_s);
 }
-static DECLARE_DELAYED_WORK(msi_rfkill_work, msi_update_rfkill);
+static DECLARE_DELAYED_WORK(msi_rfkill_dwork, msi_update_rfkill);
+static DECLARE_WORK(msi_rfkill_work, msi_update_rfkill);
 
 static void msi_send_touchpad_key(struct work_struct *ignored)
 {
@@ -644,7 +687,8 @@ static void msi_send_touchpad_key(struct work_struct *ignored)
 		(rdata & MSI_STANDARD_EC_TOUCHPAD_MASK) ?
 		KEY_TOUCHPAD_ON : KEY_TOUCHPAD_OFF, 1, true);
 }
-static DECLARE_DELAYED_WORK(msi_touchpad_work, msi_send_touchpad_key);
+static DECLARE_DELAYED_WORK(msi_touchpad_dwork, msi_send_touchpad_key);
+static DECLARE_WORK(msi_touchpad_work, msi_send_touchpad_key);
 
 static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str,
 				struct serio *port)
@@ -662,14 +706,20 @@ static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str,
 		extended = false;
 		switch (data) {
 		case 0xE4:
-			schedule_delayed_work(&msi_touchpad_work,
-				round_jiffies_relative(0.5 * HZ));
+			if (quirks->ec_delay) {
+				schedule_delayed_work(&msi_touchpad_dwork,
+					round_jiffies_relative(0.5 * HZ));
+			} else
+				schedule_work(&msi_touchpad_work);
 			break;
 		case 0x54:
 		case 0x62:
 		case 0x76:
-			schedule_delayed_work(&msi_rfkill_work,
-				round_jiffies_relative(0.5 * HZ));
+			if (quirks->ec_delay) {
+				schedule_delayed_work(&msi_rfkill_dwork,
+					round_jiffies_relative(0.5 * HZ));
+			} else
+				schedule_work(&msi_rfkill_work);
 			break;
 		}
 	}
@@ -736,8 +786,11 @@ static int rfkill_init(struct platform_device *sdev)
 	}
 
 	/* schedule to run rfkill state initial */
-	schedule_delayed_work(&msi_rfkill_init,
-				round_jiffies_relative(1 * HZ));
+	if (quirks->ec_delay) {
+		schedule_delayed_work(&msi_rfkill_init,
+			round_jiffies_relative(1 * HZ));
+	} else
+		schedule_work(&msi_rfkill_work);
 
 	return 0;
 
@@ -761,7 +814,7 @@ static int msi_laptop_resume(struct device *device)
 	u8 data;
 	int result;
 
-	if (!load_scm_model)
+	if (!quirks->load_scm_model)
 		return 0;
 
 	/* set load SCM to disable hardware control by fn key */
@@ -819,13 +872,15 @@ static int __init load_scm_model_init(struct platform_device *sdev)
 	u8 data;
 	int result;
 
-	/* allow userland write sysfs file  */
-	dev_attr_bluetooth.store = store_bluetooth;
-	dev_attr_wlan.store = store_wlan;
-	dev_attr_threeg.store = store_threeg;
-	dev_attr_bluetooth.attr.mode |= S_IWUSR;
-	dev_attr_wlan.attr.mode |= S_IWUSR;
-	dev_attr_threeg.attr.mode |= S_IWUSR;
+	if (!quirks->ec_read_only) {
+		/* allow userland write sysfs file  */
+		dev_attr_bluetooth.store = store_bluetooth;
+		dev_attr_wlan.store = store_wlan;
+		dev_attr_threeg.store = store_threeg;
+		dev_attr_bluetooth.attr.mode |= S_IWUSR;
+		dev_attr_wlan.attr.mode |= S_IWUSR;
+		dev_attr_threeg.attr.mode |= S_IWUSR;
+	}
 
 	/* disable hardware control by fn key */
 	result = ec_read(MSI_STANDARD_EC_SCM_LOAD_ADDRESS, &data);
@@ -874,15 +929,16 @@ static int __init msi_init(void)
 	if (acpi_disabled)
 		return -ENODEV;
 
-	if (force || dmi_check_system(msi_dmi_table))
-		old_ec_model = 1;
+	dmi_check_system(msi_dmi_table);
+	if (!quirks)
+		/* quirks may be NULL if no match in DMI table */
+		quirks = &quirk_load_scm_model;
+	if (force)
+		quirks = &quirk_old_ec_model;
 
-	if (!old_ec_model)
+	if (!quirks->old_ec_model)
 		get_threeg_exists();
 
-	if (!old_ec_model && dmi_check_system(msi_load_scm_models_dmi_table))
-		load_scm_model = 1;
-
 	if (auto_brightness < 0 || auto_brightness > 2)
 		return -EINVAL;
 
@@ -918,7 +974,7 @@ static int __init msi_init(void)
 	if (ret)
 		goto fail_platform_device1;
 
-	if (load_scm_model && (load_scm_model_init(msipf_device) < 0)) {
+	if (quirks->load_scm_model && (load_scm_model_init(msipf_device) < 0)) {
 		ret = -EINVAL;
 		goto fail_platform_device1;
 	}
@@ -928,7 +984,7 @@ static int __init msi_init(void)
 	if (ret)
 		goto fail_platform_device2;
 
-	if (!old_ec_model) {
+	if (!quirks->old_ec_model) {
 		if (threeg_exists)
 			ret = device_create_file(&msipf_device->dev,
 						&dev_attr_threeg);
@@ -949,9 +1005,10 @@ static int __init msi_init(void)
 
 fail_platform_device2:
 
-	if (load_scm_model) {
+	if (quirks->load_scm_model) {
 		i8042_remove_filter(msi_laptop_i8042_filter);
-		cancel_delayed_work_sync(&msi_rfkill_work);
+		cancel_delayed_work_sync(&msi_rfkill_dwork);
+		cancel_work_sync(&msi_rfkill_work);
 		rfkill_cleanup();
 	}
 	platform_device_del(msipf_device);
@@ -973,15 +1030,16 @@ fail_backlight:
 
 static void __exit msi_cleanup(void)
 {
-	if (load_scm_model) {
+	if (quirks->load_scm_model) {
 		i8042_remove_filter(msi_laptop_i8042_filter);
 		msi_laptop_input_destroy();
-		cancel_delayed_work_sync(&msi_rfkill_work);
+		cancel_delayed_work_sync(&msi_rfkill_dwork);
+		cancel_work_sync(&msi_rfkill_work);
 		rfkill_cleanup();
 	}
 
 	sysfs_remove_group(&msipf_device->dev.kobj, &msipf_attribute_group);
-	if (!old_ec_model && threeg_exists)
+	if (!quirks->old_ec_model && threeg_exists)
 		device_remove_file(&msipf_device->dev, &dev_attr_threeg);
 	platform_device_unregister(msipf_device);
 	platform_driver_unregister(&msipf_driver);
-- 
1.8.0.1
