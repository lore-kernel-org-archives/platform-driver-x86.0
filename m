Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8896833BBC5
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 03:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160162; cv=none; b=gNFZPidR0mcxDiQSy09p77P/ClfrRVNZEocpP3Dxi/zADoTEKLK/1j1DRo+RnVep/Osxfwo/YYloUNdqkk8xUY0H1maF22GRjgLi3k20t8dWTtxOGpoAkyXwN8Y56byQ9iChKFY2V3HJtUrtq9EoD+Db6Jug0OCBcyuGai58CQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160162; c=relaxed/simple;
	bh=u04aM9poOxxFpx2PUGg6b/TwGZAW+pbQ14ogkrzL/ys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FlMhEpuOOaT8NVlLMN852aCIqilae4BJJpG5kH4uFY2XNZxLZQCCCZ2wL7yIH/H6TK7PuMmOX9VzxCaoyywqx7oaxeHWqoaRIrIpP2n4dZRIzXcE4N1bKj94MN3d/rT36YYoBq6LMED6X+rmiVr1per/FpwVbg2/LKUcOqcmTQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BK+unaq7; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BK+unaq7"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so1498579a91.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 20:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779160160; x=1779764960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cAH9fsH/dzFzgxhUFRcYfI+ZjZWg1y6JBV00neoluA4=;
        b=BK+unaq73BRmLRCfge09N8Dru36Z+nwLEM2VZTj/8YPDtjrDzU4Lt08s1gEgN834lN
         cHMKObi6gQd0VETUjMMtagpW2Kg0lLKv84LegstTTXOdpQISiHxzrlt8XcPoP6Ky9H7S
         R5fIzArSeBkPVuXLf4ILO/2iqJ6LXfFx2NWo2JSPkTxqIexBn3l00n2vfoVZcrHIWy7q
         YtSA+tc+9K1eNw4ewgOaQJfjI+CjzKvLcKKFtngo+y5ZQ+S2Eu2O40+cr7/SxSFcqU+n
         OK620qXasS7qPC7kigoWiuPlnGN/qWGwy+GNZIiKz1gZi0mD0W3Nvqhht4hXBEepxypT
         VKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779160160; x=1779764960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAH9fsH/dzFzgxhUFRcYfI+ZjZWg1y6JBV00neoluA4=;
        b=DysZtXSb4liTBcpLQQgnIoYw4okaA8nMNBOpwNBliaG1ACic1eynCP90zoFB8gaGPP
         1nIv2u+2nTfI1/iBNHZ7B9GWsANoYrp0DBzJhT7xZoYX0gH5cZaSGvGInCRJI1Zmpjcy
         pJ/HdSuJGt56qmNKIz+5akG/JrtNG9tiX5Uo4yXDpEQsHb6sn6ctXbNutE1rrhKhaLm1
         p4NRXpk6R8Z4Fbkw6fqSjzme7a+jhLTBorNfDSMkDP3d92dLcSpXs2hA38oCc298nguW
         TnYAhmeRpN7J4LCKw/stVYPQBMg0exxR5PTkQcSDlf10lV4XA9EeMwPPieUTUyNBIaMK
         pjFQ==
X-Gm-Message-State: AOJu0Yxq6s75SsWjoknMz2/scWHBqxbckrJW5s8kX/0gVGLDTcdNcVn8
	mrSQ5pTT70Gr/Kkv5DXejk36nqgkfRP/vgpgrZPI08mi4vVPjzOiEd/loBDcHT50ywg=
X-Gm-Gg: Acq92OGf4t35IXiPVAW6l4+/iMpjKAih/FbmDOJyPuoq//QY9gPEnthund0krPmXWPn
	6fcccjUVYyw2XuC5QGwmzOIWiK+Gn4E+24M+VURzAI2mQ9GLGHu7RIYY3PFS+uA/WwZI3Aj3YcZ
	C9XDdGcUJnSsUguxWMBiIyGPez44Agx1lMKN7KkjD9qP72l9CeFS/e+rcveAx+4j6acj/7d2ELG
	z5UlW/UmNhanxlqK4fm8yprjhhyHlrqkvy5HcelHfYt7+fGK8vet+9mln7ciHO1Bh3cc7mVlZXT
	wNO1FuRPOS8VlUeu3O8EnmN/zoC3w6M/hvSAd3Nz2ReILxe3ZVJWEni4v4tvdJQ3c0ZWTkljZqe
	N2xRd12YcHXWtOgohkLmgrpUqT9AR/NZTvpd9Z7RTXUpiOyYZjvjp4fHh4+Ea2DMsPjsPF56QNM
	sM79gaKoU6XE3I59Pi
X-Received: by 2002:a17:902:ea03:b0:2bd:9c0a:32c with SMTP id d9443c01a7336-2bd9c0a065cmr136726965ad.19.1779160159730;
        Mon, 18 May 2026 20:09:19 -0700 (PDT)
Received: from pico-cachyos ([2a09:bac5:3e08:7eb::ca:188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fbc05sm163079495ad.57.2026.05.18.20.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 20:09:19 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	hansg@kernel.org,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v3] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
Date: Tue, 19 May 2026 08:38:50 +0530
Message-ID: <20260519030850.59398-1-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
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
Changes in v3:
- Rebase on platform-drivers-x86/for-next commit 165e81354eefd555.
- Send as an independent thread instead of replying to the v1 thread.
- Keep the v2 board-data approach and 8A3D fan-control-only handling.

Changes in v2:
- Use real name in Signed-off-by.
- Replace the ad-hoc fan-control DMI table with board data in .driver_data.
- Keep 8A3D fan-control-only instead of enabling Victus S thermal profiles.
- Use the fixed fan-table parser path and derive gpu_delta from the first non-zero GPU row.

 drivers/platform/x86/hp/hp-wmi.c | 197 +++++++++++++++++++++----------
 1 file changed, 136 insertions(+), 61 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7..514c28c 100644
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
@@ -187,67 +226,71 @@ static const char * const victus_thermal_profile_boards[] = {
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
@@ -1769,6 +1812,38 @@ static bool is_victus_s_thermal_profile(void)
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
@@ -1904,7 +1979,7 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 
 static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
 {
-	struct thermal_profile_params *params;
+	const struct thermal_profile_params *params;
 	bool gpu_ctgp_enable, gpu_ppab_enable;
 	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
 	int err, tp;
@@ -2380,7 +2455,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	switch (priv->mode) {
 	case PWM_MODE_MAX:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2392,7 +2467,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_MANUAL:
-		if (!is_victus_s_thermal_profile())
+		if (!hp_wmi_fan_control_supported())
 			return -EOPNOTSUPP;
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
 		if (ret < 0)
@@ -2401,7 +2476,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (is_victus_s_thermal_profile()) {
+		if (hp_wmi_fan_control_supported()) {
 			ret = hp_wmi_get_fan_count_userdefine_trigger();
 			if (ret < 0)
 				return ret;
@@ -2425,12 +2500,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
@@ -2454,8 +2529,8 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2464,10 +2539,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2501,7 +2576,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
-			if (!is_victus_s_thermal_profile())
+			if (!hp_wmi_fan_control_supported())
 				return -EOPNOTSUPP;
 			/* PWM input is invalid when not in manual mode */
 			if (priv->mode != PWM_MODE_MANUAL)
@@ -2518,13 +2593,13 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
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
@@ -2585,13 +2660,14 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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
@@ -2625,12 +2701,15 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
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
@@ -2673,26 +2752,25 @@ static int hp_wmi_hwmon_init(void)
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
@@ -2724,11 +2802,8 @@ static int __init hp_wmi_init(void)
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

