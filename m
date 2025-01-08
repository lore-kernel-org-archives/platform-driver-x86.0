Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029D91F8691
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jan 2025 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736330909; cv=none; b=fThqpcTFSxJu/MfxtyKf+pz1i3w+0VbCXvdMZUKlciG+oguesC+5MRbyqoCsroYMyRagUAVpIqVv56NoXJpRx36DO28Iybc0onAgZiCRjkmRrTw+W3yQPxxPDEQVFSu/d8q7qnjHBTeNdAAiNQkrGmnvqpNtM0E3RNmtFaHdHjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736330909; c=relaxed/simple;
	bh=nzN8vnwAYRMCQYcCafXLB/fv/T5v52hvxDUM+itDbs8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OQoeNTIf6Q9QDsIcrILfgEq+wFZ8OYMuJMsmA38dPnSz5XodNwKp2xEhGM7e9Pv/9IkNTgHhM9WpqHCb8wc5UQVQAOmb0f+nRtZKWjw4XLdU2NqRkZaERY4VbXujsfH5P6tllCCSRLFmhomeF/tmaa51NSCdtScXBSROj+zqt4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjtKI30y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjtKI30y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736330907; x=1767866907;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nzN8vnwAYRMCQYcCafXLB/fv/T5v52hvxDUM+itDbs8=;
  b=TjtKI30ylfXy4cUon7D6nhXmpAZHTgoQBEqT48NR2MopHK7BWRfAxuFv
   INUHYDrfviW4d50bEUZU7I6i8CHXW7i0DUKxKPVQVvvWXnpk8lmlSCXRf
   ILwm63ntZX4XxgwzHe6KSW+4m943hNs4O/XDRryAFPugdr7Sr7VzRAzbh
   jTUuDEcSJ9hFOnKTY7BPFcw78drjuslqc5NP6L7zgAZcNlVBkXbuzL+UX
   sx1OX9w3PZ+VlLRe2Q8/EnvSulryR4OueornnY6cEtKHtnJjjP/YQyMNV
   vs0hZqwSg7Ns9OXygIPXKJf7mI+qZnrO6YTdddcV/CwzhueGGzkFMS1pf
   A==;
X-CSE-ConnectionGUID: TDnzRqQQRmuA6apz3SHWLw==
X-CSE-MsgGUID: v3wCtRgRTuabxRvredW07w==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47905598"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="47905598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 02:08:26 -0800
X-CSE-ConnectionGUID: HCxlvRDvQ/y9KV8V+9OiuQ==
X-CSE-MsgGUID: hAnMmxwJQkaMn0hJ6k+VVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126332830"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.87])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 02:08:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 8 Jan 2025 12:08:20 +0200 (EET)
To: Julien ROBIN <julien.robin28@free.fr>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-wmi: Add fan and thermal profile support
 for Victus 16-s1000
In-Reply-To: <69a3a3bf-fe56-4843-91a5-b765e53e337d@free.fr>
Message-ID: <d59c584b-1b25-213f-a481-97cb75c8d021@linux.intel.com>
References: <69a3a3bf-fe56-4843-91a5-b765e53e337d@free.fr>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Dec 2024, Julien ROBIN wrote:

