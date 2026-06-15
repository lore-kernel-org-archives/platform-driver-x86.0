Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326F33D3311
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514657; cv=none; b=jr61Y4V2immPG5CPsRWIse7hyDF9nCNsrjaSyv5f41HbgFk0NE9pSwoQ77ExJuVtoFkysAJCaWxF4xTivfQfr0wUbNK9ozld4qpPlO/NNBbPhiPDfKfN7N5nMwN0BUHuSbRDhGHvUr5790OU6yZBSGZ8sQlLqknszqxLMTsZB98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514657; c=relaxed/simple;
	bh=YRqUCuedX9QmoiKQab0FrUThvedGKPvm9O6Q6vpfgcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnDSGLo+dJQmgNPsRym8C3fdVYc7uZg+y9j4AJrOpMRp310y1EywpDTv3ezr9I55hldij2/N+sa6ZnpZjfvJMTInV7to2Yi5J2ZU/8y5zZdY482dWz7ZCoZXE9crgvoRXTde8DCCTZO/NY28Ctab9Mu0XjpOCkz2si5CJFcXbTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXrTXhp6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXrTXhp6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-842848fd613so2742401b3a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 02:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781514654; x=1782119454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYZnvAhWpc+vRxV3SQnSY4A4kKdtMLWyv3TfVkWRy70=;
        b=nXrTXhp6Eku818QHWBAgTOokZX13PFoLx7SXwZZbRDGf+qBTFLM2IZQqaMwGItfOzo
         jeAVD4jycpITRNWWmPjA+ZGNQPFypGwGutU8f8mb2mfPjxFNI8yl/SVcXuIu6PlxewOH
         O1cnUXvRB1Fxsalm1pvXNeaG5vPpQra9Nceg91bK7Ko94iGyK0SrGQSLE8XMg52W+XdG
         I53Il9w86FO3mvuJsHm9kNeHEzGyJMQrmQhgOiA4l+9w3aimi87eLiNUJRT/1Ow7Iakf
         wLp8duDboXsDfieH6UhxZJuJgdEQBWzeRQpUCXsWkDsR+Eymr2KGAOq1VvSeQggaHYKE
         GYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514654; x=1782119454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYZnvAhWpc+vRxV3SQnSY4A4kKdtMLWyv3TfVkWRy70=;
        b=mbEFDPEaWE9TFIF4r5HksHD5hVRIVUMvnLmBwq/DPdfpx/OB/UOCjbpRTGKrI+DAuP
         24VSd4avbnVvtsj1LHuOdPrMPtiLgRMUoNKgESvnscqJ9jsOikO/G93Aw1ppPrrvPgI8
         6ubGCdGlwvQNwMXv6C1a6CKgvVn87JLAF67BIrfkXGX28kLHwB+U6dVZUNat+Zgfw8kC
         B86f51O5661D2L585M6OS1R++1dYHD+n80CgxQ3NDBjRmz6S33YTf27MLnFXfNrP+gkK
         5WqJZEdWhubc5l8xrYOJqHNSHsaASdQuyncie6MyCkxL7RBpUjtCcK6+uMDLOXjsX+c5
         YheQ==
X-Gm-Message-State: AOJu0YzTiGwi+JsbRbkIk3kgK1LgWmvlxQMNOCgmwFgpf5t7jB6jjjCJ
	SjQRgpSK7/v2IhgXQWmC67ag02g8zcBWui82oFe1uurMClHU2Ns4QE++28Pe1DWI
X-Gm-Gg: Acq92OEnv1D5lONrxo1ie3+avJDXwTLiEDI2o6AU3Fpn2Bic7mwbZJwcAPrN/iOErAv
	zxdJ7yvH5fK1hbCmZ1a6D263xYWQe+f4tCdqQvIC4bh0jhOepetfwUbN07u0F6HXLF9WbPtY7EQ
	dJIahX7hM1nyBN9JEZWGafar1/WQzbLM3Xl6bX4eapOqGnItnnPUxqFVfLE/AmmtzHIEH4eyffz
	lz3/OuxQJPIbHQ3uco75LN+mvVTb6sY+sfHXZ+KXV+HBNn5Y3JmF6buGAWyJ9CxC3E8rKrKFHA3
	gS5vPyIIhMHIqKR/JVHPtLfuqkJRljJIZ/cvbmnnTtXBEYPtSfQTa7JDRHPD1NEpuQPmCfviCzk
	oSrx7BC4Td2mOcjKkM8AVpDzYoivTkKroWP4Oea00eh2X44izpU+akxz984/UoRl0afQpjLPf3Q
	XlkClZRfduotBH+sci6jd89/9wH2zR+sbnxtg=
X-Received: by 2002:a05:6a00:4146:b0:82f:1b1b:e166 with SMTP id d2e1a72fcca58-8434d0aeb79mr18828446b3a.33.1781514654519;
        Mon, 15 Jun 2026 02:10:54 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:172b:de82:f342:993b:860a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b00d4c7sm9392459b3a.40.2026.06.15.02.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:10:53 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v10 2/3] platform/x86: hp-wmi: Drive fan control from board data
Date: Mon, 15 Jun 2026 14:40:33 +0530
Message-ID: <20260615091034.987029-3-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615091034.987029-1-radheykalra901@gmail.com>
References: <20260615091034.987029-1-radheykalra901@gmail.com>
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
index ee8375d28..11de5c70c 100644
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
@@ -1813,6 +1830,38 @@ static bool is_victus_s_thermal_profile(void)
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
@@ -2432,7 +2481,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	switch (priv->mode) {
 	case PWM_MODE_MAX:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2444,7 +2493,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_MANUAL:
-		if (!is_victus_s_thermal_profile())
+		if (!hp_wmi_fan_control_supported())
 			return -EOPNOTSUPP;
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
 		if (ret < 0)
@@ -2453,7 +2502,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2477,12 +2526,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
@@ -2506,8 +2555,8 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2516,10 +2565,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2553,7 +2602,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
-			if (!is_victus_s_thermal_profile())
+			if (!hp_wmi_fan_control_supported())
 				return -EOPNOTSUPP;
 			/* PWM input is invalid when not in manual mode */
 			if (priv->mode != PWM_MODE_MANUAL)
@@ -2570,13 +2619,13 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2642,8 +2691,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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

