Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756D239098C
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181323; cv=none; b=ruK22zGMPOiOOYi8SWDyfyF/u8EnneEDEACBOq0KouXdazi+FhrUDzTW6xnBvBKkBFWLIF//9K3MxPrI64C9r94vrnDYE6twLHVQ2d7mPj26BelbWUsgk4Cek5FgjFn6pt3wTJdQljRWAoKYnygzZEVzEtFCUoTR03+lU4Q+Ccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181323; c=relaxed/simple;
	bh=md47/BsVI4tUEzji70Ikg6zySAx6I+JG1knRJY9b9bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6w6CWWDxHnE+XlWyP/O58oIBsjuIWDiF8+xmJyEJo5tA3eak6NCFYdM98HPV0JPDAfp0bN6g+uhUjBvl85/kPRwwpIjyMcF2iU/9QrTH3KmgDpV48c4GMAFPv+PuWY99SaulSi5ZqyAT2ju3ASzGFsDtfQIr/FNuWZoSm0YW9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cn+//VMh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cn+//VMh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso11608365ad.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 12:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778181306; x=1778786106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IG65Dl6AcmTHEqc/ACpRmoIQxmnlVFAWTNwn+wT4SNI=;
        b=cn+//VMhEAtsM23nK1DafLFqNu+EU3I5O6T3DI2roZgx/42PTjPuigwgPGXToxk0QL
         M6r19JkxOAX8wQXHrG8zDJsVM9AcnqLsqZpQDHabwvyXbNWWLg+AG8zZBpsmZerhb13H
         dAg4eJgm48z0ndnJOgpERGX9Ope5ocAN9j1nxvNEgUtdGDzUv7ZPU9xVIEO8C950f0nH
         EKL5grx239UlA061Z0WW6Ui+0LN0bCzGaAd09N72JSNLZ9DoWuM1isi/J3olFJtb8vnB
         wkVsuAIa5IlDEtP5lgdCnpm5K0uj3Y5Ad4u9nf0YzW1y1HSIwVtH+dVj4YJ4LUoBrcz6
         6zWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778181306; x=1778786106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IG65Dl6AcmTHEqc/ACpRmoIQxmnlVFAWTNwn+wT4SNI=;
        b=KR+0mD5bEelDtBHQMJoE0a9gxDvCgdIoKehqVNoXpfPqeDVA8ogQok+yypQ6ClO9vw
         nWIDP0Y0ysxd2Q7boOLDd1dRxbyALptOYLgYpXqYW1Xt38ZmuPj77kN3a245FBePDMcD
         J1Gx7zEV+jzdMqQ9rZcUXbKvQtSaj/Ysjjj/5TAQVFi+MzTRcpEyUOS5JIbZGJYuhvZY
         z25SaCSyRcVlIsgAEzV7RNnQxkVwW74je6h219v4E8Ujjbvc/kTmJ46FrHyMgzSY2Xyf
         avouJVhXLS+KAr5MwXLYOg7FaHF7EjcG25yZI4tckN7Qkn9HDC3GSDtX2v01WR1LHT5s
         1gdA==
X-Gm-Message-State: AOJu0Yxq9n3lf43rJQKX5LEkIyRXKpviGPq0Tz9QP/NAcbcNfjw4cWyJ
	pSUZIGYAGsWhEUQsdkTVQcQ1fPPp3BhjEXVZZ8xRJ+NZQ/SmvPf7FsFD
X-Gm-Gg: Acq92OF8CLwftxpnNo0PZSZP56rsFNlsncvBNzUwGZ4+Ap8MEE5t1M+3h3VU8UZ3O78
	yLCYFnOfmc/aYid9vcQClcQEAoDSK+TP0rypG9gs7WojgjVz1yzWq6u0ulzHd6unwk+nWzx86a3
	/OJNuqOhuz0GNYYlNaLnaNnogAhZ9+ZFQEyvAiwSKfEuZaL+2IRCHcLfJFrMMEd58sHE1SxWwEV
	L3KkofNY8fK4BOMK6Kn+WpKwu80RNU1Aj80kveGAJE3PO15rJZgcTBpLUDJsIGDcutR6Dt0ybnF
	IUeLj1rbygCpMeFAeufBYeL9BgRqi/f4kEJxMo1MMJ9Bg1mJxmk4oBn4ti1V991nMKuyVMw3/ku
	PG2aiXdQR+yrt2CkUrNLEyuw5IYtZr35axmX/RabNsuEXcq2byAiua/52l2PK9D2flpaVD91MlO
	p5n5xec3MJvgfcQiKZ5AmsyDAG3w/Sv+XBYQx5uco4W8HZcHhTJDhzdHYhxCw6ru4S9p96AUT+1
	cWWUJRKowZcwbIU9PWC
