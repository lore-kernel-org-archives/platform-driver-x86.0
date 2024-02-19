Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B2B2C1AF
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708342657; cv=none; b=J4xJpOcl6Rguc9sX69QHgiHMOsswT8G54SNCgNlntHPRaSTno/gVk2h5VfMEkQK5bfjKolgI3ruBANE+m8erYLSUqyMA9i5jKgGLFITNtVxTirK8qHAVQKugC3bcQqE1s/LgrP3d7SNqhthR3OgXLqToz2Bwa260uy4QeUZBjK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708342657; c=relaxed/simple;
	bh=KDd4dV6l8VM8m7VRtoWVcj8QX8ngT5LqipZCRN2kECw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lXOSjcyQDx8TCiKhLeDcWPMK4xRzHAMlOuj78f2MihBs6pv6P/AstXYStyeHlNoUWx8iLbW7iqhiB/Bm25RB5EreCKS17QEM7syNtzhGFph+5GDM6wvcIyLZZHNMt4ksg5JTREOatJt9VP8mdv4sszKNWzYsIvlnLxlmjecq+R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IU+tor/8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IU+tor/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708342655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7p6TSNs1yb8C1/SU9sngS7fUYWXq8+gVUN6NMJXsDU=;
	b=IU+tor/8mN1gBA1A8Nh1wk/0aD1TU3DRn5bdmUaRPJyu0pSLBPLeb12ntRV6ttMtJiGWKc
	GkmH3e+oqxJ1i6/f1Xc7qhd97d58rsqXbPx2oHjZgxKVbGiqHgIId67bR1LpN5MExsCuH9
	kNcnfScKxHiKX6jPM9ld0XAXLKHCY7k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-Vq4GcsrTMuaqzV5rnM99dw-1; Mon, 19 Feb 2024 06:37:33 -0500
X-MC-Unique: Vq4GcsrTMuaqzV5rnM99dw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a26f2da3c7bso182050666b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 03:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708342652; x=1708947452;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7p6TSNs1yb8C1/SU9sngS7fUYWXq8+gVUN6NMJXsDU=;
        b=c81obFRiw5r6h5qXON7Etzf9gpqZLDC94GzlKd5UY7rW8UlwfSu0ZVnQvPDf6VMBp4
         /CcTFLlbkuL43tc53GfMyo6VtesjnmsA72SYOHlMri2nonF5iXuNfXQ2gB5wCo+y205Z
         lz1/t+p/yPCR8fVEJ8rGBBnDzVnEjVLg0ZVOWCb8mkWjAmiOFRS0ivhFPxzywJvaqdBC
         5re2/GARFSkhFApVNnJeFJqVGntMOpD0MjvBJ7J6gt11RopjrnQhfKki0vJozNOLWD8B
         vH++GIzeIyd1HZjypYP0+yWNclko2IBUWB8hEPlzwtEWRChJl8hGMvRbrrN+1v4s2iza
         6yVg==
X-Gm-Message-State: AOJu0Yy3oy3mFQsNio+prUlymjwMQrftnQcRt7IM/3UPQH3FyJTazSuZ
	iH9XFp3MccMcJCmnsERPgtfcqoO/CoLateM53jdcWdZoFd8refv8UTOgGd3edB+cRpC3VwB5uwN
	MSLhglrlEt4IjREtKa76l/pr5zwXOV4VENACzn8AAosDaDqk1/0lEjF1A+nHg1pV7JKt8ryzgd7
	IH7/8=
X-Received: by 2002:a17:906:2a97:b0:a38:916e:a4fe with SMTP id l23-20020a1709062a9700b00a38916ea4femr8268689eje.39.1708342652014;
        Mon, 19 Feb 2024 03:37:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVRHSOaEj1euGI9AdwteyydvGobA5yAOpCueLOI9XIQLBRVEKlYDjUP9o3AsHGrZMXHi+0VQ==
X-Received: by 2002:a17:906:2a97:b0:a38:916e:a4fe with SMTP id l23-20020a1709062a9700b00a38916ea4femr8268683eje.39.1708342651732;
        Mon, 19 Feb 2024 03:37:31 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ss1-20020a170907c00100b00a3e0c07c1a0sm2739493ejc.23.2024.02.19.03.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 03:37:31 -0800 (PST)
Message-ID: <231041e5-37ce-416a-bcb8-bb7b59b1fb6b@redhat.com>
Date: Mon, 19 Feb 2024 12:37:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel: int0002_vgpio: Pass IRQF_ONESHOT to
 request_irq()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240210110149.12803-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240210110149.12803-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/10/24 12:01, Hans de Goede wrote:
> Since commit 7a36b901a6eb ("ACPI: OSL: Use a threaded interrupt handler
> for SCI") the ACPI OSL code passes IRQF_ONESHOT when requesting the SCI.
> 
> Since the INT0002 GPIO is typically shared with the ACPI SCI the INT0002
> driver must pass the same flags.
> 
> This fixes the INT0002 driver failing to probe due to following error +
> as well as removing the backtrace that follows this error:
> 
> "genirq: Flags mismatch irq 9. 00000084 (INT0002) vs. 00002080 (acpi)"
> 
> Fixes: 7a36b901a6eb ("ACPI: OSL: Use a threaded interrupt handler for SCI")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be fixes) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/intel/int0002_vgpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
> index b6708bab7c53..527d8fbc7cc1 100644
> --- a/drivers/platform/x86/intel/int0002_vgpio.c
> +++ b/drivers/platform/x86/intel/int0002_vgpio.c
> @@ -196,7 +196,7 @@ static int int0002_probe(struct platform_device *pdev)
>  	 * IRQs into gpiolib.
>  	 */
>  	ret = devm_request_irq(dev, irq, int0002_irq,
> -			       IRQF_SHARED, "INT0002", chip);
> +			       IRQF_ONESHOT | IRQF_SHARED, "INT0002", chip);
>  	if (ret) {
>  		dev_err(dev, "Error requesting IRQ %d: %d\n", irq, ret);
>  		return ret;

