From: Anssi Hannula <anssi.hannula@iki.fi>
Subject: [PATCH 7/7] hp-wmi: add rfkill support for wireless query 0x1b
Date: Sun, 20 Feb 2011 20:07:26 +0200
Message-ID: <1298225246-21991-8-git-send-email-anssi.hannula@iki.fi>
References: <1298225246-21991-1-git-send-email-anssi.hannula@iki.fi>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from sirokuusama.dnainternet.net ([83.102.40.133]:47234 "EHLO
	sirokuusama.dnainternet.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754406Ab1BTSHg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 20 Feb 2011 13:07:36 -0500
In-Reply-To: <1298225246-21991-1-git-send-email-anssi.hannula@iki.fi>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

Some recent HP laptops use a new wireless query command type 0x1b.

Add support for it. Tested on HP Mini 5102.

Signed-off-by: Anssi Hannula <anssi.hannula@iki.fi>
---
 drivers/platform/x86/hp-wmi.c |  188 ++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 187 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 524ffab..1bc4a75 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -2,6 +2,7 @@
  * HP WMI hotkeys
  *
  * Copyright (C) 2008 Red Hat <mjg@redhat.com>
+ * Copyright (C) 2010, 2011 Anssi Hannula <anssi.hannula@iki.fi>
  *
  * Portions based on wistron_btns.c:
  * Copyright (C) 2005 Miloslav Trmac <mitr@volny.cz>
@@ -51,6 +52,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 #define HPWMI_HARDWARE_QUERY 0x4
 #define HPWMI_WIRELESS_QUERY 0x5
 #define HPWMI_HOTKEY_QUERY 0xc
+#define HPWMI_WIRELESS2_QUERY 0x1b
 
 #define PREFIX "HP WMI: "
 #define UNIMP "Unimplemented "
@@ -95,6 +97,39 @@ enum hp_return_value {
 	HPWMI_RET_INVALID_PARAMETERS	= 0x05,
 };
 
+enum hp_wireless2_bits {
+	HPWMI_POWER_STATE	= 0x01,
+	HPWMI_POWER_SOFT	= 0x02,
+	HPWMI_POWER_BIOS	= 0x04,
+	HPWMI_POWER_HARD	= 0x08,
+};
+
+#define IS_HWBLOCKED(x) ((x & (HPWMI_POWER_BIOS | HPWMI_POWER_HARD)) \
+			 != (HPWMI_POWER_BIOS | HPWMI_POWER_HARD))
+#define IS_SWBLOCKED(x) !(x & HPWMI_POWER_SOFT)
+
+struct bios_rfkill2_device_state {
+	u8 radio_type;
+	u8 bus_type;
+	u16 vendor_id;
+	u16 product_id;
+	u16 subsys_vendor_id;
+	u16 subsys_product_id;
+	u8 rfkill_id;
+	u8 power;
+	u8 unknown[4];
+};
+
+/* 7 devices fit into the 128 byte buffer */
+#define HPWMI_MAX_RFKILL2_DEVICES	7
+
+struct bios_rfkill2_state {
+	u8 unknown[7];
+	u8 count;
+	u8 pad[8];
+	struct bios_rfkill2_device_state device[HPWMI_MAX_RFKILL2_DEVICES];
+};
+
 static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_KEY, 0x02,   { KEY_BRIGHTNESSUP } },
 	{ KE_KEY, 0x03,   { KEY_BRIGHTNESSDOWN } },
@@ -114,6 +149,15 @@ static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
 
+struct rfkill2_device {
+	u8 id;
+	int num;
+	struct rfkill *rfkill;
+};
+
+static int rfkill2_count;
+static struct rfkill2_device rfkill2[HPWMI_MAX_RFKILL2_DEVICES];
+
 static const struct dev_pm_ops hp_wmi_pm_ops = {
 	.resume  = hp_wmi_resume_handler,
 	.restore  = hp_wmi_resume_handler,
@@ -308,6 +352,51 @@ static bool hp_wmi_get_hw_state(enum hp_wmi_radio r)
 		return true;
 }
 
+static int hp_wmi_rfkill2_set_block(void *data, bool blocked)
+{
+	int rfkill_id = (int)(long)data;
+	char buffer[4] = { 0x01, 0x00, rfkill_id, !blocked };
+
+	if (hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, 1,
+				   buffer, sizeof(buffer), 0))
+		return -EINVAL;
+	return 0;
+}
+
+static const struct rfkill_ops hp_wmi_rfkill2_ops = {
+	.set_block = hp_wmi_rfkill2_set_block,
+};
+
+static int hp_wmi_rfkill2_refresh(void)
+{
+	int err, i;
+	struct bios_rfkill2_state state;
+
+	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, 0, &state,
+				   0, sizeof(state));
+	if (err)
+		return err;
+
+	for (i = 0; i < rfkill2_count; i++) {
+		int num = rfkill2[i].num;
+		struct bios_rfkill2_device_state *devstate;
+		devstate = &state.device[num];
+
+		if (num >= state.count ||
+		    devstate->rfkill_id != rfkill2[i].id) {
+			printk(KERN_WARNING PREFIX "power configuration of "
+			       "the wireless devices unexpectedly changed\n");
+			continue;
+		}
+
+		rfkill_set_states(rfkill2[i].rfkill,
+				  IS_SWBLOCKED(devstate->power),
+				  IS_HWBLOCKED(devstate->power));
+	}
+
+	return 0;
+}
+
 static ssize_t show_display(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
@@ -442,6 +531,11 @@ static void hp_wmi_notify(u32 value, void *context)
 			       key_code);
 		break;
 	case HPWMI_WIRELESS:
