Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11697191F84
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770900694; cv=none; b=cfxQxV3X+iVPuAi7ZzG8g2A+zXOitsi9MFKyvWIkFAIn85uI4r4WoD0JGmuRvgkFZim6qx40yI2CbWC/9uzKfefM76H3NN//iGNtZ8gEiCwtX8aaOCE+rrbybafOiqS+c5uiQhtgdeS1xfxx7jjkhi5AVJVL1M1wyrOBfgE2b34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770900694; c=relaxed/simple;
	bh=/90/eFAcfRtZ15uYEle0RH/iFMAIrz8jepTKZSrvigk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ud3v7Lvsta2uThSx4yDBB1kSU57S442AUrJrc7ijVKN0f71+Jvn3SjnT3p9jkmN91en4Q2w4AVMGhVMhwMBY+tn2LaZzS58zHUXDTOdFUrIEvxonM9NS3QgbBLikSQyZeeHABctSIh9AXYt8m3dmkElLDtHASFz4T0tziSvlCsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWSYmvyo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWSYmvyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770900692; x=1802436692;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/90/eFAcfRtZ15uYEle0RH/iFMAIrz8jepTKZSrvigk=;
  b=SWSYmvyo+j0akeEXBp9COlyu/vAQ5zuDoUgiJ9dENY4yGaIr7zm6Z7N4
   Mod2+Ael7DgW5mOw8PC53M6cslVfmGLZ63SR48TQzkYduSm+hoRU9HMFW
   It7T6DgB+cEp6f2KabPPcjeVEOtB2YhXyIqw7w38OxdN/xyJZus+OBsgA
   Lz8ckWrbQpYGmL/2EAa2qTd2BVaDpl8Uq+O0NHVFQ/N1e5z7v4nkWRWZ8
   83sYWeqB5rUff5zMQOv2uM1N7vE0aMJkEcpjtZ9qAJtaGIztURhhQXmTR
   gv8XArWR/IXhlPW5I2ORZRXsO3iZLA4jtCe04seBqFLbpHYTnUrfiX03z
   A==;
X-CSE-ConnectionGUID: f/EQJh8DRvy9Dp1IA4Cwsw==
X-CSE-MsgGUID: rdN3so7kQR2cW3pAPmjTLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72059484"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="72059484"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 04:51:31 -0800
X-CSE-ConnectionGUID: ebXm4USoRNaq41voAphPdw==
X-CSE-MsgGUID: LomjG1INQEKAOdNykxMADA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.159])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 04:51:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 12 Feb 2026 14:51:25 +0200 (EET)
To: Sharwesh05 <sharweshraajan@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    sharweshlinux@gmail.com
Subject: Re: [PATCH] platform/x86: hp-wmi: add OMEN v1 (8BCD) Insyde firmware
 support
In-Reply-To: <20260211103939.23067-1-sharweshraajan@gmail.com>
Message-ID: <18616c3e-8974-0469-b9c5-e6d952b235a3@linux.intel.com>
References: <20260211103939.23067-1-sharweshraajan@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Feb 2026, Sharwesh05 wrote:

> From: Sharan Kumar M <sharweshraajan@gmail.com>
> 
> This patch integrates BIOS-specific command handling and
> platform detection for newer Insyde-based systems, along
> with minor related cleanups.
> 
> 
> Signed-off-by: Sharan Kumar M <sharweshraajan@gmail.com>

Is this a v2? Why is it not marked as such.