> The following patch adds support for HP Victus 16-s1000 laptop series,
> by adding and fixing the following functionalities, which can be
> accessed through hwmon and platform_profile sysfs:
> 
>  - Functional measured fan speed reading
>  - Ability to enable and disable maximum fan speed
>  - Platform profiles full setting ability for CPU and GPU
> 
> It sets appropriates CPU and GPU power settings both on AC and battery
> power sources, for low-power, balanced and performance modes.
> 
> It has been thoroughly tested on a 16-s1034nf laptop based on a 8C9C DMI
> board name, and behavior of the driver on previous boards is left
> untouched thanks to the separated lists of DMI board names.
> 
> Signed-off-by: Julien ROBIN <julien.robin28@free.fr>
> ---
>  /drivers/platform/x86/hp/hp-wmi.c | 304 ++++++++++++++++++++++++++++++++-
>  1 file changed, 297 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c
> b/drivers/platform/x86/hp/hp-wmi.c
> index 81ccc96..9ce2b80 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -83,11 +83,16 @@ static const char * const
> omen_timed_thermal_profile_boards[] = {
>  	"8BAD", "8A42"
>  };
> 
> -/* DMI Board names of Victus laptops */
> +/* DMI Board names of Victus 16-d1xxx laptops */
>  static const char * const victus_thermal_profile_boards[] = {
>  	"8A25"
>  };
> 
> +/* DMI Board names of Victus 16-s1000 laptops */
> +static const char * const victus_s_thermal_profile_boards[] = {
> +	"8C9C"
> +};
> +
>  enum hp_wmi_radio {
>  	HPWMI_WIFI	= 0x0,
>  	HPWMI_BLUETOOTH	= 0x1,
> @@ -153,6 +158,11 @@ enum hp_wmi_gm_commandtype {
>  	HPWMI_FAN_SPEED_MAX_GET_QUERY = 0x26,
>  	HPWMI_FAN_SPEED_MAX_SET_QUERY = 0x27,
>  	HPWMI_GET_SYSTEM_DESIGN_DATA = 0x28,
> +	HPWMI_FAN_COUNT_GET_QUERY = 0x10,
> +	HPWMI_SET_GPU_THERMAL_MODES_QUERY = 0x22,
> +	HPWMI_SET_POWER_LIMITS_QUERY = 0x29,
> +	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY = 0x2D,
> +	HPWMI_FAN_SPEED_SET_QUERY = 0x2E,

Thank you for the patch.

Please align the values. I leave it up to you if you want to only align 
the values you're adding now or all of them.

>  };
> 
>  enum hp_wmi_command {
> @@ -211,6 +221,11 @@ enum hp_thermal_profile_victus {
>  	HP_VICTUS_THERMAL_PROFILE_QUIET			= 0x03,
>  };
> 
> +enum hp_thermal_profile_victus_s {
> +	HP_VICTUS_S_THERMAL_PROFILE_DEFAULT		= 0x00,
> +	HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE		= 0x01,
> +};
> +
>  enum hp_thermal_profile {
>  	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
>  	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> @@ -411,6 +426,26 @@ out_free:
>  	return ret;
>  }
> 
> +/*
> + * Calling this hp_wmi_get_fan_count_userdefine_trigger function also enables
> + * and/or maintains the laptop in user defined thermal and fan states,
> instead
> + * of using a fallback state. After a 120 seconds timeout however, the laptop
> + * goes back to its fallback state.
> + */
> +static int hp_wmi_get_fan_count_userdefine_trigger(void)
> +{
> +	char fan_data[4] = { 0 };
> +
> +	int ret = hp_wmi_perform_query(HPWMI_FAN_COUNT_GET_QUERY, HPWMI_GM,
> +				       &fan_data, sizeof(char),
> +				       sizeof(fan_data));
> +
> +	if (ret != 0)
> +		return -EINVAL;
> +
> +	return fan_data[0]; /* Others bytes aren't providing fan count */
> +}
> +
>  static int hp_wmi_get_fan_speed(int fan)
>  {
>  	u8 fsh, fsl;
> @@ -429,6 +464,23 @@ static int hp_wmi_get_fan_speed(int fan)
>  	return (fsh << 8) | fsl;
>  }
> 
> +static int hp_wmi_get_fan_speed_victus_s(int fan)
> +{
> +	char fan_data[128] = { 0 };
> +
> +	int ret = hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY,
> +				       HPWMI_GM, &fan_data, sizeof(char),
> +				       sizeof(fan_data));
> +
> +	if (ret != 0)
> +		return -EINVAL;
> +
> +	if (fan >= 0 && fan < sizeof(fan_data))
> +		return fan_data[fan] * 100;
> +	else
> +		return -EINVAL;
> +}
> +
>  static int hp_wmi_read_int(int query)
>  {
>  	int val = 0, ret;
> @@ -557,6 +609,29 @@ static int hp_wmi_fan_speed_max_set(int enabled)
>  	return enabled;
>  }
> 
> +static int hp_wmi_fan_speed_reset(void)
> +{
> +	int ret;
> +	char fan_speed[2] = { 0 }; /* Restores automatic speed */

Instead of a comment, add a named define for the value?

> +
> +	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
> +				   &fan_speed, sizeof(fan_speed), 0);
> +
> +	return ret;
> +}
> +
> +static int hp_wmi_fan_speed_max_reset(void)
> +{
> +	int ret = hp_wmi_fan_speed_max_set(0);
> +
> +	if (ret)
> +		return ret;
> +
> +	/* Disabling Max fan speed on Victus s1xxx laptops needs a 2nd step:

Why is Max capitalized?

> */
> +	ret = hp_wmi_fan_speed_reset();
> +	return ret;
> +}
> +
>  static int hp_wmi_fan_speed_max_get(void)
>  {
>  	int val = 0, ret;
> @@ -1472,6 +1547,127 @@ static int platform_profile_victus_set_ec(enum
> platform_profile_option profile)
>  	return 0;
>  }
> 
> +static bool is_victus_s_thermal_profile(void)
> +{
> +	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +
> +	if (!board_name)
> +		return false;
> +
> +	return match_string(victus_s_thermal_profile_boards,
> +			    ARRAY_SIZE(victus_s_thermal_profile_boards),
> +			    board_name) >= 0;
> +}
> +
> +static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
> +					    bool ppab_enable,
> +					    char dstate)
> +{
> +	char gpu_settings[4];
> +	int ret;
> +
> +	gpu_settings[0] = ctgp_enable ? 0x01 : 0x00;
> +	gpu_settings[1] = ppab_enable ? 0x01 : 0x00;
> +	gpu_settings[2] = dstate;
> +	gpu_settings[3] = 0x57; /* it tells we're setting the 3 above values
> */
> +
> +	ret = hp_wmi_perform_query(HPWMI_SET_GPU_THERMAL_MODES_QUERY,
> HPWMI_GM,
> +				   &gpu_settings, sizeof(gpu_settings), 0);
> +
> +	return ret;
> +}
> +
> +static int victus_s_set_cpu_pl1_pl2(char pl1, char pl2)

