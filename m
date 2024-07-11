Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67B11E531
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720710372; cv=none; b=EzPVvBigoNHU6HzEI9mO/wNvWi62q4tL/LtHX8EJdHBVufnTVUW9JaU4om62vp2sLZw2DEQqgPosYnlwny7l0fRSIKrwaM0q8jc9+eTr6EO2T0fsQRR5gjGAc/C9kt000BybdZk5BhYCLO7HvYt5EomMhewIS5ukfSxuX4qlYgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720710372; c=relaxed/simple;
	bh=xuSHiaH4k17V7ocXClO5+/mDrYAkB9E1+5U7c7Vffrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdYgOH7V+vNGIKK/vUuVfDyf5S0zR7K5nagd5EymzxOPoIexYR+0M6EwP91tL4eU5oIyzlohmq02wiClVXylNjH9G53G6aPIgve+tvMT+Qw78jkgxLdgajU823vhygSzTNhgE3ojoCNlGh55SHW3M1J499TY0ElSbWYJZy8gM9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e9Rxx77r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e9Rxx77r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720710369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dMWX75v/Q0xYYwgu78z3z70LpPrh+hTEiyyb8o7LpEM=;
	b=e9Rxx77rUyLXj/I7qFvx2zAtL/AXqVA1P/5yJ18+LbmYDDf0qLfkTHcYmRRnH0w8/MyEIP
	rL0kY1TxaB83uxAbJjog8wSrPfLhD2WCBFiU82awicm7AZMCXzOPxo6MrAG3DSqgWF5u3b
	Ez9tf7YQv2AuDQJERd2NlvlchYIYc7s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-sWGRiSFKPr-9hbghugl4lA-1; Thu, 11 Jul 2024 11:06:08 -0400
X-MC-Unique: sWGRiSFKPr-9hbghugl4lA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a77c589d819so101551066b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 08:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720710367; x=1721315167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMWX75v/Q0xYYwgu78z3z70LpPrh+hTEiyyb8o7LpEM=;
        b=TbIgdrcS+PqXIce7YjvXtmOOsiQ2X6nYw8wFMrhOYW9EtL/XDIakUfkce7QZqFcWsU
         SrEKgrHwtCvQvtscKu4fn38TBHHKcChJCEpBsvY6YFiNfTgqgfHLqfqhWu1OQAVkDR6C
         PiSc38MQDVwtU2q82mihPUjBRE+OSD8Zni6akfEgfBRk8x+NsR5SIq1LxDOCRGp56DAi
         K52Dv1s7o+Nw65MqcKgVFaHpTI/BhSW0YVkmKb/KGP615zBZjRI5KBtYk07PP2wPvD+6
         uAyFciIzYfrr82TyeBSwMvsvrte06ZDoHo8CYEgeGMnftrD9wtRqfMVaH7/ZH0WiHG5R
         x8eg==
X-Gm-Message-State: AOJu0Yx/4CbP3qr8fjxuaBSOQ5MnQegyFRQSvbft4ivszJ5r53MbGtOj
	GEF7ewaQcrSFx/Df244rtmt7DjKPIRLgE9+VMoQrCqJvyCitdacD5YyYaZ0B7rirPiQI8CFz2Om
	GJmwqhDgWLlNKMRGxc0x8ZW/fEn368jZ/TG9DBZo4/QlzPWCRcECAj54jz40VRiYQyQ1i6eyoEo
	INlLWtTg==
X-Received: by 2002:a17:906:dfc3:b0:a75:360a:6cb0 with SMTP id a640c23a62f3a-a780b6b3644mr548407466b.29.1720710366944;
        Thu, 11 Jul 2024 08:06:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+K2BmfO1W0KIUpowuHPM/JP9GFkXo7DqGMyX4VEtKhWUnKogLVgLwi48nSPliOcnf8KOy1g==
X-Received: by 2002:a17:906:dfc3:b0:a75:360a:6cb0 with SMTP id a640c23a62f3a-a780b6b3644mr548406066b.29.1720710366527;
        Thu, 11 Jul 2024 08:06:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a72fce7sm262806266b.92.2024.07.11.08.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 08:06:05 -0700 (PDT)
Message-ID: <76655490-84c5-42df-b473-9a9a80054500@redhat.com>
Date: Thu, 11 Jul 2024 17:06:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: EC_ACER_ASPIRE1 should depend on
 ARCH_QCOM
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Nikita Travkin <nikita@trvn.ru>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <80e17dffa8f4c1d3fdedd4d82df3a722aa4044ff.1720707932.git.geert+renesas@glider.be>
 <f5f38709c01d369ed9e375ceb2a9a12986457a1a.1720707932.git.geert+renesas@glider.be>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f5f38709c01d369ed9e375ceb2a9a12986457a1a.1720707932.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Geert,

On 7/11/24 4:30 PM, Geert Uytterhoeven wrote:
> The Acer Aspire 1 Embedded Controller is only present on the Qualcomm
> Snapdragon-based Acer Aspire 1 laptop.  Hence add a dependency on
> ARCH_QCOM, to prevent asking the user about this driver when configuring
> a kernel without Qualcomm SoC support.
> 
> Fixes: 2b3efb7c515111ea ("platform: arm64: Add Acer Aspire 1 embedded controller driver")

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Not sure if this warrants a fixes tag though, anyways I'll leave that up
to Ilpo when he applies this.

Regards,

Hans


> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/platform/arm64/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index 8c103b3150d1d0a6..058a4baa216a83b8 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -18,6 +18,7 @@ if ARM64_PLATFORM_DEVICES
>  
>  config EC_ACER_ASPIRE1
>  	tristate "Acer Aspire 1 Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on I2C
>  	depends on DRM
>  	depends on POWER_SUPPLY

