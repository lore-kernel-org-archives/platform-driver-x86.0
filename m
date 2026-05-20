Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F9B3E8332
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286150; cv=none; b=Akzam9NxgZCTcb7LIt10x3Evv0X79B8LvnwtehDut9yvLJJ6cswp2zQjOmVNnoCBVl0EHTLBw/Ec9bF+oohA/Ar9C4ffrdGCRsKSFsfxR4drxMd6tl5GC657v8Q/qh1GIFX9lMn0r7Ghcd4Zr2cpNxowEqpk/oRpmwvI6NtCZJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286150; c=relaxed/simple;
	bh=j5qXzgUN4amY7qL/P8h6Qn3QsvtBTrP9ftFG+3TTPhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYJ64vuJ+RfQldbyuxI9++WoTycy2uesGurx+Nv3ErsEnum9IVR6H8rkx3oGghBt4usotBuAs9t6bpRDNh925orq7um8QNcHbHJ9VuWPgy3FQWVF6VquxefxC+sox0Staun54G3m1sAVwnhUBFTR8dF1Mt+JZ7+0CBm9M8qfWMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCcxMB/d; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCcxMB/d"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-839dc688d6cso2155019b3a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 07:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779286145; x=1779890945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqdonKr+6hvZHlYXB3+/jnRCzAb077JVMSOuwT4whAU=;
        b=BCcxMB/dMazMu7CQdy34bzQ8o3TqtxdOJiu3k456ots7IIB/8bEjXC1VCuQYHg7hcB
         0wbXzixtCjlJcmtMMaQY4+Av+r+FcR47RlCnZtmuRZ1xmlY2un0T+WMwBldbJo7oeutQ
         cobZs5GczAGCXSO63qZK7T3lwgdYUn94Jv3ZaBe3oCztD1qqB9kgQQtfOVQurTlrZpXf
         61kOkRLf/ypgt6BfvgHQwa4+9FWa1xjRIK7RUb7Z4v6QBxnXEmwhmGOEJhwAcQuaYl1y
         YgJmqD6wNWYY1x1480VLl/BaO5q+HBUUksvGWbFdMlTB+85jBBhrTpx/kAhLZH+GKsKz
         hAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286145; x=1779890945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XqdonKr+6hvZHlYXB3+/jnRCzAb077JVMSOuwT4whAU=;
        b=bRiTWiynMJeoLcKbnAF54JxtKVFhjD1GGKnhkRaDvbGK/HhLg0uLg+q7R503rIy52Z
         RbMi9fcCHzsraw1zpJt0g1CmlAfCc0JuZs/ZheDSXldZfV8rpFym65pvRuBGLei4L/nL
         L0DYWpt7peixRNda8lCLPy2vHkeqj72jvG0xlN4AfAGMxzn+ZNIRtn7JTMVb9z0E4CDs
         ndJFqimmNEfR1EwYvF7Poc6ywpJJ6y8RLgw8szqhsTPN4kHBNiVSgRW9tRT9HwHSEB3K
         SFauOLky/7rFEIYYessTErx4WSs1Dxf7KaKOumKZNV0PoGL6z2XDAdwC1CJJUI9z8oft
         Z8XA==
X-Gm-Message-State: AOJu0YwuQIy/ugJlUUZrrikvyxQiTbRQAJuAkYS13sqzPQcqamMzYLDX
	2YZduOGwO7xkvmz5ew0WP2N5pPShsOKxE0QxiodItxrYsNwiVUs1gvHHeAL78s0cBY0=
X-Gm-Gg: Acq92OEf82pmzWFmaI62Mm13L13AFolV9qoBatYjApyr9tKYUBV4d1z4DnoSYqrrJnS
	M+PGR3o1yaUvGoTUGDgeoSukZos8jHl+xsjjGfFCYDNFXjGVxmLVYcpdBwfv9OYpthwS1ki+BlG
	cjjd+9S60oVm9RYtaT1O8L9qxrBinxD2SfLKgaTXW68z5z7eQhNVRMMwiiW0Dky2TUj8YPEg8Xv
	U6B3OWE/8uCkSAA1WmDpp9F91vDb5uVvH/5SjztyeR4IwEElqIsC1qzjwgjwIjmYult5cuWgyVq
	eUcZwuhBqZYUFvnr6J/mNN8dpDtZrPkuZRs/25I+kBies+L+g0nYz75WB5Ab1fdAcsaemjmzblr
	DSERPu/hsnu/a8MduU08JxVOpi8ksLNCTIKPt+zEnyn8w8jVzTsyZoL6KEnP2FGr6VTn1es+hpI
	6G/Tobh/E1t3zB7m7+9+AHkm/qUCy7CmLUdQ==
