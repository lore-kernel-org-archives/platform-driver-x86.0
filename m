Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC353BCD04
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276965; cv=none; b=F11INO2F6yidtx6QOMAGIXhUvJy+St/CneJBd1uYOhNqfEy5Rq2gvtX8H3ywn71NT/xhtMwfzdxQEE+uQID2E4KBcve27AmEPhpjIK5bKjVUhXkP2LUYm1ZM5BVu49sILe/csqAGM+bmSZ4y6kSMb43XJS0qau3zZTrYP7fDbRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276965; c=relaxed/simple;
	bh=sGHPwXQDL3PCC0RlIpnjo1zQx0tbSyTdzkLLn3PvLIg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ABOq9fGEdj1szQObacKh+UeGyNtoRyMxPZC6/abBEef9eonPhmQ4rq9uIWdO4/Br2sLR6Bcn2z+JtsHxtz92LD85vzw2HyzBDKGFlBtGEQ8pbw5jecUDuXaIEsqMgXEROC6PkFcqYvWXEhVB9q5BLrPeURDCHO/LXi57fGp2/Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lbjh8F9B; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lbjh8F9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779276963; x=1810812963;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sGHPwXQDL3PCC0RlIpnjo1zQx0tbSyTdzkLLn3PvLIg=;
  b=Lbjh8F9BzTxO7gkLEbFLyzQ+7C6HyogWH9OBYa/2Yysw1NzodA3GJtEC
   0ONnz9S+w3P7qKMqBbc/YRgwr5NqGZpyod369fJg1mqUJ1YYMADuvFWsA
   TKvY3lq71KTVjkwqxSXdZDX8t6XhtcBaJnphU/VjOeWlXNml2ChT2CqpH
   xteju7K60MT04UgsEU6y8/FOtlw2BD4FG4ELas04TeeHmQp8ifh6qSkRl
   9wmeNOfw0Xlf4g2kka6d8mSfhEpTQLOcnOKMBcHTAx7KnX6EakB3grgJa
   XPukVAaFuK0ozsZJKt6+trTwrMbLen1I2hGzXo7NpHVybAHBChnqEfxWs
   g==;
X-CSE-ConnectionGUID: TFDOE5ZkQAmXBdWfS1987A==
X-CSE-MsgGUID: nbyajJ8iTPyXoA9FAVVSvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102850005"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="102850005"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 04:36:02 -0700
X-CSE-ConnectionGUID: E5WTpf5YRjGOylOfvkFQEg==
X-CSE-MsgGUID: eCH4qlszRgWOX1TMiFLxjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="237550557"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 04:36:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 20 May 2026 14:35:57 +0300 (EEST)
To: Radhey Kalra <radheykalra901@gmail.com>
cc: platform-driver-x86@vger.kernel.org, krishna.chomal108@gmail.com, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v4 1/4] platform/x86: hp-wmi: Introduce board-specific
 feature data
In-Reply-To: <20260520025325.103701-2-radheykalra901@gmail.com>
Message-ID: <6c0ad366-ff10-db75-2495-8ece40a6f8cb@linux.intel.com>
References: <20260520025325.103701-1-radheykalra901@gmail.com> <20260520025325.103701-2-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 May 2026, Radhey Kalra wrote:

> The victus_s_thermal_profile_boards DMI table is about to carry more than
> thermal-profile data. Replace the direct thermal_profile_params
> .driver_data pointers with hp_wmi_board_params and rename the table/setup
> helper accordingly.
> 
> No functional changes intended.
> 
> Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 82 ++++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index d1cc6e7..b226695 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -133,11 +133,29 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
>  	.ec_tp_offset	= HP_NO_THERMAL_PROFILE_OFFSET,
>  };
>  
> -/*
> - * A generic pointer for the currently-active board's thermal profile
> - * parameters.
> - */
> -static struct thermal_profile_params *active_thermal_profile_params;
> +static const struct thermal_profile_params *active_thermal_profile_params;
> +
> +struct hp_wmi_board_params {
> +	const struct thermal_profile_params *thermal_profile;
> +};
> +
> +static const struct hp_wmi_board_params victus_s_board_params = {
> +	.thermal_profile	= &victus_s_thermal_params,
> +};
> +
> +static const struct hp_wmi_board_params omen_v1_board_params = {
> +	.thermal_profile	= &omen_v1_thermal_params,
> +};
> +
> +static const struct hp_wmi_board_params omen_v1_legacy_board_params = {
> +	.thermal_profile	= &omen_v1_legacy_thermal_params,
> +};
> +
> +static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
> +	.thermal_profile	= &omen_v1_no_ec_thermal_params,
> +};
> +
> +static const struct hp_wmi_board_params *active_board_params;
>  
>  /* DMI board names of devices that should use the omen specific path for
>   * thermal profiles.
> @@ -187,67 +205,67 @@ static const char * const victus_thermal_profile_boards[] = {
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
> @@ -1904,7 +1922,7 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
>  
>  static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
>  {
> -	struct thermal_profile_params *params;
> +	const struct thermal_profile_params *params;
>  	bool gpu_ctgp_enable, gpu_ppab_enable;
>  	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
>  	int err, tp;
> @@ -2673,23 +2691,20 @@ static int hp_wmi_hwmon_init(void)
>  	return 0;
>  }
>  
> -static void __init setup_active_thermal_profile_params(void)
> +static void __init setup_active_board_params(void)
>  {
>  	const struct dmi_system_id *id;
>  
> -	/*
> -	 * Currently only victus_s devices use the
> -	 * active_thermal_profile_params
> -	 */
> -	id = dmi_first_match(victus_s_thermal_profile_boards);
> +	id = dmi_first_match(hp_wmi_feature_boards);
>  	if (id) {
> +		active_board_params = id->driver_data;
> +		active_thermal_profile_params = active_board_params->thermal_profile;

Is the second variable necessary anymore? Can't we always deref it from
active_board_params?

Using drvdata, however, would be generally preferred over globals but 
that's a pre-existing problem in this driver (as with many other 
platform drivers).

>  		/*
>  		 * Marking this boolean is required to ensure that
>  		 * is_victus_s_thermal_profile() behaves like a valid
>  		 * wrapper.
>  		 */
>  		is_victus_s_board = true;
> -		active_thermal_profile_params = id->driver_data;
>  		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
>  			pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
>  				dmi_get_system_info(DMI_BOARD_NAME));
> @@ -2724,11 +2739,8 @@ static int __init hp_wmi_init(void)
>  			goto err_destroy_input;
>  		}
>  
> -		/*
> -		 * Setup active board's thermal profile parameters before
> -		 * starting platform driver probe.
> -		 */
> -		setup_active_thermal_profile_params();
> +		/* Setup active board feature data before starting platform driver probe. */

Keep comments limited to <= 80 cols (long lines are hard to read).

This only applies to comments, the for code the limit is 100 columns where 
it helps to make the code cleaner.

> +		setup_active_board_params();
>  		err = platform_driver_probe(&hp_wmi_driver, hp_wmi_bios_setup);
>  		if (err)
>  			goto err_unregister_device;
> 

-- 
 i.

