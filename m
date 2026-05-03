Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389053A8732
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 06:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777789789; cv=none; b=bKItH0dc2nL6D9SEkw24bMoVQ2CqpIWvF150OXFbCpiF48AgwDIOL2ODBGK2KQ8qMsmYKE0KLTq/y+Jxp4JPALGq9dFq25z0eA8Ld/4WnrcB8y9K1a80hPybUQF7sLkXjxuWf2CqnIUHeYMDraEGua81o3PFeOCGcLzTyrSoq2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777789789; c=relaxed/simple;
	bh=mdsCB9NUijdx/PBiNzxe16iJ7aD3DpMF/MoeoRyKRHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZwQ/yaJVV0wOkdZ0mt7RF+VXB07ceSxcFdEu2SM3Y5RZiA/oAKhJl4o6czZtu8WA+qN+p6Haon5iLJJis6yhfFV//iYPCp/CjTxL9dVMRl7KSlR2Of/YTZXxdUsmu8fOMVs7sTiS3IPbjgv7You0Cu5HOVBpnvaS0Zz4YukWpqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TweUFQlN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TweUFQlN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3650cb6e128so209833a91.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 02 May 2026 23:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777789787; x=1778394587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=heTnm44f2RbPQ5l0/QoaBcR38mobtWWBtLTRITXxPHU=;
        b=TweUFQlN3EpekppBBE/o7qvNvRfQZDbs0AS9+rLjgWu3I6085dfr8ilUAgJG//D+Hd
         veaHImOHILU1f0Vaka5Phyk8Ns3cwHjO5pSA+EdDXIU7M7fr7mmLKUh4Q9deiusbmF39
         cXm5Pk/EGOua+zgiwC3qCovQTwBjdotUyYOBo6Pd/Ea+jIjh/j7+Zkmt3xN6FGSNIaT0
         bZ3Q7csBpcCc2om7ucHaraTCJMoaM1eZ3mCOLNMvqRe/uFSLN5ljTxqRZ9u6JXq/WTk8
         b/GLsgsyI2tqWG15UpK97hywA0Lf99zwLjkIKd2mT4bM1V2VDCo8BN3WU8dcFGbwmULC
         Gw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777789787; x=1778394587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heTnm44f2RbPQ5l0/QoaBcR38mobtWWBtLTRITXxPHU=;
        b=CyadlJCXBruB0sd8k4DS2JaVCeyBBUh5TofUE/il9alXz5nYQNloCHuk/SfLCFivBK
         KeOKUBo1/GZ1eIY9/oHGLBatbCpmLjEWrcEKaz346kYmY/6jCmzOqT3lONZmCylQtrSK
         jM+MtOsz4Q/S+MV0HhturwhwkKeBA6rXDgT0LO3rfyfSw/2Uyc6EuGHgx8AQrF2t4IFU
         J/tm5U/Xwuw7p1DfnMuz+jAujq0ulcwiLkDfLIGuUfFQjiUm2LSTKIb/Nnz75Kiy/v6J
         6FmYAy9S09yAS+isXEtODxMe83XF3AHaK02Qi8sDOgJZIgD9+fCWYKk9Vd+5Vw+3hPk9
         pq9Q==
X-Gm-Message-State: AOJu0YwFOZPsuTKJay4zEuIkw2lJVJTSnLPHIFl5HIKFsPADDkUyqe7C
	cfjCfs4Ze7OkdAwVORPJ0ujLFMCsFfX5UnrWcIg575rgaf0H/f/5HI94
