Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210965;
	b=i9Lcvj4EYa0w+dJh1k0rWkKhAflIgH+jCWN05OYLTVGKxCJYiRtxMBCts+lG21OnfvVV
	 +gq5aYROiWJlOYfN/sC65o8FNJ27pWii5gSt5fe4+OH2Bi6hzFEohCtl3ljjjTJiziVuy
	 7Eys8rvP2pyeD9pU4yt/nQ4I62JesKkJqiV5BXuz6bECoyEd9qT0q7eh1iszzz1Y80mKC
	 xjrovyiDsC0/MnX/kHatQefxElQQvJz38WI7MS0GXRG4zIDzA935BqW1xlaq2H5D2Ywks
	 EiksUw7BDFUC4y9YC9xdP4SM7DHVAT7M1t0CNzA18q2kQZsma/JK0I2SQvWEtKQ77IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210965;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=aR8UDv+47K++yUoDlU50BxWptzQ7MVDDJcNW48Jvpqg=;
	b=QbrKR7JBujrjDmC0ntKupGXBfJRpTh8wHzWPjia+vAboeatveskiUW62wivGYndXk4r1
	 D+10AIhJj/T7Kh+zycmF4kC+2b7YHxI3rfyasHE1q49IJVuiP6d1CxgGkjJE4zX+HNJXN
	 b4KEdBjz9bQjB0NXIsB4ymmeHAIZ+gTg+sYBk2yCPoqKQQTMe5sEnN2IcltxXNAcLrgse
	 MYeKuLlBd7sBa3nUoyWxIn0x33jUjRlRf246IrIfK3akVGIuWj2CO8EBV9naVeS7YIJeE
	 3tS0bV2oUbvJxjKsT3aMKovN7Gk0ucZdk+KSXm8+sLO5b0nim3bKYJaaI6sYj629wbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CF+NNqJ8;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699E0606A6A0;
	Fri, 20 Nov 2026 21:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 699E0606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CF+NNqJ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795210960; x=1826746960;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uNXAh5poC50WYU+EWy35yqL9KuLdt66I8wkni2AeE2w=;
  b=CF+NNqJ8lrbNfUCzukFBrDDVCn3PPVhzIsq27B1l4/1Or2PbXP5IGzm6
   O13bWsv4FJfu5udtZ9KLo46KCNsl/wq96rBFfxH3T5jdVtj9NGKb1r8LG
   EKUKKB1kB/DK9KIm3mEiYMzTo+YRJ8QjWM6QGX9pXMG5UkndGO/A6C0We
   QJ720+J3DIGt+hsu97ZX0DW7XIzppK4OegihAjV/M5nHCxVO5hXUw5iA5
   x0OS7MMXslVo+QUoLeUlVzzn/XdYCl+nsn8s6CM31f/q2REp/RWhLuAp4
   ICrRN+cJLS7/nM4I50dYXZnmVGi5iXM12y5c9QSDYVTFhu7w9TLeqFYjg
   w==;
X-CSE-ConnectionGUID: J8Jzo5piSuSiSMvPKuxKtQ==
X-CSE-MsgGUID: d5cS8EFaTmuKWBswxhybpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3987427"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3987427"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:42:39 -0800
X-CSE-ConnectionGUID: Pkd4JHxuREqIinlA/PmXgA==
X-CSE-MsgGUID: fLyMe3iISE2pGUryopp/og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10689840"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 13:42:38 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Nov 2026 23:42:35 +0200 (EET)
To: Sourav Nayak <nonameblank007@gmail.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V2] platform/x86: hp-wmi: fix platform profile values
 for Victus 15-fb0xxx (8A3D)
In-Reply-To: <20261025034539.4565-1-nonameblank007@gmail.com>
Message-ID: <1061c0e1-9e05-a09f-3eb6-5702f4fbcf08@linux.intel.com>
References: <20261024202658.13149-1-nonameblank007@gmail.com> <20261025034539.4565-1-nonameblank007@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Oct 2026, Sourav Nayak wrote:

