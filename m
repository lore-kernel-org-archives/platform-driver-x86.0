Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE00B18C031
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732527594; cv=none; b=h/HKms4nVhvfE53o/+SIz8w2hP47UmybnZTWCXkKY1TiBe2QtGXVc1MCSE+XZYvAUbEGFcPsMDe6Ci0rZWWqFplOzzxo9ymSc9qTR6EkQySJzJ7TVeIm49zqhbWD70+y4mtz0Cyji0w/z538GF/4m0LEqXjNbe16pasOADEyR4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732527594; c=relaxed/simple;
	bh=/XmRtZPekwBtjrpUKtPZ8Qzt7cmYd7hNsU72jLIQ7MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RL1WRGYR/O7bhumWp26GC2B54vD275xT07tOAl3unlbColerDXEccAqTNvfTLiqY6ZI1u1p8BDDFml4kaASa/qFvP6B9WRCjKLPZd5rdfCJcSCVRdcU6C9RaohnEN6zJFTqIwyDkWgKP+GnG2de3/NnGJRB866qsF29r3mxI/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F9Oonc4I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F9Oonc4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732527591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hkv+uXuHpbZj4SkgeiuTnLecSlEJeOMpyMLd4JnkUbc=;
	b=F9Oonc4IV+sRTz8CWdNn6VU5nnPEIxEowKnNAcLVP2PSwdUNBsrKIHEio3/vrj0QmqB0u0
	roPSayOrvH2dGnmAoXIcaJQdavvH00ZocQLLOE7cbQtMmTvZSToHxtHpeH0rRtnNYz9A18
	Ba7Y1/ScmDD/AwR4dJ6ua2Fos10xV4I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-f735kK1mP4akXVR3Ry2QGw-1; Mon, 25 Nov 2024 04:39:50 -0500
X-MC-Unique: f735kK1mP4akXVR3Ry2QGw-1
X-Mimecast-MFC-AGG-ID: f735kK1mP4akXVR3Ry2QGw
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa543b13532so85937966b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 01:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732527589; x=1733132389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hkv+uXuHpbZj4SkgeiuTnLecSlEJeOMpyMLd4JnkUbc=;
        b=CnOV3WVTmyVMaEXIQL1XBaRukxKyc9uR76D/hOhyj8PFn0fAi4k/zEmkmFxzPIsPPY
         yYJZehKTOCCLZPe+hO1sowDkDTGgNiKY5WEbmmxKQhWfECgggAK8c3h3b/bxBA1iBELc
         WtfbE3/FcG8YyWWKIHqS1xT/y6coKXwBYSrZRdzxiMiI371Kj2+Nj6oZ27J0yPPWM6wK
         nfgs8G8wbGGjoVcn4TXcK6fsexqBlScUeef8gWpbTopFVwKQP9BQcFwjB2tOCAyGwYl2
         mxv8pBbMzkgLVaKTidcjArxl4HGuCEvCJt/s7wjFzIOTgYxgcn81ggwIWSdqCklbs0Yy
         IkRg==
X-Forwarded-Encrypted: i=1; AJvYcCUHYKgRe2vvC93AJtfklOgX6HcBPo6zaGDXbSFPFAKX+J7rFc1M8ps6Lg8JJjwSAaJKOEqr7KiA40bjrqlI/w9ckd1i@vger.kernel.org
X-Gm-Message-State: AOJu0YyvtEYNze8wasnTP+zoQnRbkBZe65kB7d5MLDIDU6630ZEaiB2t
	5XT76dRNOJWJXDNo9QaoJ1kfdSkzZNsGIVs4r3ZHQ9uFSXz59iBnU/okCIUHpp6MYuggiQARuk2
	/1c5JsTAKo1no/Ckn54dw5xhWJO4MRreGqKWgIG0yG2lF51tRVsCQrZya/kLAl1bS3qVFRbs=
X-Gm-Gg: ASbGnctwg5/zQX4Va7JcB7cJXxHOMglRpn3BFTItPJO820CCEGDZ5cMnHkl7Vl4Q512
	th//lRacPJ8Iet55oIulxF8bbAwuEb2v3NuHkZLOS/KVosJrwO0XHaYtK0+155qo1pBK3KE+vVW
	B3B9JbQUvJBFUjOzAortdHtA6AHsNR8YXkxlLU8sNp8lbUHwu1seJvoQk0vvTBgkUvvkFtV+v06
	jQFdnzIfEIhjTXKMhz/+eDNJOlFeDT2tWHrV1P3pM7c+I8g1Q9/o37/648GgA0Ny4j180+hMn2T
	Mp1DbGrOjeXK26Z9CGGSW+J7FH/Swru3IgX8l5z3Rr8cvTLrZ2ALIyqc/FF5L9CulO/rlmAjw5U
	tvYRS/Ov6ah3l/FG91JeJNG6D
X-Received: by 2002:a17:906:3cb2:b0:aa5:e01:1471 with SMTP id a640c23a62f3a-aa50e012d9emr801069566b.37.1732527588963;
        Mon, 25 Nov 2024 01:39:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/f1jKAAuDrIC1Zrrvx4lRzK1vd7c9PbVgtQQZlOB3tA0pjSv7qEbmVKDZG1Joh+4VYnDp+A==
X-Received: by 2002:a17:906:3cb2:b0:aa5:e01:1471 with SMTP id a640c23a62f3a-aa50e012d9emr801067666b.37.1732527588602;
        Mon, 25 Nov 2024 01:39:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b52fe50sm447130066b.102.2024.11.25.01.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 01:39:48 -0800 (PST)
Message-ID: <d48bee72-7cd6-41cd-8d1d-282e8e68269d@redhat.com>
Date: Mon, 25 Nov 2024 10:39:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] platform/x86: asus-nb-wmi: Ignore unknown event 0xCF
To: Armin Wolf <W_Armin@gmx.de>, pespin@espeweb.net,
 corentin.chary@gmail.com, luke@ljones.dev
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241123224700.18530-1-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241123224700.18530-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Nov-24 11:47 PM, Armin Wolf wrote:
> On the Asus X541UAK an unknown event 0xCF is emited when the charger
> is plugged in. This is caused by the following AML code:
> 
>     If (ACPS ())
>     {
>         ACPF = One
>         Local0 = 0x58
>         If (ATKP)
>         {
>             ^^^^ATKD.IANE (0xCF)
>         }
>     }
>     Else
>     {
>         ACPF = Zero
>         Local0 = 0x57
>     }
> 
>     Notify (AC0, 0x80) // Status Change
>     If (ATKP)
>     {
>         ^^^^ATKD.IANE (Local0)
>     }
> 
>     Sleep (0x64)
>     PNOT ()
>     Sleep (0x0A)
>     NBAT (0x80)
> 
> Ignore the 0xCF event to silence the unknown event warning.
> 
> Reported-by: Pau Espin Pedrol <pespin@espeweb.net>
> Closes: https://lore.kernel.org/platform-driver-x86/54d4860b-ec9c-4992-acf6-db3f90388293@espeweb.net
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/platform/x86/asus-nb-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index ef04d396f61c..a5933980ade3 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -623,6 +623,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
>  	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },
>  	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
> +	{ KE_IGNORE, 0xCF, },	/* AC mode */
>  	{ KE_KEY, 0xFA, { KEY_PROG2 } },           /* Lid flip action */
>  	{ KE_KEY, 0xBD, { KEY_PROG2 } },           /* Lid flip action on ROG xflow laptops */
>  	{ KE_END, 0},
> --
> 2.39.5
> 