X-Received: by 2002:a05:6a00:2e85:b0:82c:8c6a:682b with SMTP id d2e1a72fcca58-83f33c24190mr24969574b3a.19.1779286144557;
        Wed, 20 May 2026 07:09:04 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:1e5a:9abb:36af:543:3c14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10989525b3a.48.2026.05.20.07.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:09:04 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	krishna.chomal108@gmail.com,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v5 1/2] platform/x86: hp-wmi: Prepare Victus fan control board data
Date: Wed, 20 May 2026 19:37:47 +0530
Message-ID: <20260520140800.130530-2-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520140800.130530-1-radheykalra901@gmail.com>
References: <20260520140800.130530-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the Victus S thermal-profile DMI data behind hp_wmi_board_params so
board-specific feature data can describe thermal-profile and fan-control
support together.

Use the active board data for fan-control decisions instead of checking
is_victus_s_thermal_profile() in the hwmon path. Also derive gpu_delta
from the first non-zero GPU RPM row so fan tables whose first GPU RPM is
zero still produce valid fan settings.

No fan-control support changes intended for existing boards. Fan tables
with an initial zero GPU RPM row now produce a valid GPU delta.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 204 ++++++++++++++++++++++---------
 1 file changed, 145 insertions(+), 59 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7..dcfffe6 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -133,11 +133,52 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
 	.ec_tp_offset	= HP_NO_THERMAL_PROFILE_OFFSET,
 };
 
-/*
- * A generic pointer for the currently-active board's thermal profile
- * parameters.
- */
-static struct thermal_profile_params *active_thermal_profile_params;
+struct hp_wmi_fan_profile_params {
+	int (*get_fan_speed)(int fan);
+	bool fan_table;
+};
+
+struct hp_wmi_board_params {
+	const struct thermal_profile_params *thermal_profile;
+	const struct hp_wmi_fan_profile_params *fan_profile;
+};
+
+static int hp_wmi_get_fan_speed_victus_s(int fan);
+
+static const struct hp_wmi_fan_profile_params victus_s_fan_profile_params = {
+	.get_fan_speed	= hp_wmi_get_fan_speed_victus_s,
+	.fan_table	= true,
+};
+
+static const struct hp_wmi_board_params victus_s_board_params = {
+	.thermal_profile	= &victus_s_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
+static const struct hp_wmi_board_params omen_v1_board_params = {
+	.thermal_profile	= &omen_v1_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
+static const struct hp_wmi_board_params omen_v1_legacy_board_params = {
+	.thermal_profile	= &omen_v1_legacy_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
+static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
+	.thermal_profile	= &omen_v1_no_ec_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
+static const struct hp_wmi_board_params *active_board_params;
+
+static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
+{
+	if (!active_board_params)
+		return NULL;
+
+	return active_board_params->thermal_profile;
+}
 
 /* DMI board names of devices that should use the omen specific path for
  * thermal profiles.
@@ -187,67 +228,67 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25",
 };
 
-/* DMI Board names of Victus 16-r and Victus 16-s laptops */
-static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
+/* DMI board-specific feature data for Omen and Victus laptops. */
+static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
-		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
-		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BAB") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C77") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
-		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
 	{},
 };
@@ -1769,6 +1810,38 @@ static bool is_victus_s_thermal_profile(void)
 	return is_victus_s_board;
 }
 
+static const struct hp_wmi_fan_profile_params *hp_wmi_fan_profile(void)
+{
+	if (!active_board_params)
+		return NULL;
+
+	return active_board_params->fan_profile;
+}
+
+static bool hp_wmi_fan_control_supported(void)
+{
+	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
+
+	return params && params->get_fan_speed;
+}
+
+static bool hp_wmi_fan_table_supported(void)
+{
+	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
+
+	return params && params->fan_table;
+}
+
+static int hp_wmi_get_active_fan_speed(int fan)
+{
+	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
+
+	if (!params || !params->get_fan_speed)
+		return -EOPNOTSUPP;
+
+	return params->get_fan_speed(fan);
+}
+
 static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
 					    bool *ppab_enable,
 					    u8 *dstate,
