Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCD62222A9
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 Oct 2026 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791099462; cv=none; b=guWPAX3nByzYgM4+voAJGau2edNYMoy+eZMDNcEg9eEcJItlwoxDcJidf1/860M9N3WS1FOKzAbCR+pGMVn8IUyfeu7dKhqGuygLUni6BUU2UDHuQ3y5QwbVt+0T6xtpQ7IJPzeiDnkSgSF6PMscH+4LqDIGBRTWb3LT0fOj4eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791099462; c=relaxed/simple;
	bh=RItvgbLaQ3Vo+TCFzPOddaXRn8McJuRPreP1gE8GHfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=feqOlvT3My3pCMw70qAkiuhMlgCLQSfGTbizVK2IpN8CakltuAztNNfJKsGgpStH1iWQXbl+E9UzgHHiUnwKg44hoqYEpnA/igPZqAx/c8MocRPwfLiKU+6W+zqvVj3frOnc2mGT+62m40NnSmUP/mCakha78PjD9tW62rS5cx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dX4attVY; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dX4attVY"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so203638f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 04 Oct 2026 00:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791099459; x=1791704259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8oi3hJYRwGp21iBvFZ5toif0bQQe4wJElm6vixFNBY=;
        b=dX4attVYJh/cpr8/1M38DbsTo2U5Hbk0RmfKSNvgdcJDxmHisjJJhDvSgMfPLjXSgL
         kD3k0Dw+UihjIP2w1EXsN5Uo31qbFXTfs7VsECGiGrF1maMr2jRw8ptnxJoZSOTqTG9Z
         lYiXaC8BtMbof2Q1JU5u53ws3ZFh258NR5LFgGNg2DigI5bYwhm9ljowROA73vSupH1h
         UMPAQ8w1vJozNFB08RMppv8woIH0FBzOKammyiK9jsVaiwwVrqJi+VWnOQyUjmVt82b4
         COL0RPJa13/GZ0vmJa5FxpWFMdPFlmoLiRXR/4APGBe1xhhBiQQMwKX6CF9Yfgk2Rf2+
         EMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791099459; x=1791704259;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d8oi3hJYRwGp21iBvFZ5toif0bQQe4wJElm6vixFNBY=;
        b=u1bjfsFFh/+EOYIdlFfJOvxCPVtuTCEWu/LRecFA7LQcwqSzPhXXmIozbkoHs80A+l
         dTtiFq97Yq9+TRE9imcYvgoumBx7GFrpNkGAwMtqdAg1hbXQMR1mknYmSz7yRRJj2c90
         PZ6FSs22Ce6jAjI0TdVIRZGBdIk5na33VZVJHrq0dYWmJLFRswS6SBPeizRePVBMSFXM
         f7FXblndQ0LwHMVrY9pI6TkzwZcgUIeqbSV4pu6/Hv2/yUEB0zD89o3l73f6CH8DG71s
         fVnCgizfEJQe9Wqv3s9A6tFJUz3H6dSLyNrnYN9oWsDeuG2QwrbRv19EGq5Zs97v6B0W
         IhPA==
X-Forwarded-Encrypted: i=1; AKwUvBwnkqcoFRf/gNxBPqGJdj87iMcmhnsv5JXILAZ27tB+wi0vRvlbn5w36IJJRpSsttvi6nI5dXsTF00POoa2mdSAywHY@vger.kernel.org
X-Gm-Message-State: AFuF++kbtTGp2blJ6d8DoIsjXVB1NKx60gQsAffcTKgPJFKnVJ6VrbE0
	r17Xos+PcE/k7LDpuMd0llavHNJQG4gltytD729wlvSCyjerZZGMm+Oi
