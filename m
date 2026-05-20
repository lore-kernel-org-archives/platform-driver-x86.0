Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CFD1EB5F8
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 03:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779246125; cv=none; b=ZOGbDReRMc4cykyEai53eyAvvz08Wp/3vKm5Extq162gc7hDy06qgVifaFZ8ksRSlKs4jCIQXwp1pRFnr6zt0Xm9nacHu5T8FoE12FEcuVBEdKaURM/UrincnVyPsi4kCO9/aod1G282m6qnw2gEg7i8AfnHIwc/b6vdoNUpTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779246125; c=relaxed/simple;
	bh=ZbxYjEjWKeYH6TVJaqaQGoYXGMKdRmVDxcCp00vMrG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJvYjlPNGG82YxjJmbpWYSWI6iP/3hHCH86FdDDWU+Ma8LANn9ZfS3V/McrvLd88QlH4GQGnRgEX/Amv6zZf0QipIxeNjwZimY5oaSFlIkJXX3TTpc/Aj59mrp09nbu5QcJA2FWhaQ1DHBr7tN0527Zl3cxqabLSPbFNXAQ9uQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeKPKTj3; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeKPKTj3"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so4121992a91.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 20:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246123; x=1779850923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkgzlCHJ91GbZRZC1+NuiHGMB/NT2ozKKKNhQxQYwyE=;
        b=OeKPKTj3St8rxAcLNQBbBTwRirdTPHoflfv2yjEB5G70ILxTP6sgYtxTAcPJB85l4d
         gaJT2HNYeYhuTddIVMVif+K0S3Oi6YJQgCo7UP7VzZibPh3la7llQCyXrGzbETUc83Tv
         Kbr/KUKBWw88jw2+P7Pbv7bXEfqztvvnor64lcgBs6N/b8Snj6zK5GjImj5jL2G5pncV
         XQCnGt3h+dJkxE3PK0z1tOvaqdHxSCeJEN3D3uLMPrSqEu6iCq2+9kuzI7Teogq9unGv
         0mSsz6JOGuYYLBYXZr5J2/jQc8rGqgNd9Ao1hHyOYSEgrunlEQnHMS2CEau6kctR19Je
         WnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246123; x=1779850923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fkgzlCHJ91GbZRZC1+NuiHGMB/NT2ozKKKNhQxQYwyE=;
        b=rvnczYNeBJecsFmcV1lB+wubkaaYeKHg4/XlKjLJ2Ins8TNxA78VHhcQP8tQHqP9i7
         JKnHcKlQt10COjh/c5QfGGNQh1P1ScHbsTpsAItQl0I50djEujet6V/gGbIEwddh7SqR
         i8UML3lxhei6l8BsXi0fCaQnO9WdUzyIa4LgNgS6fBOTbsCvdMFWdguF+qpGj/C+cNoB
         JekWTZqPPAWGvOwRCA5SRcbBXBnUprntWbL6xDaGyuZTDH7EFgdSPhZm+JQYKP5E4Vzb
         4wzPinL20GZmAkEWzZdDw+suj01JNIWeki65l8olhmYjiL2qAXgwwtkobjS5VXWHPFpx
         EuOA==
X-Gm-Message-State: AOJu0Yx64jCQXBoVgG4GWHyB3bIIbiHU1+9ErawWLGUX5/Aavd1OyKYy
	RyXMHV6SaHs/Xe4bOA7pfx3yhsiBhE1TI8hv9rD/vSQCYf5Ji5Ai9z+0ej+qmNQXNao=
X-Gm-Gg: Acq92OET7Th0DEbbN9vpm1wzigypkWI3CEtT7Vvi3Quagki51dGktNl1fYli4TCHtGu
	Z5B9ptZa7DYRi6+IS8eaRtpNIA5tTnGdSvPNZ69L4wdZMvMhPhQ3fuXm0B1YeDQ1+O0rIKDA3op
	Q/cpGhFpEbHVpNcR+Amx8/VP4kr7eXYD78kABl9V5DMrZdlTpvIHOSGYQGefuMWxmDCZS+6wL1G
	PEF77v5oQhh3raYMlrsAij/HOZ/Lpm8lJslD+KLf06ZWmD12FNI13iyvB8XX87UD4CL0sECk5CI
	tPxXAxoWkTuow7MWKFSp5gvp+dCpM5ykz4VV7SAZi+MHv8UYLOxawTHOuyF5IaMSdthfUrkJQJt
	GVeAP2VHUpKYgzoJlcGuEJP7TU36CW38ds519ddG++0Xr+7YUJ6oW4W9DfoTEeMIxhlOJ5mvutc
	58ngHBH2CJ9Dj++H4r1k/ZKFzbAMQ07CrrrLLwVFREsJko
X-Received: by 2002:a17:90b:3842:b0:368:1088:bb1d with SMTP id 98e67ed59e1d1-36951b88122mr20781226a91.15.1779246122872;
        Tue, 19 May 2026 20:02:02 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:1e5a:9abb:36af:543:3c14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm19869676a91.5.2026.05.19.20.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 20:02:02 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	hansg@kernel.org,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v4 2/4] platform/x86: hp-wmi: Drive fan control from board data
Date: Wed, 20 May 2026 08:23:23 +0530
Message-ID: <20260520025325.103701-3-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520025325.103701-1-radheykalra901@gmail.com>
References: <20260520025325.103701-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the board-specific .driver_data to describe fan-control support and
fan-speed read callbacks. Existing boards keep the same Victus fan-control
path, but the hwmon code no longer hardcodes that decision through
is_victus_s_thermal_profile().

No functional changes intended.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 79 ++++++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b226695..465ad8e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -135,24 +135,41 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
 
 static const struct thermal_profile_params *active_thermal_profile_params;
 
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
@@ -1787,6 +1804,38 @@ static bool is_victus_s_thermal_profile(void)
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
@@ -2398,7 +2447,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	switch (priv->mode) {
 	case PWM_MODE_MAX:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2410,7 +2459,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_MANUAL:
-		if (!is_victus_s_thermal_profile())
+		if (!hp_wmi_fan_control_supported())
 			return -EOPNOTSUPP;
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
 		if (ret < 0)
@@ -2419,7 +2468,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2443,12 +2492,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
@@ -2472,8 +2521,8 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2482,10 +2531,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2519,7 +2568,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
-			if (!is_victus_s_thermal_profile())
+			if (!hp_wmi_fan_control_supported())
 				return -EOPNOTSUPP;
 			/* PWM input is invalid when not in manual mode */
 			if (priv->mode != PWM_MODE_MANUAL)
@@ -2536,13 +2585,13 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2608,8 +2657,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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

