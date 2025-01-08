Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2DF1FBEAF;
	Wed,  8 Jan 2025 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343274; cv=none; b=SvR3p50wNsDa7G7u8NPK9v7bxCkTr5cDKBCRp3J6nSiKTHWs0lc0nByxTE9hhkH0hX0GzOS7KRU/EMojpBBWcRGkfyiPGPna4Hyqu6OZUgVfwBWVaMF90Q00EfVXvLD3ENP0ixeJbCGpE64jIlkyLyGnYQzi26ex2utNLbmBAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343274; c=relaxed/simple;
	bh=azCgGQv+rxixQOlszluOIVWwA9kof4I/sO5zziOVWTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWvcaMvr46f9e9RVagtne11EcPu9BzO4oeQ2Gdn+c4vZO5ZDjPuX/jm7K6ToXpp2Yk/QxaPWrKp1KeRoUsDa6Eut2PhbxtK1jqW2WuCWphAWvSfF6rTdo7m9yPi3XNoUvqFm/xPGCvcmoIESvs8iex30kPEoCkQf4Ssbrol6UaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0FjZdv+; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0FjZdv+"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e3a26de697fso22683628276.3;
        Wed, 08 Jan 2025 05:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736343272; x=1736948072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f02rrceFT83OY/1pjIUINRZoSJW3aLRHf5K/m+4n5s0=;
        b=e0FjZdv+S05us0aylljCyohmAnnZ5mM2ACfUUihEP81HOtpXANRyOmzPIGpJ2vczyz
         c5EUTJUjLr7Rm+gfOkMJgY6255ytuz0gzV0JQkRhvS4yfyE+aIJc45Tmjybu/vpoCGSh
         +4RFRH0C16rn3UkC3WQqe9OB/tGeMLNx8Oefc9kQCrGaOblRpogOkvRfjRmv4fk7HpaN
         dW/Zy9+SDGJzRwI4whjSYV+t7T9a49MQFoT1NKFQ5fHXcsBf2xSYcmXbcgDuh8tg8iny
         QCvuvDQu4L5VEdzEjSA2ry/DXNjerFPImfgF1bkoltTcYwlWymA5zccwM7nhdBc3GZ/b
         SFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736343272; x=1736948072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f02rrceFT83OY/1pjIUINRZoSJW3aLRHf5K/m+4n5s0=;
        b=hZvnB+qSeySd/JC32uoxxqUVZtWuPRm0jupYT2oSZ/ouMRe8sRGadrOfrqRpeV54E0
         Ro5HNG55xLbVyXW+t6r7cFXgyX8vUxpBrA3EEGs2rToI64jlUHRKacbGwIrImj5b6fh/
         +dgrlGiH+eCqjNFsu5HeEA8DnhcfxuZWZw41JuSMoW6osLa2HhIdzEdYic0+pDq7AbGy
         lCglF6QzSmu7B1QP1dDEs9dTKZYO9xHFdZLGa/fgWDOb6YasD5uHBlM/czlYGS80q9bN
         tBsd7lWbeU6LLIefkj5vs7XXShCO63qqX62ba5EJPYPMprcfQq/s825R6wWFc7WFhPHS
         IjWg==
X-Forwarded-Encrypted: i=1; AJvYcCWZzYlFWlZ7SyZrhOHGBzoqNlKf8DqbCtyg6fITlb0hkpoP5Lpa3ME1x4jO5rXU2MbJ/7kpBfBhCfLXZhw=@vger.kernel.org, AJvYcCWb9sdcK28q1nwUFflq1B195ZYYBD3WfjbV+rNSXbhR+5zzkvIdIVMJgc0/2Ebs47e7cTJGVEhyJaYIz6LGtRg4sKuqhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1qIn0iGrMDV8a7+nvi0Zw0owueXOzG81eNJuml10Gzd6z40Ij
	T1q7/GIdYRenJlovlZoeqLiRo7VyIHSuaC+kxKdGqyZm3ao7806tTPRiOg==
X-Gm-Gg: ASbGncufgoohNO9NxQRaBykKJl4TrAEefdTqyfq4V0yuhlXiksJNRjfx660PDGuR8ZE
	6gXc4jPMhEhnE5BshnZJnYl4wRJnNEkLbdUB6tQ3LymCxJ4sH2/MVkMTnNWPBPFwzv5NI/reo00
	RLu7toCfYfUpfehMnwjsfxIK4OimSmItBYLB0DwwnS8TDy+mHxFQELcbJs+app6lNRIPGM0oZOx
	gF7SR3gfdC9m8Ym6KulQlUWxTgD+IkbSt+5c0J9AS/BurWZU83wQg==
