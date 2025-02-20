Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0C01FF60B
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2025 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740067254; cv=none; b=bYNIjt33ydfDYkBSDN1yu1Wo59qQdma5mol1brkNHv8a7wWZGODbyIYANZxsuv4SwJu6TkBSfjzvJRCwxBsYJVzU7SM9J34jjF+j5R2PK2MikNmkIa5x09XQ/MGjr8E4Pv30dzPNMP6quH+00gYYme0meW+MHYmKzXJYqjrNQn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740067254; c=relaxed/simple;
	bh=5XdsLSZyGrEMQjML+VnNbb8ludYR18BG4ObC3M5zCkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HjxQqhugfsjQgj1ietq0TyJy91Q4aZGMVytY6LWIHHdkiO7MQC+A0KRYMCPfp4rXqDWCDrebxfFQlTCrt0UG45jXB53Rynr3N/JobMl6fdsQDKHK1pLrC8QUkU9OUTRpM0t/9jnF53n8yXVic7QkTxGpttUiAuH5Hk9m33b9eC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PQDk2xjg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PQDk2xjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740067251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8LQPacTD/w30sjA4ALnvBz9RZeNrFXZknDU/oG0PKd8=;
	b=PQDk2xjgRHbwim8M9YTvZI8WOujF9VwbL0K/Sl7/y9XOgCPNLxMaRKjl6i0jxIHXu8fQH9
	wnWtVLXO2pK1N3M8+reeUzm3zk3UdiqpcsUyaPT+XQO/+3PcwGorKNmAMxPZziapVGxRbW
	Eqm3zC5rzluuI5eocWg7WYTbsK5VdxA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-ITjRBdJBN_yHR8MGFZnBdA-1; Thu, 20 Feb 2025 11:00:50 -0500
X-MC-Unique: ITjRBdJBN_yHR8MGFZnBdA-1
X-Mimecast-MFC-AGG-ID: ITjRBdJBN_yHR8MGFZnBdA_1740067248
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d9f21e17cfso939434a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2025 08:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740067247; x=1740672047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8LQPacTD/w30sjA4ALnvBz9RZeNrFXZknDU/oG0PKd8=;
        b=vUXO7+JwODCaFQ0ueXO5TZqCW5X80MqzqTmL+zfVAYtXd2c1dCB04M2ARH/DKy7/GJ
         mHn+p8Oe0dPnRFFQPVCf8BsKSSIhNtzGnR/zQdkYVMlTbK+rlLW1Sg/v0scOFH4+MfkH
         R0mCkOmnmHy3hbdvgbbRmoiqVb44Ziia4zq66pJ4cDtWMYtb1Gm9oHJyyGk2sGGR3cn7
         CqelGJBseSGgX9N99/FjqVenN7+bDvPB9tNJ0tIFRRSWv/fncOOeUcaU8niSzZ3gq0b4
         M4i3A18Yi6Z+tq1EqJfY7GMK2vDSzdI9TODEtJ4gy1/txI46kcjhH25naEqU0ffOu1f/
         5kIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5RGkFQbW1g4sCcUM8LtZG2sUyuqmEDjzt+RutD/KPKBFmy40wj+mqawfBh1+0hzfOwfobweuhiy6N9pQdEBVnoDnx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1vekXywKLY9B+3yA3WeIAmMBdiMoeP6AqEbTdFy/b5l31Jw1D
	HeYICCcEdKOwH2h6/bXCeSuJUDmQBmnycP8YRRTI1mKsZqQTxD5xgjYy2QjVW0Xn1/rilDkCewz
	Z/Tc+qN6ts1RG6zYJuIs+1GgaN8n5fm+XNor3hzj6SIROc+6YoqO7e2JsT01/SZnypams4alGKF
	NvMns=
X-Gm-Gg: ASbGncs+ZsoUief98IFgk0TSmPS7h3vqs/qEPWp5umpprYAHvlJpnCGgmqqWTWxaEL7
	HigTNEQK2QoNVwRqyOV26kY92SC3o5ykZDOxXqqKoK+aXWQXvfS8erKpMxqj3m6kpMC7ODYxaFn
	TpgQKrc5/xssHz9naLqSoi42LmXHvLGRVV0yWC535vuprdISf4Mlln5Lp9oRucR9d+nLopsfksf
	UFGV7+sLz/9hB+YxHKbVZB1J6gCl0r6dHBHk7EYv7GGj0LdJJBAF6hUHaM7j1/BSPZF4J5mwjCU
	H/d9bN6Ifnkvj44yWreqN11Odgm6heeqCd2UAMUuPPivdF/sSW7Qd6T1owRTnlmUvOZcT7tc1TB
	1PoL3oTwfgOCZyfBRQVdbavEgSFkIvcz16bdMLs22vF/K0Np6vTtT98M=
X-Received: by 2002:a05:6402:388e:b0:5da:a97:ad73 with SMTP id 4fb4d7f45d1cf-5e089516f4fmr8379776a12.13.1740067247053;
        Thu, 20 Feb 2025 08:00:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpT0q11Z1DTpQPdQfV/p3TRgWEOp87CTUo++H3Q8CObptKIbS2A7bmyBejVrY1+IO9Zio0sQ==
X-Received: by 2002:a05:6402:388e:b0:5da:a97:ad73 with SMTP id 4fb4d7f45d1cf-5e089516f4fmr8379706a12.13.1740067246514;
        Thu, 20 Feb 2025 08:00:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f70sm12233386a12.12.2025.02.20.08.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:00:45 -0800 (PST)
Message-ID: <9e8e6f1c-a3b5-4bcd-bf3e-399e78ed8258@redhat.com>
Date: Thu, 20 Feb 2025 17:00:45 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-hid: fix volume buttons on Microsoft
 Surface Go 4 tablet
To: Dmitry Panchenko | d-Systems <dmitry@d-systems.ee>,
 platform-driver-x86@vger.kernel.org
References: <20250220154016.3620917-1-dmitry@d-systems.ee>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250220154016.3620917-1-dmitry@d-systems.ee>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Feb-25 4:39 PM, Dmitry Panchenko | d-Systems wrote:
> From: Dmitry Panchenko <dmitry@d-systems.ee>
> 
> Volume buttons on Microsoft Surface Go 4 tablet didn't send any events.
> Add Surface Go 4 DMI match to button_array_table to fix this.
> 
> Signed-off-by: Dmitry Panchenko <dmitry@d-systems.ee>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/intel/hid.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 927a2993f616..88a1a9ff2f34 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -139,6 +139,13 @@ static const struct dmi_system_id button_array_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go 3"),
>  		},
>  	},
> +	{
> +		.ident = "Microsoft Surface Go 4",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go 4"),
> +		},
> +	},
>  	{ }
>  };
>  

