Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AB03E47B
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 11:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922731; cv=none; b=mEGYejs4JBYxmPucrnJkVtNorYwORSp6I7Bh8YwXU5oDrf+GX1ZLXHekothxzQPAXj79+71fQKyXuHrPW/9IUZinzBrhab16Xgrlc+fc34+AII61Ycuq8dNRITjyqgEnAlzC3GdL/tlIxvkaew5BTvoumRcbOKsZX9XwQtHgTs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922731; c=relaxed/simple;
	bh=yXc/8XLOOLR6Z9plLFl2z0OyNMPhY1UIiDGVUTzvafo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qrz7vYaMMKSYO+Rk4vPLhmzPz1ue/Tr2rMVsNg3YS9vlVzdi9Gr0Zdars2KPef1oE7ITjG6CsHL8XFiWlV0OMUG4ZcKtTOS2oeFEu4g4lK1hUORuP+gtJ9vR7u8Pvd0ZDQtdoiWUASNkgk4rAL6tGv4Ffz2TW1fKiIlGIq/1SKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZmZLyxD1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmZLyxD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705922728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=riQqxqcCMG9kFQapL/gNYoUtbP5fQJDMoi01u205GP8=;
	b=ZmZLyxD1l7+xm7jnYnOyo2sM+VsQKj0hxsNAsE8HQXxJQ1mGIsruwU2uWgejrgJw2pAe7V
	PH+45HXaQsjtyIa/z3kxSl2Si4dMmOinsOrJlZjaP+sqOPfAuCAjXgtmt0Kkv/w8uPnW3O
	IqeC8li9NNghZG6ZZNfxNH7993aTf4o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-eUz708yqPeSXSyBzoh5WFA-1; Mon, 22 Jan 2024 06:25:26 -0500
X-MC-Unique: eUz708yqPeSXSyBzoh5WFA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-55926d2bbe2so726143a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 03:25:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922725; x=1706527525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=riQqxqcCMG9kFQapL/gNYoUtbP5fQJDMoi01u205GP8=;
        b=lqEWwNMTmR2B1efWQmnBaOxXspzpoVHxwdl0dv5oZ/CA9p30VuZVMRLahyDuDYerXA
         +OdSEghHDfTRZIrMXp8CkdecRzeumEWEJTX0TtZjny76WImpJ3gZZfym5E/5Uh/FPeUr
         3sQiA3oCFhOuZkoG+pIwBSdKngGnGVevVx7vs8oXsD5PR3n5zwXLo2hRbUhS99ZC211E
         Vzv2l6hxaT3D+mdi3UGoK+w9sqVaHcSIqEDStuGhYKgrWMmwp5gnNcp+F+42XA3fi3oY
         WM43L9tEmQHZLP2cJ6ZRHCelkFJquQUHqFvNqF+3L6z+aIv7UiPjmv/iBnr3v145+i1P
         q1HA==
X-Gm-Message-State: AOJu0Yzxhf/ZIyhEb8eM1OsRu7s4FCzQCfqa9RMk6dGulLuuWdBzLkHr
	mqT/9TZx/+mSvHsTxS/0axj//SdMPq7yQuxJ1eNevm/+Sd77XgkLV+3fis6LvWzOr+b43BrTCeV
	d5DaqtpVcIwjgwO7S+vDj48zN79RH0uRs5dSW4+l4kMYXblMa9OznB22TUFBtYluO1S/eLq8=
X-Received: by 2002:a05:6402:3551:b0:55a:4c93:5f18 with SMTP id f17-20020a056402355100b0055a4c935f18mr2395883edd.56.1705922725780;
        Mon, 22 Jan 2024 03:25:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuS/XeZ7X3jIuEkZ1wdxxVlgQdUokojOxb2Vu/AjfTL2q7ps6W27aFaSz9H/GnvkfB1dYJ/g==
X-Received: by 2002:a05:6402:3551:b0:55a:4c93:5f18 with SMTP id f17-20020a056402355100b0055a4c935f18mr2395872edd.56.1705922725450;
        Mon, 22 Jan 2024 03:25:25 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fi6-20020a056402550600b0055c38f3ca66sm1057376edb.29.2024.01.22.03.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 03:25:25 -0800 (PST)
Message-ID: <866474df-04b4-4b60-87af-6add6b80db5a@redhat.com>
Date: Mon, 22 Jan 2024 12:25:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] platform/mellanox: mlxbf-pmc: Fix offset
 calculation for crspace events
Content-Language: en-US, nl
To: Shravan Kumar Ramani <shravankr@nvidia.com>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Vadim Pasternak <vadimp@nvidia.com>, David Thompson <davthompson@nvidia.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8834cfa496c97c7c2fcebcfca5a2aa007e20ae96.1705485095.git.shravankr@nvidia.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8834cfa496c97c7c2fcebcfca5a2aa007e20ae96.1705485095.git.shravankr@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/17/24 11:01, Shravan Kumar Ramani wrote:
> The event selector fields for 2 counters are contained in one
> 32-bit register and the current logic does not account for this.
> 
> Fixes: 423c3361855c ("platform/mellanox: mlxbf-pmc: Add support for BlueField-3")
> Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in the pdx86 review-hans branch once I've
pushed my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index 1dd84c7a79de..b1995ac268d7 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -1170,7 +1170,7 @@ static int mlxbf_pmc_program_crspace_counter(int blk_num, uint32_t cnt_num,
>  	int ret;
>  
>  	addr = pmc->block[blk_num].mmio_base +
> -		(rounddown(cnt_num, 2) * MLXBF_PMC_CRSPACE_PERFSEL_SZ);
> +		((cnt_num / 2) * MLXBF_PMC_CRSPACE_PERFSEL_SZ);
>  	ret = mlxbf_pmc_readl(addr, &word);
>  	if (ret)
>  		return ret;
> @@ -1413,7 +1413,7 @@ static int mlxbf_pmc_read_crspace_event(int blk_num, uint32_t cnt_num,
>  	int ret;
>  
>  	addr = pmc->block[blk_num].mmio_base +
> -		(rounddown(cnt_num, 2) * MLXBF_PMC_CRSPACE_PERFSEL_SZ);
> +		((cnt_num / 2) * MLXBF_PMC_CRSPACE_PERFSEL_SZ);
>  	ret = mlxbf_pmc_readl(addr, &word);
>  	if (ret)
>  		return ret;

