Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A02A1862
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737031809; cv=none; b=sX2aQZD8bUHPN5UuyOTjuMzIWDkndvj8/3DaaNpbqu9lzQlUnI6LZmGAsUHZKUBhtIqMV1WfCZD0kT9R4Bd8RMFlrXEpT+pnhbuk9GNaj5hjqwCUn4MH+L783JTujjzHIraoMXxezsa1GtZ4W80u8zs4OIZhiLNjCoMJMpZlB98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737031809; c=relaxed/simple;
	bh=KHoC3Scg7iqorfkD2CYGKT9CAAJI4pOelaYiyhqjrtE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=neP4OPKOpGlnsr/voWxyuyj7lf0AHA8KN2p0Si9H3A6Oa6Uc5tHJmT5NuMLtT9Ubm3WLOGQrukqUg3vmJCC214XCO6yCOTTFSdpAr9yhjupvKmEn7hpifFHbUHIgiu3Fd4Byp6zRUcw9H8Xfx+XIaLkkRD3RBKzLf5F2jtp+Odc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLa7cci2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLa7cci2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737031807; x=1768567807;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KHoC3Scg7iqorfkD2CYGKT9CAAJI4pOelaYiyhqjrtE=;
  b=cLa7cci22EJkIwcpXN00l4SU+PHQ3rULDctppm9Qz95uGgfBM+SufC6G
   noAstIl8lmADmoERGJzVB6zjgRi4u0gIVRHHxdmAQ/vP2lrj+JuaV+/oy
   Tgugjn0pRmJ7DcbvZ6oTF6/cliKh/vlp5yHLPnUdhoX00dBSBGN9rR1Ij
   lfBMQfddlRb3StjAEkZAldQxHJPWQjDq1Yw6yqK7pNCa568CTJ5u3rCHx
   JveTfKejYQ/EYYxAYdhos9S3p14XxoyA6cN6FKU7p9kLflTi/k7vcgFOu
   1RU8U3P2IKZ043ZLIRv8BJ/rae8RxBrQX0Uugv9p/+DLYfunR1ew0zrNG
   A==;
X-CSE-ConnectionGUID: KTYykcUGTOyTPPHsmQmNGg==
X-CSE-MsgGUID: hgblT3AlT7+V1gvSfc/wFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47905356"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="47905356"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:50:07 -0800
X-CSE-ConnectionGUID: DXu44/yeRnS+CzSyQ67WrA==
X-CSE-MsgGUID: jxAhTketSBGDGSueqQun5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109526627"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 04:50:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 16 Jan 2025 14:50:02 +0200 (EET)
To: Julien ROBIN <julien.robin28@free.fr>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: hp-wmi: Add fan and thermal profile
 support for Victus 16-s1000
