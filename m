Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F6917557;
	Sat,  4 Jan 2025 17:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736013215; cv=none; b=QGB1JnWrI5FBRIj2LYiUQD9bca1q2AAt8i/JOE12EDL5Sc6LL7FPPb/6hvAu/Mq4L6QOsoVhFIr5FmC9bzFI6CFEHh3c667dvm87jG+khY1toI5eEYQwwJtpAP90jXcDGLcVGdyrVK02EbQEbnkm1HbanvIi99t5RChOsgjn5Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736013215; c=relaxed/simple;
	bh=kT7VGlPAz3h00RK8qTMWShkso17VDYDAKzNa834RUDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8AyWx8L6YFojIQ/WdFmQaeFKg5pxcnUGYFc6ufNgM2NqhwVtur4tQDSqkCibyY8RHwovRZeQA8bH+vT6BZClbVylWaAEYZl0+/q58VGBOfn8mu79Wz+oi1b6vLn74UFZQ5JKnMDbbONDvEMjfE1G/ailh/XdVE1SlDt5Ae43Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUzwlr/N; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUzwlr/N"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5174db4e34eso9301223e0c.0;
        Sat, 04 Jan 2025 09:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736013212; x=1736618012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=06Q46zAsblp2bdbJnqgwWrz7XjPoCSW4xzcsZbGBAKk=;
        b=jUzwlr/NiXCiHGsVQtetQkqjayKBIb1DbfrwGZshE1uhW7bkI+kd4HRPmAIf+jXxpZ
         C79rdDB77g+7Zi6nEjuI6M2e6sEvCJw8wv2xyV1A0AkzYtHDdqwVlRKca9lPXJWXBKd9
         33myyxm3VRtJvHTUl1dNHOQepLj+//aJTNJGF5A7ee59UP5KRMdkA5zUN1s67juCA35s
         r+SmZOK+ychVnGJtGq+OwQLUNjd9vNKTaaT10Va+pEZr2Ns4ORxLwL/gJ+8yzI1xkbBe
         kcvOEL+6hbJJuVA8HHkceCsaiJRZSA6SSsXGtqb0RgiO4obqXswgf7flBU3zf04i1KBm
         lcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736013212; x=1736618012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06Q46zAsblp2bdbJnqgwWrz7XjPoCSW4xzcsZbGBAKk=;
        b=SlYU4IUrj/HpCWzm2BEB9h9QPweYnJqpQTTs8YfIEpV5uW96TkoOR9jieZgKtlVBL9
         hEdcn+orQIs/yKK6eeG+T9wddJexTIWvxoAVfdKpx5fvGmqqjdsgWYqW0KewV/B12+Sy
         b2sJY+q6HrPQWUXyH98mNjUBVyWsbwE/p4Q4230FEyUTA9Mj40EP5Os4D9oYmMn+Qvoy
         RUadOGpd/nc9zW+EYDSb146LczVZDQL5OjuCKjAJ/aoFB1DftMIv95akYKoCuvxkpdKA
         wcEdxM/XmlQYUR6/rWkzXZa20kFg2pqJp28+Av1mDyH9BmX194v1f3Pl3YhpPuLWZ1eK
         mIVA==
X-Forwarded-Encrypted: i=1; AJvYcCXZCL7ecOtMSgaRR8rxRSu6v+p3Ocj7hi99f11DrL/3hABGIc8yKHl4lnJjGx66Epxa3KY51kB/14V7bNq+c4DKaYf6/g==@vger.kernel.org, AJvYcCXaClZfiaUKmWTHseHHrpo/+ByGZvHI5+62FzMSh+5vJN6k+ePBXWT8iAAkZzmX73lhoYspOkpT3qPfphE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm+/+EBRu9UKvTxBfeermF4qiE4Nyn7w1XAPYZB3d+hCSgkj4u
	Yxtq1A5n27oqgN8bhpYydAizkgD82BokW0bi5pGft1VqwtVaf55k