Is char correct type here or should you use like u8? Given you use 0xff 
below I highly thing it's not a real character at all but generic 8-bit 
data that should be u8.

> +{
> +	/* Placing 0xFF in the 2 last bytes tells we're setting PL1 and PL2 */
> +	char buffer[4] = { pl1, pl2, 0xFF, 0xFF };

correct type?

I see lots of other char use elsewhere too in this patch, please check 
those too that it's correct.

> +
> +	if (pl1 == 0xFF || pl2 == 0xFF)
> +		return -EINVAL; /* the 0xFF value has a special meaning */

Could that "special meaning" be labeled with a named define?
(I understand you might not know anything beyond it being "special" but 
if you know a more precise meaning, a define would be much better than a 
literal.)

> +	if (pl2 < pl1)
> +		return -EINVAL; /* PL2 is not supposed to be lower than PL1 */

Please move those two comments before the if () line.

> +
> +	/* Note: providing 0x00 as PL1 and PL2 is restoring default values */
> +

That comments sounds like something that could be a function level comment 
instead.

> +	int ret = hp_wmi_perform_query(HPWMI_SET_POWER_LIMITS_QUERY,
> +				       HPWMI_GM,
> +				       &buffer, sizeof(buffer), 0);
> +
> +	return ret;
> +}
> +
> +static int platform_profile_victus_s_get(struct platform_profile_handler
> *pprof,
> +					 enum platform_profile_option
> *profile)
> +{
> +	/* Same behaviour as platform_profile_omen_get */
> +	return platform_profile_omen_get(pprof, profile);
> +}

Just use platform_profile_omen_get() directly then instead?

-- 
 i.