In-Reply-To: <c20354ec-abab-4c5a-94c1-ce1bbef5ce6f@free.fr>
Message-ID: <6b4da799-6d05-a71e-702e-6eedf999c596@linux.intel.com>
References: <c20354ec-abab-4c5a-94c1-ce1bbef5ce6f@free.fr>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jan 2025, Julien ROBIN wrote:

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
> Changes since v2:
> - Added 3 clearly named literal definitions, using them to avoid comments need
> - Changed zero filled array initialization syntax from { 0 } to {}
> - Removed blank lines between function calls and their associated error handling
> - Separated variable declarations and their assignment to function calls return
> 
> Changes since v1:
> - More clear description of 0xFF special effect when setting power limits
> - Added structs for clearer naming of power limits and GPU power modes settings
> - Retrieve and keep current GPU slowdown temp threshold (instead of hard coded)
> - Removed platform_profile_victus_s_get(), re-using platform_profile_omen_get()
> - Changed char variable types to u8 where it was more relevant
> - Moved some comments
> - Minor typo / alignment corrections
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 448 +++++++++++++++++++++++++++----
>  1 file changed, 399 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 20c55bab3b8c..3866f963e021 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -45,6 +45,10 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
>  #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
>  
> +#define HP_FAN_SPEED_AUTOMATIC	 0x00
> +#define HP_POWER_LIMIT_DEFAULT	 0x00
> +#define HP_POWER_LIMIT_NO_CHANGE 0xFF
> +
>  #define ACPI_AC_CLASS "ac_adapter"
>  
>  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
> @@ -83,11 +87,16 @@ static const char * const omen_timed_thermal_profile_boards[] = {
>  	"8BAD", "8A42", "8A15"
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
> @@ -147,12 +156,32 @@ enum hp_wmi_commandtype {
>  	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
>  };
>  
> +struct victus_power_limits {
> +	u8 pl1;
> +	u8 pl2;
> +	u8 pl4;
> +	u8 cpu_gpu_concurrent_limit;
> +};
> +
> +struct victus_gpu_power_modes {
> +	u8 ctgp_enable;
> +	u8 ppab_enable;
> +	u8 dstate;
> +	u8 gpu_slowdown_temp;
> +};
> +
>  enum hp_wmi_gm_commandtype {
> -	HPWMI_FAN_SPEED_GET_QUERY = 0x11,
> -	HPWMI_SET_PERFORMANCE_MODE = 0x1A,
> -	HPWMI_FAN_SPEED_MAX_GET_QUERY = 0x26,
> -	HPWMI_FAN_SPEED_MAX_SET_QUERY = 0x27,
> -	HPWMI_GET_SYSTEM_DESIGN_DATA = 0x28,
> +	HPWMI_FAN_SPEED_GET_QUERY		= 0x11,
> +	HPWMI_SET_PERFORMANCE_MODE		= 0x1A,
> +	HPWMI_FAN_SPEED_MAX_GET_QUERY		= 0x26,
> +	HPWMI_FAN_SPEED_MAX_SET_QUERY		= 0x27,
> +	HPWMI_GET_SYSTEM_DESIGN_DATA		= 0x28,
> +	HPWMI_FAN_COUNT_GET_QUERY		= 0x10,
> +	HPWMI_GET_GPU_THERMAL_MODES_QUERY	= 0x21,
> +	HPWMI_SET_GPU_THERMAL_MODES_QUERY	= 0x22,
> +	HPWMI_SET_POWER_LIMITS_QUERY		= 0x29,
> +	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY	= 0x2D,
> +	HPWMI_FAN_SPEED_SET_QUERY		= 0x2E,
>  };
>  
>  enum hp_wmi_command {
> @@ -211,6 +240,11 @@ enum hp_thermal_profile_victus {
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
> @@ -389,7 +423,6 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  
>  	bios_return = (struct bios_return *)obj->buffer.pointer;
>  	ret = bios_return->return_code;
> -
>  	if (ret) {

I understand why you made this change (because I told you it okay to 
improve the patch outside of my comments). But it doesn't mean we should 
try to do everything in the same patch.

I'm sorry for the extra confusion.

This change is good, but went you start to make changes entirely unrelated 
to the logical change you're making in this patch, you need to put them 
into a separate patch (and send a patch series). In general, we try to put 
only a single logical change into a single patch. Don't worry if it feels 
making patch series "larger", that is rarely a real problem but 
instead helps review by splitting things into more logical and focused 
chunks, it's easier to see an individual change is "correct".

There's some leeway and fuzziness in the minimal & logical rule. When you 
touch a line, in general, we expect the end result to conform to the 
latest coding style, up-to-date api use, etc. so it might not be required 
to split every single "unrelated" change out of a feature patch but some 
things are allowed to be made "while at it".

I'm personally not against in maintaining full logical splitting in a 
patch series but due to conflicts from touching the same lines over and 
over again, it's a bit pain to manage it. I try to largely do full loglcal 
split myself so I know the constants conflicts that need to be resolved 
even at the tiniests edits may make people prefer do things more "while at 
it". As long as it's not about some lines entirely unrelated to your main 
logical change, it's usually acceptable.

You also don't necessarily have to get every cleanup done in this series 
but can send more patches later if you feel like there's more things you 
want to do, so we can get the feature merged in sooner. But it's up to you 
which way you prefer :-).

>  		if (ret != HPWMI_RET_UNKNOWN_COMMAND &&
>  		    ret != HPWMI_RET_UNKNOWN_CMDTYPE)
> @@ -411,15 +444,35 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  	return ret;
>  }
>  
> +/*
> + * Calling this hp_wmi_get_fan_count_userdefine_trigger function also enables
> + * and/or maintains the laptop in user defined thermal and fan states, instead
> + * of using a fallback state. After a 120 seconds timeout however, the laptop
> + * goes back to its fallback state.
> + */
> +static int hp_wmi_get_fan_count_userdefine_trigger(void)
> +{
> +	u8 fan_data[4] = {};
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_FAN_COUNT_GET_QUERY, HPWMI_GM,
> +				   &fan_data, sizeof(u8),
> +				   sizeof(fan_data));
> +	if (ret != 0)
> +		return -EINVAL;
> +
> +	return fan_data[0]; /* Others bytes aren't providing fan count */
> +}
> +
>  static int hp_wmi_get_fan_speed(int fan)
>  {
>  	u8 fsh, fsl;
>  	char fan_data[4] = { fan, 0, 0, 0 };
> +	int ret;
>  
> -	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
> -				       &fan_data, sizeof(char),
> -				       sizeof(fan_data));
> -
> +	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
> +				   &fan_data, sizeof(char),
> +				   sizeof(fan_data));
>  	if (ret != 0)
>  		return -EINVAL;
>  
> @@ -429,13 +482,29 @@ static int hp_wmi_get_fan_speed(int fan)
>  	return (fsh << 8) | fsl;
>  }
>  
> +static int hp_wmi_get_fan_speed_victus_s(int fan)
> +{
> +	u8 fan_data[128] = {};
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY,
> +				   HPWMI_GM, &fan_data, sizeof(u8),
> +				   sizeof(fan_data));
> +	if (ret != 0)
> +		return -EINVAL;
> +
> +	if (fan >= 0 && fan < sizeof(fan_data))
> +		return fan_data[fan] * 100;
> +	else
> +		return -EINVAL;

