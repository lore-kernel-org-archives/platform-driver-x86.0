Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217B41F5C9
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 13:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800399; cv=none; b=eOUQ5Dbu26XpQQm/2TKnEJxWXLH8pHrMXHGOHMlEOH3HVZZQMhhs7D1RAqRYUbA2aWWEhKLWMqd3uxOPQ7miyZiWy5aVMeEluhRxUVAlrrV/woOBAI3N/5CBHHRVz49v4u/7uNuSHzObHFKqH7+Dhn0nj/3mA5ve9b7Bs8U++mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800399; c=relaxed/simple;
	bh=GgTCDQbnUgexFrkANOilkT4JCPBtskdpVFL7CHv8URo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQTfDHKjVA6dOvLvaaC3JMKQ9BxsXOY4VkIMSZgGtxFWGh3Ek5VBcZWyP0CfFflPKgoqm9g4TQ3qYTBFTdhaBrirQr+uPxED6jcinxiYrK1KRE4gnZWcc4yVOvBagKhn9uL8kjiNeAi4KzhlQUarmxcEnARcKiQaz7TLqxUuIQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYDmTiJC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYDmTiJC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso20974755ad.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786800396; x=1787405196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5Ptq6J3I1zDJAH3ElBt92vJlpDCEYTwTmvEKoY+2Xc=;
        b=MYDmTiJCX2+A28bagm11sEwx3KCB8bi1BcKJWu4yS7Kvo/MBSOAhIQK3Nq4KLhhAjP
         2bjmBUKfDRPC4GUAPw1TwiVKd0SN9KjFqRWdC/wIUChLYXyclTk/d5UE2SqQ+E1J8pef
         fQHeze2W0fOtf4Nm0yU8AMWfUDk9rMHigOmtnXwp8XjjvG26nrqyntCdVxvvQFyAOgqT
         jD9+lJxMJrPnYgduXmzuXZNEVHMvAOjZ3l1OHH/+Rswu/E6D3y+eWlBlQtkfr7kF00eV
         na/sTVBl1/2Qub61p8VpE3x2yCY5xOnMhx4/itH0ZngDjjz3kvbwdCOmC8FOuHbkPXy7
         f5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800396; x=1787405196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5Ptq6J3I1zDJAH3ElBt92vJlpDCEYTwTmvEKoY+2Xc=;
        b=NCAfq6Yw4ZqJP0yJcmmmTZ5nVWlaiXkt3y7rx3G81EGMqvsQo7X0tUu+he04wh0BdS
         hm/CrnHZJGV4yzxFNSy7b0NxquAdoFjZ0BfexyiMOT/Nzj2prtnyBDvTvgqLvD7sdN3R
         WTEwGoxfoJMh7MKRaDjA7LhlOZgT+DOCmp9hL2gV/gN4yubkx3zHeGmPnoFzNnNMuvRw
         eSN1NoE9NkE/JunjRw3e9pQX+EyWBHFnr8KnS/vxXzfvtmPRVtBeMRp7gCzAt22lpRSf
         ICbqsHv0VBZs7PVFYMkfUni+RP086ZwgynIh//CCS8ooN7j7GUUJa1jhZ9+QSG8C5Lh7
         FMqA==
X-Forwarded-Encrypted: i=1; AHgh+RoybLvdodVJR1qxwtEIJDOLm1UjrQk3MgKRz19Ibwo2T2nubp00+WiLOefyZEMVHMdO0MH2OVfAv2993/G0tcLsBB1M@vger.kernel.org
X-Gm-Message-State: AOJu0YyD1o8kQq5BZpGHxaPm+ClFY3wh1Dnp+lKbnpABPsBvmgrU2F9E
	Shpv2v/XNyYHBw0MxZvAAfgjLDfESFwZ64QXbqV6t8DHB69O+V9ut0U+
X-Gm-Gg: AR+sD12P224CLxjLBt6l7vSo+OdNkrI+Ul5hwOuENjy2RyYN1N69ZRnSp7tgnF7NXDr
	QrQ7+vk4uPA5GAZi00d/6i4BuWIE/ITejCs/Vh8AaIZBioV/V4JkCv8WNmYp1IDzet4QqHx9U0n
	/bMCyHtjCv9k5USgYNxtYJN3uvlbJPgZqXKRgba1+phgdJu6+DYpiNhpnzk3deYbo9Hgzbenjv2
	wf48IxQ6Tn5GPN0z9OUEL51bDHcBes5zhkL9vepAG6nWwn/pUMf1XTU9Lly0Ey/YpBS+qXWssuC
	aQ81jvFUpfW8Oy41TDGPCAOsFo10EipnDk3fHukZ19v+cWWINl2wTf8EdXB83w/lLuXIW6e+kia
	OC3QXkB5OEMVWFYAxc2wOpPw0RmdM7WZZI2Mw/iz/8niKqrmkGmIWeg09dOsUfF5gbE4trW5o7K
	1gJ+InDrUcrszKrfHSgSdsTIj07PV0TXVf6szv7YUV