X-Gm-Gg: ASbGncsGgY8h0dL0G5ivQ2eFrx+xA8KSgfydf8BMC3QB5BRfVPCs2mTLYVHa7KRG4zM
	9WQMBXqxpxKz/fOz/k2ZEcr9zkIx0hg8bO1e0ZKjfORruTwU4d2xcLu+5cit6jxPwtqjERTmA4f
	dxTa3c4vAFKSgUmGiNE0hbYpNr5NJ2GzSxI7wJCzT2qaJMfAb4is0BGmPewbsuID0ZzTQ0YBNmr
	cgZjsxEGzSzcI2h7lMOgkwi1yFEecGeUv4LmYOaWYnJ4UW7Nkv23w==
X-Google-Smtp-Source: AGHT+IGciNxnl/bmIwVg9lfgHjweQrNoQ4SxUAv1qBPbMPlZI4WMJ2iDLDiA12l5nyxxixtQHIvoBA==
X-Received: by 2002:a05:6122:2a16:b0:518:8753:34b0 with SMTP id 71dfb90a1353d-51b76cb00f3mr31901175e0c.4.1736013212170;
        Sat, 04 Jan 2025 09:53:32 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68cdac2csm3498260e0c.37.2025.01.04.09.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 09:53:31 -0800 (PST)
Date: Sat, 4 Jan 2025 12:53:28 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	SungHwan Jung <onenowy@gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: acer-wmi: simplify platform profile
 cycling
Message-ID: <3bqedlhubucaniyrjkig3cbegfxec5pzrv7vpbpnbphuu6h6od@dymxlla3itdl>
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
 <20250104-platform_profile-v2-3-b58164718903@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104-platform_profile-v2-3-b58164718903@gmail.com>

On Sat, Jan 04, 2025 at 08:59:22PM +0530, Hridesh MG wrote:
> Make use of platform_profile_cycle() to simplify the logic used for
> cycling through the different platform profiles. Also remove the
> handling for AC power as the hardware will accept the different profiles
> regardless of whether or not AC is plugged in.
> 
> Link: https://lore.kernel.org/platform-driver-x86/20e3ac66-b040-49a9-ab00-0adcfdaed2ff@gmx.de/
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 87 +++++++++++------------------------------
>  1 file changed, 23 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index f6c47deb4c452fc193f22c479c730aecb1e69e44..9c73f78eb302323299e03bf9dbeb2c68bb422938 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -34,6 +34,7 @@
>  #include <linux/unaligned.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include "linux/bitmap.h"
>  
>  MODULE_AUTHOR("Carlos Corbacho");
>  MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
> @@ -1975,9 +1976,6 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
>  	if (err)
>  		return err;
>  
> -	if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> -		last_non_turbo_profile = tp;
> -

I think this should be kept. If the user changes profile manually this
may not reflect the actual last_non_turbo_profile.

>  	return 0;
>  }
>  
> @@ -2036,76 +2034,37 @@ static int acer_platform_profile_setup(struct platform_device *device)
>  static int acer_thermal_profile_change(void)

I'm Cc'ing SungHwan Jung as they were the author of patch that added
this function. 

~ Kurt

>  {
>  	/*
> -	 * This mode key can rotate each mode or toggle turbo mode.
> -	 * On battery, only ECO and BALANCED mode are available.
> +	 * This mode key will either cycle through each mode or toggle the performance profile.
>  	 */
>  	if (quirks->predator_v4) {
>  		u8 current_tp;
> -		int tp, err;
> -		u64 on_AC;
> +		int max_perf, tp, err;
>  
> -		err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE,
> -						   &current_tp);
> -		if (err)
> -			return err;
> +		if (cycle_gaming_thermal_profile) {
> +			platform_profile_cycle();
> +		} else {
> +			err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_PROFILE,
> +							   &current_tp);
> +			if (err)
> +				return err;
>  
> -		/* Check power source */
> -		err = WMID_gaming_get_sys_info(ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS, &on_AC);
> -		if (err < 0)
> -			return err;
> +			max_perf = find_last_bit(platform_profile_handler.choices,
> +						 PLATFORM_PROFILE_LAST);
>  
> -		switch (current_tp) {
> -		case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
> -			if (!on_AC)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> -			else if (cycle_gaming_thermal_profile)
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
> -			else
> +			if (current_tp == max_perf) {
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
> +			} else {
> +				last_non_turbo_profile = current_tp;
> +				tp = max_perf;
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
