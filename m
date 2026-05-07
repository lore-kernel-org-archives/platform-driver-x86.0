Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E12F3B2FED
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 11:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152861; cv=none; b=jqVNeAJTvjcMbkQKBQZhru8ERYeey71cCAl7LZdUnyou7jlZl8+Z3xjNGXrGh6EWLGUmJgEJwJu+OYccrASbJgerYdmmR78t92UvkZCyWnJ+PTQMEJNFhyTBMOGOBnKhcQ3PKTZPW+YTm528qUUV469aD6/zorj7rPga8p0tetw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152861; c=relaxed/simple;
	bh=17o3GZhztWnkhmmvLpeJcv4LuJO38cmIhb0Mic0E9/o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sb/X9NygH97nfnZxEVqxv9nU/PvA1aL1KQNDWi7V1midBwt3giMjSq51jwQentkC8tv1WwFEDYotjjsFsgTRY8ZGfdWcmqr1ZmlqS5sWs9lLd4sDR8BGGdL1Ec1D/P3ck04/S46w994bWy/FXwqYekMR9m6sV8hIV1wcObQbUcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OI+sKW0i; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OI+sKW0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778152858; x=1809688858;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=17o3GZhztWnkhmmvLpeJcv4LuJO38cmIhb0Mic0E9/o=;
  b=OI+sKW0i6S0JpoTIJBA5xZ7DGUTJc1Y2a9xD5ovIpqNMriztF68TJGM8
   nMJ8p5w0pRGwr363leVhZPNE3ULXPcIP9XyktQo8DShYyjkyPhCG9gnLT
   ABsprFIh+9Mp8Tze2KDJHWO6Cs8TdxE9DCFdnlWIRCT3F/gWNquAtrmb6
   MGtt/Td7I049dqrra6wm+tLbXlzX0d6NTupdKvkYjxSDlKxnaSsgSTB8/
   BGD2uK5QMEy5xWdnIaade48H5L/TMv2bRsJfYHGT2rEeNVtvzL1X1tdUg
   v8FQUgqGFyFXBOIlsM++SjKsoE9Hb7H38HrFaus7SwKFo5Og48DRsiE5V
   Q==;
X-CSE-ConnectionGUID: DPwHMAz6RLqQZqX9fdxxkQ==
X-CSE-MsgGUID: FM1TwxsuQXWkWaWY1R967A==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79284918"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79284918"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 04:20:57 -0700
X-CSE-ConnectionGUID: bQi9SfO2RWihA3Q6dIX6QA==
X-CSE-MsgGUID: kBFxoPphSo2HYhDhDuHH/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="230047471"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 04:20:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 7 May 2026 14:20:52 +0300 (EEST)
To: jR4dh3y <radheykalra901@gmail.com>, 
    Krishna Chomal <krishna.chomal108@gmail.com>
cc: platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
Subject: Re: [PATCH] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
In-Reply-To: <20260507101347.27972-1-radheykalra901@gmail.com>
Message-ID: <3702f7bc-3fda-1ae0-091f-b968d85d3dbe@linux.intel.com>
References: <20260507101347.27972-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 May 2026, jR4dh3y wrote:

> HP Victus 15-fb0xxx board 8A3D supports the same WMI fan speed
> set command used by the Victus manual fan control path, but it is
> not a Victus S thermal-profile board.
> 
> Enable the hwmon PWM manual fan interface for this board without
> adding it to the Victus S thermal profile DMI table. This preserves
> the existing generic platform-profile choices on this machine.
> 
> The board does not expose a Victus S fan table, so use the RPM limits
> validated on hardware: CPU fan 2600-5800 RPM, GPU fan about 300 RPM
> higher.
>
> Compile-tested against 7.0.3-1-cachyos-bore-lto. The WMI fan-speed
> set path was validated on a Victus by HP Gaming Laptop 15-fb0xxx with
> board 8A3D and BIOS F.22.
> 
> Signed-off-by: jR4dh3y <radheykalra901@gmail.com>

Hi,

The sign off should be based on your real name (sorry, no nicknames or 
like).

> ---
>  drivers/platform/x86/hp/hp-wmi.c | 56 +++++++++++++++++++++++++-------
>  1 file changed, 45 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 304d9ac..b2a6d50 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -204,6 +204,11 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
>  	{},
>  };
>  
> +/* DMI Board names of Victus laptops with the Victus fan-control WMI calls. */
> +static const char * const victus_fan_control_boards[] = {
> +	"8A3D", /* Victus by HP Gaming Laptop 15-fb0xxx */
> +};
> +
>  static bool is_victus_s_board;
>  
>  enum hp_wmi_radio {
> @@ -1715,6 +1720,22 @@ static bool is_victus_s_thermal_profile(void)
>  	return is_victus_s_board;
>  }
>  
> +static bool is_victus_fan_control(void)
> +{
> +	const char *board_name;
> +
> +	if (is_victus_s_thermal_profile())
> +		return true;
> +
> +	board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +	if (!board_name)
> +		return false;
> +
> +	return match_string(victus_fan_control_boards,
> +			    ARRAY_SIZE(victus_fan_control_boards),
> +			    board_name) >= 0;
> +}

