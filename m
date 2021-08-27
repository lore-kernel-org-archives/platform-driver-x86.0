Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14107C432BE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Aug 2021 12:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7F11600D0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Aug 2021 12:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245094AbhH0Mb7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Aug 2021 08:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhH0Mb6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Aug 2021 08:31:58 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FA3C061757
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Aug 2021 05:31:09 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id u9so10127040wrg.8
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Aug 2021 05:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=IPF9EQZrQaQsfjOweJg9NA5/UwvdhOweXwRADLs9feI=;
        b=GMxgqaD4ua1Md/pvnqKFZi7jknoecYzLspfeA2Ksh7HgNnh0STgdEK+D2Ge0/L7oIC
         FfCs1I3fhkr8zMHplUv7MbVls0vZZv2Aa6g/zf952hUdjhVJBThykXgawzh1ovuEiMfd
         eiWHvaVFmzgwVx1hdPx6UFft7kFY43zh/nNRZ6UiU0leh5Do8BRsvApn99qI8XF8e3xW
         NYlTK8xjEoBqt8ohPEVHXNP1W4MjiLbhujkYE3a1qxKO7Sc9e07FtKkHI73ouu1Wpa1N
         Ero+73EDkIx5XeVJOABL9N6wKqZtSO1XuFNvm4F/LeNmI+F2YkWfhfwL6eBbC6ev7w1q
         oiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=IPF9EQZrQaQsfjOweJg9NA5/UwvdhOweXwRADLs9feI=;
        b=o7xAaI1J7EKYB7t0ZhDPB7rEcRPNO5rRa3GzrD3Huq//v4tJ0rRo+34wCyV8PtB6S1
         OjZYRyk1YBrm8yfAya7isl1QLX4jlMNJvmT0VXZb0HzhN7K86l6D+9c7ZvO6fo49egkM
         NoI2/VZ9IMfeP4ebyOcJdAgO+evJs7VnZWN5/HhA69MXB9kKyOcCwk+Hvlm4Z3Qr8MBE
         CJIjopl4xLuFgollJ4X/xV4W8M9dk7CMIiKBeSN9wMuFNayXHZSjt8j3KmD8TPXSMsO2
         n7M98GI1U81FAlokbxee15sxmq75lS4zl+LXmLHNRc0+dOw7EUXkXDo9X6LvRm/KooU0
         QLYA==
X-Gm-Message-State: AOAM532MqXaWNGUxUauw+eeWWSIGFhSk2Rx5aKOtT9bpiS6Wt5mHtDgj
        b326PPUSU28C7L+FTNgKm2c=
X-Google-Smtp-Source: ABdhPJxxZGEicub78aeg+Na/6DvB2Eh9pEjkIWfNIH5yvtG8qj6u7P/INQRk4fG7xoKvxbBh12ojdA==
X-Received: by 2002:adf:dc0b:: with SMTP id t11mr9716335wri.259.1630067468085;
        Fri, 27 Aug 2021 05:31:08 -0700 (PDT)
Received: from omen.localdomain ([2a02:27b0:5500:a8b0:7c9a:c884:c89:912d])
        by smtp.gmail.com with ESMTPSA id w1sm10726564wmc.19.2021.08.27.05.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 05:31:07 -0700 (PDT)
Date:   Fri, 27 Aug 2021 14:31:05 +0200
From:   Enver Balalic <balalic.enver@gmail.com>
To:     mgross@linux.intel.com, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com,
        linux@roeck-us.net, hdegoede@redhat.com
Subject: [PATCH v4] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <20210827123105.mlrpsfmpbcfunuqc@omen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch adds support for HP Omen laptops.
It adds support for most things that can be controlled via the
Windows Omen Command Center application.

 - Fan speed monitoring through hwmon
 - Platform Profile support (cool, balanced, performance)
 - Max fan speed function toggle

Also exposes the existing HDD temperature through hwmon since
this driver didn't use hwmon before this patch.

