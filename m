Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F481A2C0B;
	Mon, 23 Mar 2026 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258986; cv=none; b=BSn04udUcT7nJEF8drOihdwgEuiMa/AonmUubRGpNdn3l7o+f/ZjAn5QjrDi7N+E9uDLqxYtbZ5PtZfS0SjTptj6MSco63S32KsFKmUWV8Syff2yMruHAPOCPvKabv1bUyI3+nLAd0EHWlq3I4hpP7ZqOFpO+b0afrgx3/rk1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258986; c=relaxed/simple;
	bh=0ScpI84KSjTwIGhwzkYAzl01i17paMZ6cw/OHe0q3M4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sGSyLEvbOlHr5RhE8byyRjvGQpY7z+tQcu2SAc3o1VR5TC0hTgxorlHMyyhPH6122hfGiGydtJZzU1qiVB9iFNDqmyL7fPPvhDQMTSPybig86I3V3q8FDKxDPl+tEzGg4hU4bLND3hIEpNmp2mCD40ULQGh73Wc9OPUOflZ1WPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTcd1DVN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTcd1DVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774258986; x=1805794986;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0ScpI84KSjTwIGhwzkYAzl01i17paMZ6cw/OHe0q3M4=;
  b=DTcd1DVNtDUyZxwkrdcbZ+qZNQVblm4juOgPWloeQkxbpn1HAuK9FDYQ
   6jrMaZrb89nNPnUWTM2w9rBbboy0ScjsDHyu+tSmyXgK0Ysc9FGv0dLsV
   2OJ76EaCsc22aUkAAf0E2DuJ1HOdy7EqpZYQfOGvTbpc9t7rHpvVe5sN8
   PZ687yGapRY0UpqBhNp1KX2FPU5xFsZwbXzU8eFOcidxgwpoIMnkb8itl
   c4WVDRYrTUTFwr69HG2knf8piuRQt9pUzGEY1pbgm13wshRJ5tMRVUsW7
   QiXgnJvuv/HPcvn12X/5F+7Gt7Z2bnXoGwIiD7iLoczrLUGrMgHRfwTV4
   g==;
X-CSE-ConnectionGUID: nF8eYZ32TkaS+PrnWs5nag==
X-CSE-MsgGUID: CeUz//jFR5qi825DqOkyFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75318626"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75318626"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:43:05 -0700
X-CSE-ConnectionGUID: F1h+ma9VSLG2FuAHZwrmVA==
X-CSE-MsgGUID: L/uIQDA+QESfffRB3mEIgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223171559"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.49])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:43:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Mar 2026 11:42:59 +0200 (EET)
To: Emre Cecanpunar <emreleno@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, krishna.chomal108@gmail.com
Subject: Re: [PATCH v2 4/5] platform/x86: hp-wmi: fix u8 underflow in gpu_delta
 calculation
In-Reply-To: <20260322190624.35162-5-emreleno@gmail.com>
Message-ID: <f332715c-cda1-6120-7025-4cf051f45ed7@linux.intel.com>
References: <20260322190624.35162-1-emreleno@gmail.com> <20260322190624.35162-5-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Mar 2026, Emre Cecanpunar wrote:

> gpu_delta was declared as u8 and computed as the difference of two u8
> fan RPM values from the firmware fan table. If gpu_rpm < cpu_rpm, the
> subtraction wraps around modulo 256, producing a large positive value
> (e.g. 10 - 20 = 246 as u8). This value is then added to every
> requested fan speed in hp_wmi_fan_speed_set(), causing the GPU fan to
> be clamped to U8_MAX on almost every write.
> 
> Change gpu_delta to int in both struct hp_wmi_hwmon_priv and
> hp_wmi_setup_fan_settings(), and perform the subtraction in signed
> arithmetic. hp_wmi_fan_speed_set() already uses signed arithmetic with
> clamp_val(), so a negative delta correctly results in a lower GPU fan
> speed rather than saturating at U8_MAX.
> 
> Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
> ---
> Changes in v2:
> - Drop the if (gpu_delta < 0) guard and pr_warn. A negative delta is
>   valid firmware behavior on boards where CPU_RPM > GPU_RPM. Store
>   gpu_delta as int in struct hp_wmi_hwmon_priv so the existing signed
>   arithmetic and clamp_val() in hp_wmi_fan_speed_set() handle the
>   negative case correctly without saturating at U8_MAX.
> 
>  drivers/platform/x86/hp/hp-wmi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index a29f34588055..af57cb0dbf9e 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -436,7 +436,7 @@ enum pwm_modes {
>  struct hp_wmi_hwmon_priv {
>  	u8 min_rpm;
>  	u8 max_rpm;
> -	u8 gpu_delta;
> +	int gpu_delta;
>  	u8 mode;
>  	u8 pwm;
>  	struct delayed_work keep_alive_dwork;
> @@ -2530,8 +2530,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
>  {
>  	u8 fan_data[128] = { 0 };
>  	struct victus_s_fan_table *fan_table;
> -	u8 min_rpm, max_rpm, gpu_delta;
> -	int ret;
> +	u8 min_rpm, max_rpm;
> +	int gpu_delta, ret;
> 
>  	/* Default behaviour on hwmon init is automatic mode */
>  	priv->mode = PWM_MODE_AUTO;
> @@ -2553,7 +2553,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
> 
>  	min_rpm = fan_table->entries[0].cpu_rpm;
>  	max_rpm = fan_table->entries[fan_table->header.num_entries - 1].cpu_rpm;
> -	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
> +	gpu_delta = (int)fan_table->entries[0].gpu_rpm -
> +		    (int)fan_table->entries[0].cpu_rpm;

Hi,

Doesn't C's implicit integer promotion rules already convert these to int 
prior to doing any arithmetic on them?

The underflow problem occurred only when storing that result back into u8 
value so the type change is still required.


-- 
 i.