> Currently Victus 15-fb0xxx (8A3D) takes victus_s_thermal_params,
> which causes it to register as incorrect EC layout while cold boot.
> 
> - On other hand windows Omen Gaming Hub registers EC offset as 0x95,
> - which is set in driver as HP_OMEN_EC_THERMAL_PROFILE_OFFSET.
> - So, address it by adding victus_s_ec_thermal_params.
> 
> - Also perfcontrol modes as performance (0x1), default (0x0), quiet
> (0x3) registers. So, add support for quiet mode.
> 
> Also, hp_wmi_fan_speed_max_reset() caused fans to freeze during loads at
> 0RPM, introduce a 'if' statement to resolve it by calling hp_wmi_fan_speed_max_set(0),
> and passing platform active again to reactive curves. Test data:
> 
> auto/max:
> hp-isa-0000
> Adapter: ISA adapter
> fan1:        5400 RPM
> fan2:        5200 RPM
> 
> mannual[255]:
> hp-isa-0000
> Adapter: ISA adapter
> fan1:        5800 RPM
> fan2:        5800 RPM
> 
> Tested-by: Sourav Nayak <nonameblank007@gmail.com>
> Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 615b4cf6fc45..ee6de96b3280 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -121,6 +121,13 @@ static const struct thermal_profile_params victus_s_thermal_params = {
>  	.ec_tp_offset	= HP_EC_OFFSET_UNKNOWN,
>  };
>  
> +static const struct thermal_profile_params victus_s_ec_thermal_params = {
> +	.performance	= HP_VICTUS_THERMAL_PROFILE_PERFORMANCE,
> +	.balanced	= HP_VICTUS_THERMAL_PROFILE_DEFAULT,
> +	.low_power	= HP_VICTUS_THERMAL_PROFILE_QUIET,
> +	.ec_tp_offset	= HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
> +};
> +
>  static const struct thermal_profile_params omen_v1_thermal_params = {
>  	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
>  	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
> @@ -164,6 +171,11 @@ static const struct hp_wmi_board_params victus_s_board_params = {
>  	.fan_profile		= &victus_s_fan_profile_params,
>  };
>  
> +static const struct hp_wmi_board_params victus_s_ec_board_params = {
> +	.thermal_profile	= &victus_s_ec_thermal_params,
> +	.fan_profile		= &victus_s_fan_profile_params,
> +};
> +
>  static const struct hp_wmi_board_params omen_v1_board_params = {
>  	.thermal_profile	= &omen_v1_thermal_params,
>  	.fan_profile		= &victus_s_fan_profile_params,
> @@ -245,7 +257,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
> -		.driver_data = (void *)&victus_s_board_params,
> +		.driver_data = (void *)&victus_s_ec_board_params,
>  	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
> @@ -2121,10 +2133,14 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
>  	 * but logically it should have tp == 0x30 || tp == 0x31, as
>  	 * corrected by the Omen Gaming Hub on windows. Hence accept both
>  	 * of these values.
> +	 * Since boards like 8A3D write 0x3 to EC offset 0x95 to
> +	 * engage quiet mode. Map this to PLATFORM_PROFILE_LOW_POWER.
>  	 */
>  	if (tp == victus_s_thermal_params.performance ||
>  	    tp == omen_v1_thermal_params.performance) {
>  		*profile = PLATFORM_PROFILE_PERFORMANCE;
> +	} else if (tp == victus_s_ec_thermal_params.low_power) {
> +		*profile = PLATFORM_PROFILE_LOW_POWER;
>  	} else if (tp == victus_s_thermal_params.balanced ||
>  		   tp == omen_v1_thermal_params.balanced) {
>  		/*
> @@ -2657,7 +2673,17 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
>  		return 0;
>  	case PWM_MODE_AUTO:
> -		if (hp_wmi_fan_control_supported()) {
> +		/*
> +		 * Victus models like 8A3D, calling hp_wmi_fan_speed_max_reset()
> +		 * freezes fans at 0 RPM under load. Instead, disable max fans and re-apply
> +		 * the active platform profile, so the EC firmware thermal curves regain control.
> +		 */
> +		if (hp_wmi_thermal_profile() == &victus_s_ec_thermal_params) {

Please do not add magic if's like this.

Instead, use the board params data structure to store the information in a 
more generic way (add a quirk there?).

> +			ret = hp_wmi_fan_speed_max_set(0);
> +			if (ret < 0)
> +				return ret;
> +			ret = platform_profile_victus_s_set_ec(active_platform_profile);
> +		} else if (hp_wmi_fan_control_supported()) {
>  			ret = hp_wmi_get_fan_count_userdefine_trigger();
>  			if (ret < 0)
>  				return ret;
> 
> base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
> 

-- 
 i.