X-Gm-Gg: AeBDievkMRTcUJ18H7kOsJmjmQ5XG/NS6ykVPI8J7aYfDwTvNCTtwmaWvyU2xPa1V6r
	Ao4X4UpWc5N0mNfxt+hgPYZLw4eh2HFyLbvFxR/iCOEOMPbJ9+Q4KT0K5g2qP38YW5MYiLdvFeb
	zj5wnQjg+N7cuSIRrdjtaA52u9MFeSCMIDM/tyAuzyEkumJA9pPXLXNQvZ1UAT5+bD2QxXnegmz
	saK5FNcFdB+BbL47CiXvvX+N9Z7T+E1kBh3jEaWykJxe6r7CWdYDCJCbRqaBKpaiiuMBJrnb8AN
	RMCz0z6IPvLTQjrgWEg/dfE4vi3SgL9drPlyE/RIgECRVmneGxqAKFU/4hIn22nG3cr9ryXc1G+
	ThICU5TgwUIr8TwT25m3NF9P8bkgY3pUw50EsXx9yy5JZ1u2IukdKATjP5L5g81CXAhkJIibfVu
	7AuXTj0FyXv4M48afTX1ZDOMeZUYnXeW3rj/enS9euQWpq8xz/qp4=
X-Received: by 2002:a17:90b:1dd1:b0:35f:b9f1:fde9 with SMTP id 98e67ed59e1d1-3650ce4e36fmr2972043a91.3.1777789787279;
        Sat, 02 May 2026 23:29:47 -0700 (PDT)
