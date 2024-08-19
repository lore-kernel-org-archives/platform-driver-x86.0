Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB102208E
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 10:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724062810; cv=none; b=dyIQs31NXIZS1RYT6N5G82n4773ui6sQamhbSnREZDo++VECG6r/z6xStsSZ7kI9eH6txglYgRYrSho+4MSpKewWCbGEwbGzGsfSUpxyGYIMS13G6qZaMQif9CskKcPKzce8PurFm+/MjR76AdVkdsvCTpY1VrqNDMQk8IPLzs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724062810; c=relaxed/simple;
	bh=qaJVMTKX2YN/haWPaprtb5i3CGOYZT09tNmQOMz2HBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nF7TiI+qWunNaaFckUtIwYWAAMsF/WqyKut2A1lhI+EoH9DbcE3CLO3o1k3BezN17rYFZVds6jAgow5sGJvsmNpm/TMP2z0iR+oaGSqNNfvNqRRSfykCd9Z2N1d2nPDgokgKMbxvgr/knVz5Ln5z50r9bGqyLB2ALPlf/1sKsH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zal4T3Q0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zal4T3Q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724062806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tt2LYVYKmTVkAnDYFtLFnxYZzUlQbq44aMUMUQ1jAqA=;
	b=Zal4T3Q0OEUO7GCayl9Df5SQtetPjTwMWYxP8nu9cxg/eeO8UtdyFr9Hk4B/cBmmNz1TFt
	AvoYOvEBlGQAGNU3bURsLuPHGtyjaHnZfXYiogQqjWgnutRER7R6v2fx+VmdD3OKwgcijC
	818TBysOc1HdpiDGK9OWSnZU1Fq5Vvk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-sWpmum4fMe-4zE_yuYnqWQ-1; Mon, 19 Aug 2024 06:20:05 -0400
X-MC-Unique: sWpmum4fMe-4zE_yuYnqWQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5bed68b5ec6so1850117a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 03:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724062804; x=1724667604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tt2LYVYKmTVkAnDYFtLFnxYZzUlQbq44aMUMUQ1jAqA=;
        b=lrsm2sW6e0/SdGnFuhqqbufH6ib3FmsH2/jThpEzdR3PPR+KqOkJbd6380MZlyRUOp
         E/9mhx+xkX6i2t2OzbPq+x1WxgUaxBW8nNegb7tvQt/1T0uN8c45WrsDtlhpdd17SFv9
         gmana2CYnLpfMWgS43E0V/rUH1fMpzsZS2IVgsFHsFsKTl3lto8NgLww2UjuNaZV5y7u
         TA+fcxhabq2tcfPejFNHGlbG73tTHC5C60YBpNsOnlF/ZRrjj5YHf7qvLyKVSCHvlFev
         4uoMKl6Q8HimIgg5iMmBy1Zbn3at1/ULlOaXE4qhMEws8aSNifQUtoY1Ljspcq33QMSb
         TicA==
X-Forwarded-Encrypted: i=1; AJvYcCV//LV3yF/lyAFVuoG7BrSe4LReNl05cRKCvdo5S5dFN/tegw0DBe7LMSbuttlg/hYVkeXcpcb3JsT5jcHa1hwUuPURDgJ2aJ5lFYSfWQBxpPoUhQ==
X-Gm-Message-State: AOJu0YzaT49bThDVaUQoXNIVf2SJ8Yr9y2uJAk7R4LnETg8D/GUQ4AlN
	mIr8XKXDgVVmHWjDYMCUuPNqsfS8gU7kxmUmwXjDYj4GtH4TduBQh/uqxHIat16HnyyhaZYSeLj
	E/oOkozZEnzxrt/0ZRMVhq3bZLDVDq9QdLJiGXTfF3A8yVr+yE/HmoJMJgtif6P1F1akGmhU=
X-Received: by 2002:a05:6402:2707:b0:5be:fc44:d16c with SMTP id 4fb4d7f45d1cf-5befc44d688mr1453664a12.21.1724062804466;
        Mon, 19 Aug 2024 03:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVEZBeVDOcw2UccmR/xKwRwclHVYBRUiCGFShuiYXBBn7mzTfH4dJAZxcg/AEp0vLqteaXzA==
X-Received: by 2002:a05:6402:2707:b0:5be:fc44:d16c with SMTP id 4fb4d7f45d1cf-5befc44d688mr1453649a12.21.1724062803943;
        Mon, 19 Aug 2024 03:20:03 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbbe26fcsm5426612a12.5.2024.08.19.03.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 03:20:03 -0700 (PDT)
