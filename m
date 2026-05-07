Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5013D6CB2
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148846; cv=none; b=tJlk7whjX41c0/5PVy0ZGsBE54n8DVY32YNnmhhoUMxemgXVpuf40tJNwT56OM21GnLp8rgb74HaxM5DdxPcdlfjbytuoOV9mZxn+ldWsZ0w1L0Q1dx9iHqvnoUFY1tc0qZSpy6zt10KHsK3L5tSENdsHTjUsWK+9gsoVki254Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148846; c=relaxed/simple;
	bh=uDNH5NMJmFlQ7DL5cKzf+qix4sa9vwoM1yThyGDxZug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HaKrV1qMGBK20Yu25qM3YixpmUX2w5+yS6VeEaTHow5QbzOIZKMIe19z1uRkg5M9O/9rwKdCX68uDkveBiAXXJsBTBJfX5wx6a8AnzptfSUz47BBfjbQ0Ti8TaBkZC8NjPfR9dO/Q2Ilsz4kz0PFeKf+DL+ugnoYAdLQvn+6bew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfTo/egP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfTo/egP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82faf871346so380545b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778148842; x=1778753642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5DBijUMyTqXBKNXh2A+r9K16+ccxw9L4uCbWgLNEwvs=;
        b=BfTo/egPglOw52Hj9yPY1M+T0/UY94v0DKvJE1RFwI8qmU1ElLUkpWwtnaY+J7iqsL
         4uI8H/cmZAG5bZ8aXCv8zTtDllg5ZleTqgW9ese0Qw4BxEiD9Lxq/RpJkG6/Vpr8DV3N
         UdTXpSJBcSha1BN/NpIAelShhTAiEuGDfsXb5Lp5oMmAHM8b2HuQdv7uDSVvGbEgr1YG
         +6cB4tXXZXrRKD8s4EpqBlnxgy+1DZZmQqnZQPFgbglbHzWYDQBPTAGSKzlJ8a8bMNnD
         L0smyT35cJQSx727Ha+R3tOfcYB3qyAaeJhO23+nCQVrQ60xx7f66QSUqsFYxy0tBRKH
         OgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148842; x=1778753642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DBijUMyTqXBKNXh2A+r9K16+ccxw9L4uCbWgLNEwvs=;
        b=VJX2znLDTwMHZM4pXub4Ainlr1+70VU3gaWa+1oHBn9iNZ71Bt1Qj4moqK2DJIECre
         sU3FMJp2BLjuc2SDQsG5WmHUoJyGd/Z7JNXaKMdgjQdVRotYzwg+gFDVxxsOFTKftmJV
         9JW362TitqYC3PqIF5ugxC4KlfjiP97yMmtGNT7wgdMDxUcKPuH3wfBBG4JX88EXXtQl
         skYBWRdZzYlKsXJbuSntRmfwMekFbrOqF/bjKBczfICOCfaXW65+zpjqGHtTN0d4rOeY
         7KEzslLWWK+46e6NOC5mfUJV1IBQUtx1TVW3ZQjvuBwIjo3moRrjrohPvk2nx/CxluxI
         27xg==
X-Gm-Message-State: AOJu0Yzn/8sBCep4Rec+lxIfD7H4tBFjXGft3xb7WFrgXLQaFoeMLIYH
	uostUakYhygaF4xjdU8CeDO5FkKY/C2+UHw0DYPN+afv88JQL6XvtCIESa7TOqA1vz4=
X-Gm-Gg: AeBDieuj17LS9GMordW1xM1XFtRPu90NFEmbMbyMFYAA205b3VYlk7g5k2DQ4EB9gxA
	Cwq0Eco+z0TjwP0T5I65cyLNHTZygK1fz5nN4nPJs8pMsTLaAC8I+0SXiKgqebYrRs2NS6D83lc
	Gbnhyf2PEaS7UfmIn5fjdB2ouvSwr3CKv80HYpsY39Af5LTT5dzDaZfX/e2T7/EsTqn3cjG+u59
	+GguxqabfDaPuFTjnF3IYK+oq8t/JWfZ07eVRxoG5yOGA+axfnROknJ8g9qeILLgYRMfAzqNAgo
	ilk1SZrJK6hTQ1O/9N6p5/elnFRsU/V9bJywSYdEWdK9ofcNwWzdYrmHcWHtCGBSn9Y4CwOz1An
	wTocZkYuflf1XCElnoPH+q8lR41m6IzsIkW/5S5SlaNDcld/W86jj/caVmtJJVQA1ZmBqWsNW1O
	FDdftCgW3vZdxbZ1tqDg/rcvfxzuIz
X-Received: by 2002:a05:6a20:2594:b0:399:b194:5d7c with SMTP id adf61e73a8af0-3aa5a947e59mr7903039637.24.1778148841675;
        Thu, 07 May 2026 03:14:01 -0700 (PDT)
