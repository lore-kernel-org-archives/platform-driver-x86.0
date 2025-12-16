Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D591F38C663
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 13:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890464; cv=none; b=YWXk8hJmhV9SDuvMTK7b+8pdqzbpc4zCdQQVGmm826uaDHmP49uQ5rIj0uqKJSqW8Trke86IAfQK8K0SozHp2HVaX4fNjS4ziEftu9u6QOXDHToqWSOBGJbWVt2cXaRkPubV3x2Lz4Tp3nhYAf27W7q9hW9EpCNw+bLeBOtMVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890464; c=relaxed/simple;
	bh=/8e03E4ilCfWprCspYKzCVGA14IHjNKvi/EGSb/1eD8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t8a7NMDd7MI0EzohiLPLPLF1kWRx7cA4byYvd+PG+GegAp1a0c8adRihmdFJv7hL2KtE+2a1eFybYw+MWjsY3Ns/2fvgIzZPfyLab0MFXA+orJUMkKoux+fE5bD5CkadXAMROtVqk17N1UeHKhNLSJ1j061ojLmgQr3mmAztKfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buNI9HGg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buNI9HGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765890463; x=1797426463;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/8e03E4ilCfWprCspYKzCVGA14IHjNKvi/EGSb/1eD8=;
  b=buNI9HGgjusRQsNwesAdl6HfqkyZNklPr0bHZLyCNPGgFoGl1hp59fHR
   5vFEA8aScVOXqd7NWvCXtol0AXPB3WR+3Tzaf0Fh8wJrm6lhZvkGXhu8E
   fYTy8sC7oVMGDIoA/ldbts/ijTFI+eMyL4RqAgRtHlGFmfOeCYFGiE7rd
   kivoKJ/cmZkaJ2hbm8T0YYu454nT3cMi7mi4Z7ITrcSHGUjLOs0mOJRYD
   yBWl+FGA5zp7+41GI+jIoScgaGKr5uqyO9AiqoMsjKNeRZJePbsSdPvfT
   s3qA4OcHH8T3T7tVIhHu20YQz2fdT8i0BFxdAAnqucCZ74G6HqvNNJEbO
   A==;
X-CSE-ConnectionGUID: zRa8u70iRUeygq/4AmHMZg==
X-CSE-MsgGUID: S3aq8E3jTLSaFbU1SFyYlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78114880"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78114880"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:07:42 -0800
X-CSE-ConnectionGUID: dsbn8akBT2Ovp9CUFefiOQ==
X-CSE-MsgGUID: cEwlWLFgTsetprQ2T4TQTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197757914"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:07:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Dec 2025 15:07:37 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: hp-wmi: fix platform profile values
 for Omen 16-wf1xxx
In-Reply-To: <20251216121338.124615-1-krishna.chomal108@gmail.com>
Message-ID: <43d49656-7c7c-ec55-a448-9cc9321ab3b2@linux.intel.com>
References: <20251216121338.124615-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Dec 2025, Krishna Chomal wrote:

> HP Omen 16-wf1xxx (board ID 8C78) currently sends the incorrect
> Victus-specific thermal profile values via WMI, leading to a logical
> inconsistency when switching between platform profiles.
>
> The driver currently uses Victus S values:
> 0x00 => Balanced / Low-Power
> 0x01 => Performance
> 
> However, Omen Gaming Hub logs / EC register inspection on Windows shows
> that this board is intended to use:
> 0x30 => Balanced / Low-Power
> 0x31 => Performance
> 
> This patch corrects the thermal profile command values to match the
> values observed from Omen Gaming Hub logs. The performance benchmarks
> and peak power draw (from both CPU and GPU) show no observable change
> with this correction (suggesting that the firmware is currently tolerant
> of the incorrect values). However sending the correct values prevents
> potential regressions after future firmware updates.
> 
> Refactor the `victus_s_thermal_profile_boards` array from a simple list
> of strings to a `dmi_system_id` table. This allows mapping specific
> boards to their corresponding thermal parameter structures via
> `driver_data`. This makes addition of future boards cleaner and more
> explicit.
> 
> Tested on: HP Omen 16-wf1xxx (board 8C78)

