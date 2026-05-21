Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800AF3CDBDF
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 13:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368583; cv=none; b=jiI0kJDeLURPMEg/lYAjWGndZE0XKyP61tkgrIeUT2/c0BCVEN4viAi4EDSBaDQMuyDBn4XL8B5iwpOtk4e3Or5AfALGZvWI4udHDDpGOJeTcZWPJeCdERIoXfmw26eQUay4zMyZQEzwkXgaH8PDcPVbL4wv4GlAFAkkaYoQq38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368583; c=relaxed/simple;
	bh=pfbeeTKyZST66xL1g50PhZqJO2SBAQcvh1EICg5lWBQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mgQ1ASEPPNP2oFrnTOP1o02yic9iSvAyAa/knOM4oZTXOuQEMMnG/oFdI3gd8vkWNscpeddZ6rXnODfs5DpWkE+Vr13A9tjZU3OGK/JiffZqWCqojxczdy/nMmOqmdK/4jh0yIhfec0ySPzWyOCkZ50BeoLEXCH3A0c8ftum6RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxsNMy6I; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxsNMy6I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779368581; x=1810904581;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pfbeeTKyZST66xL1g50PhZqJO2SBAQcvh1EICg5lWBQ=;
  b=PxsNMy6Iogxa6/MPYHBCxYX6dgq9Lt6fBliLGFOT/QGPVaYJN8p8Lke2
   ynZScpCg4Fk4lGhlqfA6A12ALvpQSC3i2KOuPbtvWkOvfLIOc0g5GXbGX
   BwWPTbaRqPv4hgTVwYNj34SbowaPrW1U0Q84cc3n8FEGQeBq3Ecvyoug1
   F+eYlduNlzj231tvurMT8dX1+qmg5FAK63Su4+0sD1vIesdeXrd0/RXR7
   GVlMOK0+QiDh+gMax+8wRMqlrihpV6IZHmsaThysZlMNmb6eWCJfUVRfj
   uRp1flMyV/ZEpN0FSuhN8Ew6AVrZo/9pfPEfzyl2c9feBSO66qrkbC2Vm
   A==;
X-CSE-ConnectionGUID: Qz9cUtUcSsa9eU+vOhym1Q==
X-CSE-MsgGUID: qSp0b+saTA6FtaKcN2kQag==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90976221"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90976221"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:03:01 -0700
X-CSE-ConnectionGUID: +wS1FcVfTTml7qo5KIiA1Q==
X-CSE-MsgGUID: sOgH6j0NT2motzWds3zfeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="234185430"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.98])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:02:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 21 May 2026 16:02:55 +0300 (EEST)
To: Radhey Kalra <radheykalra901@gmail.com>
cc: platform-driver-x86@vger.kernel.org, hdegoede@redhat.com, 
    krishna.chomal108@gmail.com
Subject: Re: [PATCH v5 1/2] platform/x86: hp-wmi: Prepare Victus fan control
 board data
In-Reply-To: <20260520140800.130530-2-radheykalra901@gmail.com>
Message-ID: <7c6770ca-b9db-9504-d0d2-11a136955dee@linux.intel.com>
References: <20260520140800.130530-1-radheykalra901@gmail.com> <20260520140800.130530-2-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 May 2026, Radhey Kalra wrote:

> Move the Victus S thermal-profile DMI data behind hp_wmi_board_params so
> board-specific feature data can describe thermal-profile and fan-control
> support together.
> 
> Use the active board data for fan-control decisions instead of checking
> is_victus_s_thermal_profile() in the hwmon path.

> Also derive gpu_delta
> from the first non-zero GPU RPM row so fan tables whose first GPU RPM is
> zero still produce valid fan settings.

Unfortunately, moving gpu_delta things from own patch to the refactor 
patch is a step backwards.

Why would it logically belong to this patch??

--
 i.

