Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75161217704
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446427; cv=none; b=EbK3+KnVJYUduN8O5DGk7qByIksxGDW5jIvog47Q0i5r4ktKEdueO3QQNus/tXEuS9tzhtcohuJyjIK8KMrNQFiXsHwrB4AF5lsZwN1H6LwbJHdYwfFT8UvIcc98Lc9w8pxCTsnmnyB6LGNfD/60oGwOgVrcdqsve/ZvJX2p6Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446427; c=relaxed/simple;
	bh=8+nbT0ksKQOBSrQ/yJuJMcyyg8Z9ENY9j+Yax0YpwEo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UWsO2+XE0TD5xNQUrG14tvvf87Zkt39MjJa9VUfESaoNlV9xljiHn18gPtGgXTjmcm7NYpiHlKdtnGxLtGYb+Oj3BLHAiulSk9fNsvVt1q7tJaOjr4aAVzd5fnPRAGtuA1g+9EKFWdBgNMwY/WLqkJeoc2bR4bTQH7FT/apcLVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2aJ1IhM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2aJ1IhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774446426; x=1805982426;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8+nbT0ksKQOBSrQ/yJuJMcyyg8Z9ENY9j+Yax0YpwEo=;
  b=O2aJ1IhMj6uCIW6OiQCvTQHu9HKGSB3fmxnmth1BVUBZW2OxCgaWBIYh
   SUI7Ud9KGd2xYIYrQgGwmVXEYDT5ZdXLOJNY3ML/fGEfwJOsHAqjInYjf
   LVmINdb0Nuj9v/nk1GZsEmUeUa47atj5ntWa6vwla+6bHshUY0wNjlpMb
   6O8qEmcYai9YQcOM+SWktluff7noZJCMFPvTFK/et2koNT3/l2a5nbtWv
   ptdRr0yWk+Q9860L58akiJiWXl9HAALfbjW2lgZgS1o+KsARzGvQbtA8Q
   MvNHgVIlkxyCtNCy57I6Drtwdr9XfgSjk+npbcHrVmJRHQl/0VB1wx+M+
   g==;
X-CSE-ConnectionGUID: BudNP2h0QKSl/gw2r9eJzg==
X-CSE-MsgGUID: VcP6LIpkTZqUoCAfy5BEdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79082502"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79082502"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:40:03 -0700
X-CSE-ConnectionGUID: aJsr03fqS2Go9FIXJaVPsA==
X-CSE-MsgGUID: nH8kVgSWQLeyhveyKTiUCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="228750047"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:40:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 15:39:57 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>
cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com, 
    Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 5/7] platform/x86/amd/pmf: Move debug helper functions
 to UAPI header
In-Reply-To: <20260301131124.1370565-6-Shyam-sundar.S-k@amd.com>
Message-ID: <c2678400-a4af-03e6-9948-33dd5a486c5c@linux.intel.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com> <20260301131124.1370565-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 1 Mar 2026, Shyam Sundar S K wrote:

> These debug helper functions convert enumerated values to appropriate
> message and can be useful for userspace tools and other kernel components
> that need to interpret AMD PMF state values.
> 
> By making them inline functions in the UAPI header, they become available
> to both kernel and userspace without code duplication.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Here too I'm not happy with the naming and I'm a little skeptical about 
the sharing string conversion helpers as well.

Hans,

do you have something to say on having this kind of string conversions in 
an uapi header?