X-Gm-Gg: AYBFou15ndILZ1v1827OMwfShOZKw4s9Ooa5I8S0uyaUgIJeNsWz0Y/oS9HLasbykiM
	AcEMCZOCyOKcXl9kGpPZZNiqZ+ZhVkO43ImEGP60G3FOoO8ayVLtXaSQmTF2ZevxbTx1beOhOTj
	KQAiwxRILBFAyubZgllL0vLp9wMVtZK8PDOfJN/FzRATvQ7gjwDBMaK4eTZu5GX1r2rd5zUhVkp
	smhPgq1G+3Hdu9BzFeiy8HRa6sBD16pe6zKmIBzrS3UIGzeD8hS7GVA2KFgAvSJ6jT444sf0u0/
	rwwP8vYbofY96MSbK5eCYrVeueqZylvlZJuiHMX7xM99860dktsCfc7U+y2TpsCSe4x4o3mmjzz
	HdVqSRDZWJAOu3KX6ETZL1VSj3BvMlPWCgCr7IHeYLOZT5eK+ub9Fp1W/JP1VK2mXH2czTemf1d
	hjJXD34cicFcOhGzlEMKex78+WIEuRrpGpr76OMbvz4CTnytfHjE1MfLJQ+GeW8rpW
X-Received: by 2002:a05:600c:4e93:b0:4a0:1ef1:b62b with SMTP id 5b1f17b1804b1-4a02754f71emr135458775e9.10.1791099458387;
        Sun, 04 Oct 2026 00:37:38 -0700 (PDT)
