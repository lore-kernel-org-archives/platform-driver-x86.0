Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBC56A8D2
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Nov 2024 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732701353; cv=none; b=B/xKhIoD1suWtwLJQ4FyEtWxn4r0+cc4HYcQUOFpmtQvRMPXtyu2N8e163JcdPvok91TUpsQ3Q1mopKpaSUf2cur1FOp9ZmCgy6mfnVRfrY8wyqYewlHqO+1lzXEmQFqKQ2u6gDbDDPnedcUlLpG58o8xQr6GqQMR7qKZYnr938=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732701353; c=relaxed/simple;
	bh=hmBuqAo/7cY856F/O/uNFqpuO4k26yd9JiTJ1NUH0Fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvi6FOta2MAAPaewJ/9AOA4CfQ/GvHyT8xT8dUsc4zjgOlZ1FZI9XOlEqnyTqTsjHwWuuQzJR3rSHleYY4yOkYf051DGSYeDrwz2Mvm4jlJMkZY3xT7mWL+eiQuZBMSsiNMYYJFhOLGirltagifvKqy0SqeL5fvUVHFEedu51oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fNTP1a/J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fNTP1a/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732701351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j2mOc7Uk7NLqOI5DvLxQvJ1KrAnulFxD9O/rxLEFl6k=;
	b=fNTP1a/J46gNzw6AUcMp96grzy09xOH8HGofLMDY04rD1hHBDOW8U09P2DNjkdpcYlmrTW
	j6F5mvYZ//3snXn+dxKL0mY/tEW6R50b41PE53Sp9s/Xwv0fVApehrJ2I7YWJ1kW/z4Bp3
	C4XNoyaIHYhDaPkESnySE3+3OP3xDMo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-H3DdmASQNtqIde7qxSmErA-1; Wed, 27 Nov 2024 04:55:49 -0500
X-MC-Unique: H3DdmASQNtqIde7qxSmErA-1
X-Mimecast-MFC-AGG-ID: H3DdmASQNtqIde7qxSmErA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa5449e1d9cso291011566b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Nov 2024 01:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701348; x=1733306148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2mOc7Uk7NLqOI5DvLxQvJ1KrAnulFxD9O/rxLEFl6k=;
        b=eFy58EXKv0rBM5qrd6oPvtHjJn1sKh7Me5vHS6EkVSjnLIACqnb80X4H8Cd1lnv/P5
         q4R+m+MRURAU/VaS+isDQtUK6aVpmd+uORAasWRFyk2REHjiVmsdfwuAHSyHwE3hGySc
         TSG+0q2LpJLDbFqgL3j2qZShM1DAFr66sXsvI/gPlj3Xbn4jyG2dZUGfVpa6+hYVlqH/
         7vcJJb72KfTOfAitpy8tolYegQyT0dEfOaI76xgDp/tZOaxPs1wUIL82MLIfsgH2coxf
         4jCzpviraI62NTe4yF1bG+PPdPPLxsF1lu0CkS99xpkFT0sj9R5DKDLaD/4SBDQpgE5j
         g8kA==
X-Forwarded-Encrypted: i=1; AJvYcCVEz0fLdAKg/qOrAK4iRRSHptKR9lDKg4Uki495+3Hap/9icIGm03xaaarpIjNNjR3LAZjCYfaqUvFvzTiwZqdh3v7u@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1a0l2pRsKU7l5hG2PJFFAL12SOxuef5egEaMdPH/yLwTV4GpT
	jDqCqFeMn4dxqD69WNFAC/qbPBjR/3oP1uWKklXPqpXn+fy3vJgLEyqOEM8OlkCetF9uam3kjmR
	78NmK9xJFwBD2G4Y2cAA6QFco+HBWSxHEzUwQUaN7pkX4mw9+i/rkR6hu3e7hSpqNAKg/QtA=
X-Gm-Gg: ASbGncsBZT7ljdI6NzuqSr44Rw3ijJ7tIoiNWdJTQQzrvez6FvLrV5Vo4jbDl5CSY/H
	McotHZoQT8m5fBfLX0FHILFFxd8p7aQK3+Zh/jrZzw9PTYJWejq4dDqxBNV+Iafdy9zxnE9GqdH
	1hp++5uc827XgHXciF2oZxkNvTD8Ho7Btn0UE6Xzxz+ijh/pAqMxbtraB/u0EqgC0L0+gSe5NLD
	Cn7EK5ihG5Sx7R5UrdSNgPpC0XU+6xaeWn+kaernHp5P/U5DeFzjrwUTRav/Juypj3p3psojHIQ
	JbRmlTj9II5BUFaYjMSxmcFHd444v194/AGSOhHG7l4JFFT7k2ABJiHmdDBr8UShLIIUWmGRG4T
	KngPi250uCfmJzALONRPRSfkL
X-Received: by 2002:a17:906:c515:b0:a9e:8612:f201 with SMTP id a640c23a62f3a-aa58109383dmr127515466b.59.1732701348044;
        Wed, 27 Nov 2024 01:55:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMixaWTfkt4GLIW9UUJXGLQXKA41WNzZrX+0fJRFwCg4oaJPysXRi6QinvsdY9Slfwy3z3tA==
X-Received: by 2002:a17:906:c515:b0:a9e:8612:f201 with SMTP id a640c23a62f3a-aa58109383dmr127514166b.59.1732701347710;
        Wed, 27 Nov 2024 01:55:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa550ae2fbesm368661166b.24.2024.11.27.01.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 01:55:47 -0800 (PST)