+		if (rfkill2_count) {
+			hp_wmi_rfkill2_refresh();
+			break;
+		}
+
 		if (wifi_rfkill)
 			rfkill_set_states(wifi_rfkill,
 					  hp_wmi_get_sw_state(HPWMI_WIFI),
@@ -601,6 +695,87 @@ register_wifi_error:
 	return err;
 }
 
+static int __devinit hp_wmi_rfkill2_setup(struct platform_device *device)
+{
+	int err, i;
+	struct bios_rfkill2_state state;
+	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, 0, &state,
+				   0, sizeof(state));
+	if (err)
+		return err;
+
+	if (state.count > HPWMI_MAX_RFKILL2_DEVICES) {
+		printk(KERN_WARNING PREFIX "unable to parse 0x1b query output\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < state.count; i++) {
+		struct rfkill *rfkill;
+		enum rfkill_type type;
+		char *name;
+		switch (state.device[i].radio_type) {
+		case HPWMI_WIFI:
+			type = RFKILL_TYPE_WLAN;
+			name = "hp-wifi";
+			break;
+		case HPWMI_BLUETOOTH:
+			type = RFKILL_TYPE_BLUETOOTH;
+			name = "hp-bluetooth";
+			break;
+		case HPWMI_WWAN:
+			type = RFKILL_TYPE_WWAN;
+			name = "hp-wwan";
+			break;
+		default:
+			printk(KERN_WARNING PREFIX "unknown device type 0x%x\n",
+				 state.device[i].radio_type);
+			continue;
+		}
+
+		if (!state.device[i].vendor_id) {
+			printk(KERN_WARNING PREFIX "zero device %d while %d "
+			       "reported\n", i, state.count);
+			continue;
+		}
+
+		rfkill = rfkill_alloc(name, &device->dev, type,
+				      &hp_wmi_rfkill2_ops, (void *)(long)i);
+		if (!rfkill) {
+			err = -ENOMEM;
+			goto fail;
+		}
+
+		rfkill2[rfkill2_count].id = state.device[i].rfkill_id;
+		rfkill2[rfkill2_count].num = i;
+		rfkill2[rfkill2_count].rfkill = rfkill;
+
+		rfkill_init_sw_state(rfkill,
+				     IS_SWBLOCKED(state.device[i].power));
+		rfkill_set_hw_state(rfkill,
+				    IS_HWBLOCKED(state.device[i].power));
+
+		if (!(state.device[i].power & HPWMI_POWER_BIOS))
+			printk(KERN_INFO PREFIX "device %s blocked by BIOS\n",
+			       name);
+
+		err = rfkill_register(rfkill);
+		if (err) {
+			rfkill_destroy(rfkill);
+			goto fail;
+		}
+
+		rfkill2_count++;
+	}
+
+	return 0;
+fail:
+	for (; rfkill2_count > 0; rfkill2_count--) {
+		rfkill_unregister(rfkill2[rfkill2_count - 1].rfkill);
+		rfkill_destroy(rfkill2[rfkill2_count - 1].rfkill);
+	}
+	return err;
+}
+
 static int __devinit hp_wmi_bios_setup(struct platform_device *device)
 {
 	int err;
@@ -609,8 +784,10 @@ static int __devinit hp_wmi_bios_setup(struct platform_device *device)
 	wifi_rfkill = NULL;
 	bluetooth_rfkill = NULL;
 	wwan_rfkill = NULL;
+	rfkill2_count = 0;
 
-	hp_wmi_rfkill_setup(device);
+	if (hp_wmi_rfkill_setup(device))
+		hp_wmi_rfkill2_setup(device);
 
 	err = device_create_file(&device->dev, &dev_attr_display);
 	if (err)
@@ -636,8 +813,14 @@ add_sysfs_error:
 
 static int __exit hp_wmi_bios_remove(struct platform_device *device)
 {
+	int i;
 	cleanup_sysfs(device);
 
+	for (i = 0; i < rfkill2_count; i++) {
+		rfkill_unregister(rfkill2[i].rfkill);
+		rfkill_destroy(rfkill2[i].rfkill);
+	}
+
 	if (wifi_rfkill) {
 		rfkill_unregister(wifi_rfkill);
 		rfkill_destroy(wifi_rfkill);
@@ -670,6 +853,9 @@ static int hp_wmi_resume_handler(struct device *device)
 		input_sync(hp_wmi_input_dev);
 	}
 
+	if (rfkill2_count)
+		hp_wmi_rfkill2_refresh();
+
 	if (wifi_rfkill)
 		rfkill_set_states(wifi_rfkill,
 				  hp_wmi_get_sw_state(HPWMI_WIFI),
-- 
1.7.3
