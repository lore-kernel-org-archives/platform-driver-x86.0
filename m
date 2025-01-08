Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4841F9F7D;
	Wed,  8 Jan 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343911; cv=none; b=l/zfT8+v7Jx66OKpIKPy/LRaEVDCQT5NmxcA+d0htzK6UKngqaayqZbAD2T4uHcPONOO9mpfwXWa1isXi9mJuPzaucbn5r6w9ofHnRKZNQPxboP2naiMiaoBR/jEUdvxKlDmoJ50yZyDqosZADZ/AsJM1HfWyPVBvSPwpe30ZK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343911; c=relaxed/simple;
	bh=Ig5uozLv1Ncr6r8cn+ViBgTmwQcjrtI9r4LCr7JBY9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arq06IeNbUAzTzaKVt2matfy6Hc0lXrofq95A9LIdwSt3xkJevdESklzImOnze4rNVN/2K1d+4HEJrxUJIBLwNskSEfeKmgvb2dRBVkdEBuJVInKQNRzloHbxVjyZ5cJltdGIQLA/4p+OELYI05j9lQ9tzk+4Z6vDjIg9AQ2DxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQVpMFcR; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQVpMFcR"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51bc2363fd7so3920071e0c.2;
        Wed, 08 Jan 2025 05:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736343907; x=1736948707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Hn94dkfZeLZVNIT3h1pTGyHIuGbKGkfiNgDBVAm36g=;
        b=AQVpMFcR3oEpqqhfcEMxSCWFaLEue3n6uxF47SVOfz7lkmRP5SkphXvB8b3ibJueEO
         vfOir0M3lcXxl+YkZMcHKNrVRBi1NDnE8asncaM9O5SdcNeBGFsXkrVVo2WpD8PDszYt
         olxYgbXjI1o/5yXdm6Aeb8VT6xN+RdhsIEdDSN/u6WjqHNRYIandNsuHBZK86JX0ApBA
         HsOhPvA1OqkYOOp2Mc6ALILhQbKy2RFBW1IVU4Tsy+c9UcOVopq2gjCA66lLWWrWMsdQ
         mHBDCdCd648VfxbsdiYU6vkFkvBGkzMWGZ2WuchXS0T+lavU0xKvIHXcHCX+mH3EcZYL
         bprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736343907; x=1736948707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Hn94dkfZeLZVNIT3h1pTGyHIuGbKGkfiNgDBVAm36g=;
        b=bZ8A8olAE+rr7XMqqmQkKUmBuIJd6cbPncD+N+e/Uz+ynBJYonJZb1/2/nbBGQXtTK
         2jwINMzpprS5qwa763XnjsXCIAksHQgbsaRJEUrdvuIClZAoKSRPeDBOV7bVNSYkNSDb
         KahIsDRgP2c24dOC7HQjMQSBB7C7ctwoFSLAy4lLKWmcsUegmUPIeoedsQZwyinkZWSj
         q2JwGRwgrKzb/3uYRUCPdvJUbL4si0JfPCCETA6FdZvaF8MbHx8xxUjdA4olQjO2o0vw
         2YjJ+zHpNEutw08wEpkX/nFxm8IdfrAj0Q+scRKpOZdzt0X1+Q19HGkxzL1FQ2kjIGSa
         WuuA==
X-Forwarded-Encrypted: i=1; AJvYcCU/WRuE4K+JkirjotmA1hzoSfPn7ImivwGfQwM8JoshyeMd1dAP9WMYhLMwiquEQQuPQBJ0smYti5M9/uvliZOMLbhvBA==@vger.kernel.org, AJvYcCUPBcNOEiB3ijUflGjOzOWefGkPQJsSWd0OmTh99Rf/Gkuksr0Mg4NkIr6jrfoltTpPcL/tdjhkWirxhqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpwgxrkC9a+VVIOUdy2YjBKzlk5LxEx9k1mUhXq7DTPkdVSFgu
	a/Pj1ii84o1Zd4LB7pjU7nMjZPGfqUoJyxLkad8JlrhRgHmFmlcA
X-Gm-Gg: ASbGncuUIKBBQ/6hfqe5v4rZwwFchkAI3XOlN3vEGGymq1GMCl1Cv1dIRuhYFoqf1hv
	WiiMhoQSQKlcKYCQFjMWLp5HQaA1Cgv7xAKSsVPGK/KwDi2D+6OL+7tOIF21QX+jW2P/VlqgZjO
	BQ55jxvsPpz8taP7Bv/H7xu0yiciRDXtSiCyx0eJAOhwusYUQK0wKJA7Fc6+e7/TVufzaTKjJIt
	eJscAq5paxAjQtJVsLDMBE8nq91EN+YdZuHRikYaPQqDiYevMr1jw==