Message-ID: <9606e49a-0a8a-450c-bece-a834df8ea480@redhat.com>
Date: Wed, 27 Nov 2024 10:55:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] p2sb: Do not scan and remove the P2SB device when
 it is unhidden
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 platform-driver-x86@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com, danielwa@cisco.com
References: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
 <20241127060055.357498-5-shinichiro.kawasaki@wdc.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241127060055.357498-5-shinichiro.kawasaki@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Seems I was a bit too quick with reviewing at a second
look I have found a small issue with this patch.

See my comment below.

On 27-Nov-24 7:00 AM, Shin'ichiro Kawasaki wrote:
> When drivers access P2SB device resources, it calls p2sb_bar(). Before
> the commit 5913320eb0b3 ("platform/x86: p2sb: Allow p2sb_bar() calls
> during PCI device probe"), p2sb_bar() obtained the resources and then
> called pci_stop_and_remove_bus_device() for clean up. Then the P2SB
> device disappeared. The commit 5913320eb0b3 introduced the P2SB device
> resource cache feature in the boot process. During the resource cache,
> pci_stop_and_remove_bus_device() is called for the P2SB device, then the
> P2SB device disappears regardless of whether p2sb_bar() is called or
> not. Such P2SB device disappearance caused a confusion [1]. To avoid the
> confusion, avoid the pci_stop_and_remove_bus_device() call when the BIOS
> does not hide the P2SB device.
> 
> For that purpose, cache the P2SB device resources only if the BIOS hides
> the P2SB device. Call p2sb_scan_and_cache() only if p2sb_hidden_by_bios
> is true. This allows removing two branches from p2sb_scan_and_cache().
> When p2sb_bar() is called, get the resources from the cache if the P2SB
> device is hidden. Otherwise, read the resources from the unhidden P2SB
> device.
> 
> Reported-by: "Daniel Walker (danielwa)" <danielwa@cisco.com>
> Fixes: 5913320eb0b3 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe")
> Closes: https://lore.kernel.org/lkml/ZzTI+biIUTvFT6NC@goliath/ [1]
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> ---
>  drivers/platform/x86/p2sb.c | 40 +++++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
> index 0bc6b21c4c20..1b2d83c4b02a 100644
> --- a/drivers/platform/x86/p2sb.c
> +++ b/drivers/platform/x86/p2sb.c
> @@ -100,10 +100,8 @@ static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
>  	/*
>  	 * The BIOS prevents the P2SB device from being enumerated by the PCI
>  	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
> -	 * Unhide the P2SB device here, if needed.
>  	 */
> -	if (p2sb_hidden_by_bios)
> -		pci_bus_write_config_dword(bus, devfn, P2SBC, 0);
> +	pci_bus_write_config_dword(bus, devfn, P2SBC, 0);
>  
>  	/* Scan the P2SB device and cache its BAR0 */
>  	p2sb_scan_and_cache_devfn(bus, devfn);
> @@ -112,9 +110,7 @@ static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
>  	if (devfn == P2SB_DEVFN_GOLDMONT)
>  		p2sb_scan_and_cache_devfn(bus, SPI_DEVFN_GOLDMONT);
>  
> -	/* Hide the P2SB device, if it was hidden */
> -	if (p2sb_hidden_by_bios)
> -		pci_bus_write_config_dword(bus, devfn, P2SBC, P2SBC_HIDE);
> +	pci_bus_write_config_dword(bus, devfn, P2SBC, P2SBC_HIDE);
>  
>  	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
>  		return -ENOENT;
> @@ -167,7 +163,12 @@ static int p2sb_cache_resources(void)
>  	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
>  	p2sb_hidden_by_bios = value & P2SBC_HIDE;
>  
> -	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
> +	/*
> +	 * If the BIOS does not hide the P2SB device then its resources
> +	 * are accesilble. Cache them only if the P2SB device is hidden.
> +	 */
> +	if (p2sb_hidden_by_bios)
> +		ret = p2sb_scan_and_cache(bus, devfn_p2sb);

ret will be returned uninitialized now when p2sb_hidden_by_bios is false,
so this patch also needs to initialize ret to 0 when declaring it.

With this fixed you can keep my Reviewed-by.

Regards,

Hans



>  
>  	pci_unlock_rescan_remove();
>  
> @@ -190,6 +191,26 @@ static int p2sb_read_from_cache(struct pci_bus *bus, unsigned int devfn,
>  	return 0;
>  }
>  
> +static int p2sb_read_from_dev(struct pci_bus *bus, unsigned int devfn,
> +			      struct resource *mem)
> +{
> +	struct pci_dev *pdev;
> +	int ret = 0;
> +
> +	pdev = pci_get_slot(bus, devfn);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	if (p2sb_valid_resource(pci_resource_n(pdev, 0)))
> +		p2sb_read_bar0(pdev, mem);
> +	else
> +		ret = -ENOENT;
> +
> +	pci_dev_put(pdev);
> +
> +	return ret;
> +}
> +
>  /**
>   * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
>   * @bus: PCI bus to communicate with
> @@ -213,7 +234,10 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
>  	if (!devfn)
>  		p2sb_get_devfn(&devfn);
>  
> -	return p2sb_read_from_cache(bus, devfn, mem);
> +	if (p2sb_hidden_by_bios)
> +		return p2sb_read_from_cache(bus, devfn, mem);
> +
> +	return p2sb_read_from_dev(bus, devfn, mem);
>  }
>  EXPORT_SYMBOL_GPL(p2sb_bar);
>  

