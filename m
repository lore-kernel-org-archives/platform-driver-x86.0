Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF8D33D6F8
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219911; cv=none; b=T+W9HBJSJR0OX8jBbepzQWMOQCyLpsobCPmaGm6XowOG3YNrEibANFHItXjV6537T2dosERMCuN0zfr4XubTAYHIFWE0mVIGODzndBMMbRgg9pifd3rIDaJ3dsMWEGMTZiGAB8LkwCK1fa4r/hZSix7rWVgbTB8GE0wXMy024PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219911; c=relaxed/simple;
	bh=34bWtV7yPXNwTHhyd4tidM02gLkCJMg/I4D39lMzq4I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cVbQYri4ELnSW6R75lD9qyxfutVrFjKQv9EhzJtkqgxXsCdxq76un0jCtipU+R5QPls3O6XL9U2eHoW+WKA3WVpIcAv/nbxul0Kv/TkejOYBkqXZQkeKwAAE9/VUExW7SWe3elzBhxx01lsXvF8/eujm5BFCqVP6YwE3FUSxbic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHaA6GBf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHaA6GBf"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso2699725ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 02:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780219908; x=1780824708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yw0twq5qwLkcmJ7duol9vBU9e4SryySAWv6YUQ76/B8=;
        b=NHaA6GBfF/RA17VCB6VIi8JYu9vN5D+Lq325dQZVj3C/3tZoVwyKJGbOSfHgbBNiFG
         28ywFsSxjdDh/s2H2hS45ggOA3iYW7DiQ8XLIqnJ6d0lMBuCSOYONhFcZAjrlAP9n54z
         DPO2qodhQfww004dOYs6JlNbpeFMYDjMdbHa6BbcbRNvSZTOQRdxt2ZKSODK7WjdRXn/
         fuJf5aN+VkfvYVMoPn5iNuOaC85yhQK3g1RgJ/h7WqZuFIF5nETazr5EK0poXlMuqD0h
         ui7cM70e6IKCCN4QZ60Q5AoDxlWAcbFOdDzAUqo4ydxY5YJGKHN48XQnQ0SvizXngg8v
         pu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780219908; x=1780824708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yw0twq5qwLkcmJ7duol9vBU9e4SryySAWv6YUQ76/B8=;
        b=DRvh/wptisMNpkuXucSwnzuWDAMqyv0OvILnYMjErN+dxDOnCLC3KbHpnzMlYcmfD1
         eIPA8Rmufbd5mq25DKo0K7syCuLw/BXwjJX2VVri4SBIKTIjfcyznGRoVSko/x+ct1mi
         N8SFRDBYgj0z8noFA/Ogvm5SXUhPlH7opZk8RosfLp2b2bbZGQtMspUihOdsv5B5XoRl
         EChZmLCUhei292KGXB338UIBUKwwu+jDM/TiIrrDHgBI01EBJYKo/wO/Iv3UL7pwNO9D
         Ko98ybcu4/ZU0zogHu11IEGSdNcnPpIU1XOtKlj4IBfNaPTvOHFVKClArxc0J7an/qfJ
         Plaw==
X-Forwarded-Encrypted: i=1; AFNElJ+nBtVHlHcAPTNnzstj6V3niEIG1CtsZVeXV60HzGykxM0FJ0ceK4sKi0FN73z2Pw4JZavgHztZUoRFhaWb6jTjirPr@vger.kernel.org
X-Gm-Message-State: AOJu0YwOhHPaPiVhw4P14jsBWsajoRmJfp6qKZpR69PDbqKaC+cqudgE
	/1V7+6T/Af5BsEzr4dF/HMVr0R3XQMxSUt1MU97gD+P79Ao9cOgP/rB0
X-Gm-Gg: Acq92OHAYx/vyD6pgjuc4akkdGjPFW7aw/0Vup5oCKYtpaEWKVbeijiKhXrIqDatT3J
	QhtnZ8OM0nfw0AntkDRKD1W7XfOzaZqoVwFxZDeNuKovneMMrZx9S7UNAi7T3MdUXZ3oV36j2cU
	Jj/Ap89garSivN/XCVNEQI7TkR97iusM2nK/G/xvReu/UeYIRlNAO7tgOMkuRacOzp3n6bmBqVa
	5yN/0EAUuUEydEP96vejcXqzO6OkcyMZNo7SpS7v65t2CwfOYTHhCzT1bEQ9v9zAuJrBfeGl3SW
	rCX0sgGYBxkagBMxCRzAk54L611m4XE1CZ8l6wA+7e/J+mpQ4Hji5/07MAeKXLY9dWUK61jokZP
	AFcd6Xw+x42xaJUcm1ds4BS7RqI/Jk4cMdFT+V7CD/Y2vFsTMP/8ItU0+IVjrsCkkn5GcWnEmj6
	RcKIcuYPEz0XyBixOSuX0=
