Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6B1392824
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781083383; cv=none; b=pEsq4eBY9NbXxQOMMd1JcItmWiq9IPRe1C43JOiegDl+8RLz4f+aM0Y0tIuo/68yz1yWMbBHzSjIjjfVbCWosB5cTA6ezUs7mIsuDPxLpElwPpjtygOKbHuXv3W4JhJkvdA5BxH9HQTOb08TW4qqjkAuBcCqpuz1v3yTIkJVrPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781083383; c=relaxed/simple;
	bh=6cB4jQLjVgpsF379PTnoBpSB1+CtPg9w3bWNrdZhbME=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ke1LeHOXErdZ9cnKtX04EBHroRJZiCRowDe/Chck7YECQXS57747eKMOIQHr+Vfh5BiuQnYf/LwlzykVFpm5dugilAvYHYaLVgy3ZXXNCYDsRqOl8Of6brBci9A0mW80qAfCLdytsNf1zKRt/xpdSdIGR7qT3wC90diwWE9wJHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rvry77BO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rvry77BO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781083381; x=1812619381;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6cB4jQLjVgpsF379PTnoBpSB1+CtPg9w3bWNrdZhbME=;
  b=Rvry77BOJY7lwVLyhGlmJxCezbp/XGI4HNI3swvhhOTFjL2aQwi8nFni
   vwmviltbEKMa+Z9y9SMqxcZrY14ePq1UcyuMm4QfGhB7jE/i5l7GjnREe
   L2Qp0xMhYsIStW3fx//bFZwyKdCowlWd7EbYa5nITTTNVHSKe2DCR2uB/
   6aJa/4hUsSH2wsZcGyxGy5NYbQE3/40JMy5hlfov4R3hY66RIS5FRERL8
   9HApcGMeGgy8MIQUbDJgIVK+4pP2L0AFErfiHGE1q/i/8hDFvOaKVkjc7
   u0vuXkjKKH2B2XLx1ZfJtIROqf0X3uXdP2K3AAITC3E3P/BsgVKNZ4HwI
   Q==;
X-CSE-ConnectionGUID: CSycNKiESRydCKNdpHlIEg==
X-CSE-MsgGUID: wWqApRSmS0mUDC/HsjSeuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81874403"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81874403"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 02:22:43 -0700
X-CSE-ConnectionGUID: GeMVb2YySgesLZlvhd5NAQ==
X-CSE-MsgGUID: IhugNHNDQnaBQNkKJrt3YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="239787235"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 02:22:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 12:22:37 +0300 (EEST)
To: Radhey Kalra <radheykalra901@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    krishna.chomal108@gmail.com
Subject: Re: [PATCH v9 1/3] platform/x86: hp-wmi: Introduce board-specific
 feature data
In-Reply-To: <20260606080204.724444-2-radheykalra901@gmail.com>
Message-ID: <03f68166-5b76-8fbf-5782-048a0e3d1c8a@linux.intel.com>
References: <20260606080204.724444-1-radheykalra901@gmail.com> <20260606080204.724444-2-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 6 Jun 2026, Radhey Kalra wrote:

> The hp_wmi DMI table is about to carry more than thermal-profile data.
> Replace the direct thermal_profile_params .driver_data pointers with
> hp_wmi_board_params and rename the table/setup helper accordingly.
> 
> No functional changes intended.
> 
> Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 121 ++++++++++++++++++++-----------
>  1 file changed, 77 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 48292cc..4a795e6 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -133,11 +133,35 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
>  	.ec_tp_offset	= HP_NO_THERMAL_PROFILE_OFFSET,
>  };
>  
> -/*
> - * A generic pointer for the currently-active board's thermal profile
> - * parameters.
> - */
> -static struct thermal_profile_params *active_thermal_profile_params;
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
> +
> +static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
> +{
> +	if (!active_board_params)
> +		return NULL;
> +
> +	return active_board_params->thermal_profile;
> +}
>  
>  /* DMI board names of devices that should use the omen specific path for
>   * thermal profiles.
> @@ -187,75 +211,75 @@ static const char * const victus_thermal_profile_boards[] = {
>  	"8A25",
>  };
>  
> -/* DMI Board names of Victus 16-r and Victus 16-s laptops */
> -static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
> +/* DMI board-specific feature data for Omen and Victus laptops. */
> +static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8902") },
> -		.driver_data = (void *)&omen_v1_legacy_thermal_params,
> +		.driver_data = (void *)&omen_v1_legacy_board_params,
>  	},
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
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BC2") },
> -		.driver_data = (void *)&omen_v1_thermal_params,
> +		.driver_data = (void *)&omen_v1_board_params,
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
> -		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
> +		.driver_data = (void *)&omen_v1_no_ec_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
> -		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
> +		.driver_data = (void *)&omen_v1_no_ec_board_params,
>  	},
>  	{},
>  };