Remove : and add .

> Result: Confirmed WMI codes 0x30/0x31 are now sent, resolving the

Remove "Result: Confirmed" and just continue like a normal paragraph.

> logical inconsistency and ensuring the value visible in EC registers
> match the Windows state for this profile.
> 
> Fixes: fb146a38cb11 ("platform/x86: hp-wmi: Add Omen 16-wf1xxx fan support")
> Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
> ---
> Changes in v2:
> - Refactored `victus_s_thermal_profile_boards` to use `struct dmi_system_id`
> - Implemented `driver_data` to handle thermal profile parameters,
>   replacing the conditional checks in `platform_profile_victus_s_set_ec`
> - Moved enum definitions for thermal profile values earlier in the file
>   to support the new `struct thermal_profile_params`.
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 148 ++++++++++++++++++++-----------
>  1 file changed, 96 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index f4ea1ea05997..0bcd564ad688 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -53,6 +53,60 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
>  
>  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
>  
> +enum hp_thermal_profile_omen_v0 {
> +	HP_OMEN_V0_THERMAL_PROFILE_DEFAULT		= 0x00,
> +	HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE		= 0x01,
> +	HP_OMEN_V0_THERMAL_PROFILE_COOL			= 0x02,
> +};
> +
> +enum hp_thermal_profile_omen_v1 {
> +	HP_OMEN_V1_THERMAL_PROFILE_DEFAULT		= 0x30,
> +	HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE		= 0x31,
> +	HP_OMEN_V1_THERMAL_PROFILE_COOL			= 0x50,
> +};
> +
> +enum hp_thermal_profile_omen_flags {
> +	HP_OMEN_EC_FLAGS_TURBO				= 0x04,
> +	HP_OMEN_EC_FLAGS_NOTIMER			= 0x02,
> +	HP_OMEN_EC_FLAGS_JUSTSET			= 0x01,
> +};
> +
> +enum hp_thermal_profile_victus {
> +	HP_VICTUS_THERMAL_PROFILE_DEFAULT		= 0x00,
> +	HP_VICTUS_THERMAL_PROFILE_PERFORMANCE		= 0x01,
> +	HP_VICTUS_THERMAL_PROFILE_QUIET			= 0x03,
> +};
> +
> +enum hp_thermal_profile_victus_s {
> +	HP_VICTUS_S_THERMAL_PROFILE_DEFAULT		= 0x00,
> +	HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE		= 0x01,
> +};
> +
> +enum hp_thermal_profile {
> +	HP_THERMAL_PROFILE_PERFORMANCE			= 0x00,
> +	HP_THERMAL_PROFILE_DEFAULT			= 0x01,
> +	HP_THERMAL_PROFILE_COOL				= 0x02,
> +	HP_THERMAL_PROFILE_QUIET			= 0x03,
> +};
> +
> +struct thermal_profile_params {
> +	u8 performance;
> +	u8 balanced;
> +	u8 eco;
> +};

How do you envision this being used on the get side? You choose not to 
change the get side, so you didn't run to that challenge. Currently 
at least platform_profile_omen_get_ec() is sort of cheating as it maps 
multiple variants without properly differentiation them.

Is "eco" hp specific terminology? (platform_profile_option doesn't use 
that terminology at all.)

Wouldn't we want to include struct platform_profile_ops * somewhere as 
well so this framework can extend beyond just victus_s? (I'm not sure if 
it should be in struct thermal_profile_params or if should be separate 
from that, this whole platform profile code is so hard to read it's hard 
to infer what are all the variations.)

