Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA481FCCED;
	Wed,  8 Jan 2025 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344270; cv=none; b=g6MlDtpj1CNVAAOLsCx/hiAHZOuYlppoYmIvlPv8dBazF3nB4nsHQkGOmxffHovmkV24MAEos9tngsGWZycb6A3PRf0Bx0k/Z1wawAK7shfOhmkmmcNVs4pU7l/Us7Ue0QqktHs1FsiV4/O043soZOGKlsJof1O8n7SRT41hPTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344270; c=relaxed/simple;
	bh=iROGqFXiPgbk4GsUOBMu2UvAtt3elRT6mLAltz/vwK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUrfl3KRavfq1P/n/5ZpyIf150KP40Wwi3rOKYNLnSRnNoRef7qyzdhl/IrjtOqfa/EV+ZcO8dvQHOtgboyQ11ebPv6iyp8o60dsaorg1OPvFmCSyxAX7Za6YVolR9bjs/xetfi3qe/3+0+i8Amj8W/lNSbsRSxZFxbgR8jErVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkUVaOZg; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkUVaOZg"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afdd15db60so4620334137.1;
        Wed, 08 Jan 2025 05:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736344268; x=1736949068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+2kEhLhRkj0gpxkrGpaAWjsDgZAUCXYhIHHFiXlEZY=;
        b=RkUVaOZgOWegh3bt8Du0Fd98G99If5K7//1Ti+3828lf+RiNiY/X5sfE94PP/fW4X0
         cpj0dZZtPNA0DHiArOw/q30zBgTeUikxWjAgRP56dPqyqLPYJ3EyKf+S3iq5wA/bbxzx
         TGJSLsNZhOn+FEZDAyaCahPx9/s4i6xlVaIjH34iUCN2ns1+5dHlfYiu6svE7nAOj9dV
         beawNfknzjCJYy4LdfprV05FbUkZl30x2EFNlFQ9OsfyqPH8P7rFseckNIq5Rrjvoabe
         yin95auQUZGk+RfdPtg6qFfEczrFwVqBA9/u/ui0Zsd3yvuV6EmQSZEvzd4f3hZlRcHf
         x5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736344268; x=1736949068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+2kEhLhRkj0gpxkrGpaAWjsDgZAUCXYhIHHFiXlEZY=;
        b=gNnPJZJcbZfsdniBm/5r7imYCGJYUW3E4JcIebmJSTR9lSolBgPlpQPBKeFhizFr7I
         ddKCAIX+4/5mDeNS9YGsmB/7qGlLexaA6hGGEL5UYA4Kz+VBUEVy53t/U7/FOXak68J4
         ZJkXOEiNDM72eNhK+FgM48rr8sHEoz/PzdQqAFLEhq8Z5FIA2gS18MQv0TwhXy5y98cb
         HY4MNfaRoyFDCg3qW4fR3aGWm7ZgsEsOIjSwz0kKOGDIGvfWbbJWCLrnkVb/QmRrhSwO
         t1OkG64/29kYbsz01yF6KM9PIH6Xzq6alQYLzGwQq7VYHt0LxxoPBGMiEDCRHGOE2qr2
         rRLw==
X-Forwarded-Encrypted: i=1; AJvYcCV1fvy3Yg/bzUhN40RU0wCOVQqCQaw8YEjd6+NSv3bkQhfZE5WQZmEOl8vxf3tEZRaHA8tftS7/yc3JBqk=@vger.kernel.org, AJvYcCXtQbHxviLCCldjTWQaxgLsLFjMw4amcrPfFeywBa8g8KC9pWTvsMJ7NQnnZ/7nQZtibxPASgg9UawFcldUiO2+40uRig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUZXoxYt79ATtY+I5o3AjpZJglXkk8+PCsCOx1ilhFBQ0UEsaY
	s9KteYTlkYoMXXcInjyXlHAtv/FEYg6+86qWQEqgwlRr4MmieYKo
X-Gm-Gg: ASbGncvc2yee08KLhgbunWoz+Crm72l7/hY1WgkZLQUTxL7KCauSlDaYWPIaGbDkTom
	A0x7JmD/c4sUXjGQ5K45buKB7PooJdntl3KVD5sz04NWQcajI2vCeDeD9PL0qYmqmtVKaGeFmD2
	eRgAYKNMbszx1gyHdKAyEWJEHLPRvLmhxCl5SbdBXt/6eKdel5bCBkwslEAJwZ/xdiGRl0PCS+C
	+OV55H7DrOWZ98kC7+U0IrOWdWujSCJZqR1YXWdvNmm2oL/gA0DHQ==
