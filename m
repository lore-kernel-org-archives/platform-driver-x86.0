Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9801D849C;
	Tue, 14 Jan 2025 03:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736826813; cv=none; b=ps5JTX0dvWY013QM/5Qp7Qc5XnbNLGnaxd8MyxQJsYuVSB3c/SmukGBw7Ym4oyisb7XRfO0cGa6EZUT77YjqxAkz/SgiOma30j8DaJ29jyh6HnqHj1ymMnje0BDrlphdfUNNCRLtWQ1WILmEg2K52u1YOkIo3aMyAa1C3rOyhqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736826813; c=relaxed/simple;
	bh=ASVicwYG5NnmSSMs1sKjI5pyDpeeR4L1fbyGqWyD0Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcaUcg8drTRx5Fk1XHkNuuWT0aPaM/2VzlvI1WiAnVspv6d5w8t+fGXd6Xd6MFnA6d31IsjZsOXmKsHKkJ3MjX3KHfGLW3OMAknvdg8u9Fgv/FzgdRDpeCs9vD6crMBFhj0npkvf6Bv2O81XsfL2Ef8IY9n/IpY9AtQ4KnVcTmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mB90kVPR; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mB90kVPR"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5189105c5f5so3038912e0c.0;
        Mon, 13 Jan 2025 19:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736826810; x=1737431610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oz8gs6qDcIN8JaRYrCDIisPtaIbqEIhnbMNJPEPg5V0=;
        b=mB90kVPR3LNzgXlfFWijc3WBDgJigCne5aDyF9JIpPy31xWkuL/FRcKKwcmNTWesRn
         6yo3OvpabLpZU6fYBn12EHqQAIaqj7o3xnElxc4TPaySBVqP7AfaUL7uMA3rk8GdqNZC
         DEo9i049riEIoGfPccONMiuo/+JUSTWO4wVxrQtgV2a9V3GYywf5rxxiGQ4RFp73ZtB2
         jCfpSlkGAPC5TJlHqz/4y7rGF1PGWsiO9aK3HJlIQZDiN5DRoTuMwaYj9pdhxXIrZaR/
         5QMA0QTIltHeLzbGy13p8TnU9s9KCPlrPTPh670CZE19L3F3Y2SYIIUD/qtTqbQ6vOf0
         xb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736826810; x=1737431610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oz8gs6qDcIN8JaRYrCDIisPtaIbqEIhnbMNJPEPg5V0=;
        b=rpo5kwIseeCieHqhl0YdhlU4RXqwNTaaWCKd1XD+cRpnJCVrqpOW+i2WV8PeGzG8ho
         9uqmESamXYROdOObi6D2KNmdrwUDzJDjXhLOwC2wBPgQy+ezoP/sF/HbWLTB1+Zgt0Fz
         KlFBgEl78r7FV9owDObhBGmjj8WSg1ZcFckAGcSQbLNMD8BtudREIlC//nmJXD9XunUG
         WPQDG3h0AyF4IeaCWFuh7iKttvpb7XvVzv5uKoAU8WEG/T7D9azmccbSVmqr3V4QVHzO
         TUSDrjsJvUAA36ZxbVbcY67HSr+jBBR8kMmuF6cS9N2AYp/jWoq2mOUnlcKfUW9rfXid
         q5Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVwbykGBGoUAeSz2rc0WnkLNgD6Ktt5bGT9ITl0HlzLIgixdtuoQDXV7GsZwf5NOeSb+z9chqJY+iBAWjRjGp2qHoJrdA==@vger.kernel.org, AJvYcCWDbMA6kcUhqOGAwMJxOJmSJf+8rR67dmJRoGIvbmKQ9xBkPV2Ns+SHjVQHETXE2JdHBXe/jqlWnSNSM08=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR5TxGC/CQ2KxcXqBDUCPJKIfCPYyUrVoFEih0A2xoaftY2pTY
	Jm3sVIVGjnLsjTqLdqzTTc0Bw3pBsX9e040UblFsdaLJENdBJNaaAboSqg==
X-Gm-Gg: ASbGnctvzy8IfyP6EWnJlKVm6eDFaFYw9tokcmbLODh9TgVcBgQzQB6nVahAlgXyB14
	RD/KkdqppMMKL/aNdFuHQRRq2Hjh8itLLxJkUanJoQotIJhF2ZgqKjrCmdtYLB2eopv2tGBPA5k
	auB1UdHSJPBebxbqbPnhx59+yIpTof0BCf45LIZf9UE4BEheMDuBFpidjnXNjlhzV3IbdlyuRC1
	1rXdXIzl4kqrv82ZDOUXap4/3RvPOa6vxEXh5V6xgwQm30CfWTp8A==
