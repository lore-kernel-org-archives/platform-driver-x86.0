Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D6239658D
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 11:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277852; cv=none; b=DBWn+QNSebAwhG5fGiUvckKWzyyF3CuNW6jmvU/MtOxdfyDRzJBIESQrH0B0+WUoAR27mfBuAmhrTis7/iTxd23+n6d9zD2otc4CJRc11F69HzO2H1GJ/XcS7PDxEn6jCNiL284picKZ9TvpplCPngf8VL0WcwWMFqbysmxTBkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277852; c=relaxed/simple;
	bh=b4iMt0cDwrCCeVQpWjXwd7XI1/BLb/iM+wgsawUcrzU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Tg65GxCfS+HiZaoepLEDhIPVgJkI/GDF/WBvxFtNTiopvMDic2T/Ek0A70en8h940dpYzQRSmBYhsd1Z8+TBqiL8bSDgsut/N/PlLhf1OEWUnIIcKGvtjZ8MHhSsoSV6/MePqO+sIC37FRCw9aQMq0vz13+X73VHAzl22+xdBjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izY0MuIi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izY0MuIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779277852; x=1810813852;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=b4iMt0cDwrCCeVQpWjXwd7XI1/BLb/iM+wgsawUcrzU=;
  b=izY0MuIize5EEHRZhA5c8kZC1hVYMvB/ItXOPQUpnIQeZIA0/+2o2ahK
   pdB7cnOsapudFdKqM6YbwvGxBcjwGIMBXmEyVFs8rjVYOWhTiuglwcAw2
   0GKXxhxGcJWURrpMroj4Qw9dTGYSVAEcbxiphw+vAmfxqRPVu6mpfwO/+
   AOpE8ZdHCyLhbvpCW8TltW7WmLbAV5OdAggvb7M2RLTydSqH6bjufa2z+
   tvUxpuhqwglARnc+Z7rn5bRQWx6QE6hqBkV6oYKYUL82np6Su5ZgyTO58
   DQMLBXagTb/hlbYaqosl79OFFFAwl54xQhM6sEt/em7oiIntH6DPTiyrP
   A==;
X-CSE-ConnectionGUID: NDTbeFC+SOKHgagNrAimgA==
X-CSE-MsgGUID: dRh0iMhbSsKeaE6MafrzoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102851366"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="102851366"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 04:50:47 -0700
X-CSE-ConnectionGUID: CBUJKGZVRfymkU+ufjfYjQ==
X-CSE-MsgGUID: wWaBQZ4uR06hbKnaeU9I8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="237555054"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 04:50:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 20 May 2026 14:50:41 +0300 (EEST)
To: Radhey Kalra <radheykalra901@gmail.com>
cc: platform-driver-x86@vger.kernel.org, krishna.chomal108@gmail.com, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v4 4/4] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan
 control
In-Reply-To: <20260520025325.103701-5-radheykalra901@gmail.com>
Message-ID: <da964529-dfee-ee16-9c79-c1a35aca1d8f@linux.intel.com>
References: <20260520025325.103701-1-radheykalra901@gmail.com> <20260520025325.103701-5-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 May 2026, Radhey Kalra wrote:

> HP Victus 15-fb0xxx board 8A3D exposes the Victus fan table and accepts
> the existing Victus fan-speed WMI control path. Add it as a
> fan-control-only board so the hwmon PWM interface is enabled without
> forcing Victus S thermal-profile handling on this model.

I think it would make sense to split these two changes to own patch to 
have both focus on a single thing.

> Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS F.22.
> The fan table query succeeded and returned rows including cpu=23/gpu=0
> followed by cpu=24/gpu=22. With 8A3D enabled in the fan-control path, pwm1
> and pwm1_enable were exposed through hwmon.
> 
> Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 9d2966e..514c28c 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -172,6 +172,10 @@ static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
>  	.fan_profile		= &victus_s_fan_profile_params,
>  };
>  
> +static const struct hp_wmi_board_params victus_8a3d_board_params = {
> +	.fan_profile		= &victus_s_fan_profile_params,
> +};
> +
>  static const struct hp_wmi_board_params *active_board_params;
>  
>  /* DMI board names of devices that should use the omen specific path for
> @@ -224,6 +228,10 @@ static const char * const victus_thermal_profile_boards[] = {
>  
>  /* DMI board-specific feature data for Omen and Victus laptops. */
>  static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
> +		.driver_data = (void *)&victus_8a3d_board_params,
> +	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
>  		.driver_data = (void *)&omen_v1_legacy_board_params,
> @@ -2752,15 +2760,17 @@ static void __init setup_active_board_params(void)
>  	if (id) {
>  		active_board_params = id->driver_data;
>  		active_thermal_profile_params = active_board_params->thermal_profile;
> -		/*
> -		 * Marking this boolean is required to ensure that
> -		 * is_victus_s_thermal_profile() behaves like a valid
> -		 * wrapper.
> -		 */
> -		is_victus_s_board = true;
> -		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
> -			pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
> -				dmi_get_system_info(DMI_BOARD_NAME));
> +		if (active_thermal_profile_params) {
> +			/*
> +			 * Marking this boolean is required to ensure that
> +			 * is_victus_s_thermal_profile() behaves like a valid
> +			 * wrapper.
> +			 */
> +			is_victus_s_board = true;
> +			if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
> +				pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
> +					dmi_get_system_info(DMI_BOARD_NAME));
> +			}
>  		}
>  	}
>  }
> 

-- 
 i.

