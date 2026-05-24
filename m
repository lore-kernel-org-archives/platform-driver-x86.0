Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3DC282F13
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 May 2026 03:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779593691; cv=none; b=SLerp4SpXLg5qhSrOfRQaPh/JWfIHGFzQATGg1v8bjwUX+OjGDdCvOo9vQ5f5dzNtoK8UD73zy3r+xUiFBhlFRpGtJzp1akCCd09RB46UKLlZZSbHN3Aqt5P/H/IHEJQM+Jewt2ki0HidV1qEjJnBmZXJ4GhhujGBniGwnrNaww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779593691; c=relaxed/simple;
	bh=U/2BKNjAPjmrnQCTW2KUI/pVJ0MlmQhdCQBY5YUxorU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+OMXji/4TcPlRsBjO2Pk6XEGUEV9SAG2iE3TdfnyVpSEbmjrFsbgzGFcjCV+4AnHhexB3jfCGJYWYuY3mgAkKkCuSuCfRIQaS6Vc3vvdeYftq/zsAvNl0QcRANkOz6DqVp1KPahr7ew8OgyGXCkety+O3DwSJZ1B5LYvcoJeUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJRcQ26d; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJRcQ26d"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ba0fc8b1f0so61567455ad.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 May 2026 20:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779593689; x=1780198489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgQbWAqSdnWnfM4lumHwn05mhv+qE4ZJ1eOs7qohgaw=;
        b=ZJRcQ26dID9ppTApq/qTIjUEbW/a/eyF8obwI1ntvftrix0NYVsQoh6LvPr4Zia4Vm
         DzP/30OqUoo173ubOMexjE453qiJo/0/5GtVSu8mnkICQUmOIU2c8llDNWYf6bZL9JhA
         aLI4n3r4wXHYYTE1uT0n+IiZT+h/CPNqdk77+w3CM1CQwy5Y/hexoWEb3RMNlaAMh1fE
         ElLzlMdbLZx10AzwfljUqFnsTxjLVueluSdU0cZmcWpJohK7Sw9ZTAcIkL5OSWuajHtY
         9jW761Qn87t8hPYnzSo4xj6B38jYktpzqovgDE+HTQ5v33rxm7UapOHQJu6kMHOzqqIu
         3pRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779593689; x=1780198489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TgQbWAqSdnWnfM4lumHwn05mhv+qE4ZJ1eOs7qohgaw=;
        b=B4WS/+qy1tVatu6t6XCsaqMshVg/e+m+6BS7JtIkrmdKYkJg2pWzHoMNzgEhosGk7F
         bblB1UgxWmvFc6Tsv3BKNGgB9ja8q5s9as+N/VWJJeECRU6WEZad7bk2E9ODK0wl+cRe
         wCqpss6BRJukYkF3JMqoc5SjFn+GgX0MCWNZP7Ez6sCO0vY28njCtlSS+zNWkZrkL0zq
         sRJcqJhtAvKWwrwaP0Fb8cTw8TOfgIT/Fx6cRRfzeu3bvE5Gib1LaaHJ2duj3q1zhWto
         0Pbb2PscVo7mc7a9vv1K/EdXLh9aD2/9RTzTwPIP7p2pcqnGF23hPyVQr2IN2Trlp3BF
         MAjQ==
X-Gm-Message-State: AOJu0YwczDO5ytVgEDi06i6E2oOAas3qbnl9iAEkxhkRbFAOmchRav3f
	8rv3XzGxKIkB5ChhCWhAb1FfV0mzUibyILFORIdcmpgRKm+0WKxsFRB7Wi0pNGHh
X-Gm-Gg: Acq92OH2jIsZwtJlsK8un3Ugpt3MXIej/hc7yrkRaCyawuYN34UU81D1vDSRtyDMH0V
	TdoXsxrIhgdogUxcnTmS/COuZQW4l+qIOtZtQF64pvzeRPhS64kfWFeGGWNDk/085aYQz5IY4Il
	O/pP9QsXfL1/UM5CiDBvjdkHknw5LbKdbmiJCuvs+X0ndeSCgHa/s0U93E3PuJ5eKuWim/Kr0ak
	ZvaxBPEDLENvaHnLaj+3LG+G0qfBztjayXeZFhk1vY4PYc/fq9omvbmFpMnW21zhpo8kH8P1VwG
	5ZOuh7V3Ad1dBEvhk9FxJBJHkbGqoPk9TomD9niJwxpTIwUAW/sHsRlug/Fx+aRvZy4rvsYoSxG
	lJhfXdLukFlXVIVwvYt5GI3vOgE4QkvscsgHwUqikT+VoaNf8KKneg/mMICM51wjDKO4kZWK9Op
	wwaqnJvFxAbzapYnRioBCjKy25CmA=
