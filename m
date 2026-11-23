Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423623;
	b=r/R7lbVR+KEOwV3Pq9nd+SE8sy68vOPwdPKfP7BlQgtAEzTU1Kvs8xhFIEQFOkUzyHei
	 dSLc1q7fhdcQQoLQeDs+wJ9WUqEG76bySeL1YTdyMdyoO4zBfK1iGqe45gsFDEUB9/R1c
	 hmH3OJtvIbE27BEzl6eT7IN4nCajKD7KmZCFQHibzejeZMho1nMJvmHq/TG23AR8kZLjC
	 eWXManh/lijbFoyU88rV5ZqbtCdV0WoW+3QuiwVp8c2Mz66qJVjRXAloaVc3RvbnMzmzt
	 1GrxBNe6PtbCmwvOdbrzm9nDYE1vDuwjNO1/gD75iqxzaM4fiMHr+2QOri+g+0mpvwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423623;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=XKs3ZboUJb81K6jYdxKiscT4UE5YzLnyDfc+uI4E3Uc=;
	b=b/nPEMGpmpj+avO/o45CeUuOTnVcXm6QQtNh6jVToMbf/incjz8ehFnkL0txz769BuG0
	 qD7Ce/g/udBAsW+MuLBSO4onZbMcKmCSjV0Iij2CS7ANhqVetFtrxOfwxMz7K3AZbAwLF
	 +jtG+Kmgj7Jn+x1l9TWg2wHh1nBeWdMFytUE/463n0FgvKVSrSTWjmYriJBA4KoGCeSCg
	 i7zUp58Yp5qPddfllk4j1E/q7jso92LWYdoYA27teMbVjElB2rTmJUNCNKmz/5LHOwJPO
	 Hpvct5X2/OI59lbt7kA4JlRx4Mw2HxiZHCBhlN/yXRKtoO2aNuqKkSZ2N0cjMexpSYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aKgEMsXw;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04FD606A31A;
	Mon, 23 Nov 2026 08:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04FD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aKgEMsXw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795423623; x=1826959623;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7OxixJdbq+kdjcr4VURCC1HEh52of1vBNIlLajwhFHw=;
  b=aKgEMsXwKmWJ3zfjsgLvgP2sFyYQY1uKihaYcVPDzgodYj/KK3vrJNeJ
   MHQqgfkS7dgSTmyDw+zD/NzhBTcnI0PwKorUoFzJOHPtI8v69dTK2Zsqf
   Fcrt+H8Gym0Yw2Cu7CwPKA7kY6tRjnYj/YnzE1XJ26YF8XSRSfDheMuLo
   l5184gZho1kba3mugyktiNSBezdkP+GtBnjZZiZUr5oFBc+LfTV5U4dVp
   sB45Oq902YTGzpX0Fh8EnijuG6JfoelqG2PpJdAB6W5YZk/2rwwk/5iKw
   6ULB1vReFNbSZL5PODoigFHNqKl19ppo0BB5+sMZLjsON5TsNg84k0oBL
   w==;
X-CSE-ConnectionGUID: rFSHJkcOTH6FZoVUDNM4mw==
X-CSE-MsgGUID: llEO4COhT7Kdhtg0ZlNO3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4273104"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4273104"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:47:03 -0800
X-CSE-ConnectionGUID: JSCPwAj7TT2d882AAVgQDw==
X-CSE-MsgGUID: nrj/kHBaSTa94iFNUsOHNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11329815"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:47:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 10:46:57 +0200 (EET)
To: Sourav Nayak <nonameblank007@gmail.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 2/2] platform/x86: hp-wmi: fix fan freeze during load
 for Victus 15-fb0xxx (8A3D)
In-Reply-To: <20261121071534.28473-3-nonameblank007@gmail.com>
Message-ID: <47c9dd58-774b-20ea-b78e-0d3453be0a42@linux.intel.com>
References: <1061c0e1-9e05-a09f-3eb6-5702f4fbcf08@linux.intel.com> <20261121071534.28473-1-nonameblank007@gmail.com> <20261121071534.28473-3-nonameblank007@gmail.com>
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

On Sat, 21 Nov 2026, Sourav Nayak wrote:

Thanks for the update.

This looks better but the changelog needs work.

> hp_wmi_fan_speed_max_reset() caused fans to freeze during loads at 0RPM,