X-Received: by 2002:a17:903:1a0f:b0:2bf:195d:21de with SMTP id d9443c01a7336-2bf36795233mr83811235ad.7.1780219908072;
        Sun, 31 May 2026 02:31:48 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23915adcsm68003995ad.0.2026.05.31.02.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:31:47 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mingyou Chen <qby140326@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] platform/x86: bitland-mifs-wmi: Add thermal cooling device fan control
Date: Sun, 31 May 2026 17:30:50 +0800
Message-ID: <20260531093101.30303-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the onboard laptop fans within the Linux thermal framework as
cooling devices to enable explicit thermal policy management.

This implementation exposes two separate fan loops:
- "bitland_main_fan"
- "bitland_sys_fan"

The cooling devices support states from 0 to 100:
- State 0 preserves or restores autonomous EC-driven fan curve control.
- States 1 to 100 transition the loop into manual mode, where the state
  is scaled linearly between a profile-defined minimum and maximum
hardware
  duty cycle boundary.

Because safe operational constraints vary depending on the platform's
current state and hardware configuration, the driver queries the active
WMI platform profile at runtime and branches on the CPU vendor
(boot_cpu_data.x86_vendor) to enforce distinct Intel or AMD fan speed
safety ranges.

Managed device lifecycle support is handled via
devm_add_action_or_reset()
to ensure that the cooling devices are cleanly unregistered and the fans
are returned safely to hardware-controlled automatic mode upon driver
unbind.

