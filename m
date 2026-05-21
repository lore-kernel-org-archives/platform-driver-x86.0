Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940213D9DB7
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 13:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370454; cv=none; b=prsVT6oTLhr/reM1v2/vIf8K9y4H1+bTwoNNCz2J7BafRtqnTU01I7IheMLbBAI/Xg/dLa2bo9OmtRSx1p+fFnUOKO50viOfrym4ATX01kQZgJzaVS9kr0dvwqEWjiXFRgGW2ya/UDhXIqKpM7sDQcMnuJWpeFkoSAxEX4Rlbn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370454; c=relaxed/simple;
	bh=5Yz//sJSxfMJcxNZpom0A9Uh9Rxp1o0t02RP4phl6s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWM/hVUFO0RDw5Zs4FyTFaIwz8OSAVXk7K1XZiFL49OWr7F5Pjrm70JwFVNjtz6/GOU4wjlxrIprkeACzeWaxMVRGZiMaoQjwgtidOK6RCZAc6VnHekf6851U8CK/gAMgT2BjT/yOOfi2voXQCUeKzB65Wo0yN+H3Cz7u4RUXsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XB8/1yPR; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XB8/1yPR"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c80291e6237so4519223a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 06:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779370452; x=1779975252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPfURVFhC5yg/1Tjn/WJHeoCo2tUx56EleK4fZZ5Kho=;
        b=XB8/1yPReKtqNV15MZVX9EPcE8QQjnh/daZm8wHJ50OSAX9cJ/z1sEXobfP+82lh0u
         xI8egA2liRjWEZYNmPtLGdW+WEb73WxDCaD3Nx6H4Uxa8EceYY98uqytF/3cT2itNhRh
         ymCWneLOVE6PrxTPw1WCien5bRZ3LUj0uatBgpG7A8tZUz8gVdfyxev8UmpxNgiIVuFC
         F+4Wl6bfvKE9vMWuIQFFM7R/6aORqV8VXq0YBul/bvEeX16zNk8vPx+3ckfgiHQgxolp
         AF/7ko/SnDnpah8tEVNX2OKYLAzdtgh4DPftP7BBisMuTG3/seJWvPY9i/B5AC+lwf/A
         NY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370452; x=1779975252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZPfURVFhC5yg/1Tjn/WJHeoCo2tUx56EleK4fZZ5Kho=;
        b=Viuvh4/wTeIES+Jy2rmjetrD0N8+7m+cL+oibTO0GfQBtNz7sUzNHkaap9qGk/N1Md
         KXUCwTeJnSlCSbBaDlS6FD/tXCXmsp6GO9TRUgOO/r3rE2ufx0lIoMVZyucn54QMkJGJ
         4vvamVzwOy4TbtZwQO2B4BQZVjpPiX2x0pIY6wYustPhANdYLzT6LGSlPR0sHmdKIDs9
         neB6ENLp5lE48YvdKZHxxNY8paGi4eRQv6jwc6wHG2YkqssfxDsqwwZHe64KbxEd4MJT
         qGBZPsYwSRXfTbd7MOzPC4at8W/T7EjOqu35hH2q4sOLO/Y+vxYNz3/jyLpqv2pugz7R
         vOMw==
X-Gm-Message-State: AOJu0YxFewRbDKNZRvmJlRC/TJ1pxUtUwifgG6RlhPuo1+X2VnvNj1Ak
	9VwUPfX6NKQAdowrslVS/gFV5abZfbw/2F0pHAdRc8qz73iTpVfmFa7owhfJXs8vJUc=
X-Gm-Gg: Acq92OGTZlH35zTtg0qn6yQKfm8P4CPvshL3YdG9q1As1E0y2CyuNaOq14xP5UwSB4t
	QEd2lYUbhbGfR23bzPuNkKrFrv6boY+GqfynfoAZEss+xT9oU4yr7Cw570Lix+/Qi0xnu7LWnaD
	IgPMjoTcSzcp/Uxit2p0V3zUBPALE+UPk4ZR1GAtuCcon+IrPQecEQ0oA4RCZA0beD+2bw1vaka
	YRW/6vm6R8ejmK5kQDC5zWBsujvGuqZb8XJSHj3nXQ7GB7Xu3oxTQxMPmSNjbgyLpQ6D/C6l61j
	4RDDTIWCcgVWu4zafLuKHV+B0Xex0WW5kns2Bg6DJ0DZSTWdrsiZMyJfyk4RyV00dFCrHMHhVds
	vkrhrK3i/OflnDof5yNMqA8qovzgSseUaArLm5OOupU31xFcx7AFbbSZ3PSVlet8CjsZDUp0Oau
	7/w1oFjpnCYr21LzH2ob6wj7W9bxgZhPl8pA==
X-Received: by 2002:a17:902:e78c:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2bea3379cb5mr30863585ad.19.1779370451782;
        Thu, 21 May 2026 06:34:11 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:4610:9413:be16:7d6:5a67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea929d774sm12284785ad.32.2026.05.21.06.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:34:11 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v6 2/4] platform/x86: hp-wmi: Drive fan control from board data
Date: Thu, 21 May 2026 19:03:49 +0530
Message-ID: <20260521133351.1512718-3-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521133351.1512718-1-radheykalra901@gmail.com>
References: <20260521133351.1512718-1-radheykalra901@gmail.com>
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
index 280861b..ae2abb9 100644
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
@@ -1793,6 +1810,38 @@ static bool is_victus_s_thermal_profile(void)
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
@@ -2412,7 +2461,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	switch (priv->mode) {
 	case PWM_MODE_MAX:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2424,7 +2473,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_MANUAL:
-		if (!is_victus_s_thermal_profile())
+		if (!hp_wmi_fan_control_supported())
 			return -EOPNOTSUPP;
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
 		if (ret < 0)
@@ -2433,7 +2482,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2457,12 +2506,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
@@ -2486,8 +2535,8 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2496,10 +2545,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2533,7 +2582,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
-			if (!is_victus_s_thermal_profile())
+			if (!hp_wmi_fan_control_supported())
 				return -EOPNOTSUPP;
 			/* PWM input is invalid when not in manual mode */
 			if (priv->mode != PWM_MODE_MANUAL)
@@ -2550,13 +2599,13 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2622,8 +2671,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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