X-Received: by 2002:a17:903:1ce:b0:2ba:6bd7:8eff with SMTP id d9443c01a7336-2ba798b64c3mr97536475ad.18.1778181306407;
        Thu, 07 May 2026 12:15:06 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:36f2:f474:be1d:cad7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae7576c53sm5104045ad.31.2026.05.07.12.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 12:15:05 -0700 (PDT)
Date: Fri, 8 May 2026 00:45:02 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: jR4dh3y <radheykalra901@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com
Subject: Re: [PATCH] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
Message-ID: <afzffd9SRuZQEMXe@archlinux>
References: <20260507101347.27972-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260507101347.27972-1-radheykalra901@gmail.com>

Hi,

On Thu, May 07, 2026 at 03:43:44PM +0530, jR4dh3y wrote:
>HP Victus 15-fb0xxx board 8A3D supports the same WMI fan speed
>set command used by the Victus manual fan control path, but it is
>not a Victus S thermal-profile board.
>

I wanted to clarify that the names in this driver are currently a bit
misleading since victus_s_thermal_profile_boards[] contains both Victus
and Omen devices. The main idea is that, devices which support fan
control should go in victus_s_thermal_profile_boards[].

>Enable the hwmon PWM manual fan interface for this board without
>adding it to the Victus S thermal profile DMI table. This preserves
>the existing generic platform-profile choices on this machine.
>
>The board does not expose a Victus S fan table, so use the RPM limits
>validated on hardware: CPU fan 2600-5800 RPM, GPU fan about 300 RPM
>higher.
>

This is really interesting because as per my understanding the OGH
software on Windows derives the fan curve for all fan-control supporting
devices via WMI calls. Can you explain why it "does not expose a Victus S
fan table"? Is it a WMI call failure or issue in parsing the table data?