Assisted-by: Gemini:gemini-3.5-flash
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 .../wmi/devices/bitland-mifs-wmi.rst          |  21 +-
 drivers/platform/x86/bitland-mifs-wmi.c       | 196 ++++++++++++++++++
 2 files changed, 216 insertions(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
index 9e86ecc2993c..5e5a51677883 100644
--- a/Documentation/wmi/devices/bitland-mifs-wmi.rst
+++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
@@ -201,7 +201,26 @@ The ``GPUMode`` (0x09) allows switching between Hybrid (Muxless) and Discrete
 take effect in the BIOS/Firmware.
 
 Fan Control
------------
+===========
+
 The system supports both automatic EC control and manual overrides. Command ID
 0x14 (``MaxFanSpeedSwitch``) is used to toggle manual control, while ID 0x15
 sets the actual PWM duty cycle.
+
+The driver exposes the two onboard fan loops to the Linux thermal framework as
+standard cooling devices:
+
+- ``bitland_main_fan``: Controls the combined CPU/GPU cooling loop.
+- ``bitland_sys_fan``: Controls the auxiliary chassis/system fan loop.
+
+Thermal framework cooling states range from 0 to 100 and map to hardware operations:
+
+- **State 0**: Restores autonomous EC fan curve control (Automatic mode).
+- **State 1-100**: Switches the loop to Manual mode, scaling the target hardware
+  speed linearly between the profile's safe minimum and maximum bounds via:
+  ``target_speed = min_val + ((state - 1) * (max_val - min_val) / 99)``
+
+The valid hardware boundaries (``min_val`` and ``max_val``) are evaluated
+dynamically at runtime during state changes. The driver checks both the currently
+active platform profile and the processor architecture (Intel vs. AMD via CPU
+vendor matching) to enforce the correct operational safety envelopes.
diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index b0d06a80e89e..4fb94046d5bf 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -26,10 +26,12 @@
 #include <linux/notifier.h>
 #include <linux/platform_profile.h>
 #include <linux/pm.h>
+#include <linux/processor.h>
 #include <linux/power_supply.h>
 #include <linux/stddef.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
+#include <linux/thermal.h>
 #include <linux/unaligned.h>
 #include <linux/units.h>
 #include <linux/wmi.h>
@@ -38,6 +40,9 @@
 #define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
 #define BITLAND_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
 
+#define BITLAND_FAN_CONTROL_AUTO      0
+#define BITLAND_FAN_CONTROL_MANUAL    1
+
 enum bitland_mifs_operation {
 	WMI_METHOD_GET	= 250,
 	WMI_METHOD_SET	= 251,
@@ -150,6 +155,60 @@ struct bitland_fan_notify_data {
 	u16 speed;
 };
 
+enum bitland_fan_type {
+	BITLAND_FAN_CPU_GPU = 0,
+	BITLAND_FAN_SYS     = 1,
+	BITLAND_FAN_MAX,
+};
+
+struct bitland_fan_range {
+	u8 min;
+	u8 max;
+};
+
+struct bitland_cooling_dev {
+	struct bitland_mifs_wmi_data *data;
+	struct thermal_cooling_device *cdev;
+	enum bitland_fan_type type;
+	u8 cur_val;
+};
+
+/* Fan safety bounds indexed by [WMI_PP_MODE][FAN_TYPE] */
+static const struct bitland_fan_range intel_fan_ranges[4][BITLAND_FAN_MAX] = {
+	[WMI_PP_BALANCED] = {
+		[BITLAND_FAN_CPU_GPU] = { 26, 35 }, [BITLAND_FAN_SYS] = { 59, 69 },
+	},
+	[WMI_PP_PERFORMANCE] = {
+		[BITLAND_FAN_CPU_GPU] = { 32, 38 }, [BITLAND_FAN_SYS] = { 70, 80 },
+	},
+	[WMI_PP_QUIET] = {
+		[BITLAND_FAN_CPU_GPU] = { 19, 29 }, [BITLAND_FAN_SYS] = { 25, 64 },
+	},
+	[WMI_PP_FULL_SPEED] = {
+		[BITLAND_FAN_CPU_GPU] = { 40, 44 }, [BITLAND_FAN_SYS] = { 75, 82 },
+	},
+};
+
+static const struct bitland_fan_range amd_fan_ranges[4][BITLAND_FAN_MAX] = {
+	[WMI_PP_BALANCED] = {
+		[BITLAND_FAN_CPU_GPU] = { 26, 35 }, [BITLAND_FAN_SYS] = { 59, 69 },
+	},
+	[WMI_PP_PERFORMANCE] = {
+		[BITLAND_FAN_CPU_GPU] = { 32, 38 }, [BITLAND_FAN_SYS] = { 64, 72 },
+	},
+	[WMI_PP_QUIET] = {
+		[BITLAND_FAN_CPU_GPU] = { 19, 29 }, [BITLAND_FAN_SYS] = { 17, 64 },
+	},
+	[WMI_PP_FULL_SPEED] = {
+		[BITLAND_FAN_CPU_GPU] = { 40, 44 }, [BITLAND_FAN_SYS] = { 75, 82 },
+	},
+};
+
+static const char *const cooling_dev_labels[BITLAND_FAN_MAX] = {
+	[BITLAND_FAN_CPU_GPU] = "bitland_main_fan",
+	[BITLAND_FAN_SYS]     = "bitland_sys_fan",
+};
+
 struct bitland_mifs_wmi_data {
 	struct wmi_device *wdev;
 	struct mutex lock;		/* Protects WMI calls */
@@ -158,6 +217,7 @@ struct bitland_mifs_wmi_data {
 	struct input_dev *input_dev;
 	struct device *hwmon_dev;
 	struct device *pp_dev;
+	struct bitland_cooling_dev cooling_devs[BITLAND_FAN_MAX];
 	enum platform_profile_option saved_profile;
 };
 
@@ -184,6 +244,25 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 	return 0;
 }
 
+static int bitland_get_wmi_profile(struct bitland_mifs_wmi_data *data)
+{
+	struct bitland_mifs_input input = {
+		.operation = WMI_METHOD_GET,
+		.function = WMI_FN_SYSTEM_PER_MODE,
+	};
+	struct bitland_mifs_output result;
+	int ret;
+
+	ret = bitland_mifs_wmi_call(data, &input, &result);
+	if (ret)
+		return ret;
+
+	if (result.data[0] >= 4)
+		return -EPROTO;
+
+	return result.data[0];
+}
+
 static int laptop_profile_get(struct device *dev,
 			      enum platform_profile_option *profile)
 {
@@ -406,6 +485,106 @@ static const struct hwmon_chip_info laptop_chip_info = {
 	.info = laptop_hwmon_info,
 };
 
+static int bitland_set_fan_hardware(struct bitland_cooling_dev *fan, bool manual, u8 speed)
+{
+	int ret;
+
+	struct bitland_mifs_input switch_input = {
+		.operation = WMI_METHOD_SET,
+		.function = WMI_FN_MAX_FAN_SWITCH,
+		.payload = {
+			[0] = (u8)fan->type,
+			[1] = manual ? BITLAND_FAN_CONTROL_MANUAL : BITLAND_FAN_CONTROL_AUTO,
+		},
+	};
+
+	ret = bitland_mifs_wmi_call(fan->data, &switch_input, NULL);
+	if (ret)
+		return ret;
+
+	if (!manual)
+		return 0;
+
+	struct bitland_mifs_input speed_input = {
+		.operation = WMI_METHOD_SET,
+		.function = WMI_FN_MAX_FAN_SPEED,
+		.payload = {
+			[0] = (u8)fan->type,
+			[1] = speed,
+		},
+	};
+
+	return bitland_mifs_wmi_call(fan->data, &speed_input, NULL);
+}
+
+static int bitland_cooling_get_max_state(struct thermal_cooling_device *cdev,
+					 unsigned long *state)
+{
+	*state = 100;
+	return 0;
+}
+
+static int bitland_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+					 unsigned long *state)
+{
+	struct bitland_cooling_dev *fan = cdev->devdata;
+
+	*state = fan->cur_val;
+	return 0;
+}
+
+static int bitland_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+					 unsigned long state)
+{
+	struct bitland_cooling_dev *fan = cdev->devdata;
+	struct bitland_mifs_wmi_data *data = fan->data;
+	const struct bitland_fan_range *range;
+	int profile_mode;
+	u8 target_speed;
+	int ret;
+
+	if (state > 100)
+		return -EINVAL;
+
+	if (state == 0) {
+		ret = bitland_set_fan_hardware(fan, false, 0);
+	} else {
+		profile_mode = bitland_get_wmi_profile(data);
+		if (profile_mode < 0)
+			return profile_mode;
+
+		if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
+			range = &amd_fan_ranges[profile_mode][fan->type];
+		else
+			range = &intel_fan_ranges[profile_mode][fan->type];
+
+		/* Scale 1..100 map directly to current profile's safe min..max min-bound */
+		target_speed = range->min + ((state - 1) * (range->max - range->min) / 99);
+		ret = bitland_set_fan_hardware(fan, true, target_speed);
+	}
+
+	if (ret == 0)
+		fan->cur_val = state;
+
+	return ret;
+}
+
+static const struct thermal_cooling_device_ops bitland_cooling_ops = {
+	.get_max_state = bitland_cooling_get_max_state,
+	.get_cur_state = bitland_cooling_get_cur_state,
+	.set_cur_state = bitland_cooling_set_cur_state,
+};
+
+static void bitland_thermal_unregister_action(void *data)
+{
+	struct bitland_cooling_dev *fan = data;
+
+	if (fan->cdev) {
+		bitland_set_fan_hardware(fan, false, 0);
+		thermal_cooling_device_unregister(fan->cdev);
+	}
+}
+
 static int laptop_kbd_led_set(struct led_classdev *led_cdev,
 			      enum led_brightness value)
 {
@@ -708,6 +887,23 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (IS_ERR(drv_data->hwmon_dev))
 		return PTR_ERR(drv_data->hwmon_dev);
 
+	for (int i = 0; i < BITLAND_FAN_MAX; i++) {
+		struct bitland_cooling_dev *fan = &drv_data->cooling_devs[i];
+
+		fan->data = drv_data;
+		fan->type = i;
+		fan->cur_val = 0;
+
+		fan->cdev = thermal_cooling_device_register(cooling_dev_labels[i],
+							    fan, &bitland_cooling_ops);
+		if (IS_ERR(fan->cdev))
+			return PTR_ERR(fan->cdev);
+
+		ret = devm_add_action_or_reset(&wdev->dev, bitland_thermal_unregister_action, fan);
+		if (ret)
+			return ret;
+	}
+
 	/* Register keyboard LED */
 	drv_data->kbd_led.max_brightness = 3;
 	drv_data->kbd_led.brightness_set_blocking = laptop_kbd_led_set;

base-commit: 174914ea551314c52a61713b9c4bde9e42d48073
-- 
2.54.0

