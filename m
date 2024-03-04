Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E8F6026A
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Mar 2024 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571158; cv=none; b=Xfiy+u5dNy5sl+OyWDhxMYyVPI7twWhYtD2Fi1E6BEzx7zlrUR9zr+9+7qPbyRVptITS23pv8cYjHmaf9RZusBvm16rw7/aDOeHl16AgOhVfR/vZ7ojy4ay//BVs9DbJoz/GBwkF7fZ+xU8yhupwtCUn3OUrepzTbmqXJFEyPak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571158; c=relaxed/simple;
	bh=6mJJenTAuAPmRv04beNi8wfbIEkU3wKp27DVpqLUeEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAhomi5huV0/VfsNPYvKayudDDtnb4iy8RCNVLtZRn9cUg3Lvh2C+Gp4KqanUxtB3M11L/2RHs+ubkEdl0p9mFzfcL4xYJhGBtlv+VJJNqhvjutdQ8ADFtStpOLJDuXjjQwMkNkhLo/UjPvi2Caeo0H/DpI+5wxdeLNXp29iEkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MbdfXgC0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MbdfXgC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709571155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pDZBx6b+sDral9amWV4nmduRo6EA43+ucC/adZNje+4=;
	b=MbdfXgC0KPOdiYdl+jRP7vg6eHWARNd9Lgvc0i/Apoc2kZ2+U/+QvKCB6UL+8qcTQ883sm
	mMF6QdOhrRFT9IIn/mREqRtZYHgDCBUAHRgHHYvbrjxi6pXlgW0HyeBr0m8prjFpWN7HS9
	WgM3lS/nLuRx1QIEaTLfHLmyaMj0gdE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-8-X7DT3CNgWF4sUhk-mf6A-1; Mon, 04 Mar 2024 11:52:34 -0500
X-MC-Unique: 8-X7DT3CNgWF4sUhk-mf6A-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d2e4ea0f63so34166731fa.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Mar 2024 08:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709570841; x=1710175641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDZBx6b+sDral9amWV4nmduRo6EA43+ucC/adZNje+4=;
        b=K69ANctZYQVrT9TX7oA7Is87YHB8oG2gNvu9K9RUJ+HzQBQeoM0PS6cwFUD2YBsKV6
         7NrFYuoDA5VUdYvFiUuuLF1aHtICN1LC5UL9ssFZ/R7XSUU2sWUv5v6TGUG1S4egmC0l
         jJljlUXBGjpvRoUbFLPC3fhIBelcL8PYCLEvODrFqNEpleneT7YhjpUQ2/4c9+r86JwK
         XVWXI4ONs/OCrlH1LObH45OdA1hkIcRlTWiyPS6Thrb+3wPFQw/6Iq5o5JPpZ06w6vMj
         aJFYf6zcJHPnLcK/rKYbCCQ8iK7SZ8kBMGZuUj5qJSseOJts+p9E0tBsp6xreqjto20t
         mCzA==
X-Forwarded-Encrypted: i=1; AJvYcCURYu+CtWr75kXabzHPY0NBCj2oYsVfLKHFiR6hGx/HvweH+8wezW9kQtahjyjYG3RhKlYoEBldQE87L3O1EbqPFOfG/S40o3NX14h3lZtkhR4S+g==
X-Gm-Message-State: AOJu0YzNk/zG7WZe0uUka1h7TVihej27F9IOF5FfPEuJDJgupEoz8tp2
	Lj6tE5hqCWWSE2s7BtoEMzH+MGZImPa6bbK67rJw9XpH4Wt2tADMTtmTWmgmZrYFHKre6ZrGOZi
	1lXpdx51/0tUuSKqS1f5j3xJSDtD4Q/9WsfO6LcTDf6XMMdAx6CswqnBogGxAX8lZxnQIJio=
X-Received: by 2002:a2e:aaa7:0:b0:2d2:a3bc:b7d8 with SMTP id bj39-20020a2eaaa7000000b002d2a3bcb7d8mr6218048ljb.20.1709570841609;
        Mon, 04 Mar 2024 08:47:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNoe2ubGGjmxx+SlBiuqS124weoi57lX43Hf1non5XGMyOoScFbf3rF8AsIw/FBt3x9QwsMw==