Could you do a rebase for this as there are a few ID additions in the 
for-next branch so I don't need to handle the conversion myself.

> @@ -1862,7 +1886,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
>  	u8 current_dstate, current_gpu_slowdown_temp, tp;
>  	const struct thermal_profile_params *params;
>  
> -	params = active_thermal_profile_params;
> +	params = hp_wmi_thermal_profile();
> +	if (!params)
> +		return -ENODEV;
> +
>  	if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
>  	    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
>  		*profile = active_platform_profile;
> @@ -1874,10 +1901,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
>  		return ret;
>  
>  	/*
> -	 * We cannot use active_thermal_profile_params here, because boards
> -	 * like 8C78 have tp == 0x0 || tp == 0x1 after cold boot, but logically
> -	 * it should have tp == 0x30 || tp == 0x31, as corrected by the Omen
> -	 * Gaming Hub on windows. Hence accept both of these values.
> +	 * Boards like 8C78 have tp == 0x0 || tp == 0x1 after cold boot,
> +	 * but logically it should have tp == 0x30 || tp == 0x31, as
> +	 * corrected by the Omen Gaming Hub on windows. Hence accept both
> +	 * of these values.
>  	 */
>  	if (tp == victus_s_thermal_params.performance ||
>  	    tp == omen_v1_thermal_params.performance) {
> @@ -1912,12 +1939,12 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
>  
>  static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
>  {
> -	struct thermal_profile_params *params;
> +	const struct thermal_profile_params *params;
>  	bool gpu_ctgp_enable, gpu_ppab_enable;
>  	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
>  	int err, tp;
>  
> -	params = active_thermal_profile_params;
> +	params = hp_wmi_thermal_profile();
>  	if (!params)
>  		return -ENODEV;
>  
> @@ -2183,6 +2210,7 @@ static const struct platform_profile_ops hp_wmi_platform_profile_ops = {
>  static int thermal_profile_setup(struct platform_device *device)
>  {
>  	const struct platform_profile_ops *ops;
> +	const struct thermal_profile_params *params;
>  	int err, tp;
>  
>  	if (is_omen_thermal_profile()) {
> @@ -2214,13 +2242,17 @@ static int thermal_profile_setup(struct platform_device *device)
>  
>  		ops = &platform_profile_victus_ops;
>  	} else if (is_victus_s_thermal_profile()) {
> +		params = hp_wmi_thermal_profile();
> +		if (!params)
> +			return -ENODEV;
> +
>  		/*
>  		 * For an unknown EC layout board, platform_profile_victus_s_get_ec(),
>  		 * behaves like a wrapper around active_platform_profile, to avoid using
>  		 * uninitialized data, we default to PLATFORM_PROFILE_BALANCED.
>  		 */
> -		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
> -		    active_thermal_profile_params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
> +		if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
> +		    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
>  			active_platform_profile = PLATFORM_PROFILE_BALANCED;
>  		} else {
>  			err = platform_profile_victus_s_get_ec(&active_platform_profile);
> @@ -2681,24 +2713,25 @@ static int hp_wmi_hwmon_init(void)
>  	return 0;
>  }
>  
> -static void __init setup_active_thermal_profile_params(void)
> +static void __init setup_active_board_params(void)
>  {
>  	const struct dmi_system_id *id;
> +	const struct thermal_profile_params *params;
>  
> -	/*
> -	 * Currently only victus_s devices use the
> -	 * active_thermal_profile_params
> -	 */
> -	id = dmi_first_match(victus_s_thermal_profile_boards);
> +	id = dmi_first_match(hp_wmi_feature_boards);
>  	if (id) {
> +		active_board_params = id->driver_data;
> +		params = hp_wmi_thermal_profile();
> +		if (!params)
> +			return;
> +
>  		/*
>  		 * Marking this boolean is required to ensure that
>  		 * is_victus_s_thermal_profile() behaves like a valid
>  		 * wrapper.
>  		 */
>  		is_victus_s_board = true;
> -		active_thermal_profile_params = id->driver_data;
> -		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
> +		if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
>  			pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
>  				dmi_get_system_info(DMI_BOARD_NAME));
>  		}
> @@ -2733,10 +2766,10 @@ static int __init hp_wmi_init(void)
>  		}
>  
>  		/*
> -		 * Setup active board's thermal profile parameters before
> -		 * starting platform driver probe.
> +		 * Setup active board feature data before starting platform
> +		 * driver probe.
>  		 */
> -		setup_active_thermal_profile_params();
> +		setup_active_board_params();
>  		err = platform_driver_probe(&hp_wmi_driver, hp_wmi_bios_setup);
>  		if (err)
>  			goto err_unregister_device;
> 

-- 
 i.

