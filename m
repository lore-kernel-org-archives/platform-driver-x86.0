Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE427242D70
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 16:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246133; cv=none; b=jyE/qzgG9B6v3KwmBLc6g68iWrcxnw4pQWxk5grTrki00gcezSWhfSgwf2tIihoDhyDOEZ2f09kVbO8wP08SKb8dmhTFHTEhZ7k0fvzdR1NeisdkaG+x9KWeS9BMt05BAzeSZbfbV4pTwn3RMNcqIymUbH24h8dlAgFdUEiv4NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246133; c=relaxed/simple;
	bh=RBD6dZEyzHXEQ98hulSk12tbWBBGHL4Wyth4zM6GCfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVYl0kSWORIGDwamKCJ4sBhFIKleb4dZIfQZz8xSKS2feGL8nH8ARTEyU3hjXl+VujJLtQ2f1hbmjjMRyV3td8oWRT/zPbAc++vseLfzM4NC57W1RW8Tx+EXCouqJENIhK4njS4pzdGPJh1lwxqXaaxSp7F+3Rb12BcDSJbip+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngrwRJs0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngrwRJs0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c3184c71so3983355ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 09:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246131; x=1780850931; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h5EsNIM9jSww++x6RXli6lgxyv28YwZiA9e1r4poF68=;
        b=ngrwRJs07saGCGzA49AkkfsA/982XeRdWw8AYtXsRReSt5NDuynIB1Aer/6lsHzlCh
         hkIhKLKf2YqmqF1C6a906YzDUUEtmHBbU+CE9m5hWoMvbRDUhNe9ygQCaaBdbV69Yoiq
         bn8Bph/eldmbnwR4GY5iznQS9tn6Iek4f2MDJQWgLbP2cSBw7sTRzsIYb+LMcXnY7EvQ
         CIDYpjjDNdNwYhaom4uEoM98BXxxp/z1CVrmvfaXPrGE4B4C2NaiEHgRMTSnHurB697D
         HXsKuRCDSY8Opzu9qF8AVeWo2yff84TgGYqSJhL5rHI904Mde+leTGapZLXQeu0qRACm
         hRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246131; x=1780850931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5EsNIM9jSww++x6RXli6lgxyv28YwZiA9e1r4poF68=;
        b=jyHf835BYd981CmgDsznWNvB7onOVTBhLBtMR1s1doPmPK0sXS8xtSISbJciKQOQXj
         6RWCzed7SckWLN+DScdSdwLT6eJKhWh3dPqKw8F8WFqzMIuJau2R+XZ1Cdv9fF9N8av7
         3TYrtcEuG42fL/fQEOdVbMNEWBR9MuhPAogWChHNa6Eo1SRt1O+iPm7Q2IhNwOSVBNTH
         /R0n4XKmKnZ9ZGElNmMUhlx8hAd9El7YFLPSlDb7NWb5KRG5TID+63xUjNrGHuAgJ6zO
         qVA6hdJrBYpVVWVDf3V6SfQPzPGxGzaqXh1/rr2huGeOrVSj7zyLiCL9dPBQm/eITMAr
         HjfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FzPHdXChxGCSAoMX/xXD8rPwbEmIwBA690x7plBusgcJf895VWMjyA84cf5/6H82Zw1xacOjqxRar2XsswOmf5ci8@vger.kernel.org
X-Gm-Message-State: AOJu0YwZCFU5sLLB25o7O3MR+OT26nUQ0ahA8d7v3uYkx1CrVnwGgYyx
	UkY8MDJaHsfg9tE6Cm7HWQFhe+fnFvWEYRtYazy68+gUH/Szq8jZALYU
X-Gm-Gg: Acq92OH+V6AarMG991L/WXSOCg0MU2uO+V6Kd9NrUkz93ScNuUisfil0Xa/aQ0Z7QvV
	CkWBBO7C62jrdgtd9rYPdAMACtK2oudwjZN+TjOL9qhdeq20OAIbCjdf+XH26PW6U49cZYep3Zk
	Zsxd9oXm3IPimUvp6853NnV5lUFj8kqjZN2xaDUdTkUyu1TBCA8+Uup8D/f9JdBJzpguGmCn6gI
	oN70XsBMfwzTthmKDs14/ntgS16/+N0Vhk+SvPKHGIOFGr211gxTVPYb/Zk9PtIlMEYlRY/mWWI
	ddmYqQ5jixByKtG3RFnyP5MUG3ClTsgK+Mm8+x37QKKXuDlz7zXZgsk8o4E2gWMaUOAXh7SfOqo
	Ce4MkAo8lmbDGo6ICPkt3ooWoyohJNwCEI2kYLc7HSTh8Tq/lFsN/nIaHhHSmwtgVwqHSKl0U2H
	8X/vBO6UcSBcWMXjpBiAFjyEFvAfkGFqTwAN6A/UJKVSZXfoXI00kMiMFeeQBmtA9h6vR1U233s
	fZXjGq/dL3gqtsuY+A8/MB2MblCPNc=
