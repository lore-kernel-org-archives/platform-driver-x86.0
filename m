Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09632466B6E
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460117; cv=none; b=W77wdmcDAAY3xPHNQSJBCfTW1Qe62o+gn4a5k1sY+L/pqBRC4OJvF8lCoBj8iVl25pZ9sz9udm/4kWu4a4xJOi0827ymJz99z7zbqVbC1wn4N2L4owJHuvYbWs8sXT+s2LDhXBigND09jTJtm1436P7oOI3nwzrdNy/4yYv23K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460117; c=relaxed/simple;
	bh=U/2BKNjAPjmrnQCTW2KUI/pVJ0MlmQhdCQBY5YUxorU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2K7jlHLAF0asF4Vbi/Lp6lFHy0eK/E9qzoxaayP+ire2dC+J+PUdXAKbr4gIf527Xn2+Zbn6HXWu91wMlSmNJpdRe4XtAT8otJzS3bUloBIiPOOAIVd/AM8R9RsVq2/YpA6XtrI+KTPXkaFXmaWZSO4jOhiVzpiSn4Pwj/y6tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jzr8Hhf7; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jzr8Hhf7"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso3622981b3a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779460112; x=1780064912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgQbWAqSdnWnfM4lumHwn05mhv+qE4ZJ1eOs7qohgaw=;
        b=Jzr8Hhf7chhHF+Xq8gPIirP1ayxXiz4rjsqxulGPFq99MmMQ+k+f6rPzFpQpiBIsVZ
         mKuKUMIjsPRBDsliHVtNwY9yLI47pUaXJ/xK94Rb6Xs6waDf96kmsCu82oD4pZB52H4u
         C0kTSoZbnIWRLDYBTSUu601ICmJlousulnkWiqXHnxukbz/VFqCQ+Y6glZw59f2oUpMR
         MW1XstG1245NP/tRwCstkND3N4w98hi1MBRt+BHB/pkr1eCN1M9L0vFDu5/IEeImnBmN
         2VhtQXEOGeM+Rq6F0+ZKL0ClofVv7Ch/LyVWyO7RgzcXVrNP0Ne+qWvRwPKSQ6L6aUbb
         jO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460112; x=1780064912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TgQbWAqSdnWnfM4lumHwn05mhv+qE4ZJ1eOs7qohgaw=;
        b=CDTrZOhqvCYGJJwvQQzW0vB8cJix8Z7d9wYHlEDd2Owf5yKJug6yD8/ujXM4OY/58H
         E8g0c21hn6B0oP/87fTjQGtZnGtG6HCLzAKW8y0IS/Sf2oJrLYc1Z6wndUptTBOZ7Yly
         Ln6bNF9RsB98QAn+FaZTPHH73ZSHmwqGPWP1XrZIsQ/oPE+vZt31WJMF6PCgSMqRMnRY
         pxx6r12QU4oMk6as468P74lVM3FifSniwOnFQzGBHZnrUpeGHHwbMui3zSzdhQ2sIS5l
         ikEpIQGR5GaBT2Jm6i785dLD5+nGlBH28HoRPQFUP/fS4MQ3dilEmMLgJhQqUpaGuutP
         JIyw==
X-Gm-Message-State: AOJu0YyPSEzOgKbdglCMMPvjT3PWQ3pep8VXaus+n2knTDvrWklqv+J0
	jnHeoCeAv+LbsnYgbX6Xvfpf3rWeRFDUhEPE5fQq8tsqQDz0sLJLhJfRgBjjUli3
X-Gm-Gg: Acq92OHrJqFTclaYfsCVJ2/SP6eaBIj7sbOE3lW1n95MaJdGo88vSk+2TASuZ1ZhaYU
	fLnHIlBODcJhTBhoKCCoKEiyG2fIpNnzWKGbnU74L35LZho3PU2s95obPNA6bXwIHqSfzQwCh8r
	VB1/xbTUw1HpGGD8TLDDV2b5H+TFPfE/FCqPqgz0ifFD7TxaWc9xyNR2JU6dyTXicdON1WWAhUj
	VNIoe8zPUwyqHNRP/lfC/vwNEdTUYCKEPEOrI9cge7Ow6x6rQudTgT+TlPDVYP6Zlhv1ZIPnFFI
	OwsQ6Y/c9U4izQyVvQucFaaUa4Zp+iNo9tmE/4ehW/5soD51tkvWVfvsGFfai2zfiao1kXYutFf
	plKUTIZg6w6GJt6KK1usqS0r5kkIWzvSjJYmW+oTcL1BgQ8q3MWQ5UNMDCVxxBRyk/QcYf5XHi5
	bub1VAk4RuO8HcGvOv57aVClHUH5maWBzTXA==
X-Received: by 2002:a05:6a00:10c3:b0:835:3de0:fad5 with SMTP id d2e1a72fcca58-841611f213bmr2773577b3a.25.1779460112274;
        Fri, 22 May 2026 07:28:32 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:4610:9413:be16:7d6:5a67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b0427bsm2585087b3a.22.2026.05.22.07.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:28:31 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v6 2/3] platform/x86: hp-wmi: Drive fan control from board data
Date: Fri, 22 May 2026 19:58:07 +0530
Message-ID: <20260522142808.235894-3-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522142808.235894-1-radheykalra901@gmail.com>
References: <20260522142808.235894-1-radheykalra901@gmail.com>
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