Instead of piling up more if()s and dmi checks everywhere, the approach 
current used for victus_s_thermal_profile_boards should be extended to 
cover a wider set of driver features and models including this one. The 
model specific differences should be (mostly) handled by what is stored 
into the struct in .driver_data.

If such an extension seems impossible for some reason, I might reconsider 
but it needs to be explored first.

> +
>  static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
>  					    bool *ppab_enable,
>  					    u8 *dstate,
> @@ -2324,7 +2345,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  
>  	switch (priv->mode) {
>  	case PWM_MODE_MAX:
> -		if (is_victus_s_thermal_profile())
> +		if (is_victus_fan_control())
>  			hp_wmi_get_fan_count_userdefine_trigger();
>  		ret = hp_wmi_fan_speed_max_set(1);
>  		if (ret < 0)
> @@ -2333,7 +2354,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
>  		return 0;
>  	case PWM_MODE_MANUAL:
> -		if (!is_victus_s_thermal_profile())
> +		if (!is_victus_fan_control())
>  			return -EOPNOTSUPP;
>  		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
>  		if (ret < 0)
> @@ -2342,7 +2363,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
>  		return 0;
>  	case PWM_MODE_AUTO:
> -		if (is_victus_s_thermal_profile()) {
> +		if (is_victus_fan_control()) {
>  			hp_wmi_get_fan_count_userdefine_trigger();
>  			ret = hp_wmi_fan_speed_max_reset(priv);
>  		} else {
> @@ -2366,7 +2387,7 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>  {
>  	switch (type) {
>  	case hwmon_pwm:
> -		if (attr == hwmon_pwm_input && !is_victus_s_thermal_profile())
> +		if (attr == hwmon_pwm_input && !is_victus_fan_control())
>  			return 0;
>  		return 0644;
>  	case hwmon_fan:
> @@ -2404,10 +2425,13 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  		return 0;
>  	case hwmon_pwm:
>  		if (attr == hwmon_pwm_input) {
> -			if (!is_victus_s_thermal_profile())
> +			if (!is_victus_fan_control())
>  				return -EOPNOTSUPP;
>  
> -			rpm = hp_wmi_get_fan_speed_victus_s(channel);
> +			if (is_victus_s_thermal_profile())
> +				rpm = hp_wmi_get_fan_speed_victus_s(channel);
> +			else
> +				rpm = hp_wmi_get_fan_speed(channel);

Structure held in .driver_data should somehow tell which of these function 
to call or perhaps just store the function pointer (in which case NULL 
would imply -EOPNOTSUPP).

>  			if (rpm < 0)
>  				return rpm;
>  			*val = rpm_to_pwm(rpm / 100, priv);
> @@ -2438,7 +2462,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  	switch (type) {
>  	case hwmon_pwm:
>  		if (attr == hwmon_pwm_input) {
> -			if (!is_victus_s_thermal_profile())
> +			if (!is_victus_fan_control())
>  				return -EOPNOTSUPP;
>  			/* PWM input is invalid when not in manual mode */
>  			if (priv->mode != PWM_MODE_MANUAL)
> @@ -2455,13 +2479,16 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  			priv->mode = PWM_MODE_MAX;
>  			return hp_wmi_apply_fan_settings(priv);
>  		case PWM_MODE_MANUAL:
> -			if (!is_victus_s_thermal_profile())
> +			if (!is_victus_fan_control())
>  				return -EOPNOTSUPP;
>  			/*
>  			 * When switching to manual mode, set fan speed to
>  			 * current RPM values to ensure a smooth transition.
>  			 */
> -			rpm = hp_wmi_get_fan_speed_victus_s(channel);
> +			if (is_victus_s_thermal_profile())
> +				rpm = hp_wmi_get_fan_speed_victus_s(channel);
> +			else
> +				rpm = hp_wmi_get_fan_speed(channel);
>  			if (rpm < 0)
>  				return rpm;
>  			priv->pwm = rpm_to_pwm(rpm / 100, priv);
> @@ -2519,9 +2546,16 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  	/* Default behaviour on hwmon init is automatic mode */
>  	priv->mode = PWM_MODE_AUTO;
>  
> -	/* Bypass all non-Victus S devices */
> -	if (!is_victus_s_thermal_profile())
> +	/* Bypass devices without the Victus fan-control WMI calls. */
> +	if (!is_victus_fan_control())
> +		return 0;
> +
> +	if (!is_victus_s_thermal_profile()) {
> +		priv->min_rpm = 26;
> +		priv->max_rpm = 58;
> +		priv->gpu_delta = 3;

These should come from information stored into driver_data, not be 
hardcoded into code like this (if we really cannot get them from HW).

>  		return 0;
> +	}
>  
>  	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
>  				   HPWMI_GM, &fan_data, 4, sizeof(fan_data));
> 

-- 
 i.