I think the out-of-bound check should be done before even making the wmi 
query (and -EINVAL returned right away).

> +}
> +
>  static int hp_wmi_read_int(int query)
>  {
>  	int val = 0, ret;
>  
>  	ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
>  				   zero_if_sup(val), sizeof(val));
> -
>  	if (ret)

This too, belongs to the separate coding style change (and many others 
below too).

>  		return ret < 0 ? ret : -EINVAL;
>  
> @@ -444,8 +513,9 @@ static int hp_wmi_read_int(int query)
>  
>  static int hp_wmi_get_dock_state(void)
>  {
> -	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
> +	int state;
>  
> +	state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
>  	if (state < 0)
>  		return state;
>  
> @@ -454,7 +524,7 @@ static int hp_wmi_get_dock_state(void)
>  
>  static int hp_wmi_get_tablet_mode(void)
>  {
> -	char system_device_mode[4] = { 0 };
> +	char system_device_mode[4] = {};
>  	const char *chassis_type;
>  	bool tablet_found;
>  	int ret;
> @@ -489,7 +559,6 @@ static int omen_thermal_profile_set(int mode)
>  
>  	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
>  				   &buffer, sizeof(buffer), 0);
> -
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
>  
> @@ -510,7 +579,7 @@ static bool is_omen_thermal_profile(void)
>  
>  static int omen_get_thermal_policy_version(void)
>  {
> -	unsigned char buffer[8] = { 0 };
> +	unsigned char buffer[8] = {};
>  	int ret;
>  
>  	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
> @@ -525,7 +594,6 @@ static int omen_get_thermal_policy_version(void)
>  
>  	ret = hp_wmi_perform_query(HPWMI_GET_SYSTEM_DESIGN_DATA, HPWMI_GM,
>  				   &buffer, sizeof(buffer), sizeof(buffer));
> -
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
>  
> @@ -535,9 +603,9 @@ static int omen_get_thermal_policy_version(void)
>  static int omen_thermal_profile_get(void)
>  {
>  	u8 data;
> +	int ret;
>  
> -	int ret = ec_read(HP_OMEN_EC_THERMAL_PROFILE_OFFSET, &data);
> -
> +	ret = ec_read(HP_OMEN_EC_THERMAL_PROFILE_OFFSET, &data);
>  	if (ret)
>  		return ret;
>  
> @@ -550,20 +618,42 @@ static int hp_wmi_fan_speed_max_set(int enabled)
>  
>  	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
>  				   &enabled, sizeof(enabled), 0);
> -
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
>  
>  	return enabled;
>  }
>  
> +static int hp_wmi_fan_speed_reset(void)
> +{
> +	int ret;
> +	u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
> +
> +	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
> +				   &fan_speed, sizeof(fan_speed), 0);
> +
> +	return ret;
> +}
> +
> +static int hp_wmi_fan_speed_max_reset(void)
> +{
> +	int ret;
> +
> +	ret = hp_wmi_fan_speed_max_set(0);
> +	if (ret)
> +		return ret;
> +
> +	/* Disabling max fan speed on Victus s1xxx laptops needs a 2nd step: */
> +	ret = hp_wmi_fan_speed_reset();
> +	return ret;
> +}
> +
>  static int hp_wmi_fan_speed_max_get(void)
>  {
>  	int val = 0, ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
>  				   &val, zero_if_sup(val), sizeof(val));
> -
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
>  
> @@ -573,8 +663,10 @@ static int hp_wmi_fan_speed_max_get(void)
>  static int __init hp_wmi_bios_2008_later(void)
>  {
>  	int state = 0;
> -	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
> -				       zero_if_sup(state), sizeof(state));
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
> +				   zero_if_sup(state), sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -584,8 +676,10 @@ static int __init hp_wmi_bios_2008_later(void)
>  static int __init hp_wmi_bios_2009_later(void)
>  {
>  	u8 state[128];
> -	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
> -				       zero_if_sup(state), sizeof(state));
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
> +				   zero_if_sup(state), sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -595,8 +689,10 @@ static int __init hp_wmi_bios_2009_later(void)
>  static int __init hp_wmi_enable_hotkeys(void)
>  {
>  	int value = 0x6e;
> -	int ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, HPWMI_WRITE, &value,
> -				       sizeof(value), 0);
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_BIOS_QUERY, HPWMI_WRITE, &value,
> +				   sizeof(value), 0);
>  
>  	return ret <= 0 ? ret : -EINVAL;
>  }
> @@ -690,50 +786,60 @@ static int hp_wmi_rfkill2_refresh(void)
>  static ssize_t display_show(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
>  {
> -	int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
> +	int value;
>  
> +	value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
>  	if (value < 0)
>  		return value;
> +
>  	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
>  {
> -	int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
> +	int value;
>  
> +	value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
>  	if (value < 0)
>  		return value;
> +
>  	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  static ssize_t als_show(struct device *dev, struct device_attribute *attr,
>  			char *buf)
>  {
> -	int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
> +	int value;
>  
> +	value = hp_wmi_read_int(HPWMI_ALS_QUERY);
>  	if (value < 0)
>  		return value;
> +
>  	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
>  			 char *buf)
>  {
> -	int value = hp_wmi_get_dock_state();
> +	int value;
>  
> +	value = hp_wmi_get_dock_state();
>  	if (value < 0)
>  		return value;
> +
>  	return sysfs_emit(buf, "%d\n", value);
>  }
>  
>  static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
>  {
> -	int value = hp_wmi_get_tablet_mode();
> +	int value;
>  
> +	value = hp_wmi_get_tablet_mode();
>  	if (value < 0)
>  		return value;
> +
>  	return sysfs_emit(buf, "%d\n", value);
>  }
>  
> @@ -741,10 +847,12 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
>  	/* Get the POST error code of previous boot failure. */
> -	int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
> +	int value;
>  
> +	value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
>  	if (value < 0)
>  		return value;
> +
>  	return sysfs_emit(buf, "0x%x\n", value);
>  }
>  
> @@ -759,7 +867,7 @@ static ssize_t als_store(struct device *dev, struct device_attribute *attr,
>  		return ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_WRITE, &tmp,
> -				       sizeof(tmp), 0);
> +				   sizeof(tmp), 0);
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
>  
> @@ -782,7 +890,7 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
>  
>  	/* Clear the POST error code. It is kept until cleared. */
>  	ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_WRITE, &tmp,
> -				       sizeof(tmp), 0);
> +				   sizeof(tmp), 0);
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
>  
> @@ -1270,7 +1378,6 @@ static int platform_profile_omen_set_ec(enum platform_profile_option profile)
>  	enum hp_thermal_profile_omen_flags flags = 0;
>  
>  	tp_version = omen_get_thermal_policy_version();
> -
>  	if (tp_version < 0 || tp_version > 1)
>  		return -EOPNOTSUPP;
>  
> @@ -1405,8 +1512,9 @@ static int hp_wmi_platform_profile_set(struct platform_profile_handler *pprof,
>  
>  static bool is_victus_thermal_profile(void)
>  {
> -	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +	const char *board_name;
>  
> +	board_name = dmi_get_system_info(DMI_BOARD_NAME);
>  	if (!board_name)
>  		return false;
>  
> @@ -1472,6 +1580,161 @@ static int platform_profile_victus_set_ec(enum platform_profile_option profile)
>  	return 0;
>  }
>  
> +static bool is_victus_s_thermal_profile(void)
> +{
> +	const char *board_name;
> +
> +	board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +	if (!board_name)
> +		return false;
> +
> +	return match_string(victus_s_thermal_profile_boards,
> +			    ARRAY_SIZE(victus_s_thermal_profile_boards),
> +			    board_name) >= 0;
> +}
> +
> +static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
> +					    bool *ppab_enable,
> +					    u8 *dstate,
> +					    u8 *gpu_slowdown_temp)
> +{
> +	int ret;
> +	struct victus_gpu_power_modes gpu_power_modes;
> +
> +	ret = hp_wmi_perform_query(HPWMI_GET_GPU_THERMAL_MODES_QUERY, HPWMI_GM,
> +				   &gpu_power_modes, sizeof(gpu_power_modes),
> +				   sizeof(gpu_power_modes));
> +	if (ret == 0) {
> +		*ctgp_enable = gpu_power_modes.ctgp_enable ? true : false;
> +		*ppab_enable = gpu_power_modes.ppab_enable ? true : false;
> +		*dstate = gpu_power_modes.dstate;
> +		*gpu_slowdown_temp = gpu_power_modes.gpu_slowdown_temp;
> +	}
> +
> +	return ret;
> +}
> +
> +static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
> +					    bool ppab_enable,
> +					    u8 dstate)
> +{
> +	struct victus_gpu_power_modes gpu_power_modes;
> +	int ret;
> +
> +	bool current_ctgp_state, current_ppab_state;
> +	u8 current_dstate, current_gpu_slowdown_temp;
> +
> +	/* Retrieving GPU slowdown temperature, in order to keep it unchanged */
> +	ret = victus_s_gpu_thermal_profile_get(&current_ctgp_state,
> +					       &current_ppab_state,
> +					       &current_dstate,
> +					       &current_gpu_slowdown_temp);
> +	if (ret < 0) {
> +		pr_warn("GPU modes not updated, unable to get slowdown temp\n");
> +		return ret;
> +	}
> +
> +	gpu_power_modes.ctgp_enable = ctgp_enable ? 0x01 : 0x00;
> +	gpu_power_modes.ppab_enable = ppab_enable ? 0x01 : 0x00;
> +	gpu_power_modes.dstate = dstate;
> +	gpu_power_modes.gpu_slowdown_temp = current_gpu_slowdown_temp;
> +
> +
> +	ret = hp_wmi_perform_query(HPWMI_SET_GPU_THERMAL_MODES_QUERY, HPWMI_GM,
> +				   &gpu_power_modes, sizeof(gpu_power_modes), 0);
> +
> +	return ret;
> +}
> +
> +/* Note: providing 0x00 as PL1 and PL2 is restoring default values */