> +static const struct thermal_profile_params victus_s_thermal_params = {
> +	.performance	= HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE,
> +	.balanced	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
> +	.eco		= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT

Please always add trailing comma to any non-terminating entry.

> +};
> +
> +static const struct thermal_profile_params omen_v1_thermal_params = {
> +	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
> +	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
> +	.eco		= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT
> +};
> +
>  /* DMI board names of devices that should use the omen specific path for
>   * thermal profiles.
>   * This was obtained by taking a look in the windows omen command center
> @@ -99,10 +153,36 @@ static const char * const victus_thermal_profile_boards[] = {
>  };
>  
>  /* DMI Board names of Victus 16-r and Victus 16-s laptops */
> -static const char * const victus_s_thermal_profile_boards[] = {
> -	"8BBE", "8BD4", "8BD5",
> -	"8C78", "8C99", "8C9C",
> -	"8D41",
> +static const struct dmi_system_id victus_s_thermal_profile_boards[] = {
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
> +		.driver_data = (void *)&victus_s_thermal_params,
> +	},
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
> +		.driver_data = (void *)&victus_s_thermal_params,
> +	},
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
> +		.driver_data = (void *)&victus_s_thermal_params,
> +	},
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
> +		.driver_data = (void *)&omen_v1_thermal_params,
> +	},
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
> +		.driver_data = (void *)&victus_s_thermal_params,
> +	},
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
> +		.driver_data = (void *)&victus_s_thermal_params,
> +	},
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
> +		.driver_data = (void *)&victus_s_thermal_params,
> +	},
> +	{},
>  };
>  
>  enum hp_wmi_radio {
> @@ -225,42 +305,6 @@ enum hp_wireless2_bits {
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
> -enum hp_thermal_profile_omen_flags {
> -	HP_OMEN_EC_FLAGS_TURBO		= 0x04,
> -	HP_OMEN_EC_FLAGS_NOTIMER	= 0x02,
> -	HP_OMEN_EC_FLAGS_JUSTSET	= 0x01,
> -};
> -
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
> @@ -1581,15 +1625,7 @@ static int platform_profile_victus_set_ec(enum platform_profile_option profile)
>  
>  static bool is_victus_s_thermal_profile(void)
>  {
> -	const char *board_name;
> -
> -	board_name = dmi_get_system_info(DMI_BOARD_NAME);
> -	if (!board_name)
> -		return false;
> -
> -	return match_string(victus_s_thermal_profile_boards,
> -			    ARRAY_SIZE(victus_s_thermal_profile_boards),
> -			    board_name) >= 0;
> +	return dmi_first_match(victus_s_thermal_profile_boards) != NULL;
>  }
>  
>  static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
> @@ -1672,25 +1708,33 @@ static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
>  
>  static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
>  {
> +	const struct dmi_system_id *id;
> +	const struct thermal_profile_params *params;
>  	bool gpu_ctgp_enable, gpu_ppab_enable;
>  	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
>  	int err, tp;
>  
> +	id = dmi_first_match(victus_s_thermal_profile_boards);
> +	if (!id)
> +		return -ENODEV;
> +
> +	params = id->driver_data;

We should do this once at init time. Then you can mark the dmi table(s) 
with __init.

Normally the pointer would be stored into a priv struct (which this driver 
doesn't have yet but gazillions of static vars).

>  	switch (profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
> +		tp = params->performance;
>  		gpu_ctgp_enable = true;
>  		gpu_ppab_enable = true;
>  		gpu_dstate = 1;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
> +		tp = params->balanced;
>  		gpu_ctgp_enable = false;
>  		gpu_ppab_enable = true;
>  		gpu_dstate = 1;
>  		break;
>  	case PLATFORM_PROFILE_LOW_POWER:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
> +		tp = params->eco;
>  		gpu_ctgp_enable = false;
>  		gpu_ppab_enable = false;
>  		gpu_dstate = 1;

-- 
 i.