X-Received: by 2002:a17:902:ce04:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d3b0d5e658mr154286915ad.12.1786800396295;
        Sat, 15 Aug 2026 06:26:36 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc81a6sm19433245ad.72.2026.08.15.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:35 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com
Subject: [PATCH v3 6/6] platform/x86: bitland-mifs-wmi: Add Redmi laptop support
Date: Sat, 15 Aug 2026 21:25:47 +0800
Message-ID: <20260815132547.29022-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815132547.29022-1-qby140326@gmail.com>
References: <20260815132547.29022-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Redmi laptops (Redmi Book and Redmi G series) use the same MIFS WMI
interface but encode the performance mode values of
WMI_FN_SYSTEM_PER_MODE differently, as reverse engineered from the
Windows GCommandCenter application:

  0 = performance, 1 = balanced, 2 = quiet, 4 = full speed

Add "Redmi Book" and "Redmi G" ops entries selected via DMI:
- Redmi G (board TM2135/TM2137): the full-speed mode is available
- Redmi Book/Xiaomi Book: no full-speed mode
- The performance modes only require AC power (any source); the
  barrel-jack requirement is Bitland-specific

The GCommandCenter application further showed that:
- the CPU power sensor (WMI_FN_CPU_POWER) is only available on Redmi
  machines, gate the hwmon power channel on the ops table
- the refresh-rate-toggle quirk in the CPU fan speed event is
  Redmi-specific, gate it on the ops table instead of applying it
  unconditionally

Also add Redmi support for Fn lock and touchpad lock control
(WMI_FN_FN_LOCK / WMI_FN_TP_LOCK sysfs attributes), keyboard type
detection (hide the RGB kb_mode attribute on white-only backlit
keyboards) and hotkeys (airplane mode -> KEY_RFKILL, ignore the
lock-state and keyboard mode indicator events).

The sysfs attribute group is now registered in probe (instead of via
dev_groups) so that the is_visible callback can access the probe
populated driver data.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 329 +++++++++++++++++++++++-
 1 file changed, 316 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 39824bba49fe..d5b53008bff0 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -14,6 +14,7 @@
 #include <linux/dev_printk.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
@@ -71,6 +72,11 @@ enum bitland_system_ac_mode {
 	WMI_SYSTEM_AC_CIRCULARHOLE	= 2,
 };
 
+enum bitland_kbd_type {
+	WMI_KBD_TYPE_WHITE		= 0,
+	WMI_KBD_TYPE_RGB		= 1,
+};
+
 enum bitland_mifs_power_profile {
 	WMI_PP_BALANCED		= 0,
 	WMI_PP_PERFORMANCE	= 1,
@@ -97,7 +103,21 @@ static const struct bitland_profile_mode_map bitland_mode_map = {
 	.full_speed	= WMI_PP_FULL_SPEED,
 };
 
+/*
+ * Redmi laptops encode the performance mode values differently, as
+ * reverse engineered from the Windows GCommandCenter application: the
+ * app sends value 0 to select the performance mode and value 4 to
+ * select the full-speed mode.
+ */
+static const struct bitland_profile_mode_map redmi_mode_map = {
+	.balanced	= 1,
+	.performance	= 0,
+	.quiet		= 2,
+	.full_speed	= 4,
+};
+
 static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data);