Message-ID: <32c550ec-d5f7-4422-a1e1-1fa22111d1c5@redhat.com>
Date: Mon, 19 Aug 2024 12:20:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/17] platform/x86: acerhdf: Use the .should_bind()
 thermal zone callback
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux PM <linux-pm@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Lukasz Luba
 <lukasz.luba@arm.com>, Zhang Rui <rui.zhang@intel.com>,
 Peter Kaestle <peter@piie.net>, platform-driver-x86@vger.kernel.org
References: <114901234.nniJfEyVGO@rjwysocki.net>
 <6709311.4vTCxPXJkl@rjwysocki.net>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6709311.4vTCxPXJkl@rjwysocki.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rafael,

On 8/12/24 4:19 PM, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Make the acerhdf driver use the .should_bind() thermal zone
> callback to provide the thermal core with the information on whether or
> not to bind the given cooling device to the given trip point in the
> given thermal zone.  If it returns 'true', the thermal core will bind
> the cooling device to the trip and the corresponding unbinding will be
> taken care of automatically by the core on the removal of the involved
> thermal zone or cooling device.
> 
> The previously existing acerhdf_bind() function bound cooling devices
> to thermal trip point 0 only, so the new callback needs to return 'true'
> for trip point 0.  However, it is straightforward to observe that trip
> point 0 is an active trip point and the only other trip point in the
> driver's thermal zone is a critical one, so it is sufficient to return
> 'true' from that callback if the type of the given trip point is
> THERMAL_TRIP_ACTIVE.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

I believe it is best to merge this through the thermal(zone0 subsystem
together with the rest of the series:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> 
> v1 -> v2: No changes
> 
> This patch only depends on patch [08/17] introducing .should_bind():
> 
> https://lore.kernel.org/linux-pm/2696117.X9hSmTKtgW@rjwysocki.net/
> 
> ---
>  drivers/platform/x86/acerhdf.c |   33 ++++++---------------------------
>  1 file changed, 6 insertions(+), 27 deletions(-)
> 
> Index: linux-pm/drivers/platform/x86/acerhdf.c
> ===================================================================
> --- linux-pm.orig/drivers/platform/x86/acerhdf.c
> +++ linux-pm/drivers/platform/x86/acerhdf.c
> @@ -378,33 +378,13 @@ static int acerhdf_get_ec_temp(struct th
>  	return 0;
>  }
>  
> -static int acerhdf_bind(struct thermal_zone_device *thermal,
> -			struct thermal_cooling_device *cdev)
> +static bool acerhdf_should_bind(struct thermal_zone_device *thermal,
> +				const struct thermal_trip *trip,
> +				struct thermal_cooling_device *cdev,
> +				struct cooling_spec *c)
>  {
>  	/* if the cooling device is the one from acerhdf bind it */
> -	if (cdev != cl_dev)
> -		return 0;
> -
> -	if (thermal_zone_bind_cooling_device(thermal, 0, cdev,
> -			THERMAL_NO_LIMIT, THERMAL_NO_LIMIT,
> -			THERMAL_WEIGHT_DEFAULT)) {
> -		pr_err("error binding cooling dev\n");
> -		return -EINVAL;
> -	}
> -	return 0;
> -}
> -
> -static int acerhdf_unbind(struct thermal_zone_device *thermal,
> -			  struct thermal_cooling_device *cdev)
> -{
> -	if (cdev != cl_dev)
> -		return 0;
> -
> -	if (thermal_zone_unbind_cooling_device(thermal, 0, cdev)) {
> -		pr_err("error unbinding cooling dev\n");
> -		return -EINVAL;
> -	}
> -	return 0;
> +	return cdev == cl_dev && trip->type == THERMAL_TRIP_ACTIVE;
>  }
>  
>  static inline void acerhdf_revert_to_bios_mode(void)
> @@ -447,8 +427,7 @@ static int acerhdf_get_crit_temp(struct
>  
>  /* bind callback functions to thermalzone */
>  static struct thermal_zone_device_ops acerhdf_dev_ops = {
> -	.bind = acerhdf_bind,
> -	.unbind = acerhdf_unbind,
> +	.should_bind = acerhdf_should_bind,
>  	.get_temp = acerhdf_get_ec_temp,
>  	.change_mode = acerhdf_change_mode,
>  	.get_crit_temp = acerhdf_get_crit_temp,
> 
> 
> 
> 

