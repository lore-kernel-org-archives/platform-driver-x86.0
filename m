Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE98224F3
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780732950; cv=none; b=O4E3wCVgfYlk0FAbNhS5eGupi2JbRrD3yNBKFoDf5uKHacQTX2APxZ6p9qEKWqa08PEWVKhv528+G1an1rzW9S89QRGph7p6m/0VwXzVn3JLM+oIg7+D5a/MV6bCZe9ROsUvBN8SPJPip0GGSPfeOL8wwoYuUwoBVKwKZw6UmYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780732950; c=relaxed/simple;
	bh=9Vrtmt9TLnpzP7RUBRcu88TaZ7z+0Tj7/KaLf+xZEk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhL9byT0k9MHYfUFSvndQTJwUCpUdqtcsRUQmhd35zZAGQK32QgIvMxGrCtvOFG09uyPpYZx+zJMKZy/kT6q8ARl0M8Yl6ISo6UqPGVrzbdfKGd4KmER6FD0++EiheW5eFo2K7EmxxRboSR0ww8HoG8RAKYzTle/W4TC7S8wkWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADZ+pwjv; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADZ+pwjv"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8532ba6c95so964571a12.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 Jun 2026 01:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780732948; x=1781337748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOCCL1raq+FKY8QdVBvjX9Y8RqpoSVaIdZQgohFimtQ=;
        b=ADZ+pwjv8/ns5VYzT1R57/jUZwAYQtYzo7U31MlkCl3cz+chFeR2NVRxgrT30zKtIo
         thdnjIf9Du6hax/woSvua7UTmOF2ij8irPhDCkLxLL6KxlSzeWvG3CDtWaLydh4jgc2x
         D/qz549EXg/itv3SYnSr9bqkDtynjcyKDamDcqUWEwviKIoOragw6yutJIgU7RqL99Rl
         fKAa9miOzn1grdaESk0GgwQodXtiKgkIvs/WfZDtnVQ1xr/GDBz2+lMJm/u/GDwEk03C
         XPVauZacZMRyZPu7nMvA1XNb3NoSoRwgBXFbZUM+WZkFNT51/9X5Wg2Qd9noRVk1uGwG
         x0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780732948; x=1781337748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VOCCL1raq+FKY8QdVBvjX9Y8RqpoSVaIdZQgohFimtQ=;
        b=iBHNR74Ap+lc/F6kXg3cCFfT2KDyoHHp80JTAn4/XVKEpYRTSYqF4bIjXDgtF5m5ng
         inQBlr2ZSjp2jmOIcot7TDi6Jk7xFwXXyANKzyTjtwRv52TiR9GE4ZkxSmkk7b1CDo4h
         sVIuiknyZKY0677/aU37c4aF0xddHFanhpQlxRYNJJnQJwm/8VfD7g1Aei+aPXfdCvW9
         1OUmBFJnpuSgmAT08fObWnwnm4HcVZcw6NtLz2JZHPg+bQVNFXfj1zvDBlnStWkmRdtX
         KRezXbvpsNcGkCqs6aWiIurj/PYMxtrPnJBIRhHPje5xafym713WIzwxz2K0uGXsfvVK
         0Pgg==
X-Gm-Message-State: AOJu0YxCR7eQdGsRDkj/Zi34kLPh3dyZ9QmT6ChG43SsPLXbRSUjAom0
	jtoZQckvXtqLbp2l2ihYoOL52CeShCJntJKp8hlD0IRBvTKpCaXCzT7ZPS4289wbP4Y=
X-Gm-Gg: Acq92OHG5lm/VcpVTGW4Wgn6C61MP6cfx83M9rp0wXBnS/mgKtMJL+/ICHKiJJ0XStU
	1FiGkzCAv41eIZSOMbAcxQQgnCmWuzgScXZUKE7E2HOjCkaMBszztE13qyZacGzLrIpdWxBVi40
	+FTP33GVFIZmtWeDiKNIicOOjWHWKpFIfS/g4tcQKw/Bb4uI/0NSIPI/O1qIcBjHxESUZyGN/ru
	lyGaR4gM3obmjiPUDPvdC4LzwYCUNMcHAxxj5ncaOsZE6/acMltCeZhIcpz/xW0jyQhkIO81y+y
	T0MuAFc5aIk/VXHl8FAAozTd/L5hERAsVe1olhuW6lhR3Vm4us6kjAcxV+nbkcS6Kt190gJbPba
	4/0v0TJu6SqnuuBd59RqIg9c+wixWrW3b4dZfUQZ97GmV0cHv0qcwUxn1i20/hdFvM7O5l/mPz2
	7tRJVhYcWbThDIS2Ir1FOSaA8dLoL0iVLo4lWReesTqH3kVBxA32jfnqRn
X-Received: by 2002:a17:903:3c6e:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2c1e7e58e77mr103638045ad.9.1780732947775;
        Sat, 06 Jun 2026 01:02:27 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:eafa:a84d:d4c0:cda7:baa6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm120818145ad.27.2026.06.06.01.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 01:02:27 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	krishna.chomal108@gmail.com,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v9 2/3] platform/x86: hp-wmi: Drive fan control from board data
Date: Sat,  6 Jun 2026 13:31:55 +0530
Message-ID: <20260606080204.724444-3-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606080204.724444-1-radheykalra901@gmail.com>
References: <20260606080204.724444-1-radheykalra901@gmail.com>
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