+static int redmi_pp_check_capability(struct bitland_mifs_wmi_data *data);
 
 /*
  * Machine-specific operations. The MIFS WMI interface is shared by
@@ -109,6 +129,8 @@ struct bitland_mifs_ops {
 	const struct bitland_profile_mode_map *mode_map;
 	int (*check_performance_capability)(struct bitland_mifs_wmi_data *data);
 	bool has_full_speed;
+	bool has_cpu_power;
+	bool quirk_refresh_rate_toggle;
 };
 
 static const struct bitland_mifs_ops bitland_ops = {
@@ -118,6 +140,54 @@ static const struct bitland_mifs_ops bitland_ops = {
 	.has_full_speed = true,
 };
 
+static const struct bitland_mifs_ops redmi_book_ops = {
+	.name = "Redmi Book",
+	.mode_map = &redmi_mode_map,
+	.check_performance_capability = redmi_pp_check_capability,
+	.has_cpu_power = true,
+	.quirk_refresh_rate_toggle = true,
+};
+
+static const struct bitland_mifs_ops redmi_g_ops = {
+	.name = "Redmi G",
+	.mode_map = &redmi_mode_map,
+	.check_performance_capability = redmi_pp_check_capability,
+	.has_full_speed = true,
+	.has_cpu_power = true,
+	.quirk_refresh_rate_toggle = true,
+};
+
+static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{
+		/* Redmi G */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "TM2135"),
+		},
+		.driver_data = (void *)&redmi_g_ops,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "TM2137"),
+		},
+		.driver_data = (void *)&redmi_g_ops,
+	},
+	{
+		/* Redmi Book series */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Redmi"),
+		},
+		.driver_data = (void *)&redmi_book_ops,
+	},
+	{
+		/* Xiaomi Book series */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Xiaomi"),
+		},
+		.driver_data = (void *)&redmi_book_ops,
+	},
+	{}
+};
+
 enum bitland_mifs_event_id {
 	WMI_EVENT_RESERVED_1		= 1,
 	WMI_EVENT_RESERVED_2		= 2,
@@ -203,6 +273,8 @@ struct bitland_mifs_wmi_data {
 	struct input_dev *input_dev;
 	struct device *hwmon_dev;
 	struct device *pp_dev;
+	enum bitland_wmi_device_type dev_type;
+	u8 kbd_type;
 	const struct bitland_mifs_ops *ops;
 	enum platform_profile_option saved_profile;
 };
@@ -273,10 +345,11 @@ static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
 	struct bitland_mifs_output output;
 	int ret;
 
-	/* Full-speed/performance mode requires DC power (not USB-C) */
+	/* The performance modes require AC power */
 	if (!power_supply_is_system_supplied())
 		return -EOPNOTSUPP;
 
+	/* Additionally require the barrel-jack power supply (not USB-C) */
 	ret = bitland_mifs_wmi_call(data, &input, &output);
 	if (ret)
 		return ret;
@@ -287,6 +360,15 @@ static int bitland_pp_check_capability(struct bitland_mifs_wmi_data *data)
 	return 0;
 }
 
+static int redmi_pp_check_capability(struct bitland_mifs_wmi_data *data)
+{
+	/* The performance modes require AC power (any source) */
+	if (!power_supply_is_system_supplied())
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static int laptop_profile_set(struct device *dev,
 			      enum platform_profile_option profile)
 {
@@ -337,6 +419,7 @@ static int platform_profile_probe(void *drvdata, unsigned long *choices)
 	set_bit(PLATFORM_PROFILE_BALANCED, choices);
 	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
 
+	/* Full-speed mode is not available on regular Redmi Books */
 	if (data->ops->has_full_speed)
 		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
 
@@ -418,6 +501,13 @@ static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 		default:
 			return -EINVAL;
 		}
+	case hwmon_power:
+		/* WMI_FN_CPU_POWER returns the CPU power draw in watts */
+		input.function = WMI_FN_CPU_POWER;
+		ret = bitland_mifs_wmi_call(data, &input, &res);
+		if (!ret)
+			*val = res.data[0] * MICROWATT_PER_WATT;
+		return ret;
 	default:
 		return -EINVAL;
 	}
@@ -444,6 +534,15 @@ static const struct hwmon_channel_info *laptop_hwmon_info[] = {
 	NULL
 };
 