X-Google-Smtp-Source: AGHT+IF8FP9/AXvHwdPGqZLHYCw/FtA+Q/HtNpq9fuYVUiYFPDwjp8oPCRgaccJ4tu5ELgn67CcOFA==
X-Received: by 2002:a05:6102:6e88:b0:4b3:ece0:7daa with SMTP id ada2fe7eead31-4b3ece08829mr1104456137.23.1736344267568;
        Wed, 08 Jan 2025 05:51:07 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac1d6d5sm8628129241.6.2025.01.08.05.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:51:07 -0800 (PST)
Date: Wed, 8 Jan 2025 08:51:04 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 4/5] platform/x86: acer-wmi: use an ACPI bitmap to set
 the platform profile choices
Message-ID: <ntiwr3bxaf66eqe7upu2qk3wwkemqo5qft76g2ybqydbs7qqjv@2vyn36qayp6o>
References: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
 <20250108-platform_profile-v3-4-ec3658d9be9c@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-platform_profile-v3-4-ec3658d9be9c@gmail.com>

On Wed, Jan 08, 2025 at 02:15:26PM +0530, Hridesh MG wrote:
> Currently the choices for the platform profile are hardcoded. There is
> an ACPI bitmap accessible via WMI that specifies the supported profiles,
> use this bitmap to dynamically set the choices for the platform profile.
> 
> Link: https://lore.kernel.org/platform-driver-x86/ecb60ee5-3df7-4d7e-8ebf-8c162b339ade@gmx.de/
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 55 +++++++++++++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 7968fe21507b1cf28fdc575139057c795e6a873b..6c98c1bb3bdce6a7c6559f6da4ff3c6ce56b60e3 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -33,6 +33,7 @@
>  #include <linux/units.h>
>  #include <linux/unaligned.h>
>  #include <linux/bitfield.h>
> +#include <linux/bitmap.h>
>  
>  MODULE_AUTHOR("Carlos Corbacho");
>  MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
> @@ -127,6 +128,7 @@ enum acer_wmi_predator_v4_oc {
>  enum acer_wmi_gaming_misc_setting {
>  	ACER_WMID_MISC_SETTING_OC_1			= 0x0005,
>  	ACER_WMID_MISC_SETTING_OC_2			= 0x0007,
> +	ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES	= 0x000A,
>  	ACER_WMID_MISC_SETTING_PLATFORM_PROFILE		= 0x000B,
>  };
>  
> @@ -1957,7 +1959,7 @@ static int
>  acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
>  				      enum platform_profile_option profile)
>  {
> -	int err, tp;
> +	int max_perf, err, tp;
>  
>  	switch (profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
> @@ -1983,7 +1985,10 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
>  	if (err)
>  		return err;
>  
> -	if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> +	max_perf = find_last_bit(platform_profile_handler.choices,
> +				 PLATFORM_PROFILE_LAST);
> +
> +	if (tp != max_perf)

You can't directly compare `tp` and `max_perf`. ACER_PREDATOR_V4 values
may not match PLATFORM_PROFILE ones.

It does in the case of PERFORMANCE and TURBO, but it does not in the
case of QUIET and BALANCED.

I suggest you store the actual ACER_PREDATOR_V4 max_perf when setting up
the platform_profile.

>  		last_non_turbo_profile = tp;
>  
>  	return 0;
> @@ -1992,6 +1997,7 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
>  static int acer_platform_profile_setup(struct platform_device *device)
>  {
>  	if (quirks->predator_v4) {
> +		unsigned long supported_profiles;
>  		int err;
>  
>  		platform_profile_handler.name = "acer-wmi";
> @@ -2001,16 +2007,30 @@ static int acer_platform_profile_setup(struct platform_device *device)
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
>  
>  		err = platform_profile_register(&platform_profile_handler);
>  		if (err)
> @@ -2028,11 +2048,11 @@ static int acer_platform_profile_setup(struct platform_device *device)
>  static int acer_thermal_profile_change(void)
>  {
>  	/*
> -	 * This mode key will either cycle through each mode or toggle the turbo profile.
> +	 * This mode key will either cycle through each mode or toggle the most performant profile.
>  	 */
>  	if (quirks->predator_v4) {
>  		u8 current_tp;
> -		int err, tp;
> +		int max_perf, err, tp;
>  
>  		if (cycle_gaming_thermal_profile) {
>  			platform_profile_cycle();
> @@ -2042,11 +2062,14 @@ static int acer_thermal_profile_change(void)
>  			if (err)
>  				return err;
>  
> -			if (current_tp == ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO) {
> +			max_perf = find_last_bit(platform_profile_handler.choices,
> +						 PLATFORM_PROFILE_LAST);
> +
> +			if (current_tp == max_perf) {

Same as above.

~ Kurt

>  				tp = last_non_turbo_profile;
>  			} else {
>  				last_non_turbo_profile = current_tp;
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> +				tp = max_perf;
>  			}
>  
>  			err = WMID_gaming_set_misc_setting(