This should now refer to the new define, not 0x00.

> +static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
> +{
> +	int ret;
> +	struct victus_power_limits power_limits;
> +
> +	power_limits.pl1 = pl1;
> +	power_limits.pl2 = pl2;
> +	power_limits.pl4 = HP_POWER_LIMIT_NO_CHANGE;
> +	power_limits.cpu_gpu_concurrent_limit = HP_POWER_LIMIT_NO_CHANGE;
> +
> +	/* We need to know both PL1 and PL2 values in order to check them */
> +	if (pl1 == HP_POWER_LIMIT_NO_CHANGE || pl2 == HP_POWER_LIMIT_NO_CHANGE)
> +		return -EINVAL;
> +
> +	/* PL2 is not supposed to be lower than PL1 */
> +	if (pl2 < pl1)
> +		return -EINVAL;
> +
> +	ret = hp_wmi_perform_query(HPWMI_SET_POWER_LIMITS_QUERY, HPWMI_GM,
> +				   &power_limits, sizeof(power_limits), 0);
> +
> +	return ret;
> +}

-- 
 i.


> +
> +static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
> +{
> +	int err, tp;
> +	bool gpu_ctgp_enable, gpu_ppab_enable;
> +	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
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
> +		pr_err("Failed to set platform profile %d: %d\n", profile, err);
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
> +static int platform_profile_victus_s_set(struct platform_profile_handler *pprof,
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
>  static int platform_profile_victus_set(struct platform_profile_handler *pprof,
>  				       enum platform_profile_option profile)
>  {
> @@ -1511,7 +1774,6 @@ static int omen_powersource_event(struct notifier_block *nb,
>  		err = platform_profile_omen_get_ec(&actual_profile);
>  	else
>  		err = platform_profile_victus_get_ec(&actual_profile);
> -
>  	if (err < 0) {
>  		/*
>  		 * Although we failed to get the current platform profile, we
> @@ -1536,7 +1798,6 @@ static int omen_powersource_event(struct notifier_block *nb,
>  		err = platform_profile_omen_set_ec(active_platform_profile);
>  	else
>  		err = platform_profile_victus_set_ec(active_platform_profile);
> -
>  	if (err < 0) {
>  		pr_warn("Failed to restore platform profile (%d)\n", err);
>  		return NOTIFY_DONE;
> @@ -1545,13 +1806,59 @@ static int omen_powersource_event(struct notifier_block *nb,
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
> +	 * needs manual triggering of CPU power limits. Same goes when switching
> +	 * to AC power source while Performance mode is active. Other modes
> +	 * however are automatically behaving without any manual action.
> +	 * Seen on HP 16-s1034nf (board 8C9C) with F.11 and F.13 BIOS versions.
> +	 */
> +
> +	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
> +		pr_debug("Triggering CPU PL1/PL2 actualization\n");
> +		err = victus_s_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
> +					       HP_POWER_LIMIT_DEFAULT);
> +		if (err)
> +			pr_warn("Failed to actualize power limits: %d\n", err);
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
>  
>  	platform_power_source_nb.notifier_call = omen_powersource_event;
>  	err = register_acpi_notifier(&platform_power_source_nb);
> +	if (err < 0) {
> +		pr_warn("Failed to install ACPI power source notify handler\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int victus_s_register_powersource_event_handler(void)
> +{
> +	int err;
>  
> +	platform_power_source_nb.notifier_call = victus_s_powersource_event;
> +	err = register_acpi_notifier(&platform_power_source_nb);
>  	if (err < 0) {
>  		pr_warn("Failed to install ACPI power source notify handler\n");
>  		return err;
> @@ -1565,6 +1872,11 @@ static inline void omen_unregister_powersource_event_handler(void)
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
> @@ -1603,9 +1915,24 @@ static int thermal_profile_setup(void)
>  		platform_profile_handler.profile_set = platform_profile_victus_set;
>  
>  		set_bit(PLATFORM_PROFILE_QUIET, platform_profile_handler.choices);
> +	} else if (is_victus_s_thermal_profile()) {
> +		/*
> +		 * Being unable to retrieve laptop's current thermal profile,
> +		 * during this setup, we set it to Balanced by default.
> +		 */
> +		active_platform_profile = PLATFORM_PROFILE_BALANCED;
> +
> +		err = platform_profile_victus_s_set_ec(active_platform_profile);
> +		if (err < 0)
> +			return err;
> +
> +		platform_profile_handler.profile_get = platform_profile_omen_get;
> +		platform_profile_handler.profile_set = platform_profile_victus_s_set;
> +
> +		/* Adding an equivalent to HP Omen software ECO mode: */
> +		set_bit(PLATFORM_PROFILE_LOW_POWER, platform_profile_handler.choices);
>  	} else {
>  		tp = thermal_profile_get();
> -
>  		if (tp < 0)
>  			return tp;
>  
> @@ -1628,9 +1955,14 @@ static int thermal_profile_setup(void)
>  	set_bit(PLATFORM_PROFILE_PERFORMANCE, platform_profile_handler.choices);
>  
>  	err = platform_profile_register(&platform_profile_handler);
> -	if (err)
> +	if (err == -EEXIST) {
> +		pr_warn("A platform profile handler is already registered\n");
>  		return err;
> -
> +	} else if (err) {
> +		pr_err("Platform profile handler registration fail: %d\n", err);
> +		return err;
> +	}
> +	pr_info("Registered as platform profile handler\n");
>  	platform_profile_support = true;
>  
>  	return 0;
> @@ -1659,7 +1991,6 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  	}
>  
>  	err = hp_wmi_hwmon_init();
> -
>  	if (err < 0)
>  		return err;
>  
> @@ -1759,8 +2090,13 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
> @@ -1776,8 +2112,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  
>  	switch (type) {
>  	case hwmon_fan:
> -		ret = hp_wmi_get_fan_speed(channel);
> -
> +		if (is_victus_s_thermal_profile())
> +			ret = hp_wmi_get_fan_speed_victus_s(channel);
> +		else
> +			ret = hp_wmi_get_fan_speed(channel);
>  		if (ret < 0)
>  			return ret;
>  		*val = ret;
> @@ -1810,11 +2148,17 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  	case hwmon_pwm:
>  		switch (val) {
>  		case 0:
> +			if (is_victus_s_thermal_profile())
> +				hp_wmi_get_fan_count_userdefine_trigger();
>  			/* 0 is no fan speed control (max), which is 1 for us */
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
> @@ -1848,7 +2192,6 @@ static int hp_wmi_hwmon_init(void)
>  
>  	hwmon = devm_hwmon_device_register_with_info(dev, "hp", &hp_wmi_driver,
>  						     &chip_info, NULL);
> -
>  	if (IS_ERR(hwmon)) {
>  		dev_err(dev, "Could not register hp hwmon device\n");
>  		return PTR_ERR(hwmon);
> @@ -1893,6 +2236,10 @@ static int __init hp_wmi_init(void)
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
> @@ -1912,6 +2259,9 @@ static void __exit hp_wmi_exit(void)
>  	if (is_omen_thermal_profile() || is_victus_thermal_profile())
>  		omen_unregister_powersource_event_handler();
>  
> +	if (is_victus_s_thermal_profile())
> +		victus_s_unregister_powersource_event_handler();
> +
>  	if (wmi_has_guid(HPWMI_EVENT_GUID))
>  		hp_wmi_input_destroy();
>  
> 

