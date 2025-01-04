Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488F28EC;
	Sat,  4 Jan 2025 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736011104; cv=none; b=aEp4AEt+3HRl+WA4AeJXjgFRgLpWrZFHSxKsJnw3KRKnOI3/XU3ENGSB0DqQ0QIYUaqFBn9eg+eYAlCVeayv9Tus3TB3X24qNALPTdPa/orIHXBVCOuvzWpSeojMU+ZEjJ/aejimNrcF7+7D8/4AxP5vqQF8tzkc+UygthuEQVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736011104; c=relaxed/simple;
	bh=xldAnF2V7pnTBsNk9aD/yJvhwAjZgjhHIC6wwn7xzT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bf5+zPGmsAgmUzz9lYIT+U4Nffxga3YUl12DKbMrvsK3RJ21iRQelkXrYKQITpWUhVyCBUtAH8WL5Z5UZRcMsSTNuYi8w4KuiHpSYYu3JuATG9YuQwqJKX3288m5cq4ES5SPpOpPhySrs+5uxAAqYmnUJOWcB3hw1c6o1QZi/eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEy0PXx8; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEy0PXx8"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-518957b0533so4274509e0c.1;
        Sat, 04 Jan 2025 09:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736011101; x=1736615901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYDbN0GMCYBtnILOXwLI5X6KDS/lt8ijKjq2dbWXSJg=;
        b=SEy0PXx8wYMI45XAZb0J+L+LT6ampFlkeeOFCIqqIrgoq/gSlIIN0alF1czI6p3mb8
         gLjAVQ9a4so4Xgd9r2QlFa/O6LrAtt+IYACBm3foXphFvZFGoao2U0kaL9UO3duTWLRa
         WhECRlKketN7sLvoujhp6n+loCxJdD29Q84lnWE7hVKYVSYCWBRqgVfbVGjCKPv5yeld
         uuckfmd0FUAeBvuZteyjyfUyjrcfVF5c1Bfz4s4NIAbTUyH1Pq6CuJUF36zz7YdFV4Du
         46tzNVYcTYL1tJT92XNG22iyBqoO3zVLuHPMEb0hGhDGLTITGfgxzyTlfCE5k0cPkS6r
         UQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736011101; x=1736615901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYDbN0GMCYBtnILOXwLI5X6KDS/lt8ijKjq2dbWXSJg=;
        b=FSeK+m0br4kcK7DdmIWLzebZZps4Le+4pMtV9XPbJ8jjpWidRx4gbTHu1TPBdOKI6+
         Ml6HOZpRsYGleDJLhzrX7YoMy1GXGZqXXWORDsDS5byryn9bi4MzNblQAK+d6PjhpOS+
         19VB+S/p7K/gjmO/ol8mdbjuA47L5lx3ONH+HtGpp/kgyh0vyfiI0ihCtuPMu8TZojtq
         2o+nEU2ArcT3UqAK7rmwLydcyyrU4712Z69g7UnTb36h6JXDk899jLS6Hxhjwcw/vgmI
         petObpEObitPDqK+HBeuRIkyOZBHwu17W+B5uMUHoHpsrEiivLvZorgHv2Dycwy8jfUs
         j4tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmo+UY2hZMBygKWCQHInvVK1Em4qrXxf6hbGKgyOCsPvHSlDM3nqElAA4GtLjgGRU+buXK6ef+WWhIqpw=@vger.kernel.org, AJvYcCW0Yj6A/Tc9OSLW5vc2mCwj1MSSqsljNRxvkTa8rolXyEG7bZsLSyN1LiRTOs4Spwm7BA0+4eKeGyvsrUOplGo9s9j8oA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2erpASWzUT5DqVNdncPyDmf5RUGP5dquV+5Q9tEKuW/qeht+2
	yEHV4U8JMlq4t4fjz+3kJoWzzyFXypz2XJBIC44r98pe+0dYR4eIH+by7A==
