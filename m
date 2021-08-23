Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B45C4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 14:15:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4967561372
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 14:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhHWOQK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Aug 2021 10:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhHWOQJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Aug 2021 10:16:09 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF68C061575
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Aug 2021 07:15:26 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so88174wml.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Aug 2021 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=e6KHc5PUBQiap0ReR9r8KlGCuR9kxU/YMup+28aJKYQ=;
        b=sMnyrNgo19VP2fA+9HTzG/e5Ubj4QQ1oWpSxaBdupgDo5p7Y1AHyJDhNYq8mALPKwh
         TIDc1V0VsrHaZD+pWM5SLkvMXPjNOMr50nxmoZLYrZu67w6LHRI7uY+y2Ov53jnYx1eV
         Tx6ZvJg+r9crz+/0ekqyr0A5a/hGe31ww28sak6G/j0c9xRcpOxRDbDqau6IkE+8FfH8
         SBCOyQB6ea/YdNkS0Ej9NTVlYuGohs2hSwZKo8GEFEObVZyu5MxzfuumRflCVt4kmP1P
         mjHdnRRJ4yrhg0lApdu17pYJ41g/V4yJDY/2Y9OiaoxGg1TQ8g8yoh6ws1g+el78Wnvj
         zhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=e6KHc5PUBQiap0ReR9r8KlGCuR9kxU/YMup+28aJKYQ=;
        b=K38P/dGVQhVvNTxFspX7x7qVu3eRBd+B2j3ivQ/kvVZhrfi0zqt4kQ6GTrd0PKvnx9
         oP31UzFnTDC9/4U92NRjDFw+dokqfeHMizOXQ9Ah6HAF6DlTZxD3XuFg+d6ZnfiwXVfj
         pHFI4avjqZ4QkwjVpm7c2wu9o4e2eSOuvnRLxCHvejAFjL4fRpHYWt8AuzNvXIsO9FSP
         EeMrLwuyIxqxfkdDS12L2mxRZwspHrbZkSoRUfkNAJEl3nI+mgZTWGztRgWCifCxQqfg
         6Vl3HVieIo7thxK0V1dTLIdHpjUR22WuWI4X3sQrvluZ6ZoolhEae/Xyq9lVqgPIEJ0Q
         cmsQ==
X-Gm-Message-State: AOAM531SSU71GbIYF+jJw0NP1xp5ddACrsZwL3tW1nOv+W8ZuAOnJIzO
        ZAn4rCtTlWGWAv7zwPuom5ogoIg9IkD5dIkh
X-Google-Smtp-Source: ABdhPJyGkxQky7mYQ9bf0xKJBlYQBO8/LXnlSWqnHAC7QZf97f1l52hFiquH0dqXvHIX5E84rNF0qg==
X-Received: by 2002:a05:600c:1d11:: with SMTP id l17mr16455019wms.58.1629728124140;
        Mon, 23 Aug 2021 07:15:24 -0700 (PDT)
Received: from omen.localdomain ([77.78.198.93])
        by smtp.gmail.com with ESMTPSA id i21sm15271415wrb.62.2021.08.23.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 07:15:23 -0700 (PDT)
Date:   Mon, 23 Aug 2021 16:15:21 +0200
From:   Enver Balalic <balalic.enver@gmail.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com, jdelvare@suse.com,
        linux@roeck-us.net, platform-driver-x86@vger.kernel.org
Cc:     pobrn@protonmail.com
Subject: [PATCH v2] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <20210823141521.2gxhsoqx7brrovfl@omen.localdomain>
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

Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
---
 drivers/platform/x86/Kconfig  |   1 +
 drivers/platform/x86/hp-wmi.c | 302 ++++++++++++++++++++++++++++++++--
 2 files changed, 292 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index d12db6c316ea..f0b3d94e182b 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -431,6 +431,7 @@ config HP_WMI
 	tristate "HP WMI extras"
 	depends on ACPI_WMI
 	depends on INPUT
+	depends on HWMON
 	depends on RFKILL || RFKILL = n
 	select INPUT_SPARSEKMAP
 	select ACPI_PLATFORM_PROFILE
diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 027a1467d009..20cf8a32e76e 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -22,6 +22,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
+#include <linux/hwmon.h>
 #include <linux/acpi.h>
 #include <linux/rfkill.h>
 #include <linux/string.h>
