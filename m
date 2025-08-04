Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD65E2F2D
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Aug 2025 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294302; cv=none; b=pekkblYvLE5wjkAXmHXtRGebehEF3aDNd8Eo0sr/iWBDtXYjx0FaMF5s5gl5UZvxcqrfMhgKOf2c4VF/a8ZL/v1Hr/Bx1Vt7/ZTnCdsITGK/he2XoS/tCbPQxWcdhMZAdabncTLyV84pqJwe4ABW+3Di9RbLCWstamK75MVz5gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294302; c=relaxed/simple;
	bh=XoOzbA9SCrJQUV6Gp/z8lLT57E8nMSSY0MQE5tG6na4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=egStJtJPcRtXnHQj0VSBWjfX1pOvWP9lYUUwrgF3zW/lh2YqCLB0ACgsyy3de2sdV6pw/Wf6m1lOeHieU0P2NTGiA0R8D18PuVqvyhyFzQtX5Cfo9C+OL3VqOh0S93zKV9+fgmnHE8QTctDPFn4fzxU2rzi6t/aNFaH2WCLvCLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8jXZXE3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8jXZXE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754294301; x=1785830301;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XoOzbA9SCrJQUV6Gp/z8lLT57E8nMSSY0MQE5tG6na4=;
  b=a8jXZXE3zPDdPlBSFuTctQc8bsz7g9dhmMSbMBdjX0pMHaZIRjyspcC7
   ivlK4VPGHs9lcjKlZhWdxex7tgHTOkVqjZM6Qlcy4vXan99Ahn+3ERLgE
   JYegRKzRnjL/PkxYuDCQiIH/OXjLtoWUhWug5MdpkdpSCIXG30QfI63jq
   mzAncCwe18349MJ9vDcgj9vCLmMaYqJ/uF6vSS3R73UBKE9fj1uVqTWr2
   Chs61VK0+e93vBMWe5OxGuC8KrewrHzp+LY/VWUQi7RmN4wX7o5uzPSTF
   Z8I2X1eel0w04JtfOzFhM2uoAjFFuO51M9Hu1JhW2oKIbxK2EtSmEVA9z
   w==;
X-CSE-ConnectionGUID: 0caste4VQlu31hn8+zXimw==
X-CSE-MsgGUID: XZ/EXGqjSJe0kPqsX8v39A==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="79102028"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79102028"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 00:58:18 -0700
X-CSE-ConnectionGUID: XsoAd94uQ0Gn89ItzV+NtA==
X-CSE-MsgGUID: hFBfYTXzToiG/dXNV1YAYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169472074"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 00:58:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 4 Aug 2025 10:58:13 +0300 (EEST)
To: noahpro <noahpro@gmail.com>
cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-wmi: add Omen 16-wf0xxx (board 8BAB)
 fan & perf-profile support
In-Reply-To: <20250731213529.27378-1-noahpro@gmail.com>
Message-ID: <80eb0a87-6f21-8276-5349-50745c7c0840@linux.intel.com>
References: <20250731213529.27378-1-noahpro@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Jul 2025, noahpro wrote:

