Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4109499F14;
	Mon, 12 Oct 2026 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817938; cv=none; b=sctJkkvXo/+aNPqJ2sKH1j/jE4xcAVOw5FmYFOrruTRjiqJzK2/tAqXRoFB3lxpomPgXnW6LXOScYeVkV7u34qGoAAOvG85ArkDAanuFcd0W3FW8GfqcTbzoCZKGUvBTdVlox8QWrTigObl0iXKSt/QuJBOmZJ9gpR3zPNQiCgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817938; c=relaxed/simple;
	bh=d4Ik5OmF8txIQXW7kr+1V3FL0GReJc55cUCuXHzQh+A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dcJU43GGTMmMgLyRyeLDZ2U8+agjkwCjytRew8ZQv/FoHyR5rwvITOtGcdxljP4EonuQI+2HNZ/rIXAJ5spwdARjsGrR7qhOzrPCKymjlUk/ye/OgAiQtHmrVunvGHnwBlwfHOyB2Vv3ETbpBjNe0GXfb1js1iMDQVxvKT2QWfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L70l+P+m; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L70l+P+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791817936; x=1823353936;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=d4Ik5OmF8txIQXW7kr+1V3FL0GReJc55cUCuXHzQh+A=;
  b=L70l+P+mVOSH+JzE/hG73sgGyxvOijyzT9OPrlm4fRYS8EZSGpHQ4Mtg
   jl2fS6kUJiay8StNw/wp3oY1v5HC7IuluCvbiN+dgyIDA8YbRG7LX3SAi
   KxqFgwBWj9iU9spdzloh3OGsuxRuV8cfZQVWz+buM9Tsn9nG52pFxDuO0
   7LfVgCJZNxT7okJsPRSBKjfBktCLOdz3QFL5s7hbfPbBhriJTUBDY8QmL
   yTLZUqXDrx6wGGxdHS4tZ7vLG/BTTsKJgMnalMxFmhDuowfstgFn4k9Tb
   6RzKKZ4i3dpVZ3ZgU3juZJkCmLvcjuclTnvZ4du+Xg0wrQdPIOg+eaocU
   A==;
X-CSE-ConnectionGUID: s0Dw6ZQvTJmKQ7GY+SCADA==
X-CSE-MsgGUID: eCFmrgmFQHiYUsBEZ3omdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="402583"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="402583"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:12:15 -0700
X-CSE-ConnectionGUID: XWMRspO+RlqvDXPcpnajPQ==
X-CSE-MsgGUID: 5ogL04JgQpGWYBbKTVH0rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1015207"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:12:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Oct 2026 18:12:09 +0300 (EEST)
To: Suryansh Singh <technosfan14@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, krishna.chomal108@gmail.com, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: hp-wmi: Define known Victus S driver
 data
In-Reply-To: <20260927093852.161958-1-technosfan14@gmail.com>
Message-ID: <ec244f7d-0b51-43f9-c932-2d6ea5952672@linux.intel.com>
References: <20260927085539.96791-1-technosfan14@gmail.com> <20260927093852.161958-1-technosfan14@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 27 Sep 2026, Suryansh Singh wrote:

> Currently, Victus S thermal parameters use the Unknown Offset for TP
> (Thermal Profile) from the EC offsets enum, even though there is a
> Victus S EC Offset in the same enum.
> 
> This was done so because the EC layout is highly
> variable across this lineup of laptops. The only place where the 0x59
> offset is used is the driver data for Omen V1 models, despite it being
> labelled as the Victus S TP offset. The name clearly doesn't relate
> to the use case.
> 
> However, after some downstream searching, I have found that there is
> a Victus S board which does have the expected EC layout corresponding to
> the very Victus S offset itself.
> 
> Add known board parameters for the Victus S models to correctly map
> the found board (8C99) and any others in the future, and add
> required if-statements for platform profile options for the new
> parameters.
> 
> Link: https://github.com/yunusemreyl/omen-space/commit/f32a76386592d1a604e574c693b323d15e978089
> Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 7ab81ce5f8d4..7851cb607c74 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -121,6 +121,13 @@ static const struct thermal_profile_params victus_s_thermal_params = {
>  	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
>  };
>  
> +static const struct thermal_profile_params victus_s_known_thermal_params = {
> +	.performance	= HP_VICTUS_S_THERMAL_PROFILE_PERFORMANCE,
> +	.balanced	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
> +	.low_power	= HP_VICTUS_S_THERMAL_PROFILE_DEFAULT,
> +	.ec_tp_offset	= HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET,
> +};
> +
>  static const struct thermal_profile_params omen_v1_thermal_params = {
>  	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
>  	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
> @@ -164,6 +171,11 @@ static const struct hp_wmi_board_params victus_s_board_params = {
>  	.fan_profile		= &victus_s_fan_profile_params,
>  };
>  
> +static const struct hp_wmi_board_params victus_s_known_board_params = {
> +	.thermal_profile	= &victus_s_known_thermal_params,
> +	.fan_profile		= &victus_s_fan_profile_params,
> +};
> +
>  static const struct hp_wmi_board_params omen_v1_board_params = {
>  	.thermal_profile	= &omen_v1_thermal_params,
>  	.fan_profile		= &victus_s_fan_profile_params,
> @@ -316,7 +328,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
> -		.driver_data = (void *)&victus_s_board_params,
> +		.driver_data = (void *)&victus_s_known_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
> @@ -2146,10 +2158,12 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
>  	 * of these values.
>  	 */
>  	if (tp == victus_s_thermal_params.performance ||
> -	    tp == omen_v1_thermal_params.performance) {
> +	    tp == omen_v1_thermal_params.performance ||
> +		tp == victus_s_known_thermal_params.performance) {

Please remind me, why can't we generalize this and have to keep adding 
numbers even if we should have the params now per board in struct so why 
cannot we map using those numbers?

This is also misaligned.

>  		*profile = PLATFORM_PROFILE_PERFORMANCE;
>  	} else if (tp == victus_s_thermal_params.balanced ||
> -		   tp == omen_v1_thermal_params.balanced) {
> +			tp == omen_v1_thermal_params.balanced ||
> +			tp == victus_s_known_thermal_params.balanced) {

Same comments here.

>  		/*
>  		 * Since both PLATFORM_PROFILE_LOW_POWER and
>  		 * PLATFORM_PROFILE_BALANCED share the same thermal profile
> 

-- 
 i.

