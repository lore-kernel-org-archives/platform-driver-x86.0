Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F38372067
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 19:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778701190; cv=none; b=AUSZbx2prB83udKlb4pFb4TQq+KAmTkJDkLDcuE7n7EGprOyuB7vplEo1jrtVWVFGjd/aPqXrAvlrMJVCC3nCrNSwUJ0+JIEwzbI8frEwblYVWjRqG0z/b8xRRPWPjznzdIvnpsoKy/rPbOq/O3Xi3dWiDDAA6v07uGTtYonuhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778701190; c=relaxed/simple;
	bh=2LpbpK+U2F8gSPVy0ZsEE6DeZc0jwJ/UVGwHbr2t1Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RlrS3pfbEpQ84Ed2IR4hPEpBO7Z6zyD+EtsPLZMCDGUazkGXc4pj1p5BaSszXrfjlEY7/m77ag/QZg50bfUoN0mQF+p5jIQhG0Fm4LCgWVg9eCLZWxKPFNG1E7fsdHQ3XvgXSn1HMWNFBKkzRkK3c/NlMNX1vXoaSVRqdgAy/GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zld/bdEc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zld/bdEc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-366139223e4so4453796a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 12:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778701188; x=1779305988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VWaQJbUL9pRHD+HAski7/KKQkSw7u7kU3PLj+7Qq6o=;
        b=Zld/bdEcdkuTfJMlo6PjN297Sdl66NqeP4NDG2zEEHEg4xiFVNeEMjW96cvRuAOTV/
         HvfzXZk5lgD1smQv4zjYBI/BxF6a/GZ7GLhlwEZOYsE0G2Thh2MqVqRLo9pveNlWiyV/
         3yl+hHjxzB/RpvEZn4OPK0DKaRIDdGzvWmsPXeX6dESwk+ebkw2BK07j6BabQjU86ufr
         QwI0n1mUaSGjDLOFkCjry1nZ69Epmf49u3fyH0J+oUBgd37zCjkGR3RrWQCIHzloeFoI
         siJSG9Ibfj69ojg74QtAJM0NDcW9+MwaEN4fQjKcsZkFXSaRgLwjsIg5PitTtc67RbO/
         mTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778701188; x=1779305988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VWaQJbUL9pRHD+HAski7/KKQkSw7u7kU3PLj+7Qq6o=;
        b=H5UHZG0DGRYEdaoXOf3mW1pErop+h+TcU6PlJDptF3IIBTU/6wK7S6r0SWxbtdaSk8
         rIsCryhX4+Dlx6K8J3A7YVX0vpkkdTYTV7CpVax4gdhfmcxQ/fY0eBijJ3O5H2uv4m8X
         imR8iTuLv1hFHIr2jMyBVDQA7TGon05gDw02KoQqVwtUBSbGJPqKkcXJvmX/oS6lJqk2
         mtIal1czEFUE+JEhyjxe6BXw3n5BB48DjYkYptRT5kpnViTMaQwG5vfLotHmfWumIrAj
         LMvaSzEY2mAWJBaMUguy0n9DHf+uoox0ypeT1Jd8BKHB8z01iicPG8VSOliGK2vuad7f
         8mdg==
X-Gm-Message-State: AOJu0YyWwh+EWopT8agyIqLRqLzwX+QMAJ9lYdY9AtmiCpkAfntC4aaX
	v+Fq5OHGaU5kvNvYgg55Lp1IEg64aZaWTfBtuYAZOp7AXPSUQj9CnC7D
X-Gm-Gg: Acq92OFVD1rKRrPFtUrn1VF7jBOjnNEZHyhieyVP2e+0kigHCffw5TSwKBxmxV2t0kB
	OSt8hK+bD9ZfrMkAYzZgnaTQgNpdf2V1FJMkObPSrPDhJ3d+6K1VHIxwojOwZOogZN6fHAHnGjq
	otCrAIO74bLJ3oGHsx8r0bOwlvQZ8L8NhmZ3RykUZQPBySjxzydBzzSdnLVIivEXF8+IRuzACjk
	4o+sjmBVxvEdYYpuS9GlhoxjqpaXc0flEsQuSmo02tLOD6fgXEDTaK+jPa7xix8eX2b+kfgjzZZ
	QUevowYwEcOQKEvhpJec76tKEkyFtAzvm9/vAVzck/twvfsG+zRrZCvOx1xFZg9gBNjVIEoeeP9
	Zw+gTNPUHKj6bHAX1OpHhlAWKG8uV9LNiNQuDODDhoI8cl51nOz4rX221LNS7CdUKaX22ty+wK8
	js5HbrfQdkuf2edXKlP64m2Yq5b1WEijvvLH27lAFY/RbquPvE0jY=
X-Received: by 2002:a17:90b:4f92:b0:368:f179:ba07 with SMTP id 98e67ed59e1d1-368f3aa9f3cmr5029819a91.9.1778701187661;
        Wed, 13 May 2026 12:39:47 -0700 (PDT)