> Recent 2024-era Omen laptops (DMI board 8BAB) use different
> thermal-profile commands (0x48 default, 0x31 performance) but are very
> similar to those used by the existing Victus-S code paths although
> it wasn't in the config.  As a result:
> 
> - `/sys/devices/platform/hp-wmi/fan*` reported 0
> - `echo 0 | sudo tee /sys/devices/platform/hp-wmi/hwmon/*/pwm1_enable`
>   max-fan writes failed
> - platform_profile was not registered, so performance/balanced switching
>   was not available
> 
> I added the new board to victus_s_thermal_profile_boards[] and created
> omen_2024_thermal_profile_boards[] with HP_OMEN_2024_THERMAL_PROFILE_*
> enums, and switched the Victus-S performance setter to choose the
> right wmi commands.
> 
> I was was unsure of whether to rename the victus_s_ names to
> newer or 2024 boards everywhere becuase this would clutter the commit.
> 
> Tested on HP Omen 16-wf0xxx (BIOS F.21):
>  * fan RPMs readable
>  * performance/balanced switching works (needed nvidiaDynamicBoost to
>    see max wattage changes but it does work)
>  * "max fans" honoured (firmware reverts after 120 sec, but the existing
>    timed board variables don't work when testing. On Windows the
>    Omen Command Center simply sends lots of commands to keep this alive
>    so this seems fine to me as user applications can write to the
>    fan speed every ~100 sec).
> 
> Signed-off-by: noahpro <noahpro@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 41 ++++++++++++++++++++++++++++----
>  1 file changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index db5fdee2109c..55c3680724b5 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -92,9 +92,13 @@ static const char * const victus_thermal_profile_boards[] = {
>  	"8A25"
>  };
>  
> -/* DMI Board names of Victus 16-s1000 laptops */
> +/* DMI Board names of newer 2024+ laptops that have use different wmi commands */
>  static const char * const victus_s_thermal_profile_boards[] = {
> -	"8C9C"
> +	"8C9C", "8BAB"
> +};
> +
> +static const char * const omen_2024_thermal_profile_boards[] = {
> +	"8BAB"
>  };
>  
>  enum hp_wmi_radio {
> @@ -245,6 +249,11 @@ enum hp_thermal_profile_victus_s {
>  	HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE		= 0x01,
>  };
>  
> +enum hp_thermal_profile_omen_2024 {
> +	HP_OMEN_2024_THERMAL_PROFILE_DEFAULT	  = 0x48,
> +	HP_OMEN_2024_THERMAL_PROFILE_PERFORMANCE  = 0x31,
> +};
> +
>  enum hp_thermal_profile {
>  	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
>  	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> @@ -1580,6 +1589,19 @@ static bool is_victus_s_thermal_profile(void)
>  			    board_name) >= 0;
>  }
>  
> +static bool is_omen_2024_thermal_profile(void)
> +{
> +	const char *board_name;
> +
> +	board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +	if (!board_name)
> +		return false;
> +
> +	return match_string(omen_2024_thermal_profile_boards,
> +			    ARRAY_SIZE(omen_2024_thermal_profile_boards),
> +			    board_name) >= 0;
> +}

This feels something that should be done once and then stored into a 
variable. Sadly this driver doesn't seem to rely on using drvdata but 
lots of static vars.

>  static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
>  					    bool *ppab_enable,
>  					    u8 *dstate,
> @@ -1666,19 +1688,28 @@ static int platform_profile_victus_s_set_ec(enum platform_profile_option profile
>  
>  	switch (profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
> +		if (is_omen_2024_thermal_profile())
> +			tp = HP_OMEN_2024_THERMAL_PROFILE_PERFORMANCE;
> +		else
> +			tp = HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE;
>  		gpu_ctgp_enable = true;
>  		gpu_ppab_enable = true;
>  		gpu_dstate = 1;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
> +		if (is_omen_2024_thermal_profile())
> +			tp = HP_OMEN_2024_THERMAL_PROFILE_DEFAULT;
> +		else
> +			tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
>  		gpu_ctgp_enable = false;
>  		gpu_ppab_enable = true;
>  		gpu_dstate = 1;
>  		break;
>  	case PLATFORM_PROFILE_LOW_POWER:
> -		tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
> +		if (is_omen_2024_thermal_profile())
> +			tp = HP_OMEN_2024_THERMAL_PROFILE_DEFAULT;
> +		else
> +			tp = HP_VICTUS_S_THERMAL_PROFILE_DEFAULT;
>  		gpu_ctgp_enable = false;
>  		gpu_ppab_enable = false;
>  		gpu_dstate = 1;
> 
> base-commit: 1798561befd8be1e52feb54f850efcab5a595f43
> 

-- 
 i.