X-Google-Smtp-Source: AGHT+IH8//q9BCWaAe4RmX/XYAVg7AntlneTo83Ro8/+o260Z2k/VGkIFopfCFjV3k+iecjrLFd+UQ==
X-Received: by 2002:a05:6122:828f:b0:518:a1a6:4642 with SMTP id 71dfb90a1353d-51c6c3049femr19660641e0c.9.1736826810566;
        Mon, 13 Jan 2025 19:53:30 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fcfe551sm3791268e0c.39.2025.01.13.19.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 19:53:29 -0800 (PST)
Date: Mon, 13 Jan 2025 22:53:26 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 4/5] platform/x86: acer-wmi: use an ACPI bitmap to set
 the platform profile choices
Message-ID: <mvy7pjydmou4odwp7ctuzyghinaz6irhe5rmok6quotz7q44l3@w4dl6ikwo5mn>
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
 <20250113-platform_profile-v4-4-23be0dff19f1@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-platform_profile-v4-4-23be0dff19f1@gmail.com>

On Mon, Jan 13, 2025 at 06:44:12PM +0530, Hridesh MG wrote:
> Currently the choices for the platform profile are hardcoded. There is
> an ACPI bitmap accessible via WMI that specifies the supported profiles,
> use this bitmap to dynamically set the choices for the platform profile.
> 
> Link: https://lore.kernel.org/platform-driver-x86/ecb60ee5-3df7-4d7e-8ebf-8c162b339ade@gmx.de/
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
>  drivers/platform/x86/acer-wmi.c | 67 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 52 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 88416c37eca0af2099b0c8d91b38912a4e5d108f..37f8c2019925391185e1e0952dac563daf923320 100644
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
> @@ -766,6 +768,9 @@ static bool platform_profile_support;
>   */
>  static int last_non_turbo_profile;
>  
> +/* The most performant supported profile */
> +static int acer_predator_v4_max_perf;
> +
>  enum acer_predator_v4_thermal_profile {
>  	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET		= 0x00,
>  	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED	= 0x01,
> @@ -1983,7 +1988,7 @@ acer_predator_v4_platform_profile_set(struct platform_profile_handler *pprof,
>  	if (err)
>  		return err;
>  
> -	if (tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> +	if (tp != acer_predator_v4_max_perf)
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
> @@ -2001,16 +2007,46 @@ static int acer_platform_profile_setup(struct platform_device *device)
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
> +		/* Iterate through supported profiles in order of increasing performance */
> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_ECO, &supported_profiles)) {
> +			set_bit(PLATFORM_PROFILE_LOW_POWER,
> +				platform_profile_handler.choices);
> +			acer_predator_v4_max_perf =
> +				ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
> +		}
> +
> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET, &supported_profiles)) {
> +			set_bit(PLATFORM_PROFILE_QUIET,
> +				platform_profile_handler.choices);
> +			acer_predator_v4_max_perf =
> +				ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
> +		}
> +
> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED, &supported_profiles)) {
> +			set_bit(PLATFORM_PROFILE_BALANCED,
> +				platform_profile_handler.choices);
> +			acer_predator_v4_max_perf =
> +				ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> +		}
> +
> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE, &supported_profiles)) {
> +			set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +				platform_profile_handler.choices);
> +			acer_predator_v4_max_perf =
> +				ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
> +		}
> +
> +		if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO, &supported_profiles)) {
> +			set_bit(PLATFORM_PROFILE_PERFORMANCE,
> +				platform_profile_handler.choices);
> +			acer_predator_v4_max_perf =
> +				ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> +		}
>  
>  		err = platform_profile_register(&platform_profile_handler);
>  		if (err)
> @@ -2028,7 +2064,8 @@ static int acer_platform_profile_setup(struct platform_device *device)
>  static int acer_thermal_profile_change(void)
>  {
>  	/*
> -	 * This mode key will either cycle through each mode or toggle the turbo profile.
> +	 * This mode key will either cycle through each mode or toggle the
> +	 * most performant profile.
>  	 */
>  	if (quirks->predator_v4) {
>  		u8 current_tp;
> @@ -2042,10 +2079,10 @@ static int acer_thermal_profile_change(void)
>  			if (err)
>  				return err;
>  
> -			if (current_tp == ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> +			if (current_tp == acer_predator_v4_max_perf)
>  				tp = last_non_turbo_profile;
>  			else
> -				tp = ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> +				tp = acer_predator_v4_max_perf;
>  
>  			err = WMID_gaming_set_misc_setting(
>  				ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, tp);
> @@ -2053,7 +2090,7 @@ static int acer_thermal_profile_change(void)
>  				return err;
>  
>  			/* Store last profile for toggle */
> -			if (current_tp != ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> +			if (current_tp != acer_predator_v4_max_perf)
>  				last_non_turbo_profile = current_tp;
>  
>  			platform_profile_notify(&platform_profile_handler);
> 
> -- 
> 2.47.1
> 
