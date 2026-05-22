Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D53CEBB6
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456918; cv=none; b=K1NWZh8lwL3B0nIOhvKNZaT9GLVwrRkzoAAF9DYwu3HE6HEETYL/YTmfJBl25BCjd/sr+jjnRSe0hCu0sRAIM7BKgjldFSHJQZS4qlsnRf7IDuT7eGa9E6cjBZLSrFPHc6rh2LZeYimNk5dSZn4FDO4lDZj34V2YXAcwSK4hTCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456918; c=relaxed/simple;
	bh=f5a92ofu1ICmfkyBwCz7OYl5CDmsuglWzxGICsJdj/c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ccjUosIrFnjG6Xl5Qtws2UIKtyPJRe89swyDc/bXKRhogI9sJIktravJxl1PVq+OJc4jlRU1JQnBP+C+xdIPNkLS3xMmslTVUCbapuAz9cPMO4ktJOfFWTArNV5nZJAavFPVormOlMbYkW7xA335t2IOT97lFu8E2aYrp91d9m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J52xVRDp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J52xVRDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779456917; x=1810992917;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=f5a92ofu1ICmfkyBwCz7OYl5CDmsuglWzxGICsJdj/c=;
  b=J52xVRDpCRPSlnzgyvzz/aitNRMF4PRl38rKgR8gNYz/Uc+MMDHZq1BZ
   uujfZvIEPmFPaXPtmBG0HvoM701YAZgiMEHJhmg27DP3hidGo8/POV7B1
   5DgTejnzvzeIR9c8j0Qq1Gr0Z/3QoZxwKdKI7qAcJgTBFW2SbdFXb6VTQ
   l8sSM2cdP7UAvT5ZJkBQxlP+NdpsAfKVAKIDYW50CTnbCt9gtFR/xLZz/
   rFIsO95J4oCzz0ItEWxXX3vtQobZJxoR3jk/PUgaFX4vi8RMn6T9/nKWk
   7yG9J/BROFbORalM/xQBoKrmYCTDsmZoT0Wp6uVAqb/wDcbaU8BfLPegJ
   Q==;
X-CSE-ConnectionGUID: D2QQebzKRziZZaJJ/KFMKA==
X-CSE-MsgGUID: NcrdtOhIQYiy6kAvmuHs9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80115114"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80115114"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:35:16 -0700
X-CSE-ConnectionGUID: avcCgEjESIC6MwI2wjY4tw==
X-CSE-MsgGUID: xyS3+IeNT2yKFHytNKdCBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="271261681"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:35:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 16:35:10 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v5 5/8] platform/x86/amd/pmf: Move debug helper functions
 to UAPI header
In-Reply-To: <20260520185424.770772-6-Shyam-sundar.S-k@amd.com>
Message-ID: <eb9f4f80-4240-297b-f957-74a0b3fcb0b8@linux.intel.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com> <20260520185424.770772-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, Shyam Sundar S K wrote:

