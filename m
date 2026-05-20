Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C6536A370
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272482; cv=none; b=ihL8e7xNhUQqPnHKvGBrWEiQcQ3EWcBgN/noZws3M4SD8jg3Fg6/+yQP7zKmz9apvCeO/W+s1/4krFtqzvrbJWGzDuQkeY5+wrxfJtlIvdTKSmd1tCS/u1hC37+liUlwyxH7/4836WMwc2aoSEmi3+7Dvl+v4pDZXd5dP+xWb9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272482; c=relaxed/simple;
	bh=2FMOcR6JfTuw8Vq4YJAeYGTgqH7XoUOVE9FZUbr5Mas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEP4X478O0H3XOBWzHYAhnWU9brXyp1OtAaa64LcIYqmzOEa/PhxoF/rtVkNisSD+kjb4xcgRBXbv3S2IKnTrmrxtGGAjmefdL/YHbjX/0agB5blyPp0PXq8PP2VlvGp+70vmwpYp6MCjZx9GWVfUHOVennCLI4yeJWXteqTjDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJ/g5wEo; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJ/g5wEo"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so2439992a91.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779272479; x=1779877279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KPqLRcXHSDXYbacK9Af3pl+uowBsWOkNsTTCiwv4b3c=;
        b=YJ/g5wEo4zvJNVhpYSzw93+zlhSBta8kK1bbedu4X1OF+rE4TodYGo+l4PQU/iDrIM
         SPJZqOTn3PeOs0uCMMkp9etIOFx8bmlWzvS80ydoyt5fT93HSonibhF/MNyPdWnfw+cP
         VdlDp8gzBM4a7ZeKHg4/lZYOfzsIKVSb+tN+1m7PnM0ARxPOp8BkaWoA9slUew2bMrb7
         OjQSgnoNuZQDSLaVelkMM1d9C+wY/tYg4i3s5EcPuXfCdEVBw8xyKrBodTBfK6CU18NG
         9OygxgabEmr6GLFki78GXv7UZQ1eDXxtUvuNmIn/Dni0qi6njEIzEHN5VRmx5Ro44MyV
         bPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779272479; x=1779877279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPqLRcXHSDXYbacK9Af3pl+uowBsWOkNsTTCiwv4b3c=;
        b=Fbts8jVsb7A0NnM5QnIN3VDEUuclEkESK1hfF+VV7frcJUVCBa/Ubgh3qVX5eiBI/K
         vKbXuYM2P0mR6XGCDlKrQoOx0tbDl4tr/mPFBlaDBPzgpuTx3L0GgI9zhnDiBFSKp5W2
         1BdVT5JkxbU80C7h433Ue6QAV5o5/oIVTmfTGm8mGPNqjzn0l+aFdlYa2TlE9vvCCq91
         KKgETuL3npM+kyc3D6fY4sujqOIbIU3y3sjhKxmuEP/2t35CDT8FLGnmFLPQD7LCdpt6
         McO5oD5abNRqtblJf14L/z1xcZ0ABNzvJhUFfOM82Q5LtqiLwpgTsCto1vFa2yLw13Zq
         8/OQ==
X-Forwarded-Encrypted: i=1; AFNElJ97WTV+xJPVyM1p1GQqM4F0C6OBVim0wh/0AGMPdw0lXFqlhXpARbhDnNNFN+3MxvKfEaQ6ZivVpjPZ4Q3vn3Om6yrr@vger.kernel.org
X-Gm-Message-State: AOJu0YxzngEsn+pYNmycr0TfGgA9dVlZaQduu+TFcJWTqSGSIs+KXAMZ
	+kCAk6K3ujcZIn1ja29hCsKZv7kkig46uTw+6G4swhLI/nU7IzzbLmk+
X-Gm-Gg: Acq92OF1s9QCkwbljbG3gTSinNrd+0jRr4FWQom5pANsoc+k2UDtSxGFX+JV4gMcVnp
	m67t49a/1CB7HR+E7BcMq15afyTsI+EhyJ7dpDsOc1CH0BbC5/dIM6hZwF12+wBZVoyPjfrGhIn
	Em/yMy9mKgKLIUjZBCjl59kNwvK6ZpCCfP/LF19KCF8B1gWkAUlyjBuU3xjaRzn2CShXEunSBxB
	20Wwi/m+DSTRb1EcY36426hxkcRUGW6dsH6hYU03YISsKi+kRAarIaqr1W6SdAONjf2pGEOikBJ
	675OplrQKtg7UoLC9CMaxx2mTzBnKUkwCGWZyADOjAx7tN5GPNw/ENwTJhjIzDE1y5EURY5Zflg
	XTKXfQkER6SmNfzg+V3Rx8be/Yst2QfLJ8F76Hx7unee3ZfQX8vdpLko4kamVQSwJTO6mYoGz1W
	DTJyi+l1dBsIbNieR8Pc7I53oe9fTjL6byMTdyMlTBlfHr/nd14+VWw3BUnCnEZyi1U9lWIW4Hx
	71gY2B4u6hqvcKJioKa