This reads badly, as if something is missing. Do not assume shortlog 
preceeds the changelog body, the body should be totally independent from 
shortlog and fully readable on its own.

It think you want to tell right from the start that is happens on a 
particular HW.

> So, assign a custom victus_s_ec_fan_profile_params for 8A3D,
> introduce a 'if' statement with hp_wmi_fan_speed_auto_reapply to resolve it by

No need to tell you 'introduce a 'if' statement'. Please write with the 
changelog with assumption that the readers are experienced kernel 
developers, but not necessarily familiar with this driver or HW).

You should instead be telling that you add "fan_speed_auto_reapply", what 
it does on a high-level (the code details about if statements are too 
low-level and can be easily read from the diff below), and mention "use 
fan_speed_auto_reapply for board 8A3D.

Any function name quoted should have () added to it.

> calling hp_wmi_fan_speed_max_set(0), and passing platform active again to reactive curves.

Please reflow the paragraph to up to 72 chars.

> Test data:
> 
> auto/max:
> hp-isa-0000
> Adapter: ISA adapter
> fan1: 5400 RPM
> fan2: 5200 RPM
> 
> mannual[255]:
> hp-isa-0000
> Adapter: ISA adapter
> fan1: 5800 RPM
> fan2: 5800 RPM
> 
> Tested-by: Sourav Nayak <nonameblank007@gmail.com>

The assumption is that you've tested the patches you create :-) so these 
tested-by tags can be dropped.

> Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 0166b9cc4d9e..583e1c0dda07 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -155,6 +155,7 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
>  
>  struct hp_wmi_fan_profile_params {
>  	int (*get_fan_speed)(int fan);
> +	bool fan_speed_auto_reapply;
>  	bool fan_table;
>  };
>  
> @@ -170,6 +171,12 @@ static const struct hp_wmi_fan_profile_params victus_s_fan_profile_params = {
>  	.fan_table	= true,
>  };
>  
> +static const struct hp_wmi_fan_profile_params victus_s_ec_fan_profile_params = {
> +	.get_fan_speed	= hp_wmi_get_fan_speed_victus_s,
> +	.fan_speed_auto_reapply = true,
> +	.fan_table	= true,
> +};
> +
>  static const struct hp_wmi_board_params victus_s_board_params = {
>  	.thermal_profile	= &victus_s_thermal_params,
>  	.fan_profile		= &victus_s_fan_profile_params,
> @@ -177,7 +184,7 @@ static const struct hp_wmi_board_params victus_s_board_params = {
>  
>  static const struct hp_wmi_board_params victus_s_ec_board_params = {
>  	.thermal_profile	= &victus_s_ec_thermal_params,
> -	.fan_profile		= &victus_s_fan_profile_params,
> +	.fan_profile		= &victus_s_ec_fan_profile_params,
>  };
>  
>  static const struct hp_wmi_board_params omen_v1_board_params = {
> @@ -2286,6 +2293,13 @@ static bool hp_wmi_fan_control_supported(void)
>  	return params && params->get_fan_speed;
>  }
>  
> +static bool hp_wmi_fan_speed_auto_reapply(void)
> +{
> +	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
> +
> +	return params && params->fan_speed_auto_reapply;
> +}
> +
>  static bool hp_wmi_fan_table_supported(void)
>  {
>  	const struct hp_wmi_fan_profile_params *params = hp_wmi_fan_profile();
> @@ -2945,7 +2959,17 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
>  		return 0;
>  	case PWM_MODE_AUTO:
> -		if (hp_wmi_fan_control_supported()) {
> +		/*
> +		 * Victus models like 8A3D, calling hp_wmi_fan_speed_max_reset()
> +		 * freezes fans at 0 RPM under load. Instead, disable max fans and re-apply
> +		 * the active platform profile, so the EC firmware thermal curves regain control.

Please limit comments to 80 chars per line.

> +		 */
> +		if (hp_wmi_fan_speed_auto_reapply()) {
> +			ret = hp_wmi_fan_speed_max_set(0);
> +			if (ret < 0)
> +				return ret;
> +			ret = platform_profile_victus_s_set_ec(active_platform_profile);
> +		} else if (hp_wmi_fan_control_supported()) {
>  			ret = hp_wmi_get_fan_count_userdefine_trigger();
>  			if (ret < 0)
>  				return ret;
> 

-- 
 i.