NOTE: There is a known regression [1] causing a failure in parsing
the fan table so you should build against mainline 7.1-rc1 at least, or
manually cherry-pick 9d317a54e46d ("platform/x86: hp-wmi: fix fan table
parsing") into your tree.

[1] https://lore.kernel.org/all/CABd86uaQY9-ZSU-_PHKtZZyWnDFHLEsuaM+NBV5nOLWA+YSX7A@mail.gmail.com

>Compile-tested against 7.0.3-1-cachyos-bore-lto. The WMI fan-speed
>set path was validated on a Victus by HP Gaming Laptop 15-fb0xxx with
>board 8A3D and BIOS F.22.
>
>Signed-off-by: jR4dh3y <radheykalra901@gmail.com>
>---
> drivers/platform/x86/hp/hp-wmi.c | 56 +++++++++++++++++++++++++-------
> 1 file changed, 45 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>index 304d9ac..b2a6d50 100644
>--- a/drivers/platform/x86/hp/hp-wmi.c
>+++ b/drivers/platform/x86/hp/hp-wmi.c
>@@ -204,6 +204,11 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
> 	{},
> };
>
>+/* DMI Board names of Victus laptops with the Victus fan-control WMI calls. */
>+static const char * const victus_fan_control_boards[] = {
>+	"8A3D", /* Victus by HP Gaming Laptop 15-fb0xxx */
>+};
>+
> static bool is_victus_s_board;
>
> enum hp_wmi_radio {
>@@ -1715,6 +1720,22 @@ static bool is_victus_s_thermal_profile(void)
> 	return is_victus_s_board;
> }
>
>+static bool is_victus_fan_control(void)
>+{
>+	const char *board_name;
>+
>+	if (is_victus_s_thermal_profile())
>+		return true;
>+
>+	board_name = dmi_get_system_info(DMI_BOARD_NAME);
>+	if (!board_name)
>+		return false;
>+
>+	return match_string(victus_fan_control_boards,
>+			    ARRAY_SIZE(victus_fan_control_boards),
>+			    board_name) >= 0;
>+}
>+
> static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
> 					    bool *ppab_enable,
> 					    u8 *dstate,
>@@ -2324,7 +2345,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>
> 	switch (priv->mode) {
> 	case PWM_MODE_MAX:
>-		if (is_victus_s_thermal_profile())
>+		if (is_victus_fan_control())
> 			hp_wmi_get_fan_count_userdefine_trigger();
> 		ret = hp_wmi_fan_speed_max_set(1);
> 		if (ret < 0)
>@@ -2333,7 +2354,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
> 				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
> 		return 0;
> 	case PWM_MODE_MANUAL:
>-		if (!is_victus_s_thermal_profile())
>+		if (!is_victus_fan_control())
> 			return -EOPNOTSUPP;
> 		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
> 		if (ret < 0)
>@@ -2342,7 +2363,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
> 				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
> 		return 0;
> 	case PWM_MODE_AUTO:
>-		if (is_victus_s_thermal_profile()) {
>+		if (is_victus_fan_control()) {
> 			hp_wmi_get_fan_count_userdefine_trigger();
> 			ret = hp_wmi_fan_speed_max_reset(priv);
> 		} else {
>@@ -2366,7 +2387,7 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
> {
> 	switch (type) {
> 	case hwmon_pwm:
>-		if (attr == hwmon_pwm_input && !is_victus_s_thermal_profile())
>+		if (attr == hwmon_pwm_input && !is_victus_fan_control())
> 			return 0;
> 		return 0644;
> 	case hwmon_fan:
>@@ -2404,10 +2425,13 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> 		return 0;
> 	case hwmon_pwm:
> 		if (attr == hwmon_pwm_input) {
>-			if (!is_victus_s_thermal_profile())
>+			if (!is_victus_fan_control())
> 				return -EOPNOTSUPP;
>
>-			rpm = hp_wmi_get_fan_speed_victus_s(channel);
>+			if (is_victus_s_thermal_profile())
>+				rpm = hp_wmi_get_fan_speed_victus_s(channel);
>+			else
>+				rpm = hp_wmi_get_fan_speed(channel);
> 			if (rpm < 0)
> 				return rpm;
> 			*val = rpm_to_pwm(rpm / 100, priv);
>@@ -2438,7 +2462,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> 	switch (type) {
> 	case hwmon_pwm:
> 		if (attr == hwmon_pwm_input) {
>-			if (!is_victus_s_thermal_profile())
>+			if (!is_victus_fan_control())
> 				return -EOPNOTSUPP;
> 			/* PWM input is invalid when not in manual mode */
> 			if (priv->mode != PWM_MODE_MANUAL)
>@@ -2455,13 +2479,16 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> 			priv->mode = PWM_MODE_MAX;
> 			return hp_wmi_apply_fan_settings(priv);
> 		case PWM_MODE_MANUAL:
>-			if (!is_victus_s_thermal_profile())
>+			if (!is_victus_fan_control())
> 				return -EOPNOTSUPP;
> 			/*
> 			 * When switching to manual mode, set fan speed to
> 			 * current RPM values to ensure a smooth transition.
> 			 */
>-			rpm = hp_wmi_get_fan_speed_victus_s(channel);
>+			if (is_victus_s_thermal_profile())
>+				rpm = hp_wmi_get_fan_speed_victus_s(channel);
>+			else
>+				rpm = hp_wmi_get_fan_speed(channel);
> 			if (rpm < 0)
> 				return rpm;
> 			priv->pwm = rpm_to_pwm(rpm / 100, priv);
>@@ -2519,9 +2546,16 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
> 	/* Default behaviour on hwmon init is automatic mode */
> 	priv->mode = PWM_MODE_AUTO;
>
>-	/* Bypass all non-Victus S devices */
>-	if (!is_victus_s_thermal_profile())
>+	/* Bypass devices without the Victus fan-control WMI calls. */
>+	if (!is_victus_fan_control())
>+		return 0;
>+
>+	if (!is_victus_s_thermal_profile()) {
>+		priv->min_rpm = 26;
>+		priv->max_rpm = 58;
>+		priv->gpu_delta = 3;
> 		return 0;
>+	}
>
> 	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
> 				   HPWMI_GM, &fan_data, 4, sizeof(fan_data));
>-- 
>2.54.0
>
