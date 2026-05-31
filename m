Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6689A285CBA
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780212666; cv=none; b=kbXbCh5xLT/U+wnNouMXcRlWsC+sgGfq95AssqoVtDKC4TeZW1ZjKAksPz24ASiIWNQ57lYU4H5YjAfxLUcLLDI56WHLdWzsemAFjeRqUJEsIeIueYlDFdZfRj3a8qdlUtV+c3yBPYX0GmE8GaTi+m4ErRu8V3WYeF3XUSTZ3ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780212666; c=relaxed/simple;
	bh=9Vrtmt9TLnpzP7RUBRcu88TaZ7z+0Tj7/KaLf+xZEk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0Y7+vl88RbfPoqN7MzhwdrxJy76+IxOHkrcJxyAz9/Wn+lKHJBhIEBZ8tvXf4iefPbH5veJOe0JphzVFOhbtiH8KGRL0xHmtKmWGrxbBgS0OfUG6y8PhjCZ8sY1m4Rws8he9ycN5Gd27/L7+jQ1wgfydsP3+cfqB2koc8ENvOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2qNYmyn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2qNYmyn"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8423f1d8902so48028b3a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 00:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780212664; x=1780817464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOCCL1raq+FKY8QdVBvjX9Y8RqpoSVaIdZQgohFimtQ=;
        b=U2qNYmynlFk2xEGtnGrG30RBUMtvzDKskf6Y2eF7QvIcMdO5PUP8Y1JRATibjaQqAz
         2MZYm8ml1dxpIIT5KXULUCZissXH/7krdpziIrWfrRCBdAsG+x7QgqJMFl763RmVEuIA
         GEVgXKoQ7sqqeZ0WY5SpsIiSRPq+I1dSqtZC08jZne/hVmi5wNPqAGy7rADRrvGDpdfh
         DWHHnxzcWy/j4jPPj+PP6NnA4HgWjfn6LI7slROE1yDIZA/2D9QW7xgz87XrEQTJCpPI
         q6Pu44pU6khMxdvMEeNHr5leAlp6d+mLwRljI3b9W/hvFCOpJ/KYf+2vzDwRTpyF0tmk
         a8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780212664; x=1780817464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VOCCL1raq+FKY8QdVBvjX9Y8RqpoSVaIdZQgohFimtQ=;
        b=Qemxi5vMZQJOVX0VDgV+NInLNpTqAnS1DWHmfI1v8W6UdtSIRAtZ8CeolObT/Mmp38
         iAgrKzAzvIWTgC/qTCdzj7Mc+ivADWjQMgsLx+/krbzaXy3d+AfduElYpqkUa8xydinL
         oQ8OLAkiZO1Jvu0Zh/q2DQb/2bslyJ4aQxy1vRvMnERRr7z5PZRIr4WLP0lpeIELDqcm
         BagpzbpYKbiwPbDx73rVCX1h+VFrtiQxpGSoc71s5bVlcIwikrB6fAtyAyY115ruMscv
         g0K4eWt0lBxIb6Kj5OxvDWIiJIuzq50ku/7yw8CuzBcG5C2xkToVr8rb4VXMZtjUMIhS
         B4Uw==
X-Gm-Message-State: AOJu0Yx63olYWNcTeXPa47IVwd814fN9LQxCAnaAJq7YnoRoJPqw8GHa
	fOJK3qE5hai/nRK5mFuzZ3bk42rhkHB57MgqcupXJXwm9by5HIHOscK/RmWTDDfVYAU=
X-Gm-Gg: Acq92OHqRa4lR2Qj9DAoVf8bmSN+Kh1+Nwaq01H8UoA6ea4bRl6HZvg129v1LmqZTBm
	nlAKlqtAlq0IwJyog0nG3fSs+wfP4kpRVC4ei7qL5pwIdNVigDvX8xT+qO2g0/EMdmS8d6PvbjQ
	N7Kyl3KOFYqgFHj2OobgsrOfDaD2HGtzD2lAmULybwMkflHM0Z/GXjA2ye971FSc6YDlZkVaRTa
	q7it1HS6k77skDiNwBGK9EXp3xMQy0Jh+t57OyKd/7N7X+44Njw9mXFMBNE543vVG7b3ax0pPqx
	tkntJNgfHI1gzpSVRUTsJWQ6A6G/WyH+qAaOcQI6Yq63NKLpm0kZiHp0mQbNoSiVeaTYiQY73l5
	4uZaUwryWl83mR9SQNmIg857PUWoJyvAkxo/1welezcfXsKxeJiKcP5GQchCCeczLcdKa6Xwogd
	zIdEMNXezoUakKTiIogPvxoTQS4DQSwttmlnvcpTNXh3Bchg==
X-Received: by 2002:a05:6a00:340c:b0:841:edbf:6425 with SMTP id d2e1a72fcca58-842253d0da9mr5765499b3a.3.1780212664451;
        Sun, 31 May 2026 00:31:04 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:6221:e402:4ae3:a02c:75da])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm7597090b3a.26.2026.05.31.00.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:31:03 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	krishna.chomal108@gmail.com,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v8 2/3] platform/x86: hp-wmi: Drive fan control from board data
Date: Sun, 31 May 2026 13:00:35 +0530
Message-ID: <20260531073036.195326-3-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531073036.195326-1-radheykalra901@gmail.com>
References: <20260531073036.195326-1-radheykalra901@gmail.com>
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
index 4a795e6..91578e7 100644
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
@@ -1801,6 +1818,38 @@ static bool is_victus_s_thermal_profile(void)
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
@@ -2420,7 +2469,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	switch (priv->mode) {
 	case PWM_MODE_MAX:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2432,7 +2481,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_MANUAL:
-		if (!is_victus_s_thermal_profile())
+		if (!hp_wmi_fan_control_supported())
 			return -EOPNOTSUPP;
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
 		if (ret < 0)
@@ -2441,7 +2490,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2465,12 +2514,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
@@ -2494,8 +2543,8 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2504,10 +2553,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2541,7 +2590,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
-			if (!is_victus_s_thermal_profile())
+			if (!hp_wmi_fan_control_supported())
 				return -EOPNOTSUPP;
 			/* PWM input is invalid when not in manual mode */
 			if (priv->mode != PWM_MODE_MANUAL)
@@ -2558,13 +2607,13 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2630,8 +2679,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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