X-Received: by 2002:a17:90b:57ee:b0:368:147b:536a with SMTP id 98e67ed59e1d1-36951b97c8cmr24756505a91.14.1779272478654;
        Wed, 20 May 2026 03:21:18 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:36f2:f474:be1d:cad7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369512424b2sm16856582a91.3.2026.05.20.03.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:21:18 -0700 (PDT)
Date: Wed, 20 May 2026 15:51:14 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: foobisdweik <dweikmferris@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: hp-wmi: Expose independent CPU/GPU pwm
 channels
Message-ID: <ag2DCOGyCt7MBUL6@archlinux>
References: <20260513193916.84673-1-dweikmferris@gmail.com>
 <20260513193916.84673-3-dweikmferris@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260513193916.84673-3-dweikmferris@gmail.com>

On Wed, May 13, 2026 at 12:39:16PM -0700, foobisdweik wrote:
>The Victus-S WMI fan-speed-set query (HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY,
>GM2E in firmware) takes a two-byte buffer [cpu, gpu] and writes the
>values to EC SRP1/SRP2 setpoints independently. The driver however drove
>both fans from a single hwmon pwm1 attribute, with the GPU value
>derived as cpu + priv->gpu_delta from the fan table. This makes
>asymmetric fan curves (common ask: GPU fan louder than CPU under
>heavy gaming load) impossible from userspace fan-control tools that
>expect one pwm attribute per fan.
>
>Promote priv->pwm to a two-element array, add a second pwm hwmon
>channel, and extend hp_wmi_hwmon_write() / hp_wmi_apply_fan_settings()
>to drive the per-channel setpoints through GM2E.
>
>The U8_MAX sentinel in hp_wmi_fan_speed_set() selects the new
>per-fan path; existing callers using HP_FAN_SPEED_AUTOMATIC or a
>direct rpm value keep their behavior. The second pwm channel is only
>visible on Victus-S-capable boards, since other HP laptops still use
>the legacy single-fan WMI commands.
>
>Tested on OMEN by HP Laptop 16-b1xxx (8A13): writing pwm1=60, pwm2=200
>in manual mode drives CPU fan to ~1600 RPM and GPU fan to ~5700 RPM
>simultaneously, verified via fan1_input/fan2_input tachs and direct
>read of EC offsets 0xB0..0xB3.
>
>Signed-off-by: foobisdweik <dweikmferris@gmail.com>
>---
> drivers/platform/x86/hp/hp-wmi.c | 45 +++++++++++++++++++++++---------
> 1 file changed, 32 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>index 389506a6d2e3..40eb3715583a 100644
>--- a/drivers/platform/x86/hp/hp-wmi.c
>+++ b/drivers/platform/x86/hp/hp-wmi.c
>@@ -486,7 +486,7 @@ struct hp_wmi_hwmon_priv {
> 	u8 max_rpm;
> 	int gpu_delta;
> 	u8 mode;
>-	u8 pwm;
>+	u8 pwm[2];
> 	struct delayed_work keep_alive_dwork;
> };
>
>@@ -822,12 +822,18 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv, u8 speed)
> 	fan_speed[GPU_FAN] = speed;
>
> 	/*
>-	 * GPU fan speed is always a little higher than CPU fan speed, we fetch
>-	 * this delta value from the fan table during hwmon init.
>-	 * Exception: Speed is set to HP_FAN_SPEED_AUTOMATIC, to revert to
>-	 * automatic mode.
>+	 * Pass-through value U8_MAX: drive each fan from its own
>+	 * priv->pwm[] setpoint converted via pwm_to_rpm(). Used by the
>+	 * hwmon pwm1/pwm2 path that allows independent CPU/GPU fan control.
>+	 *
>+	 * Otherwise: GPU fan speed is always a little higher than CPU fan
>+	 * speed; we fetch this delta from the fan table during hwmon init.
>+	 * Exception: HP_FAN_SPEED_AUTOMATIC reverts to automatic mode.
> 	 */
>-	if (speed != HP_FAN_SPEED_AUTOMATIC) {
>+	if (speed == U8_MAX) {
>+		fan_speed[CPU_FAN] = pwm_to_rpm(priv->pwm[CPU_FAN], priv);
>+		fan_speed[GPU_FAN] = pwm_to_rpm(priv->pwm[GPU_FAN], priv);
>+	} else if (speed != HP_FAN_SPEED_AUTOMATIC) {
> 		gpu_speed = speed + priv->gpu_delta;
> 		fan_speed[GPU_FAN] = clamp_val(gpu_speed, 0, U8_MAX);
> 	}

Currently, there are 2 callers for hp_wmi_fan_speed_set:

1. hp_wmi_fan_speed_reset() -> calls via speed = HP_FAN_SPEED_AUTOMATIC,
    and
2. hp_wmi_apply_fan_settings() -> calls via speed = U8_MAX (as updated
    by you)

So this else-if block is effectively never executed, which in turn means
that gpu_delta is also now redundant.

>@@ -2398,7 +2404,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
> 	case PWM_MODE_MANUAL:
> 		if (!is_victus_s_thermal_profile())
> 			return -EOPNOTSUPP;
>-		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
>+		ret = hp_wmi_fan_speed_set(priv, U8_MAX);

I think you could avoid passing the sentinel argument (speed) and
directly update priv->pwm[] in the caller: hp_wmi_fan_speed_reset()

> 		if (ret < 0)
> 			return ret;
> 		mod_delayed_work(system_wq, &priv->keep_alive_dwork,
>@@ -2429,6 +2435,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> {
> 	switch (type) {
> 	case hwmon_pwm:
>+		/*
>+		 * Second pwm channel only exists on Victus-S-style boards
>+		 * which expose an independent GPU fan setpoint.
>+		 */
>+		if (channel == 1 && !is_victus_s_thermal_profile())
>+			return 0;

Technically, the fan table has a dedicated field .num_fans (see
struct victus_s_fan_table_header), so there is a possibility that some
Victus-S-style device may not have second fan for pwm channel. But at
least for the current entries, this is not the case, so I guess it would
be safe to keep it this way.

> 		if (attr == hwmon_pwm_input && !is_victus_s_thermal_profile())
> 			return 0;
> 		return 0644;
>@@ -2514,7 +2526,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> 			/* ensure PWM input is within valid fan speeds */
> 			rpm = pwm_to_rpm(val, priv);
> 			rpm = clamp_val(rpm, priv->min_rpm, priv->max_rpm);
>-			priv->pwm = rpm_to_pwm(rpm, priv);
>+			priv->pwm[channel] = rpm_to_pwm(rpm, priv);
> 			return hp_wmi_apply_fan_settings(priv);
> 		}
> 		switch (val) {
>@@ -2525,13 +2537,18 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> 			if (!is_victus_s_thermal_profile())
> 				return -EOPNOTSUPP;
> 			/*
>-			 * When switching to manual mode, set fan speed to
>-			 * current RPM values to ensure a smooth transition.
>+			 * When switching to manual mode, seed each per-fan
>+			 * setpoint from its current measured RPM so the
>+			 * transition is smooth.
> 			 */
>-			rpm = hp_wmi_get_fan_speed_victus_s(channel);
>+			rpm = hp_wmi_get_fan_speed_victus_s(CPU_FAN);
>+			if (rpm < 0)
>+				return rpm;
>+			priv->pwm[CPU_FAN] = rpm_to_pwm(rpm / 100, priv);
>+			rpm = hp_wmi_get_fan_speed_victus_s(GPU_FAN);
> 			if (rpm < 0)
> 				return rpm;
>-			priv->pwm = rpm_to_pwm(rpm / 100, priv);
>+			priv->pwm[GPU_FAN] = rpm_to_pwm(rpm / 100, priv);
> 			priv->mode = PWM_MODE_MANUAL;
> 			return hp_wmi_apply_fan_settings(priv);
> 		case PWM_MODE_AUTO:
>@@ -2547,7 +2564,9 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>
> static const struct hwmon_channel_info * const info[] = {
> 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT),
>-	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_ENABLE | HWMON_PWM_INPUT),
>+	HWMON_CHANNEL_INFO(pwm,
>+			   HWMON_PWM_ENABLE | HWMON_PWM_INPUT,
>+			   HWMON_PWM_ENABLE | HWMON_PWM_INPUT),

I think you can take this opportunity to explore adding
fanX_{min,max,input} to hwmon as well.

> 	NULL
> };
>
>-- 
>2.54.0
>