X-Gm-Gg: ASbGncvhJ0v1jSMhvc0mb+fZB0+hhfWMz/dHzrYXFdZ80OMSirqLd5Op0mgGGaQpG8L
	A3CO8uzI8ygUOIflLdusXnOZGMjsgHvwks8/KX0CppVRd2b2NXLpFqDre25nEx+/tWIww2WgCyr
	NIhaJcrsS87jSn7y9FUSrDGic6LAU6ZVuqqC3d25kUobtUhP0G7+D+G1srv7Bdm9XMfZL687VN0
	JEe/+MAcCv8LUu1x0WUVPH4Xc/TjwBASE0molZeRk8YCHfRBDKs/w==
X-Google-Smtp-Source: AGHT+IEWmtlhUlWDrBJGCG2mtcPUzoDFTFz9s25QskoLw+qLdUtWs4T/WO2eg0dGQiFmiysMdrjb2w==
X-Received: by 2002:a05:6122:3708:b0:51b:10a0:331c with SMTP id 71dfb90a1353d-51b75c6f654mr41892530e0c.5.1736011101567;
        Sat, 04 Jan 2025 09:18:21 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bad50dsm3739089e0c.12.2025.01.04.09.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 09:18:21 -0800 (PST)
Date: Sat, 4 Jan 2025 12:18:18 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 2/3] platform/x86: acer-wmi: use an ACPI bitmap to set
 the platform profile choices
Message-ID: <yanuo2ninpaaj2z46zfqcikttbe3asbjldo2apazuktv6yezti@gfseorovandn>
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
 <20250104-platform_profile-v2-2-b58164718903@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104-platform_profile-v2-2-b58164718903@gmail.com>

On Sat, Jan 04, 2025 at 08:59:21PM +0530, Hridesh MG wrote:
> Currently the choices for the platform profile are hardcoded. There is
> an ACPI bitmap accessible via WMI that specifies the supported profiles,
> use this bitmap to dynamically set the choices for the platform profile.
> 
> Link: https://lore.kernel.org/platform-driver-x86/ecb60ee5-3df7-4d7e-8ebf-8c162b339ade@gmx.de/
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 36 ++++++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 5370056fb2d03a768162f2f1643ef27dc6deafa8..f6c47deb4c452fc193f22c479c730aecb1e69e44 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -33,6 +33,7 @@
>  #include <linux/units.h>
>  #include <linux/unaligned.h>
>  #include <linux/bitfield.h>
> +#include <linux/bitops.h>
>  
>  MODULE_AUTHOR("Carlos Corbacho");
>  MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
> @@ -1983,6 +1984,7 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
>  static int acer_platform_profile_setup(struct platform_device *device)
>  {
>  	if (quirks->predator_v4) {
> +		unsigned long supported_profiles;
>  		int err;
>  
>  		platform_profile_handler.name = "acer-wmi";
> @@ -1992,16 +1994,30 @@ static int acer_platform_profile_setup(struct platform_device *device)
>  		platform_profile_handler.profile_set =
>  			acer_predator_v4_platform_profile_set;
>  
> -		set_bit(PLATFORM_PROFILE_PERFORMANCE,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_BALANCED,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_QUIET,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_LOW_POWER,
> -			platform_profile_handler.choices);
> +		err = WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES,
> +						   (u8 *)&supported_profiles);
> +		if (err)
> +			return err;
> +
> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET, &supported_profiles))
> +			set_bit(PLATFORM_PROFILE_QUIET,
> +				platform_profile_handler.choices);
> +
> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED, &supported_profiles))
> +			set_bit(PLATFORM_PROFILE_BALANCED,
> +				platform_profile_handler.choices);
> +
> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE, &supported_profiles))
> +			set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +				platform_profile_handler.choices);
> +
> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO, &supported_profiles))
> +			set_bit(PLATFORM_PROFILE_PERFORMANCE,
> +				platform_profile_handler.choices);
> +
> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_ECO, &supported_profiles))
> +			set_bit(PLATFORM_PROFILE_LOW_POWER,
> +				platform_profile_handler.choices);

As Armin mentioned, with this approach you may still select unsupported
profiles in acer_thermal_profile_change(). You should either handle that
in this patch or move this patch to the end of the series.

~ Kurt

>  
>  
>  		err = platform_profile_register(&platform_profile_handler);