Many of my comments I gave earlier were not addressed properly!?! :-(

Please don't submit "updates" without addressing the review comments 
first. If you think some of my review comments were not possible to 
implement, you should state so, it's not okay to silently ignore review 
comments like this.

-- 
 i.

> 
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 758 ++++++++++++++++++++++++-------
>  1 file changed, 584 insertions(+), 174 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index f4ea1ea059..e31a55c75c 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -45,6 +45,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
>  #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
>  
> +#define HP_WMI_FAN_SPEED_LIMIT 67
>  #define HP_FAN_SPEED_AUTOMATIC	 0x00
>  #define HP_POWER_LIMIT_DEFAULT	 0x00
>  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
> @@ -93,6 +94,13 @@ static const char * const omen_timed_thermal_profile_boards[] = {
>  	"8BAD",
>  };
>  
> +/* DMI board names of Omen laptops that have a thermal profile timer
> + * and cannot be controlled by ec
> + */
> +static const char * const thermal_profile_v1_boards[] = {
> +	"8BCD",
> +};
> +
>  /* DMI Board names of Victus 16-d1xxx laptops */
>  static const char * const victus_thermal_profile_boards[] = {
>  	"8A25",
> @@ -105,6 +113,33 @@ static const char * const victus_s_thermal_profile_boards[] = {
>  	"8D41",
>  };
>  
> +/*
> + * FANMODE_Lx values were reverse-engineered by observing EC/WMI
> + * calls made by HP Omen Gaming Hub under Windows.
> + */
> +enum hp_fan_mode {
> +	FANMODE_LEGACY_DEFAULT     =  0x00,
> +	FANMODE_LEGACY_PERFORMANCE =  0x01,
> +	FANMODE_LEGACY_COOL        =  0x02,
> +	FANMODE_LEGACY_QUIET       =  0x03,
> +	FANMODE_LEGACY_EXTREME     =  0x04,
> +	FANMODE_L8                 =  0x04,
> +	FANMODE_L0                 =  0x10,
> +	FANMODE_L5                 =  0x11,
> +	FANMODE_L1                 =  0x20,
> +	FANMODE_L6                 =  0x21,
> +	FANMODE_L2                 =  0x30,
> +	FANMODE_L7                 =  0x31,
> +	FANMODE_L3                 =  0x40,
> +	FANMODE_L4                 =  0x50,
> +};
> +
> +enum hp_gpu_mode {
> +	GPUMODE_HYBRID   = 0x00,  // 0x00 - Hybrid graphics mode (or BIOS call failed)
> +	GPUMODE_DISCRETE = 0x01,  // 0x01 - Discrete GPU exclusive mode
> +	GPUMODE_OPTIMUS  = 0x02   // 0x02 - NVIDIA Optimus mode
> +};
> +
>  enum hp_wmi_radio {
>  	HPWMI_WIFI	= 0x0,
>  	HPWMI_BLUETOOTH	= 0x1,
> @@ -165,39 +200,70 @@ enum hp_wmi_commandtype {
>  	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
>  };
>  
> -struct victus_power_limits {
> +/* these hp_power_limits and hp_gpu_power_modes
> + * functions are standard for all hp laptops
> + */
> +struct hp_power_limits {
>  	u8 pl1;
>  	u8 pl2;
>  	u8 pl4;
>  	u8 cpu_gpu_concurrent_limit;
>  };
>  
> -struct victus_gpu_power_modes {
> +struct hp_gpu_power_modes {
>  	u8 ctgp_enable;
>  	u8 ppab_enable;
>  	u8 dstate;
>  	u8 gpu_slowdown_temp;
>  };
>  
> +/*
> + * HPWMI GM (General Method) command identifiers.
> + *
> + * HP laptops ship with different firmware implementations depending
> + * on the BIOS vendor. In practice, HP mainly uses:
> + *
> + *  - AMI-based BIOS: common on older and some consumer platforms
> + *  - Insyde-based BIOS: common on newer OMEN / Victus platforms
> + *
> + * While the WMI GUID remains the same, the command IDs and payload
> + * formats differ between these firmware implementations. The command
> + * names below reflect the firmware variant they are known to work with.
> + */
>  enum hp_wmi_gm_commandtype {
> -	HPWMI_FAN_SPEED_GET_QUERY		= 0x11,
> +	HPWMI_AMI_FAN_SPEED_GET_QUERY		= 0x11,
>  	HPWMI_SET_PERFORMANCE_MODE		= 0x1A,
>  	HPWMI_FAN_SPEED_MAX_GET_QUERY		= 0x26,
>  	HPWMI_FAN_SPEED_MAX_SET_QUERY		= 0x27,
>  	HPWMI_GET_SYSTEM_DESIGN_DATA		= 0x28,
> +	HPWMI_INSYDE_FAN_SPEED_GET_QUERY	= 0x2D,
> +	HPWMI_INSYDE_FAN_SPEED_SET_QUERY	= 0x2E,
>  	HPWMI_FAN_COUNT_GET_QUERY		= 0x10,
>  	HPWMI_GET_GPU_THERMAL_MODES_QUERY	= 0x21,
>  	HPWMI_SET_GPU_THERMAL_MODES_QUERY	= 0x22,
>  	HPWMI_SET_POWER_LIMITS_QUERY		= 0x29,
> -	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY	= 0x2D,
> -	HPWMI_FAN_SPEED_SET_QUERY		= 0x2E,
> +	HPWMI_GET_TEMPERATURE_QUERY		= 0x23,
> +	HPWMI_FAN_TABLE_GET_QUERY		= 0x2F,
> +	HPWMI_FAN_TABLE_SET_QUERY		= 0x32,
> +	HPWMI_CPU_POWER_SET_QUERY		= 0X29,
> +	HPWMI_GPU_POWER_QUERY			= 0X52, //mux status
> +	HPWMI_ADAPTER_QUERY			= 0x0F,
> +	HPWMI_GET_BACKLIGHT			= 0x04,
> +	HPWMI_SET_BACKLIGHT			= 0x05,
> +};
> +
> +enum hp_wmi_backlight {
> +	BACKLIGHT_OFF = 0x64,
> +	BACKLIGHT_ON  = 0xE4,
>  };
>  
>  enum hp_wmi_command {
> -	HPWMI_READ	= 0x01,
> -	HPWMI_WRITE	= 0x02,
> +	HPWMI_READ	= 0x01, // Earliest implemented
> +	HPWMI_WRITE	= 0x02, // Graphics mode switch
>  	HPWMI_ODM	= 0x03,
> -	HPWMI_GM	= 0x20008,
> +	HPWMI_GM	= 0x20008, // Most commands {working so running in this}
> +	HPWMI_GM_v2 = 0X20009, //Current Implementation {development going on}
> +	HPWMI_GM_v3 = 0X2000b, //typeC status
>  };
>  
>  enum hp_wmi_hardware_mask {
> @@ -225,42 +291,12 @@ enum hp_wireless2_bits {
>  	HPWMI_POWER_FW_OR_HW	= HPWMI_POWER_BIOS | HPWMI_POWER_HARD,
>  };
>  
> -enum hp_thermal_profile_omen_v0 {
> -	HP_OMEN_V0_THERMAL_PROFILE_DEFAULT     = 0x00,
> -	HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE = 0x01,
> -	HP_OMEN_V0_THERMAL_PROFILE_COOL        = 0x02,
> -};
> -
> -enum hp_thermal_profile_omen_v1 {
> -	HP_OMEN_V1_THERMAL_PROFILE_DEFAULT	= 0x30,
> -	HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE	= 0x31,
> -	HP_OMEN_V1_THERMAL_PROFILE_COOL		= 0x50,
> -};
> -
>  enum hp_thermal_profile_omen_flags {
>  	HP_OMEN_EC_FLAGS_TURBO		= 0x04,
>  	HP_OMEN_EC_FLAGS_NOTIMER	= 0x02,
>  	HP_OMEN_EC_FLAGS_JUSTSET	= 0x01,
>  };
>  
> -enum hp_thermal_profile_victus {
> -	HP_VICTUS_THERMAL_PROFILE_DEFAULT		= 0x00,
> -	HP_VICTUS_THERMAL_PROFILE_PERFORMANCE		= 0x01,
> -	HP_VICTUS_THERMAL_PROFILE_QUIET			= 0x03,
> -};
> -
> -enum hp_thermal_profile_victus_s {
> -	HP_VICTUS_S_THERMAL_PROFILE_DEFAULT		= 0x00,
> -	HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE		= 0x01,
> -};
> -
> -enum hp_thermal_profile {
> -	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
> -	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> -	HP_THERMAL_PROFILE_COOL			= 0x02,
> -	HP_THERMAL_PROFILE_QUIET		= 0x03,
> -};
> -
>  #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
>  #define IS_SWBLOCKED(x) !(x & HPWMI_POWER_SOFT)
>  
> @@ -455,12 +491,17 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  }
>  
>  /*
> - * Calling this hp_wmi_get_fan_count_userdefine_trigger function also enables
> - * and/or maintains the laptop in user defined thermal and fan states, instead
> - * of using a fallback state. After a 120 seconds timeout however, the laptop
> - * goes back to its fallback state.
> + * Calling this function queries the firmware for the number of fans.
> + *
> + * On some HP platforms, issuing this query also enables and maintains
> + * user-selected thermal and fan control modes, preventing the firmware
> + * from falling back to its default thermal behavior.
> + *
> + * On new systems, the firmware has been observed to revert to the
> + * fallback state if this query is not issued for approximately 120
> + * seconds. This timeout is firmware-defined and undocumented.
>   */
> -static int hp_wmi_get_fan_count_userdefine_trigger(void)
> +static int hp_wmi_get_fan_count(void)
>  {
>  	u8 fan_data[4] = {};
>  	int ret;
> @@ -471,15 +512,26 @@ static int hp_wmi_get_fan_count_userdefine_trigger(void)
>  	if (ret != 0)
>  		return -EINVAL;
>  
> -	return fan_data[0]; /* Others bytes aren't providing fan count */
> +	pr_debug("Refreshing firmware fan/thermal control state\n");
> +	/*
> +	 * fan_data[0] returns a firmware-defined status value.
> +	 *
> +	 * Observed values:
> +	 *   0 - Normal operation / no protection active
> +	 *   1 - OCP (Over-Current Protection) active
> +	 *   2 - OTP (Over-Temperature Protection) active
> +	 *
> +	 * Exact semantics are undocumented and may vary by platform.
> +	 */
> +	return fan_data[0];
>  }
>  
> -static int hp_wmi_get_fan_speed(int fan)
> +static int hp_wmi_get_fan_speed_ami(int fan)
>  {
>  	u8 fsh, fsl;
>  	char fan_data[4] = { fan, 0, 0, 0 };
>  
> -	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
> +	int ret = hp_wmi_perform_query(HPWMI_AMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
>  				       &fan_data, sizeof(char),
>  				       sizeof(fan_data));
>  
> @@ -492,7 +544,7 @@ static int hp_wmi_get_fan_speed(int fan)
>  	return (fsh << 8) | fsl;
>  }
>  
> -static int hp_wmi_get_fan_speed_victus_s(int fan)
> +static int hp_wmi_get_fan_speed_insyde(int fan)
>  {
>  	u8 fan_data[128] = {};
>  	int ret;
> @@ -500,15 +552,139 @@ static int hp_wmi_get_fan_speed_victus_s(int fan)
>  	if (fan < 0 || fan >= sizeof(fan_data))
>  		return -EINVAL;
>  
> -	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY,
> -				   HPWMI_GM, &fan_data, sizeof(u8),
> -				   sizeof(fan_data));
> +	ret = hp_wmi_perform_query(HPWMI_INSYDE_FAN_SPEED_GET_QUERY, HPWMI_GM,
> +					&fan_data, sizeof(u8), sizeof(fan_data));
> +
>  	if (ret != 0)
>  		return -EINVAL;
>  
>  	return fan_data[fan] * 100;
>  }
>  
> +static int hp_wmi_set_fan_speed(int cpu, int gpu)
> +{
> +	u8 fan_speed[2] = { cpu, gpu };
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_INSYDE_FAN_SPEED_SET_QUERY, HPWMI_GM,
> +				   &fan_speed, sizeof(fan_speed), 0);
> +
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
> +	return ret;
> +}
> +
> +static int hp_wmi_fan_speed_max_set(int enabled)
> +{
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
> +				   &enabled, sizeof(enabled), 0);
> +
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
> +	return enabled;
> +}
> +
> +static int hp_wmi_fan_speed_max_get(void)
> +{
> +	int val = 0, ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> +				   &val, zero_if_sup(val), sizeof(val));
> +
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
> +	return val;
> +}
> +
> +static int hp_wmi_fan_speed_reset(void)
> +{
> +	u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_INSYDE_FAN_SPEED_SET_QUERY, HPWMI_GM,
> +				   &fan_speed, sizeof(fan_speed), 0);
> +
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
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
> +	/* Disabling max fan speed on Insyde laptops needs a 2nd step: */
> +	ret = hp_wmi_fan_speed_reset();
> +
> +	return ret;
> +}
> +
> +static int hp_wmi_get_backlight(void)
> +{
> +	int ret;
> +	u8 data[4] = {};
> +
> +	ret = hp_wmi_perform_query(HPWMI_GET_BACKLIGHT, HPWMI_GM_v2,
> +				   &data, sizeof(u8), sizeof(data));
> +
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
> +	return (data[0] == 0x00) ? 0 : 1;
> +}
> +
> +static int hp_wmi_set_backlight(enum hp_wmi_backlight enabled)
> +{
> +	int ret;
> +	u8 data[4] = { enabled, 0, 0, 0 };
> +
> +	ret = hp_wmi_perform_query(HPWMI_SET_BACKLIGHT, HPWMI_GM_v2,
> +				   &data, sizeof(data), 0);
> +
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
> +	return ret;
> +}
> +
> +static int hp_wmi_get_gpumode(void)
> +{
> +	int ret;
> +	u8 data[4] = {};
> +
> +	ret = hp_wmi_perform_query(HPWMI_GPU_POWER_QUERY, HPWMI_READ,
> +				   &data, sizeof(data), sizeof(data));
> +
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
> +	return ret;
> +}
> +
> +static int hp_wmi_set_gpumode(enum hp_gpu_mode enabled)
> +{
> +	int ret;
> +	u8 data[4] = { enabled, 0x00, 0x00, 0x00 };
> +
> +	ret = hp_wmi_perform_query(HPWMI_GPU_POWER_QUERY, HPWMI_WRITE,
> +				   &data, sizeof(data), 0);
> +
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
> +	return 1;
> +}
> +
>  static int hp_wmi_read_int(int query)
>  {
>  	int val = 0, ret;
> @@ -564,7 +740,7 @@ static int omen_thermal_profile_set(int mode)
>  	 * 255, so let's mimic this behaviour to be as close as possible to
>  	 * the original software.
>  	 */
> -	char buffer[2] = {-1, mode};
> +	char buffer[2] = { -1, mode };
>  	int ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
> @@ -624,56 +800,6 @@ static int omen_thermal_profile_get(void)
>  	return data;
>  }
>  
> -static int hp_wmi_fan_speed_max_set(int enabled)
> -{
> -	int ret;
> -
> -	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
> -				   &enabled, sizeof(enabled), 0);
> -
> -	if (ret)
> -		return ret < 0 ? ret : -EINVAL;
> -
> -	return enabled;
> -}
> -
> -static int hp_wmi_fan_speed_reset(void)
> -{
> -	u8 fan_speed[2] = { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };
> -	int ret;
> -
> -	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_SET_QUERY, HPWMI_GM,
> -				   &fan_speed, sizeof(fan_speed), 0);
> -
> -	return ret;
> -}
> -
> -static int hp_wmi_fan_speed_max_reset(void)
> -{
> -	int ret;
> -
> -	ret = hp_wmi_fan_speed_max_set(0);
> -	if (ret)
> -		return ret;
> -
> -	/* Disabling max fan speed on Victus s1xxx laptops needs a 2nd step: */
> -	ret = hp_wmi_fan_speed_reset();
> -	return ret;
> -}
> -
> -static int hp_wmi_fan_speed_max_get(void)
> -{
> -	int val = 0, ret;
> -
> -	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> -				   &val, zero_if_sup(val), sizeof(val));
> -
> -	if (ret)
> -		return ret < 0 ? ret : -EINVAL;
> -
> -	return val;
> -}
> -
>  static int __init hp_wmi_bios_2008_later(void)
>  {
>  	int state = 0;
> @@ -791,6 +917,69 @@ static int hp_wmi_rfkill2_refresh(void)
>  	return 0;
>  }
>  
> +static ssize_t systemdesign_show(struct device *dev, struct device_attribute *attr,
> +				char *buf)
> +{
> +	int ret;
> +	u8 buffer[128];
> +
> +	ret = hp_wmi_perform_query(HPWMI_GET_SYSTEM_DESIGN_DATA, HPWMI_GM,
> +					buffer, sizeof(buffer), sizeof(buffer));
> +	if (ret < 0)
> +		return ret;
> +	return sysfs_emit(buf, "%*ph\n", (int)sizeof(buffer), buffer);
> +}
> +
> +static ssize_t adapter_show(struct device *dev, struct device_attribute *attr,
> +				char *buf)
> +{
> +	int ret = hp_wmi_read_int(HPWMI_ADAPTER_QUERY);
> +
> +	if (ret < 0)
> +		return -EINVAL;
> +	return sysfs_emit(buf, "%02X\n", ret);
> +}
> +
> +static ssize_t mux_show(struct device *dev, struct device_attribute *attr,
> +				char *buf)
> +{
> +	int ret = hp_wmi_get_gpumode();
> +
> +	if (ret < 0)
> +		return ret;
> +	return sysfs_emit(buf, "%d\n", ret);
> +}
> +
> +static ssize_t fancount_show(struct device *dev, struct device_attribute *attr,
> +				char *buf)
> +{
> +	int ret = hp_wmi_get_fan_count();
> +
> +	if (ret < 0)
> +		return ret;
> +	return sysfs_emit(buf, "fancount : %d\n", ret);
> +}
> +
> +static ssize_t fanspeed_show(struct device *dev, struct device_attribute *attr,
> +				char *buf)
> +{
> +	int speed = hp_wmi_get_fan_speed_insyde(0);
> +
> +	if (speed < 0)
> +		return speed;
> +	return sysfs_emit(buf, "speed : %d\n", speed);
> +}
> +
> +static ssize_t backlight_show(struct device *dev, struct device_attribute *attr,
> +				char *buf)
> +{
> +	int ret = hp_wmi_get_backlight();
> +
> +	if (ret < 0)
> +		return ret;
> +	return sysfs_emit(buf, "backlight : %d\n", ret);
> +}
> +
>  static ssize_t display_show(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
>  {
> @@ -852,6 +1041,69 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
>  	return sysfs_emit(buf, "0x%x\n", value);
>  }
>  
> +static ssize_t backlight_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	bool enable;
> +	int ret;
> +
> +	/* To set bios-protection state to 0 */
> +	hp_wmi_get_fan_count();
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	if (enable)
> +		hp_wmi_set_backlight(BACKLIGHT_ON);
> +	else
> +		hp_wmi_set_backlight(BACKLIGHT_OFF);
> +
> +	return count;
> +}
> +
> +static ssize_t mux_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	int ret;
> +	int enable;
> +
> +	/* To set bios-protection state to 0 */
> +	hp_wmi_get_fan_count();
> +
> +	ret = kstrtoint(buf, 10, &enable);
> +	if (ret)
> +		return ret;
> +
> +	if (ret > 2)
> +		return ret;
> +
> +	ret = hp_wmi_set_gpumode(enable);
> +	if (ret)
> +		return ret;
> +	pr_debug("mux mode is now set to: %d\n", enable);
> +	return count;
> +}
> +
> +static ssize_t fanspeed_store(struct device *dev, struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	int fan;
> +	int ret;
> +
> +	ret = kstrtoint(buf, 16, &fan);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (fan == 0)
> +		hp_wmi_set_fan_speed(0, 0);
> +
> +	/* 67*100 is the maximum RPM known for HP laptops */
> +	if (fan > 0 && fan < HP_WMI_FAN_SPEED_LIMIT-3)
> +		/* The GPU fan RPM is 300 RPM higher than the CPU fan RPM. */
> +		hp_wmi_set_fan_speed(fan, fan+3);
> +	return count;
> +}
> +
>  static ssize_t als_store(struct device *dev, struct device_attribute *attr,
>  			 const char *buf, size_t count)
>  {
> @@ -926,8 +1178,20 @@ static DEVICE_ATTR_RW(als);
>  static DEVICE_ATTR_RO(dock);
>  static DEVICE_ATTR_RO(tablet);
>  static DEVICE_ATTR_RW(postcode);
> +static DEVICE_ATTR_RW(backlight);
> +static DEVICE_ATTR_RO(fancount);
> +static DEVICE_ATTR_RW(fanspeed);
> +static DEVICE_ATTR_RO(systemdesign);
> +static DEVICE_ATTR_RW(mux);
> +static DEVICE_ATTR_RO(adapter);
>  
>  static struct attribute *hp_wmi_attrs[] = {
> +	&dev_attr_backlight.attr,
> +	&dev_attr_mux.attr,
> +	&dev_attr_adapter.attr,
> +	&dev_attr_fancount.attr,
> +	&dev_attr_fanspeed.attr,
> +	&dev_attr_systemdesign.attr,
>  	&dev_attr_display.attr,
>  	&dev_attr_hddtemp.attr,
>  	&dev_attr_als.attr,
> @@ -1309,16 +1573,16 @@ static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
>  		return tp;
>  
>  	switch (tp) {
> -	case HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE:
> -	case HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE:
> +	case FANMODE_LEGACY_PERFORMANCE:
> +	case FANMODE_L7:
>  		*profile = PLATFORM_PROFILE_PERFORMANCE;
>  		break;
> -	case HP_OMEN_V0_THERMAL_PROFILE_DEFAULT:
> -	case HP_OMEN_V1_THERMAL_PROFILE_DEFAULT:
> +	case FANMODE_LEGACY_DEFAULT:
> +	case FANMODE_L2:
>  		*profile = PLATFORM_PROFILE_BALANCED;
>  		break;
> -	case HP_OMEN_V0_THERMAL_PROFILE_COOL:
> -	case HP_OMEN_V1_THERMAL_PROFILE_COOL:
> +	case FANMODE_LEGACY_COOL:
> +	case FANMODE_L4:
>  		*profile = PLATFORM_PROFILE_COOL;
>  		break;
>  	default:
> @@ -1384,21 +1648,21 @@ static int platform_profile_omen_set_ec(enum platform_profile_option profile)
>  	switch (profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
>  		if (tp_version == 0)
> -			tp = HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE;
> +			tp = FANMODE_LEGACY_PERFORMANCE;
>  		else
> -			tp = HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE;
> +			tp = FANMODE_L7;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
>  		if (tp_version == 0)
> -			tp = HP_OMEN_V0_THERMAL_PROFILE_DEFAULT;
> +			tp = FANMODE_LEGACY_DEFAULT;
>  		else
> -			tp = HP_OMEN_V1_THERMAL_PROFILE_DEFAULT;
> +			tp = FANMODE_L2;
>  		break;
>  	case PLATFORM_PROFILE_COOL:
>  		if (tp_version == 0)
> -			tp = HP_OMEN_V0_THERMAL_PROFILE_COOL;
> +			tp = FANMODE_LEGACY_COOL;
>  		else
> -			tp = HP_OMEN_V1_THERMAL_PROFILE_COOL;
> +			tp = FANMODE_L4;
>  		break;
>  	default:
>  		return -EOPNOTSUPP;
> @@ -1462,16 +1726,16 @@ static int hp_wmi_platform_profile_get(struct device *dev,
>  		return tp;
>  
>  	switch (tp) {
> -	case HP_THERMAL_PROFILE_PERFORMANCE:
> +	case FANMODE_LEGACY_DEFAULT:
>  		*profile =  PLATFORM_PROFILE_PERFORMANCE;
>  		break;
> -	case HP_THERMAL_PROFILE_DEFAULT:
> +	case FANMODE_LEGACY_PERFORMANCE:
>  		*profile =  PLATFORM_PROFILE_BALANCED;
>  		break;
> -	case HP_THERMAL_PROFILE_COOL:
> +	case FANMODE_LEGACY_COOL:
>  		*profile =  PLATFORM_PROFILE_COOL;
>  		break;
> -	case HP_THERMAL_PROFILE_QUIET:
> +	case FANMODE_LEGACY_QUIET:
>  		*profile = PLATFORM_PROFILE_QUIET;
>  		break;
>  	default:
> @@ -1488,16 +1752,16 @@ static int hp_wmi_platform_profile_set(struct device *dev,
>  
>  	switch (profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
> -		tp =  HP_THERMAL_PROFILE_PERFORMANCE;
> +		tp =  FANMODE_LEGACY_DEFAULT;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		tp =  HP_THERMAL_PROFILE_DEFAULT;
> +		tp =  FANMODE_LEGACY_PERFORMANCE;
>  		break;
>  	case PLATFORM_PROFILE_COOL:
> -		tp =  HP_THERMAL_PROFILE_COOL;
> +		tp =  FANMODE_LEGACY_COOL;
>  		break;
>  	case PLATFORM_PROFILE_QUIET:
> -		tp = HP_THERMAL_PROFILE_QUIET;
> +		tp = FANMODE_LEGACY_QUIET;
>  		break;
>  	default:
>  		return -EOPNOTSUPP;
> @@ -1531,13 +1795,13 @@ static int platform_profile_victus_get_ec(enum platform_profile_option *profile)
>  		return tp;
>  
>  	switch (tp) {
> -	case HP_VICTUS_THERMAL_PROFILE_PERFORMANCE:
> +	case FANMODE_LEGACY_PERFORMANCE:
>  		*profile = PLATFORM_PROFILE_PERFORMANCE;
>  		break;
> -	case HP_VICTUS_THERMAL_PROFILE_DEFAULT:
> +	case FANMODE_LEGACY_DEFAULT:
>  		*profile = PLATFORM_PROFILE_BALANCED;
>  		break;
> -	case HP_VICTUS_THERMAL_PROFILE_QUIET:
> +	case FANMODE_LEGACY_QUIET:
>  		*profile = PLATFORM_PROFILE_QUIET;
>  		break;
>  	default:
> @@ -1560,13 +1824,13 @@ static int platform_profile_victus_set_ec(enum platform_profile_option profile)
>  
>  	switch (profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
> -		tp = HP_VICTUS_THERMAL_PROFILE_PERFORMANCE;
> +		tp = FANMODE_LEGACY_PERFORMANCE;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		tp = HP_VICTUS_THERMAL_PROFILE_DEFAULT;
> +		tp = FANMODE_LEGACY_DEFAULT;
>  		break;
>  	case PLATFORM_PROFILE_QUIET:
> -		tp = HP_VICTUS_THERMAL_PROFILE_QUIET;
> +		tp = FANMODE_LEGACY_QUIET;
>  		break;
>  	default:
>  		return -EOPNOTSUPP;
> @@ -1592,12 +1856,12 @@ static bool is_victus_s_thermal_profile(void)
>  			    board_name) >= 0;
>  }
>  
> -static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
> +static int hp_wmi_gpu_thermal_profile_get(bool *ctgp_enable,
>  					    bool *ppab_enable,
>  					    u8 *dstate,
>  					    u8 *gpu_slowdown_temp)
>  {
> -	struct victus_gpu_power_modes gpu_power_modes;
> +	struct hp_gpu_power_modes gpu_power_modes;
>  	int ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_GET_GPU_THERMAL_MODES_QUERY, HPWMI_GM,
> @@ -1613,18 +1877,43 @@ static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
>  	return ret;
>  }
>  
> -static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
> +/* Note: HP_POWER_LIMIT_DEFAULT can be used to restore default PL1 and PL2 */
> +static int hp_wmi_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
> +{
> +	struct hp_power_limits power_limits;
> +	int ret;
> +
> +	/* We need to know both PL1 and PL2 values in order to check them */
> +	if (pl1 == HP_POWER_LIMIT_NO_CHANGE || pl2 == HP_POWER_LIMIT_NO_CHANGE)
> +		return -EINVAL;
> +
> +	/* PL2 is not supposed to be lower than PL1 */
> +	if (pl2 < pl1)
> +		return -EINVAL;
> +
> +	power_limits.pl1 = pl1;
> +	power_limits.pl2 = pl2;
> +	power_limits.pl4 = HP_POWER_LIMIT_NO_CHANGE;
> +	power_limits.cpu_gpu_concurrent_limit = HP_POWER_LIMIT_NO_CHANGE;
> +
> +	ret = hp_wmi_perform_query(HPWMI_CPU_POWER_SET_QUERY, HPWMI_GM,
> +				   &power_limits, sizeof(power_limits), 0);
> +
> +	return ret;
> +}
> +
> +static int hp_wmi_gpu_thermal_profile_set(bool ctgp_enable,
>  					    bool ppab_enable,
>  					    u8 dstate)
>  {
> -	struct victus_gpu_power_modes gpu_power_modes;
> +	struct hp_gpu_power_modes gpu_power_modes;
>  	int ret;
>  
>  	bool current_ctgp_state, current_ppab_state;
>  	u8 current_dstate, current_gpu_slowdown_temp;
>  
>  	/* Retrieving GPU slowdown temperature, in order to keep it unchanged */
> -	ret = victus_s_gpu_thermal_profile_get(&current_ctgp_state,
> +	ret = hp_wmi_gpu_thermal_profile_get(&current_ctgp_state,
>  					       &current_ppab_state,
>  					       &current_dstate,
>  					       &current_gpu_slowdown_temp);
> @@ -1645,31 +1934,6 @@ static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
>  	return ret;
>  }
>  
> -/* Note: HP_POWER_LIMIT_DEFAULT can be used to restore default PL1 and PL2 */
> -static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
> -{
> -	struct victus_power_limits power_limits;
> -	int ret;
> -
> -	/* We need to know both PL1 and PL2 values in order to check them */
> -	if (pl1 == HP_POWER_LIMIT_NO_CHANGE || pl2 == HP_POWER_LIMIT_NO_CHANGE)
> -		return -EINVAL;
> -
> -	/* PL2 is not supposed to be lower than PL1 */
> -	if (pl2 < pl1)
> -		return -EINVAL;
> -
> -	power_limits.pl1 = pl1;
> -	power_limits.pl2 = pl2;
> -	power_limits.pl4 = HP_POWER_LIMIT_NO_CHANGE;
> -	power_limits.cpu_gpu_concurrent_limit = HP_POWER_LIMIT_NO_CHANGE;
> -
> -	ret = hp_wmi_perform_query(HPWMI_SET_POWER_LIMITS_QUERY, HPWMI_GM,
> -				   &power_limits, sizeof(power_limits), 0);
> -
> -	return ret;
> -}
> -
>  static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
>  {
>  	bool gpu_ctgp_enable, gpu_ppab_enable;
> @@ -1678,19 +1942,19 @@ static int platform_profile_victus_s_set_ec(enum platform_profile_option profile
>  
>  	switch (profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
> +		tp = FANMODE_LEGACY_PERFORMANCE;
>  		gpu_ctgp_enable = true;
>  		gpu_ppab_enable = true;
>  		gpu_dstate = 1;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
> +		tp = FANMODE_LEGACY_DEFAULT;
>  		gpu_ctgp_enable = false;
>  		gpu_ppab_enable = true;
>  		gpu_dstate = 1;
>  		break;
>  	case PLATFORM_PROFILE_LOW_POWER:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
> +		tp = FANMODE_LEGACY_DEFAULT;
>  		gpu_ctgp_enable = false;
>  		gpu_ppab_enable = false;
>  		gpu_dstate = 1;
> @@ -1699,7 +1963,7 @@ static int platform_profile_victus_s_set_ec(enum platform_profile_option profile
>  		return -EOPNOTSUPP;
>  	}
>  
> -	hp_wmi_get_fan_count_userdefine_trigger();
> +	hp_wmi_get_fan_count();
>  
>  	err = omen_thermal_profile_set(tp);
>  	if (err < 0) {
> @@ -1707,7 +1971,7 @@ static int platform_profile_victus_s_set_ec(enum platform_profile_option profile
>  		return err;
>  	}
>  
> -	err = victus_s_gpu_thermal_profile_set(gpu_ctgp_enable,
> +	err = hp_wmi_gpu_thermal_profile_set(gpu_ctgp_enable,
>  					       gpu_ppab_enable,
>  					       gpu_dstate);
>  	if (err < 0) {
> @@ -1750,13 +2014,89 @@ static int platform_profile_victus_set(struct device *dev,
>  	return 0;
>  }
>  
> +static bool is_omen_v1_thermal_profile(void)
> +{
> +	const char *board_name;
> +
> +	board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +	if (!board_name)
> +		return false;
> +
> +	return match_string(thermal_profile_v1_boards,
> +			    ARRAY_SIZE(thermal_profile_v1_boards),
> +			    board_name) >= 0;
> +}
> +
> +static int platform_profile_omen_v1_set_ec(enum platform_profile_option profile)
> +{
> +	bool gpu_ctgp_enable, gpu_ppab_enable;
> +	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
> +	int err;
> +	enum hp_fan_mode tp;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		tp = FANMODE_L7;
> +		gpu_ctgp_enable = true;
> +		gpu_ppab_enable = true;
> +		gpu_dstate = 1;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		tp = FANMODE_L2;
> +		gpu_ctgp_enable = false;
> +		gpu_ppab_enable = true;
> +		gpu_dstate = 1;
> +		break;
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		tp = FANMODE_L2;
> +		gpu_ctgp_enable = false;
> +		gpu_ppab_enable = false;
> +		gpu_dstate = 1;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	err = omen_thermal_profile_set(tp);
> +	if (err < 0) {
> +		pr_err("Failed to set platform profile %d: %d\n", profile, err);
> +		return err;
> +	}
> +
> +	err = hp_wmi_gpu_thermal_profile_set(gpu_ctgp_enable,
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
> +static int platform_profile_omen_v1_set(struct device *dev,
> +					 enum platform_profile_option profile)
> +{
> +	int err;
> +
> +	guard(mutex)(&active_platform_profile_lock);
> +
> +	err = platform_profile_omen_v1_set_ec(profile);
> +	if (err < 0)
> +		return err;
> +
> +	active_platform_profile = profile;
> +
> +	return 0;
> +}
> +
>  static int hp_wmi_platform_profile_probe(void *drvdata, unsigned long *choices)
>  {
>  	if (is_omen_thermal_profile()) {
>  		set_bit(PLATFORM_PROFILE_COOL, choices);
>  	} else if (is_victus_thermal_profile()) {
>  		set_bit(PLATFORM_PROFILE_QUIET, choices);
> -	} else if (is_victus_s_thermal_profile()) {
> +	} else if (is_victus_s_thermal_profile() || is_omen_v1_thermal_profile()) {
>  		/* Adding an equivalent to HP Omen software ECO mode: */
>  		set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
>  	} else {
> @@ -1849,7 +2189,7 @@ static int victus_s_powersource_event(struct notifier_block *nb,
>  
>  	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
>  		pr_debug("Triggering CPU PL1/PL2 actualization\n");
> -		err = victus_s_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
> +		err = hp_wmi_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
>  					       HP_POWER_LIMIT_DEFAULT);
>  		if (err)
>  			pr_warn("Failed to actualize power limits: %d\n", err);
> @@ -1860,6 +2200,32 @@ static int victus_s_powersource_event(struct notifier_block *nb,
>  	return NOTIFY_OK;
>  }
>  
> +static int omen_v1_powersource_event(struct notifier_block *nb,
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
> +	 * Switching to battery power source while any mode is active
> +	 * needs manual triggering of CPU power limits. Same goes when switching
> +	 * to AC power source.
> +	 * Observed on OMEN v1 boards.
> +	 */
> +	err = hp_wmi_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
> +						HP_POWER_LIMIT_DEFAULT);
> +	if (err)
> +		pr_warn("Failed to actualize power limits: %d\n", err);
> +
> +	return NOTIFY_OK;
> +}
> +
>  static int omen_register_powersource_event_handler(void)
>  {
>  	int err;
> @@ -1889,6 +2255,20 @@ static int victus_s_register_powersource_event_handler(void)
>  	return 0;
>  }
>  
> +static int omen_v1_register_powersource_event_handler(void)
> +{
> +	int err;
> +
> +	platform_power_source_nb.notifier_call = omen_v1_powersource_event;
> +	err = register_acpi_notifier(&platform_power_source_nb);
> +	if (err < 0) {
> +		pr_warn("Failed to install ACPI power source notify handler\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static inline void omen_unregister_powersource_event_handler(void)
>  {
>  	unregister_acpi_notifier(&platform_power_source_nb);
> @@ -1899,6 +2279,11 @@ static inline void victus_s_unregister_powersource_event_handler(void)
>  	unregister_acpi_notifier(&platform_power_source_nb);
>  }
>  
> +static inline void omen_v1_unregister_powersource_event_handler(void)
> +{
> +	unregister_acpi_notifier(&platform_power_source_nb);
> +}
> +
>  static const struct platform_profile_ops platform_profile_omen_ops = {
>  	.probe = hp_wmi_platform_profile_probe,
>  	.profile_get = platform_profile_omen_get,
> @@ -1917,6 +2302,12 @@ static const struct platform_profile_ops platform_profile_victus_s_ops = {
>  	.profile_set = platform_profile_victus_s_set,
>  };
>  
> +static const struct platform_profile_ops platform_profile_omen_v1_ops = {
> +	.probe = hp_wmi_platform_profile_probe,
> +	.profile_get = platform_profile_omen_get,
> +	.profile_set = platform_profile_omen_v1_set,
> +};
> +
>  static const struct platform_profile_ops hp_wmi_platform_profile_ops = {
>  	.probe = hp_wmi_platform_profile_probe,
>  	.profile_get = hp_wmi_platform_profile_get,
> @@ -1968,6 +2359,18 @@ static int thermal_profile_setup(struct platform_device *device)
>  			return err;
>  
>  		ops = &platform_profile_victus_s_ops;
> +	} else if (is_omen_v1_thermal_profile()) {
> +		/*
> +		 * Being unable to retrieve laptop's current thermal profile,
> +		 * So doing the same process as above.
> +		 */
> +		active_platform_profile = PLATFORM_PROFILE_BALANCED;
> +
> +		err = platform_profile_omen_v1_set_ec(active_platform_profile);
> +		if (err < 0)
> +			return err;
> +
> +		ops = &platform_profile_omen_v1_ops;
>  	} else {
>  		tp = thermal_profile_get();
>  
> @@ -2116,11 +2519,11 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>  	case hwmon_pwm:
>  		return 0644;
>  	case hwmon_fan:
> -		if (is_victus_s_thermal_profile()) {
> -			if (hp_wmi_get_fan_speed_victus_s(channel) >= 0)
> +		if (is_victus_s_thermal_profile() || is_omen_v1_thermal_profile()) {
> +			if (hp_wmi_get_fan_speed_insyde(channel) >= 0)
>  				return 0444;
>  		} else {
> -			if (hp_wmi_get_fan_speed(channel) >= 0)
> +			if (hp_wmi_get_fan_speed_ami(channel) >= 0)
>  				return 0444;
>  		}
>  		break;
> @@ -2138,10 +2541,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  
>  	switch (type) {
>  	case hwmon_fan:
> -		if (is_victus_s_thermal_profile())
> -			ret = hp_wmi_get_fan_speed_victus_s(channel);
> +		if (is_victus_s_thermal_profile() || is_omen_v1_thermal_profile())
> +			ret = hp_wmi_get_fan_speed_insyde(channel);
>  		else
> -			ret = hp_wmi_get_fan_speed(channel);
> +			ret = hp_wmi_get_fan_speed_ami(channel);
>  		if (ret < 0)
>  			return ret;
>  		*val = ret;
> @@ -2174,14 +2577,14 @@ static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
>  	case hwmon_pwm:
>  		switch (val) {
>  		case 0:
> -			if (is_victus_s_thermal_profile())
> -				hp_wmi_get_fan_count_userdefine_trigger();
> +			if (is_victus_s_thermal_profile() || is_omen_v1_thermal_profile())
> +				hp_wmi_get_fan_count();
>  			/* 0 is no fan speed control (max), which is 1 for us */
>  			return hp_wmi_fan_speed_max_set(1);
>  		case 2:
>  			/* 2 is automatic speed control, which is 0 for us */
> -			if (is_victus_s_thermal_profile()) {
> -				hp_wmi_get_fan_count_userdefine_trigger();
> +			if (is_victus_s_thermal_profile() || is_omen_v1_thermal_profile()) {
> +				hp_wmi_get_fan_count();
>  				return hp_wmi_fan_speed_max_reset();
>  			} else
>  				return hp_wmi_fan_speed_max_set(0);
> @@ -2267,6 +2670,10 @@ static int __init hp_wmi_init(void)
>  		err = victus_s_register_powersource_event_handler();
>  		if (err)
>  			goto err_unregister_device;
> +	} else if (is_omen_v1_thermal_profile()) {
> +		err = omen_v1_register_powersource_event_handler();
> +		if (err)
> +			goto err_unregister_device;
>  	}
>  
>  	return 0;
> @@ -2289,6 +2696,9 @@ static void __exit hp_wmi_exit(void)
>  	if (is_victus_s_thermal_profile())
>  		victus_s_unregister_powersource_event_handler();
>  
> +	if (is_omen_v1_thermal_profile())
> +		omen_v1_unregister_powersource_event_handler();
> +
>  	if (wmi_has_guid(HPWMI_EVENT_GUID))
>  		hp_wmi_input_destroy();
>  
> 