@@ -39,6 +40,7 @@ MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=aut
 
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
+#define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
 
 enum hp_wmi_radio {
 	HPWMI_WIFI	= 0x0,
@@ -89,10 +91,18 @@ enum hp_wmi_commandtype {
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
+	HPWMI_GM    = 0x20008,
 };
 
 enum hp_wmi_hardware_mask {
@@ -120,12 +130,23 @@ enum hp_wireless2_bits {
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
 	HP_THERMAL_PROFILE_COOL			= 0x02
 };
 
+static const char *const hp_wmi_temp_label[] = {
+	"HDD",
+};
+
 #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
 #define IS_SWBLOCKED(x) !(x & HPWMI_POWER_SOFT)
 
@@ -279,6 +300,27 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	return ret;
 }
 
+static int hp_wmi_get_fan_speed(int fan)
+{
+	int fsh, fsl, fan_speed;
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
+	// sometimes one of these can be negative
+	fan_speed = ((fsh > 0 ? fsh : 0) << 8) | (fsl > 0 ? fsl : 0);
+
+	return fan_speed;
+}
+
 static int hp_wmi_read_int(int query)
 {
 	int val = 0, ret;
@@ -302,6 +344,61 @@ static int hp_wmi_hw_state(int mask)
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
 static int __init hp_wmi_bios_2008_later(void)
 {
 	int state = 0;
@@ -878,6 +975,58 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
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
@@ -946,19 +1095,34 @@ static int thermal_profile_setup(void)
 	int err, tp;
 
 	tp = thermal_profile_get();
-	if (tp < 0)
-		return tp;
+	if (tp >= 0) {
+		/*
+		* call thermal profile write command to ensure that the firmware correctly
+		* sets the OEM variables for the DPTF
+		*/
+		err = thermal_profile_set(tp);
+		if (err)
+			return err;
 
-	/*
-	 * call thermal profile write command to ensure that the firmware correctly
-	 * sets the OEM variables for the DPTF
-	 */
-	err = thermal_profile_set(tp);
-	if (err)
-		return err;
+		platform_profile_handler.profile_get = platform_profile_get;
+		platform_profile_handler.profile_set = platform_profile_set;
+	}
+
+	tp = omen_thermal_profile_get();
+	if (tp >= 0) {
+		/*
+		* call thermal profile write command to ensure that the firmware correctly
+		* sets the OEM variables for the DPTF
+		*/
+		err = omen_thermal_profile_set(tp);
+		if (err < 0)
+			return err;
 
-	platform_profile_handler.profile_get = platform_profile_get,
-	platform_profile_handler.profile_set = platform_profile_set,
+		platform_profile_handler.profile_get = platform_profile_omen_get;
+		platform_profile_handler.profile_set = platform_profile_omen_set;
+	} else {
+		return tp;
+	}
 
 	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
 	set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
@@ -973,6 +1137,8 @@ static int thermal_profile_setup(void)
 	return 0;
 }
 
+static int hp_wmi_hwmon_init(void);
+
 static int __init hp_wmi_bios_setup(struct platform_device *device)
 {
 	/* clear detected rfkill devices */
@@ -984,6 +1150,8 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 	if (hp_wmi_rfkill_setup(device))
 		hp_wmi_rfkill2_setup(device);
 
+	hp_wmi_hwmon_init();
+
 	thermal_profile_setup();
 
 	return 0;
@@ -1068,6 +1236,118 @@ static struct platform_driver hp_wmi_driver = {
 	.remove = __exit_p(hp_wmi_bios_remove),
 };
 
+static umode_t hp_wmi_hwmon_is_visible(const void *data,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (hp_wmi_read_int(HPWMI_HDDTEMP_QUERY) >= 0)
+			return 0444;
+		else
+			return 0;
+	case hwmon_pwm:
+		return 0644;
+	case hwmon_fan:
+		if (hp_wmi_get_fan_speed(channel) >= 0)
+			return 0444;
+		else
+			return 0;
+	default:
+		return 0;
+	}
+}
+
+static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	switch (type) {
+	case hwmon_temp:
+		return hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
+	case hwmon_fan:
+		int ret = hp_wmi_get_fan_speed(channel);
+
+		if (ret < 0)
+			return -EINVAL;
+		*val = ret;
+		return 0;
+	case hwmon_pwm:
+		return hp_wmi_fan_speed_max_get();
+	default:
+		return -EINVAL;
+	};
+}
+
+static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long val)
+{
+	switch (type) {
+	case hwmon_pwm:
+		switch (val) {
+		case 0:
+			// 1 is no fan speed control(automatic), which is 1 for us
+			return hp_wmi_fan_speed_max_set(1);
+		case 2:
+			// 2 is automatic speed control, which is 0 for us
+			return hp_wmi_fan_speed_max_set(0);
+		default:
+			// we don't support manual fan speed control
+			return -EOPNOTSUPP;
+		}
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int hp_wmi_hwmon_read_string(struct device *dev,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel, const char **str)
+{
+	switch (type) {
+	case hwmon_temp:
+		*str = hp_wmi_temp_label[channel];
+		break;
+	default:
+		return -EOPNOTSUPP; /* unreachable */
+	}
+	return 0;
+}
+
+static const struct hwmon_channel_info *info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE),
+	NULL
+};
+
+static const struct hwmon_ops ops = {
+	.is_visible = hp_wmi_hwmon_is_visible,
+	.read = hp_wmi_hwmon_read,
+	.read_string = hp_wmi_hwmon_read_string,
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
+		pr_err("Could not register hp hwmon device\n");
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