X-Google-Smtp-Source: AGHT+IGHvvUJcdIkTKaIVsk/gYDgPZ1mduzjIzys7XgswxASVo94enkaxJqH0Eb3B37HBuif/CAkMQ==
X-Received: by 2002:a05:6902:1206:b0:e54:ab08:152e with SMTP id 3f1490d57ef6-e54ee207e0fmr2075888276.44.1736343272023;
        Wed, 08 Jan 2025 05:34:32 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cbf425bsm9868312276.2.2025.01.08.05.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:34:31 -0800 (PST)
Date: Wed, 8 Jan 2025 08:34:28 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 2/5] platform/x86: acer-wmi: use new helper function
 for setting overclocks
Message-ID: <id64ds3aixtcpscvzhq6q5hd3ofyuqgdp5vk55jnlbattgxt7n@mq3qyxj74w37>
References: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
 <20250108-platform_profile-v3-2-ec3658d9be9c@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-platform_profile-v3-2-ec3658d9be9c@gmail.com>

On Wed, Jan 08, 2025 at 02:15:24PM +0530, Hridesh MG wrote:
> Migrate the OC handling in acer_toggle_turbo() to the new helper
> function for issuing the SetGamingMiscSetting WMI call.
> 
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
>  drivers/platform/x86/acer-wmi.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 97eabb0ec42781a27e6a00ce0df4c8a815c1b817..f662e3740408f70e1e921a90fe75ce441fd239d0 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -119,7 +119,14 @@ enum acer_wmi_predator_v4_sensor_id {
>  	ACER_WMID_SENSOR_GPU_TEMPERATURE	= 0x0A,
>  };
>  
> +enum acer_wmi_predator_v4_oc {
> +	ACER_WMID_OC_NORMAL			= 0x0000,
> +	ACER_WMID_OC_TURBO			= 0x0002,
> +};
> +
>  enum acer_wmi_gaming_misc_setting {
> +	ACER_WMID_MISC_SETTING_OC_1			= 0x0005,
> +	ACER_WMID_MISC_SETTING_OC_2			= 0x0007,
>  	ACER_WMID_MISC_SETTING_PLATFORM_PROFILE		= 0x000B,
>  };
>  
> @@ -1530,9 +1537,6 @@ static acpi_status WMID_gaming_set_u64(u64 value, u32 cap)
>  	case ACER_CAP_TURBO_FAN:
>  		method_id = ACER_WMID_SET_GAMING_FAN_BEHAVIOR;
>  		break;
> -	case ACER_CAP_TURBO_OC:
> -		method_id = ACER_WMID_SET_GAMING_MISC_SETTING_METHODID;
> -		break;
>  	default:
>  		return AE_BAD_PARAMETER;
>  	}
> @@ -1891,8 +1895,12 @@ static int acer_toggle_turbo(void)
>  		WMID_gaming_set_fan_mode(0x1);
>  
>  		/* Set OC to normal */
> -		WMID_gaming_set_u64(0x5, ACER_CAP_TURBO_OC);
> -		WMID_gaming_set_u64(0x7, ACER_CAP_TURBO_OC);
> +		if (has_cap(ACER_CAP_TURBO_OC)) {
> +			WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_OC_1,
> +						     ACER_WMID_OC_NORMAL);
> +			WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_OC_2,
> +						     ACER_WMID_OC_NORMAL);
> +		}
>  	} else {
>  		/* Turn on turbo led */
>  		WMID_gaming_set_u64(0x10001, ACER_CAP_TURBO_LED);
> @@ -1901,8 +1909,12 @@ static int acer_toggle_turbo(void)
>  		WMID_gaming_set_fan_mode(0x2);
>  
>  		/* Set OC to turbo mode */
> -		WMID_gaming_set_u64(0x205, ACER_CAP_TURBO_OC);
> -		WMID_gaming_set_u64(0x207, ACER_CAP_TURBO_OC);
> +		if (has_cap(ACER_CAP_TURBO_OC)) {
> +			WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_OC_1,
> +						     ACER_WMID_OC_TURBO);
> +			WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_OC_2,
> +						     ACER_WMID_OC_TURBO);
> +		}
>  	}
>  	return turbo_led_state;
>  }
