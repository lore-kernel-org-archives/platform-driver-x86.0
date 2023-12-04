Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y1xIyyZ4"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA2BB9
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 06:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701701496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpHZcDHjpU4mfBG41n94eQLmc8/ZuBEaOjwl4e/nn80=;
	b=Y1xIyyZ4P7h/pH8iuPUD+BHSnnxJsXo2UirIiEG3cJbITm634OChGpgalusg+RgCizna6L
	VsC1SQDYh3S+sJbGia/sYmwRfM/sz2xUZCyILL7bC5AOXvfcHZ537yKIWcmFisxcgkPLg2
	2IdAepYYncjZiEOcFSxbcSdHqhey7BA=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-Gx2KE8v4M_OI_JPefk-otA-1; Mon, 04 Dec 2023 09:51:33 -0500
X-MC-Unique: Gx2KE8v4M_OI_JPefk-otA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50bec8466b6so1331440e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Dec 2023 06:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701491; x=1702306291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpHZcDHjpU4mfBG41n94eQLmc8/ZuBEaOjwl4e/nn80=;
        b=c7zoUB9+O4XOcO+3TaYt0J2Om8NNITN61FHanitRGkleZEuwMkbmoCrZcJIELdVTmo
         FBh3VJAO0mn6yRlaZsMrf3MHKoo0a+Vog+5ghPomCApejh9YxoA0Cxo0VaLlllrjbpkA
         9maMuLfWKhmpvAXcHQq8pgQO/iw+3Z2wlszMhBdf0Lnln/+gnK44vSVlar/UENzwqvY8
         seIFCeWvitN5p+QtObtb8SrWTGHy6BOBF81hsTbjhJBNPuufTAbUt4E8y0/JRuOjv7US
         PcKEeYjQcLjPzubTd5jIhaFOIQ/UMSLG57iohNQRIikbDPc5KGgqi3ns46iMhAJPOnhp
         GIFQ==
X-Gm-Message-State: AOJu0Yylcm4xsU1IbmuEqXWhYciO5IeGh1pH6YckpAHa/iV1lo8qHYfq
	LT0YiM3kEvX0xLnkrr4izYLxZGdpAnDwfMJKKoaaLo7Y7BEwz/JVu362rLXjZG2wAKsxtNb7NkX
	uttM82Q/4qApykV8Rvymrp1qnoT2asSU4ew==
X-Received: by 2002:a05:6512:39ca:b0:50c:e:171e with SMTP id k10-20020a05651239ca00b0050c000e171emr100258lfu.5.1701701491833;
        Mon, 04 Dec 2023 06:51:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGs1GCa0CgDvN1RhA5ymImqbjGWQhbplO/YgAFsWjKv5h53RCw3xx96+O9cDczJFQ7M1yeRQw==
X-Received: by 2002:a05:6512:39ca:b0:50c:e:171e with SMTP id k10-20020a05651239ca00b0050c000e171emr100247lfu.5.1701701491510;
        Mon, 04 Dec 2023 06:51:31 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cy18-20020a0564021c9200b0054cc61f0412sm1509632edb.24.2023.12.04.06.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 06:51:30 -0800 (PST)
Message-ID: <898ebe87-6376-4385-b42a-25ecc08772f6@redhat.com>
Date: Mon, 4 Dec 2023 15:51:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Fix an IS_ERR() vs
 NULL check in probe
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <4b1b2395-c7c5-44a4-b0b0-6d091c7f46a2@moroto.mountain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4b1b2395-c7c5-44a4-b0b0-6d091c7f46a2@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, 	 	 	

On 12/4/23 13:29, Dan Carpenter wrote:
> The spi_new_device() function returns NULL on error, it doesn't return
> error pointers.
> 
> Fixes: 70505ea6de24 ("platform/x86: x86-android-tablets: Add support for SPI device instantiation")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/x86-android-tablets/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
> index 6a5975ac3286..f8221a15575b 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -220,8 +220,8 @@ static __init int x86_instantiate_spi_dev(const struct x86_dev_info *dev_info, i
>  
>  	spi_devs[idx] = spi_new_device(controller, &board_info);
>  	put_device(&controller->dev);
> -	if (IS_ERR(spi_devs[idx]))
> -		return dev_err_probe(&controller->dev, PTR_ERR(spi_devs[idx]),
> +	if (!spi_devs[idx])
> +		return dev_err_probe(&controller->dev, -ENOMEM,
>  				     "creating SPI-device %d\n", idx);
>  
>  	return 0;