> +
> +static int platform_profile_victus_s_set_ec(enum platform_profile_option
> profile)
> +{
> +	int err, tp;
> +	bool gpu_ctgp_enable, gpu_ppab_enable;
> +	char gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5%
> */
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
> +		gpu_ctgp_enable = true;
> +		gpu_ppab_enable = true;
> +		gpu_dstate = 1;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
> +		gpu_ctgp_enable = false;
> +		gpu_ppab_enable = true;
> +		gpu_dstate = 1;
> +		break;
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
> +		gpu_ctgp_enable = false;
> +		gpu_ppab_enable = false;
> +		gpu_dstate = 1;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	hp_wmi_get_fan_count_userdefine_trigger();
> +
> +	err = omen_thermal_profile_set(tp);
> +	if (err < 0) {
> +		pr_err("Failed to set platform profile %d: %d\n", profile,
> err);
> +		return err;
> +	}
> +
> +	err = victus_s_gpu_thermal_profile_set(gpu_ctgp_enable,
> +					       gpu_ppab_enable,
> +					       gpu_dstate);
> +	if (err < 0) {
> +		pr_err("Failed to set GPU profile %d: %d\n", profile, err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int platform_profile_victus_s_set(struct platform_profile_handler
> *pprof,
> +					 enum platform_profile_option profile)
> +{
> +	int err;
> +
> +	guard(mutex)(&active_platform_profile_lock);
> +
> +	err = platform_profile_victus_s_set_ec(profile);
> +	if (err < 0)
> +		return err;
> +
> +	active_platform_profile = profile;
> +
> +	return 0;
> +}
> +
>  static int platform_profile_victus_set(struct platform_profile_handler
> *pprof,
>  				       enum platform_profile_option profile)
>  {
> @@ -1545,6 +1741,38 @@ static int omen_powersource_event(struct notifier_block
> *nb,
>  	return NOTIFY_OK;
>  }
> 
> +static int victus_s_powersource_event(struct notifier_block *nb,
> +				      unsigned long value,
> +				      void *data)
> +{
> +	struct acpi_bus_event *event_entry = data;
> +	int err;
> +
> +	if (strcmp(event_entry->device_class, ACPI_AC_CLASS) != 0)
> +		return NOTIFY_DONE;
> +
> +	pr_debug("Received power source device event\n");
> +
> +	/*
> +	 * Switching to battery power source while Performance mode is active
> +	 * needs manual triggering of CPU power limits. Same goes when
> switching
> +	 * to AC power source while Performance mode is active. Other modes
> +	 * however are automatically behaving without any manual action.
> +	 * Seen on HP 16-s1034nf (board 8C9C) with F.11 BIOS version.
> +	 */
> +
> +	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
> +		pr_debug("Triggering CPU PL1/PL2 actualization\n");
> +		err = victus_s_set_cpu_pl1_pl2(0, 0);
> +		if (err)
> +			pr_warn("Failed to actualize power limits: %d\n",
> err);
> +
> +		return NOTIFY_DONE;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
>  static int omen_register_powersource_event_handler(void)
>  {
>  	int err;
> @@ -1560,11 +1788,31 @@ static int
> omen_register_powersource_event_handler(void)
>  	return 0;
>  }
> 
> +static int victus_s_register_powersource_event_handler(void)
> +{
> +	int err;
> +
> +	platform_power_source_nb.notifier_call = victus_s_powersource_event;
> +	err = register_acpi_notifier(&platform_power_source_nb);
> +
> +	if (err < 0) {
> +		pr_warn("Failed to install ACPI power source notify
> handler\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static inline void omen_unregister_powersource_event_handler(void)
>  {
>  	unregister_acpi_notifier(&platform_power_source_nb);
>  }
> 
> +static inline void victus_s_unregister_powersource_event_handler(void)
> +{
> +	unregister_acpi_notifier(&platform_power_source_nb);
> +}
> +
>  static int thermal_profile_setup(void)
>  {
>  	int err, tp;
> @@ -1603,6 +1851,22 @@ static int thermal_profile_setup(void)
>  		platform_profile_handler.profile_set =
> platform_profile_victus_set;
> 
>  		set_bit(PLATFORM_PROFILE_QUIET,
> platform_profile_handler.choices);
> +	} else if (is_victus_s_thermal_profile()) {
> +		/*
> +		 * Being unable to retrieve laptop's current thermal profile,
> +		 * during this setup, we set it to Balanced by default.
> +		 */
> +		active_platform_profile = PLATFORM_PROFILE_BALANCED;
> +
> +		err =
> platform_profile_victus_s_set_ec(active_platform_profile);
> +		if (err < 0)
> +			return err;
> +
> +		platform_profile_handler.profile_get =
> platform_profile_victus_s_get;
> +		platform_profile_handler.profile_set =
> platform_profile_victus_s_set;
> +
> +		/* Adding an equivalent to HP Omen software ECO mode: */
> +		set_bit(PLATFORM_PROFILE_LOW_POWER,
> platform_profile_handler.choices);
>  	} else {
>  		tp = thermal_profile_get();
> 
> @@ -1628,9 +1892,14 @@ static int thermal_profile_setup(void)
>  	set_bit(PLATFORM_PROFILE_PERFORMANCE,
> platform_profile_handler.choices);
> 
>  	err = platform_profile_register(&platform_profile_handler);
> -	if (err)
> +	if (err == -EEXIST) {
> +		pr_warn("A platform profile handler is already registered\n");
>  		return err;
> -
> +	} else if (err) {
> +		pr_err("Platform profile handler registration fail: %d\n",
> err);
> +		return err;
> +	}
> +	pr_info("Registered as platform profile handler\n");
>  	platform_profile_support = true;
> 
>  	return 0;
> @@ -1759,8 +2028,13 @@ static umode_t hp_wmi_hwmon_is_visible(const void
> *data,
>  	case hwmon_pwm:
>  		return 0644;
>  	case hwmon_fan:
> -		if (hp_wmi_get_fan_speed(channel) >= 0)
> -			return 0444;
> +		if (is_victus_s_thermal_profile()) {
> +			if (hp_wmi_get_fan_speed_victus_s(channel) >= 0)
> +				return 0444;
> +		} else {
> +			if (hp_wmi_get_fan_speed(channel) >= 0)
> +				return 0444;
> +		}
>  		break;
>  	default:
>  		return 0;
> @@ -1776,7 +2050,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum
> hwmon_sensor_types type,
> 
>  	switch (type) {
>  	case hwmon_fan:
> -		ret = hp_wmi_get_fan_speed(channel);
> +		if (is_victus_s_thermal_profile())
> +			ret = hp_wmi_get_fan_speed_victus_s(channel);
> +		else
> +			ret = hp_wmi_get_fan_speed(channel);
> 
>  		if (ret < 0)
>  			return ret;
> @@ -1810,11 +2087,17 @@ static int hp_wmi_hwmon_write(struct device *dev, enum
> hwmon_sensor_types type,
>  	case hwmon_pwm:
>  		switch (val) {
>  		case 0:
> +			if (is_victus_s_thermal_profile())
> +				hp_wmi_get_fan_count_userdefine_trigger();
>  			/* 0 is no fan speed control (max), which is 1 for us
> */
>  			return hp_wmi_fan_speed_max_set(1);
>  		case 2:
>  			/* 2 is automatic speed control, which is 0 for us */
> -			return hp_wmi_fan_speed_max_set(0);
> +			if (is_victus_s_thermal_profile()) {
> +				hp_wmi_get_fan_count_userdefine_trigger();
> +				return hp_wmi_fan_speed_max_reset();
> +			} else
> +				return hp_wmi_fan_speed_max_set(0);
>  		default:
>  			/* we don't support manual fan speed control */
>  			return -EINVAL;
> @@ -1893,6 +2176,10 @@ static int __init hp_wmi_init(void)
>  		err = omen_register_powersource_event_handler();
>  		if (err)
>  			goto err_unregister_device;
> +	} else if (is_victus_s_thermal_profile()) {
> +		err = victus_s_register_powersource_event_handler();
> +		if (err)
> +			goto err_unregister_device;
>  	}
> 
>  	return 0;
> @@ -1912,6 +2199,9 @@ static void __exit hp_wmi_exit(void)
>  	if (is_omen_thermal_profile() || is_victus_thermal_profile())
>  		omen_unregister_powersource_event_handler();
> 
> +	if (is_victus_s_thermal_profile())
> +		victus_s_unregister_powersource_event_handler();
> +
>  	if (wmi_has_guid(HPWMI_EVENT_GUID))
>  		hp_wmi_input_destroy();
> 
