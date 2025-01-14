Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E3168DA;
	Tue, 14 Jan 2025 03:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736826751; cv=none; b=Nd8Y9CFGWfPv2pyap+0IUuHcjTPdoMQlzjXSuACRE9mHTb5if3lT8r590DgGHpVl5kMvgaKGMxKu3s9FlXUtV7G+U8X833LABlRtjFJfmZy+6dYSMJigHGxK99V0NfQFRoWBVl1NgwG0AUnVqIxodCeY4kyuvzQbfK3AGr0a00Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736826751; c=relaxed/simple;
	bh=Bt4p2DUMV9hoTKDkTKhUWp1MONKTUT/Z+Kc5IqhaF1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6qNwMFIHp9h7hDovrtjhN0Y3WX/w2uM/ZH1Osr+0EYK4NEy14mLtkHSYz65BQ9uVDnsMG1eAwSByX0cJzhGPC/TB5QFU3XXijcfMDpst32NwD2jKKfpykiYxecRlxBdx6i5InuidySj03qUp764Bjvs+ZtJRA5FzBCrAq2E3Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlzUOa3Q; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlzUOa3Q"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85c436db302so2480433241.0;
        Mon, 13 Jan 2025 19:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736826746; x=1737431546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YhI3ZQq7vCTr91GI8MkpO50f7f6HEssqFGWQRlh43ME=;
        b=TlzUOa3QnUsx/XvOir+upZih8taD1GTG44/pNYfAu/zLJWGMPIozf02/s/C/dToh1d
         eeyoPaSBkw700WDzu0SV1nAQvG/1FiS/Z9X1XilDsnEoUzyK7bVzJ4jcgBGCTf8vacmP
         yIETFeIOhlOzSI787RHA0ybwPw1+cIjcnkFjuPM+W7+CPOg0Ji/R+Dlu0G/5cNRRyEVr
         rqyfzagneYOvKfdLe9qO5l7+VR/LU0GITij9q5zZmpDe2kDY/ZutKbfD4bUVMQa51wv/
         aCvROJY2C89+T83/IMhXQMIeIwszcmChqyS63eiwa/xMyRqhXaMg85/U7VlQfrnXsIcN
         Z2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736826746; x=1737431546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhI3ZQq7vCTr91GI8MkpO50f7f6HEssqFGWQRlh43ME=;
        b=ovXyTFhqFV+romRKp+j8Hn9r97mG67Y2XXNeagMaFiaj8xSeERvUAq6P6kGO9BsJ1n
         JU11O1ZLE6uTOG3sCG5QQznm1GqecPOnsYj5/yDsMCOXYqeCC+uSC4v2DHmHUDqoH3UM
         +Bfgd8KB0uAI/sANNgK+1DtrnRtWnmX3x7A3IE30jwWanUVxOukRc2AA2wMjgdPRKfLR
         cPClAIyzTr18bVbFhccdDM0GZvYa+fNT+b+f4Yy+Q7/f8N7hx94JPKhBjkE649u6ce+y
         83y65yaXXGeD33++zglSxfQDEwYgF9AcuzsW/IVmzYoFuGr+u4woQ1nYel/vDzKeaFYq
         nJQg==
X-Forwarded-Encrypted: i=1; AJvYcCUzXozdnUVaONVzKg+jjNwZK2BF4kucVK6cV23kscDcDHSVgCIcaVtSZOZWXqE7w8OqS7L9N22WjKfunx8=@vger.kernel.org, AJvYcCV5EnJ5fnsUXomxn/J1hl6ahqFECg/5bAmFz2YmLCzICazYkQ30MJqMzxK0pXzI2+S0oiuIHxEHSzK4BykLkG5VVHi78Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsuyMklDpeSHuZ48QFab4iy95k6kiI7h1usJKsyDf3a1xD2fdr
	egFEayz8nSH/YfNmBDk7614FqAko4fcbg/mr3nitRPV+fcJoREKp
X-Gm-Gg: ASbGnctwt3hP9DsSDsxc7WyOWEgkwC6PfHpccIuF1nzIQdu09sdtV8hzWJUzfVzdrX0
	uha46SjABkC+rWXZouRiHkLMdoZBvsAik82Y0YA/Ka7EuzRs7u3qKlgSgai6u+G29tz/wKsqehl
	7E93G/RQfTNITeEADTdkHBKkWYnz/qAkPXxhLw1rXjsefiPE0pBiAQzcbckX+uyNaaLpq+OgldK
	5AfIyZdJlEtyYIt12RK57+qBBzw7fJb8CxNk+w+9PGO/5mE++4ieA==
X-Google-Smtp-Source: AGHT+IHlVi7Wmd1LRKmc0Gs7PysIjvAiZJiiaLQBlvg3U+7O/Rqe4oRm+anBThmlVUAt3KA0GnaZGw==
X-Received: by 2002:a05:6102:4a10:b0:4b2:bcae:a721 with SMTP id ada2fe7eead31-4b5820cf928mr16455847137.11.1736826746146;
        Mon, 13 Jan 2025 19:52:26 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8623154b03esm5017231241.22.2025.01.13.19.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 19:52:25 -0800 (PST)
Date: Mon, 13 Jan 2025 22:52:21 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 3/5] platform/x86: acer-wmi: simplify platform profile
 cycling
Message-ID: <rvbiqkz6m5kewfwnsvtaklogtm4enn4aopkfgxvjnnh4r3n6lm@m34xtzdyivxi>
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
 <20250113-platform_profile-v4-3-23be0dff19f1@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-platform_profile-v4-3-23be0dff19f1@gmail.com>

On Mon, Jan 13, 2025 at 06:44:11PM +0530, Hridesh MG wrote:
> Make use of platform_profile_cycle() to simplify the logic used for
> cycling through the different platform profiles. Also remove the
> unnecessary handling for AC power, as the hardware accepts different
> profiles regardless of whether AC is plugged in.
> 
> Link: https://lore.kernel.org/platform-driver-x86/20e3ac66-b040-49a9-ab00-0adcfdaed2ff@gmx.de/
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
>  drivers/platform/x86/acer-wmi.c | 78 ++++++++++-------------------------------
>  1 file changed, 19 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index f662e3740408f70e1e921a90fe75ce441fd239d0..88416c37eca0af2099b0c8d91b38912a4e5d108f 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -2028,76 +2028,36 @@ static int acer_platform_profile_setup(struct platform_device *device)
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
> +			err = WMID_gaming_get_misc_setting(
> +				ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, &current_tp);
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
> +			if (current_tp == ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
>  				tp = last_non_turbo_profile;
> -			break;
> -		case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
> -			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> -			else
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
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
>  			else
>  				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> -			break;
> -		default:
> -			return -EOPNOTSUPP;
> -		}
>  
> -		err = WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
> -		if (err)
> -			return err;
> +			err = WMID_gaming_set_misc_setting(
> +				ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
> +			if (err)
> +				return err;
>  
> -		/* Store non-turbo profile for turbo mode toggle*/
> -		if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> -			last_non_turbo_profile = tp;
> +			/* Store last profile for toggle */
> +			if (current_tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> +				last_non_turbo_profile = current_tp;
>  
> -		platform_profile_notify(&platform_profile_handler);
> +			platform_profile_notify(&platform_profile_handler);
> +		}
>  	}
>  
>  	return 0;
> 
> -- 
> 2.47.1
> 