Received: from cachyos.lan ([2607:fb90:b200:b454:58a0:7e4d:a0a:684b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11d659sm230595ad.73.2026.05.13.12.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 12:39:47 -0700 (PDT)
From: foobisdweik <dweikmferris@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	foobisdweik <dweikmferris@gmail.com>
Subject: [PATCH 2/2] platform/x86: hp-wmi: Expose independent CPU/GPU pwm channels
Date: Wed, 13 May 2026 12:39:16 -0700
Message-ID: <20260513193916.84673-3-dweikmferris@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513193916.84673-1-dweikmferris@gmail.com>
References: <20260513193916.84673-1-dweikmferris@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Victus-S WMI fan-speed-set query (HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY,
GM2E in firmware) takes a two-byte buffer [cpu, gpu] and writes the
values to EC SRP1/SRP2 setpoints independently. The driver however drove
both fans from a single hwmon pwm1 attribute, with the GPU value
derived as cpu + priv->gpu_delta from the fan table. This makes
asymmetric fan curves (common ask: GPU fan louder than CPU under
heavy gaming load) impossible from userspace fan-control tools that
expect one pwm attribute per fan.

Promote priv->pwm to a two-element array, add a second pwm hwmon
channel, and extend hp_wmi_hwmon_write() / hp_wmi_apply_fan_settings()
to drive the per-channel setpoints through GM2E.

The U8_MAX sentinel in hp_wmi_fan_speed_set() selects the new
per-fan path; existing callers using HP_FAN_SPEED_AUTOMATIC or a
direct rpm value keep their behavior. The second pwm channel is only
visible on Victus-S-capable boards, since other HP laptops still use
the legacy single-fan WMI commands.

Tested on OMEN by HP Laptop 16-b1xxx (8A13): writing pwm1=60, pwm2=200
in manual mode drives CPU fan to ~1600 RPM and GPU fan to ~5700 RPM
simultaneously, verified via fan1_input/fan2_input tachs and direct
read of EC offsets 0xB0..0xB3.

Signed-off-by: foobisdweik <dweikmferris@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 45 +++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 389506a6d2e3..40eb3715583a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -486,7 +486,7 @@ struct hp_wmi_hwmon_priv {
 	u8 max_rpm;
 	int gpu_delta;
 	u8 mode;
-	u8 pwm;
+	u8 pwm[2];
 	struct delayed_work keep_alive_dwork;
 };
 
@@ -822,12 +822,18 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed)
 	fan_speed[GPU_FAN] = speed;
 
 	/*
-	 * GPU fan speed is always a little higher than CPU fan speed, we fetch
-	 * this delta value from the fan table during hwmon init.
-	 * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to revert to
-	 * automatic mode.
+	 * Pass-through value U8_MAX: drive each fan from its own
+	 * priv->pwm[] setpoint converted via pwm_to_rpm(). Used by the
+	 * hwmon pwm1/pwm2 path that allows independent CPU/GPU fan control.
+	 *
+	 * Otherwise: GPU fan speed is always a little higher than CPU fan
+	 * speed; we fetch this delta from the fan table during hwmon init.
+	 * Exception: HP_FAN_SPEED_AUTOMATIC reverts to automatic mode.
 	 */
-	if (speed != HP_FAN_SPEED_AUTOMATIC) {
+	if (speed == U8_MAX) {
+		fan_speed[CPU_FAN] = pwm_to_rpm(priv->pwm[CPU_FAN], priv);
+		fan_speed[GPU_FAN] = pwm_to_rpm(priv->pwm[GPU_FAN], priv);
+	} else if (speed != HP_FAN_SPEED_AUTOMATIC) {
 		gpu_speed = speed + priv->gpu_delta;
 		fan_speed[GPU_FAN] = clamp_val(gpu_speed, 0, U8_MAX);
 	}
@@ -2398,7 +2404,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 	case PWM_MODE_MANUAL:
 		if (!is_victus_s_thermal_profile())
 			return -EOPNOTSUPP;
-		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
+		ret = hp_wmi_fan_speed_set(priv, U8_MAX);
 		if (ret < 0)
 			return ret;
 		mod_delayed_work(system_wq, &priv->keep_alive_dwork,
@@ -2429,6 +2435,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
 {
 	switch (type) {
 	case hwmon_pwm:
+		/*
+		 * Second pwm channel only exists on Victus-S-style boards
+		 * which expose an independent GPU fan setpoint.
+		 */
+		if (channel == 1 && !is_victus_s_thermal_profile())
+			return 0;
 		if (attr == hwmon_pwm_input && !is_victus_s_thermal_profile())
 			return 0;
 		return 0644;
@@ -2514,7 +2526,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			/* ensure PWM input is within valid fan speeds */
 			rpm = pwm_to_rpm(val, priv);
 			rpm = clamp_val(rpm, priv->min_rpm, priv->max_rpm);
-			priv->pwm = rpm_to_pwm(rpm, priv);
+			priv->pwm[channel] = rpm_to_pwm(rpm, priv);
 			return hp_wmi_apply_fan_settings(priv);
 		}
 		switch (val) {
@@ -2525,13 +2537,18 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			if (!is_victus_s_thermal_profile())
 				return -EOPNOTSUPP;
 			/*
-			 * When switching to manual mode, set fan speed to
-			 * current RPM values to ensure a smooth transition.
+			 * When switching to manual mode, seed each per-fan
+			 * setpoint from its current measured RPM so the
+			 * transition is smooth.
 			 */
-			rpm = hp_wmi_get_fan_speed_victus_s(channel);
+			rpm = hp_wmi_get_fan_speed_victus_s(CPU_FAN);
+			if (rpm < 0)
+				return rpm;
+			priv->pwm[CPU_FAN] = rpm_to_pwm(rpm / 100, priv);
+			rpm = hp_wmi_get_fan_speed_victus_s(GPU_FAN);
 			if (rpm < 0)
 				return rpm;
-			priv->pwm = rpm_to_pwm(rpm / 100, priv);
+			priv->pwm[GPU_FAN] = rpm_to_pwm(rpm / 100, priv);
 			priv->mode = PWM_MODE_MANUAL;
 			return hp_wmi_apply_fan_settings(priv);
 		case PWM_MODE_AUTO:
@@ -2547,7 +2564,9 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 
 static const struct hwmon_channel_info * const info[] = {
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_ENABLE | HWMON_PWM_INPUT,
+			   HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
 	NULL
 };
 
-- 
2.54.0