X-Received: by 2002:a17:902:db0d:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2beb0698547mr106678025ad.24.1779593688913;
        Sat, 23 May 2026 20:34:48 -0700 (PDT)
Received: from pico-cachyos ([2a09:bac5:3e0b:7eb::ca:1aa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c49b2sm55469805ad.60.2026.05.23.20.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 20:34:48 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	radheykalra901@gmail.com
Subject: [PATCH v7 2/3] platform/x86: hp-wmi: Drive fan control from board data
Date: Sun, 24 May 2026 09:04:23 +0530
Message-ID: <20260524033424.61847-3-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524033424.61847-1-radheykalra901@gmail.com>
References: <20260524033424.61847-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the board-specific .driver_data to describe fan-control support and
fan-speed read callbacks. Existing boards keep the same Victus
fan-control path, but the hwmon code no longer hardcodes that decision
through is_victus_s_thermal_profile().

No functional changes intended.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 79 ++++++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 18af624..6fd99b6 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -133,24 +133,41 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
 	.ec_tp_offset	= HP_NO_THERMAL_PROFILE_OFFSET,
 };
 
+struct hp_wmi_fan_profile_params {
+	int (*get_fan_speed)(int fan);
+	bool fan_table;
+};
+
 struct hp_wmi_board_params {
 	const struct thermal_profile_params *thermal_profile;
+	const struct hp_wmi_fan_profile_params *fan_profile;
+};
+
+static int hp_wmi_get_fan_speed_victus_s(int fan);
+
+static const struct hp_wmi_fan_profile_params victus_s_fan_profile_params = {
+	.get_fan_speed	= hp_wmi_get_fan_speed_victus_s,
+	.fan_table	= true,
 };
 
 static const struct hp_wmi_board_params victus_s_board_params = {
 	.thermal_profile	= &victus_s_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
 };
 
 static const struct hp_wmi_board_params omen_v1_board_params = {
 	.thermal_profile	= &omen_v1_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
 };
 
 static const struct hp_wmi_board_params omen_v1_legacy_board_params = {
 	.thermal_profile	= &omen_v1_legacy_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
 };
 
 static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
 	.thermal_profile	= &omen_v1_no_ec_thermal_params,
+	.fan_profile		= &victus_s_fan_profile_params,
 };
 
 static const struct hp_wmi_board_params *active_board_params;
@@ -1797,6 +1814,38 @@ static bool is_victus_s_thermal_profile(void)
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
@@ -2416,7 +2465,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	switch (priv->mode) {
 	case PWM_MODE_MAX:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2428,7 +2477,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_MANUAL:
-		if (!is_victus_s_thermal_profile())
+		if (!hp_wmi_fan_control_supported())
 			return -EOPNOTSUPP;
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
 		if (ret < 0)
@@ -2437,7 +2486,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2461,12 +2510,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
@@ -2490,8 +2539,8 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2500,10 +2549,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2537,7 +2586,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
-			if (!is_victus_s_thermal_profile())
+			if (!hp_wmi_fan_control_supported())
 				return -EOPNOTSUPP;
 			/* PWM input is invalid when not in manual mode */
 			if (priv->mode != PWM_MODE_MANUAL)
@@ -2554,13 +2603,13 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2626,8 +2675,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	/* Default behaviour on hwmon init is automatic mode */
 	priv->mode = PWM_MODE_AUTO;
 
-	/* Bypass all non-Victus S devices */
-	if (!is_victus_s_thermal_profile())
+	/* Bypass devices without fan control support. */
+	if (!hp_wmi_fan_table_supported())
 		return 0;
 
 	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
-- 
2.54.0