X-Received: by 2002:a17:903:2ecd:b0:2bf:172d:ef7e with SMTP id d9443c01a7336-2bf36861af0mr94029325ad.34.1780246130948;
        Sun, 31 May 2026 09:48:50 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:36f2:f474:be1d:cad7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e702fsm80440415ad.4.2026.05.31.09.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 09:48:50 -0700 (PDT)
Date: Sun, 31 May 2026 22:18:37 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: =?utf-8?B?S8O8csWfYXQgQWJheWzEsQ==?= <hello@kursatabayli.dev>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, emreleno@gmail.com, 
	edip@medip.dev, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: hp-wmi: Add dual-channel PWM fan
 control for Victus S
Message-ID: <ahxiemWgoiKqOFv7@archlinux>
References: <20260531092326.20938-1-hello@kursatabayli.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260531092326.20938-1-hello@kursatabayli.dev>

On Sun, May 31, 2026 at 12:23:26PM +0300, Kürşat Abaylı wrote:
>Currently, manual fan control on supported Victus S models uses a single
>PWM value for both CPU and GPU fans, linking their speeds via a hardcoded
>gpu_delta offset. This prevents userspace tools from managing the thermal
>profiles of the CPU and GPU independently.
>
>Refactor the hwmon implementation to support independent dual-channel
>PWM control:
>- Split the single 'pwm' state into 'cpu_pwm' and 'gpu_pwm'.
>- Expose a second PWM channel ('pwm2') to userspace via hwmon_channel_info.
>- Remove the gpu_delta mechanism entirely.
>
>The 'pwm1_enable' mode remains shared, as the underlying hardware does
>not support per-fan modes. When switching to manual mode, both fans are
>smoothly initialized to their current RPMs. Additionally, ensure that
>the HP_FAN_SPEED_AUTOMATIC flag is isolated from rpm_to_pwm mathematical
>interpolations during mode resets to prevent unintended fan states.
>
>Tested on: HP Victus 16-s0xxx
>
>Signed-off-by: Kürşat Abaylı <hello@kursatabayli.dev>
>---
>Changes in v2:
>- Made RPM readings atomic during the transition to manual mode.
>- Fixed a variable scoping issue in the pwm_input block.
>---
> drivers/platform/x86/hp/hp-wmi.c | 57 ++++++++++++++++----------------
> 1 file changed, 28 insertions(+), 29 deletions(-)
>
>diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>index f63bc00d9a9b..51611dd2220f 100644
>--- a/drivers/platform/x86/hp/hp-wmi.c
>+++ b/drivers/platform/x86/hp/hp-wmi.c
>@@ -488,9 +488,9 @@ struct hp_wmi_hwmon_priv {
> 	struct mutex lock;	/* protects mode, pwm */
> 	u8 min_rpm;
> 	u8 max_rpm;
>-	int gpu_delta;
> 	u8 mode;
>-	u8 pwm;
>+	u8 cpu_pwm;
>+	u8 gpu_pwm;
> 	struct delayed_work keep_alive_dwork;
> };
>
>@@ -817,24 +817,15 @@ static int hp_wmi_fan_speed_max_set(int enabled)
> 	return enabled;
> }
>
>-static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed)
>+static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv)
> {
> 	u8 fan_speed[2];
>-	int gpu_speed, ret;
>-
>-	fan_speed[CPU_FAN] = speed;
>-	fan_speed[GPU_FAN] = speed;
>+	int ret;
>
>-	/*
>-	 * GPU fan speed is always a little higher than CPU fan speed, we fetch
>-	 * this delta value from the fan table during hwmon init.
>-	 * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to revert to
>-	 * automatic mode.
>-	 */
>-	if (speed != HP_FAN_SPEED_AUTOMATIC) {
>-		gpu_speed = speed + priv->gpu_delta;
>-		fan_speed[GPU_FAN] = clamp_val(gpu_speed, 0, U8_MAX);
>-	}
>+	fan_speed[CPU_FAN] = (priv->cpu_pwm == HP_FAN_SPEED_AUTOMATIC) ?
>+	HP_FAN_SPEED_AUTOMATIC : pwm_to_rpm(priv->cpu_pwm, priv);
>+	fan_speed[GPU_FAN] = (priv->gpu_pwm == HP_FAN_SPEED_AUTOMATIC) ?
>+	HP_FAN_SPEED_AUTOMATIC : pwm_to_rpm(priv->gpu_pwm, priv);

These ternary expressions are a bit hard to read with the line
wrappings. Let's expand them into standard if-else blocks for better
readability.

>
> 	ret = hp_wmi_get_fan_count_userdefine_trigger();
> 	if (ret < 0)
>@@ -851,7 +842,9 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed)
>
> static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *priv)
> {
>-	return hp_wmi_fan_speed_set(priv, HP_FAN_SPEED_AUTOMATIC);
>+	priv->cpu_pwm = HP_FAN_SPEED_AUTOMATIC;
>+	priv->gpu_pwm = HP_FAN_SPEED_AUTOMATIC;
>+	return hp_wmi_fan_speed_set(priv);
> }
>
> static int hp_wmi_fan_speed_max_reset(struct hp_wmi_hwmon_priv *priv)
>@@ -2402,7 +2395,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
> 	case PWM_MODE_MANUAL:
> 		if (!is_victus_s_thermal_profile())
> 			return -EOPNOTSUPP;
>-		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
>+		ret = hp_wmi_fan_speed_set(priv);
> 		if (ret < 0)
> 			return ret;
> 		mod_delayed_work(system_wq, &priv->keep_alive_dwork,
>@@ -2502,13 +2495,14 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> 			      u32 attr, int channel, long val)
> {
> 	struct hp_wmi_hwmon_priv *priv;
>-	int rpm;
>+	int cpu_rpm, gpu_rpm;
>
> 	priv = dev_get_drvdata(dev);
> 	guard(mutex)(&priv->lock);
> 	switch (type) {
> 	case hwmon_pwm:
> 		if (attr == hwmon_pwm_input) {
>+			int rpm;
> 			if (!is_victus_s_thermal_profile())
> 				return -EOPNOTSUPP;
> 			/* PWM input is invalid when not in manual mode */
>@@ -2518,7 +2512,10 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> 			/* ensure PWM input is within valid fan speeds */
> 			rpm = pwm_to_rpm(val, priv);
> 			rpm = clamp_val(rpm, priv->min_rpm, priv->max_rpm);
>-			priv->pwm = rpm_to_pwm(rpm, priv);
>+			if (channel == 0)
>+				priv->cpu_pwm = rpm_to_pwm(rpm, priv);
>+			else
>+				priv->gpu_pwm = rpm_to_pwm(rpm, priv);

Please use the CPU_FAN and GPU_FAN macros here instead of hardcoding 0
or 1. It makes the channel mapping more explicit.

> 			return hp_wmi_apply_fan_settings(priv);
> 		}
> 		switch (val) {
>@@ -2532,10 +2529,14 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> 			 * When switching to manual mode, set fan speed to
> 			 * current RPM values to ensure a smooth transition.
> 			 */
>-			rpm = hp_wmi_get_fan_speed_victus_s(channel);
>-			if (rpm < 0)
>-				return rpm;
>-			priv->pwm = rpm_to_pwm(rpm / 100, priv);
>+			cpu_rpm = hp_wmi_get_fan_speed_victus_s(CPU_FAN);
>+			if (cpu_rpm < 0)
>+				return cpu_rpm;
>+			gpu_rpm = hp_wmi_get_fan_speed_victus_s(GPU_FAN);
>+			if (gpu_rpm < 0)
>+				return gpu_rpm;
>+			priv->cpu_pwm = rpm_to_pwm(cpu_rpm / 100, priv);
>+			priv->gpu_pwm = rpm_to_pwm(gpu_rpm / 100, priv);
> 			priv->mode = PWM_MODE_MANUAL;
> 			return hp_wmi_apply_fan_settings(priv);
> 		case PWM_MODE_AUTO:
>@@ -2551,7 +2552,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>
> static const struct hwmon_channel_info * const info[] = {
> 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
>-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
>+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT, HWMON_PWM_INPUT),
> 	NULL
> };
>
>@@ -2592,7 +2593,7 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
> 	struct victus_s_fan_table *fan_table;
> 	u8 min_rpm, max_rpm;
> 	u8 cpu_rpm, gpu_rpm, noise_db;
>-	int gpu_delta, i, num_entries, ret;
>+	int i, num_entries, ret;
> 	size_t header_size, entry_size;
>
> 	/* Default behaviour on hwmon init is automatic mode */
>@@ -2638,10 +2639,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
> 	if (min_rpm == U8_MAX || max_rpm == 0)
> 		return -EINVAL;
>
>-	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
> 	priv->min_rpm = min_rpm;
> 	priv->max_rpm = max_rpm;
>-	priv->gpu_delta = gpu_delta;
>
> 	return 0;
> }
>-- 
>2.54.0
>
