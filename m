Received: from e3i692.smtp2go.com (e3i692.smtp2go.com [158.120.86.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610B429E10F
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 06:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.86.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175066; cv=none; b=SqxgKmGrwewBqg5+iIHPArkHbWET/Xeb3iVBklZ34A8Tu28DzkEMuLMWRrEDE+D1+KgZtzOvPtgXhKyZwP3CMx6M4uec8gnykt1Nno2WIOIZ+gdmscEYcZGzFRSOaBprPA9Z7e3U/dYmyPBKyepUlX31LMmr6X/rCeQgZaPBgFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175066; c=relaxed/simple;
	bh=4ihpYHgjWTo5H0NjtC9mBuZC4guj28s6aSnTxAOky1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EaNwDTli7Kde7sVGopeXG6ZOLEm9MeGDc7udfQ5k6mSeS4F9CHXS5VFYS6JKfwYAZlwSPuxcwT7u51FSg3XnNwyLW+cNfUdAQj9vUTg3Z6Uq7NoBY4C0nbHIcayq2ijbLfoaCXrB9Db0aTuRWbZ1KyI1wyTp5sGDvrdgCXBKRzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=O1C8NAOH; arc=none smtp.client-ip=158.120.86.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="O1C8NAOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1772173999; h=from : subject :
 to : message-id : date;
 bh=v5AwdSOoRVqtchU4pjPX6qVx7G+vizVF4UEFnq2Oby8=;
 b=O1C8NAOH7S6DkjLii/E6BbKZPsPSfxprhizTe7U3tpimN6eBS6RCmn43C9FfJNnGgEvuO
 CVPIYSkxPPvlPDMd1elc2gT36DKhpM2em+317iZ6ngtfQCgSd7aevXZFQkfO74DLqNLOpNp
 YLjYJoqTG3kw3iseyCQASLq0jPrh4IPt9u47stIeamFglEzzD/jux8L4J0rp8zUS63260eY
 u5t56BmtYS1xlcvQhdnRnuzBR90vDhTraN0UIOmgMAX6MqCQ3JfI/riCF3NVYDl7/D4S+yU
 dBvuhnmQijY6UqaYGmigfMqixHaUDl/3MGwp1dwiGCYoM2Lh/jCcTn9QN3EQ==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.99.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1vvrPZ-FnQW0hPqVpn-N5KH;
	Fri, 27 Feb 2026 06:33:18 +0000
From: edip@medip.dev
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	kuba@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>
Subject: [PATCH] platform/x86: hp-wmi: Add keyboard backlight support
Date: Fri, 27 Feb 2026 09:31:23 +0300
Message-ID: <20260227063122.7184-2-edip@medip.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sAuFSd20KX
X-smtpcorp-track: DOQAkcm7mVWS.46NGlRgH3Pva.xVa0wQhqTvB

From: Edip Hazuri <edip@medip.dev>

This patch adds support for changing keyboard backlight. It only
supports Hp Victus/Omen laptops with one or four zone keyboard
backlight. Per-key rgb isn't supported


Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 drivers/platform/x86/hp/hp-wmi.c | 276 +++++++++++++++++++++++++++++++
 1 file changed, 276 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac63c8a..ea74a71998dc 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -23,6 +23,8 @@
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/kernel.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
 #include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
@@ -58,6 +60,8 @@ enum hp_ec_offsets {
 #define HP_POWER_LIMIT_DEFAULT	 0x00
 #define HP_POWER_LIMIT_NO_CHANGE 0xFF
 
+#define HP_COLOR_TABLE_PADDING 25
+
 #define ACPI_AC_CLASS "ac_adapter"
 
 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
@@ -98,6 +102,15 @@ enum hp_thermal_profile {
 	HP_THERMAL_PROFILE_QUIET			= 0x03,
 };
 
+enum hp_keyboard_type {
+	HP_KEYBOARD_TYPE_NOBACKLIGHT                = 0x0,
+	HP_KEYBOARD_TYPE_FOURZONE_WITH_NUMPAD       = 0x1,
+	HP_KEYBOARD_TYPE_FOURZONE_WITHOUT_NUMPAD    = 0x2,
+	HP_KEYBOARD_TYPE_RGB_PER_KEY                = 0x3,
+	HP_KEYBOARD_TYPE_SINGLEZONE_WITH_NUMPAD     = 0x4,
+	HP_KEYBOARD_TYPE_SINGLEZONE_WITHOUT_NUMPAD  = 0x5,
+};
+
 
 struct thermal_profile_params {
 	u8 performance;
@@ -290,16 +303,27 @@ enum hp_wmi_gm_commandtype {
 	HPWMI_GET_GPU_THERMAL_MODES_QUERY	= 0x21,
 	HPWMI_SET_GPU_THERMAL_MODES_QUERY	= 0x22,
 	HPWMI_SET_POWER_LIMITS_QUERY		= 0x29,
+	HPWMI_GET_KEYBOARD_TYPE_QUERY		= 0x2b,
 	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY	= 0x2D,
 	HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY	= 0x2E,
 	HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY	= 0x2F,
 };
 
+enum hp_wmi_backlight_commandtype {
+	HPWMI_BACKLIGHT_COLOR_GET_QUERY         = 0x02,
+	HPWMI_BACKLIGHT_COLOR_SET_QUERY         = 0x03,
+	HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY    = 0x04,
+	HPWMI_BACKLIGHT_BRIGHTNESS_SET_QUERY    = 0x05,
+	HPWMI_BACKLIGHT_SET_OFF_QUERY           = 0x64,
+	HPWMI_BACKLIGHT_SET_ON_QUERY            = 0xE4,
+};
+
 enum hp_wmi_command {
 	HPWMI_READ	= 0x01,
 	HPWMI_WRITE	= 0x02,
 	HPWMI_ODM	= 0x03,
 	HPWMI_GM	= 0x20008,
+	HPWMI_BACKLIGHT = 0x20009,
 };
 
 enum hp_wmi_hardware_mask {
@@ -373,6 +397,16 @@ static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_END, 0 }
 };
 
+struct hp_kbd_led_priv {
+	int zone;               /* Zone index (0-3) */
+	enum led_brightness last_brightness;  /* Brightness before turning off */
+};
+
+struct hp_mc_leds {
+	struct led_classdev_mc devices[4];
+	struct hp_kbd_led_priv priv[4];
+};
+
 /*
  * Mutex for the active_platform_profile variable,
  * see omen_powersource_event.
@@ -382,6 +416,7 @@ static DEFINE_MUTEX(active_platform_profile_lock);
 static struct input_dev *hp_wmi_input_dev;
 static struct input_dev *camera_shutter_input_dev;
 static struct platform_device *hp_wmi_platform_dev;
+static struct hp_mc_leds hp_multicolor_leds;
 static struct device *platform_profile_device;
 static struct notifier_block platform_power_source_nb;
 static enum platform_profile_option active_platform_profile;
@@ -1068,6 +1103,8 @@ static struct attribute *hp_wmi_attrs[] = {
 };
 ATTRIBUTE_GROUPS(hp_wmi);
 
+static void hp_kbd_brightness_set_by_hwd(u32 event_data);
+
 static void hp_wmi_notify(union acpi_object *obj, void *context)
 {
 	u32 event_id, event_data;
@@ -1168,6 +1205,7 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
 	case HPWMI_PROXIMITY_SENSOR:
 		break;
 	case HPWMI_BACKLIT_KB_BRIGHTNESS:
+		hp_kbd_brightness_set_by_hwd(event_data);
 		break;
 	case HPWMI_PEAKSHIFT_PERIOD:
 		break;
@@ -1430,6 +1468,240 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	return err;
 }
 
+static struct hp_kbd_led_priv *hp_led_get_priv(struct led_classdev *led_cdev)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
+	int zone = mc_cdev - hp_multicolor_leds.devices;
+
+	return &hp_multicolor_leds.priv[zone];
+}
+
+static int hp_kbd_backlight_set_rgb_color(int zone, int red, int green, int blue)
+{
+	int ret;
+	u8 color_table[128];
+
+	/*
+	 * Get the current color table and then change only the relevant parts.
+	 */
+	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY,
+				   HPWMI_BACKLIGHT, color_table,
+				   zero_if_sup(color_table),
+				   sizeof(color_table));
+	if (ret)
+		return ret;
+
+	/*
+	 * RGB color data starts at offset 25 +3 per zone (r g b)
+	 * e.g. if zone 1 starts in 25 zone 2 starts in 28
+	 */
+	color_table[HP_COLOR_TABLE_PADDING + zone * 3]     = red;
+	color_table[HP_COLOR_TABLE_PADDING + zone * 3 + 1] = green;
+	color_table[HP_COLOR_TABLE_PADDING + zone * 3 + 2] = blue;
+
+	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_SET_QUERY, HPWMI_BACKLIGHT,
+				   color_table, sizeof(color_table), sizeof(color_table));
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	return 0;
+}
+
+static bool hp_kbd_backlight_is_on(void)
+{
+	u8 data;
+	int ret;
+
+	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY, HPWMI_BACKLIGHT, &data,
+				sizeof(data), sizeof(data));
+
+	if (ret)
+		return false;
+
+	return data == HPWMI_BACKLIGHT_SET_ON_QUERY;
+}
+
+static int hp_kbd_set_brightness(struct led_classdev *led_cdev,
+					enum led_brightness brightness)
+{
+	struct hp_kbd_led_priv *priv = hp_led_get_priv(led_cdev);
+	struct led_classdev_mc *mc_cdev;
+	struct led_classdev_mc *device;
+	int red, green, blue;
+	int ret;
+
+	if (!hp_kbd_backlight_is_on()) {
+		u8 data = HPWMI_BACKLIGHT_SET_ON_QUERY;
+
+		ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_SET_QUERY,
+					   HPWMI_BACKLIGHT, &data,
+					   sizeof(data), sizeof(data));
+		if (ret)
+			return ret;
+
+		/*
+		 * Turning the backlight on via WMI turns all zones,
+		 * so we need to restore the other zones' off state.
+		 */
+		for (int i = 0; i < ARRAY_SIZE(hp_multicolor_leds.devices); i++) {
+			if (i == priv->zone)
+				continue;
+
+			device = &hp_multicolor_leds.devices[i];
+			if (!device->led_cdev.name)
+				continue;
+			hp_kbd_backlight_set_rgb_color(i,
+				device->subled_info[0].brightness,
+				device->subled_info[1].brightness,
+				device->subled_info[2].brightness);
+		}
+	}
+
+	led_cdev->brightness = brightness;
+
+	mc_cdev = lcdev_to_mccdev(led_cdev);
+	led_mc_calc_color_components(mc_cdev, brightness);
+
+	red = mc_cdev->subled_info[0].brightness;
+	green = mc_cdev->subled_info[1].brightness;
+	blue = mc_cdev->subled_info[2].brightness;
+
+	return hp_kbd_backlight_set_rgb_color(priv->zone, red, green, blue);
+}
+
+static void hp_kbd_brightness_set_by_hwd(u32 event_data)
+{
+	struct device *dev = &hp_wmi_platform_dev->dev;
+	struct hp_kbd_led_priv *priv;
+	struct led_classdev *led_cdev;
+	u8 brightness;
+
+	for (int zone = 0; zone < ARRAY_SIZE(hp_multicolor_leds.devices); zone++) {
+		if (!hp_multicolor_leds.devices[zone].led_cdev.name)
+			continue;
+
+		led_cdev = &hp_multicolor_leds.devices[zone].led_cdev;
+
+		if (!led_cdev->dev)
+			continue;
+
+		priv = hp_led_get_priv(led_cdev);
+
+		if (event_data == 0x2) {
+			brightness = priv->last_brightness ?
+				     priv->last_brightness : LED_FULL;
+		} else if (event_data == 0x0) {
+			priv->last_brightness = led_cdev->brightness;
+			brightness = LED_OFF;
+		} else {
+			dev_warn(dev,
+				 "Unknown keyboard backlight event - 0x%x\n",
+				 event_data);
+			return;
+		}
+
+		led_cdev->brightness = brightness;
+		led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
+	}
+}
+
+static int __init hp_mc_leds_register(int num_zones)
+{
+	u8 color_table[128];
+	int ret;
+
+	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY, HPWMI_BACKLIGHT,
+		  color_table, zero_if_sup(color_table),
+		  sizeof(color_table));
+
+	if (ret)
+		return ret;
+
+	for (int zone = 0; zone < num_zones; zone++) {
+		struct led_classdev_mc *multicolor_led_dev;
+		struct led_classdev *led_cdev;
+		struct mc_subled *mc_subled_info;
+		struct hp_kbd_led_priv *priv;
+		struct device *dev;
+
+		dev = &hp_wmi_platform_dev->dev;
+		multicolor_led_dev = &hp_multicolor_leds.devices[zone];
+		led_cdev = &multicolor_led_dev->led_cdev;
+		priv = &hp_multicolor_leds.priv[zone];
+
+		if (num_zones == 1)
+			led_cdev->name = devm_kasprintf(dev, GFP_KERNEL,
+							"hp::kbd_backlight");
+		else if (num_zones > 1)
+			led_cdev->name = devm_kasprintf(dev, GFP_KERNEL,
+							"hp::kbd_backlight_zone%d",
+							zone);
+
+		if (!led_cdev->name)
+			return -ENOMEM;
+		led_cdev->brightness = hp_kbd_backlight_is_on() ?
+				       LED_FULL : LED_OFF;
+		led_cdev->max_brightness = LED_FULL;
+		led_cdev->brightness_set_blocking = hp_kbd_set_brightness;
+		led_cdev->flags = LED_CORE_SUSPENDRESUME |
+				  LED_RETAIN_AT_SHUTDOWN |
+				  LED_BRIGHT_HW_CHANGED;
+
+		mc_subled_info = devm_kzalloc(dev,
+					      sizeof(*mc_subled_info) * 3,
+					      GFP_KERNEL);
+		if (!mc_subled_info)
+			return -ENOMEM;
+
+		mc_subled_info[0].color_index = LED_COLOR_ID_RED;
+		mc_subled_info[1].color_index = LED_COLOR_ID_GREEN;
+		mc_subled_info[2].color_index = LED_COLOR_ID_BLUE;
+
+		for (int i = 0; i < 3; i++) {
+			int off = HP_COLOR_TABLE_PADDING + zone * 3 + i;
+
+			mc_subled_info[i].channel = zone * 3 + i;
+			mc_subled_info[i].intensity = color_table[off];
+			mc_subled_info[i].brightness = LED_FULL;
+		}
+
+		multicolor_led_dev->subled_info = mc_subled_info;
+		multicolor_led_dev->num_colors = 3;
+
+		ret = devm_led_classdev_multicolor_register(dev,
+							    multicolor_led_dev);
+		if (ret) {
+			dev_err(dev, "Failed to register multicolor RGB backlight\n");
+			return ret;
+		}
+
+		/* Initialize private data */
+		priv->zone = zone;
+		priv->last_brightness = LED_FULL;
+	}
+	return 0;
+}
+
+static int __init hp_kbd_rgb_setup(void)
+{
+	u8 keyboard_type;
+	int ret = hp_wmi_perform_query(HPWMI_GET_KEYBOARD_TYPE_QUERY, HPWMI_GM, &keyboard_type,
+			 sizeof(keyboard_type), sizeof(keyboard_type));
+	if (ret)
+		return ret;
+
+	switch (keyboard_type) {
+	case HP_KEYBOARD_TYPE_FOURZONE_WITH_NUMPAD:
+	case HP_KEYBOARD_TYPE_FOURZONE_WITHOUT_NUMPAD:
+		return hp_mc_leds_register(4);
+	case HP_KEYBOARD_TYPE_SINGLEZONE_WITH_NUMPAD:
+	case HP_KEYBOARD_TYPE_SINGLEZONE_WITHOUT_NUMPAD:
+		return hp_mc_leds_register(1);
+	default:
+		return 0;
+	}
+}
+
 static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
 {
 	int tp;
@@ -2230,6 +2502,10 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 
 	thermal_profile_setup(device);
 
+	err = hp_kbd_rgb_setup();
+	if (err)
+		dev_err(&device->dev, "Failed to initialize keyboard RGB\n");
+
 	return 0;
 }
 
-- 
2.53.0