Received: from pico-cachyos ([2a09:bac5:3e0b:1aa0::2a7:6e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b34f5esm1801829a12.21.2026.05.07.03.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:14:01 -0700 (PDT)
From: jR4dh3y <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	jR4dh3y <radheykalra901@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
Date: Thu,  7 May 2026 15:43:44 +0530
Message-ID: <20260507101347.27972-1-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Victus 15-fb0xxx board 8A3D supports the same WMI fan speed
set command used by the Victus manual fan control path, but it is
not a Victus S thermal-profile board.

Enable the hwmon PWM manual fan interface for this board without
adding it to the Victus S thermal profile DMI table. This preserves
the existing generic platform-profile choices on this machine.

The board does not expose a Victus S fan table, so use the RPM limits
validated on hardware: CPU fan 2600-5800 RPM, GPU fan about 300 RPM
higher.

Compile-tested against 7.0.3-1-cachyos-bore-lto. The WMI fan-speed
set path was validated on a Victus by HP Gaming Laptop 15-fb0xxx with
board 8A3D and BIOS F.22.

Signed-off-by: jR4dh3y <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 56 +++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac..b2a6d50 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -204,6 +204,11 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 	{},
 };
 
+/* DMI Board names of Victus laptops with the Victus fan-control WMI calls. */
+static const char * const victus_fan_control_boards[] = {
+	"8A3D", /* Victus by HP Gaming Laptop 15-fb0xxx */
+};
+
 static bool is_victus_s_board;
 
 enum hp_wmi_radio {
@@ -1715,6 +1720,22 @@ static bool is_victus_s_thermal_profile(void)
 	return is_victus_s_board;
 }
 
+static bool is_victus_fan_control(void)
+{
+	const char *board_name;
+
+	if (is_victus_s_thermal_profile())
+		return true;
+
+	board_name = dmi_get_system_info(DMI_BOARD_NAME);
+	if (!board_name)
+		return false;
+
+	return match_string(victus_fan_control_boards,
+			    ARRAY_SIZE(victus_fan_control_boards),
+			    board_name) >= 0;
+}
+
 static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
 					    bool *ppab_enable,
 					    u8 *dstate,
@@ -2324,7 +2345,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	switch (priv->mode) {
 	case PWM_MODE_MAX:
-		if (is_victus_s_thermal_profile())
+		if (is_victus_fan_control())
 			hp_wmi_get_fan_count_userdefine_trigger();
 		ret = hp_wmi_fan_speed_max_set(1);
 		if (ret < 0)
@@ -2333,7 +2354,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_MANUAL:
-		if (!is_victus_s_thermal_profile())
+		if (!is_victus_fan_control())
 			return -EOPNOTSUPP;
 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
 		if (ret < 0)
@@ -2342,7 +2363,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
 		return 0;
 	case PWM_MODE_AUTO:
-		if (is_victus_s_thermal_profile()) {
+		if (is_victus_fan_control()) {
 			hp_wmi_get_fan_count_userdefine_trigger();
 			ret = hp_wmi_fan_speed_max_reset(priv);
 		} else {
@@ -2366,7 +2387,7 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
 {
 	switch (type) {
 	case hwmon_pwm:
-		if (attr == hwmon_pwm_input && !is_victus_s_thermal_profile())
+		if (attr == hwmon_pwm_input && !is_victus_fan_control())
 			return 0;
 		return 0644;
 	case hwmon_fan:
@@ -2404,10 +2425,13 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 		return 0;
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
-			if (!is_victus_s_thermal_profile())
+			if (!is_victus_fan_control())
 				return -EOPNOTSUPP;
 
-			rpm = hp_wmi_get_fan_speed_victus_s(channel);
+			if (is_victus_s_thermal_profile())
+				rpm = hp_wmi_get_fan_speed_victus_s(channel);
+			else
+				rpm = hp_wmi_get_fan_speed(channel);
 			if (rpm < 0)
 				return rpm;
 			*val = rpm_to_pwm(rpm / 100, priv);
@@ -2438,7 +2462,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 	switch (type) {
 	case hwmon_pwm:
 		if (attr == hwmon_pwm_input) {
-			if (!is_victus_s_thermal_profile())
+			if (!is_victus_fan_control())
 				return -EOPNOTSUPP;
 			/* PWM input is invalid when not in manual mode */
 			if (priv->mode != PWM_MODE_MANUAL)
@@ -2455,13 +2479,16 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			priv->mode = PWM_MODE_MAX;
 			return hp_wmi_apply_fan_settings(priv);
 		case PWM_MODE_MANUAL:
-			if (!is_victus_s_thermal_profile())
+			if (!is_victus_fan_control())
 				return -EOPNOTSUPP;
 			/*
 			 * When switching to manual mode, set fan speed to
 			 * current RPM values to ensure a smooth transition.
 			 */
-			rpm = hp_wmi_get_fan_speed_victus_s(channel);
+			if (is_victus_s_thermal_profile())
+				rpm = hp_wmi_get_fan_speed_victus_s(channel);
+			else
+				rpm = hp_wmi_get_fan_speed(channel);
 			if (rpm < 0)
 				return rpm;
 			priv->pwm = rpm_to_pwm(rpm / 100, priv);
@@ -2519,9 +2546,16 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	/* Default behaviour on hwmon init is automatic mode */
 	priv->mode = PWM_MODE_AUTO;
 
-	/* Bypass all non-Victus S devices */
-	if (!is_victus_s_thermal_profile())
+	/* Bypass devices without the Victus fan-control WMI calls. */
+	if (!is_victus_fan_control())
+		return 0;
+
+	if (!is_victus_s_thermal_profile()) {
+		priv->min_rpm = 26;
+		priv->max_rpm = 58;
+		priv->gpu_delta = 3;
 		return 0;
+	}
 
 	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
 				   HPWMI_GM, &fan_data, 4, sizeof(fan_data));
-- 
2.54.0