> These debug helper functions convert enumerated values to appropriate
> message and can be useful for userspace tools and other kernel components
> that need to interpret AMD PMF state values.
> 
> By making them inline functions in the UAPI header, they become available
> to both kernel and userspace without code duplication. Also, prefix the
> function names with amd_pmf_.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/spc.c | 61 ++----------------------------
>  include/uapi/linux/amd-pmf.h       | 57 ++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 05998946d1bd..0606d3b0adde 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -18,60 +18,6 @@
>  #include "pmf.h"
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
> -static const char *platform_type_as_str(u16 platform_type)
> -{
> -	switch (platform_type) {
> -	case AMD_PMF_CLAMSHELL:
> -		return "CLAMSHELL";
> -	case AMD_PMF_FLAT:
> -		return "FLAT";
> -	case AMD_PMF_TENT:
> -		return "TENT";
> -	case AMD_PMF_STAND:
> -		return "STAND";
> -	case AMD_PMF_TABLET:
> -		return "TABLET";
> -	case AMD_PMF_BOOK:
> -		return "BOOK";
> -	case AMD_PMF_PRESENTATION:
> -		return "PRESENTATION";
> -	case AMD_PMF_PULL_FWD:
> -		return "PULL_FWD";
> -	default:
> -		return "UNKNOWN";
> -	}
> -}
> -
> -static const char *laptop_placement_as_str(u16 device_state)
> -{
> -	switch (device_state) {
> -	case AMD_PMF_ON_TABLE:
> -		return "ON_TABLE";
> -	case AMD_PMF_ON_LAP_MOTION:
> -		return "ON_LAP_MOTION";
> -	case AMD_PMF_IN_BAG:
> -		return "IN_BAG";
> -	case AMD_PMF_OUT_OF_BAG:
> -		return "OUT_OF_BAG";
> -	default:
> -		return "UNKNOWN";
> -	}
> -}
> -
> -static const char *ta_slider_as_str(unsigned int state)
> -{
> -	switch (state) {
> -	case AMD_PMF_TA_BEST_PERFORMANCE:
> -		return "PERFORMANCE";
> -	case AMD_PMF_TA_BETTER_PERFORMANCE:
> -		return "BALANCED";
> -	case AMD_PMF_TA_BEST_BATTERY:
> -		return "POWER_SAVER";
> -	default:
> -		return "Unknown TA Slider State";
> -	}
> -}
> -
>  static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
>  {
>  	switch (index) {
> @@ -89,7 +35,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  	int i;
>  
>  	dev_dbg(dev->dev, "==== TA inputs START ====\n");
> -	dev_dbg(dev->dev, "Slider State: %s\n", ta_slider_as_str(in->ev_info.power_slider));
> +	dev_dbg(dev->dev, "Slider State: %s\n", amd_pmf_get_sp(in->ev_info.power_slider));
>  	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
>  	dev_dbg(dev->dev, "Battery Percentage: %u\n", in->ev_info.bat_percentage);
>  	dev_dbg(dev->dev, "Designed Battery Capacity: %u\n", in->ev_info.bat_design);
> @@ -103,9 +49,8 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
>  	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
>  	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
> -	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
> -	dev_dbg(dev->dev, "Laptop placement: %s\n",
> -		laptop_placement_as_str(in->ev_info.device_state));
> +	dev_dbg(dev->dev, "Platform type: %s\n", amd_pmf_get_pt(in->ev_info.platform_type));
> +	dev_dbg(dev->dev, "Laptop placement: %s\n",	amd_pmf_get_lp(in->ev_info.device_state));
>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>  		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
>  			amd_pmf_get_ta_custom_bios_inputs(in, i));
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> index 54baf015e4c1..a8c715bee9cc 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -115,6 +115,63 @@ enum amd_pmf_platform_type {
>  	AMD_PMF_PTYPE_INVALID = 0xf,
>  };
>  
> +/* Retrieve the platform type as a string */
> +static inline const char *amd_pmf_get_pt(unsigned int platform_type)
> +{
> +	switch (platform_type) {
> +	case AMD_PMF_CLAMSHELL:
> +		return "CLAMSHELL";
> +	case AMD_PMF_FLAT:
> +		return "FLAT";
> +	case AMD_PMF_TENT:
> +		return "TENT";
> +	case AMD_PMF_STAND:
> +		return "STAND";
> +	case AMD_PMF_TABLET:
> +		return "TABLET";
> +	case AMD_PMF_BOOK:
> +		return "BOOK";
> +	case AMD_PMF_PRESENTATION:
> +		return "PRESENTATION";
> +	case AMD_PMF_PULL_FWD:
> +		return "PULL_FWD";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +/* Retrieve the laptop placement as a string */
> +static inline const char *amd_pmf_get_lp(unsigned int device_state)
> +{
> +	switch (device_state) {
> +	case AMD_PMF_ON_TABLE:
> +		return "ON_TABLE";
> +	case AMD_PMF_ON_LAP_MOTION:
> +		return "ON_LAP_MOTION";
> +	case AMD_PMF_IN_BAG:
> +		return "IN_BAG";
> +	case AMD_PMF_OUT_OF_BAG:
> +		return "OUT_OF_BAG";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +/* Retrieve the slider position as a string */
> +static inline const char *amd_pmf_get_sp(unsigned int state)
> +{
> +	switch (state) {
> +	case AMD_PMF_TA_BEST_PERFORMANCE:
> +		return "PERFORMANCE";
> +	case AMD_PMF_TA_BETTER_PERFORMANCE:
> +		return "BALANCED";
> +	case AMD_PMF_TA_BEST_BATTERY:
> +		return "POWER_SAVER";
> +	default:
> +		return "Unknown TA Slider State";
> +	}
> +}
> +
>  struct amd_pmf_info {
>  	__u64 size;
>  
> 

Sashiko complains about missing a few enum values, please check if those 
should be covered. And if not, missing things should be justified in the 
changelog so nobody ends up wondering "why?" later on.

-- 
 i.

