Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829251AA1D2;
	Thu, 15 Jan 2026 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483614; cv=none; b=YwNLxKudRkhrKjnQSO0oazbTaRhVO9poycSOONDg5Q4NJ0EOR+D6VJGtU7EmSAcoUdXH0je9TRyAU4Z1QP2nPNHYrn5SEKfj1hnkdfBdioja6q0uLtT9o2ZmCT3zmuEKymyERLa7ZG/PiSB1qJA0Qms2NBY39+stvsZN3Ee/t9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483614; c=relaxed/simple;
	bh=GRPVYHM/dMBfgoBb8jyqTFMZsHnti7WRGalY21pVLiU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d4kc/cHXXSQn0KL8agu2CKVwIKRIBaG28jbw9w5QQ81nDp/jM8G1gGYm+ep//B0tTrkryJ6yogeaDmc/YETbs8Mqegdyu0hRPPssaNT3Vsx+gBvrntAFMmEyrrT5O28C4lTrslTsb6/ng1dIb2QAw9ARF5pn0gxrP0DZ9R6WiVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+6PKieg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+6PKieg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768483612; x=1800019612;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GRPVYHM/dMBfgoBb8jyqTFMZsHnti7WRGalY21pVLiU=;
  b=A+6PKieg5tP8PKNzDCwlvKU+/RQz7A0c17s1K9EYByxrWNCevzqWqNqe
   72fNXNNXQSJRisZuW56PnHJyWhA2bzsLIY3aVUw7JZcnrS9Yei02R4hM2
   cDO2T41hsRnxqoJL80TSoW0ykAsmgitfcvZWT4aHDgmpl87PZBQSWAd01
   fjOngVELifHVVteMwgkcVFaUlAWpHGtKdmi+luiyp4RIRm3sF5rrIzeCS
   8kUskjKnK7zJrz+hYXPj4ODqf3NgSgEjaaFOEZNFTy1F0pC8RwArjgbJt
   REpBndlU0uarNlmygFrmKYbTOHrdsq9/Vw1BhskGoGUJubldEO9IY9P4t
   Q==;
X-CSE-ConnectionGUID: hVptzZNvQIeKmU3fIp+Mhw==
X-CSE-MsgGUID: C55/mvsAT6ODiwvOTFqvBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69955217"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69955217"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:26:51 -0800
X-CSE-ConnectionGUID: n7BPZ852Q4SACwuofKjmZQ==
X-CSE-MsgGUID: hmsRjuhzQl2uwgY1vVtc8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204736012"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:26:49 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Jan 2026 15:26:45 +0200 (EET)
To: Krishna Chomal <krishna.chomal108@gmail.com>, 
    Hans de Goede <hansg@kernel.org>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] platform/x86: hp-wmi: Add EC offsets to read
 Victus S thermal profile
In-Reply-To: <20260113182604.115211-3-krishna.chomal108@gmail.com>
Message-ID: <60c0e7ad-f25e-4e73-668b-4bb08dbbb79e@linux.intel.com>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com> <20260113182604.115211-1-krishna.chomal108@gmail.com> <20260113182604.115211-3-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Jan 2026, Krishna Chomal wrote:

> The current implementation for Victus S thermal profiles only supports
> setting the profile. The driver was missing the logic to read the
> hardware state, meaning it would default to "Balanced" on driver load,
> overriding the currently active profile. Furthermore, the driver could
> not detect if the firmware reset the profile on a power source change.
> 
> Add platform_profile_victus_s_get_ec() to read the current thermal
> profile state directly from EC offset 0x59. Since both Balanced and
> Low-Power profiles share the same thermal profile value, differentiate
> them by querying the GPU CTGP and PPAB states via existing functions.
> Additionally, update the power source event notifier to use the actual
> hardware state when re-trigger CPU power limits actualization.
> 
> Testing on HP Omen 16-wf1xxx (board ID 8C78) confirmed that the thermal
> profile is now persistent across driver loads and power source change
> events.
> 
> Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
> ---
> Changes in v5:
> - Improved platform_profile_victus_s_get_ec() to support multiple EC
>   layouts by iteratively probing offsets.
> Changes in v4:
> - Fixed platform_profile_victus_s_get_ec() to use both
>   victus_s_thermal_params and omen_v1_thermal_params instead of
>   active_thermal_params to fix regression caused in v3.
> - Handle err after calling victus_s_gpu_thermal_profile_get().
> - Fixed a wrong function call in victus_s_powersource_event().
> Changes in v3:
> - New patch in this series
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 100 +++++++++++++++++++++++++++----
>  1 file changed, 89 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 24d065ddfc6a..ed52c697d2ea 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -13,6 +13,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/array_size.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -44,6 +45,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
>  #define HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET 0x62
>  #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> +#define HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET 0x59
>  
>  #define HP_FAN_SPEED_AUTOMATIC	 0x00
>  #define HP_POWER_LIMIT_DEFAULT	 0x00
> @@ -640,6 +642,12 @@ static bool is_omen_thermal_profile(void)
>  			    board_name) >= 0;
>  }
>  
> +static bool is_victus_s_thermal_profile(void)
> +{
> +	/* Initialised in driver init, hence safe to use here */
> +	return is_victus_s_board;
> +}
> +
>  static int omen_get_thermal_policy_version(void)
>  {
>  	unsigned char buffer[8] = { 0 };
> @@ -1631,12 +1639,6 @@ static int platform_profile_victus_set_ec(enum platform_profile_option profile)
>  	return 0;
>  }
>  
> -static bool is_victus_s_thermal_profile(void)
> -{
> -	/* Initialised in driver init, hence safe to use here */
> -	return is_victus_s_board;
> -}
> -
>  static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
>  					    bool *ppab_enable,
>  					    u8 *dstate,
> @@ -1715,6 +1717,68 @@ static int victus_s_set_cpu_pl1_pl2(u8 pl1, u8 pl2)
>  	return ret;
>  }
>  
> +static int platform_profile_victus_s_get_ec(enum platform_profile_option *profile)
> +{
> +	int ret, i;
> +	bool current_ctgp_state, current_ppab_state;
> +	u8 current_dstate, current_gpu_slowdown_temp, tp;
> +	static const u8 tp_ec_offsets[2] = { HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
> +					     HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET };
> +
> +	/*
> +	 * Victus S devices have more than 1 EC layouts, hence we cannot directly
> +	 * call omen_thermal_profile_get() like other platform_profile_*_get_ec()
> +	 * variants, since it would only resolve to that 1 type of board. Hence
> +	 * we iteratively query a set of candidates: tp_ec_offsets[] until we
> +	 * find a valid thermal profile.
> +	 */
> +	for (i = 0 ; i < ARRAY_SIZE(tp_ec_offsets) ; i++) {
> +		ret = ec_read(tp_ec_offsets[i], &tp);

I'm not so sure about this. Reading EC offsets and hoping we find the 
correct one doesn't sound the best idea. I'd prefer we store the 
information like we already do for thermal profiles. Unless there's some 
other way to detect which layout it is?

FYI, I took the first patch of this series again into the review-ilpo-next 
branch as it seems uncontested and fixes a problem in the existing code.

-- 
 i.


> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * We cannot use active_thermal_profile_params here, because boards
> +		 * like 8C78 have tp == 0x0 || tp == 0x1 after cold boot, but logically
> +		 * it should have tp == 0x30 || tp == 0x31, as corrected by the Omen
> +		 * Gaming Hub on windows. Hence accept both of these values.
> +		 */
> +		if (tp == victus_s_thermal_params.performance ||
> +		    tp == omen_v1_thermal_params.performance) {
> +			*profile = PLATFORM_PROFILE_PERFORMANCE;
> +			return 0;
> +		} else if (tp == victus_s_thermal_params.balanced ||
> +			   tp == omen_v1_thermal_params.balanced) {
> +			/*
> +			 * Since both PLATFORM_PROFILE_LOW_POWER and
> +			 * PLATFORM_PROFILE_BALANCED share the same thermal
> +			 * profile parameter value, hence to differentiate
> +			 * between them, we query the GPU CTGP and PPAB states
> +			 * and compare based off of that.
> +			 */
> +			ret = victus_s_gpu_thermal_profile_get(&current_ctgp_state,
> +							       &current_ppab_state,
> +							       &current_dstate,
> +							       &current_gpu_slowdown_temp);
> +			if (ret < 0)
> +				return ret;
> +
> +			if (current_ctgp_state == 0 && current_ppab_state == 0) {
> +				*profile = PLATFORM_PROFILE_LOW_POWER;
> +				return 0;
> +			} else if (current_ctgp_state == 0 && current_ppab_state == 1) {
> +				*profile = PLATFORM_PROFILE_BALANCED;
> +				return 0;
> +			} else {
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +
> +	/* Failed to get thermal profile from all EC offsets */
> +	return -EINVAL;
> +}
> +
>  static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
>  {
>  	struct thermal_profile_params *params;
> @@ -1882,6 +1946,7 @@ static int victus_s_powersource_event(struct notifier_block *nb,
>  				      void *data)
>  {
>  	struct acpi_bus_event *event_entry = data;
> +	enum platform_profile_option actual_profile;
>  	int err;
>  
>  	if (strcmp(event_entry->device_class, ACPI_AC_CLASS) != 0)
> @@ -1889,6 +1954,17 @@ static int victus_s_powersource_event(struct notifier_block *nb,
>  
>  	pr_debug("Received power source device event\n");
>  
> +	guard(mutex)(&active_platform_profile_lock);
> +	err = platform_profile_victus_s_get_ec(&actual_profile);
> +	if (err < 0) {
> +		/*
> +		 * Although we failed to get the current platform profile, we
> +		 * still want the other event consumers to process it.
> +		 */
> +		pr_warn("Failed to read current platform profile (%d)\n", err);
> +		return NOTIFY_DONE;
> +	}
> +
>  	/*
>  	 * Switching to battery power source while Performance mode is active
>  	 * needs manual triggering of CPU power limits. Same goes when switching
> @@ -1897,7 +1973,7 @@ static int victus_s_powersource_event(struct notifier_block *nb,
>  	 * Seen on HP 16-s1034nf (board 8C9C) with F.11 and F.13 BIOS versions.
>  	 */
>  
> -	if (active_platform_profile == PLATFORM_PROFILE_PERFORMANCE) {
> +	if (actual_profile == PLATFORM_PROFILE_PERFORMANCE) {
>  		pr_debug("Triggering CPU PL1/PL2 actualization\n");
>  		err = victus_s_set_cpu_pl1_pl2(HP_POWER_LIMIT_DEFAULT,
>  					       HP_POWER_LIMIT_DEFAULT);
> @@ -2007,12 +2083,14 @@ static int thermal_profile_setup(struct platform_device *device)
>  
>  		ops = &platform_profile_victus_ops;
>  	} else if (is_victus_s_thermal_profile()) {
> +		err = platform_profile_victus_s_get_ec(&active_platform_profile);
> +		if (err < 0)
> +			return err;
> +
>  		/*
> -		 * Being unable to retrieve laptop's current thermal profile,
> -		 * during this setup, we set it to Balanced by default.
> +		 * call thermal profile write command to ensure that the
> +		 * firmware correctly sets the OEM variables
>  		 */
> -		active_platform_profile = PLATFORM_PROFILE_BALANCED;
> -
>  		err = platform_profile_victus_s_set_ec(active_platform_profile);
>  		if (err < 0)
>  			return err;
> 