X-Received: by 2002:a2e:aaa7:0:b0:2d2:a3bc:b7d8 with SMTP id bj39-20020a2eaaa7000000b002d2a3bcb7d8mr6218036ljb.20.1709570841264;
        Mon, 04 Mar 2024 08:47:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 2-20020a05651c00c200b002d0acb57c89sm1722974ljr.64.2024.03.04.08.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 08:47:20 -0800 (PST)
Message-ID: <be1c9329-1d24-4f49-b200-c8ac551b1fe2@redhat.com>
Date: Mon, 4 Mar 2024 17:47:19 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/1] platform/x86: p2sb: On Goldmont only cache P2SB and SPI
 devfn BAR
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: danilrybakov249@gmail.com, Lukas Wunner <lukas@wunner.de>,
 Klara Modin <klarasmodin@gmail.com>, linux-pci@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20240304134356.305375-1-hdegoede@redhat.com>
 <20240304134356.305375-2-hdegoede@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240304134356.305375-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 3/4/24 14:43, Hans de Goede wrote:
> On Goldmont p2sb_bar() only ever gets called for 2 devices, the actual P2SB
> devfn 13,0 and the SPI controller which is part of the P2SB, devfn 13,2.
> 
> But the current p2sb code tries to cache BAR0 info for all of
> devfn 13,0 to 13,7 . This involves calling pci_scan_single_device()
> for device 13 functions 0-7 and the hw does not seem to like
> pci_scan_single_device() getting called for some of the other hidden
> devices. E.g. on an ASUS VivoBook D540NV-GQ065T this leads to continuous
> ACPI errors leading to high CPU usage.
> 
> Fix this by only caching BAR0 info and thus only calling
> pci_scan_single_device() for the P2SB and the SPI controller.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218531 [1]
> Fixes: 5913320eb0b3 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Good news Danil Rybakov has just confirmed in bugzilla
that simple patch fixes things. So IMHO this is the way
to move forward to fix this.

Shin'ichiro, any objections from you against this fix ?

Danil, is it ok if I credit you for all your testing by adding:

Reported-by: Danil Rybakov <danilrybakov249@gmail.com>
Tested-by: Danil Rybakov <danilrybakov249@gmail.com>

to the commit message for the patch while merging it ?

Regards,

Hans






> ---
>  drivers/platform/x86/p2sb.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
> index 6bd14d0132db..3d66e1d4eb1f 100644
> --- a/drivers/platform/x86/p2sb.c
> +++ b/drivers/platform/x86/p2sb.c
> @@ -20,9 +20,11 @@
>  #define P2SBC_HIDE		BIT(8)
>  
>  #define P2SB_DEVFN_DEFAULT	PCI_DEVFN(31, 1)
> +#define P2SB_DEVFN_GOLDMONT	PCI_DEVFN(13, 0)
> +#define SPI_DEVFN_GOLDMONT	PCI_DEVFN(13, 2)
>  
>  static const struct x86_cpu_id p2sb_cpu_ids[] = {
> -	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,	PCI_DEVFN(13, 0)),
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT, P2SB_DEVFN_GOLDMONT),
>  	{}
>  };
>  
> @@ -98,21 +100,12 @@ static void p2sb_scan_and_cache_devfn(struct pci_bus *bus, unsigned int devfn)
>  
>  static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
>  {
> -	unsigned int slot, fn;
> +	/* Scan the P2SB device and cache its BAR0 */
> +	p2sb_scan_and_cache_devfn(bus, devfn);
>  
> -	if (PCI_FUNC(devfn) == 0) {
> -		/*
> -		 * When function number of the P2SB device is zero, scan it and
> -		 * other function numbers, and if devices are available, cache
> -		 * their BAR0s.
> -		 */
> -		slot = PCI_SLOT(devfn);
> -		for (fn = 0; fn < NR_P2SB_RES_CACHE; fn++)
> -			p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
> -	} else {
> -		/* Scan the P2SB device and cache its BAR0 */
> -		p2sb_scan_and_cache_devfn(bus, devfn);
> -	}
> +	/* On Goldmont p2sb_bar() also gets called for the SPI controller */
> +	if (devfn == P2SB_DEVFN_GOLDMONT)
> +		p2sb_scan_and_cache_devfn(bus, SPI_DEVFN_GOLDMONT);
>  
>  	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
>  		return -ENOENT;

