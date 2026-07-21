Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F93646AA92;
	Tue, 21 Jul 2026 15:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649474; cv=none; b=pgzQ18iodP1CKhNfDtcSXMBeRk4LENe4Kw6wtMXJOW9shLbX3/fiLcJvNtgM2uuogw/U0YFqI+lSUOp293q8kYskqKsN8luxKhFGVYb5bjixjJ9teRIsWIkrvWWq7KcIjHXuDtInD2kHXab095DJcgX51vijfDYbbHaI/KDmeBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649474; c=relaxed/simple;
	bh=Gr1RXgiNjsWETMMeaf8cWNAiaBPZfmPgJBaR5TgwROc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QNN1OGFfCzKtEBczwBKLOawK0QvGkP6l+QeA6ZR5qCAtWjHB0CcmyYQ+k621MopLAjg3uwMiUJeppeZN+3HcAyklxjkeqJeyfJL85T2kU0lCrDMJ570lBxCyneCoaBwcF7EwN23SDRCrrGdX5CoexCpx2F0fxYgteT87N+ZHkB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTtHv8SF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTtHv8SF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784649470; x=1816185470;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Gr1RXgiNjsWETMMeaf8cWNAiaBPZfmPgJBaR5TgwROc=;
  b=MTtHv8SFr5T52PH2LIMW7acezVetu9cbY3oMOWKmNLNFMGrObZeKTlHc
   4TbnL2240k/Ujl6uzNjg4ZVGRqO4hdfoSkqk1lzHWbAj5MrQRVJeUz6Kj
   BXfEp9OvUM+M/ZqvAmeGGrcRLy4FvdyuBwW5E1+9+Y1Y4o5xf2pShsE+D
   fMRCo4M1yET6PeGUlcur5HlJLMDhkn3Q3tiLf78GKw6HTnIRu5UzxwTG/
   G9wKPLNvKvjAoT47sjgLdo7gxrMt7mnGvG/V9TytbDK7Ygjn/Un02tWE5
   6k66/m2mcpc/X+fSLXY+6OsfY6/nf4d85W73eMKif9VnSBhJ8OAl966vc
   A==;
X-CSE-ConnectionGUID: /s7OyTjiSmKlUFKdEiSzWQ==
X-CSE-MsgGUID: jMnGmOW7Ryy34vYyixziRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95851007"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="95851007"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 08:57:48 -0700
X-CSE-ConnectionGUID: WG5QnhKaTDi1xRi5uJlejA==
X-CSE-MsgGUID: +5bsiQjsStuGVhJw8/u/PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="256009069"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 08:57:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 18:57:39 +0300 (EEST)
To: Emre Cecanpunar <emreleno@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, krishna.chomal108@gmail.com, 
    radheykalra901@gmail.com, edip@medip.dev, hello@kursatabayli.dev, 
    mjg59@srcf.ucam.org, akpm@linux-foundation.org, jorge.lopez2@hp.com, 
    jes965@nyu.edu, mario.limonciello@amd.com, julien.robin28@free.fr
Subject: Re: [PATCH 4/5] platform/x86: hp-wmi: normalize GPU thermal mode
 errors
In-Reply-To: <4dcb4c0b0aac63d03b8e8a3c68e41b88b8d303e6.1784195117.git.emreleno@gmail.com>
Message-ID: <36e76e24-07bb-9a2f-72cd-b50591cd71b4@linux.intel.com>
References: <cover.1784195117.git.emreleno@gmail.com> <4dcb4c0b0aac63d03b8e8a3c68e41b88b8d303e6.1784195117.git.emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jul 2026, Emre Cecanpunar wrote:

> The GPU thermal mode helpers return positive firmware error codes, but
> their callers only treat negative values as failures. If the mode query
> is rejected, its output parameters remain uninitialized and are then
> used to select a profile or sent back to firmware as the GPU slowdown
> temperature. A rejected mode update is likewise reported as successful.

Does this happen with some HW? Please add the info.

> Zero the query buffer and convert positive firmware status codes to
> -EINVAL in both helpers so callers never consume missing output or ignore
> a failed update.
> 
> Fixes: 6e4ab59b8391 ("platform/x86: hp-wmi: Add fan and thermal profile support for Victus 16-s1000")
> Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 29881749aae6..65c3bac17ad6 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -1885,20 +1885,21 @@ static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
>  					    u8 *dstate,
>  					    u8 *gpu_slowdown_temp)
>  {
> -	struct victus_gpu_power_modes gpu_power_modes;
> +	struct victus_gpu_power_modes gpu_power_modes = {};

Why is this necessary if you return error after the if change?

>  	int ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_GET_GPU_THERMAL_MODES_QUERY, HPWMI_GM,
>  				   &gpu_power_modes, sizeof(gpu_power_modes),
>  				   sizeof(gpu_power_modes));
> -	if (ret == 0) {
> -		*ctgp_enable = gpu_power_modes.ctgp_enable ? true : false;
> -		*ppab_enable = gpu_power_modes.ppab_enable ? true : false;
> -		*dstate = gpu_power_modes.dstate;
> -		*gpu_slowdown_temp = gpu_power_modes.gpu_slowdown_temp;
> -	}
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;

Use two separate ifs instead.

> -	return ret;
> +	*ctgp_enable = gpu_power_modes.ctgp_enable ? true : false;
> +	*ppab_enable = gpu_power_modes.ppab_enable ? true : false;
> +	*dstate = gpu_power_modes.dstate;
> +	*gpu_slowdown_temp = gpu_power_modes.gpu_slowdown_temp;
> +
> +	return 0;
>  }
>  
>  static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
> @@ -1929,8 +1930,10 @@ static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
>  
>  	ret = hp_wmi_perform_query(HPWMI_SET_GPU_THERMAL_MODES_QUERY, HPWMI_GM,
>  				   &gpu_power_modes, sizeof(gpu_power_modes), 0);
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
>  
> -	return ret;
> +	return 0;

Now this could be:

	if (ret > 0)
		return -EINVAL;

	return ret;

-- 
 i.