Received: from acer ([46.196.225.200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm224931145e9.1.2026.10.04.00.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 00:37:37 -0700 (PDT)
From: =?UTF-8?q?Batuhan=20G=C3=BCvener?= <tuugspeedman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Lee, Chun-Yi" <jlee@suse.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Batuhan=20G=C3=BCvener?= <tuugspeedman@gmail.com>
Subject: [PATCH] platform/x86: acer-wmi: Add 4-zone RGB keyboard backlight support for Nitro AN515-58
Date: Sun,  4 Oct 2026 10:33:57 +0300
Message-ID: <20261004073357.9918-1-tuugspeedman@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the 4-zone RGB keyboard backlight found on the Acer Nitro
AN515-58 laptop.

To establish userspace control, an initial static mode preamble via
Method 20 is sent during probe and resume to prepare for cases where
the firmware may already be running a dynamic lighting effect
that would otherwise interfere with the driver's static per-zone control.
Subsequent per-zone color and brightness
adjustments are handled via ACPI Method 6.

The keyboard backlight consists of four evenly divided zones without a
dedicated "middle" or "wasd" zone. Therefore, the zones are exposed as
left, center-left, center-right, and right to match the physical layout.

The 4-zone RGB implementation in this patch is derived from the
character-device-based approach in JafarAkhondali's
acer-predator-turbo-and-rgb-keyboard-linux-module
adapted here to the standard Linux LED multicolor class. Zone bitmask
encoding and the WMI enable-method discovery additionally draw on an
unmerged RFC by Dirga Yuza for the same hardware
https://lore.kernel.org/all/20260503062131.158944-1-dirgayuza123@gmail.com/

Signed-off-by: Batuhan Güvener <tuugspeedman@gmail.com>
---
 drivers/platform/x86/Kconfig    |   1 +
 drivers/platform/x86/acer-wmi.c | 343 +++++++++++++++++++-------------
 2 files changed, 208 insertions(+), 136 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 957034f..d8bfa73 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -180,6 +180,7 @@ config ACER_WMI
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
+	imply LEDS_CLASS_MULTICOLOR
 	select ACPI_PLATFORM_PROFILE
 	help
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 6a1bf2f..2095e1a 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -20,6 +20,7 @@
 #include <linux/fixp-arith.h>
 #include <linux/backlight.h>
 #include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/acpi.h>
@@ -36,7 +37,9 @@
 #include <linux/unaligned.h>
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
-#include <linux/led-class-multicolor.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/mutex.h>
 
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
@@ -77,16 +80,31 @@ MODULE_LICENSE("GPL");
 #define ACER_WMID_GET_GAMING_FAN_SPEED_METHODID 17
 #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
 #define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
+#define WMID_GUID4 "7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56"
 #define ACER_WMID_SET_GAMING_STATIC_LED_METHODID 6
+#define ACER_WMID_SET_GAMING_DYNAMIC_LED_METHODID 5
+#define ACER_WMID_SET_GAMINGKBBL_METHODID 20
 
-#define ACER_GAMING_KBL_ZONES 4
+/*
+ * Gaming keyboard backlight enable command payload:
+ * Bit 3: Controller enable flag
+ * Bits [43:40]: Target 4-zone keyboard backlight interface
+ */
+#define ACER_GAMING_LED_KBBL_ENABLE	(BIT_ULL(3) | (15ULL << 40))
+
+/*
+ * Method 6 Gaming Static LED payload format:
+ * Bits [23:16]: Red intensity
+ * Bits [15:8]:  Green intensity
+ * Bits [7:0]:   Blue intensity
+ */
+#define ACER_GAMING_STATIC_LED_RED_MASK   GENMASK(23, 16)
+#define ACER_GAMING_STATIC_LED_GREEN_MASK GENMASK(15, 8)
+#define ACER_GAMING_STATIC_LED_BLUE_MASK  GENMASK(7, 0)
 
 #define ACER_GAMING_FAN_BEHAVIOR_CPU BIT(0)
 #define ACER_GAMING_FAN_BEHAVIOR_GPU BIT(3)
 
-/* Bit 3 enables keyboard backlight update */
-#define ACER_GAMING_KBL_SET_ON BIT(3)
-
 #define ACER_GAMING_FAN_BEHAVIOR_STATUS_MASK GENMASK_ULL(7, 0)
 #define ACER_GAMING_FAN_BEHAVIOR_ID_MASK GENMASK_ULL(15, 0)
 #define ACER_GAMING_FAN_BEHAVIOR_SET_CPU_MODE_MASK GENMASK(17, 16)
@@ -98,9 +116,6 @@ MODULE_LICENSE("GPL");
 #define ACER_GAMING_FAN_SPEED_ID_MASK GENMASK_ULL(7, 0)
 #define ACER_GAMING_FAN_SPEED_VALUE_MASK GENMASK_ULL(15, 8)
 
-/* Bits [43:40] selects target zones, setting all bits targets all zones*/
-#define ACER_GAMING_KBL_SET_ALL_ZONES GENMASK(43, 40)
-
 #define ACER_GAMING_MISC_SETTING_STATUS_MASK GENMASK_ULL(7, 0)
 #define ACER_GAMING_MISC_SETTING_INDEX_MASK GENMASK_ULL(7, 0)
 #define ACER_GAMING_MISC_SETTING_VALUE_MASK GENMASK_ULL(15, 8)
@@ -320,7 +335,6 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_PLATFORM_PROFILE	BIT(10)
 #define ACER_CAP_HWMON			BIT(11)
 #define ACER_CAP_PWM			BIT(12)
-#define ACER_CAP_KBL_FOUR_ZONE_RGB	BIT(13)
 
 /*
  * Interface type flags
@@ -400,6 +414,112 @@ struct wmi_interface {
 /* The static interface pointer, points to the currently detected interface */
 static struct wmi_interface *interface;
 
+/*Defining payload packages, zone information and general LED protocols */
+static acpi_status WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *out);
+
+struct led_information {
+	struct led_classdev_mc led_general;
+	struct mc_subled led_colors[3];
+	struct rgb_wmi *parent;
+	u8 zone_id;
+}; /* Stores zone-id that's target for function.*/
+
+struct rgb_wmi {
+	struct mutex led_lock; /* Making sure inputs sent to EC don't collide. */
+	struct led_information zones[4];
+}; /* Stores general information (mutex lock and applying previous LED info to 4 zones.)*/
+
+/* Method 20: set KB attributes. We make RGB static to ensure control is at userspace. */
+static int acer_kbd_set_static_preamble(u8 ec_brightness)
+{
+	u8 gm_input[16] = {
+		0,               /* mode = static */
+		0,               /* speed */
+		ec_brightness,   /* brightness, 0-100 */
+		0,               /* reserved */
+		0,               /* direction */
+		0, 0, 0,         /* R/G/B (unused in static per-zone) */
+		3, 1, 0, 0, 0, 0, 0, 0
+	};
+	struct acpi_buffer input = { .length = sizeof(gm_input), .pointer = gm_input };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	u64 resp = 0;
+
+	status = wmi_evaluate_method(WMID_GUID4, 0,
+				     ACER_WMID_SET_GAMINGKBBL_METHODID,
+				     &input, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = output.pointer;
+	if (obj && obj->type == ACPI_TYPE_BUFFER) {
+		if (obj->buffer.length >= 8)
+			resp = get_unaligned_le64(obj->buffer.pointer);
+		else if (obj->buffer.length >= 4)
+			resp = get_unaligned_le32(obj->buffer.pointer);
+		else if (obj->buffer.length >= 1)
+			resp = ((u8 *)obj->buffer.pointer)[0];
+	}
+
+	kfree(obj);
+
+	return resp ? -EIO : 0;
+}
+
+/* Method 6: set per-zone color as a u64: (be32(rgb) << 32) | zone_bit */
+static int send_zone_color(u8 zone_bit, u8 r, u8 g, u8 b)
+{
+	acpi_status status;
+	u64 resp = 0;
+	u64 payload;
+	u32 rgb;
+
+	rgb = FIELD_PREP(ACER_GAMING_STATIC_LED_RED_MASK, r) |
+	      FIELD_PREP(ACER_GAMING_STATIC_LED_GREEN_MASK, g) |
+	      FIELD_PREP(ACER_GAMING_STATIC_LED_BLUE_MASK, b);
+
+	payload = (u64)cpu_to_be32(rgb) | zone_bit;
+
+	status = WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_STATIC_LED_METHODID,
+					payload, &resp);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return resp ? -EIO : 0;
+}
+
+static int rgb_set(struct led_classdev *led_cdev, enum led_brightness brightness)
+{
+	struct led_classdev_mc *general_mcolor = lcdev_to_mccdev(led_cdev);
+	struct led_information *led_info = container_of(general_mcolor,
+							struct led_information,
+							led_general);
+	struct rgb_wmi *data = led_info->parent;
+	u8 r, g, b;
+	int ret;
+
+	mutex_lock(&data->led_lock);
+
+	if (brightness == 0) {
+		r = 0;
+		g = 0;
+		b = 0;
+	} else {
+		led_mc_calc_color_components(general_mcolor, brightness);
+		r = led_info->led_colors[0].brightness;
+		g = led_info->led_colors[1].brightness;
+		b = led_info->led_colors[2].brightness;
+	}
+
+	/* After packet is constructed, we are applying that to desired zone. */
+	ret = send_zone_color((u8)led_info->zone_id, r, g, b);
+
+	mutex_unlock(&data->led_lock);
+	return ret;
+}
+
 /*
  * Embedded Controller quirks
  * Some laptops require us to directly access the EC to either enable or query
@@ -416,11 +536,71 @@ struct quirk_entry {
 	u8 gpu_fans;
 	u8 predator_v4;
 	u8 pwm;
-	u8 kbl_four_zone_rgb;
+	u8 kbl_four_zone;
 };
 
 static struct quirk_entry *quirks;
 
+static int acer_kbd_rgb_init(struct platform_device *device, struct rgb_wmi *rgb_data)
+{
+	static const char * const zone_names[] = {
+		"acer-wmi:rgb:kbd_zoned_backlight-left",
+		"acer-wmi:rgb:kbd_zoned_backlight-center-left",
+		"acer-wmi:rgb:kbd_zoned_backlight-center-right",
+		"acer-wmi:rgb:kbd_zoned_backlight-right",
+	};
+	u64 gaming_sysinfo;
+	acpi_status status;
+	int ret, i;
+
+	/* Checking for device model. */
+	if (!quirks || !quirks->kbl_four_zone)
+		return -ENODEV;
+
+	status = WMI_gaming_execute_u64(ACER_WMID_GET_GAMING_SYS_INFO_METHODID, 0, &gaming_sysinfo);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	status = WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_LED_METHODID,
+					ACER_GAMING_LED_KBBL_ENABLE, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	/* Execute the preamble function on module startup. */
+	ret = acer_kbd_set_static_preamble(100);
+	if (ret)
+		pr_warn("Failed to set static preamble on init: %d\n", ret);
+
+	mutex_init(&rgb_data->led_lock);
+
+	/* Prepare zone attributes and create device paths. */
+	for (i = 0; i < ARRAY_SIZE(zone_names); i++) {
+		struct led_information *zone = &rgb_data->zones[i];
+
+		zone->zone_id = BIT(i);
+		zone->parent  = rgb_data;
+
+		zone->led_colors[0].color_index = LED_COLOR_ID_RED;
+		zone->led_colors[1].color_index = LED_COLOR_ID_GREEN;
+		zone->led_colors[2].color_index = LED_COLOR_ID_BLUE;
+
+		zone->led_general.subled_info = zone->led_colors;
+		zone->led_general.num_colors  = 3;
+
+		zone->led_general.led_cdev.name = zone_names[i];
+		zone->led_general.led_cdev.max_brightness = 255;
+		zone->led_general.led_cdev.brightness_set_blocking = rgb_set;
+		zone->led_general.led_cdev.flags = LED_RETAIN_AT_SHUTDOWN;
+
+		ret = devm_led_classdev_multicolor_register(&device->dev,
+							    &zone->led_general);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void __init set_quirks(void)
 {
 	if (quirks->mailled)
@@ -439,9 +619,6 @@ static void __init set_quirks(void)
 
 	if (quirks->pwm)
 		interface->capability |= ACER_CAP_PWM;
-
-	if (quirks->kbl_four_zone_rgb)
-		interface->capability |= ACER_CAP_KBL_FOUR_ZONE_RGB;
 }
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
@@ -473,7 +650,9 @@ static struct quirk_entry quirk_acer_travelmate_2490 = {
 static struct quirk_entry quirk_acer_nitro_an515_58 = {
 	.predator_v4 = 1,
 	.pwm = 1,
-	.kbl_four_zone_rgb = 1,
+	.cpu_fans = 1,
+	.gpu_fans = 1,
+	.kbl_four_zone = 1,
 };
 
 static struct quirk_entry quirk_acer_predator_ph315_53 = {
@@ -2780,121 +2959,11 @@ static u32 get_wmid_devices(void)
 
 static int acer_wmi_hwmon_init(void);
 
-#if IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR)
-
-static int acer_wmi_poll_and_enable_zones(void)
-{
-	acpi_status status;
-
-	status = WMI_gaming_execute_u64(ACER_WMID_GET_GAMING_SYS_INFO_METHODID,
-		0, NULL);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-	status = WMI_gaming_execute_u64(ACER_WMID_GET_GAMING_LED_METHODID,
-		ACER_GAMING_KBL_SET_ON |
-		ACER_GAMING_KBL_SET_ALL_ZONES,
-		NULL);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	return 0;
-}
-
-struct acer_wmi_led_zone {
-	struct led_classdev_mc mc_cdev;
-	struct mc_subled subled_info[3];
-	u8 zone_id;
-};
-
-struct led_four_zone_set_param {
-	u8 zone;
-	u8 red;
-	u8 green;
-	u8 blue;
-} __packed;
-
-static struct acer_wmi_led_zone kbl_zones[ACER_GAMING_KBL_ZONES];
-
-static int acer_wmi_mc_brightness_set(struct led_classdev *led_cdev,
-	enum led_brightness brightness)
-{
-	int err;
-	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
-	struct acer_wmi_led_zone *zone = container_of(mc_cdev,
-		struct acer_wmi_led_zone, mc_cdev);
-	struct led_four_zone_set_param params;
-	struct acpi_buffer input;
-	acpi_status status;
-
-	err = led_mc_calc_color_components(mc_cdev, brightness);
-	if (err)
-		return err;
-
-	led_cdev->brightness = brightness;
-
-	params.zone = zone->zone_id;
-	params.red = mc_cdev->subled_info[0].brightness;
-	params.green = mc_cdev->subled_info[1].brightness;
-	params.blue = mc_cdev->subled_info[2].brightness;
-
-	input.length = sizeof(params);
-	input.pointer = &params;
-
-	status = wmi_evaluate_method(WMID_GUID4, 0,
-		ACER_WMID_SET_GAMING_STATIC_LED_METHODID, &input, NULL);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	return 0;
-}
-
-static enum led_brightness
-acer_wmi_mc_brightness_get(struct led_classdev *led_cdev)
-{
-	return led_cdev->brightness;
-}
-
-static int acer_wmi_register_four_zone_leds(struct device *dev)
-{
-	int i, ret;
-
-	for (i = 0; i < ACER_GAMING_KBL_ZONES; i++) {
-		struct acer_wmi_led_zone *zone = &kbl_zones[i];
-
-		memset(zone, 0, sizeof(*zone));
-
-		zone->subled_info[0].color_index = LED_COLOR_ID_RED;
-		zone->subled_info[1].color_index = LED_COLOR_ID_GREEN;
-		zone->subled_info[2].color_index = LED_COLOR_ID_BLUE;
-
-		zone->mc_cdev.subled_info = zone->subled_info;
-		zone->mc_cdev.num_colors = 3;
-
-		/* WMI uses a bitmask as for zones. BIT(i) selects zone i */
-		zone->zone_id = BIT(i);
-
-		zone->mc_cdev.led_cdev.name = devm_kasprintf(dev, GFP_KERNEL,
-			"acer-wmi::kbd_backlight_%d", i + 1);
-		zone->mc_cdev.led_cdev.dev = dev;
-		zone->mc_cdev.led_cdev.brightness_set_blocking =
-			acer_wmi_mc_brightness_set;
-		zone->mc_cdev.led_cdev.brightness_get =
-			acer_wmi_mc_brightness_get;
-		zone->mc_cdev.led_cdev.max_brightness = 255;
-
-		ret = devm_led_classdev_multicolor_register(dev,
-			&zone->mc_cdev);
-		if (ret)
-			return ret;
-	}
-	return 0;
-}
-
-#endif /* IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR) */
-
 /*
  * Platform device
  */
+static struct rgb_wmi acer_rgb_data;
+
 static int acer_platform_probe(struct platform_device *device)
 {
 	int err;
@@ -2927,21 +2996,15 @@ static int acer_platform_probe(struct platform_device *device)
 			goto error_hwmon;
 	}
 
-	if (has_cap(ACER_CAP_KBL_FOUR_ZONE_RGB)) {
-#if IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR)
-		err = acer_wmi_poll_and_enable_zones();
-		if (err)
-			goto error_kbl_four_zone_rgb;
-
-		err = acer_wmi_register_four_zone_leds(&device->dev);
+	/*Defining 4 zone RGB quirk.*/
+	if (quirks->kbl_four_zone) {
+		err = acer_kbd_rgb_init(device, &acer_rgb_data);
 		if (err)
-			goto error_kbl_four_zone_rgb;
-#endif /* IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR) */
+			pr_warn("Failed to initialize 4-zone RGB keyboard: %d\n", err);
 	}
 
 	return 0;
 
-error_kbl_four_zone_rgb:
 error_hwmon:
 error_platform_profile:
 	acer_rfkill_exit();
@@ -2991,6 +3054,7 @@ static int acer_suspend(struct device *dev)
 static int acer_resume(struct device *dev)
 {
 	struct acer_data *data = &interface->data;
+	int ret;
 
 	if (!data)
 		return -ENOMEM;
@@ -3004,8 +3068,15 @@ static int acer_resume(struct device *dev)
 	if (acer_wmi_accel_dev)
 		acer_gsensor_init();
 
+	/* Ensuring keyboard is at static mode after resuming from sleep. */
+	if (quirks && quirks->kbl_four_zone) {
+		ret = acer_kbd_set_static_preamble(100);
+		if (ret)
+			pr_warn("Failed to restore keyboard static mode on resume: %d\n", ret);
+	}
 	return 0;
 }
+
 #else
 #define acer_suspend	NULL
 #define acer_resume	NULL
-- 
2.55.0