@@ -1854,7 +1927,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	u8 current_dstate, current_gpu_slowdown_temp, tp;
 	const struct thermal_profile_params *params;
 
-	params = active_thermal_profile_params;
+	params = hp_wmi_thermal_profile();
+	if (!params)
+		return -ENODEV;
+
 	if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
 	    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
 		*profile = active_platform_profile;
@@ -1866,10 +1942,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 		return ret;
 
 	/*
-	 * We cannot use active_thermal_profile_params here, because boards
-	 * like 8C78 have tp == 0x0 || tp == 0x1 after cold boot, but logically
-	 * it should have tp == 0x30 || tp == 0x31, as corrected by the Omen
-	 * Gaming Hub on windows. Hence accept both of these values.
+	 * Boards like 8C78 have tp == 0x0 || tp == 0x1 after cold boot,
+	 * but logically it should have tp == 0x30 || tp == 0x31, as
+	 * corrected by the Omen Gaming Hub on windows. Hence accept both
+	 * of these values.
 	 */
 	if (tp == victus_s_thermal_params.performance ||
 	    tp == omen_v1_thermal_params.performance) {
@@ -1904,12 +1980,12 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 
 static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
 {
-	struct thermal_profile_params *params;
+	const struct thermal_profile_params *params;
 	bool gpu_ctgp_enable, gpu_ppab_enable;
 	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
 	int err, tp;
 
-	params = active_thermal_profile_params;
+	params = hp_wmi_thermal_profile();
 	if (!params)
 		return -ENODEV;
 
@@ -2175,6 +2251,7 @@ static const struct platform_profile_ops hp_wmi_platform_profile_ops = {
 static int thermal_profile_setup(struct platform_device *device)
 {
 	const struct platform_profile_ops *ops;
+	const struct thermal_profile_params *params;
 	int err, tp;
 
 	if (is_omen_thermal_profile()) {
@@ -2206,13 +2283,17 @@ static int thermal_profile_setup(struct platform_device *device)
 
 		ops = &platform_profile_victus_ops;
 	} else if (is_victus_s_thermal_profile()) {
+		params = hp_wmi_thermal_profile();
+		if (!params)
+			return -ENODEV;
+
 		/*
 		 * For an unknown EC layout board, platform_profile_victus_s_get_ec(),
 		 * behaves like a wrapper around active_platform_profile, to avoid using
 		 * uninitialized data, we default to PLATFORM_PROFILE_BALANCED.
 		 */
-		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
-		    active_thermal_profile_params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
+		if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
+		    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
 			active_platform_profile = PLATFORM_PROFILE_BALANCED;
 		} else {
 			err = platform_profile_victus_s_get_ec(&active_platform_profile);
@@ -2380,7 +2461,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	switch (priv->mode) {
 	case PWM_MODE_MAX:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2392,7 +2473,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_MANUAL:
-		if (!is_victus_s_thermal_profile())
+		if (!hp_wmi_fan_control_supported())
 			return -EOPNOTSUPP;
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
 		if (ret < 0)
@@ -2401,7 +2482,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2425,12 +2506,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
 {
 	switch (type) {
 	case hwmon_pwm:
-		if (attr == hwmon_pwm_input && !is_victus_s_thermal_profile())
+		if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
 			return 0;
 		return 0644;
 	case hwmon_fan:
-		if (is_victus_s_thermal_profile()) {
-			if (hp_wmi_get_fan_speed_victus_s(channel) >= 0)
+		if (hp_wmi_fan_control_supported()) {
+			if (hp_wmi_get_active_fan_speed(channel) >= 0)
 				return 0444;
 		} else {
 			if (hp_wmi_get_fan_speed(channel) >= 0)
@@ -2454,8 +2535,8 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	priv = dev_get_drvdata(dev);
 	switch (type) {
 	case hwmon_fan:
-		if (is_victus_s_thermal_profile())
-			ret = hp_wmi_get_fan_speed_victus_s(channel);
+		if (hp_wmi_fan_control_supported())
+			ret = hp_wmi_get_active_fan_speed(channel);
 		else
 			ret = hp_wmi_get_fan_speed(channel);
 		if (ret < 0)
@@ -2464,10 +2545,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 		return 0;
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
-			if (!is_victus_s_thermal_profile())
+			if (!hp_wmi_fan_control_supported())
 				return -EOPNOTSUPP;
 
-			rpm = hp_wmi_get_fan_speed_victus_s(channel);
+			rpm = hp_wmi_get_active_fan_speed(channel);
 			if (rpm < 0)
 				return rpm;
 			*val = rpm_to_pwm(rpm / 100, priv);
@@ -2501,7 +2582,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
-			if (!is_victus_s_thermal_profile())
+			if (!hp_wmi_fan_control_supported())
 				return -EOPNOTSUPP;
 			/* PWM input is invalid when not in manual mode */
 			if (priv->mode != PWM_MODE_MANUAL)
@@ -2518,13 +2599,13 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			priv->mode = PWM_MODE_MAX;
 			return hp_wmi_apply_fan_settings(priv);
 		case PWM_MODE_MANUAL:
-			if (!is_victus_s_thermal_profile())
+			if (!hp_wmi_fan_control_supported())
 				return -EOPNOTSUPP;
 			/*
 			 * When switching to manual mode, set fan speed to
 			 * current RPM values to ensure a smooth transition.
 			 */
-			rpm = hp_wmi_get_fan_speed_victus_s(channel);
+			rpm = hp_wmi_get_active_fan_speed(channel);
 			if (rpm < 0)
 				return rpm;
 			priv->pwm = rpm_to_pwm(rpm / 100, priv);
@@ -2585,13 +2666,14 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	u8 min_rpm, max_rpm;
 	u8 cpu_rpm, gpu_rpm, noise_db;
 	int gpu_delta, i, num_entries, ret;
+	bool gpu_delta_found = false;
 	size_t header_size, entry_size;
 
 	/* Default behaviour on hwmon init is automatic mode */
 	priv->mode = PWM_MODE_AUTO;
 
-	/* Bypass all non-Victus S devices */
-	if (!is_victus_s_thermal_profile())
+	/* Bypass devices without fan control support. */
+	if (!hp_wmi_fan_table_supported())
 		return 0;
 
 	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
@@ -2625,12 +2707,15 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 			min_rpm = cpu_rpm;
 		if (cpu_rpm > max_rpm)
 			max_rpm = cpu_rpm;
+		if (!gpu_delta_found && gpu_rpm > 0) {
+			gpu_delta = gpu_rpm - cpu_rpm;
+			gpu_delta_found = true;
+		}
 	}
 
-	if (min_rpm == U8_MAX || max_rpm == 0)
+	if (min_rpm == U8_MAX || max_rpm == 0 || !gpu_delta_found)
 		return -EINVAL;
 
-	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
 	priv->min_rpm = min_rpm;
 	priv->max_rpm = max_rpm;
 	priv->gpu_delta = gpu_delta;
@@ -2673,24 +2758,25 @@ static int hp_wmi_hwmon_init(void)
 	return 0;
 }
 
-static void __init setup_active_thermal_profile_params(void)
+static void __init setup_active_board_params(void)
 {
 	const struct dmi_system_id *id;
+	const struct thermal_profile_params *params;
 
-	/*
-	 * Currently only victus_s devices use the
-	 * active_thermal_profile_params
-	 */
-	id = dmi_first_match(victus_s_thermal_profile_boards);
+	id = dmi_first_match(hp_wmi_feature_boards);
 	if (id) {
+		active_board_params = id->driver_data;
+		params = hp_wmi_thermal_profile();
+		if (!params)
+			return;
+
 		/*
 		 * Marking this boolean is required to ensure that
 		 * is_victus_s_thermal_profile() behaves like a valid
 		 * wrapper.
 		 */
 		is_victus_s_board = true;
-		active_thermal_profile_params = id->driver_data;
-		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+		if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
 			pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
 				dmi_get_system_info(DMI_BOARD_NAME));
 		}
@@ -2725,10 +2811,10 @@ static int __init hp_wmi_init(void)
 		}
 
 		/*
-		 * Setup active board's thermal profile parameters before
-		 * starting platform driver probe.
+		 * Setup active board feature data before starting platform
+		 * driver probe.
 		 */
-		setup_active_thermal_profile_params();
+		setup_active_board_params();
 		err = platform_driver_probe(&hp_wmi_driver, hp_wmi_bios_setup);
 		if (err)
 			goto err_unregister_device;
-- 
2.54.0