> No fan-control support changes intended for existing boards. Fan tables
> with an initial zero GPU RPM row now produce a valid GPU delta.
> 
> Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 204 ++++++++++++++++++++++---------
>  1 file changed, 145 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index d1cc6e7..dcfffe6 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -133,11 +133,52 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
>  	.ec_tp_offset	= HP_NO_THERMAL_PROFILE_OFFSET,
>  };
>  
> -/*
> - * A generic pointer for the currently-active board's thermal profile
> - * parameters.
> - */
> -static struct thermal_profile_params *active_thermal_profile_params;
> +struct hp_wmi_fan_profile_params {
> +	int (*get_fan_speed)(int fan);
> +	bool fan_table;
> +};
> +
> +struct hp_wmi_board_params {
> +	const struct thermal_profile_params *thermal_profile;
> +	const struct hp_wmi_fan_profile_params *fan_profile;
> +};
> +
> +static int hp_wmi_get_fan_speed_victus_s(int fan);
> +
> +static const struct hp_wmi_fan_profile_params victus_s_fan_profile_params = {
> +	.get_fan_speed	= hp_wmi_get_fan_speed_victus_s,
> +	.fan_table	= true,
> +};
> +
> +static const struct hp_wmi_board_params victus_s_board_params = {
> +	.thermal_profile	= &victus_s_thermal_params,
> +	.fan_profile		= &victus_s_fan_profile_params,
> +};
> +
> +static const struct hp_wmi_board_params omen_v1_board_params = {
> +	.thermal_profile	= &omen_v1_thermal_params,
> +	.fan_profile		= &victus_s_fan_profile_params,
> +};
> +
> +static const struct hp_wmi_board_params omen_v1_legacy_board_params = {
> +	.thermal_profile	= &omen_v1_legacy_thermal_params,
> +	.fan_profile		= &victus_s_fan_profile_params,
> +};
> +
> +static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
> +	.thermal_profile	= &omen_v1_no_ec_thermal_params,
> +	.fan_profile		= &victus_s_fan_profile_params,
> +};
> +
> +static const struct hp_wmi_board_params *active_board_params;
> +
> +static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
> +{
> +	if (!active_board_params)
> +		return NULL;
> +
> +	return active_board_params->thermal_profile;
> +}
>  
>  /* DMI board names of devices that should use the omen specific path for
>   * thermal profiles.
> @@ -187,67 +228,67 @@ static const char * const victus_thermal_profile_boards[] = {
>  	"8A25",
>  };
>  
> -/* DMI Board names of Victus 16-r and Victus 16-s laptops */
> -static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
> +/* DMI board-specific feature data for Omen and Victus laptops. */
> +static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
> -		.driver_data = (void *)&omen_v1_legacy_thermal_params,
> +		.driver_data = (void *)&omen_v1_legacy_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
> -		.driver_data = (void *)&omen_v1_legacy_thermal_params,
> +		.driver_data = (void *)&omen_v1_legacy_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BAB") },
> -		.driver_data = (void *)&omen_v1_thermal_params,
> +		.driver_data = (void *)&omen_v1_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
> -		.driver_data = (void *)&victus_s_thermal_params,
> +		.driver_data = (void *)&victus_s_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
> -		.driver_data = (void *)&omen_v1_thermal_params,
> +		.driver_data = (void *)&omen_v1_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
> -		.driver_data = (void *)&omen_v1_thermal_params,
> +		.driver_data = (void *)&omen_v1_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
> -		.driver_data = (void *)&victus_s_thermal_params,
> +		.driver_data = (void *)&victus_s_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
> -		.driver_data = (void *)&victus_s_thermal_params,
> +		.driver_data = (void *)&victus_s_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
> -		.driver_data = (void *)&omen_v1_thermal_params,
> +		.driver_data = (void *)&omen_v1_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C77") },
> -		.driver_data = (void *)&omen_v1_thermal_params,
> +		.driver_data = (void *)&omen_v1_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
> -		.driver_data = (void *)&omen_v1_thermal_params,
> +		.driver_data = (void *)&omen_v1_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
> -		.driver_data = (void *)&victus_s_thermal_params,
> +		.driver_data = (void *)&victus_s_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
> -		.driver_data = (void *)&victus_s_thermal_params,
> +		.driver_data = (void *)&victus_s_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
> -		.driver_data = (void *)&victus_s_thermal_params,
> +		.driver_data = (void *)&victus_s_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
> -		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
> +		.driver_data = (void *)&omen_v1_no_ec_board_params,
>  	},
>  	{},
>  };
> @@ -1769,6 +1810,38 @@ static bool is_victus_s_thermal_profile(void)
>  	return is_victus_s_board;
>  }
>  
> +static const struct hp_wmi_fan_profile_params *hp_wmi_fan_profile(void)
> +{
> +	if (!active_board_params)
> +		return NULL;
> +
> +	return active_board_params->fan_profile;
> +}
> +
> +static bool hp_wmi_fan_control_supported(void)
> +{
> +	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
> +
> +	return params && params->get_fan_speed;
> +}
> +
> +static bool hp_wmi_fan_table_supported(void)
> +{
> +	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
> +
> +	return params && params->fan_table;
> +}
> +
> +static int hp_wmi_get_active_fan_speed(int fan)
> +{
> +	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
> +
> +	if (!params || !params->get_fan_speed)
> +		return -EOPNOTSUPP;
> +
> +	return params->get_fan_speed(fan);
> +}
> +
>  static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
>  					    bool *ppab_enable,
>  					    u8 *dstate,
> @@ -1854,7 +1927,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
>  	u8 current_dstate, current_gpu_slowdown_temp, tp;
>  	const struct thermal_profile_params *params;
>  
> -	params = active_thermal_profile_params;
> +	params = hp_wmi_thermal_profile();
> +	if (!params)
> +		return -ENODEV;
> +
>  	if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
>  	    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
>  		*profile = active_platform_profile;
> @@ -1866,10 +1942,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
>  		return ret;
>  
>  	/*
> -	 * We cannot use active_thermal_profile_params here, because boards
> -	 * like 8C78 have tp == 0x0 || tp == 0x1 after cold boot, but logically
> -	 * it should have tp == 0x30 || tp == 0x31, as corrected by the Omen
> -	 * Gaming Hub on windows. Hence accept both of these values.
> +	 * Boards like 8C78 have tp == 0x0 || tp == 0x1 after cold boot,
> +	 * but logically it should have tp == 0x30 || tp == 0x31, as
> +	 * corrected by the Omen Gaming Hub on windows. Hence accept both
> +	 * of these values.
>  	 */
>  	if (tp == victus_s_thermal_params.performance ||
>  	    tp == omen_v1_thermal_params.performance) {
> @@ -1904,12 +1980,12 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
>  
>  static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
>  {
> -	struct thermal_profile_params *params;
> +	const struct thermal_profile_params *params;
>  	bool gpu_ctgp_enable, gpu_ppab_enable;
>  	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
>  	int err, tp;
>  
> -	params = active_thermal_profile_params;
> +	params = hp_wmi_thermal_profile();
>  	if (!params)
>  		return -ENODEV;
>  
> @@ -2175,6 +2251,7 @@ static const struct platform_profile_ops hp_wmi_platform_profile_ops = {
>  static int thermal_profile_setup(struct platform_device *device)
>  {
>  	const struct platform_profile_ops *ops;
> +	const struct thermal_profile_params *params;
>  	int err, tp;
>  
>  	if (is_omen_thermal_profile()) {
> @@ -2206,13 +2283,17 @@ static int thermal_profile_setup(struct platform_device *device)
>  
>  		ops = &platform_profile_victus_ops;
>  	} else if (is_victus_s_thermal_profile()) {
> +		params = hp_wmi_thermal_profile();
> +		if (!params)
> +			return -ENODEV;
> +
>  		/*
>  		 * For an unknown EC layout board, platform_profile_victus_s_get_ec(),
>  		 * behaves like a wrapper around active_platform_profile, to avoid using
>  		 * uninitialized data, we default to PLATFORM_PROFILE_BALANCED.
>  		 */
> -		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
> -		    active_thermal_profile_params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
> +		if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
> +		    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
>  			active_platform_profile = PLATFORM_PROFILE_BALANCED;
>  		} else {
>  			err = platform_profile_victus_s_get_ec(&active_platform_profile);
> @@ -2380,7 +2461,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  
>  	switch (priv->mode) {
>  	case PWM_MODE_MAX:
> -		if (is_victus_s_thermal_profile()) {
> +		if (hp_wmi_fan_control_supported()) {
>  			ret = hp_wmi_get_fan_count_userdefine_trigger();
>  			if (ret < 0)
>  				return ret;
> @@ -2392,7 +2473,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
>  		return 0;
>  	case PWM_MODE_MANUAL:
> -		if (!is_victus_s_thermal_profile())
> +		if (!hp_wmi_fan_control_supported())
>  			return -EOPNOTSUPP;
>  		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
>  		if (ret < 0)
> @@ -2401,7 +2482,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
>  		return 0;
>  	case PWM_MODE_AUTO:
> -		if (is_victus_s_thermal_profile()) {
> +		if (hp_wmi_fan_control_supported()) {
>  			ret = hp_wmi_get_fan_count_userdefine_trigger();
>  			if (ret < 0)
>  				return ret;
> @@ -2425,12 +2506,12 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>  {
>  	switch (type) {
>  	case hwmon_pwm:
> -		if (attr == hwmon_pwm_input && !is_victus_s_thermal_profile())
> +		if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
>  			return 0;
>  		return 0644;
>  	case hwmon_fan:
> -		if (is_victus_s_thermal_profile()) {
> -			if (hp_wmi_get_fan_speed_victus_s(channel) >= 0)
> +		if (hp_wmi_fan_control_supported()) {
> +			if (hp_wmi_get_active_fan_speed(channel) >= 0)
>  				return 0444;
>  		} else {
>  			if (hp_wmi_get_fan_speed(channel) >= 0)
> @@ -2454,8 +2535,8 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  	priv = dev_get_drvdata(dev);
>  	switch (type) {
>  	case hwmon_fan:
> -		if (is_victus_s_thermal_profile())
> -			ret = hp_wmi_get_fan_speed_victus_s(channel);
> +		if (hp_wmi_fan_control_supported())
> +			ret = hp_wmi_get_active_fan_speed(channel);
>  		else
>  			ret = hp_wmi_get_fan_speed(channel);
>  		if (ret < 0)
> @@ -2464,10 +2545,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  		return 0;
>  	case hwmon_pwm:
>  		if (attr == hwmon_pwm_input) {
> -			if (!is_victus_s_thermal_profile())
> +			if (!hp_wmi_fan_control_supported())
>  				return -EOPNOTSUPP;
>  
> -			rpm = hp_wmi_get_fan_speed_victus_s(channel);
> +			rpm = hp_wmi_get_active_fan_speed(channel);
>  			if (rpm < 0)
>  				return rpm;
>  			*val = rpm_to_pwm(rpm / 100, priv);
> @@ -2501,7 +2582,7 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  	switch (type) {
>  	case hwmon_pwm:
>  		if (attr == hwmon_pwm_input) {
> -			if (!is_victus_s_thermal_profile())
> +			if (!hp_wmi_fan_control_supported())
>  				return -EOPNOTSUPP;
>  			/* PWM input is invalid when not in manual mode */
>  			if (priv->mode != PWM_MODE_MANUAL)
> @@ -2518,13 +2599,13 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  			priv->mode = PWM_MODE_MAX;
>  			return hp_wmi_apply_fan_settings(priv);
>  		case PWM_MODE_MANUAL:
> -			if (!is_victus_s_thermal_profile())
> +			if (!hp_wmi_fan_control_supported())
>  				return -EOPNOTSUPP;
>  			/*
>  			 * When switching to manual mode, set fan speed to
>  			 * current RPM values to ensure a smooth transition.
>  			 */
> -			rpm = hp_wmi_get_fan_speed_victus_s(channel);
> +			rpm = hp_wmi_get_active_fan_speed(channel);
>  			if (rpm < 0)
>  				return rpm;
>  			priv->pwm = rpm_to_pwm(rpm / 100, priv);
> @@ -2585,13 +2666,14 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  	u8 min_rpm, max_rpm;
>  	u8 cpu_rpm, gpu_rpm, noise_db;
>  	int gpu_delta, i, num_entries, ret;
> +	bool gpu_delta_found = false;
>  	size_t header_size, entry_size;
>  
>  	/* Default behaviour on hwmon init is automatic mode */
>  	priv->mode = PWM_MODE_AUTO;
>  
> -	/* Bypass all non-Victus S devices */
> -	if (!is_victus_s_thermal_profile())
> +	/* Bypass devices without fan control support. */
> +	if (!hp_wmi_fan_table_supported())
>  		return 0;
>  
>  	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY,
> @@ -2625,12 +2707,15 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  			min_rpm = cpu_rpm;
>  		if (cpu_rpm > max_rpm)
>  			max_rpm = cpu_rpm;
> +		if (!gpu_delta_found && gpu_rpm > 0) {
> +			gpu_delta = gpu_rpm - cpu_rpm;
> +			gpu_delta_found = true;
> +		}
>  	}
>  
> -	if (min_rpm == U8_MAX || max_rpm == 0)
> +	if (min_rpm == U8_MAX || max_rpm == 0 || !gpu_delta_found)
>  		return -EINVAL;
>  
> -	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
>  	priv->min_rpm = min_rpm;
>  	priv->max_rpm = max_rpm;
>  	priv->gpu_delta = gpu_delta;
> @@ -2673,24 +2758,25 @@ static int hp_wmi_hwmon_init(void)
>  	return 0;
>  }
>  
> -static void __init setup_active_thermal_profile_params(void)
> +static void __init setup_active_board_params(void)
>  {
>  	const struct dmi_system_id *id;
> +	const struct thermal_profile_params *params;
>  
> -	/*
> -	 * Currently only victus_s devices use the
> -	 * active_thermal_profile_params
> -	 */
> -	id = dmi_first_match(victus_s_thermal_profile_boards);
> +	id = dmi_first_match(hp_wmi_feature_boards);
>  	if (id) {
> +		active_board_params = id->driver_data;
> +		params = hp_wmi_thermal_profile();
> +		if (!params)
> +			return;
> +
>  		/*
>  		 * Marking this boolean is required to ensure that
>  		 * is_victus_s_thermal_profile() behaves like a valid
>  		 * wrapper.
>  		 */
>  		is_victus_s_board = true;
> -		active_thermal_profile_params = id->driver_data;
> -		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
> +		if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
>  			pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
>  				dmi_get_system_info(DMI_BOARD_NAME));
>  		}
> @@ -2725,10 +2811,10 @@ static int __init hp_wmi_init(void)
>  		}
>  
>  		/*
> -		 * Setup active board's thermal profile parameters before
> -		 * starting platform driver probe.
> +		 * Setup active board feature data before starting platform
> +		 * driver probe.
>  		 */
> -		setup_active_thermal_profile_params();
> +		setup_active_board_params();
>  		err = platform_driver_probe(&hp_wmi_driver, hp_wmi_bios_setup);
>  		if (err)
>  			goto err_unregister_device;
> 
