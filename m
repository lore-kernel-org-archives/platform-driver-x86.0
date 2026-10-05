Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818DA318BB8;
	Mon,  5 Oct 2026 17:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791223016; cv=none; b=TuQW9pjniiBGNjKXj70u7x6vO44quXoWAXxG1r78k/y6N8fG1MtoNbHi7mXRIVvJHtMZKS6Vzu55Lx3pT2OhR184BlIAnXvynl3c54g/92XBiCdTFCIVtNTkkHZqgUnpWCnfACE4hNe3gzIAbt/EA1comKM5wnTsw0jJ6eL1XtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791223016; c=relaxed/simple;
	bh=OZ/r5GWDJFDbXR2EYR3Z7zBySEbFAHVzmhjUpChzQis=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AHGWn1BYS2GS0WymzpnJoJN7Zg34CJhcxYdXnQ8KwXlLpdDQ8/cvVJux6BQ6fcQgoYOIkZ10S8crJurb+bCF4et4CP9LtK/7TcaUZbUqIiDBkT9fbhXtAAZTZ3sI1YonrAHNSUZMND4ZCUpcaOeEKlaznTdD75JFY4jHjSRCG6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jv7XZHe1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jv7XZHe1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791223015; x=1822759015;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OZ/r5GWDJFDbXR2EYR3Z7zBySEbFAHVzmhjUpChzQis=;
  b=jv7XZHe1lQw7neHxSUiwii92kfqCPfV3xeLW2Ttl0c28BeQTdR4e9/fI
   mlKqAlQ+OVr6RKUQoZ8dJd9Z9bS5/YGNg8NGsU2zkAUcvt02ejwkPcVxi
   4lc+tYyf4zmxgyLCbvI7aI+s0nxU9I37bPUux4VQMHiMiISHmNvCDmUv0
   vaE0SmFajoMFyvx87WY5dVOq0WuQC+OZZnICzoutEgpOjntDaCXnTvMQO
   VGE+JXO7Yw+p6LKvduXL3hyYG9fB7pjsPZpeZu5qTZLYlyjMVHzYyC8/K
   fQOBQ5+u8hE0zkRRkHSEh0ntb2ozxGQ59ejaDFq1UntTth+8uC5ND5j+K
   w==;
X-CSE-ConnectionGUID: nZ0CFnvfToajvY9YOVUtGw==
X-CSE-MsgGUID: paTwt6MTRMqJboPXx0/7iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="51857"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="51857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:56:54 -0700
X-CSE-ConnectionGUID: xHeCN9U0SYKTPbSEK00QbA==
X-CSE-MsgGUID: g3Unrkq2RXGgbiflfEgxzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="274677223"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:56:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Oct 2026 20:56:47 +0300 (EEST)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Derek John Clark <derekjohn.clark@gmail.com>, 
    =?ISO-8859-15?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Eileen <eileen@one-netbook.com>
Subject: Re: [PATCH v1 1/2] platform/x86: oxpec: Fix Apex charge limit
 control
In-Reply-To: <20260920190438.3444923-1-lkml@antheas.dev>
Message-ID: <272b2d3c-243a-cfb8-bf34-c6cffc7e5fec@linux.intel.com>
References: <20260920190438.3444923-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 20 Sep 2026, Antheas Kapenekakis wrote:

