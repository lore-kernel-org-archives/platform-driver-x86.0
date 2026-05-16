Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8565A374722
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778922658; cv=none; b=s103D6H9XIiC07zl/zNEsyMadQ332bFLOUrWeha3+DpyDwxGgK6KjNAtce41E6L9vdyLq48hOVN5kdRXI5w2X1cRoBO0ulz299eWzO1eVbqMuDPOhVdKTIIa1junjLHvDZJ5HcyZpn28uFVckgWcmLBDp0TBFpo9jphOL7RzPi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778922658; c=relaxed/simple;
	bh=BdMCNkmlLns9KXw1JFXhwhUPO4BMb5atGqJCROgj36g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r4hIcuBGTTot2BOW9VkKOEwS/Rf4nPv4j2Y45NcNOUdIpxRlXr2N4mnls3esVG1Lz3rlaDB/JLRQ0UpiDrPS1JNTsmuZIQRGe+e5q0W7kBFPaHksuv32CYOLeky50sXUR8hx0NqIN6rQ54XbJShgeeV9D6yC40EgkHU7EdN5Boc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bh37q9GI; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bh37q9GI"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ba1e9d3687so4688755ad.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 May 2026 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778922656; x=1779527456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQ6hpa47erjYRkGuEd/6wH6K3g6tOARnmTdMCp1E8TQ=;
        b=bh37q9GI+Ml8FroRJEOZ3IU97fC44cS5AVM+69hMrKyd3nlOiWnXDwvSXHu6hQNFkE
         dDHGKNkP4IVK+NHvPWUDQrPwpynJ7xgpj3+oUzhrSgAcjEAOgB8wSwdnTs4cr+1ZbHV6
         vFli5J2+xn5iN9udbLZe9IFD7i1e1LeqTjyYFVOOJmG+xugodv99x2gi9iAajFLDZ/OQ
         GO+5kiWC8OLpEC0XVEttEpbYslCtULIIQ7/mfXAhpQxdE/zRre8B98554a+qaLIHdtGE
         Y6UWKT4BMD1Pb7iRK7N0aO4tRpB5dnfp/5U+I3rXneBy6YXj0z8LqNtVI2uTq7iJ8pJt
         mEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778922656; x=1779527456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lQ6hpa47erjYRkGuEd/6wH6K3g6tOARnmTdMCp1E8TQ=;
        b=Ddod7r4hC3CWLws/BBrn00uLNlokviN212dJ6/vlc2TPpBQrP7NZ1rCHhtMAK/wx8u
         Maus/7OfZnlorl6VPtY8OdvduyrHDBNBukfdcOBfVlGxgxpaNPUlwSeFYbRhqMyLTbCr
         D1PdZ0sQNvKFevoZ+Ovj0AidthpLIUxjo0Jsm0l1k5ZqEaEhMIK8eUYJwm0MT6eSBex+
         ob7FjnEvnlbkUBxfGwM7kLC+biNOATEL05hpGlTun9KtrJNDmXWyNm91tVbMHl+Gn09e
         4KXCGmjlHdfH4HK/ArsrhEkAPgDUhsKaiQodQzijiMjXxzxeUvUsx4lRwuWPlXVvtm0t
         m05g==
X-Gm-Message-State: AOJu0YwL5IehxdWfXRhYst7Y0xTQ46oHbhkDG5zr4huXua0MNSh1gIKs
	FT8qc+TAfxyfcfRr0zWpg7GrbGeEFLVaAubn3ZXOObx4M3rukwglkfrRFZJ4bnudAMs=
X-Gm-Gg: Acq92OF1o5cc7ouRjWb9T4Nx34MGSfEqDC8xr7jGbwDugsprOCcbcE/c0S2CNlM/pLY
	UC42mS6N0LLjbblvMA3WcdIOc131CB4d7hpr6LH8xTmCaeK3hhyh/RoyztUETK+IR0X15hFcF7h
	Z2aHFyNjp5I6OhZSLut99450ToQ0B8JF37gK9ZjBip4ZNx+yxFIvrsxQ/dOrd4hKJpNQxZu1Rvr
	eSuygBGfg2NbLPe+khGFSNqnvHrw4gdYFu0JM7mU0QeJ8sg+nT2R+XZzU1M9QHyNASF2bNOkX9L
	AgulMLMerOesZ/Z0R2p5MNVvzSSwo7eAQ/YPRkPbqSqisxZZR61M9rH0kUFW6urhw5JUne+Srcr
	Mx3EwekMIOZMBziiLm0gbpeLxOGk33Nz+DVow0HgSOVJS456OEbg3ZIvrEBt5LrgFGoY6vd+ojY
	Ehg7JaU1O6io55EKjd5M0Ukv737XEPsHtsnzJy2GiKp6xJ
X-Received: by 2002:a17:903:2284:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2bd7e949015mr90193085ad.33.1778922655689;
        Sat, 16 May 2026 02:10:55 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:1e5a:9abb:36af:543:3c14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fc2bdsm110161515ad.63.2026.05.16.02.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 02:10:54 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	hansg@kernel.org,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v2] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
Date: Sat, 16 May 2026 14:35:16 +0530
Message-ID: <20260516090516.6246-1-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507101347.27972-1-radheykalra901@gmail.com>
References: <20260507101347.27972-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Victus 15-fb0xxx board 8A3D exposes the Victus fan table and accepts
the existing Victus fan-speed WMI control path. Add it as a
fan-control-only board so the hwmon PWM interface is enabled without
forcing Victus S thermal-profile handling on this model.