+static const struct hwmon_channel_info *laptop_hwmon_info_power[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(power, HWMON_P_INPUT),
+	NULL
+};
+
 static const struct hwmon_ops laptop_hwmon_ops = {
 	.visible = 0444,
 	.read = laptop_hwmon_read,
@@ -455,6 +554,11 @@ static const struct hwmon_chip_info laptop_chip_info = {
 	.info = laptop_hwmon_info,
 };
 
+static const struct hwmon_chip_info laptop_chip_info_power = {
+	.ops = &laptop_hwmon_ops,
+	.info = laptop_hwmon_info_power,
+};
+
 static int laptop_kbd_led_set(struct led_classdev *led_cdev,
 			      enum led_brightness value)
 {
@@ -498,6 +602,96 @@ static const char *const gpu_mode_strings[] = {
 	"uma",
 };
 
+static ssize_t fn_lock_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct bitland_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_GET,
+		.reserved2 = 0,
+		.function = WMI_FN_FN_LOCK,
+	};
+	struct bitland_mifs_output res;
+	int ret;
+
+	ret = bitland_mifs_wmi_call(data, &input, &res);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", res.data[0]);
+}
+
+static ssize_t fn_lock_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct bitland_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_SET,
+		.reserved2 = 0,
+		.function = WMI_FN_FN_LOCK,
+	};
+	bool val;
+	int ret;
+
+	if (kstrtobool(buf, &val))
+		return -EINVAL;
+
+	input.payload[0] = val;
+
+	ret = bitland_mifs_wmi_call(data, &input, NULL);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t touchpad_lock_show(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct bitland_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_GET,
+		.reserved2 = 0,
+		.function = WMI_FN_TP_LOCK,
+	};
+	struct bitland_mifs_output res;
+	int ret;
+
+	ret = bitland_mifs_wmi_call(data, &input, &res);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%u\n", res.data[0]);
+}
+
+static ssize_t touchpad_lock_store(struct device *dev, struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct bitland_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_SET,
+		.reserved2 = 0,
+		.function = WMI_FN_TP_LOCK,
+	};
+	bool val;
+	int ret;
+
+	if (kstrtobool(buf, &val))
+		return -EINVAL;
+
+	input.payload[0] = val;
+
+	ret = bitland_mifs_wmi_call(data, &input, NULL);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
 /* GPU Mode: 0:Hybrid, 1:Discrete, 2:UMA */
 static ssize_t gpu_mode_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
@@ -637,17 +831,46 @@ static ssize_t fan_boost_store(struct device *dev,
 	return count;
 }
 
-static const DEVICE_ATTR_RW(gpu_mode);
-static const DEVICE_ATTR_RW(kb_mode);
-static const DEVICE_ATTR_WO(fan_boost);
+static DEVICE_ATTR_RW(gpu_mode);
+static DEVICE_ATTR_RW(kb_mode);
+static DEVICE_ATTR_WO(fan_boost);
+static DEVICE_ATTR_RW(fn_lock);
+static DEVICE_ATTR_RW(touchpad_lock);
 
-static const struct attribute *const laptop_attrs[] = {
+static struct attribute *laptop_attrs[] = {
 	&dev_attr_gpu_mode.attr,
 	&dev_attr_kb_mode.attr,
 	&dev_attr_fan_boost.attr,
+	&dev_attr_fn_lock.attr,
+	&dev_attr_touchpad_lock.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(laptop);
+
+static umode_t laptop_attr_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+
+	/* The sysfs attributes are only supported on the control device */
+	if (data->dev_type != BITLAND_WMI_CONTROL)
+		return 0;
+
+	/*
+	 * White-only backlit keyboards (e.g. Redmi Book series) do not
+	 * support the RGB backlight modes.
+	 */
+	if (attr == &dev_attr_kb_mode.attr &&
+	    data->kbd_type == WMI_KBD_TYPE_WHITE)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group laptop_group = {
+	.attrs = laptop_attrs,
+	.is_visible = laptop_attr_is_visible,
+};
 
 static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_OPEN_APP, 1, 0), { KEY_PROG1 } },
@@ -699,6 +922,34 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), {} },
 	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), {} },
 
+	/* Airplane mode toggle (Redmi) */
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_AIRPLANE_MODE, 0, 0), { KEY_RFKILL } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_AIRPLANE_MODE, 1, 0), { KEY_RFKILL } },
+
+	/*
+	 * Touchpad state change (Redmi Fn+F7). The EC performs the actual
+	 * toggle itself; userspace can control the state via the
+	 * touchpad_lock sysfs attribute.
+	 */
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_TOUCHPAD_STATE, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_TOUCHPAD_STATE, 1, 0), {} },
+
+	/* Keyboard backlight mode change */
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_MODE, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_MODE, 1, 0), {} },
+
+	/* Lock-state indicator events */
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_CAPSLOCK_STATE, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_CAPSLOCK_STATE, 1, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_NUMLOCK_STATE, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_NUMLOCK_STATE, 1, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_SCROLLLOCK_STATE, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_SCROLLLOCK_STATE, 1, 0), {} },
+
+	/* Win key lock (Redmi gaming mode) */
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_WIN_KEY_LOCK, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_WIN_KEY_LOCK, 1, 0), {} },
+
 	/* Fn+`/1/2/3/4 */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 1, 0), { KEY_F13 } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 1, 0), { KEY_F14 } },