> The OneXPlayer Apex uses E5/E6 for battery bypass / charge limit, making
> it the first device to deviate. This was verified by a user on Windows
> with BIOS version 2.17 and later by running this kernel patch.
> 
> Drop X1_ from the MASK variables as they are common in all devices,
> introduce a board enum for Apex, and make it use the new E5/E6 registers
> for charge limit / bypass. Apply the same quirks as oxp_fly, since APEX
> uses the same registers otherwise.
> 
> Fixes: 3385ea97c14d ("platform/x86: oxpec: Add support for OneXPlayer APEX")
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/oxpec.c | 68 ++++++++++++++++++++++++++++--------
>  1 file changed, 53 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index 34bb17fca148..38c272995437 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -50,6 +50,7 @@ enum oxp_board {
>  	oxp_x1,
>  	oxp_g1_i,
>  	oxp_g1_a,
> +	oxp_apex,
>  };
>  
>  static enum oxp_board board;
> @@ -93,11 +94,14 @@ static struct device *oxp_dev;
>  #define OXP_X1_CHARGE_LIMIT_REG		0xA3 /* X1 charge limit (%) */
>  #define OXP_X1_CHARGE_INHIBIT_REG	0xA4 /* X1 bypass charging */
>  
> -#define OXP_X1_CHARGE_INHIBIT_MASK_AWAKE	0x01
> +#define OXP_APEX_CHARGE_LIMIT_REG	0xE5 /* Apex charge limit (%) */
> +#define OXP_APEX_CHARGE_INHIBIT_REG	0xE6 /* Apex bypass charging */
> +
> +#define OXP_CHARGE_INHIBIT_MASK_AWAKE	0x01
>  /* X1 Mask is 0x0A, F1Pro is 0x02 but the extra bit on the X1 does nothing. */
> -#define OXP_X1_CHARGE_INHIBIT_MASK_OFF		0x02
> -#define OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS	(OXP_X1_CHARGE_INHIBIT_MASK_AWAKE | \
> -						 OXP_X1_CHARGE_INHIBIT_MASK_OFF)
> +#define OXP_CHARGE_INHIBIT_MASK_OFF		0x02
> +#define OXP_CHARGE_INHIBIT_MASK_ALWAYS	(OXP_CHARGE_INHIBIT_MASK_AWAKE | \
> +					 OXP_CHARGE_INHIBIT_MASK_OFF)
>  
>  static const struct dmi_system_id dmi_table[] = {
>  	{
> @@ -154,7 +158,7 @@ static const struct dmi_system_id dmi_table[] = {
>  			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER APEX"),
>  		},
> -		.driver_data = (void *)oxp_fly,
> +		.driver_data = (void *)oxp_apex,
>  	},
>  	{
>  		.matches = {
> @@ -352,6 +356,7 @@ static umode_t tt_toggle_is_visible(struct kobject *kobj,
>  	case oxp_x1:
>  	case oxp_g1_i:
>  	case oxp_g1_a:
> +	case oxp_apex:
>  		return attr->mode;
>  	default:
>  		break;
> @@ -381,6 +386,7 @@ static ssize_t tt_toggle_store(struct device *dev,
>  	case oxp_fly:
>  	case oxp_mini_amd_pro:
>  	case oxp_g1_a:
> +	case oxp_apex:
>  		reg = OXP_TURBO_SWITCH_REG;
>  		mask = OXP_TURBO_TAKE_VAL;
>  		break;
> @@ -427,6 +433,7 @@ static ssize_t tt_toggle_show(struct device *dev,
>  	case oxp_fly:
>  	case oxp_mini_amd_pro:
>  	case oxp_g1_a:
> +	case oxp_apex:
>  		reg = OXP_TURBO_SWITCH_REG;
>  		mask = OXP_TURBO_TAKE_VAL;
>  		break;
> @@ -524,6 +531,7 @@ static bool oxp_psy_ext_supported(void)
>  	case oxp_g1_i:
>  	case oxp_g1_a:
>  	case oxp_fly:
> +	case oxp_apex:
>  		return true;
>  	default:
>  		break;
> @@ -537,12 +545,24 @@ static int oxp_psy_ext_get_prop(struct power_supply *psy,
>  				enum power_supply_property psp,
>  				union power_supply_propval *val)
>  {
> +	u8 limit_reg, inhibit_reg;
>  	long raw_val;
>  	int ret;
>  
> +	switch (board) {
> +	case oxp_apex:
> +		limit_reg = OXP_APEX_CHARGE_LIMIT_REG;
> +		inhibit_reg = OXP_APEX_CHARGE_INHIBIT_REG;
> +		break;
> +	default:
> +		limit_reg = OXP_X1_CHARGE_LIMIT_REG;
> +		inhibit_reg = OXP_X1_CHARGE_INHIBIT_REG;
> +		break;
> +	}
> +
>  	switch (psp) {
>  	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> -		ret = read_from_ec(OXP_X1_CHARGE_LIMIT_REG, 1, &raw_val);
> +		ret = read_from_ec(limit_reg, 1, &raw_val);
>  		if (ret)
>  			return ret;
>  		if (raw_val < 0 || raw_val > 100)
> @@ -550,14 +570,14 @@ static int oxp_psy_ext_get_prop(struct power_supply *psy,
>  		val->intval = raw_val;
>  		return 0;
>  	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> -		ret = read_from_ec(OXP_X1_CHARGE_INHIBIT_REG, 1, &raw_val);
> +		ret = read_from_ec(inhibit_reg, 1, &raw_val);
>  		if (ret)
>  			return ret;
> -		if ((raw_val & OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS) ==
> -		    OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS)
> +		if ((raw_val & OXP_CHARGE_INHIBIT_MASK_ALWAYS) ==
> +		    OXP_CHARGE_INHIBIT_MASK_ALWAYS)
>  			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
> -		else if ((raw_val & OXP_X1_CHARGE_INHIBIT_MASK_AWAKE) ==
> -			 OXP_X1_CHARGE_INHIBIT_MASK_AWAKE)
> +		else if ((raw_val & OXP_CHARGE_INHIBIT_MASK_AWAKE) ==
> +			 OXP_CHARGE_INHIBIT_MASK_AWAKE)
>  			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE;
>  		else
>  			val->intval = POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO;
> @@ -573,29 +593,41 @@ static int oxp_psy_ext_set_prop(struct power_supply *psy,
>  				enum power_supply_property psp,
>  				const union power_supply_propval *val)
>  {
> +	u8 limit_reg, inhibit_reg;
>  	long raw_val;
>  
> +	switch (board) {
> +	case oxp_apex:
> +		limit_reg = OXP_APEX_CHARGE_LIMIT_REG;
> +		inhibit_reg = OXP_APEX_CHARGE_INHIBIT_REG;
> +		break;
> +	default:
> +		limit_reg = OXP_X1_CHARGE_LIMIT_REG;
> +		inhibit_reg = OXP_X1_CHARGE_INHIBIT_REG;

I took this series as is, but in future you should look into implementing 
all these variations through a struct in .driver_data, not using 
ever-growing switch/case blocks.

-- 
 i.

> +		break;
> +	}
> +
>  	switch (psp) {
>  	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>  		if (val->intval < 0 || val->intval > 100)
>  			return -EINVAL;
> -		return write_to_ec(OXP_X1_CHARGE_LIMIT_REG, val->intval);
> +		return write_to_ec(limit_reg, val->intval);
>  	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
>  		switch (val->intval) {
>  		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
>  			raw_val = 0;
>  			break;
>  		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE_AWAKE:
> -			raw_val = OXP_X1_CHARGE_INHIBIT_MASK_AWAKE;
> +			raw_val = OXP_CHARGE_INHIBIT_MASK_AWAKE;
>  			break;
>  		case POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE:
> -			raw_val = OXP_X1_CHARGE_INHIBIT_MASK_ALWAYS;
> +			raw_val = OXP_CHARGE_INHIBIT_MASK_ALWAYS;
>  			break;
>  		default:
>  			return -EINVAL;
>  		}
>  
> -		return write_to_ec(OXP_X1_CHARGE_INHIBIT_REG, raw_val);
> +		return write_to_ec(inhibit_reg, raw_val);
>  	default:
>  		return -EINVAL;
>  	}
> @@ -656,6 +688,7 @@ static int oxp_pwm_enable(void)
>  	case oxp_x1:
>  	case oxp_g1_i:
>  	case oxp_g1_a:
> +	case oxp_apex:
>  		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
>  	default:
>  		return -EINVAL;
> @@ -676,6 +709,7 @@ static int oxp_pwm_disable(void)
>  	case oxp_x1:
>  	case oxp_g1_i:
>  	case oxp_g1_a:
> +	case oxp_apex:
>  		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
>  	default:
>  		return -EINVAL;
> @@ -696,6 +730,7 @@ static int oxp_pwm_read(long *val)
>  	case oxp_x1:
>  	case oxp_g1_i:
>  	case oxp_g1_a:
> +	case oxp_apex:
>  		return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
>  	default:
>  		return -EOPNOTSUPP;
> @@ -732,6 +767,7 @@ static int oxp_pwm_fan_speed(long *val)
>  	case oxp_mini_amd_a07:
>  	case oxp_mini_amd_pro:
>  	case oxp_g1_a:
> +	case oxp_apex:
>  		return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
>  	default:
>  		return -EOPNOTSUPP;
> @@ -764,6 +800,7 @@ static int oxp_pwm_input_write(long val)
>  	case oxp_fly:
>  	case oxp_mini_amd_pro:
>  	case oxp_g1_a:
> +	case oxp_apex:
>  		return write_to_ec(OXP_SENSOR_PWM_REG, val);
>  	default:
>  		return -EOPNOTSUPP;
> @@ -803,6 +840,7 @@ static int oxp_pwm_input_read(long *val)
>  	case oxp_fly:
>  	case oxp_mini_amd_pro:
>  	case oxp_g1_a:
> +	case oxp_apex:
>  	default:
>  		ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
>  		if (ret)
> 
> base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
> 