Extend the DMI .driver_data from thermal-profile-only parameters to board
parameters containing thermal-profile and fan-control data. Existing table
entries keep both thermal and fan-control data, while 8A3D only selects
the fan-control profile.

The 8A3D fan table starts with a valid CPU row whose GPU RPM field is
zero. Derive gpu_delta from the first row with non-zero GPU RPM instead of
always using row 0.

Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS F.22.
The fan table query succeeded and returned rows including cpu=23/gpu=0
followed by cpu=24/gpu=22. With 8A3D enabled in the fan-control path, pwm1
and pwm1_enable were exposed through hwmon.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
Changes in v2:
- Use real name in Signed-off-by.
- Replace the ad-hoc fan-control DMI table with board data in .driver_data.
- Keep 8A3D fan-control-only instead of enabling Victus S thermal profiles.
- Use the fixed fan-table parser path and derive gpu_delta from the first non-zero GPU row.

 drivers/platform/x86/hp/hp-wmi.c | 199 +++++++++++++++++++++----------
 1 file changed, 137 insertions(+), 62 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 6950bec..7435484 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -133,11 +133,50 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
 	.ec_tp_offset	= HP_NO_THERMAL_PROFILE_OFFSET,
 };
 
-/*
- * A generic pointer for the currently-active board's thermal profile
- * parameters.
- */
-static struct thermal_profile_params *active_thermal_profile_params;
+static const struct thermal_profile_params *active_thermal_profile_params;
+
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
+static const struct hp_wmi_board_params victus_8a3d_board_params = {
+	.fan_profile		= &victus_s_fan_profile_params,
+};
+
+static const struct hp_wmi_board_params *active_board_params;
 
 /* DMI board names of devices that should use the omen specific path for
  * thermal profiles.
@@ -187,71 +226,75 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25",
 };
 
-/* DMI Board names of Victus 16-r and Victus 16-s laptops */
-static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
+/* DMI board-specific feature data for Omen and Victus laptops. */
+static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
+		.driver_data = (void *)&victus_8a3d_board_params,
+	},
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
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BC2") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
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
-		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
-		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
 	{},
 };
@@ -1773,6 +1816,38 @@ static bool is_victus_s_thermal_profile(void)
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
@@ -1908,7 +1983,7 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 
 static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
 {
-	struct thermal_profile_params *params;
+	const struct thermal_profile_params *params;
 	bool gpu_ctgp_enable, gpu_ppab_enable;
 	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
 	int err, tp;
@@ -2384,7 +2459,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	switch (priv->mode) {
 	case PWM_MODE_MAX:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2396,7 +2471,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_MANUAL:
-		if (!is_victus_s_thermal_profile())
+		if (!hp_wmi_fan_control_supported())
 			return -EOPNOTSUPP;
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
 		if (ret < 0)
@@ -2405,7 +2480,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2429,12 +2504,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
@@ -2458,8 +2533,8 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2468,10 +2543,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2505,7 +2580,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
-			if (!is_victus_s_thermal_profile())
+			if (!hp_wmi_fan_control_supported())
 				return -EOPNOTSUPP;
 			/* PWM input is invalid when not in manual mode */
 			if (priv->mode != PWM_MODE_MANUAL)
@@ -2522,13 +2597,13 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2589,13 +2664,14 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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
@@ -2629,12 +2705,15 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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
@@ -2677,26 +2756,25 @@ static int hp_wmi_hwmon_init(void)
 	return 0;
 }
 
-static void __init setup_active_thermal_profile_params(void)
+static void __init setup_active_board_params(void)
 {
 	const struct dmi_system_id *id;
 
-	/*
-	 * Currently only victus_s devices use the
-	 * active_thermal_profile_params
-	 */
-	id = dmi_first_match(victus_s_thermal_profile_boards);
+	id = dmi_first_match(hp_wmi_feature_boards);
 	if (id) {
-		/*
-		 * Marking this boolean is required to ensure that
-		 * is_victus_s_thermal_profile() behaves like a valid
-		 * wrapper.
-		 */
-		is_victus_s_board = true;
-		active_thermal_profile_params = id->driver_data;
-		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
-			pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
-				dmi_get_system_info(DMI_BOARD_NAME));
+		active_board_params = id->driver_data;
+		active_thermal_profile_params = active_board_params->thermal_profile;
+		if (active_thermal_profile_params) {
+			/*
+			 * Marking this boolean is required to ensure that
+			 * is_victus_s_thermal_profile() behaves like a valid
+			 * wrapper.
+			 */
+			is_victus_s_board = true;
+			if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+				pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
+					dmi_get_system_info(DMI_BOARD_NAME));
+			}
 		}
 	}
 }
@@ -2728,11 +2806,8 @@ static int __init hp_wmi_init(void)
 			goto err_destroy_input;
 		}
 
-		/*
-		 * Setup active board's thermal profile parameters before
-		 * starting platform driver probe.
-		 */
-		setup_active_thermal_profile_params();
+		/* Setup active board feature data before starting platform driver probe. */
+		setup_active_board_params();
 		err = platform_driver_probe(&hp_wmi_driver, hp_wmi_bios_setup);
 		if (err)
 			goto err_unregister_device;
-- 
2.54.0