This patch has been tested on a 2020 HP Omen 15 (AMD) 15-en0023dx.

 - V1
   Initial Patch
 - V2
   Use standard hwmon ABI attributes
   Add existing non-standard "hddtemp" to hwmon
 - V3
   Fix overflow issue in "hp_wmi_get_fan_speed"
   Map max fan speed value back to hwmon values on read
   Code style fixes
   Fix issue with returning values from "hp_wmi_hwmon_read",
   the value to return should be written to val and not just
   returned from the function
 - V4
   Use DMI Board names to detect if a device should use the omen
   specific thermal profile method.
   Select HWMON instead of depending on it.
   Code style fixes.
   Replace some error codes with more specific/meaningful ones.
   Remove the HDD temperature from HWMON since we don't know what
   unit it's expressed in.
   Handle error from hp_wmi_hwmon_init

Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
---
 drivers/platform/x86/Kconfig  |   1 +
 drivers/platform/x86/hp-wmi.c | 336 ++++++++++++++++++++++++++++++++--
 2 files changed, 325 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index d12db6c316ea..2ab0dcf5b598 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -434,6 +434,7 @@ config HP_WMI
 	depends on RFKILL || RFKILL = n
 	select INPUT_SPARSEKMAP
 	select ACPI_PLATFORM_PROFILE
+	select HWMON
 	help
 	 Say Y here if you want to support WMI-based hotkeys on HP laptops and
 	 to read data from WMI such as docking or ambient light sensor state.
diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 027a1467d009..44030f513453 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -22,9 +22,11 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
+#include <linux/hwmon.h>
 #include <linux/acpi.h>
 #include <linux/rfkill.h>
 #include <linux/string.h>
+#include <linux/dmi.h>
 
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI hotkeys driver");
@@ -39,6 +41,25 @@ MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=aut
 
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
+#define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
+
+/* DMI board names of devices that should use the omen specific path for
+ * thermal profiles.
+ * This was obtained by taking a look in the windows omen command center
+ * app and parsing a json file that they use to figure out what capabilities
+ * the device should have.
+ * A device is considered an omen if the DisplayName in that list contains
+ * "OMEN", and it can use the thermal profile stuff if the "Feature" array
+ * contains "PerformanceControl".
+ */
+static const char * const omen_thermal_profile_boards[] = {
+	"84DA", "84DB", "84DC", "8574", "8575", "860A", "87B5", "8572", "8573",
+	"8600", "8601", "8602", "8605", "8606", "8607", "8746", "8747", "8749",
+	"874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "878C",
+	"88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88FD",
+	"88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "8912",
+	"8917", "8918", "8949", "894A", "89EB"
+};
 
 enum hp_wmi_radio {
 	HPWMI_WIFI	= 0x0,
@@ -89,10 +110,18 @@ enum hp_wmi_commandtype {
 	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
 };
 
+enum hp_wmi_gm_commandtype {
+	HPWMI_FAN_SPEED_GET_QUERY = 0x11,
+	HPWMI_SET_PERFORMANCE_MODE = 0x1A,
+	HPWMI_FAN_SPEED_MAX_GET_QUERY = 0x26,
+	HPWMI_FAN_SPEED_MAX_SET_QUERY = 0x27,
+};
+
 enum hp_wmi_command {
 	HPWMI_READ	= 0x01,
 	HPWMI_WRITE	= 0x02,
 	HPWMI_ODM	= 0x03,
+	HPWMI_GM	= 0x20008,
 };
 
 enum hp_wmi_hardware_mask {
@@ -120,6 +149,13 @@ enum hp_wireless2_bits {
 	HPWMI_POWER_FW_OR_HW	= HPWMI_POWER_BIOS | HPWMI_POWER_HARD,
 };
 
+
+enum hp_thermal_profile_omen {
+	HP_OMEN_THERMAL_PROFILE_DEFAULT     = 0x00,
+	HP_OMEN_THERMAL_PROFILE_PERFORMANCE = 0x01,
+	HP_OMEN_THERMAL_PROFILE_COOL        = 0x02,
+};
+
 enum hp_thermal_profile {
 	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
 	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
@@ -169,6 +205,8 @@ static struct platform_device *hp_wmi_platform_dev;
 static struct platform_profile_handler platform_profile_handler;
 static bool platform_profile_support;
 
+static bool use_omen_thermal_profile;
+
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
 static struct rfkill *wwan_rfkill;
@@ -279,6 +317,24 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	return ret;
 }
 
+static int hp_wmi_get_fan_speed(int fan)
+{
+	u8 fsh, fsl;
+	char fan_data[4] = { fan, 0, 0, 0 };
+
+	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
+				       &fan_data, sizeof(fan_data),
+				       sizeof(fan_data));
+
+	if (ret != 0)
+		return -EINVAL;
+
+	fsh = fan_data[2];
+	fsl = fan_data[3];
+
+	return (fsh << 8) | fsl;
+}
+
 static int hp_wmi_read_int(int query)
 {
 	int val = 0, ret;
@@ -302,6 +358,75 @@ static int hp_wmi_hw_state(int mask)
 	return !!(state & mask);
 }
 
+static int omen_thermal_profile_set(int mode)
+{
+	char buffer[2] = {0, mode};
+	int ret;
+
+	if (mode < 0 || mode > 2)
+		return -EINVAL;
+
+	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
+				   &buffer, sizeof(buffer), sizeof(buffer));
+
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	return mode;
+}
+
+static bool detect_is_omen_thermal_profile(void)
+{
+	int i;
+
+	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
+
+	for (i = 0; i < ARRAY_SIZE(omen_thermal_profile_boards); i++) {
+		if (strcmp(board_name, omen_thermal_profile_boards[i]) == 0)
+			return true;
+	}
+
+	return false;
+}
+
+static int omen_thermal_profile_get(void)
+{
+	u8 data;
+
+	int ret = ec_read(HP_OMEN_EC_THERMAL_PROFILE_OFFSET, &data);
+
+	if (ret)
+		return ret;
+
+	return data;
+}
+
+static int hp_wmi_fan_speed_max_set(int enabled)
+{
+	int ret;
+
+	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
+				   &enabled, sizeof(enabled), sizeof(enabled));
+
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	return enabled;
+}
+
+static int hp_wmi_fan_speed_max_get(void)
+{
+	int val = 0, ret;
+
+	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
+				   &val, sizeof(val), sizeof(val));
+
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
+
+	return val;
+}
+
 static int __init hp_wmi_bios_2008_later(void)
 {
 	int state = 0;
@@ -878,6 +1003,58 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 	return err;
 }
 