X-Google-Smtp-Source: AGHT+IHFZgNGXHOwSTOrto7UJrGWO4wMcaOVJy+2uGzVkTlCHVN2AqHshg3+qURVuhgQO0dxi3T+mg==
X-Received: by 2002:a05:6122:209f:b0:518:a14e:7334 with SMTP id 71dfb90a1353d-51c6c5378f8mr1557398e0c.12.1736343907186;
        Wed, 08 Jan 2025 05:45:07 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68cdaa6asm4908892e0c.39.2025.01.08.05.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:45:06 -0800 (PST)
Date: Wed, 8 Jan 2025 08:45:03 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 3/5] platform/x86: acer-wmi: simplify platform profile
 cycling
Message-ID: <fmf5odjtllkuq6rvpfmukul6liy576d65izgndv3ggnbrzgxmq@tuuzm7ogmklu>
References: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
 <20250108-platform_profile-v3-3-ec3658d9be9c@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-platform_profile-v3-3-ec3658d9be9c@gmail.com>

On Wed, Jan 08, 2025 at 02:15:25PM +0530, Hridesh MG wrote:
> Make use of platform_profile_cycle() to simplify the logic used for
> cycling through the different platform profiles. Also remove the
> unnecessary handling for AC power, as the hardware accepts different
> profiles regardless of whether AC is plugged in.
> 
> Link: https://lore.kernel.org/platform-driver-x86/20e3ac66-b040-49a9-ab00-0adcfdaed2ff@gmx.de/
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 80 ++++++++++-------------------------------
>  1 file changed, 19 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index f662e3740408f70e1e921a90fe75ce441fd239d0..7968fe21507b1cf28fdc575139057c795e6a873b 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -2028,76 +2028,34 @@ static int acer_platform_profile_setup(struct platform_device *device)
>  static int acer_thermal_profile_change(void)
>  {
>  	/*
> -	 * This mode key can rotate each mode or toggle turbo mode.
> -	 * On battery, only ECO and BALANCED mode are available.
> +	 * This mode key will either cycle through each mode or toggle the turbo profile.
>  	 */
>  	if (quirks->predator_v4) {
>  		u8 current_tp;
> -		int tp, err;
> -		u64 on_AC;
> +		int err, tp;
>  
> -		err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE,
> -						   &current_tp);
> -		if (err)
> -			return err;
> -
> -		/* Check power source */
> -		err = WMID_gaming_get_sys_info(ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS, &on_AC);
> -		if (err < 0)
> -			return err;
> +		if (cycle_gaming_thermal_profile) {
> +			platform_profile_cycle();
> +		} else {
> +			err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE,

nit: Break this line like you did bellow.

> +							   &current_tp);
> +			if (err)
> +				return err;
>  
> -		switch (current_tp) {
> -		case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
> -			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> -			else if (cycle_gaming_thermal_profile)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
> -			else
> +			if (current_tp == ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO) {
>  				tp = last_non_turbo_profile;
> -			break;
> -		case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
> -			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> -			else
> +			} else {
> +				last_non_turbo_profile = current_tp;

WMID_gaming_set_misc_setting() may fail, so I think you should set
last_non_turbo_profile after call has succeeded.

~ Kurt

>  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> -			break;
> -		case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
> -			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
> -			else if (cycle_gaming_thermal_profile)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
> -			else
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> -			break;
> -		case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
> -			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> -			else if (cycle_gaming_thermal_profile)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> -			else
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> -			break;
> -		case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
> -			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> -			else if (cycle_gaming_thermal_profile)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
> -			else
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> -			break;
> -		default:
> -			return -EOPNOTSUPP;
> -		}
> -
> -		err = WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
> -		if (err)
> -			return err;
> +			}
>  
> -		/* Store non-turbo profile for turbo mode toggle*/
> -		if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> -			last_non_turbo_profile = tp;
> +			err = WMID_gaming_set_misc_setting(
> +				ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
> +			if (err)
> +				return err;
>  
> -		platform_profile_notify(&platform_profile_handler);
> +			platform_profile_notify(&platform_profile_handler);
> +		}
>  	}
>  
>  	return 0;