@@ -744,6 +995,36 @@ static int bitland_notifier_callback(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+static int bitland_detect_kbd_type(struct bitland_mifs_wmi_data *data)
+{
+	struct bitland_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_GET,
+		.reserved2 = 0,
+		.function = WMI_FN_KBD_TYPE,
+	};
+	struct bitland_mifs_output res;
+	int ret;
+
+	ret = bitland_mifs_wmi_call(data, &input, &res);
+	if (ret)
+		return ret;
+
+	data->kbd_type = res.data[0];
+	return 0;
+}
+
+static void bitland_detect_ops(struct bitland_mifs_wmi_data *data)
+{
+	const struct dmi_system_id *id;
+
+	id = dmi_first_match(bitland_mifs_dmi_table);
+	if (id)
+		data->ops = id->driver_data;
+
+	dev_dbg(&data->wdev->dev, "Detected machine ops: %s\n", data->ops->name);
+}
+
 static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct bitland_mifs_wmi_data *drv_data;
@@ -761,6 +1042,9 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 		return -ENOMEM;
 
 	drv_data->wdev = wdev;
+	drv_data->dev_type = dev_type;
+	/* Default to RGB so the RGB attributes stay visible if detection fails */
+	drv_data->kbd_type = WMI_KBD_TYPE_RGB;
 	drv_data->ops = &bitland_ops;
 
 	ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
@@ -769,6 +1053,8 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 
 	dev_set_drvdata(&wdev->dev, drv_data);
 
+	bitland_detect_ops(drv_data);
+
 	if (dev_type == BITLAND_WMI_EVENT) {
 		/* Register input device for hotkeys */
 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
@@ -794,12 +1080,28 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (IS_ERR(drv_data->pp_dev))
 		return PTR_ERR(drv_data->pp_dev);
 
+	/* Detect the keyboard type */
+	ret = bitland_detect_kbd_type(drv_data);
+	if (ret)
+		dev_dbg(&wdev->dev, "Failed to detect keyboard type, assuming RGB: %d\n", ret);
+
+	ret = devm_device_add_group(&wdev->dev, &laptop_group);
+	if (ret)
+		return ret;
+
 	/* Register hwmon */
-	drv_data->hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
-								   "bitland_mifs",
-								   drv_data,
-								   &laptop_chip_info,
-								   NULL);
+	if (drv_data->ops->has_cpu_power)
+		drv_data->hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
+									   "bitland_mifs",
+									   drv_data,
+									   &laptop_chip_info_power,
+									   NULL);
+	else
+		drv_data->hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
+									   "bitland_mifs",
+									   drv_data,
+									   &laptop_chip_info,
+									   NULL);
 	if (IS_ERR(drv_data->hwmon_dev))
 		return PTR_ERR(drv_data->hwmon_dev);
 
@@ -851,6 +1153,7 @@ static void bitland_mifs_wmi_report_key(struct wmi_device *wdev, u32 payload)
 static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 				    const struct wmi_buffer *buffer)
 {
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
 	const struct bitland_mifs_event *event = buffer->data;
 	struct bitland_fan_notify_data fan_data;
 	u32 payload;
@@ -885,7 +1188,8 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 	case WMI_EVENT_CPU_FAN_SPEED:
 	case WMI_EVENT_GPU_FAN_SPEED:
 		/* Redmi refresh rate toggle quirk */
-		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED &&
+		if (data->ops->quirk_refresh_rate_toggle &&
+		    event->event_id == WMI_EVENT_CPU_FAN_SPEED &&
 		    event->value_low == 0 && event->value_high == 0) {
 			payload = BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0);
 			bitland_mifs_wmi_report_key(wdev, payload);
@@ -923,7 +1227,6 @@ static struct wmi_driver bitland_mifs_wmi_driver = {
 	.no_singleton = true,
 	.driver = {
 		.name = DRV_NAME,
-		.dev_groups = laptop_groups,
 		.pm = pm_sleep_ptr(&bitland_mifs_wmi_pm_ops),
 	},
 	.id_table = bitland_mifs_wmi_id_table,
-- 
2.55.0