> ---
>  drivers/platform/x86/amd/pmf/spc.c  |  54 --------------
>  drivers/platform/x86/amd/pmf/util.c |  12 ----
>  include/uapi/linux/amd-pmf.h        | 105 ++++++++++++++++++++++++++++
>  3 files changed, 105 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index a40419b5e1b7..f91feaac5238 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -18,60 +18,6 @@
>  #include "pmf.h"
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
> -static const char *platform_type_as_str(u16 platform_type)
> -{
> -	switch (platform_type) {
> -	case CLAMSHELL:
> -		return "CLAMSHELL";
> -	case FLAT:
> -		return "FLAT";
> -	case TENT:
> -		return "TENT";
> -	case STAND:
> -		return "STAND";
> -	case TABLET:
> -		return "TABLET";
> -	case BOOK:
> -		return "BOOK";
> -	case PRESENTATION:
> -		return "PRESENTATION";
> -	case PULL_FWD:
> -		return "PULL_FWD";
> -	default:
> -		return "UNKNOWN";
> -	}
> -}
> -
> -static const char *laptop_placement_as_str(u16 device_state)
> -{
> -	switch (device_state) {
> -	case ON_TABLE:
> -		return "ON_TABLE";
> -	case ON_LAP_MOTION:
> -		return "ON_LAP_MOTION";
> -	case IN_BAG:
> -		return "IN_BAG";
> -	case OUT_OF_BAG:
> -		return "OUT_OF_BAG";
> -	default:
> -		return "UNKNOWN";
> -	}
> -}
> -
> -static const char *ta_slider_as_str(unsigned int state)
> -{
> -	switch (state) {
> -	case TA_BEST_PERFORMANCE:
> -		return "PERFORMANCE";
> -	case TA_BETTER_PERFORMANCE:
> -		return "BALANCED";
> -	case TA_BEST_BATTERY:
> -		return "POWER_SAVER";
> -	default:
> -		return "Unknown TA Slider State";
> -	}
> -}
> -
>  static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
>  {
>  	switch (index) {
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> index 9a14467f412c..20dc7aa9f250 100644
> --- a/drivers/platform/x86/amd/pmf/util.c
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -18,18 +18,6 @@
>  
>  #define AMD_PMF_IOCTL_VERSION		0x02
>  
> -/* Convert BIOS input control code to array index (0-9) */
> -static int amd_pmf_get_bios_idx(u32 control_code)
> -{
> -	if (control_code >= IOCTL_BIOS_INPUT_1 && control_code <= IOCTL_BIOS_INPUT_10)
> -		return control_code - IOCTL_BIOS_INPUT_1;
> -
> -	if (control_code >= IOCTL_BIOS_OUTPUT_1 && control_code <= IOCTL_BIOS_OUTPUT_10)
> -		return control_code - IOCTL_BIOS_OUTPUT_1;
> -
> -	return -EINVAL;
> -}
> -
>  static long long amd_pmf_populate_bios_input(struct ta_pmf_enact_table *in, u32 control_code)
>  {
>  	u32 idx;
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> index 00fab9269238..e2125b304b83 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -14,6 +14,7 @@
>  #ifndef _UAPI_LINUX_AMD_PMF_H
>  #define _UAPI_LINUX_AMD_PMF_H
>  
> +#include <linux/errno.h>
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
>  
> @@ -106,6 +107,88 @@ enum platform_type {
>  	PTYPE_INVALID = 0xf,
>  };
>  
> +/**
> + * platform_type_as_str() - Convert platform type enum to string
> + * @platform_type: The platform type value to convert
> + *
> + * Returns a human-readable string representation of the platform type.
> + *
> + * Return: Constant string describing the platform type, or "UNKNOWN"
> + *         if the value is not recognized.
> + */
> +static inline const char *platform_type_as_str(unsigned int platform_type)
> +{
> +	switch (platform_type) {
> +	case CLAMSHELL:
> +		return "CLAMSHELL";
> +	case FLAT:
> +		return "FLAT";
> +	case TENT:
> +		return "TENT";
> +	case STAND:
> +		return "STAND";
> +	case TABLET:
> +		return "TABLET";
> +	case BOOK:
> +		return "BOOK";
> +	case PRESENTATION:
> +		return "PRESENTATION";
> +	case PULL_FWD:
> +		return "PULL_FWD";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +/**
> + * laptop_placement_as_str() - Convert laptop placement enum to string
> + * @device_state: The laptop placement value to convert
> + *
> + * Returns a human-readable string representation of the laptop placement.
> + *
> + * Return: Constant string describing the placement, or "UNKNOWN"
> + *         if the value is not recognized.
> + */
> +static inline const char *laptop_placement_as_str(unsigned int device_state)
> +{
> +	switch (device_state) {
> +	case ON_TABLE:
> +		return "ON_TABLE";
> +	case ON_LAP_MOTION:
> +		return "ON_LAP_MOTION";
> +	case IN_BAG:
> +		return "IN_BAG";
> +	case OUT_OF_BAG:
> +		return "OUT_OF_BAG";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +/**
> + * ta_slider_as_str() - Convert TA slider enum to string
> + * @state: The TA slider state value to convert
> + *
> + * Returns a human-readable string representation of the power slider
> + * position suitable for display purposes.
> + *
> + * Return: Constant string describing the slider state, or
> + *         "Unknown TA Slider State" if the value is not recognized.
> + */
> +static inline const char *ta_slider_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case TA_BEST_PERFORMANCE:
> +		return "PERFORMANCE";
> +	case TA_BETTER_PERFORMANCE:
> +		return "BALANCED";
> +	case TA_BEST_BATTERY:
> +		return "POWER_SAVER";
> +	default:
> +		return "Unknown TA Slider State";
> +	}
> +}
> +
>  /**
>   * enum pmf_ioctl_id - Control codes for PMF ioctl operations
>   * @IOCTL_POWER_SOURCE: Query current power source (AC/DC)
> @@ -197,6 +280,28 @@ enum pmf_ioctl_id {
>  	IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC
>  };
>  
> +/**
> + * amd_pmf_get_bios_idx() - Convert BIOS control code to array index
> + * @control_code: The BIOS input or output control code
> + *
> + * Converts a BIOS input (IOCTL_BIOS_INPUT_1 to IOCTL_BIOS_INPUT_10) or
> + * BIOS output (IOCTL_BIOS_OUTPUT_1 to IOCTL_BIOS_OUTPUT_10) control code
> + * to a zero-based array index (0-9).
> + *
> + * Return: Array index (0-9) on success, -EINVAL if the control code
> + *         is not a valid BIOS input or output code.
> + */
> +static inline int amd_pmf_get_bios_idx(unsigned int control_code)
> +{
> +	if (control_code >= IOCTL_BIOS_INPUT_1 && control_code <= IOCTL_BIOS_INPUT_10)
> +		return control_code - IOCTL_BIOS_INPUT_1;
> +
> +	if (control_code >= IOCTL_BIOS_OUTPUT_1 && control_code <= IOCTL_BIOS_OUTPUT_10)
> +		return control_code - IOCTL_BIOS_OUTPUT_1;
> +
> +	return -EINVAL;
> +}
> +
>  /**
>   * struct amd_pmf_ioctl_info - Structure for PMF ioctl data exchange
>   * @control_code: Input parameter specifying which data to query (enum pmf_ioctl_id)
> 

-- 
 i.

