Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD5033EAEA;
	Mon, 23 Mar 2026 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259491; cv=none; b=frwROEKOlCu1OtDaPHao9MuYJHpL+KpoNg70LhKDWrdWAEykj9pv4QnUfZ4b+RGILLjicrYwquBWaxYK9i4oUDpMG9ujRYOBnRLtRHxuX383us5nVwp+4DUQVjRWcAPKHwQ5AdPv4yvOrUJJQrcLl2JYH8SXZf8MurC6l1kL0m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259491; c=relaxed/simple;
	bh=79OhEgTMo5HmVyKXM4S4uWNFgATWcIgOGLTBF6NE4cM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pHIRlOR3MWhOSSnsphiaKaD1U3W6Aae2mQ7/aU/+btmQ3/pDnRoYqD800LzoB5M5FU+RYcY5AdgJRi41M62uFPVMKea/QpNqJp+86KuPjtn9btY+Oz+7r6+T58XU3jr9y2EiaXHpHF9oZNMr6I3zJ3M5zl/3Y02aSIXurKSBTdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgUEul12; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgUEul12"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774259490; x=1805795490;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=79OhEgTMo5HmVyKXM4S4uWNFgATWcIgOGLTBF6NE4cM=;
  b=cgUEul12g3mf5lO2V++ngdl7KRp5KCS8QnmpVOZhHTH8EAQAbMOAKpcI
   FCbTJnu7WNali3Qp6FgBc4chSP2wHGK0BP7EP2ZB6nDhBqFnECZpDMugy
   CQSeVmOzX9cW65EOULUQxgwx+8ZBKE3EX/uFZjdQHX2a4ZIRmGpaC2QAX
   WD0R1snLiRW26tLNYKYV+8W0knClJfo8oUpRJCfoSKzs9mKty3WEHAtQa
   3zlYfYobJl1zK/XHIeDUecbcgkWUfnyTxXdRxOFwJjaYDHxB36MoUpWIC
   qH1sC0fQerVj/li2NKW8xfj6s2XaK/jVhRTYH/ZAT558amK/5AP94zV+Q
   g==;
X-CSE-ConnectionGUID: WYyv5WbdQgigJ7K6541hBg==
X-CSE-MsgGUID: NFwi34IXRcWh9DINAK3DBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75141797"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75141797"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:51:29 -0700
X-CSE-ConnectionGUID: 9kIsKtukTPSbAWLRCbvJEg==
X-CSE-MsgGUID: Nkp1LdDXRACiyMwLuyR/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223934885"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.49])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:51:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Mar 2026 11:51:23 +0200 (EET)
To: Emre Cecanpunar <emreleno@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, krishna.chomal108@gmail.com
Subject: Re: [PATCH v2 3/5] platform/x86: hp-wmi: use mod_delayed_work to
 reset keep-alive timer
In-Reply-To: <20260322190624.35162-4-emreleno@gmail.com>
Message-ID: <eae62ec1-ba14-6717-3c17-e6838feccda9@linux.intel.com>
References: <20260322190624.35162-1-emreleno@gmail.com> <20260322190624.35162-4-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Mar 2026, Emre Cecanpunar wrote:

> The keep-alive mechanism re-applies fan settings every 90 seconds to
> prevent the firmware from reverting to automatic mode after its 120 s
> timeout. Fan settings are also applied immediately when the user writes
> to the hwmon sysfs interface.
> 
> schedule_delayed_work() is a no-op when the work item is already
> pending. If the user updates fan settings at T=85s, the keep-alive
> still fires at T=90s (5 s after the update) instead of 90 s later.
> This shortens the effective keep-alive window and may allow the
> firmware timeout to expire between cycles.

Hi,

Unfortunately, I don't understand this explanation.

Won't the keepalive expiry at T=90s just result in adding the next 
keepaline event to T=90s + 90s, and the resulting intervals never exceeds 
120s?

It may be inefficient to apply fan settings at T=85s and then fire 
keepalive at T=90s, that much I can see but if you think there's a problem 
beyond that, this explanation doesn't convince me so please elaborate.

If the only problem is inefficiency, this explanation did not convey 
that meaning so in that case, please rephrase.

> Replace schedule_delayed_work() with mod_delayed_work() in both the
> PWM_MODE_MAX and PWM_MODE_MANUAL cases. mod_delayed_work() resets the
> delay to KEEP_ALIVE_DELAY_SECS from the time of each call, whether or
> not the work is already pending, ensuring each user action and each
> keep-alive expiry restarts the full 90 s window.
> 
> Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 41769c0861e5..a29f34588055 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -2342,8 +2342,8 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  		ret = hp_wmi_fan_speed_max_set(1);
>  		if (ret < 0)
>  			return ret;
> -		schedule_delayed_work(&priv->keep_alive_dwork,
> -				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
> +		mod_delayed_work(system_wq, &priv->keep_alive_dwork,
> +				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
>  		return 0;
>  	case PWM_MODE_MANUAL:
>  		if (!is_victus_s_thermal_profile())
> @@ -2351,8 +2351,8 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  		ret = hp_wmi_fan_speed_set(priv, pwm_to_rpm(priv->pwm, priv));
>  		if (ret < 0)
>  			return ret;
> -		schedule_delayed_work(&priv->keep_alive_dwork,
> -				      secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
> +		mod_delayed_work(system_wq, &priv->keep_alive_dwork,
> +				 secs_to_jiffies(KEEP_ALIVE_DELAY_SECS));
>  		return 0;
>  	case PWM_MODE_AUTO:
>  		if (is_victus_s_thermal_profile()) {
> 

-- 
 i.