+static int platform_profile_omen_get(struct platform_profile_handler *pprof,
+				enum platform_profile_option *profile)
+{
+	int tp;
+
+	tp = omen_thermal_profile_get();
+	if (tp < 0)
+		return tp;
+
+	switch (tp) {
+	case HP_OMEN_THERMAL_PROFILE_PERFORMANCE:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	case HP_OMEN_THERMAL_PROFILE_DEFAULT:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	case HP_OMEN_THERMAL_PROFILE_COOL:
+		*profile = PLATFORM_PROFILE_COOL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int platform_profile_omen_set(struct platform_profile_handler *pprof,
+				enum platform_profile_option profile)
+{
+	int err, tp;
+
+	switch (profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		tp = HP_OMEN_THERMAL_PROFILE_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		tp = HP_OMEN_THERMAL_PROFILE_DEFAULT;
+		break;
+	case PLATFORM_PROFILE_COOL:
+		tp = HP_OMEN_THERMAL_PROFILE_COOL;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	err = omen_thermal_profile_set(tp);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
 static int thermal_profile_get(void)
 {
 	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
@@ -945,20 +1122,39 @@ static int thermal_profile_setup(void)
 {
 	int err, tp;
 
-	tp = thermal_profile_get();
-	if (tp < 0)
-		return tp;
+	if (use_omen_thermal_profile) {
+		tp = omen_thermal_profile_get();
+		if (tp < 0)
+			return tp;
 
-	/*
-	 * call thermal profile write command to ensure that the firmware correctly
-	 * sets the OEM variables for the DPTF
-	 */
-	err = thermal_profile_set(tp);
-	if (err)
-		return err;
+		/*
+		 * call thermal profile write command to ensure that the
+		 * firmware correctly sets the OEM variables
+		 */
+
+		err = omen_thermal_profile_set(tp);
+		if (err < 0)
+			return err;
+
+		platform_profile_handler.profile_get = platform_profile_omen_get;
+		platform_profile_handler.profile_set = platform_profile_omen_set;
+	} else {
+		tp = thermal_profile_get();
+
+		if (tp < 0)
+			return tp;
 
-	platform_profile_handler.profile_get = platform_profile_get,
-	platform_profile_handler.profile_set = platform_profile_set,
+		/*
+		 * call thermal profile write command to ensure that the
+		 * firmware correctly sets the OEM variables for the DPTF
+		 */
+		err = thermal_profile_set(tp);
+		if (err)
+			return err;
+
+		platform_profile_handler.profile_get = platform_profile_get;
+		platform_profile_handler.profile_set = platform_profile_set;
+	}
 
 	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
 	set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
@@ -973,17 +1169,27 @@ static int thermal_profile_setup(void)
 	return 0;
 }
 
+static int hp_wmi_hwmon_init(void);
+
 static int __init hp_wmi_bios_setup(struct platform_device *device)
 {
+	int err;
 	/* clear detected rfkill devices */
 	wifi_rfkill = NULL;
 	bluetooth_rfkill = NULL;
 	wwan_rfkill = NULL;
 	rfkill2_count = 0;
 
+	use_omen_thermal_profile = detect_is_omen_thermal_profile();
+
 	if (hp_wmi_rfkill_setup(device))
 		hp_wmi_rfkill2_setup(device);
 
+	err = hp_wmi_hwmon_init();
+
+	if (err < 0)
+		return err;
+
 	thermal_profile_setup();
 
 	return 0;
@@ -1068,6 +1274,112 @@ static struct platform_driver hp_wmi_driver = {
 	.remove = __exit_p(hp_wmi_bios_remove),
 };
 
+static umode_t hp_wmi_hwmon_is_visible(const void *data,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_pwm:
+		return 0644;
+	case hwmon_fan:
+		if (hp_wmi_get_fan_speed(channel) >= 0)
+			return 0444;
+		break;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	int ret;
+
+	switch (type) {
+	case hwmon_fan:
+		ret = hp_wmi_get_fan_speed(channel);
+
+		if (ret < 0)
+			return ret;
+		*val = ret;
+		return 0;
+	case hwmon_pwm:
+		switch (hp_wmi_fan_speed_max_get()) {
+		case 0:
+			/* 0 is automatic fan, which is 2 for hwmon */
+			*val = 2;
+			return 0;
+		case 1:
+			/* 1 is max fan, which is 0
+			 * (no fan speed control) for hwmon
+			 */
+			*val = 0;
+			return 0;
+		default:
+			/* shouldn't happen */
+			return -ENODATA;
+		}
+	default:
+		return -EINVAL;
+	}
+}
+
+static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_pwm:
+		switch (val) {
+		case 0:
+			/* 0 is no fan speed control (max), which is 1 for us */
+			return hp_wmi_fan_speed_max_set(1);
+		case 2:
+			/* 2 is automatic speed control, which is 0 for us */
+			return hp_wmi_fan_speed_max_set(0);
+		default:
+			/* we don't support manual fan speed control */
+			return -EINVAL;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_channel_info *info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
+	NULL
+};
+
+static const struct hwmon_ops ops = {
+	.is_visible = hp_wmi_hwmon_is_visible,
+	.read = hp_wmi_hwmon_read,
+	.write = hp_wmi_hwmon_write,
+};
+
+static const struct hwmon_chip_info chip_info = {
+	.ops = &ops,
+	.info = info,
+};
+
+static int hp_wmi_hwmon_init(void)
+{
+	struct device *dev = &hp_wmi_platform_dev->dev;
+	struct device *hwmon;
+
+	hwmon = devm_hwmon_device_register_with_info(dev, "hp", &hp_wmi_driver,
+				&chip_info, NULL);
+
+	if (IS_ERR(hwmon)) {
+		dev_err(dev, "Could not register hp hwmon device\n");
+		return PTR_ERR(hwmon);
+	}
+
+	return 0;
+}
+
 static int __init hp_wmi_init(void)
 {
 	int event_capable = wmi_has_guid(HPWMI_EVENT_GUID);
-- 
2.33.0