Received: from localhost.localdomain ([103.80.236.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00b175sm9977717a91.9.2026.05.02.23.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 23:29:46 -0700 (PDT)
From: Dirga Yuza <dirgayuza123@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jlee@suse.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dirga Yuza <dirgayuza123@gmail.com>
Subject: [RFC PATCH] platform/x86: acer-wmi: Add 4-zone RGB keyboard support for Acer Nitro AN515-58
Date: Sun,  3 May 2026 13:19:34 +0700
Message-ID: <20260503062131.158944-1-dirgayuza123@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC adds support for the 4-zone RGB keyboard on Acer Nitro AN515-58.

The current acer-wmi driver does not provide support for keyboard
backlighting. This patch introduces support for the multicolor LED class
to expose the four zones to userspace.

The implementation is based on prior reverse engineering efforts of WMI
method ID 6, particularly from Linuwu-sense and
JafarAkhondali's acer-predator-turbo-and-rgb-keyboard-linux-module.
I do not have access to a Windows environment to capture traces myself.

This has been tested on AN515-58 under regular usage, including
suspend/resume cycles.

I would appreciate feedback on the following points:

1. acer-wmi currently relies heavily on global state. This patch follows
the same approach for consistency. However, given that this introduces
new structures, would it be preferable to group them into a private
per-device structure, or is continuing with global data acceptable
for this driver?

2. The current implementation registers four independent
led_classdev_mc instances (acer-wmi::kbd_backlight_N). In testing with
KDE Plasma, color updates propagate correctly across all zones, but
brightness control appears to affect only the last registered zone.

Is independent registration the preferred approach, or would a
single aggregate device controlling all zones be more appropriate?

3. The patch currently hardcodes four zones via a model-specific quirk.
Is this the preferred approach, or is there a more scalable way to handle
varying zone counts across devices?

4. Kconfig is updated to add `imply LEDS_CLASS_MULTICOLOR` for acer-wmi
and the code is wrapped with IS_REACHABLE() to handle optional dependency
on LEDS_CLASS. Is this correct approach for optional multicolor
LED support?

On this hardware, brightness keys (Fn+F9/F10) generate KEY_KBDILLUMUP/DOWN
input events. In my testing, these events do not appear to generate
corresponding release events, unlike other keys
(e.g., touchpad toggle or rfkill), which emit proper press/release pairs.

In KDE Plasma, this is interpreted as a held key, causing continuous
brightness changes.

Synthesizing press/release events would result in both the EC and
userspace adjusting their own brightness, causing duplicate changes.
The current behavior (no release events) also leads to incorrect
interpretation as a held key in KDE Plasma.

Therefore it is unclear whether these events should be ignored
entirely or handled in some other way. Guidance on the preferred approach
would be appreciated.

This is my first contribution in the kernel, so any feedback on design,
coding style, or submission process would be appreciated.

Signed-off-by: Dirga Yuza <dirgayuza123@gmail.com>
---
 drivers/platform/x86/Kconfig    |   1 +
 drivers/platform/x86/acer-wmi.c | 141 ++++++++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 2ffa4ecf6..c7eb3a587 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -179,6 +179,7 @@ config ACER_WMI
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
+	imply LEDS_CLASS_MULTICOLOR
 	select ACPI_PLATFORM_PROFILE
 	help
 	  This is a driver for newer Acer (and Wistron) laptops. It adds
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index e0eaaefb1..b7c3d6c28 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -36,6 +36,7 @@
 #include <linux/unaligned.h>
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
+#include <linux/led-class-multicolor.h>
 
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
@@ -76,10 +77,16 @@ MODULE_LICENSE("GPL");
 #define ACER_WMID_GET_GAMING_FAN_SPEED_METHODID 17
 #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
 #define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
+#define ACER_WMID_SET_GAMING_STATIC_LED_METHODID 6
+
+#define ACER_GAMING_KBL_ZONES 4
 
 #define ACER_GAMING_FAN_BEHAVIOR_CPU BIT(0)
 #define ACER_GAMING_FAN_BEHAVIOR_GPU BIT(3)
 
+/* Bit 3 enables keyboard backlight update */
+#define ACER_GAMING_KBL_SET_ON BIT(3)
+
 #define ACER_GAMING_FAN_BEHAVIOR_STATUS_MASK GENMASK_ULL(7, 0)
 #define ACER_GAMING_FAN_BEHAVIOR_ID_MASK GENMASK_ULL(15, 0)
 #define ACER_GAMING_FAN_BEHAVIOR_SET_CPU_MODE_MASK GENMASK(17, 16)
@@ -91,6 +98,9 @@ MODULE_LICENSE("GPL");
 #define ACER_GAMING_FAN_SPEED_ID_MASK GENMASK_ULL(7, 0)
 #define ACER_GAMING_FAN_SPEED_VALUE_MASK GENMASK_ULL(15, 8)
 
+/* Bits [43:40] selects target zones, setting all bits targets all zones*/
+#define ACER_GAMING_KBL_SET_ALL_ZONES GENMASK(43, 40)
+
 #define ACER_GAMING_MISC_SETTING_STATUS_MASK GENMASK_ULL(7, 0)
 #define ACER_GAMING_MISC_SETTING_INDEX_MASK GENMASK_ULL(7, 0)
 #define ACER_GAMING_MISC_SETTING_VALUE_MASK GENMASK_ULL(15, 8)
@@ -310,6 +320,7 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_PLATFORM_PROFILE	BIT(10)
 #define ACER_CAP_HWMON			BIT(11)
 #define ACER_CAP_PWM			BIT(12)
+#define ACER_CAP_KBL_FOUR_ZONE_RGB	BIT(13)
 
 /*
  * Interface type flags
@@ -405,6 +416,7 @@ struct quirk_entry {
 	u8 gpu_fans;
 	u8 predator_v4;
 	u8 pwm;
+	u8 kbl_four_zone_rgb;
 };
 
 static struct quirk_entry *quirks;
@@ -427,6 +439,9 @@ static void __init set_quirks(void)
 
 	if (quirks->pwm)
 		interface->capability |= ACER_CAP_PWM;
+
+	if (quirks->kbl_four_zone_rgb)
+		interface->capability |= ACER_CAP_KBL_FOUR_ZONE_RGB;
 }
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
@@ -458,6 +473,7 @@ static struct quirk_entry quirk_acer_travelmate_2490 = {
 static struct quirk_entry quirk_acer_nitro_an515_58 = {
 	.predator_v4 = 1,
 	.pwm = 1,
+	.kbl_four_zone_rgb = 1,
 };
 
 static struct quirk_entry quirk_acer_predator_ph315_53 = {
@@ -2762,6 +2778,118 @@ static u32 get_wmid_devices(void)
 
 static int acer_wmi_hwmon_init(void);
 
+#if IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR)
+
+static int acer_wmi_poll_and_enable_zones(void)
+{
+	acpi_status status;
+
+	status = WMI_gaming_execute_u64(ACER_WMID_GET_GAMING_SYS_INFO_METHODID,
+		0, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	status = WMI_gaming_execute_u64(ACER_WMID_GET_GAMING_LED_METHODID,
+		ACER_GAMING_KBL_SET_ON |
+		ACER_GAMING_KBL_SET_ALL_ZONES,
+		NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+struct acer_wmi_led_zone {
+	struct led_classdev_mc mc_cdev;
+	struct mc_subled subled_info[3];
+	u8 zone_id;
+};
+
+struct led_four_zone_set_param {
+	u8 zone;
+	u8 red;
+	u8 green;
+	u8 blue;
+} __packed;
+
+static struct acer_wmi_led_zone kbl_zones[ACER_GAMING_KBL_ZONES];
+
+static int acer_wmi_mc_brightness_set(struct led_classdev *led_cdev,
+	enum led_brightness brightness)
+{
+	int err;
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
+	struct acer_wmi_led_zone *zone = container_of(mc_cdev,
+		struct acer_wmi_led_zone, mc_cdev);
+	struct led_four_zone_set_param params;
+	struct acpi_buffer input;
+	acpi_status status;
+
+	err = led_mc_calc_color_components(mc_cdev, brightness);
+	if (err)
+		return err;
+
+	led_cdev->brightness = brightness;
+
+	params.zone = zone->zone_id;
+	params.red = mc_cdev->subled_info[0].brightness;
+	params.green = mc_cdev->subled_info[1].brightness;
+	params.blue = mc_cdev->subled_info[2].brightness;
+
+	input.length = sizeof(params);
+	input.pointer = &params;
+
+	status = wmi_evaluate_method(WMID_GUID4, 0,
+		ACER_WMID_SET_GAMING_STATIC_LED_METHODID, &input, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+static enum led_brightness
+acer_wmi_mc_brightness_get(struct led_classdev *led_cdev)
+{
+	return led_cdev->brightness;
+}
+
+static int acer_wmi_register_four_zone_leds(struct device *dev)
+{
+	int i, ret;
+
+	for (i = 0; i < ACER_GAMING_KBL_ZONES; i++) {
+		struct acer_wmi_led_zone *zone = &kbl_zones[i];
+
+		memset(zone, 0, sizeof(*zone));
+
+		zone->subled_info[0].color_index = LED_COLOR_ID_RED;
+		zone->subled_info[1].color_index = LED_COLOR_ID_GREEN;
+		zone->subled_info[2].color_index = LED_COLOR_ID_BLUE;
+
+		zone->mc_cdev.subled_info = zone->subled_info;
+		zone->mc_cdev.num_colors = 3;
+
+		/* WMI uses a bitmask as for zones. BIT(i) selects zone i */
+		zone->zone_id = BIT(i);
+
+		zone->mc_cdev.led_cdev.name = devm_kasprintf(dev, GFP_KERNEL,
+			"acer-wmi::kbd_backlight_%d", i + 1);
+		zone->mc_cdev.led_cdev.dev = dev;
+		zone->mc_cdev.led_cdev.brightness_set_blocking =
+			acer_wmi_mc_brightness_set;
+		zone->mc_cdev.led_cdev.brightness_get =
+			acer_wmi_mc_brightness_get;
+		zone->mc_cdev.led_cdev.max_brightness = 255;
+
+		ret = devm_led_classdev_multicolor_register(dev,
+			&zone->mc_cdev);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+#endif /* IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR) */
+
 /*
  * Platform device
  */
@@ -2797,8 +2925,21 @@ static int acer_platform_probe(struct platform_device *device)
 			goto error_hwmon;
 	}
 
+	if (has_cap(ACER_CAP_KBL_FOUR_ZONE_RGB)) {
+#if IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR)
+		err = acer_wmi_poll_and_enable_zones();
+		if (err)
+			goto error_kbl_four_zone_rgb;
+
+		err = acer_wmi_register_four_zone_leds(&device->dev);
+		if (err)
+			goto error_kbl_four_zone_rgb;
+#endif /* IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR) */
+	}
+
 	return 0;
 
+error_kbl_four_zone_rgb:
 error_hwmon:
 error_platform_profile:
 	acer_rfkill_exit();
-- 
2.54.0

